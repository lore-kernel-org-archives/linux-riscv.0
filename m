Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E000ECD8CAD
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 17:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdCr8B7oHr25iajIgSqX/0oKpOg19tUluZV/6H0VBuo=; b=dNNRCOSseg5pCO
	DWulSQnSlKMpq3FYM3Z0qNnXp6zqlanx6Fe6p5hRaEzfJSyjI525N9DflXw7kUN+5C1JCcxFsoMS0
	HsuDeP6Lo8N7SzPcyMVZ1WtmAtwefhK2wFWfqYgLfkSRJm6hNsaVu5MrWpNK+v7jp1zvsMww6yL0m
	OSUsofBAx8/JAxlzuO0QkVg75A6ZK1Cn/hBi4qk539hhQ5W3Jm3KHnET+Ax3zMKWjqVy0FHGeVB/M
	WR8fr6uhGOcB9b71GMPtuuXdtIG1V7LIQJbShP4qevHmh/dwi/OUWsOYKbImAEFc4Q156VQpDPbiS
	/VmlUycLh0/QvUEhp+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqGB8-00DobD-0B;
	Tue, 10 Oct 2023 17:05:54 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqGB3-00DoWI-3C
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 17:05:52 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c737d61a00so46484165ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 10:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696957546; x=1697562346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF/0DZOVOE1sZojsrN9hmq2DR3MNn3xhzg86O8Xb4xI=;
        b=VVtTzkP86Hq0nO/Ys4OM9sLKhXet1e8M9plvUqqWZNyWJC30/ZntsyzE57HgkkCKq9
         Pr+yEpLVgDmLwdxA5znKH/O+ROKryZOZSQpqOv/udetxv5B732ia6HmDZTYnnS4zCUSw
         EnDW+OyDbWRWA8gRXW93krhb5APId78YA2w/lOjCGktZieSb1Uqom3yOREFgRfEwTWNH
         T0ye0OPWjIDIiwJYks8aEF6nXc9B98af1bVlNAf2ksJEJ7dVoDPczlrMXCLFNl7vKkvu
         BF8OqpTCGCvBTjbYgWOtDdszYpvCbXEo8wHtbeo6rXMO/itGWT8BVv28up9b30lKxXvJ
         hyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696957546; x=1697562346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OF/0DZOVOE1sZojsrN9hmq2DR3MNn3xhzg86O8Xb4xI=;
        b=X9AFBQAgV6uZjNUe0nv89dfssSa2LrNnF6NHs9YW/IMaoB3WGhC7L/U8+diOvdszTf
         dfBHaVgWSaZ7kQIBvLHQ4YE51nTGh/GiN5kzD2h5ty53p1bZnceT+NVnngwh+WBgp9mx
         uDi3++uxDJNQ89QtCc1mz06GC+x8Wr2AjI9jNFHF44ZDo8oPfyHeHmFq/TSio6bzfQld
         81EA/nLmdBqeCMZRSppC3YizmXMsIu3yrp5Wz3iPoQ1HRIU8AWLanTBOKt+afn/tpSmM
         az4WljUmagbNOsr5HhQI8idK/nsr4fxPvFlmFpV133q0EARKT1XM4Mvq/wcADGXTXrtK
         dysA==
X-Gm-Message-State: AOJu0YxTQjFs1AmTXBmGLN5U/EJlIxw5aDFLzmecc1iEmvRHWZvskOcX
	yQNXHZpWxwftVNc27kmvSa0MSA==
X-Google-Smtp-Source: AGHT+IEFOyqePTNhMFtIG9Pkb5PdZI4JBTY0AeRn/RM9+tKVmMklIxkKeQjOcYyUz8tcYu0GN0YOAQ==
X-Received: by 2002:a17:903:230a:b0:1c7:7e00:8075 with SMTP id d10-20020a170903230a00b001c77e008075mr23570340plh.66.1696957546442;
        Tue, 10 Oct 2023 10:05:46 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001b89536974bsm11979868pll.202.2023.10.10.10.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:05:45 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 6/6] RISC-V: Enable SBI based earlycon support
Date: Tue, 10 Oct 2023 22:35:03 +0530
Message-Id: <20231010170503.657189-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010170503.657189-1-apatel@ventanamicro.com>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_100550_029219_8CA69045 
X-CRM114-Status: UNSURE (   8.60  )
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

Let us enable SBI based earlycon support in defconfigs for both RV32
and RV64 so that "earlycon=sbi" can be used again.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ab86ec3b9eab..f82700da0056 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -132,6 +132,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 89b601e253a6..5721af39afd1 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -66,6 +66,7 @@ CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
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
