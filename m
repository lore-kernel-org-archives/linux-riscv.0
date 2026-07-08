Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90144C44501
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZL6gatpk1gVSJtcbUjRIa3XCm69XIbkltxe7fN6hTY=; b=G3KF3vXJMpZMM/
	vrePIzXHFNtrfdizjDPe41m64r7UtO80xaPXjqS43TwwbDgum7DDws4lVh1tCuQrsFjMCfmdeUPQH
	9hcMoVXqILgRCmuJneVw6gZdT02MDIr17VaIeNk+aQuAs1vcC/Lq560YntUHuKzcoELeKlTtUGyc4
	ajs/fPstnRPjxVXg1uPX3P1qHKFZMK4VY8sLAaGLHtiFIpRZCwJMKgA6Ff2n9cQ5FFM+Y/txry6oT
	ZPrZ96+C0288tZWNHqEzA8c7dxCUyarVY/FnfbTkMMHhVCiFLScO0D7QY/h0cyGOUXSXh4rZhpTKP
	yqT69vmYfMv92w0c582Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ6E-0000000GGkj-0mnz;
	Wed, 08 Jul 2026 03:37:26 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5a-0000000GFwt-1hZc
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:56 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c9e7391839cso161593a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481806; x=1784086606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJBmXlsdV1hfdU5uODx6ZlHlbgxAOvIQb43p46Hii1A=;
        b=MEukdrSlR/seJxDlyfRlfDF3V1CIvJRDmZJfCjtg+S16PlYf4+Ifetev/LEIeqcSo0
         yb2qNpdxxv9+J03KPPzHzX4vf54BL/qffHNSDPENQ4tu4nYwZj3lbuRvKzQp/4zZmbDa
         urgoi9CYZR7tdsCXmYJ9CjyL48JsWK8TjKoST2RjrTX03BsABoIZ4HRMCKUa9LNEIncH
         dzAiMOu5CTQpxlAF8inH2C/Ya9dvZlvXJk+sXlf+ifwgqMMXJ+/XgtGnJ6o1q40pCkix
         5+zV97FCexCfDgPVYSzsn7gA51TYLGjY7IwlGU28ksDDJfvRDUFUJiUu3/x//nBvxdGE
         U3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481806; x=1784086606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJBmXlsdV1hfdU5uODx6ZlHlbgxAOvIQb43p46Hii1A=;
        b=UyV9+hlI4xplRh09USkqhh2c4ATb0IkRWpgfm3xkHcUPw8gZsDUiBUg8QnfI2wswQD
         Xjcxom6am5REa26239aKPXcGSuUTZvyS1VucFr7eCIJHE1QL8PO/R2Zpr6N8jnmxxIoD
         hho3C+BQHUlAHdjThiOhKE5rzpWplQOm3HyrCeaq5hWZaK2ssXF2ogTQ2B8oU9WftWzF
         cc022uaQuSJw+8b4WLtuMyAmrCuwXcTq9+cPLL/1NtN+rNvgapqD8V+ju2UyelXCLgtH
         bGQFhsRL+zW/l9IPzgmFGXSqW4V21kVzRkufasUIoz2vKhTjMJAUm2H9Jrn4hNCRXdfL
         uiwg==
X-Gm-Message-State: AOJu0YwSt69v7dJQxKPvTpwUtDTNsnht8hsvQYtMaZJ0mE9X1tzfjQeq
	7zfou+NwblOmxaeUFl/K0j0GpkFwzepanPISHPXIXPrsOsWwXgM8C6qg
X-Gm-Gg: AfdE7cnyoSXLnPi3y6dUMbANreLF9TM3bOMmaY3H3t0ElBKlGox/bn3MwvceiOiZjSp
	WTt+Ejp8egPDewuZluY5EyBNhsmJQqArV0PsQvCf1MfNv0Hyy0juRLt5lK33f7ELAMOdUipuLp1
	lZtJL/OTbh5IcFamR84jAxBBI1gR3wJ3Z7BNluCQf3tNd8KlZtCIlXefelIra3sdd/0M7kQ59a6
	U+egYlM+BBa/JTgqrI06D0JHWalpX7KrBwpAyF6nwwaVhndy8UF3JraPuV8c7YbP9btLr9GR3t7
	MZhUhdj4mv8xsl4t9GD869wltgEntuUGWmEPPitTNYPllqUaJAzZWr6hCHRQcJWKQuwezEobPFW
	vett81KxX79Rf64Ki3KW4FEcUKNLXOq6aztt3nMy5bWaguevDjmuNxT9o7/yfNw7IvzWykQnTZw
	o+JzsUYsTmZ5qtBcnLkhJIGs21ez3njlV5s07l49E=
X-Received: by 2002:a05:6a21:400d:b0:3c0:9c1b:d0b5 with SMTP id adf61e73a8af0-3c0bd2ab6e9mr595240637.64.1783481805671;
        Tue, 07 Jul 2026 20:36:45 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:45 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:39 -0700
Subject: [PATCH v3 16/17] riscv: kexec: Use generated instruction headers
 for kexec relocations
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-16-3f8e5f75ba97@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481778; l=3956;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=34NvWLgWZxGAYVZyLbG0y/AhPlMD8oyGVqDaoGR9FaA=;
 b=HHAGABMOnP/KQwIk7NT3288oN7tkMvICA9VbvqP0An0Jr7dhNcfRSg/YZPfDaqToCGW60/N8b
 Vx8IQZDIJiIAoEmMNb7Y6NORWvzqH2Zg06kLdzkam58TbLZddvI5bvS
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203648_255931_A81A389C 
X-CRM114-Status: GOOD (  11.77  )
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

