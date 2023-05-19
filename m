Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5508C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 20:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EyfnxLz/huigp8R5f4BKe46YFyBMBus9azil9z3NGVY=; b=D6wWKD1I9ZjROk
	1JPnfjDrWXrzPoil36O/ZEw0I9bQiBaWA/vU8dCo9OuxM6X0DjTYolQGTv4OnRlOoRfZNOntjVHRy
	Cvwzhd74Br0GW59tWodCQTOThEtB1BzEdXra0bX63lzcXSctWWm4DgUwbXOBaZQErxy6fEYa4Dltx
	My2iiUDyrrFKnchUt+/p4TRt7vKPiW9McYgFyf3gIu6Z/UafZKT6roRnqlSoAMdwI4qcygIVyS+G0
	+jZz5wf6tX8kPxAg9AX0UsqF+alx61o9eWluWPGjOCIfxkuMdf9HiDyYCl519nYU6ORVoaR00qaAN
	zW7MJ8OSNUQd2O3CoXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q06av-00H9ya-1y;
	Fri, 19 May 2023 20:20:57 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q06ar-00H9wx-2f
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 20:20:55 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id E987432005BC;
	Fri, 19 May 2023 16:20:43 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 19 May 2023 16:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1684527643; x=1684614043; bh=oI
	JfFfhJfrFit/dFRNXoBCxBw8LbYIGZS18hb/Tgxjk=; b=f3ZkNvTprv0bWj9ozZ
	MdUK0zGhSmAyXcHmPJ6qbVfWmrpn3ByC9jsOzGIt4lKARxpzUUcjWsRHAlg2GjCH
	pS9GwC5PGcSdbYlgqvAp6YCdagg1X2xpGiarYWp4uzU5Uy2sQNPRVnl+ZM7a1gPh
	TtnAzTuHoKqS+giSVNNvxMNoTFNcqyC/ZbvA1UPF+6ei4TAhjpJ0AI6D8XxJWE6B
	VKOoI+DUB3L0IQCHLDk8LxfY5snJzRXoDPRzzJaralCKAfswbnzNqmoRuTcA/xdH
	waV6docyZYaW1KGzTA493KL4uOZHU8q/ASjCHRmYvCSW11G/xcs7kSVFgTZ2KimP
	rEuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684527643; x=1684614043; bh=oIJfFfhJfrFit
	/dFRNXoBCxBw8LbYIGZS18hb/Tgxjk=; b=aoLi/APTXljwnO2BmJWbRFXr53n9v
	Y77nUM8qaiD720EcWMgd3IWkinmqH2o/XLRxlBPBHsABVkmfjWi1SibnzYbQTpCx
	dIA7bBwAuMpuT5LkgDRk63zVBsY3E4lRzLM0TrDF1+xZRwRF9GxNMV3yW3/dwSMJ
	Sv1g0p3SP7ossBoVOxBVU3Vr2fIrjdvUJGBJDGtJAcL5bbTmru0z2qBdnBSOcPrg
	JYwm3E/mSSiVoOmTCHDH400EBVJrjXjvJYuZHi3Lx55guFf/m1KzACMlxnseGm4E
	clVPVf7kgUYP7vXhr0vhuI1USkheTKxrBXUOlCPODBgiNt1LJAbAADyLw==
X-ME-Sender: <xms:GtpnZPsxN_NS7FgRT4VuGEonfEAEgCmFwlEy4aXR26x03pLGsukSTA>
    <xme:GtpnZAfmwSpNBHpf1uZE5AodjZSIK93uaJaV6fwUhFD-c_M2vArf0dRn0UqAQaQvc
    JI5dYNc9JHHB6g-pss>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeihedgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:GtpnZCyTDYF6Bch9LxKQea2EqL2sMI-H81L0z21W46lU3wj6DrHsKQ>
    <xmx:GtpnZOOddD43qO_tabxl4BLNVwVtBjAJPoPJcOZ-k1n14_-tNr1DqQ>
    <xmx:GtpnZP_vCAGbxyA16iJIz8aQsjWkRdmBh6hLxW-y6YOTJ6uuUT_q5A>
    <xmx:G9pnZOfkGqiHQtYDuLtcDpE1vCg3IaArb5e9xelrwhm26lH9XNc_Vg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 07D16B6008D; Fri, 19 May 2023 16:20:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-431-g1d6a3ebb56-fm-20230511.001-g1d6a3ebb
