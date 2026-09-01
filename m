Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FFEC61DD6
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 03:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zAmtFhMT9S9M7Dq51fdBB7iOB/IPt8OT8+t9fj0VGBs=; b=Ac8RdsirS+8kMG
	UhxaE4xK8qGYNtz9ApcdLPCeBv6SBUtypjlkjOQyWmK+oePwwUUBDxPx80WuXjymJsciRCvYZshLN
	5lrs1VwaPvpXECRmRb1Z4WoqgTVGPNk5vfHOLST4sAOunJAeByQrdC0glvtgBuwxYRt7bxhYSNlfr
	snZqYQTfGCyxbfU+pkftKRCFYz9FuLGX/XrqSPbBFZbrXdCxI+vrv2BHXhYlZbeX5ZVbUYw4UwA+F
	tEWOicg4TuaqSmB4wdMQwgUUOooM9gPFd1h4UYYgyThvhAS/nlWrPsOOwL4L3P+QMC5B9DIp0DtKa
	ikcf129guHnJUYBbGBHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Fd4-0000000AxZB-1FG4;
	Tue, 01 Sep 2026 03:57:46 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Fd1-0000000AxYO-2yL8
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 03:57:45 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-39675172593so3785913a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 20:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788235062; x=1788839862; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u6duqbr7qiU1/7HfGsJMzno+Gd8kl8JvVp30ChVEOm4=;
        b=bTVGmgv6Oq/X/WugXsi8VI7LnX4rOmDZlHDuzqCPtxS6wUTcySwjopr7NH/OA3kSMt
         7ZqfFDEze3/tfPZhEODpgYZTxQvzn4/ch4wzQPYcVtwVctSd3LRDXmJJwhfY3JXlGQRg
         KjFhssGTMesN/IoajB5h9JjrO7lr7Fa2F7SCNYDu4RAoJdwuEOBclNUZUFhr+rRDsEGE
         rkTSPhMU/IR9zsesNuVA8wLGpDzv0sqvTGjSHoq4uIeaaL1KDd2SUEf/HOMa60B+jIXF
         dReVrCew6280JBWnvmI1mVMHy1dJ82hJHTiB6GL95a6SudZL5RT8mx8/+X8icagROYeP
         +9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788235062; x=1788839862;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u6duqbr7qiU1/7HfGsJMzno+Gd8kl8JvVp30ChVEOm4=;
        b=QjzztncOtqRxxxIaQRhK+7ffio/+zEpqbph60yTJ6JnzSpRSdvfqXROd/T3gjNHgUL
         ahXlb155oy6gIN4Knfk+b2Ft0ZOJWmpeJugYvDkvuFfGo/sa6J+tW/8P0K6UNsRCxWby
         crDacMBbMP4cwDuFCyHQ9KBTvr5iH/dYt+DymI6MGhifIoA5FJmmv9uZqyYxJwKV+A87
         5fc8lD6OWnQkSb3lqG/HuGVR2CR+0KR6bNqMd//l+/i0FIU61UA8LJruE36jrxU1sFXD
         EUURtsTn7Dh/596DQpTqZ2hPDSDWzCqUNgi2hE53MPVU7rWSaJ46iqQn2Ka1xgl9kwFD
         7BEA==
X-Forwarded-Encrypted: i=1; AKwUvBxt4gcOmTgJ9kAtTDa4MwV5EGyjmCRlbno0DOJo3G56NAgK4lprlb1TmfdnK8Ihy2GK7kQRViL6Ol8A2A==@lists.infradead.org
X-Gm-Message-State: AFuF++nzCM7Yl1PCMRF5KpR5RoH3cUrY1ssVmzH6nmGx4KKt9hap7piS
	Fc6v8su424WlFNlB2ialGha96E3kCHeLJShFVp75LWoPqzi7SsoPnenpFRgXYuUCQwc=
