Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D098606A32E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 03:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wk1K96T8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RsMzAqiv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1oJBYNJsSFJc0AmQAVLKa/MvkqxLjvJhDRFly/oft2A=; b=Wk1K96T8RY7GypiDwXImORGpgW
	UrqiOkCB7Xs0LjSwufTYo6K9Sft6KddTV7O6Yc7JeMejR6gJ73g0kgb1rr3lKlrWOhoSpo+uqOAsi
	gksgQNHJjeEDQgE+6q6me+WXFczsy6HZWrjTaL4NziJH9FGITVdUMZXO4Mh6OO+NpqL3iqtpwyp84
	aYI3dOz+KuJ0aZb/wxNJFGrQ7Tm8d5Y+ItqKjm6X2ww0oBjzDXa1yRDaaHhIqmmMt1s286ORY/iMv
	Cdi2sxoS6l2HiUimkJZDeXozgl/HMIro7W1OgJeVDOlDTE5h0zXpx2JBT3rXyq4IU4LtDiZAL39Zo
	ZBLC3G1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBdV-00000001fr5-1HWW;
	Mon, 26 Oct 2026 03:44:37 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBdS-00000001foB-1VsI
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 03:44:35 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5365d26ccbdso30389661cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 Oct 2026 20:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986273; x=1793591073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODlqko/BPpmyU4h+oI7UAqT8yjWxPc3m1CLwqWBtjDo=;
        b=RsMzAqivZfsrG4c3+88oRXGqAndT/MvdVmzkMMhVCtGVeehhlgELqvq9qd3tHQuq1P
         /pfZ7j4BaTKqSoSL4rYTh9M30pTkPqd8RQy8WLLAdLfFlA718ReD5H8X1UbtphTiSUpj
         Hnybczb55VatAk8/bkEv9Xkrdu5gTBzR8r4Jb9FO1kPUco03nVDOj/5max/U1S8y/5h7
         JmDbXg2vRonz4anJmtRDymDvibKXmfk2FvSGI/IrOR6i1LEYT+9VMHDgpuUigGf4akkX
         uoZyqgVF0MDCwSHWS7vO8L5dy0EE3kCaTy6emzizUe+rRPb5ElAHSHlpMj3VP18Dm79T
         XwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986273; x=1793591073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ODlqko/BPpmyU4h+oI7UAqT8yjWxPc3m1CLwqWBtjDo=;
        b=DJsAubU3f2SLkbkjMIyp4Ky94BHhBLdFuKXY6mD0QYAL3zuK4NMK9pn5MyM0TjOWML
         xBSXE25Kf0AADr4ZDfMHqTNy4nvUMw2Lq+PJCB4FGciC18TgMQAOLbwhhdM/D19pc1k2
         iF6kqIZR7SskHMHNtqhJphSmp+sPmLtF7Ipm+SJGTQVOmFqnAI3ckaE4HZAzDTGLG1O/
         MnmHNF6n5+xy+Cjms3MJW4I/k4oQLaVSVC1XbFIKYbsJWsdnprhmYUu9cfwYNN0lahC+
         ZS3WG3LHqdlXYXzhfy6o/UOujARyUPjVIUSUWMTlMkdsGVDvi0RJts96OVnFXALHrYaS
         L0jQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcioU5pA0rkiIFj2ENgsUtQRQWDfMZ8M6zbTTeAVM+Xa2uaI7JE1XFeWaR6gnN3PUv2KjEkb3AqZLoJQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKarHp4TJ++ijapgZ1CUYfoPVYKzU8vZ/goW24g94RKnfg9vJzg
	sCoLiS3IZXEIb2Vnr2lKKUCC8Y7ACz5Wr6rJDZRCHOuvyecWlTS1uDkD
X-Gm-Gg: AYBFou0o915cSWKDPmlrse7/uVVZy7EMsgVS8gIEjMGT8qqkqGQPvuWOtB0Xzo90Y+U
	RMex0l5dNZb9m3/8zb5xVXw0vlW7Ta9ZgpnP/zP+0G6NxQs7bkB0f3lQUu4bArW6j17My9uc2e2
	kjogp+RY1AdZ7qfeWcIcaBqxYNEsDVJD1rqTtd9UW4uvUlHOAl244wyaKT1gOPUz0pLScFzLQqW
	swPkE4RJndprgFc79hR5H8EhWQr8qXnZER6wyfu9WrTwO4VHXgzkShLTxva4murWIeT7RhsQjGX
	1BQ2+c5iZOctwStXV/dLB1DT0Fro7xhUH/c7md9hf3oWR3zw8xFfjcA8NOcDck1Vfc3lbTVPDJ5
	C9rVpp/NS9WcmLotY+y5lp4P+W8sxM/qET2q6CSyC/IkLq3lgQ00sCfQHQgjB9fyfbBjkSTgnEx
	iNbF69ERiw87Odn+Kp60JldhnZgLrqVAoIv4jal3OVRSe+2lY3rilEGJDTWDrE3Bx+dPlc60X5D
	a3Ezn5VaVAYfLTJMHa8AgchXEs71OQw22wpCdHp5pO4YmLax18dTyfjuwl9yDCBuSVxtwb+alcG
	el0eQdV4acNhVZVIZT1K4wkzb71I9VYPiklrI3Li9PYFEqZ3KPQuYGD/mRu1
X-Received: by 2002:ac8:5a0f:0:b0:530:1b1:72be with SMTP id d75a77b69052e-5383b6838c2mr89604751cf.40.1792986273086;
        Sun, 25 Oct 2026 20:44:33 -0700 (PDT)
Received: from paul-white-HP-Pavilion-Laptop-15-cs1xxx.mynetworksettings.com ([2600:4040:ad65:1c00:4cc4:d0be:4ab6:9a0b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c5273sm46202121cf.9.2026.10.25.20.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:44:32 -0700 (PDT)
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
Subject: [PATCH 2/2] KVM: riscv: Eliminate redundancy in set_reg function via pointers
Date: Sun, 25 Oct 2026 23:41:27 -0400
Message-ID: <073a56efd7e8f5b1e54207f266e1fa972b54a0e2.1792982932.git.paul.white.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792982932.git.paul.white.kernel@gmail.com>
References: <cover.1792982932.git.paul.white.kernel@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_204434_413730_FE921ABE 
X-CRM114-Status: GOOD (  22.89  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
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
 arch/riscv/kvm/vcpu_fp.c | 64 ++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index 16999a5c45de..fe4957603519 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -144,41 +144,53 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
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
+		if ((KVM_REG_SIZE(reg->id) != sizeof(u32)) &&
+		    (KVM_REG_SIZE(reg->id) != sizeof(u64))) {
+			return -EINVAL;
+		}
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