Mime-Version: 1.0
Message-Id: <b3689d7f-1a78-46ea-8e1f-48bc080ce993@app.fastmail.com>
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
Date: Fri, 19 May 2023 22:20:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: guoren <guoren@kernel.org>, "Palmer Dabbelt" <palmer@rivosinc.com>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Jisheng Zhang" <jszhang@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Anup Patel" <apatel@ventanamicro.com>,
 "Atish Patra" <atishp@atishpatra.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Anup Patel" <anup@brainfault.org>, shihua@iscas.ac.cn,
 jiawei@iscas.ac.cn, liweiwei@iscas.ac.cn, luxufan@iscas.ac.cn,
 chunyu@iscas.ac.cn, tsu.yubo@gmail.com, wefu@redhat.com,
 wangjunqiang@iscas.ac.cn, kito.cheng@sifive.com,
 "Andy Chiu" <andy.chiu@sifive.com>,
 "Vincent Chen" <vincent.chen@sifive.com>,
 "Greentime Hu" <greentime.hu@sifive.com>,
 "Jonathan Corbet" <corbet@lwn.net>, wuwei2016@iscas.ac.cn,
 "Jessica Clarke" <jrtc27@jrtc27.com>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, "Guo Ren" <guoren@linux.alibaba.com>
Subject: Re: [RFC PATCH 00/22] riscv: s64ilp32: Running 32-bit Linux kernel on 64-bit
 supervisor mode
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_132054_095022_53B15DF6 
X-CRM114-Status: GOOD (  15.90  )
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

On Thu, May 18, 2023, at 15:09, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> Why 32-bit Linux?
> =================
> The motivation for using a 32-bit Linux kernel is to reduce memory
> footprint and meet the small capacity of DDR & cache requirement
> (e.g., 64/128MB SIP SoC).
>
> Here are the 32-bit v.s. 64-bit Linux kernel data type comparison
> summary:
> 			32-bit		64-bit
> sizeof(page):		32bytes		64bytes
> sizeof(list_head):	8bytes		16bytes
> sizeof(hlist_head):	8bytes		16bytes
> sizeof(vm_area):	68bytes		136bytes
> ...

> Mem-usage:
> (s32ilp32) # free
>        total   used   free  shared  buff/cache   available
> Mem:  100040   8380  88244      44        3416       88080
>
> (s64lp64)  # free
>        total   used   free  shared  buff/cache   available
> Mem:   91568  11848  75796      44        3924       75952
>
> (s64ilp32) # free
>        total   used   free  shared  buff/cache   available
> Mem:  101952   8528  90004      44        3420       89816
>                      ^^^^^
>
> It's a rough measurement based on the current default config without any
> modification, and 32-bit (s32ilp32, s64ilp32) saved more than 16% memory
> to 64-bit (s64lp64). But s32ilp32 & s64ilp32 have a similar memory
> footprint (about 0.33% difference), meaning s64ilp32 has a big chance to
> replace s32ilp32 on the 64-bit machine.

I've tried to run the same numbers for the debate about running
32-bit vs 64-bit arm kernels in the past, but focused mostly on
slightly larger systems, but I looked mainly at the 512MB case,
as that is the most cost-efficient DDR3 memory configuration
and fairly common.

What I'd like to understand better in your example is where
the 14MB of memory went. I assume this is for 128MB of total
RAM, so we know that 1MB went into additional 'struct page'
objects (32 bytes * 32768 pages). It would be good to know
where the dynamic allocations went and if they are  reclaimable
(e.g. inodes) or non-reclaimable (e.g. kmalloc-128).

For the vmlinux size, is this already a minimal config
that one would run on a board with 128MB of RAM, or a
defconfig that includes a lot of stuff that is only relevant
for other platforms but also grows on 64-bit?

What do you see in /proc/slabinfo, /proc/meminfo/, and
'size vmlinux' for the s64ilp32 and s64lp64 kernels here?

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
