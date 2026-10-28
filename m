Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F18606A31A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 22:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t3Frn1qY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfekL2eJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YnIyDVOvjdYBozRjlHGlgFHUH17qVcqYLKE4WeG3AMc=; b=t3Frn1qYoiUWxwouohMl4+dfot
	N80KUiM4XsFhO/zTm6sQzM/nwTIUlW7RVlMADxyyNDr2Gyhc+aVkeCAT1HNNZA3ecwiOQ1A6LY7xU
	adI6P51P3HapEAd3MYAVk4rvXFoTEaKBNzjy3hiOyazvdy7UpLg4lvwH6YaOknefeElTSKcKv24wh
	POeXCKgVaxRBS7c0oJbrbSXbI6X/NdmReCOuij3RedQ7+PKIvdkv7wHceM26Mb84APd8rr85zurE+
	RW8mPg4lQpPM3ukmTSbOiuhJJ4ze1ifHiAcev/q5OoonSswqbFSRcDwMc0pEzoz79nkNx6fKZvQTN
	YtxPNTMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMCMk-000000081wW-3AFh;
	Wed, 28 Oct 2026 22:43:30 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMCMh-000000081tx-3CV2
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 22:43:29 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-93e55db58cfso129225185a.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 15:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793227406; x=1793832206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qy3A1Vkwd/cDXLut21ZiXnCP/BKq6y64SvmrcYwH9Tc=;
        b=xfekL2eJk9Gjz+5JItAtLWGNJOkMG9y4zdtbIZi0Nq/q2f3QY+AqgSe++eYIb2sdkh
         k/V9/vWsOKOmssDgS7F9t/rKI5k8sTn49hwCC4VRurSAjvYP9BjILg+iCMS7AdJMCLUX
         8VdTSKpmPG5O3H0sT6Vrnwd0AjcyY0HNb7yTO4pHU+dWcHCAGtYejCjO2Aa9HLK+P4Hd
         kaXZbx/lCG/pMWkwtbfuTTcE+XfnZMPgZOFSj70s3haCtvMlSx/aNnf/6SJ6WrBhUxgx
         p4/Y8rM3vD6Ielq52T5IivCsi/sOmVlw+GxQQu+ZX8NbkVXhwy+reENBSGIw46YZuN1/
         58Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793227406; x=1793832206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qy3A1Vkwd/cDXLut21ZiXnCP/BKq6y64SvmrcYwH9Tc=;
        b=IcFHB2zEBCLhemyHl6Wk3tDgBbLH2ioeV5ItMxHvH8yYf2WPebA9+7Bqbuan+nOPLF
         1xYGCg+fYwCh1rMvUZjlXBKcJxLy08CRsNGFGs9rWrDN8LjL+12Dnf7S7V71C0Bq/q3B
         Qhz62OsOmaXhSsPzQAUF3KO2XUYUfLViDnJ6OL/kD3tzBHg2EHWIRN2RNH9f8WV5v4Hi
         zoVAAxCVfsxeaW416rVsdn4BGwsNW27H06zkocNE0VtmRMcSwNXizCWcjwB3KHfzAvOl
         CKsP8tl5m+9erlfixuKI3PhRlaF7OR+EKmlAfJoXmjwiHwGGLiJcHpQWbEKJh9aF+mCE
         XYRw==
X-Forwarded-Encrypted: i=1; AKwUvBwJ6GHnxc+jrD8lP5QQ76Cjb4w1qxbLgmA1ZV7uLiciwbnTV23UdscM6K5UZip2fn3GwQSu1b3Hmc3meg==@lists.infradead.org
X-Gm-Message-State: AFq9FYI2CLCfD6uy/iZxDeDApwRFIkwv7YUIpTNFKxhxJvHf0GDPMf8/
	eanQw3qvtO21uaHYDURXt9eG8kebm8e5DSwZ4apryxpWghAmoe53p9bI
