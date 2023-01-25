Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF184C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1oaexmUpc1XiqnUOSqzn0P4/sx22uTleYUO9S+sZ9SY=; b=dUrJ0QTGrj3wMn
	YBGCE9bVDrdxhY+EAH1/s2lYBFgokxYqTZVBYGB0D2AgbPkssmm9ZZ4aJlUy9tBhL/7MvostMmugD
	ll8SQtIxJP4t24+kFpaglEKRr0qd2K3rgiuw4K31Si7ntENifgykTEdtu5jglVHvndgBANMIiCDER
	0rUITGvIXrXDPZUOJRBFWkRmNnTpme4uOTz2YbYvBVvfJEKYMcQ8RBGgpTY8qO5Eh7V7SmJut9P0D
	vK0RH7VXfcbiglCuTBIUYDS/rYALvU0lrZi8TWzGgtCjXKmVpERL4mS6q63EaHTOpohHzEBPh1G/R
	P6hsRPaz4EarkZWyz6+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgfl-007W83-73; Wed, 25 Jan 2023 14:22:45 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgfi-007W4p-2A
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 14:22:43 +0000
Received: by mail-pj1-x1032.google.com with SMTP id x2-20020a17090a46c200b002295ca9855aso2190629pjg.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 06:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ygAltSAzjcTzQzob9WHeiImoKkO6d8yPGnZwCSBnOD0=;
        b=nVURTT3B2wHERxfqwlBVCOc2+IBuRDAPVjeILDQPCQTW7e/QB4UP3y5HqYQ5YMxkNW
         nHdpnyZeID8ofnHxw1uBiK4cO5GXNAvmGu9f4XtHJPvvWI6a1RgZAfbxXTGJkQL6v7Zj
         PBVLlK1BbipdoGSRQynPZSZie0S/UtuI27e+BBtGOUgzyCZo/hDJaXXfsAmr+rfqGh3N
         EvMX8doXZ31nYMrfbMgP0dWbQVsytAaovBIiboLNkSr5yY+GQd/Qtu/n1Q/4cE1K88yk
         6DUVfwPVfbS3ALbsHVg8c+JRBnRTIjLSmvvkxrwFpKy+g9TBsOVDdrnZL1ZnlIqRn+iF
         sPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygAltSAzjcTzQzob9WHeiImoKkO6d8yPGnZwCSBnOD0=;
        b=c+TXEm6j5F8t5iEZRYnPwk6uKr+7+99S5UU5rdGbz8T92//5mx8FMLf02HycNhUwDn
         bjZOQvXfux0NpDeMEevDfY1zSAyJSGqx74EHLkaJ0ShFl/HREcO0xfaUv+7n8WqObF2J
         dbGQDGx4+9E+Ts9Dk32253Hb8ARf1G0yBLRot2MwKQmypgfJiWt5iHIlOXoartYT3Gsz
         ojev855AFhnKeapILc0/tPL72K755SFws3z7BfoqPDnjAiO5XpboebM9DKbi7j2IiHeE
         5WYdrPqgzb5m4UJESFz8cMXNuVXiOs7xG8gtMp97hdP/xCqQJNB6B5pMWvwNS3sAJORF
         UsjA==
X-Gm-Message-State: AFqh2kqXiNABDzdKJaAkpTGt//vLu1yyXGWOb/FbjYQCx28WMYEUxX0s
	ehJv4EReFS3JXWBV+yQtCczM1tDrG+68JQiO6zrsY9u6Uh8JKJGG0RCg9FvGwp5Kc4MbUWseMOq
	kMyOQgzT5IKuTVRg10VXSSzg5uENc10eZ8LZ8aR9XNi609Khb9mywdyvfTobP5tD3hRGU+f1lhn
	ozZPnV8zYhoQ==
X-Google-Smtp-Source: AMrXdXtC5AvDTqpA7Ocpig2XQZRfE1nIdra66UQn8nW9ojTwzxqd4hLbKbmeaTIto4SHnPJxqQ2c7A==
X-Received: by 2002:a05:6a20:4295:b0:b8:9c66:cd64 with SMTP id o21-20020a056a20429500b000b89c66cd64mr42336929pzj.14.1674656558873;
        Wed, 25 Jan 2023 06:22:38 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id bu11-20020a63294b000000b004a3510effa5sm3203520pgb.65.2023.01.25.06.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:22:38 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH -next v13 18/19] riscv: kvm: redirect illegal instruction traps to guests
Date: Wed, 25 Jan 2023 14:20:55 +0000
Message-Id: <20230125142056.18356-19-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_062242_135375_581BE246 
X-CRM114-Status: GOOD (  13.72  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Running below m-mode, an illegal instruction trap where m-mode could not
handle would be redirected back to s-mode. However, kvm running in hs-mode
terminates the vs-mode software when it receive such exception code.
Instead, it should redirect the trap back to vs-mode, and let vs-mode trap
handler decide the next step.

Besides, hs-mode should run transparently to vs-mode. So terminating
guest OS breaks assumption for the kernel running in vs-mode.

We use first-use trap to enable Vector for user space processes. This
means that the user process running in u- or vu- mode will take an
illegal instruction trap for the first time using V. Then the s- or vs-
mode kernel would allocate V for the process. Thus, we must redirect the
trap back to vs-mode in order to get the first-use trap working for guest
OSes here.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kvm/vcpu_exit.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index c9f741ab26f5..2a02cb750892 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -162,6 +162,16 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
 }
 
+static int vcpu_trap_redirect_vs(struct kvm_vcpu *vcpu,
+				 struct kvm_cpu_trap *trap)
+{
+	/* set up trap handler and trap info when it gets back to vs */
+	kvm_riscv_vcpu_trap_redirect(vcpu, trap);
+	/* return to s-mode by setting vcpu's SPP */
+	vcpu->arch.guest_context.sstatus |= SR_SPP;
+	return 1;
+}
+
 /*
  * Return > 0 to return to guest, < 0 on error, 0 (and set exit_reason) on
  * proper exit to userspace.
@@ -179,6 +189,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	ret = -EFAULT;
 	run->exit_reason = KVM_EXIT_UNKNOWN;
 	switch (trap->scause) {
+	case EXC_INST_ILLEGAL:
+		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
+			ret = vcpu_trap_redirect_vs(vcpu, trap);
+		break;
 	case EXC_VIRTUAL_INST_FAULT:
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
 			ret = kvm_riscv_vcpu_virtual_insn(vcpu, run, trap);
@@ -206,6 +220,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			vcpu->arch.guest_context.hstatus);
 		kvm_err("SCAUSE=0x%lx STVAL=0x%lx HTVAL=0x%lx HTINST=0x%lx\n",
 			trap->scause, trap->stval, trap->htval, trap->htinst);
+		asm volatile ("ebreak\n\t");
 	}
 
 	return ret;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
