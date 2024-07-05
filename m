Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC18C30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 10:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vpp4gbMXxDvoVD82wd6V0Q0VmJRp0XxMne+4fMmG5vI=; b=ji2PykaHJkvkNv
	rIbEvj6+DUOj2u3no3L3aKDcbz6Kzucn+3G/jharyCVQaGtl9dI3luV6g2JWzzMW/TW+QO//L5jrP
	aXUpocBG8nJArabtUEZMMBY9RG3suyNcId2bi+hbKw79TFFnVxiNBg2keSqfduta/0aJmmOPLQqYh
	uS48QX4r7XNwXZavqkNaZ1Omvu0Rh2mqmqwrQGnuoQoNNKo1alQz/KN62vI+b0d1unajr8Iw1Nd0K
	sCh3H4eR+v0DoMiCRFDI/1VB23dz8FN4AYD7mGK8TXGaPeFNc7rhD1+8rAjxCZuuEQPyEErIRieFI
	RWmQv27PAjhbBuZz6izw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPgD3-0000000FeOa-4AgH;
	Fri, 05 Jul 2024 10:30:33 +0000
Received: from fhigh8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPgCo-0000000FeIa-1sE7;
	Fri, 05 Jul 2024 10:30:20 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 6004F1140275;
	Fri,  5 Jul 2024 06:30:15 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 05 Jul 2024 06:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1720175415; x=1720261815; bh=0BgwcyYVzV
	oWvDg1RD6E7vJTPHk03GlivOzQH40VODw=; b=O/EHh3RuZcTx3qDtbU4nyccmFZ
	tTOdX037S98MZOEnDQsOPMGt6Lq3m4gsNjmdB7/2jiLzukoStDpKSI/tGMfvQ6xs
	srVco6iMb3vIbvMqw5X77jtHys2nL/qhhD1PEz+Bg9AZaAroDDgtSyJ5PH1hGlos
	nw3KAYGBHh4ZojJUtc/Psh7/xwrtvlWTfGho9SlZGJU7HZDJGMJEKgxu4kPXs1Tu
	WHc7flZ2IjaE4iOlMzkcXDHJQJOZxsrjp3J+ZwizWcCMr3gA6z3oY6o2gfxaDCVT
	d5t0PTQF3Q6mZAkCSbsfi81WESbnI0Q3XKU17iGzmfXt4DS3CtgQ71tyWgOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720175415; x=1720261815; bh=0BgwcyYVzVoWvDg1RD6E7vJTPHk0
	3GlivOzQH40VODw=; b=M/wNXcgt6NFUUVIGStmiaQaluZawsrLN8ZvRLRCCZsfy
	F0WxZ64Y7y7vLBgMatyOUKLjWUrND5d4ABIygpuq3n9hiOezrf2/tNIhs8tCECJL
	9pbUV0rMReilzJUrwMkfhOAaLVbZleKL5n6jOXKXG5ydef7xgtjCifAjGqJts2kv
	zNo73v+73HswXZ3YKgS1gpxzIjdt5vZGHP5NR03xlTyi24O4NYexmSsqCE4OlxsA
	CSkrMANci32zquzD6pbxDF8xdWHYXR8wc1It7iq24stsFDS151RDT75gsUug6W4n
	jjCoFYhcpQX3bs/+Arp2hrU2BhQFmbcT5JI4/s6nYA==
X-ME-Sender: <xms:M8uHZtXxZgEnC7dJkuQgtJLMTie3hiSNQRQIK5-0RPPBBJbtH2jq1A>
    <xme:M8uHZtlxbAReuvNXstJeBpLnlxuPxmANBwa0rPdSsMVYTm50x4nMPPEfCGJlSKgU6
    J4rtIzoF_LRgxRZWzs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:M8uHZpbH4WkJ5osvgGk3AKjBODw6RhhpnJ7akc20RK4X0PT9b5X8JA>
    <xmx:M8uHZgUrnkXBeGIxHueMC39J03oZWjGuuSxvedwWIp58BlMVsVqHAw>
    <xmx:M8uHZnmT3vn8mmQa-ixoQCXFJoM7flSrSkhkz8fZBP8w4wUzJN7ZVw>
    <xmx:M8uHZtcctr51KMWlegX-Kwb_Qi2ZbgcBOvkG2AFeT2ygegRNnu5oIQ>
    <xmx:N8uHZo7APVUulbUymCX_R30UFUPRJltjifqXXpKVgmxgy-5ev2-2zdo_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7DCF9B6008D; Fri,  5 Jul 2024 06:30:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
MIME-Version: 1.0
Message-Id: <3294e24c-565d-4688-ba6a-4bb98a2ef65f@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2407050323400.38148@angie.orcam.me.uk>
References: <20240704143611.2979589-1-arnd@kernel.org>
 <alpine.DEB.2.21.2407050323400.38148@angie.orcam.me.uk>
Date: Fri, 05 Jul 2024 12:29:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, "Arnd Bergmann" <arnd@kernel.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, guoren <guoren@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>, "Dinh Nguyen" <dinguyen@kernel.org>,
 "Jonas Bonn" <jonas@southpole.se>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>,
 "Stafford Horne" <shorne@gmail.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Christian Brauner" <brauner@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 00/17] arch: convert everything to syscall.tbl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_033018_747882_3E0A3D14 
X-CRM114-Status: GOOD (  10.04  )
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

On Fri, Jul 5, 2024, at 12:18, Maciej W. Rozycki wrote:
> On Thu, 4 Jul 2024, Arnd Bergmann wrote:
>
>>  arch/alpha/include/asm/unistd.h               |   1 +
>
>  This seems out of sync with the actual changes, any idea what happened 
> here?

Sorry about this, I was writing the series description while
still doing some treewide tests that showed I had missed a
change in a rebase. When I originally wrote the clone3
patch, alpha was still missing clone3 support, so I added
a line there to mark the syscall as broken. The current
version is based on 6.10-rc, so clone3 actually works now
and the patch I sent no longer needs to mark it as broken.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