X-Gm-Gg: AYBFou3/seLzQja0VyiCpC0ytuH9kTKT+ACVggoJTP7frphjzlhXwQEoUgAPlkj8zyW
	iit3KqcH4bNgFrwZHL8QkfRKPX7oBJWDhtxNZWvD7rBn8oB3A4xSDcaQtt8L31oS8hJCk55TB6Q
	cgI0vakaSWAA6V/bP/Zs/L6Tm7YZWVAhLAl9tuVRHl/MyfC5QukY3KgdzLXBJDMds5rDZpjypBx
	PKFJE20waGH3iZBN8oWW6vj3O9dDg4w6IVREG/D/wxMaLGl7Ue48MPtoJmHeAsqHLVVvbidYks7
	zydZXtZobfExo0lxWWg1tIAEA/VR6CKonkq2CuRkT8cpxn9M85/2UaSNFLNHHss9pn0+hAQO9Nl
	aUfl2YmGl3Cs9F9FoYGb9W95ivOboQV+qK7bS6u9+kt+zJdEuG1e00BwtQZv5HoRkCd2r3GMt1q
	y9vXHLsKWjW4Z8ixY1tuc5AgviQY4gxiyH6VeUJIBfGkTcCNx2CPlNxO+1ZKp9AvZyHeWwyTic7
	XsXKUeH+Hk48obLqhONjb92dkz74VPFdVL14avZBqPqtC4eDtVtz21ATuztkogobH4S7OlQnwDb
	EVXUnLhF/3S7I30MoobOhITW6PQirV0Oo4r/GrsBf8DdjDzsO+AKGc9pp6U2kIQoPPfLIqKgQe4
	tYSLdjwJsHfnue1fWprCGkF+7TqIyDqSHmNLtsKDNHaClgIsiQWo=
X-Received: by 2002:a05:620a:2629:b0:93e:c12c:9b77 with SMTP id af79cd13be357-94408d68de4mr575691585a.82.1793227405973;
        Wed, 28 Oct 2026 15:43:25 -0700 (PDT)
Received: from paul-white-HP-Pavilion-Laptop-15-cs1xxx.mynetworksettings.com ([2600:4040:ad65:1c00:b8:5aeb:4bda:886])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0787d96sm1370085685a.28.2026.10.28.15.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:43:25 -0700 (PDT)
From: Paul White <paul.white.kernel@gmail.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul White <paul.white.kernel@gmail.com>
Subject: [PATCH v2 1/2] KVM: riscv: Eliminate redundancy in get_reg function via pointers
Date: Wed, 28 Oct 2026 18:43:08 -0400
Message-ID: <072bcc0994a5d2a0c21778a7a6f9e395395535c6.1793223506.git.paul.white.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793223506.git.paul.white.kernel@gmail.com>
References: <cover.1793223506.git.paul.white.kernel@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_154327_820384_EE74BC4D 
X-CRM114-Status: GOOD (  24.48  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The original code is essentially asking: for each possible floating
point mode, ask if reg_num is a status control register or a data
register. It is redundant to ask those same questions for every
possible floating point mode case.

In order to only ask the "status control register or data register"
question once, the variables in the status control if statement and
the data register if statement that would be different depending on
the type of floating point mode (for example,
KVM_REG_RISCV_FP_F_REG(fcsr) would be KVM_REG_RISCV_FP_D_REG(fcsr) if
the floating point mode was double) were made local variables of the
entire function so that once the cpu passes the if statement inquiring
whether it is double point mode or single point mode, all the
variables that change depending on the type in the status control if
statements and data register if statements will be set to the
appropriate values they should be when in that mode before/when it
enters the status control and data register if statements, allowing me
to only have to ask those questions once and creating a dynamic code
that changes based on the information. This results in a "asking the
type then asking status control or data register question once"
structure rather than a type-questions, type-questions redundant
structure like before.

This results in faster cpu execution because despite the longer lines
of code the cpu has to make less decisions, which saves time in case,
due to its tendency to make assumptions about what an if statement will
evaluate to, it has to backpedal because it realized it needed to go
down a different if statement/path. Finding an address via my
bare-metal approach is also faster than looking up an object properties
and then an array. It is also more maintainable in the future. If the
original code needed to be changed, you would have to remember to do
the same thing to both type blocks whereas mine would just require a
change in the beginning if statements. If a new floating point mode was
added you have to ask those same questions all over again, which may
make the code longer in the long run.

I also renamed reg_num to token_reg_num in my code as I felt it made
it clearer that it was the register number the application wants and
requested in a token. It differentiated it from the many other
variables with the word reg in it.

Signed-off-by: Paul White <paul.white.kernel@gmail.com>
---
v2:
- Only checked whether size token listed was 32 or 64 bits, which could
  create/allow tokens with mismatched sizes and types to pass.
  Should've checked if token's size was correct for its FP type. Did
  this by replacing u32 and u64 parts with byte_offset because it is
  mode-dependent local variable.
---
 arch/riscv/kvm/vcpu_fp.c | 68 +++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index bb11e6757d34..da4f83be6b19 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -83,41 +83,51 @@ int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
-	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+	unsigned long token_reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    rtype);
 	void *reg_val;
 
