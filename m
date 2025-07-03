Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B54C83030
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 21:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SShW6FhY6qjmHHbJ7zmCamyZ4XzWf24KSvqesmNu6GU=; b=v5sgf0depCLWkHR0rjENnhmcCr
	MY0Ep5DVniSc4hOXIM9usoNJpTuBkv0s51uUTJL05xj3lxZlwbFs6Cyv64gugpWgcWgLpX98m4uuE
	hBBOW/DYiq2oKak7+y8VVv0iw8wHWiwuzf1SHKHvA/jw2+e1lyaA1H37jI856xMR6C1l0SKMPBrHc
	maZ5rXGqGxbz0NnBfK7O7iYJOKCyH4R6x3MT/KGtOhNeG3PxgD9V8CLk99VSRaGGRhhTMujmLJdEV
	i4Rd04jAAtPW4VCrF04dGEixgAG2NkIKflG5XRiHKpCt1vXlBwRrBhE6ZKdvWDxan+nP79/oaGO89
	ZRkMsn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR2N-0000000CXbm-1BwO;
	Thu, 03 Jul 2025 21:00:07 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXN1Z-0000000C212-3AfB
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 16:43:03 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3B58F14002E9;
	Thu,  3 Jul 2025 12:43:00 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 03 Jul 2025 12:43:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751560980;
	 x=1751647380; bh=8aHcjkC1vBbFHOk6YcAdLSw+GHoVCfk6IHr+e/5583U=; b=
	CbTS/0O59R8Cr4Ad9SWLxJXjM8Bv+cTdBCk1BO9JfEXPrUDfj1NLppd1FmyGiLNV
	KPsOD/NlMrhXi+vArXxAU0W7QyirbU8diItNb68P0bS+zA0OKp5/vLTU+lc6uaZa
	2etnv39VNt18xQ7CmqMVkXnDraIwAuWIuYpPZBVqmryCOnPuno5yjrqsQY9MqzgW
	oXqdBvvvOTDoJrE4ooKgarYR9iFEZ+p4t1+YdHYsCmA5DIGHIOjQS/vbfM3v9BPQ
	Lx2lx7Bl2fDJXIaB2CM7E8PC3JUA4bPWi0WAuBLWMIV+2YLXsvsznsOz1SqjJr/H
	PWpcj7kdiboQDQjqWxZsVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751560980; x=
	1751647380; bh=8aHcjkC1vBbFHOk6YcAdLSw+GHoVCfk6IHr+e/5583U=; b=I
	jqWG0RZcN9q+snlWCGD0zO7MBeE9lsPF4uFnEFpPv7RppAJMgrY5i663ojpdKh98
	zJ22v5GaD4qV33IS7f7RKLcXKfF1qfWsk+fTmpontyotc6CI/9aFM/3hzbkbFfnJ
	Yw2BqAky0ty8dM1+XkmtBVSoosXHf9ay1Bq8q+nn9eCMHd3+RcwZNWf6wJfRCq/4
	aMvxleNgcG54tXZD20krQnRUQWsaFriRjmcndjuzGrCy4nzypzqV/UIwumUi1FU5
	QTS43jLgy7xm6P0/9NyjKVKx4ZxxgQYtTLgP7YLja7+E7lx7ptryG5ezmAWqDrlV
	02dVtE9fRXp0IC/p3wAYA==
X-ME-Sender: <xms:EbNmaAGJOktCXY08HIcUyu9ZXXNz2_zmCzYPiwZR3FkYRtfF7eDwHA>
    <xme:EbNmaJVX5RFBdZHxslupYa0zRaydp4WyewbtID5rsxz5DsPp7-pH_SBwIY5nDjKsL
    Rh4kMW_x7k1HMqJX-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsggvnhejudejsegrnhguvghsthgvtghhrdgtohhmpdhrtghpthhtoh
    epthhimheitdelsegrnhguvghsthgvtghhrdgtohhmpdhrtghpthhtohepphhrrggshhgr
    khgrrhdrmhgrhhgruggvvhdqlhgrugdrrhhjsegsphdrrhgvnhgvshgrshdrtghomhdprh
    gtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhu
    segvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheprghlvgigsehghhhith
    hirdhfrhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheptghonhhorheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodguth
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:EbNmaKKAEpYwzXcZaSrWRIwGFo3mM3jbbggGC-GhAbHTniCGP_T-aA>
    <xmx:EbNmaCG9rdvUQTq8-80tdurHDf6kVeG2RHPEexRpK5FsxHi7SptfQg>
    <xmx:EbNmaGXxlNXp5V0VQF2p0gqYZnY4BK725hY1tGDvAunzZ9n1YHff2Q>
    <xmx:EbNmaFMiTmF4cKXs_HmKU2qjGMRXNwKTlqfdo5ZJyZHclMgEDMTixA>
    <xmx:FLNmaK6rhYxID1-tY6xW2Q4HhjF2vDA2o80rX-cjDIGYkqtMT5uyX9EY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B4362700065; Thu,  3 Jul 2025 12:42:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Te44b159e2532e323
Date: Thu, 03 Jul 2025 18:42:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>
Cc: "Ben Zong-You Xie" <ben717@andestech.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Rob Herring" <robh@kernel.org>,
 krzk+dt@kernel.org, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, tim609@andestech.com
Message-Id: <f09dc88e-68b1-44dc-9761-724e64d1a5f1@app.fastmail.com>
In-Reply-To: <20250703-exposable-exes-fd41e7318fba@spud>
References: <20250602060747.689824-1-ben717@andestech.com>
 <20250606-booth-icky-b416c1827a43@spud>
 <aEbOLztcBsKs84pn@atctrx.andestech.com>
 <20250609-donut-oozy-4dcc8b8a292d@spud>
 <20250609-twiddling-clamp-eaa0dd2b1cad@spud>
 <aEmrHPd7RxUSOLAY@atctrx.andestech.com>
 <20250611-tapeless-arson-a6ace3c42c00@spud>
 <352681c3-88ca-4122-9ad3-0a0ef33caf7b@app.fastmail.com>
 <20250703-exposable-exes-fd41e7318fba@spud>
Subject: Re: [PATCH v5 0/8] add Voyager board support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_094302_304615_F2A890C6 
X-CRM114-Status: GOOD (  17.49  )
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

On Thu, Jul 3, 2025, at 17:53, Conor Dooley wrote:
> On Thu, Jul 03, 2025 at 05:32:08PM +0200, Arnd Bergmann wrote:
>> On Wed, Jun 11, 2025, at 18:21, Conor Dooley wrote:
>>
>> I'm also planning to have multiple new SoC targets in 6.17 and
>> would put them into a separate branch that does not contain the
>> dts changes for the existing SoCs.
>> 
>> For the pull request that Ben sent, there were a couple of
>> mistakes, I'll reply on that separately. It probably would made
>> more sense to send the patches to soc@lists.linux.dev (note
>> that the soc@kernel.org address got renamed but they still
>> both work) than to send a pull request this time.
>
> Is that a general comment btw? If there are other people coming in with
> new platforms should I ask them to send patches to soc@lists.linux.dev
> instead of a PR for their first time?

It's mainly about how comfortable the new maintainers are with
the process, in this case it was clearly a bit too much for
Ben to get right at the first time, but others are more
experienced with sending pull requests to kernel maintainers
already. Since the patches individually are all fine, I could
have just applied them, but the PR ended up having too many
mistakes.

The one thing that is special for a new platform is that the branch
can mix things that would otherwise be separate pull requests.
Sending this as patches means that I have more flexibility to
apply it either into a branch for the new platform or split it
up as normal.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
