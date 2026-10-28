Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077B6606A31D
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 22:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tgoAgrPh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MFIQexco
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hf2Zsiae/jArksEwj/HkT/To6p0ztuAgfDRYYU9j4Ds=; b=tgoAgrPhAK5zY8O6gEjBvkB/L5
	0LsB0k2E40EDfbCgF+Ya/Wrvi0mjTEM8U0RZu7XUJG8WL//1HdXAXXEy636fcKrcxD+yrTEoH9kbq
	yciBrqmTTTfhe7q/bSmNtvCUVdSaarVisA0joPRocezxZqn2Lrb4ZmVqmFQXdkC1FrPles/QrWJQz
	mKrnKZhYn/O70X0fJkaeau1uDx/829waOJ5OY7gSbHLHX4Lq1FIllG7J1PKwAzXKC+Kku7iLB942P
	QsbhPjBJz7gGuU44uOWYl+9/jKkY7fUwHJ8s4evfhuIIaAAxSY+4lWBz8HXBrIem20jkxYPkSogJI
	mIZcERbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMCMn-000000081yU-453u;
	Wed, 28 Oct 2026 22:43:33 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMCMj-000000081vE-1nUW
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 22:43:30 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-9440304604aso18106485a.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 15:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793227407; x=1793832207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dAZhtXQcONVBEEfX+FEqGwIc1UuckqT1BoM+QvmFfV4=;
        b=MFIQexcoJRkbeooT33rMrf2+RLH9hgzZ45+rq8aIZoOJgBOVD6jdrYUlcILQPD3+Uq
         zlXDP+gWCLalC8FuaE0nUDtNFJaUmRD6QjqifKwFAPLwTs96WIzzScfS+KjLquIH/qgX
         QXIdObwkidL1dNsf+d+u/rR3G/BK912m++c/jeQ3a/gW9WlRA1mDAeLQBgtfL6S+mjvl
         pxvVmQmsOyxVIgLVnP69WqBXisxV144JWKNIudZb4/OHr58+Z04PaZWjdeUscpu1LBgJ
         bQ+fj1dejKLg61ICwtKJDZqt2q7eaRVtO+OFXNwBDTZeT5D8WMteuwoUa085FRks6Zbw
         uZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793227407; x=1793832207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dAZhtXQcONVBEEfX+FEqGwIc1UuckqT1BoM+QvmFfV4=;
        b=LgYCXtNx7Zc+300z2YOaD42JIf6ulcutiiE6FsX4hKC0TUjbl+DowRMw4tTX4n5k33
         IrXMQHurQfuB+r3o6p8C+DJ4odELuN34A6ElHkoETB4Fx24eOPgzv7l38U9zfcFS6GPA
         9voEqZfpgrQdE35xjlX2XLqm9cF3MNp35CB0L9vTTMJx4GQsYZFDOMHRR08JyRYZ0H2r
         eEQradIb6iEhRTNWXvtXumfjwbVWQKPvOSH8dVByVTgIl+MGeSfuFFLXbtmvQp5GBKoF
         VrfTqPauT5XpukAuMK+l5i9mAUmfdJtlGgFK9eBBoeeFSeQVNUz/YnwGspd6NxZGV0MP
         G/pQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT8+4gT0NN4oit6QGH5DWzxef8LIhoSYTIr9TpYRX4OwKXBUAqgIhtyGwEPyZX/BHlTqBejaOVhgs6Rw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLYCsXPFnyb8sx6dBXeLGHFqAR0Dk7PKyAR5/Icnict9NU8ZGlk
	ULwIChiubxdFdevQVWP7qdkovBwiyfB6WKfl2VZWb3dkn0opE1LuebvV
X-Gm-Gg: AYBFou10dD+8y89yTZezpwErVqxzlauYATFawPixV0zefywtuMJB5DC9WEtqHq11pI9
	oy3WdmYkFv/EJXIBQqQPkAW6ZPvZ88JaQfCoY6Ka1EGSF8zlEKYR9jID0G89954X/nr1C9Ralfv
	39ASb8AEy5qRWX+iZJNUoSg9sqhX95YUfuFFa4Ye8PSliO6dP6oDgDd4pzXcyBEb6GN6rVuSMPn
	bcgfjigDztVy2s3vc6G/I+naMe8XA3W0mnxWc/M0BdjyqHAoY52ZicOrL6VGnHWH47U7OrnO2dr
	zmb5OMdf1Gcliy/4MtB6YXfpy/0p7V8NM/fXJWbNPgim6j6MrYEszrV0cYgiE/kuzDVVxyAMyno
	EU5+7FL/tKlQ1GOo3lY3HVe5mPTo2bO3N2LDmUZtWxpJSbxj3DnSEVsyzEi1ezjq8HHtybU4lFZ
	a77ndX1Sca3OrM15UgZl7rZoQEVjjR8ZCa9dt9sdClD0bJVcBEOpD+rv4eqUOFoYFtc5vphqZEk
	KTuKMY+h6cqpzBenwaDsYTCe6HwdlUesHgMnPJ0wP8z/g4tlWkeCyVUNEO7BHOTwVPpoivLkhxF
	XLOrNltWnAFl1jR6iRS6OUQdZ2XYhGqntc6Bj07RIi3CdOF3jIaIWmPYAelhB/FfGxffo+LGO5R
	/SdnffxXdE5FAS7JT/tXNPMSqdzxduhlUKZjsEfNjxB9nKisXU0I=
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id af79cd13be357-9441338b4cfmr150529085a.23.1793227407492;
        Wed, 28 Oct 2026 15:43:27 -0700 (PDT)
Received: from paul-white-HP-Pavilion-Laptop-15-cs1xxx.mynetworksettings.com ([2600:4040:ad65:1c00:b8:5aeb:4bda:886])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0787d96sm1370085685a.28.2026.10.28.15.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:43:26 -0700 (PDT)
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
Subject: [PATCH v2 2/2] KVM: riscv: Eliminate redundancy in set_reg function via pointers
Date: Wed, 28 Oct 2026 18:43:09 -0400
Message-ID: <7290d6f5bead955e7a4bcb5b7aba97962031f0cb.1793223506.git.paul.white.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793223506.git.paul.white.kernel@gmail.com>
References: <cover.1793223506.git.paul.white.kernel@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_154329_485646_EB3C379D 
X-CRM114-Status: GOOD (  24.43  )
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
requested in a token so that it can write data into that register. It
differentiated it from the many other variables with the word reg in
it.

Signed-off-by: Paul White <paul.white.kernel@gmail.com>
---
v2:
 - only checked whether size token listed was either 32 or 64 which
   could create/allow tokens with mismatched sizes and types to pass,
   but should've checked if token's size was correct for its FP type.
   Did this by replacing u32 and u64 with byte_offset because it is a
   existing mode-dependent variable.
---
 arch/riscv/kvm/vcpu_fp.c | 62 +++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index da4f83be6b19..b8e89107b6c3 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -142,41 +142,51 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
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
-			 reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
-			reg_num = array_index_nospec(reg_num,
-						     ARRAY_SIZE(cntx->fp.f.f));
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
-						     ARRAY_SIZE(cntx->fp.d.f));
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
 
 	if (copy_from_user(reg_val, uaddr, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
