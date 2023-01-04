Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BE3C46467
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 16:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byji2YAabeJMhMx9Li/vnGOKLRcm/uy0zax38v6Dq/4=; b=1+l0OJ5+Azgffp
	wqyEdBLKl4odgkYboFl7tRqCqXuTLVAZzEWCNldcoK0kkA+BN07ciqteZPBwfQrjkW8i8nEuJRLHt
	J9YRoOJTgu32RQVPFAyPfvmCiJLOf/bbsRyk5yMonQn7ZhHqyQEWGsvFHZzZ0XWK+Cry69kkuQrXF
	MJdRjxZcwiNgHyxsa+6oCLm59g84EmdD87r65TkQFl7/ydJuB3nCWBbliiNvLbWXAXjeDsd5Nwwzp
	BukNh3Zm8U0rLuHvWJf1w1AMLa2OsmvfFjeZJmrXCfoZRuDvtO0F98sDxuvu+6uiy/81j20P/TaOO
	uQt8ANxMzS+ATH+qAFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD6Cw-00AHIT-RC; Wed, 04 Jan 2023 16:01:38 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD6AD-00AGin-NB; Wed, 04 Jan 2023 15:58:52 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id B92C65819C2;
	Wed,  4 Jan 2023 10:58:45 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 04 Jan 2023 10:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1672847925; x=1672855125; bh=H0UTR4kJze
	AkAZivC7ap8DwhEwb/MXnY4XPO+uy9kKc=; b=hwTQZRGkU58sEMAGHJklEKVGHg
	WJWpgYipnXvtEeYAwDQvOeb1YYnzUN7dY5MzHoTwe19XwLc7UHuy32W/jUv5aug4
	xZ11Tf1cps6Lq3+wqn0IVghrKPgMPMOUtbDG1nmay8N4++VLitatsCjZFeqy2upu
	AXz63ODVZWX0yJgLrDun6rnSqOwzAEQojEQN0fl1CfeHdK9uf8pwdTaq2C09q2MG
	pzen/prquA9UpTBBm2HLQQAg4PR+8EfehAFbU/6wa929UKrzTMGYDV+aTsbnaB2H
	j1Y5L3PA5s1rPDAwI3NgOEEPqWdW9b92HJl1zoggxVLyIQepbtRm0zg5GXsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672847925; x=1672855125; bh=H0UTR4kJzeAkAZivC7ap8DwhEwb/
	MXnY4XPO+uy9kKc=; b=EBZz60y6sFUvuYIrxbb/hh794amfA0A+wMLBwlho+Uh4
	eToRLuAuWP5EJFrh/mAUHetT82fvFg+ukyYTRdsybjI/5buxgkoKTJyoweXTgZXG
	SG7LaI8CgEBGB87UFdUIgFDpG1ff+AECFi8c4R2xnpPOKS0awXal8fZeBoDJ+ggl
	Bnc6N9DoU46s3ZUicQZVqHNqQVJzhXkiTErrTiunf0cu+xKkeToJ9K7+0hz97nbu
	KwPN2wipgn5OKlLdyK8sqmA18G8dYi2kSRGJ9IOSIPEFdkTg9aDwR9xq0n60avso
	A5L8pbz3/2tdx+aU0izI1zK2oKJXVq2Np6xti5dzXQ==
X-ME-Sender: <xms:NKK1YySSJs82DosjVp3Ef5l7w-raFxPhGx8LhdE19BQduj5VqxW40g>
    <xme:NKK1Y3yt3hOFQb0wjDiF-vtU3_Mmif8v6lglyIU3t59MyDGRJ89Lvj4gWGxe5uBg-
    kcePqopVN-S1NBrYAM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeigdekvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:NKK1Y_2dXfPGWVROyrzVPCSwXYts0Kbh8ArH3hclKa4Z9KTF8-LzTQ>
    <xmx:NKK1Y-D-7Ao5WbM5mCRhs1vuhR0sm2DVg6y8Hr_Pxl8QhXvk2eXd-Q>
    <xmx:NKK1Y7iJqQaXZQBYNb9D5yixuvxK2h8OC7qveeXGB4CZoTtdBlH2Bw>
    <xmx:NaK1Y0JLCn1LQXUldf8npUZHVymiLstPLeYYXXEijYaGMJN5WVZyLg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 43F24B6008D; Wed,  4 Jan 2023 10:58:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <7c531595-e987-422b-bcf7-48ad0ba49ce6@app.fastmail.com>
