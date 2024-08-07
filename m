Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7A6C52D7B
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 00:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7TevFGdTDFJ1MbftTCXAmnfntNhBDr8S4L5Pvz2FPyA=; b=wP3kRWOMAKveyU
	/gw2QbsMnpHWj4ROFojMOMTH+QSY4VW2gfeAdeZImUwQ1hd7/i4N3SUUqELIl1Y1Mv8lhzSq3cqAT
	7K+QqKmazSvIpx8uaJyRvZ1RqcfTfi+5W0cX1fN6LLnApjXvXdJgYnSRQI8sgWRO8r5CqBSMfWcDA
	vw05Svpuk+y0+6dxvBSna3kueskt6XqjooE0bw7YOpbYm248HvrBbH72qOIIZ4UzcQZHhDjiqCD53
	lBigA7H+4POCBOwJk83EiG8udCavA/qKqvXi1qQ0I3Ci6FLii1R8EGp52YxmY612d5vFCxoOLio5H
	cT8Zqg2TBR6Zw/IIzPAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbUav-00000003Qu4-1pTN;
	Wed, 07 Aug 2024 00:32:01 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbUar-00000003QrJ-44aG
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 00:31:59 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3dab336717fso768172b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 17:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722990717; x=1723595517; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QC5zCLZI62pAjh3MZXl2DmzWweDYeenNtUhW+BVEweY=;
        b=jPMXZJJnxDSUeGd3O42WRwNgJJHsJdrXqRAnodDgBix4JyYhvnQX6lUg12kP4qSsgU
         jyv4aLy7+OJklvCjpZHdjbCQkIMcs1dMqDBIJMuec510tDNVCPsjpE7fZXkZLaszgdhp
         CaCT9LmKCfOXZuu3TEIwyMY+Og4GI5PlHGCJo1JDc2fe73IWlur/PtdKqUkQhSM/bJVW
         FS92tYYUswJBIuNx0oQAC+gjQfDW+tuiuxorlHPtLVjXCikqSot+MUib93/Rux1DEbbs
         2hrEizLkbU87payCoK7VQjezrOy+Vsr0VI1P9zcxkipWDYV2EFzHmU+QIaeHAhLIkMxp
         c1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722990717; x=1723595517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QC5zCLZI62pAjh3MZXl2DmzWweDYeenNtUhW+BVEweY=;
        b=qlo0X946RozDo91SxjYd8rvn3/TKcUEPn+2Y6DZ4t5R6xeacXuGdl6RgATPoh3DA7t
         BPdJ8ZMTSGG/O2G+yxqoWGMdiAYjjhUPz5jJ5XRiRQZjOIK3jXvtSYgka0u3r1uj/0P2
         VFshgDeAPi7lzjJzrrXzJlC3hZtoxrGzi9UMi83K7NVhwX9X4T+Fb7wCZ/735nD/T4uT
         rfVJkPSJuxeH2bPtD7B+4mrGIt8ibDL4Gz3H0C81uRNQATOnxJJKInZEDalGWCJP4bnm
         8Tno20ERPPr5kCOlsnRDquf/xFDtiEBCLxWUdyuOLhINQ7MhoIKEgedLJVWmVeY+Cs1k
         EUdQ==
X-Gm-Message-State: AOJu0YyGkN1IRjk+NLAswkk00yUoPjMIqgUCdyyiaj76aMx9MSDNt4tL
	yFtMpq5KxCq+JoN8JswUDga7PF65pL90CZgjvt3BPb1OrOX9bkSY8NXNLLOe53Q=
X-Google-Smtp-Source: AGHT+IEomO2rWS8N04dkJc59Kgkws+mWDwLUt7ddjCqe47b0HovPqN/7PDFgjz5yTN0u2e47G0ibbQ==
X-Received: by 2002:a05:6808:d48:b0:3da:e246:36f9 with SMTP id 5614622812f47-3db558310d3mr21688532b6e.31.1722990716821;
        Tue, 06 Aug 2024 17:31:56 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b762e9f5aasm7476174a12.6.2024.08.06.17.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 17:31:56 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 06 Aug 2024 17:31:42 -0700
Subject: [PATCH v9 06/13] RISC-V: define the elements of the VCSR vector
 CSR
MIME-Version: 1.0
Message-Id: <20240806-xtheadvector-v9-6-62a56d2da5d0@rivosinc.com>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
In-Reply-To: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722990701; l=930;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=DIdTxrF0tPCTSVf2TD2d8xS0VDMxpxf73XTxU8DNXFU=;
 b=tCigg/1A4l8IsEtr1/y9NTwTRU5XH+2Tl9Svmx0pkqdzZuPXykgTqvIzRfkbgnNWcTMSLRxxz
 q60DgQzkkPUAT9JnB8p+nZJ8SdgxaBb3cQ8syWdxfgoAzaldKwS912B
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_173158_055056_B1263E67 
X-CRM114-Status: UNSURE (   8.66  )
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

From: Heiko Stuebner <heiko@sntech.de>

The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].

Define constants for those to access the elements in a readable way.

Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..3eeb07d73065 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,6 +300,10 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
