Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A338DC04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 13:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ku/dM+UMG3P45HdY6D/eFaPjNBj9S569EV/OEt/Kgk4=; b=WciMFFcl5zRLs+
	HcyOj4FVHK5sNFGylk1Yskqw0N+vm8pTKMH+s03lm8kISlWpTfAoC8btH2V1+kcTh9CrfgUFwKznX
	04tdoeGJEhgsaJNSej1QC8ZcpjvM0V7aK1Y6q5JEzNRPPXMrarGASE4mLJaGjCyFaX8Hl6csH0d9r
	/Aw6Ug2CMss7BYA+1Gkord0VndmqObd7fo1gMNZ4EK2QQ8gKUGr4oEgL/LGWHFERWl3bBc2R6dXBp
	71LguNRzLZxw5PbIAZu3VV28O1HNuPD5fiemA6eiurZIb/PpZKnnn094/sZ7Kx/lzxPBGJMycALGK
	pBzF+Es6RX16DBBIJfoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxogN-00000005pKS-3IZl;
	Fri, 19 Apr 2024 13:53:39 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxogE-00000005pDB-2sJZ
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 13:53:33 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so2384203a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 06:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713534809; x=1714139609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H50p08qn7uGf4Z9JFkdHi+jkfC6EZzcHo7CUifdDw3E=;
        b=jkTMq+lUez29P5iI8KDnDCnDdGRGoHPH1QyHweI1X/S9ICrkp/JxRPABkT3J4D5HxJ
         t78uy29HtxmzVvoHGbs2XrhjIyRJYSdeu55/CTsitbKpH4ICPYg69UqRpuAxQNZOhxpv
         cu3blu0srXcryG1twVepuPpPh76O6RutSUn/1xrv1k4/ZcYg+8ZKyqzn666VsPuiSP8n
         p45URqd22mYUVEKfQAyeR8EMHaSBNrZXFwjGFVFDgwk9NrB7aWl4z17yS1UkuC/D1PCJ
         DIia4vsAz52moEQx84WHqXmHnKotFiLbT04E9EhgH0q+oell2mAaoGl+Lf/wvpGim+DI
         dyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713534809; x=1714139609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H50p08qn7uGf4Z9JFkdHi+jkfC6EZzcHo7CUifdDw3E=;
        b=qALFo/Bg1Yek7Wi0QuO5KNW1p33IdA5PduaxgImZ0XHO/5WZ4afK+sJI9eou3BJ/G8
         2Tzu4NrCDGBfKbNiB3nFke4S0jTLXgXSk4vQgxfBZ6lI49JavO+7RtbXZ9jre5h8cdNB
         s7x5n8oRerzHchoNgtyAsdqHBLxZdQIgMdipgjrjkQ4bJYgSjuBjyu2Rr/ZdThr1muIO
         ehSpv/yWaFtGRW456bkNLcG2mTP6XD0tXzqd5/YuJQ/zNKZHiQbjN88FODJn6+gSbXSQ
         7ej0em8Zx6zqChDaEWIcAWqvO3K/ISbV5LtgjA9AcQkx2vXpskifKQ9MIxt3DtkNha6r
         QIrg==
X-Gm-Message-State: AOJu0YyH6N5q3K422ZpnWxRJvPW8hGd6xgkUyBcpUEHXqHMrIzla/1Ns
	7dWAR8qtzkEA6egC8DcbC8+YARk/JrIGMvR/5j6km8sXhJibMNi2N5QksDf0DR4ddB+0rp8j8C2
	+4yw=
X-Google-Smtp-Source: AGHT+IGwM9ZfHrsnh6F6OY6TFGNn1gRJmjysMnGuYPZucZ7dMPAwOGkgddkO6TWYVH8+aMZLSHBk/A==
X-Received: by 2002:a17:906:3645:b0:a55:75f7:435c with SMTP id r5-20020a170906364500b00a5575f7435cmr2058940ejb.16.1713534809405;
        Fri, 19 Apr 2024 06:53:29 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id q21-20020a170906771500b00a51d408d446sm2245772ejm.26.2024.04.19.06.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 06:53:28 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@ACULAB.COM,
	parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: [PATCH v2 4/6] riscv: hwprobe: export Zawrs ISA extension
Date: Fri, 19 Apr 2024 15:53:26 +0200
Message-ID: <20240419135321.70781-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419135321.70781-8-ajones@ventanamicro.com>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_065330_802880_1E2297C8 
X-CRM114-Status: UNSURE (   9.48  )
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

Export Zawrs ISA extension through hwprobe.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..e072ce8285d8 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -188,6 +188,10 @@ The following keys are defined:
        manual starting from commit 95cf1f9 ("Add changes requested by Ved
        during signoff")
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZAWRS`: The Zawrs extension is supported as
+       ratified in commit 98918c844281 ("Merge pull request #1217 from
+       riscv/zawrs") of riscv-isa-manual.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9f2a8e3ff204..a5fca3878a32 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -59,6 +59,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
 #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
 #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
+#define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 36)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 8cae41a502dd..b86e3531a45a 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -111,6 +111,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZTSO);
 		EXT_KEY(ZACAS);
 		EXT_KEY(ZICOND);
+		EXT_KEY(ZAWRS);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
