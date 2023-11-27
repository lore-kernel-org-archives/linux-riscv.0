Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9D2C10DAA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 22:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fnAj/xuBeGny96rDZsdb6GoXVYx8nlveo4PllN+VNEs=; b=ZA0RER0uYfwEPk
	o+dcVEt7lPBV4Y/LJkTHVW+IWAjIYt+3tIO2+nnI5WOrc/9T1MmSdzBKeX5uIJRaP9ekhFaf4fI1Z
	f6mGFYsmDsc/ZF3IIBu44AY6YH/4ZyEnR1DIjlx8YLDcc5PKVOx+FCiOy0p4i9ZIbLbCIySTwyomh
	/yzQbaJGIVncUgyU3AGi3dNCvqouhILfrOiijFc5dPScCopjo1CBO8qaqTubFdF7pEa9kTLqboxzY
	ppoo2alV+Mt8QKwmai4EykbXC+GbTJa/ygEHLzk2+Yge51fR3QXiG7HTReV7+UX3UI0LpKjYDt/io
	Y5qRaoN41audXuAWWVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7jjG-003YYA-33;
	Mon, 27 Nov 2023 22:05:22 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7jjD-003YWn-1Q
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 22:05:20 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1f9e0e44fecso2356176fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 14:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701122717; x=1701727517; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfeJYmvvAj2atuMBwfCs8cMnsgt/tYWyP8ZyRNbK1QQ=;
        b=gl9Qe6acou1lZnM/A1Q8Rg/pH0e4QgNWCqmY4cbKG3Cfw5R16HI9eOynlGCW3+NHoX
         ndd0BzoJCgQDOvN7fEWlffgfpyC/j6vCOz4h+SkjacAW7BEIgubtNLslTH2cs3rjtQy4
         AhmQx1myWfPNSDblSenIQCWLacqjR8RPxfrGRPUKxWjSpuKchG/w2Sp6V0wAgeqgVka2
         RQbYJn6i96i+PYhk1U27Hgu+PDvFLBL5tu3rIfkMBYl1j3DzvnhGW5HdTDSBc+JPBJIc
         F0IQuwi7hhXSPMVOy4j1jJruTusbg6C/54Opyq6s/3HV24wd6thIwYSOFAZ7HZiwZ5lK
         ItmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701122717; x=1701727517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfeJYmvvAj2atuMBwfCs8cMnsgt/tYWyP8ZyRNbK1QQ=;
        b=ExSIHibQbGsDPwLXMUeGQUHVFsl+AFIGGMGONUQqfDzFh59H2J0i3CxJZDfpEZ1SnV
         M05zuf2+bVY1BMCRucJHWok1pqSc/gS6luQn1SEs6Om7hDDI6XOY+fNd2uJMY1TlkhUS
         GdeMewzyRQyq34VvCH4g8YRt3trRyqS5CFMyVqOpPxNbdJXFOPt6zsqX1agHPMmGjzxZ
         RZ+iMkJtSPuq5BWVMKfQyWnwFz3WljRVIvMxx923nhTE9CjUpvVGxBfMyIFkldrSHOsy
         udCpBeFDbqfm+ND0iejarV3nsCVDKTnxsnKL+tVVOPAKzKR/T1QRr0p5Ew2/BkrKmKeL
         dQIg==
X-Gm-Message-State: AOJu0YzusetbBmwgOZ6L4hUQj6e70q+7OqcWbCkIGUR7aN/dEKjGV/So
	MBax2d8sBUjlWDzgoNbPduCEz3Jdez2L8T7ugDs=
X-Google-Smtp-Source: AGHT+IGlTcZvaCuq9bLaYFKrLM9gzn7wml0OyTvdUNctquyivQSM+6s2M7QMasRuVCMWpyINa3zUCg==
X-Received: by 2002:a05:6870:1d1:b0:1fa:3b81:5b1f with SMTP id n17-20020a05687001d100b001fa3b815b1fmr8762544oad.30.1701122717675;
        Mon, 27 Nov 2023 14:05:17 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id x23-20020a056830115700b006d679b53e8asm1458890otq.24.2023.11.27.14.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 14:05:17 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 27 Nov 2023 14:05:00 -0800
Subject: [PATCH v4 2/2] riscv: Correct type casting in module loading
MIME-Version: 1.0
Message-Id: <20231127-module_linking_freeing-v4-2-a2ca1d7027d0@rivosinc.com>
References: <20231127-module_linking_freeing-v4-0-a2ca1d7027d0@rivosinc.com>
In-Reply-To: <20231127-module_linking_freeing-v4-0-a2ca1d7027d0@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Ron Economos <re@w6rz.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701122714; l=1122;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=gKtfd5M4f/12qT968kmTbpH+FPE5A73SSgTlwm9+2vg=;
 b=n0mTJP+LYH0N4DSIuQTOKLB4SExsBvS4/o0PIOTxDPx23GVbSNKIkufpsBdKBOvb6R7paXCcV
 fHMdu6GDl3eAEQWplkrU6P3PL2M0orVhoFEVV10vqJHYN2WN6KTtQAy
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_140519_480019_8FF97540 
X-CRM114-Status: UNSURE (   9.25  )
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

Use __le16 with le16_to_cpu.

Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/kernel/module.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 53593fe58cd8..aac019ed63b1 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -55,7 +55,7 @@ static bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
 
 static int riscv_insn_rmw(void *location, u32 keep, u32 set)
 {
-	u16 *parcel = location;
+	__le16 *parcel = location;
 	u32 insn = (u32)le16_to_cpu(parcel[0]) | (u32)le16_to_cpu(parcel[1]) << 16;
 
 	insn &= keep;
@@ -68,7 +68,7 @@ static int riscv_insn_rmw(void *location, u32 keep, u32 set)
 
 static int riscv_insn_rvc_rmw(void *location, u16 keep, u16 set)
 {
-	u16 *parcel = location;
+	__le16 *parcel = location;
 	u16 insn = le16_to_cpu(*parcel);
 
 	insn &= keep;

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
