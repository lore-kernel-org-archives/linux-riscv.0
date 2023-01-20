Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99FEC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hh6vU98L8/q7DVf42bROGPja9FctAKRn9Ge17K4TJYo=; b=IQwkR9M6+TFzHW
	CzChyD2MkOmbx8l4BJMxMhfykwt662zqtDhBG8S+8p+ZaZRj/nj+Sz2vqKafv/4hnpy0kBROkl9NQ
	3V9XZKPheLI/i0lD5npdTS1UcMf14aLc/b2gJkMyukXmkclLkJj9T5EJv+MHMXxeeYnbLRqsWej/R
	sSkpT3LWrDNVdM5Z9tf1/LHz96wr7elLueTvXVF6CERLFZU1f6JguRqM+jWkhN9xtoBbwS2Ct7uyF
	3wdufsBVlTbpbOa6aA+p23FmfQeca4ZUt9bbLePwQW+iwQJssrDmicKxUpJ6sdS0jbxBUENyH2toJ
	YKgY72hKEQ0vr9k9EsbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsaR-00AmYo-40; Fri, 20 Jan 2023 14:41:47 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsYW-00AlB9-HY
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 14:39:51 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 9C12C2B0695F;
	Fri, 20 Jan 2023 09:39:43 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 20 Jan 2023 09:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674225583; x=1674232783; bh=b4JAJuHxNJ
	8crP6ZpOzWWYxWeuwbnT4P0qgnOUpQ0sI=; b=gFf713XIxyFBxeWAr3yS03H41w
	yqyZfNqCHoCK7+aWFyA89Uj64Ku48TNMYtM8IiOIXSf/szoVXuGHak++VLOVCbjD
	4BRprRIvW284vouVbKawwpsq3omqRw6Q9CmEcIkYhvx2ahZQDKf6tjpJj30fduv0
	dskYgBDIAO6OYzaKlhUkALOmP23Wgi3bmBGv0ayehZn2AffPNq4D/yOG/MTRp5zh
	Z52Gjf6siHtQOna489DsqShg7VXXxsuTENaVkrW8/b2LfRL4UpowictX/ariJgRR
	xiKJkd+tcD+yEocUrvogxHUVWh1A6iosIIefzkxWYq3QvtTqGraOy0bZaQsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674225583; x=1674232783; bh=b4JAJuHxNJ8crP6ZpOzWWYxWeuwb
	nT4P0qgnOUpQ0sI=; b=k5qd1p5Hy1eB5Kg3Ga0uPk01Yf3+4JkhuxqPo+Z5hDU2
	MU0PltXhatl9coFGjUYPmkTWKIf0LDardbB1m9fA8x9+qcoG4bNObwbNdCqRaRMJ
	ClPsNi1lTR8YPbox67X4CMhGb1PVlzIQDHq50Y+EDTsG7p6oxZUarayb5/xUOcWa
	9KDtDrZj8/67RWqbL5pWr+XaLK2taiZmIVPLO0Jx5U2EXxfiDp97i6KCTtqyh5Gr
	Mygx7eiSAZKwGx32wcG/sGxxrwgjL+hpk3zTTJPQJuRpKkKePuPG7ghTYebIyRA9
	gufFbxK/jI6A/fLEhZo167PYWnMAt1FeencIhbLMCw==
X-ME-Sender: <xms:rafKY04OLGmJbodPEdsmVY-96S3Nf5FY71cSDqwjPBysPO3KV4En3g>
    <xme:rafKY15HeniRL65RCevfQwL-8akP5fuSgClpch5riIqv_7KWLKDep3R4mop31CXxd
    vTqvDhb8dBq7R-wJ_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:rafKYzcvN27XCvj5QYQxGt-xUzwl3VTws9at824WED44I3bRp1xEhg>
    <xmx:rafKY5Lwgf-wy0-myUlDvzC-irHgzv1kj8Sx7_WJA9CiZvQHD5Uh_A>
    <xmx:rafKY4JeUif-UOOjOGgX3CNvSY3HnQgnZGf5eZfPaBYesqra_LYf5A>
    <xmx:r6fKY-TE-nyizPh8wob1zj4HZZGZxoXaVV1xrmRWkfF8Ex1b6lCqsFlS0js>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5EF90B60086; Fri, 20 Jan 2023 09:39:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <aa4d68b2-b5b5-4c17-a44f-7c6db443ea4c@app.fastmail.com>
