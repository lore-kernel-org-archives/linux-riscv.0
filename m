Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4326C27C7C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/RlS5lLwPHTLBXlI8VyQGYLsdrIUbHYD2a8vqw4p8zk=; b=eW5EKaqVwvac2Q
	8J+icPVzeKLRHkk4hu8cryJoSHXcx8VFKX3K8eAqc6kSl0LIcn/aL62C82Wh4EMGwTSC2a1EAGkjG
	Lm7qtJ/kCsu2VmQwYtrdwXDiKtkt7ALEZKMnT/7Yi9XaKXaNzGpT4TMr5kAu0cqO7BdZXIKNtVVEx
	M9XSEEfr0/nQVBqPlncVOSequkaIv5ztCDi6zTJbIfocpgPAIqlr09LmmN1V9hetc237CyoPkiV5j
	IKdzamDG/wnKXd+elvGNZ8CsqIqv/x+Oo8TORmGttWc8ER2UAaHZVcFkBpRUDAEjY6wve43z7na3S
	fT5usGbOW7zUpqmqHDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIstl-00AsF8-FV; Fri, 20 Jan 2023 15:01:45 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIstf-00AsDE-LU
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 15:01:41 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id BA3052B06706;
	Fri, 20 Jan 2023 10:01:34 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 20 Jan 2023 10:01:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674226894; x=1674234094; bh=1/i8XkaZ2k
	WH/ANJugw9+lV13XFt/Z3piuqR1SILJ8I=; b=F73PJAT0nbJdFpQ6Lod9NLNUdg
	3obTYX2mcXchahvTKQlz6w7yLu8sxFZgeEh9mOzIaqNS29gQKe6cxoKhNlAbf71K
	XKpiXoUT1UDoL+WSbelh0AmvhHANWjBrhVISOMITqGZMZ/u5H2RnORcpX6n/kDuz
	jVavqJaQMB/T0/DmZ6VLWpVnYkNsJzHCnhAm3CxUMfvDGxU+EHdDZuOs/QdFVVq0
	XSH8V4MkmBdqE1dzq5do/LJ0E2XhGeXDKe8dBtzYzjMejYm+LtolJc+q7EVelV7H
	ZRRAsygHMJsJO49Y3zPsns+tU3STaM8R8wA8rBBuoD7ekn/6LF8spO7Uwepw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674226894; x=1674234094; bh=1/i8XkaZ2kWH/ANJugw9+lV13XFt
	/Z3piuqR1SILJ8I=; b=J0Tq67YyB9kctYojZ/sGD0gGsUs48tVOwHdIm5SphBRm
	U/1Q7fRh6lk1hcwM0wd8Ug1uzWKkdnWzcw1uiscf97Ch0ysT4tlBUM3w7imHpLUe
	0kOWSf1VOv2FdInnseerbS8PhI6yJzJ9ZHjGZIwPl5mDEtsZkhAD2o/1hPTpDgBL
	BBL0w1LhL31o/8nk5IT7NT3yla2YU2aR2kiRPOHYBMCkmxOZY8TsnmCSQQusU5KV
	x7JRJxyNUcNQbZn4mTaYFojvMIuB34n4SHD3C4IeeBULGkxdFhckiIpuc3D+DtnP
	vBstpg76bf39o0M/fkDfQ28knMz/4vPFLp3SmEOC+w==
X-ME-Sender: <xms:y6zKY_gzwo2yLzII2Q-EAJhH3Ok6E_TTUMWWMdn7l7rBlh_Lt-EE4g>
    <xme:y6zKY8AM9xbaBLL9tSKNWnvw5C-guUQeIe0CFHoa5W6hRXzS_lrv5sDIQwayVrHAv
    Uvdv9vEBDHp3zDJA2o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:y6zKY_FFBfVAPZfRpxNHtNfe74QR36yig0auaFYI8DOALd4ybbGfNg>
    <xmx:y6zKY8S5JM3VFNBxvdsEBd0eANQSgqzQJVjghLyhwTM5pMbhSRPuVA>
    <xmx:y6zKY8z0fMzglBW0ZZb3PxLo4ixNUSTPSGbuYUMxPOJxnB1UZIAQvQ>
    <xmx:zqzKYwb6F1OfHsb0ozFGTrdB-QBvTfjfUdbbNVr9hi52q1UDitml0WF9jUU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 786ABB60086; Fri, 20 Jan 2023 10:01:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <9965e2d1-bae8-4ce7-911c-783c772e9ff1@app.fastmail.com>
In-Reply-To: <20230120145316.GA4155@tellis.lin.mbt.kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-10-ysionneau@kalray.eu>
 <aa4d68b2-b5b5-4c17-a44f-7c6db443ea4c@app.fastmail.com>
 <20230120145316.GA4155@tellis.lin.mbt.kalray.eu>
Date: Fri, 20 Jan 2023 16:01:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jules Maselbas" <jmaselbas@kalray.eu>
Cc: "Yann Sionneau" <ysionneau@kalray.eu>,
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
 "Alexey Dobriyan" <adobriyan@gmail.com>,
 "Benjamin Mugnier" <mugnier.benjamin@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mm@kvack.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [RFC PATCH v2 09/31] kvx: Add build infrastructure
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_070139_767809_DE5F31DE 
X-CRM114-Status: GOOD (  13.86  )
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

On Fri, Jan 20, 2023, at 15:53, Jules Maselbas wrote:
> On Fri, Jan 20, 2023 at 03:39:22PM +0100, Arnd Bergmann wrote:
>> On Fri, Jan 20, 2023, at 15:09, Yann Sionneau wrote:
>> >      - Fix clean target raising an error from gcc (LIBGCC)
>> 
>> I had not noticed this on v1 but:
>> 
>> > +# Link with libgcc to get __div* builtins.
>> > +LIBGCC	:= $(shell $(CC) $(DEFAULT_OPTS) --print-libgcc-file-name)
>> 
>> It's better to copy the bits of libgcc that you actually need
>> than to include the whole thing. The kernel is in a weird
> It was initialy using KCONFIG_CFLAGS which do not contains valid options
> when invoking the clean target.
>
> I am not exactly sure what's needed by gcc for --print-libgcc-file-name,
> my guess is that only the -march option matters, I will double check
> internally with compiler peoples.
>
>> state that is neither freestanding nor the normal libc based
>> environment, so we generally want full control over what is
>> used. This is particularly important for 32-bit architectures
>> that do not want the 64-bit division, but there are probably
>> enough other cases as well.

To clarify: I meant you should not include libgcc.a at all but
add the minimum set of required files as arch/kvx/lib/*.S.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
