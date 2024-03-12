Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6218CC54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 13:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxwP3/P0a68n3pLWRR49EPZPAUWtmv8PwDyXJv4VIbk=; b=Fh9gvuItxXn6GI
	ZyFLuU8kGX1TBiym8fEoJC6viCiyxWuM/42+A1xbMyZoEeeh/phwjyhEPTSXQpoQAPCpwGxDJKFjX
	/JJggACZ962yEm+aajlEuM0xcUHZVt2xiwmbICLnGOJXKWWdcVhUnPjj0Xq7SxWK/Eebn5kxI3+/R
	ER0YBRCJUJMdLdEss3/H0dRLYOEJcuDch58eqeM5J+AFZHxrIq7uCixdZprgqZ2spGNY9aoL3m626
	ESj420/3iZKJGHCNDB61gfG/Uq+NjtWnEd2+qTb9I4xfZGJ5C4r0mX/xV1onmv9O6IE2/qeF6GeKj
	OWtp0yyfvlHt8JFmzx1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk20N-00000005tpq-2b5A;
	Tue, 12 Mar 2024 13:17:19 +0000
Received: from wfhigh2-smtp.messagingengine.com ([64.147.123.153])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk20K-00000005tnS-1AK2
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 13:17:18 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id 0B7741800092;
	Tue, 12 Mar 2024 09:17:08 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Tue, 12 Mar 2024 09:17:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1710249428; x=1710335828; bh=asf+1Teary
	B0Mt2U5DDKAfe5BW6dSv7E0Ip+c/SYQT0=; b=TRm5QlEIkPvJBdikZMX3pANOzv
	I51RwVOMKP8Ipj/xGs/FIwxrKU73K7Ahdn5vb279m3hQZ9HoLQ/m/N6nSzRpBa4p
	hcBmedvL6/1QvNNAIobCUfgynkFHRSUgSC2MCsOZkjC/Crhe8TKXOPh8IwY2ZT3U
	kQSwAud8afaZr5VziqHiVpRMhDg6+umHaXSszDTCyDy+CcJ+56VOVOjS3qdQHKTi
	M59B/PFPk13NVP5mzX0HbxspgZR+cLPfvM9SXWzLuugQ6hXxdxFQFysw+7Ta8F2h
	jk41bFA/HCE9K14JBgltMYbpKvOBGHIn5lv2CVqFxs9ZQu6/q4OUAVEB5Q+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710249428; x=1710335828; bh=asf+1TearyB0Mt2U5DDKAfe5BW6d
	Sv7E0Ip+c/SYQT0=; b=nylNbGUbtDEZP/ilcV9PUdbzHik1fG9noc68TmcgO576
	+G+t5jHxGeJqmOuZyK+RgwwY8Ddvwby4ihBhStbB48wN6RgkOQdK1LZy8ShVnR4v
	iO8emjVPDM/2IeBGh6bJJuDnu+DimZ5pwM6mBRYAIL1gdCPAMVu3hinwgl/tC2zV
	Ma7B6t1R89aAF9vvV40Io4psC7xtOwe0oWOa0/jghTpvZzCSBg631QMzvsE9wJzg
	E8+J8T7lLyRbBL+ZMFEpOflNqNeKJsMqotRNO5wbUaLAWLCOpC/RrLFf4kg/7uD7
	98eDarEHrHnIiEfco0O8byMS/WR8Prt5RdWlPFsOkA==
X-ME-Sender: <xms:01XwZcQA9Rmx8KonHNX3ptDk7yfv0Z-KX7OJuoK-eWOii1vq2aU0iw>
    <xme:01XwZZyHpyD5759uaPk2I9ROr_bIJsHcayRQHHqMfFMRdlfzyxdFdB1mh_pF34ovz
    SRyiyc0fF74y2fOuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfuthgv
    fhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefhveettefhteejgeejheejheeijedutdefveettddvtdduteff
    uddvgfegfeegueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhinhhfrhgruggvrg
    gurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepshhorhgvrghrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:01XwZZ09W65RPz9E1x_s4IYGI6YOeGbEK1hmRQtyKoSVTJ-0Ic-bMw>
    <xmx:01XwZQC2021zp3AO2bzhBRKmQDfV8feXzoP4drpXyKB-dqBtsgxTqQ>
    <xmx:01XwZVhC7PyNe8t7eBxRQt5NoZ5LyWiS4BUcqK1kc40Ba6dtBFMsVw>
    <xmx:01XwZcrrOe6gq9lF6jYSAXLVxJrKV6xCWaatwNWjXQWMICg-mbS0nA>
    <xmx:1FXwZeYkJARjDWPegGDZlREPWBbxaTk9Wl3osb0pkHIUrIGgA9RXyLa4OmI>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8DBFA1700093; Tue, 12 Mar 2024 09:17:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