In-Reply-To: <20230120141002.2442-10-ysionneau@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-10-ysionneau@kalray.eu>
Date: Fri, 20 Jan 2023 15:39:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yann Sionneau" <ysionneau@kalray.eu>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Marc Zyngier" <maz@kernel.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Will Deacon" <will@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>,
 "Boqun Feng" <boqun.feng@gmail.com>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Kees Cook" <keescook@chromium.org>, "Oleg Nesterov" <oleg@redhat.com>,
 "Ingo Molnar" <mingo@redhat.com>, "Waiman Long" <longman@redhat.com>,
 "Aneesh Kumar" <aneesh.kumar@linux.ibm.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Paul Moore" <paul@paul-moore.com>, "Eric Paris" <eparis@redhat.com>,
 "Christian Brauner" <brauner@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Jules Maselbas" <jmaselbas@kalray.eu>,
 "Guillaume Thouvenin" <gthouvenin@kalray.eu>,
 "Clement Leger" <clement@clement-leger.fr>,
 "Vincent Chardon" <vincent.chardon@elsys-design.com>,
 =?UTF-8?Q?Marc_Poulhi=C3=A8s?= <dkm@kataplop.net>,
 "Julian Vetter" <jvetter@kalray.eu>, "Samuel Jones" <sjones@kalray.eu>,
 "Ashley Lesdalons" <alesdalons@kalray.eu>,
 "Thomas Costis" <tcostis@kalray.eu>, "Marius Gligor" <mgligor@kalray.eu>,
 "Jonathan Borne" <jborne@kalray.eu>,
 "Julien Villette" <jvillette@kalray.eu>,
 "Luc Michel" <lmichel@kalray.eu>, "Louis Morhet" <lmorhet@kalray.eu>,
 "Julien Hascoet" <jhascoet@kalray.eu>,
 "Jean-Christophe Pince" <jcpince@gmail.com>,
 "Guillaume Missonnier" <gmissonnier@kalray.eu>,
 "Alex Michon" <amichon@kalray.eu>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <git@xen0n.name>,
 "Shaokun Zhang" <zhangshaokun@hisilicon.com>,
 "John Garry" <john.garry@huawei.com>,
 "Guangbin Huang" <huangguangbin2@huawei.com>,
 "Bharat Bhushan" <bbhushan2@marvell.com>,
 "Bibo Mao" <maobibo@loongson.cn>, "Atish Patra" <atishp@atishpatra.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, "Qi Liu" <liuqi115@huawei.com>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Brown" <broonie@kernel.org>,
 "Janosch Frank" <frankja@linux.ibm.com>,
 "Alexey Dobriyan" <adobriyan@gmail.com>
Cc: "Benjamin Mugnier" <mugnier.benjamin@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mm@kvack.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [RFC PATCH v2 09/31] kvx: Add build infrastructure
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_063950_266859_99D0BDB4 
X-CRM114-Status: UNSURE (   6.82  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jan 20, 2023, at 15:09, Yann Sionneau wrote:
>      - Fix clean target raising an error from gcc (LIBGCC)

I had not noticed this on v1 but:

> +# Link with libgcc to get __div* builtins.
> +LIBGCC	:= $(shell $(CC) $(DEFAULT_OPTS) --print-libgcc-file-name)

It's better to copy the bits of libgcc that you actually need
than to include the whole thing. The kernel is in a weird
state that is neither freestanding nor the normal libc based
environment, so we generally want full control over what is
used. This is particularly important for 32-bit architectures
that do not want the 64-bit division, but there are probably
enough other cases as well.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
