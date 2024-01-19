Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5968CC4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBWlWUT4ZLtBpv4XlCVfAO40y9YsyO9YKEloRGOSPQ4=; b=LGyyyYRtkfL/6W
	gieKEJ4JAbkKXJzY9vFxc14CcCsxXH1i868k27vhwhkm0n20OnRK+TaaV63YLsWoTp8hLk8MeUWVO
	RY4Yt0LgT8sxUW1tjrGt4o9/jk0Yi4nHLCscBMPvr/THvTDxw2j3XZjaF5pAgb3WgDqsot9pANjwc
	LTM82d5N/RdoqsQgeIo1mvQsLGkRLc8KBPs/rz+BxcdsUujmk4mvhmKuNt5nMhLc0jzwJRQNOICic
	2vr8UE2wYJKNhRRypceTA0SkaE6ARr4M8Ttby580t8+woZXHYmq7vUDADPLIexFZcDHxGOnVkqalp
	7atLAJhseYZJAGT2Hgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQn9s-005EvA-2S;
	Fri, 19 Jan 2024 11:35:36 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQn9o-005Eqf-2V
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 11:35:35 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3608bd50cbeso3161495ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 03:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705664129; x=1706268929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bsP20n9g/LbbgzyTFqfc2H9X3ZVkLkHm6HS5kmWZpw=;
        b=hPga+54VzT6wK2sje6ItPx3XVE3BujjyIoy8YTfdwFjgrTjXxLpljSQXdnuCUni626
         ZIAOPYi2+kzFK8WtsagGYDeomsO9m3/Fbft3pU9Tfm+TeB/oOgkUupLZywirLUTurgHu
         umuHxn9orj4mA0Nr54aW1ooCo56r2VVOUhfmHhLAgQgYNDdSv08VGhYpro5InwRLCSoa
         PS+X904KHFVGvZyGdejb1STGSxKs+LyQyrN8H+oRaZJG6j5BDR7BC7ClV8m1FWJFsSkr
         sMrc8IIcXWsLlE8enfldPV3KvrVjW8gpmSP7cgRS+HbzcSm/pqbV2T9PohMpFSnI0KSm
         AbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705664129; x=1706268929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bsP20n9g/LbbgzyTFqfc2H9X3ZVkLkHm6HS5kmWZpw=;
        b=jwrtQrctdrOM0lBGqngd7guf97Ivtt7tZrEXxjp+DyT2tT9X5hvsUot/Brv7oT5U3n
         KkzKDqzZQpeaY1flJ/t8R2hIcJMXG6bEvL0LCG/ArOPfd20WK5ndZSW9sIlNPdzuCMuC
         ge4OJteHfuEq9hF6/Wf5PuTFkJFBTkpdYGjbHMR6c9x1Wn3Y9eJ68lNuaGUYdLdYNFSL
         id/OyG9x6Gsag24SfGTw3Qf1qGhcLs1fA3D26S3r5vX509h/9qMM3cRw1cHyHDMO6Zlg
         BLzYpMGK8N8N5V4nLBwX7LWFM829uaf9oY+nQ114Rv3Q1jOaGKM3a5zOi4BNatUmqX7o
         XnGA==
X-Gm-Message-State: AOJu0YyT1D27BL7Oxwd3OtFGa5cWCoE0CwSzPDgJWCi1Pn8llxPVKzIl
	4qcGndZBnIzNwbdlYSS8+84Ibf8apoJkGB7fn2i8TF0VLw2fnRs8LGtsBsYL04U=
X-Google-Smtp-Source: AGHT+IGm7KnfG4/vcA0JrRBkZfX6RoyXH3aaqdl/Wta7fnqjAcw1zMCsGIqUf/hTovepwm0OqOzh9A==
X-Received: by 2002:a92:7310:0:b0:360:973b:844b with SMTP id o16-20020a927310000000b00360973b844bmr2368211ilc.11.1705664129602;
        Fri, 19 Jan 2024 03:35:29 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id a5-20020a92a305000000b0036062f40c51sm5347302ili.71.2024.01.19.03.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:35:29 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 5/5] RISC-V: Enable SBI based earlycon support
Date: Fri, 19 Jan 2024 17:04:49 +0530
Message-Id: <20240119113449.492152-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119113449.492152-1-apatel@ventanamicro.com>
References: <20240119113449.492152-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_033532_810468_2D5C2C81 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Let us enable SBI based earlycon support in defconfig for both RV32
and RV64 so that "earlycon=sbi" can be used again.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 905881282a7c..eaf34e871e30 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -149,6 +149,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
