Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A003C44501
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aivYH6KmiszWh/G2Xs1cA7hE976kjEs7OWo/rVHy34o=; b=bOn8IKZH/K/q1i
	Hf3Iyee/lWkli/bno4oUawvrNB9jyW/WKPFfGtQc4sw9VzJxQh5mty+USkpgG4zWnqqRqmcy3GWfK
	m+QClUtj1qIEIUtRycSSpfNOkBA9+L3B9dgryczjwEmjxwp+b+6ll5Bn4SZcQn7pCGur57iGzane6
	Hofob3Yu02cOg/XmkiVilTjljWczZLG27UAtU/KEZMOvYX82If5Op+0enZBK6USopaIxAz1Q5eD6r
	oy6Ygoc/gVW3S3mLDnVylz8/FpSRmENJCI6oeWb/zBkFNsdHAU3cL8ChNBMa8SlLtOmJHGEQ5UuW6
	NLftbb2wMA0X6bcF9z0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5j-0000000GG4y-1EjE;
	Wed, 08 Jul 2026 03:36:55 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5J-0000000GFe9-2t82
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:40 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so250480a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481789; x=1784086589; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Vl1jMHF6Mz50lVaHNGk62U0kiVIW8sN4jisG45xdAs=;
        b=VnZBCsWrrbsO2JL90ZXNE44h2fKmJHKaBSzb5tbxfVsphvPDLayhkfsgCBljF0xmQq
         X16LDeywBrZmVyPZxjRe6qnnnZBpRiJyuRq7xYSA7M7GtqvpugO60AYCorHgRneB+Gwc
         RD/NuJ2uYlcaklYf0SpcKm4nLImE0LhJajq7qv0FyOc0wdvY9xASwlvFbSat8FFY4K8P
         UFDCJ/TkZu6f8eDQTUyCX0jffD+jJyrVS9c1WqhkbIk3lB1+wGYL0h5otrOYquTITNml
         JnfJZhJiJ4+Jr7q45neAMTf0XdPGKoUlvKCFZCcdCPAlqquEfhjhYEjSJLFHUPV6REml
         AGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481789; x=1784086589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Vl1jMHF6Mz50lVaHNGk62U0kiVIW8sN4jisG45xdAs=;
        b=H5NJ36qpIdkz0tNxCzQD5z+jk7+tIk1UoTT+xqIQsAYub2NnMWW3TZJddfgXBSb4IJ
         kZqMWaprXWBBb+3meZG0YJitXjaAquE6NagLGijgPRJu7d0M3wbFrD8sd3pCOOqphqvG
         nAv+0b7uQZI8vkZygBIFUKzFrMC/KfDq7WrtMyqPVMZmn/AfhqCy3d05EMuz2bVpelli
         jYYAaLtttjmjcaRrFi+hLQyiV4w3fAYsbotMTEZjUcphl3DyVesAvbl5v1jzFy8u1tVB
         y1sQF9BN63JvGKOTQcy5O2ilU5V8hKupb2iZeen4mzq3E+ctoToLUeVRKVXptvyE7UlC
         e6vA==
X-Gm-Message-State: AOJu0YwobNVo8ZTfH4koID2CtlInTTs3UT3xO1TCNmNGMrhAz3J7tLt8
	VIgtX+Rr6DZ4N57+cp5S3S/Z/qrKu0DvsqCxgASBY+/3PHwYL9I6JuGW
X-Gm-Gg: AfdE7clWnj7HjwJsMGXZvBcQXRGWPryP/moUTLsDtVQvzNU3Li0deCN6OQtuBiGWR6t
	rJKDy4Z80FmJpZEvqVKzsNieiU3jSV6QzDrBB7302f+tBGvvGVUh2wICLL6R2EO6fdd67YAg8CB
	e8N2Tr7EnXjE6WwOItQ/iqGOsnV9xMSDlx5u1aQZJSJHAinwmHDApVI1if6U5pUEHu/H3+1fxun
	woj9FW4B5030M73iea2xEqo2LKr1eP4I2tgt1070XvS4Ox/OtIhxJ5Lskr858LN13gmZZlRbXH/
	/S85Bo66aigRCcm2tVB65ZngWCzweMYb0/DOUl0UHTwilFZMWjhJc5EJgp/AtNS81MArO8/rvas
	QHtn1ErOCWewBq390Q22SwXPFtaw4TPyXkD1lbBA6IhA4qhp23gfRu67kYqEeHkklUv5mxULEcJ
	V0zTe1kYMiTgK1toBPSvsvoE9zWu5MWCq6MsF/lgIdsm0/eyZpcw==
X-Received: by 2002:a17:90b:4b81:b0:387:e0db:3d8c with SMTP id 98e67ed59e1d1-38943954dc4mr623537a91.39.1783481789129;
        Tue, 07 Jul 2026 20:36:29 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:28 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:29 -0700
Subject: [PATCH v3 06/17] riscv: cfi: Use generated instruction headers
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-6-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
In-Reply-To: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=1198;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=1tICEVIvaC4ZLr/Ax7sSaci3FTAyWazsJABtM7N8+oQ=;
 b=Po1xRMgYDA5PIVVjKPxjGPmEu+M69/hx3ymY++n6Om1HumSakJPKNAgz3tx1U5lGTyl+yk573
 kGum7EZxUnEABIJkspZZYr9uErQy5kunYsr5p3GGMpMq3eU7v6ZVH+f
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203630_776523_B85081A3 
X-CRM114-Status: GOOD (  10.43  )
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

Migrate the code that is decoding cfi instructions to use the generated
instruction headers.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---

This function generates the same assembly as before.
---
 arch/riscv/kernel/cfi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cfi.c b/arch/riscv/kernel/cfi.c
index 6ec9dbd7292e..e38d5f863747 100644
--- a/arch/riscv/kernel/cfi.c
+++ b/arch/riscv/kernel/cfi.c
@@ -40,16 +40,16 @@ static bool decode_cfi_insn(struct pt_regs *regs, unsigned long *target,
 	if (!riscv_insn_is_beq(insn))
 		return false;
 
-	*type = (u32)regs_ptr[RV_EXTRACT_RS1_REG(insn)];
+	*type = (u32)regs_ptr[riscv_insn_beq_extract_xs1(insn)];
 
 	if (get_kernel_nofault(insn, (void *)regs->epc) ||
 	    get_kernel_nofault(insn, (void *)regs->epc + GET_INSN_LENGTH(insn)))
 		return false;
 
 	if (riscv_insn_is_jalr(insn))
-		rs1_num = RV_EXTRACT_RS1_REG(insn);
+		rs1_num = riscv_insn_jalr_extract_xs1(insn);
 	else if (riscv_insn_is_c_jalr(insn))
-		rs1_num = RVC_EXTRACT_C2_RS1_REG(insn);
+		rs1_num = riscv_insn_c_jalr_extract_xs1(insn);
 	else
 		return false;
 

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