MIME-Version: 1.0
Message-Id: <7f968290-2ca3-49c9-b76a-04849abb637e@app.fastmail.com>
In-Reply-To: <20240312123627.9285-1-andy.chiu@sifive.com>
References: <20240312123627.9285-1-andy.chiu@sifive.com>
Date: Tue, 12 Mar 2024 09:16:47 -0400
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Andy Chiu" <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 "Palmer Dabbelt" <palmer@dabbelt.com>
Cc: greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>
Subject: Re: [v1, 0/6] Support Zve32[xf] and Zve64[xfd] Vector subextensions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_061716_488278_52BFAC8B 
X-CRM114-Status: GOOD (  20.60  )
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

On Tue, Mar 12, 2024, at 8:36 AM, Andy Chiu wrote:
> The series composes of two parts. The first part provides a quick fix for
> the issue on a recent thread[1]. The issue happens when a platform has
> ununified vector register length across multiple cores. Specifically,
> patch 1 adds a comment at a callsite of riscv_setup_vsize to clarify how
> vlenb is observed by the system. Patch 2 fixes the issue by failing the
> boot process of a secondary core if vlenb mismatches.
>
> The second part of the series provide a finer grain view of the Vector
> extension. Patch 3 give the obsolete ISA parser the ability to expand
> ISA extensions for sigle letter extensions. Patch 3, 4 introduces Zve32x,
> Zve32f, Zve64x, Zve64f, Zve64d for isa parsing and hwprobe. Patch 5
> updates all callsites such that Vector subextensions are maximumly
> supported by the kernel.

What is the end user programming interface for this intended to be? prctl
call using inline asm ecall in the ifunc resolver, possibly automated using
function multi-versioning? Can we do better with a different interface?

-s

> Two parts of the series are sent together to ease the effort of picking
> dependency patches. The first part can be merged independent of the
> second one if necessary.
>
> The series is tested on a QEMU and verified that booting, Vector
> programs context-switch, signal, ptrace, prctl(sysctl knob) interfaces
> works when we only report partial V from the ISA.
>
> This patch should be able to apply on risc-v for-next branch on top of
> the commit 886516fae2b7 ("RISC-V: fix check for zvkb with tip-of-tree clang")
>
> [1]: 
> https://lore.kernel.org/all/20240228-vicinity-cornstalk-4b8eb5fe5730@spud/T/#u
>
> Andy Chiu (6):
>   riscv: vector: add a comment when calling riscv_setup_vsize()
>   riscv: smp: fail booting up smp if inconsistent vlen is detected
>   riscv: cpufeature: call match_isa_ext() for single-letter extensions
>   riscv: cpufeature: add zve32[xf] and zve64[xfd] isa detection
>   riscv: hwprobe: add zve Vector subextesnions into hwprobe interface
>   riscv: vector: adjust minimum Vector requirement to ZVE32X
>
>  Documentation/arch/riscv/hwprobe.rst   | 15 +++++++
>  arch/riscv/include/asm/hwcap.h         |  5 +++
>  arch/riscv/include/asm/switch_to.h     |  2 +-
>  arch/riscv/include/asm/vector.h        | 21 ++++++----
>  arch/riscv/include/asm/xor.h           |  2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h  |  5 +++
>  arch/riscv/kernel/cpufeature.c         | 57 +++++++++++++++++++++++---
>  arch/riscv/kernel/head.S               | 14 +++----
>  arch/riscv/kernel/kernel_mode_vector.c |  4 +-
>  arch/riscv/kernel/process.c            |  4 +-
>  arch/riscv/kernel/signal.c             |  6 +--
>  arch/riscv/kernel/smpboot.c            | 14 ++++---
>  arch/riscv/kernel/sys_hwprobe.c        | 12 ++++--
>  arch/riscv/kernel/vector.c             | 15 ++++---
>  arch/riscv/lib/uaccess.S               |  2 +-
>  15 files changed, 135 insertions(+), 43 deletions(-)
>
> -- 
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
