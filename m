Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F99C4708E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 22:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBz2THSheliXKnfy+mzEjctdQCVJlYfHNWRTQhuugdw=; b=c7tJp0pOd5a9Ai
	NVCx97Uas/ERr8FfRCC9JdCsCzexByVqeZYkrnPkE8A3fVxTU2jgqk1FhzGZ5JRqZMH/fBreb+n7R
	2dAdlLP8vfKQ2TFFgNGQBJ8QbG+tF3oPTN07S7ai1JVDJEDo1rslUdQAPscvPy0j0pZ5vTEyHJHgS
	OuDKEbzTvwndGCXQp31FIziGvxonlBKldED5zx4m1HgETRXNvsKIy9CcfTVjvWggTnMeJgMY003/Q
	RQFDkXWAbqeoCK9Ja0W3LDdFA51vgJLO16Hgqzn7QDHBQvSyD2aobmyosatytgnross2V45oE2wz7
	uTIFrjfYeSlt/yZd2gfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDZAR-00FqyR-Ci; Thu, 05 Jan 2023 22:56:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVPy-00DtB1-K8; Thu, 05 Jan 2023 18:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Subject:Cc:To:From:Date:
	References:In-Reply-To:Message-Id:Mime-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UhZB23ikggupzfYjMRU5YJTnDOqqv+WR2zf5S9u612M=; b=KHoQqVe6xAPjlQ8ohNFqL0+o84
	MGeBXy0Pt4rg2T0EGtZPoVr1UEQYCyGvEUZD0UcMSvGK8nj/J0fmFHbcwRi1a69BkP1mkz+TYYxMX
	FVpEELOzcGc+MDsTVcg0A8DCYghAu2BcFj2+zpYRGD3q6+pgN8r6YRPjSjbdai4oZx3NpX3oOP/yY
	WHKFmJ+9MdbYZjuFD8PlxjrE+EN4tiM6B3QuCwWTg3MJ0IiTx72SVRRLAQYVJn5XtNkkWfS+S2hEp
	yn+M2kFr0/E2WmfEKB7tJzZhZKO2lSTL3FG41Dk4yrACfkaYlPBjz/w6hpRAGosG7WyI1okxITDKu
	cyEpOgbg==;
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDP0N-001IlU-24;
	Thu, 05 Jan 2023 12:06:00 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 0B263581B7D;
	Thu,  5 Jan 2023 07:05:53 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 05 Jan 2023 07:05:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1672920353; x=1672927553; bh=UhZB23ikgg
	upzfYjMRU5YJTnDOqqv+WR2zf5S9u612M=; b=FJXChScYkJolw+hfqvehLDIFUK
	5Cg8CQlycAieHhINtFVxj5zsts7SunrKUwOEwJrQi0IRPZJ6d686tiLX3qYCN+Ov
	peuj6uacGf5FJWSmfyO2xgvyukwsPBYdmwGGKl/FCOaIqCaOlwZQEGEZGkV4sNWV
	5GbEZuqyimzsav1KXI29aDE0cEfszY+sjgC8OhIHTCpbPFyk65mnUchZBh+glxcQ
	QKFSN61tZJBYwsPh/9n5W9JUxb8Xr7KNrU2ShThyrZAnX0Ggjaw1dbnENvXcTVJX
	gpYDFjgJuWamA0e7zeMFeKRN0V2IUzFpaJ1lRJWXKcKXZppVhfB02RfJNRbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672920353; x=1672927553; bh=UhZB23ikggupzfYjMRU5YJTnDOqq
	v+WR2zf5S9u612M=; b=NFfyIaQ0qjdgH1MxPldB9drAERMIhtMbPrqmyan05qhK
	cdl62dHKpKYVGS/fQCW/+4OaWjDrJNyiuE/rRhW22vCtMKy5Y8IiwmTApPd74seJ
	V1qPeKqGdTaJv1gQVC1vxuVXaCchfiicOfcTUiopp2DVFYz3grYYwGnb+qAPE/QT
	5+wnMcpSAq9TWGW0zSGQGIBKK0BNtt4d4QWon+tBB6fvuMQBrxJlewFiwT/sdOjq
	VHX6MaNR2DL1QeEPK/cqbJGB6yjFVY3Ae53VYVDzNcHsGOhvZkQ/hga13+7lMojr
	GKpTfqYlbOPf+NdcSybgTXgDZETFX1qKxGLZxfmb2w==
X-ME-Sender: <xms:H722Y-TAbrQ-1Hd9qsPiaJK_LewZdIHMc6XiAQW-e8YWjrRQkyNp1w>
    <xme:H722YzwVmyZqG_zTP_uHqXgvJEAHuqnb9slDQfF3BRAABP4Q-YOswm1krazq0w1Oj
    UMVDtSmXUDTsPIIfio>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeekgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:IL22Y71KzFfrhD803q9NUPzRorpFjRtbZuy22uSnn0z8oaiD5GG5hQ>
    <xmx:IL22Y6AMQf6bkcewkmzQQveQSmrosBsrwqbC2k3qHhYL2Bs4cu_O-g>
    <xmx:IL22Y3jkzVIpOYpeICu19YcEutzqCfaOCNmPEjhWgJuA9_DuIe-WrQ>
    <xmx:Ib22YwI7rpmazIWXfSEpQJLFwg83X9tcp3kXvCBVO8ZtuzON4CtpXg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E6BA2B60086; Thu,  5 Jan 2023 07:05:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <5b69db0b-9eed-42ce-8e93-4b656022433f@app.fastmail.com>