+	u32 *fcsr_addr;
+	void *f_array_addr;
+	size_t byte_offset = 0;
+	unsigned long offical_fcsr_num = 0;
+	unsigned long offical_first_reg = 0;
+	unsigned long offical_last_reg = 0;
+
 	if ((rtype == KVM_REG_RISCV_FP_F) &&
 	    riscv_isa_extension_available(vcpu->arch.isa, F)) {
+		fcsr_addr = &cntx->fp.f.fcsr;
+		f_array_addr = &cntx->fp.f.f;
+		byte_offset = 4;
+		offical_fcsr_num = KVM_REG_RISCV_FP_F_REG(fcsr);
+		offical_first_reg = KVM_REG_RISCV_FP_F_REG(f[0]);
+		offical_last_reg = KVM_REG_RISCV_FP_F_REG(f[31]);
+	} else if  ((rtype == KVM_REG_RISCV_FP_D) &&
+			   riscv_isa_extension_available(vcpu->arch.isa, D)) {
+		fcsr_addr = &cntx->fp.d.fcsr;
+		f_array_addr = &cntx->fp.d.f;
+		byte_offset = 8;
+		offical_fcsr_num = KVM_REG_RISCV_FP_D_REG(fcsr);
+		offical_first_reg = KVM_REG_RISCV_FP_D_REG(f[0]);
+		offical_last_reg = KVM_REG_RISCV_FP_D_REG(f[31]);
+	} else {
+		return -ENOENT;
+	}
+
+	if (token_reg_num == offical_fcsr_num) {
 		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
 			return -EINVAL;
-		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
-			reg_val = &cntx->fp.f.fcsr;
-		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
-			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
-			reg_num = array_index_nospec(reg_num,
-					ARRAY_SIZE(cntx->fp.f.f));
-			reg_val = &cntx->fp.f.f[reg_num];
-		} else
-			return -ENOENT;
-	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
-		   riscv_isa_extension_available(vcpu->arch.isa, D)) {
-		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
-			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
-				return -EINVAL;
-			reg_val = &cntx->fp.d.fcsr;
-		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
-			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
-			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
-				return -EINVAL;
-			reg_num = array_index_nospec(reg_num,
-					ARRAY_SIZE(cntx->fp.d.f));
-			reg_val = &cntx->fp.d.f[reg_num];
-		} else
-			return -ENOENT;
-	} else
+		reg_val = fcsr_addr;
+	} else if ((offical_first_reg <= token_reg_num) && (token_reg_num <= offical_last_reg)) {
+		if (KVM_REG_SIZE(reg->id) != byte_offset)
+			return -EINVAL;
+		token_reg_num = array_index_nospec(token_reg_num,
+						   32);
+		reg_val = (u8 *)f_array_addr + (token_reg_num * byte_offset);
+	} else {
 		return -ENOENT;
+	}
 
 	if (copy_to_user(uaddr, reg_val, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
@@ -144,9 +154,9 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
 			reg_val = &cntx->fp.f.fcsr;
 		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
-			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
+			 reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
 			reg_num = array_index_nospec(reg_num,
-					ARRAY_SIZE(cntx->fp.f.f));
+						     ARRAY_SIZE(cntx->fp.f.f));
 			reg_val = &cntx->fp.f.f[reg_num];
 		} else
 			return -ENOENT;
@@ -161,7 +171,7 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
 				return -EINVAL;
 			reg_num = array_index_nospec(reg_num,
-					ARRAY_SIZE(cntx->fp.d.f));
+						     ARRAY_SIZE(cntx->fp.d.f));
 			reg_val = &cntx->fp.d.f[reg_num];
 		} else
 			return -ENOENT;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