In-Reply-To: <20230103164359.24347-1-ysionneau@kalray.eu>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
Date: Wed, 04 Jan 2023 16:58:25 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yann Sionneau" <ysionneau@kalray.eu>
Cc: "Albert Ou" <aou@eecs.berkeley.edu>,
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
 "Jonathan Borne" <jborne@kalray.eu>,
 "Jules Maselbas" <jmaselbas@kalray.eu>,
 "Julian Vetter" <jvetter@kalray.eu>,
 "Julien Hascoet" <jhascoet@kalray.eu>,
 "Julien Villette" <jvillette@kalray.eu>,
 "Louis Morhet" <lmorhet@kalray.eu>, "Luc Michel" <lmichel@kalray.eu>,
 =?UTF-8?Q?Marc_Poulhi=C3=A8s?= <dkm@kataplop.net>,
 "Marius Gligor" <mgligor@kalray.eu>, "Samuel Jones" <sjones@kalray.eu>,
 "Thomas Costis" <tcostis@kalray.eu>,
 "Vincent Chardon" <vincent.chardon@elsys-design.com>
Subject: Re: [RFC PATCH 00/25] Upstream kvx Linux port
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_075850_298347_5F351D54 
X-CRM114-Status: GOOD (  24.84  )
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

On Tue, Jan 3, 2023, at 17:43, Yann Sionneau wrote:
> This patch series adds support for the kv3-1 CPU architecture of the kvx family
> found in the Coolidge (aka MPPA3-80) SoC of Kalray.
>
> This is an RFC, since kvx support is not yet upstreamed into gcc/binutils,
> therefore this patch series cannot be merged into Linux for now.
>
> The goal is to have preliminary reviews and to fix problems early.
>
> The Kalray VLIW processor family (kvx) has the following features:
> * 32/64 bits execution mode
> * 6-issue VLIW architecture
> * 64 x 64bits general purpose registers
> * SIMD instructions
> * little-endian
> * deep learning co-processor

Thanks for posting these, I had been wondering about the
state of the port. Overall this looks really nice, I can
see that you and the team have looked at other ports
and generally made the right decisions.

I commented on the syscall patch directly, I think it's
important to stop using the deprecated syscalls as soon
as possible to avoid having dependencies in too many
libc binaries. Almost everything else can be changed
easily as you get closer to upstream inclusion.

I did not receive most of the other patches as I'm
not subscribed to all the mainline lists. For future 
submissions, can you add the linux-arch list to Cc for
all patches?

Reading the rest of the series through lore.kernel.org,
most of the comments I have are for improvements that
you may find valuable rather than serious mistakes:

- the {copy_to,copy_from,clear}_user functions are
  well worth optimizing better than the byte-at-a-time
  version you have, even just a C version built around
  your __get_user/__put_user inline asm should help, and
  could be added to lib/usercopy.c.

- The __raw_{read,write}{b,w,l,q} helpers should
  normally be defined as inline asm instead of
  volatile pointer dereferences, I've seen cases where
  the compiler ends up splitting the access or does
  other things you may not want on MMIO areas.

- I would recomment implementing HAVE_ARCH_VMAP_STACK
  as well as IRQ stacks, both of these help to
  avoid data corruption from stack overflow that you
  will eventually run into.

- You use qspinlock as the only available spinlock
  implementation, but only support running on a
  single cluster of 16 cores. It may help to use
  the generic ticket spinlock instead, or leave it
  as a Kconfig option, in particular since you only
  have the emulated xchg16() atomic for qspinlock.

- Your defconfig file enables CONFIG_EMBEDDED, which
  in turn enables CONFIG_EXPERT. This is probably
  not what you want, so better turn off both of these.

- The GENERIC_CALIBRATE_DELAY should not be necessary
  since you have a get_cycles() based delay loop.
  Just set loops_per_jiffy to the correct value based
  on the frequency of the cycle counter, to save
  a little time during boot and get a more accurate
  delay loop.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
