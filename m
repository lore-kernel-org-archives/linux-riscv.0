Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB5DC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 17:34:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C8F4214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 17:34:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZavdoJg+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="G9OL4EKN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C8F4214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlGIdr7KU+zClvzvOSXx94gGeE5TBYdOUyjZn6Nk90I=; b=ZavdoJg+1Gm/HV
	PtmrrC/mGj6thM0CoZJkC7rxN1GybpDerHEuWkHkAPo5j73n9u1kS6Tgi5/S1tDtm1CYZWnnJOU/Q
	bAvVWNnTk3a+dUSBDmdhnsIgAkTQiYzTH44QzgWDIV5DUnwo/6IpJOgyFfH4SuVP9lv8hJBamaz75
	CaWv/4aUFiq3BSEY1QenE9wk0caf61GBEzloP/zJ7Z9JBS/dv86YnNV0jbCR+Jth9hQCQ6NNxfCIJ
	OVsg6SMd/CI/D5EwBb0gKrSeEVEzdLUkeObhj3LmC8aJI7hpXimFpFCfIHe9jp7/QtS8odtoLM8eu
	IjVMNhZ5NX+VFf1X8sBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3lIE-0003Cw-CT; Tue, 12 Mar 2019 17:34:22 +0000
Received: from a9-114.smtp-out.amazonses.com ([54.240.9.114])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3lI4-000334-7T; Tue, 12 Mar 2019 17:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ug7nbtf4gccmlpwj322ax3p6ow6yfsug; d=amazonses.com; t=1552412047;
 h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:Feedback-ID;
 bh=QH7GtpktfdsmBci5GfZg6GZFoef6FE7b2GoJajqaQXU=;
 b=G9OL4EKNECsSO02e+XsdN33wrcKt0XbRxfII0V1wlTJqjyWlGf0DsfYpSDnTw8W8
 PUJ7O/4ze4MMvk4RxodLGOfVL4Z7HEJlwIks8KCOSZHAiE5fkG40UysP9wvMx1aPLQk
 xbpxrG65GkdCif5LwQKh4DeOxIQ5xmfk2IjhqIng=
Date: Tue, 12 Mar 2019 17:34:07 +0000
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@nuc-kabylake
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <alpine.DEB.2.21.9999.1903120736210.26459@viisi.sifive.com>
Message-ID: <0100016972f7f704-8959dbdc-c3cf-4e23-820c-a00670216de9-000000@email.amazonses.com>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
 <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
 <20190311164837.GD24275@lakrids.cambridge.arm.com>
 <alpine.DEB.2.21.9999.1903111110520.11892@viisi.sifive.com>
 <20190312112349.GA35803@lakrids.cambridge.arm.com>
 <alpine.DEB.2.21.9999.1903120736210.26459@viisi.sifive.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-SES-Outgoing: 2019.03.12-54.240.9.114
Feedback-ID: 1.us-east-1.fQZZZ0Xtj2+TD7V5apTT/NrT6QKuPgzCT/IC7XYgDKI=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_103412_346866_43BB0D0B 
X-CRM114-Status: GOOD (  13.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul@pwsan.com>,
 =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, will.deacon@arm.com,
 catalin.marinas@arm.com, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 12 Mar 2019, Paul Walmsley wrote:

> > Similar cases apply within SLUB, and I'd hoped to improve that with my
> > this-cpu-reg branch, but I didn't see a measureable improvement on
> > workloads I tried.
>
> That certainly suggests that all of this could be much to-do about
> nothing, or at least very little.  One observation is that some of the
> performance concerns that Christoph is expressing here may be about
> ensuring predictable and minimal latency bounds, rather than raw
> throughput.

The performance concerns are mainly when scaling RISC V to many cores
which will create contention for counter handling. The scalable counter
system (ZVCs) was developed to address these issues and later the this
cpu operations where optimizing that performance.

At this point on RISC V with just a couple of cores you may not see too
much of an effect. In fact a UP system would be running faster if it does
not use these schemes since there is no contention. Scalability of counter
operations becomes a challenge as core counts increase.

> OK.  I have been assuming that the risk of a scheduler call in
> preempt_enable() is what Christoph is concerned about here:
>
> https://lore.kernel.org/linux-riscv/b0653f7a6f1bc0c9329d37de690d3bed@mailhost.ics.forth.gr/T/#m6e609e26a9e5405c4a7e2dbd5ca8c969cada5c36
>
> If is possible to eliminate the latency risk from a 'simple' counter
> increment/decrement by creating a restricted API, that may be worthwhile.
>
> Christoph has also been concerned that the AMO operations will carry an
> unacceptable performance overhead.  But the RISC-V AMO operations can be
> written such that they don't have the ordering restrictions that the Intel
> LOCK-prefixed operations do, and thus those concerns may not apply -- at
> least not to the same extent.  Perhaps this is also true for the ARM LSE
> atomics.

My main concern at this point is to ensure that RISC V has the proper
setup for the future and that decision are made that scaling up of RISC V
to hundreds of cores (if not more) does not become a bottleneck. One of
the use cases here for us is likely to have extreme parallel operations
for HPC style compute.

The main issue for the core VM is to limit the overhead of the statics and
counter operations. Introducing atomic operations in key fault paths has
caused performance regressions in the past.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