Migrate the kexec relocation code to use the generated instruction
headers instead of the hand-written instruction composition functions.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---

This was again tested by brute forcing all possible inputs to the value
fed into the immediates.
---
 arch/riscv/kernel/machine_kexec_file.c | 55 ++++++++++++----------------------
 1 file changed, 19 insertions(+), 36 deletions(-)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 54e2d9552e93..cad40e4afd86 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -116,32 +116,6 @@ static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 	(((x) + (RISCV_IMM_REACH >> 1)) & ~(RISCV_IMM_REACH - 1))
 #define RISCV_CONST_LOW_PART(x) ((x) - RISCV_CONST_HIGH_PART(x))
 
-#define ENCODE_ITYPE_IMM(x) \
-	(RV_X(x, 0, 12) << 20)
-#define ENCODE_BTYPE_IMM(x) \
-	((RV_X(x, 1, 4) << 8) | (RV_X(x, 5, 6) << 25) | \
-	(RV_X(x, 11, 1) << 7) | (RV_X(x, 12, 1) << 31))
-#define ENCODE_UTYPE_IMM(x) \
-	(RV_X(x, 12, 20) << 12)
-#define ENCODE_JTYPE_IMM(x) \
-	((RV_X(x, 1, 10) << 21) | (RV_X(x, 11, 1) << 20) | \
-	(RV_X(x, 12, 8) << 12) | (RV_X(x, 20, 1) << 31))
-#define ENCODE_CBTYPE_IMM(x) \
-	((RV_X(x, 1, 2) << 3) | (RV_X(x, 3, 2) << 10) | (RV_X(x, 5, 1) << 2) | \
-	(RV_X(x, 6, 2) << 5) | (RV_X(x, 8, 1) << 12))
-#define ENCODE_CJTYPE_IMM(x) \
-	((RV_X(x, 1, 3) << 3) | (RV_X(x, 4, 1) << 11) | (RV_X(x, 5, 1) << 2) | \
-	(RV_X(x, 6, 1) << 7) | (RV_X(x, 7, 1) << 6) | (RV_X(x, 8, 2) << 9) | \
-	(RV_X(x, 10, 1) << 8) | (RV_X(x, 11, 1) << 12))
-#define ENCODE_UJTYPE_IMM(x) \
-	(ENCODE_UTYPE_IMM(RISCV_CONST_HIGH_PART(x)) | \
-	(ENCODE_ITYPE_IMM(RISCV_CONST_LOW_PART(x)) << 32))
-#define ENCODE_UITYPE_IMM(x) \
-	(ENCODE_UTYPE_IMM(x) | (ENCODE_ITYPE_IMM(x) << 32))
-
-#define CLEAN_IMM(type, x) \
-	((~ENCODE_##type##_IMM((uint64_t)(-1))) & (x))
-
 int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 				     Elf_Shdr *section,
 				     const Elf_Shdr *relsec,
@@ -197,12 +171,14 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 
 		switch (r_type) {
 		case R_RISCV_BRANCH:
-			*(u32 *)loc = CLEAN_IMM(BTYPE, *(u32 *)loc) |
-				 ENCODE_BTYPE_IMM(val - addr);
+			/*
+			 * For simplicity, use beq as represenative of all
+			 * branches (they all have the same imm encoding)
+			 */
+			riscv_insn_beq_insert_imm((u32 *)loc, val - addr);
 			break;
 		case R_RISCV_JAL:
-			*(u32 *)loc = CLEAN_IMM(JTYPE, *(u32 *)loc) |
-				 ENCODE_JTYPE_IMM(val - addr);
+			riscv_insn_jal_insert_imm((u32 *)loc, val  - addr);
 			break;
 		/*
 		 * With no R_RISCV_PCREL_LO12_S, R_RISCV_PCREL_LO12_I
@@ -213,16 +189,23 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 		case R_RISCV_PCREL_HI20:
 		case R_RISCV_CALL_PLT:
 		case R_RISCV_CALL:
-			*(u64 *)loc = CLEAN_IMM(UITYPE, *(u64 *)loc) |
-				 ENCODE_UJTYPE_IMM(val - addr);
+			riscv_insn_auipc_insert_imm((u32 *)loc, RISCV_CONST_HIGH_PART(val - addr));
+			riscv_insn_jalr_insert_imm((u32 *)loc + 1,
+						   RISCV_CONST_LOW_PART(val - addr));
 			break;
 		case R_RISCV_RVC_BRANCH:
-			*(u32 *)loc = CLEAN_IMM(CBTYPE, *(u32 *)loc) |
-				 ENCODE_CBTYPE_IMM(val - addr);
+			/*
+			 * For simplicity, use c.beqz as represenative of all
+			 * compressed branches (they all have the same imm encoding)
+			 */
+			riscv_insn_c_beqz_insert_imm((u16 *)loc, val - addr);
 			break;
 		case R_RISCV_RVC_JUMP:
-			*(u32 *)loc = CLEAN_IMM(CJTYPE, *(u32 *)loc) |
-				 ENCODE_CJTYPE_IMM(val - addr);
+			/*
+			 * For simplicity, use c.j as represenative of all
+			 * compressed jumps (they all have the same imm encoding)
+			 */
+			riscv_insn_c_j_insert_imm((u16 *)loc, val - addr);
 			break;
 		case R_RISCV_ADD16:
 			*(u16 *)loc += val;

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