In-Reply-To: <20230105104019.GA7446@tellis.lin.mbt.kalray.eu>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
 <7c531595-e987-422b-bcf7-48ad0ba49ce6@app.fastmail.com>
 <20230105104019.GA7446@tellis.lin.mbt.kalray.eu>
Date: Thu, 05 Jan 2023 13:05:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jules Maselbas" <jmaselbas@kalray.eu>
Cc: "Yann Sionneau" <ysionneau@kalray.eu>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Aneesh Kumar" <aneesh.kumar@linux.ibm.com>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, bpf@vger.kernel.org,
 "Christian Brauner" <brauner@kernel.org>, devicetree@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Eric Paris" <eparis@redhat.com>, "Ingo Molnar" <mingo@redhat.com>,
 "Jan Kiszka" <jan.kiszka@siemens.com>, "Jason Baron" <jbaron@akamai.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Kees Cook" <keescook@chromium.org>,
 "Kieran Bingham" <kbingham@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-audit@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-perf-users@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
 "Marc Zyngier" <maz@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Namhyung Kim" <namhyung@kernel.org>,
 "Nicholas Piggin" <npiggin@gmail.com>, "Oleg Nesterov" <oleg@redhat.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Moore" <paul@paul-moore.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Rob Herring" <robh+dt@kernel.org>, "Sebastian Reichel" <sre@kernel.org>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Waiman Long" <longman@redhat.com>, "Will Deacon" <will@kernel.org>,
 "Alex Michon" <amichon@kalray.eu>,
 "Ashley Lesdalons" <alesdalons@kalray.eu>,
 "Benjamin Mugnier" <mugnier.benjamin@gmail.com>,
 "Clement Leger" <clement.leger@bootlin.com>,
 "Guillaume Missonnier" <gmissonnier@kalray.eu>,
 "Guillaume Thouvenin" <gthouvenin@kalray.eu>,
 "Jean-Christophe Pince" <jcpince@gmail.com>,
 "Jonathan Borne" <jborne@kalray.eu>, "Julian Vetter" <jvetter@kalray.eu>,
 "Julien Hascoet" <jhascoet@kalray.eu>,
 "Julien Villette" <jvillette@kalray.eu>,
 "Louis Morhet" <lmorhet@kalray.eu>, "Luc Michel" <lmichel@kalray.eu>,
 =?UTF-8?Q?Marc_Poulhi=C3=A8s?= <dkm@kataplop.net>,
 "Marius Gligor" <mgligor@kalray.eu>, "Samuel Jones" <sjones@kalray.eu>,
 "Thomas Costis" <tcostis@kalray.eu>,
 "Vincent Chardon" <vincent.chardon@elsys-design.com>
Subject: Re: [RFC PATCH 00/25] Upstream kvx Linux port
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_120556_545684_EF08E675 
X-CRM114-Status: GOOD (  25.07  )
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

On Thu, Jan 5, 2023, at 11:40, Jules Maselbas wrote:
> On Wed, Jan 04, 2023 at 04:58:25PM +0100, Arnd Bergmann wrote:
>> On Tue, Jan 3, 2023, at 17:43, Yann Sionneau wrote:

>> I commented on the syscall patch directly, I think it's
>> important to stop using the deprecated syscalls as soon
>> as possible to avoid having dependencies in too many
>> libc binaries. Almost everything else can be changed
>> easily as you get closer to upstream inclusion.
>> 
>> I did not receive most of the other patches as I'm
>> not subscribed to all the mainline lists. For future 
>> submissions, can you add the linux-arch list to Cc for
>> all patches?
>
> We misused get_maintainers.pl, running it on each patch instead
> of using it on the whole series. next time every one will be in
> copy of every patch in the series and including linux-arch.

Be careful not to make the list too long though, there is
usually a limit of 1024 characters for the entire Cc list,
above this your mails may get dropped by the mailing lists.

>> Reading the rest of the series through lore.kernel.org,
>> most of the comments I have are for improvements that
>> you may find valuable rather than serious mistakes:
>> 
>> - the {copy_to,copy_from,clear}_user functions are
>>   well worth optimizing better than the byte-at-a-time
>>   version you have, even just a C version built around
>>   your __get_user/__put_user inline asm should help, and
>>   could be added to lib/usercopy.c.
>
> right, we are using memcpy for {copy_to,copy_from}_user_page
> which has a simple optimized version introduced in
> (kvx: Add some library functions).
> I wonder if it is possible to do the same for copy_*_user functions.

copy_from_user_page() is only about managing cache aliases,
not user access, and it's not used anywhere in the fast
path, so it's a bit different.

arch/arm/lib/copy_template.S has an example for how
you can share the same assembler implementation between
memcpy() and copy_from_user(), but it's not very
intuitive.

The tricky bit with copy_from_user() is the partial copy
that relies on copying the exact amount of data that can
be accessed including the last byte before the end of
the mapping, and returning the correct count of non-copied
bytes.

If you want a C version, you can probably use the
copy_from_kernel_nofault implementation mm/maccess.c
as a template, but have to add code for the correct
return value.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
