Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF383C433E3
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 23:22:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B6C92080D
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 23:22:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bsxQsxF7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="HF34OChy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B6C92080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oPIQw+HkCv1vcw4iURA8MFpPagviDsBm5iDauSL5B1g=; b=bsxQsxF79obcEkiO49kZy/7jF
	pUygO8FIi87zHwPAcNfUghyDoLK7pGQX6kkN3zdcCUQbpsg3FB7o1YDhmrim5/cVqmtv1b3aLcQWl
	SJlUfoAKiHzSzdiWfcpZ5B3B+y68/7PpzLXUW2tPzgjGaaz0n/9ohdM7KUYjbttMyKzyG003q62TP
	B6pjXDKuDqAgzIJqbzttmvsPJyRMAryxxIhTPmtERpCfj3dyDmxdRgVkqC0uFhOf5q5Jit1W56Fhf
	StBIzMhKTsJvMnmrsCwuKesqKWvS8wzFW3N8oKnGAUJ2UU6nnskV7URi3TVBt19Hp+76kzuUFq5hn
	DrszNteZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jykXt-0007xL-O1; Thu, 23 Jul 2020 23:22:37 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jykXr-0007wG-16
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 23:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595546554; x=1627082554;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=unRYGB3JD9VvX1/PIcQEqDOVGoOR6BJzAhuSTskpzt8=;
 b=HF34OChypldCw7RSjPy3I66Tv3OXlDk84DGzwu7MqB1WakV/ksFTQ354
 l4eKfBz13s4MVpph7oIbGlXb199dP4Ls/Sgk6gk1L0k4jVRjcZBohV66R
 JPX11fmVY7mbKcs7cYX7mXORpTwV94VHZ/Ge4AYn4yhQEpZpbgj9MjF32
 KEim5pr6z5eGi3KejdiWbbEWOzuLx38DpkIF1b1qvALZfwHuD1c5PCwBX
 cGWNnc+7KoD5Ldwuqld7wmEM1/QrIVXqjXzEaAbGScv396JG6Gf3e897L
 lErveEdt/BdVyI71v8baC22S+43s9ax1t0UIf4THyY/SWRgmcXcxtzzCJ Q==;
IronPort-SDR: TdWdMD0QxagkcTQWm928E8sAKH9NtQfAiNsvMD0xjxAHLZxbm63n/aABTQmLnc21fFTVWOhG+o
 pNTxwWSVflD/AdyuAN3L8Pl97PTjf19ieisE0su7VSgbNvKMk5T1hrS4GcNrX3WgP98T6EE66X
 KfmdQw2k0+/JQ91g6+sbhDZOvP5pVZB1rkr0JFPOcNal/kN7W32CmyfLIDKUMDaCmDJSfe3bBR
 EDF9bSSc0y18T7nd2RaVtex53NPxpNtQBT7LzhVrKvxvmEeAaabd02anS5SVIfj+R8ECHKi8F8
 JYM=
X-IronPort-AV: E=Sophos;i="5.75,388,1589212800"; d="scan'208";a="252546079"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2020 07:22:33 +0800
IronPort-SDR: EyxSRKlJqzG+sHwUcfX60F2KUQmTNVBQXnJ5dgWULP1JHT5z3Qx/OP4sINTQQX+zL78GngpfEi
 C1wvHcHNbHClD5ysH319cbZkidsfyzZTk=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2020 16:10:48 -0700
IronPort-SDR: kn1K8tzOhML+h1sFQtgcxeTtQDCepy93j2k8G6/vZ7GpGpOfzi9q/EmKzgYoOtRZ0w97z92dm4
 Z4SO0nqSzC0g==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2020 16:22:32 -0700
Date: Fri, 24 Jul 2020 00:22:30 +0100 (BST)
From: "Maciej W. Rozycki" <macro@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] riscv: ptrace: Improve the style in NT_PRFPREG regset
 handling
In-Reply-To: <alpine.LFD.2.21.2007232038170.24175@redsun52.ssa.fujisawa.hgst.com>
Message-ID: <alpine.DEB.2.20.2007232216420.4462@tpp.orcam.me.uk>
References: <alpine.LFD.2.21.2007232038170.24175@redsun52.ssa.fujisawa.hgst.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_192235_383455_6FC33D92 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use an auxiliary variable for the size taken by floating point general 
registers in `struct __riscv_d_ext_state' to improve the readability of 
code in the `riscv_fpr_get' and `riscv_fpr_set' handlers, by avoiding 
excessive line wrapping and extending beyond 80 columns.  Also shuffle 
local variables in the reverse Christmas tree order.  No functional 
change.

Signed-off-by: Maciej W. Rozycki <macro@wdc.com>
---
 arch/riscv/kernel/ptrace.c |   24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

linux-riscv-ptrace-fpr-style.diff
Index: linux-hv/arch/riscv/kernel/ptrace.c
===================================================================
--- linux-hv.orig/arch/riscv/kernel/ptrace.c
+++ linux-hv/arch/riscv/kernel/ptrace.c
@@ -58,18 +58,16 @@ static int riscv_fpr_get(struct task_str
 			 unsigned int pos, unsigned int count,
 			 void *kbuf, void __user *ubuf)
 {
-	int ret;
+	const size_t fgr_size = offsetof(struct __riscv_d_ext_state, fcsr);
 	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
+	int ret;
 
 	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &fstate->f, 0,
-				  offsetof(struct __riscv_d_ext_state, fcsr));
+				  fgr_size);
 	if (!ret) {
 		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-					  &fstate->fcsr,
-					  offsetof(struct __riscv_d_ext_state,
-						   fcsr),
-					  offsetof(struct __riscv_d_ext_state, fcsr) +
-					  sizeof(fstate->fcsr));
+					  &fstate->fcsr, fgr_size,
+					  fgr_size + sizeof(fstate->fcsr));
 	}
 
 	return ret;
@@ -80,18 +78,16 @@ static int riscv_fpr_set(struct task_str
 			 unsigned int pos, unsigned int count,
 			 const void *kbuf, const void __user *ubuf)
 {
-	int ret;
+	const size_t fgr_size = offsetof(struct __riscv_d_ext_state, fcsr);
 	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
+	int ret;
 
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &fstate->f, 0,
-				 offsetof(struct __riscv_d_ext_state, fcsr));
+				 fgr_size);
 	if (!ret) {
 		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-					 &fstate->fcsr,
-					 offsetof(struct __riscv_d_ext_state,
-						  fcsr),
-					 offsetof(struct __riscv_d_ext_state, fcsr) +
-					 sizeof(fstate->fcsr));
+					 &fstate->fcsr, fgr_size,
+					 fgr_size + sizeof(fstate->fcsr));
 	}
 
 	return ret;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