X-Gm-Gg: AYBFou2d6/MBNNC82jYJA+t2r+VWNTnyONe4PxwTCfNinw+IH/Q/l5qAE3qZUcrrSp5
	LIkSUNV0JaD99oLZn3TWEEVB7veUdkFj1pcnA3ZfhKTbwnZ7XAPFUbpPeTBf36HsLlyookhcU/z
	b6s3rU3z9U4pcolvmpXhoanSPt9b2bdgZEBfMM/d7JBV1cBr5uiDKBA9JHg8K7khVtwSVEidrAy
	3pixgZ3V0onp/En+BmVWZRBYNDzGO8YkZ5EqNStCyIcVDYRb+rZBpSFUssmmKdTSJ2X07xLDaoi
	1bapnihGDYAbujK7xw1MHFjqotu0okpDRJRXQwbkA8VicCuHVMuRvmVh6xwjtL6Q69pWpTmzcAX
	0UnfWDOrkRAgxVl9+LlKawK6tcTbLGjmjIYD8fN35S9o5PWpoympnnX1SibHZkUiw3SRdhXnmKO
	jbTFoUGOuIBv3B9cwZ7GArK6D73QIMs7lliviAsMJqeDHIMKzkwAjylOYOe68inMzfsXX+ZdFBZ
	InJFzWq
X-Received: by 2002:a17:90b:28cd:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-3989c003c08mr33472489a91.22.1788235062279;
        Mon, 31 Aug 2026 20:57:42 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1b38esm31120101c88.3.2026.08.31.20.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:57:41 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 31 Aug 2026 20:57:31 -0700
Subject: [PATCH] KVM: riscv: selftests: Dump sepc/scause/stval on
 vcpu_arch_dump()
MIME-Version: 1.0
Message-Id: <20260831-kvm_kselftest_dump-v1-1-55b022c6ef8e@sifive.com>
X-B4-Tracking: v=1; b=H4sIACpNlmoC/yXMSQqEMBBA0atIrTsQR8SrSCOaVLScSUURxLsbd
 fkW/5/AaAkZiuAEizsxLbNH+AtAdfXcoiDtDZGMMpnHoRj2qRoYR+OQXaW3aRWxyXWia5OqTII
 PV4uGjnda/j/z1vSo3HOC67oB1Ih2dXYAAAA=
X-Change-ID: 20260831-kvm_kselftest_dump-3f8d4daf5c60
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788235061; l=2028;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=FIdRcsMOC/DZC1O8y6KtoskjQGfb9qysPZfXHsmxOnA=;
 b=LoVteimfcmkAq7Y0uj1TCSBAJ+oQpFiT8+1EsF2q0xDVvaq1Q0lmJLNnHQzUXtKthWFDMufNp
 H3de3BgwRlvDU5dnQcAf6LZWzBwvT435/qp3cbsvBGQB5/sjYFkbpwA
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_205743_766603_769E2F7C 
X-CRM114-Status: UNSURE (   9.01  )
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

vcpu_arch_dump() omits trap-related CSRs, making it hard to diagnose
unexpected guest exceptions from the dump output alone.

Print sepc, scause, and stval alongside the existing register dump.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ded5429f3448..bf355afa8486 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -235,6 +235,7 @@ void riscv_vcpu_mmu_setup(struct kvm_vcpu *vcpu)
 void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
 {
 	struct kvm_riscv_core core;
+	struct kvm_riscv_csr general_csr;
 
 	core.mode = vcpu_get_reg(vcpu, RISCV_CORE_REG(mode));
 	core.regs.pc = vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.pc));
@@ -270,6 +271,10 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
 	core.regs.t5 = vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.t5));
 	core.regs.t6 = vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.t6));
 
+	general_csr.sepc = vcpu_get_reg(vcpu, RISCV_GENERAL_CSR_REG(sepc));
+	general_csr.scause = vcpu_get_reg(vcpu, RISCV_GENERAL_CSR_REG(scause));
+	general_csr.stval = vcpu_get_reg(vcpu, RISCV_GENERAL_CSR_REG(stval));
+
 	fprintf(stream,
 		" MODE:  0x%lx\n", core.mode);
 	fprintf(stream,
@@ -296,6 +301,9 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
 	fprintf(stream,
 		" T3: 0x%016lx   T4: 0x%016lx T5: 0x%016lx T6: 0x%016lx\n",
 		core.regs.t3, core.regs.t4, core.regs.t5, core.regs.t6);
+	fprintf(stream,
+		"SEPC: 0x%016lx SCAUSE: 0x%016lx STVAL: 0x%016lx\n",
+		general_csr.sepc, general_csr.scause, general_csr.stval);
 }
 
 static void __aligned(16) guest_unexp_trap(void)

---
base-commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650
change-id: 20260831-kvm_kselftest_dump-3f8d4daf5c60


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
