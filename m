Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7BAC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 23:22:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AD1C20792
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 23:22:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BsC7CD4c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="AEjLtKGz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AD1C20792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MXRTpYVGAvQlrnvV415GeWfjvieRf146ckpD4r5o5sA=; b=BsC7CD4cd4tzprlrlTttCKZVw
	LYIA/DwWipTGpUm3iM1h8+5ZBA6mu6A7TuY92MEVaeKVVq77dsMoUzCTJNoQMcDJ+7XeAOpzltvmg
	qplKLkkd2ZVUe2S3yMqwUR950oZp20n/DMUSkzSMtECAA1fFiFBOItoqTBkz16naYz0EFV/HPDcLR
	xg59f9V5BGlNsgYyfHDhdd3XMi3TNAeH4zrHXY+0aBn4G6aWOeK5XUGV/K20lQkSGfVrxOLFPciy0
	UqtS3bsHUpaFa1G8g7U0wvs6o9uHxEGzMdWi+A+u2DBLHrYA4/2IJb3E0f/QE5AAE6bbQCqIQUwRQ
	83gM5bjzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jykXe-0007uZ-Bj; Thu, 23 Jul 2020 23:22:22 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jykXb-0007ts-TZ
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 23:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595546540; x=1627082540;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=/iyoglcxkS318Sg6qJHiPt3/SwDfA+JjozFFVeV5pMY=;
 b=AEjLtKGzsAnUH0VWry/APGqsO5NHhz4kUSuFmcQA/S8xcAvoI5IenjtY
 6PxuSYlvdD5oarg1J0MprxtdwPLUQMImcGT5L2nue1HIAuzGER9y3b1ba
 bu4IXqDr4T8c2OzRrpCCqut/JuoGVWys8odWCQ1Jm7rx6zUOYoq5l2JuL
 B+erpQ3in5RRRlw+FfOtOiO8F2sx9yfn+drtB2SarwZKuhIpHxJGIHg2v
 afzBe6B+CazhpbVC3V35gA/v8P3o5gZstWsyN1KDAcc64bBM3ZFwNJw93
 az1nxiw3wFxgsJqAK5Q+k0y93OXtjh1lg7m5yAYOM27VdRzMJ28KS61xC w==;
IronPort-SDR: AtRQSryKSBjn0SrImj8jcb/WfO4O2SBEWpCmGPlcH6bySVVYKXzSTPEZG3hV1zdjJVn96JgvHb
 b7NsgBjWoMkGk3YfrYhba8XOr33zFQkuB2+W40AOTFdAh7KH2X0105U//UfUObNMHLMtelTusu
 bukCImUZBCRVLBRqTXLw08VvQofc1kuL9cMpUzvdsu0qA4A671Md/aF0A/tkFYCotjNg5bh1Lv
 aH34Z07V9PiO368wdZMuvCxZ84NwD5bBVvUEt6oMYXfpiSX3XU2ViBonnreMrSleXf50o6dSuu
 vXs=
X-IronPort-AV: E=Sophos;i="5.75,388,1589212800"; d="scan'208";a="147549737"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2020 07:22:19 +0800
IronPort-SDR: qy7KMCgxxdvCwEbR7THAMMhxI44B05RyN1EVs7dGb21YR0SYF3N2vAMqKwj5JD3KGVPFkILURb
 piakecw5GhIozUZ/DF3n/8ghj0lh8O9U0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2020 16:09:58 -0700
IronPort-SDR: jN5CtwZpnd+5N/goMHUWZJYQbmHItg8c2A91kwQxZACRbomktFOQsOgxQ5XD6qEzTP31o6d/nC
 A3tRmg5flFsg==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2020 16:22:18 -0700
Date: Fri, 24 Jul 2020 00:22:15 +0100 (BST)
From: "Maciej W. Rozycki" <macro@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] riscv: ptrace: Use the correct API for `fcsr' access
In-Reply-To: <alpine.LFD.2.21.2007232038170.24175@redsun52.ssa.fujisawa.hgst.com>
Message-ID: <alpine.DEB.2.20.2007232213510.4462@tpp.orcam.me.uk>
References: <alpine.LFD.2.21.2007232038170.24175@redsun52.ssa.fujisawa.hgst.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_192220_155151_E8A48343 
X-CRM114-Status: UNSURE (   9.99  )
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
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Adjust the calls to `user_regset_copyout' and `user_regset_copyin' in 
`riscv_fpr_get' and `riscv_fpr_set' respectively so as to use @start_pos 
and @end_pos according to API documentation in <linux/regset.h>, that is 
to point at the beginning and the end respectively of the data chunk to 
be copied.  Update @data accordingly, also for the first call, to make 
it clear which structure member is accessed.

We currently have @start_pos fixed at 0 across all calls, which works as 
a result of the implementation, in particular because we have no padding 
between the FP general registers and the FP control and status register, 
but appears not to have been the intent of the API and is not what other 
ports do, requiring one to study the copy handlers to understand what is 
going on here.

Signed-off-by: Maciej W. Rozycki <macro@wdc.com>
Fixes: b8c8a9590e4f ("RISC-V: Add FP register ptrace support for gdb.")
Cc: stable@vger.kernel.org # 4.20+
---
 arch/riscv/kernel/ptrace.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

linux-riscv-ptrace-fcsr.diff
Index: linux-hv/arch/riscv/kernel/ptrace.c
===================================================================
--- linux-hv.orig/arch/riscv/kernel/ptrace.c
+++ linux-hv/arch/riscv/kernel/ptrace.c
@@ -61,10 +61,13 @@ static int riscv_fpr_get(struct task_str
 	int ret;
 	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
 
-	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, fstate, 0,
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &fstate->f, 0,
 				  offsetof(struct __riscv_d_ext_state, fcsr));
 	if (!ret) {
-		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, fstate, 0,
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+					  &fstate->fcsr,
+					  offsetof(struct __riscv_d_ext_state,
+						   fcsr),
 					  offsetof(struct __riscv_d_ext_state, fcsr) +
 					  sizeof(fstate->fcsr));
 	}
@@ -80,10 +83,13 @@ static int riscv_fpr_set(struct task_str
 	int ret;
 	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
 
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, fstate, 0,
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &fstate->f, 0,
 				 offsetof(struct __riscv_d_ext_state, fcsr));
 	if (!ret) {
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, fstate, 0,
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+					 &fstate->fcsr,
+					 offsetof(struct __riscv_d_ext_state,
+						  fcsr),
 					 offsetof(struct __riscv_d_ext_state, fcsr) +
 					 sizeof(fstate->fcsr));
 	}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
