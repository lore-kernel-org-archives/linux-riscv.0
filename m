Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93744C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 19:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+wzERN6Ep2Mrw1onYLGxlCOt2Rbvmxn6GzI+v6SdsP8=; b=ch+ivP8uuymtitY6/qXuaSGViK
	Al6r4lBU1Uzqzg4/jtPUh/pXqFwPamq1pRYk3rkbfSfuYAaW1O0zlkc3Mdq3WWCFvgTjrfYHBBYKl
	lTMbRzX3uavI/aaUWhS0R8vd5nowPGnS3i5FFkP6luWGCg1YZAgI7TmeTa7Hlbx115yBvKRweNfnr
	nVb3/f/PN3B2DhtHOlXIdPbyTFDeRRAHppuZmx6XK+TGs7+CNHDDCR8Z9ouXbQ9zqZNQMThZ9F1p5
	UxYJLQce7CIzxPgbFmutnvh131OflGEVmgtWYFDyTT8AMZmmcMcdV/1kDM73aDmRqQxtZetpN/pu2
	BeNMMGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Srf-00Gd1l-Qb; Thu, 23 Jun 2022 19:51:43 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Src-00Gd0f-Bn
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 19:51:42 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 5DD5B3200302;
	Thu, 23 Jun 2022 15:51:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 23 Jun 2022 15:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1656013891; x=
	1656100291; bh=Ta2sfgEVBXbHwvfylrGMq36CcCTCCgqYt9iAFsgPiXw=; b=m
	y3XZZcx7jaDQYn2lceSDYU3Jrs3ZmrfZ7S3IvMP2kKBH4W/gjLMcS+yqyOkFfDHm
	flmwTrexEh3cXREjqZNrhm1aPqi1tQV8u90LSrTMQFRftcWjK6BMaMTcuR/zr0S4
	FNmf3YTXdxOUCas/YZT/CkD/9OaMHaj7+pnGFtXwy2m4H0YESh3SJJhvgT/QHTww
	N+BQVIql9bg5qtEItZuo9QeHqKZMOR/QtxdBO+m4URtnIFvpKrfX9oX7EOH1K07h
	w4Mr9OVS1x0yPb9nfAgkZN3xr8pWOhGjRymG4HGoDnxX+97tu6Hf9FmYKYT+mLKH
	ibhszMcpa+ALcGHuO+okw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656013891; x=
	1656100291; bh=Ta2sfgEVBXbHwvfylrGMq36CcCTCCgqYt9iAFsgPiXw=; b=U
	nS/hCvhQARDv0Hn7Nen7AbpiR3ZhLSOD4pUiVSdcw4IFrK7QJNhVQGDdcmUZqhMn
	feG8dpuZGqvJebNrPB5wU/dT1Axh0utH5ovc1MPCNs2BGKp8guBPJdn+hahnkZw1
	+JMwYYndBoT5bWF7Jcrrz68h9fkbCUrFN92qhFzhJ/PmYJ4j6kzrwlofHbbEeOwh
	UqP84beeiCZQfXQ4BSuZaDGMyzoyjzf0QYr4plAOfB5t7rLrlHGRRPAgH31Ga+Ca
	SyPorj8rfcl3bGP/zINRNg6EmflUxxvKggHS278i1U5Ash+3fV6IiCZB5JTMEzK+
	LeZMaBWR4UIgOSIO5dK+w==
X-ME-Sender: <xms:Q8S0YncrgodOj5ic46KGBKo0h2vsM_PXBFW_hh8Wo1pyVnlh062xwA>
    <xme:Q8S0YtOHIzEbdZ1sL25YTIp34YLyj8C4C1v3UnI4dPcxs4Zt-Wm_2A0B37UVFenLp
    Y9uG61qde6WNkMkIQ>
X-ME-Received: <xmr:Q8S0Ygi_DABcTTZYZ0V2elxu-TUXS35XhdCTlZNy6wl1lgIj3XbijExmoUXtke807TpEHdu76_JNe8ar3Gh9GjGrky13cUrkbaA654UufZdYsx3O0rUgk5xI2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefuvfevfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnhepieetvdfhjefhvdejgfeguedtgeetjeffgfevtdejudekgfeu
    kedttddvgeeftdfgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhl
    lhgrnhgurdhorhhg
X-ME-Proxy: <xmx:Q8S0Yo_yUclnDE3kgpHCKSbHlXuVGouUqwUt60uJKlrB8VnQnfnJwQ>
    <xmx:Q8S0YjuF6DHjlQAgkB00lQsyauclIgAMjTPYeRk9gb7YZTR63t5SVw>
    <xmx:Q8S0YnFY_qSyHdvWHySPmWgCM6Piw3z258oL_vDJl1FUbVdFoXWSiw>
    <xmx:Q8S0Ys7eCn0euq9eVu9BndG7rAzWEpxVb-kWn2HALTJTN-v_omxb2g>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 15:51:31 -0400 (EDT)
Subject: Re: Tickless timer regression in v5.18.3 on riscv
To: Sergey Larin <cerg2010cerg2010@mail.ru>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
References: <bca6d76d-1708-fede-8008-d2588a14b656@mail.ru>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <8887d851-19b7-ee10-a89e-fb69d54ac41e@sholland.org>
Date: Thu, 23 Jun 2022 14:51:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <bca6d76d-1708-fede-8008-d2588a14b656@mail.ru>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_125140_976457_C81957BD 
X-CRM114-Status: GOOD (  14.93  )
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

On 6/23/22 1:11 PM, Sergey Larin wrote:
> Hello,
> 
> It appears that tickless timer regression was introduced in commit
> 232ccac1bd9b5bfe73895f527c08623e7fa0752d ("clocksource/drivers/riscv: Events are
> stopped during CPU suspend").
> 
> Even though this is a fix for CPU suspend, it causes high idle CPU usage.
> However, this usage is not reported to userspace, but can be observed in virtual
> machines like QEMU or RVVM. So the kernel is not tickless now, disabling NO_HZ
> has the same effects.

The SBI timer extension is not a great clockevent source to start with. It
requires calling in to M-mode/the hypervisor, both for setting the timer and
(without Sstc) a trap for handling the interrupt. That is why its rating is only
100.

Do your virtual machines have no other MMIO timer device? Practically any other
clockevent device will be used in preference to this one. And if that other
device does not have the CLOCK_EVT_FEAT_C3STOP flag, then idle CPU usage will
not be increased.

> Any ideas why this is needed since CLINT timers should be active in WFI?

The CLINT timers will be active in WFI, but not necessarily in all CPU idle
states. For example, the T-HEAD C9xx includes the CLINT inside the CPU's reset
domain[1]. So a nonretentive idle state that puts the CPU in reset will stop the
CLINT (in addition to resetting the circuitry responsible for delivering the
timer interrupt).

Also keep in mind that the SBI time extension is not necessarily backed by a
CLINT. In fact, the SBI specification lists no real requirements for the timer,
such as minimum/maximum duration or when the timer is allowed to stop. So the
kernel has to assume the worst case.

Regards,
Samuel

[1]:
https://github.com/T-head-Semi/openc906/blob/main/C906_RTL_FACTORY/gen_rtl/clint/rtl/clint_func.v#L369

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
