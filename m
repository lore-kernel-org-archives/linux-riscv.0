Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C17C35FFA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 21:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jGtK8Da+wGm/XQUlNkkrOKwxuYNYyWGookOpJH3tV68=; b=thrUIqRn81PmvtdCUzNUQAW1A7
	fXTc+TQ1bmYBrb82x8ZbN4H5U8QUXeRrgzFBXrDOU85YMY2prnSOVJRzZWXldqryu+OKBmKfPQIB7
	ODnfsJ9m6PjeBaALBGSA8NB9cQiC8Q38Aqw1Ko/TfeYP5o+ywkYjX/w4kUc1vtZHfq8Q+lAg4iQ+h
	PDvDbSOy74f6B4A8HlK/rMfhZYMZW6ILpxVVCMe8ITnrYmxJAcHVzwdPqc+4B38eGRb28iqYhAC2c
	UlgrntVoEVOuEdSXpR5rYUFwrdlBes2TeyVhyZiSS88sxAl2hNDDuedzIMR/7XQ+xHKVFLUsbWJC9
	Dl3+0pAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv0k5-0000000A81w-2pRP;
	Wed, 19 Mar 2025 21:14:25 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv0it-0000000A7uV-1ew1
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 21:13:12 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 82FFD11400F4;
	Wed, 19 Mar 2025 17:13:10 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 19 Mar 2025 17:13:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742418790;
	 x=1742505190; bh=wbTxLXQnu+kcK3t8kl8CXS0pPVmrRRSr8Z/ui3T8w/Q=; b=
	QKele5xqO4BrDkt0JCu/CoVTcfndJfQcP1FmrBYtnkmZ9IzRnwfK+upG4AZSp/8T
	Ou9tIwrmOCrdXT1fe7ncs+LypJ/K/3YdswntnPVVkAmMFmFZNX9/Z+TGjfyah3Ef
	wy88ul0T4nOvX/5tZy1H66DICw/z1HrZW3/NoruaHkHg3BPRE8uS8t0EP/q2Cfm3
	1uAwsE0qIZ47xsbNNm0xNmoUkD+v2oPS4PK2NIapZm+cqeDeCZiWqpV+YSvARLaZ
	RU5wgwnrJ7C8SnwEqZ35+ftVye3YNNDTrFcnQZQ3QQkrrPeuBCVtrqzwZH4TtbBX
	dV129o6uzGpoRzVBdcYDyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742418790; x=
	1742505190; bh=wbTxLXQnu+kcK3t8kl8CXS0pPVmrRRSr8Z/ui3T8w/Q=; b=K
	wFZoY+SDp8jprSdHOnL3YpXU19VM00FQhrpqsIprWtUR9Huo0ZY5wFJ7vD5Ygc0I
	D1rGZnkASLDmW45NrQz5hBvWJdpvI3B3ph09b/tIPy5wzvqxG/FbvppGsIqna97L
	4cqm53DRyHTp/1AvaKjRHEYzbs+8QnN8wk/49D8iuPRFthmxWAiz9wVhqjNyLAUG
	b202ocFCpyNYD4Y3wBRn6VHqi1f8nrwn6Lntr6g/G+/xgexENmosLuuLp2Ds33tF
	zqJyYpDaachvZsS/piWD/byVeNkYWkjXG9nXMG3r3Uu/uvyBIS3OX5vrf6G4PiXC
	4C8X16rDpijgwiBeRnMxQ==
X-ME-Sender: <xms:ZTPbZxdbGEHt7ySgeZOXilxoVwiz8rNlYHsWzzBvMxtBwsBwUKG3xA>
    <xme:ZTPbZ_OOX8yrSUB6e5RqQrYhw2OrBKBU2h1-tbSmEtb9GyU3vJQvifZ7P0xRZlNlz
    l0QjymCwjImRExU8I4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeeifeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghlmhgvrhesuggrsggsvg
    hlthdrtghomhdprhgtphhtthhopegrlhgvgiesghhhihhtihdrfhhrpdhrtghpthhtohep
    iihhihhhrghnghdrshhhrghordhishgtrghssehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epihhgnhgrtghiohesihgvnhgtihhnrghsrdgtohhmpdhrtghpthhtohepsghjohhrnhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepvggsihhgghgvrhhssehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehskhhhrghnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhi
    shhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:ZTPbZ6iHglh7TxpQHaCmmXceUI9lhAXa2jJhUg6UVS9RvRH14mvizg>
    <xmx:ZTPbZ68eOPnm4xU3DVr68vusYHjDD7e4Ab7kmiYK6x7WKDncUNs3mg>
    <xmx:ZTPbZ9sODtDIjiy9ssWBJAy-YFteQupEJfVry1UHVMaoHQ91SBVpgQ>
    <xmx:ZTPbZ5GxH1Sr_bWMuas7HPprZcsbQ0VMAbgIKRLx57EaLQ_I-5SD5w>
    <xmx:ZjPbZ5FKua9k0hYXiGccoQ2TWnsmKH-WNhTetSGDQUBidUiwZmE-a_jo>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 87EE42220072; Wed, 19 Mar 2025 17:13:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T04d17f90b906d792
Date: Wed, 19 Mar 2025 22:12:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ignacio Encinas" <ignacio@iencinas.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Alexandre Ghiti" <alex@ghiti.fr>
Cc: "Eric Biggers" <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "Zhihang Shao" <zhihang.shao.iscas@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>
Message-Id: <2afab9dc-e39c-4399-ac5a-87ade4da5ab0@app.fastmail.com>
In-Reply-To: <20250319-riscv-swab-v2-1-d53b6d6ab915@iencinas.com>
References: <20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com>
 <20250319-riscv-swab-v2-1-d53b6d6ab915@iencinas.com>
Subject: Re: [PATCH v2 1/2] include/uapi/linux/swab.h: move default implementation for
 swab macros into asm-generic
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_141311_500954_BC763CDA 
X-CRM114-Status: GOOD (  11.31  )
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

On Wed, Mar 19, 2025, at 22:09, Ignacio Encinas wrote:
> Move the default byteswap implementation into asm-generic so that it can
> be included from arch code.
>
> This is required by RISC-V in order to have a fallback implementation
> without duplicating it.
>
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
> ---
>  include/uapi/asm-generic/swab.h | 32 ++++++++++++++++++++++++++++++++
>  include/uapi/linux/swab.h       | 33 +--------------------------------
>  2 files changed, 33 insertions(+), 32 deletions(-)
>

I think we should just remove these entirely in favor of the
compiler-povided built-ins.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
