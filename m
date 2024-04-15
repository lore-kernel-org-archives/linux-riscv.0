Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05FEC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 15:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWOP9ozilRQ2IlCHwFHTkS3eSZBaT+et6K7nDZXyRzA=; b=J7Scbz5FlrRo3w
	l7j2XQO7CDKI702gT84e2mNt2LnSXXLYFb7Am8G/71NWAsQMit0j59Nj3bpnAhRyBpWRO7EurlSz0
	6ZikGkN18vMo0eV1R39Xo/C7UPj9VdbaWxoCTXicRzvTbH6BhZZo/6Na8JB9tNwda8jjix47Ft4kz
	wWmqEaOrgQRDxkFGErTVXgyz8p4Vm4/UDt/4kIajtgGuo+Op6xl+5217HUEota0HWX59lc+QfXnvs
	piXnqX3THPiOOr15/9vWnbqG7sLGCYZFloLmxx6dc+6NyZYGkpkI1cq9cameSlTotu/5dp/lpeTDW
	gSGO2kb8lX6oCVGln/JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOIP-00000008tYg-2b7m;
	Mon, 15 Apr 2024 15:31:01 +0000
Received: from flow6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOIM-00000008tXo-3LSM
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 15:31:00 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id 27AED200377;
	Mon, 15 Apr 2024 11:30:54 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 15 Apr 2024 11:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1713195054; x=1713202254; bh=uejkFuVJ7S
	+uU6TPaZslbYYiwuH4wYboz0/NG64qH38=; b=Sluq5LoDaSzkucovZOMhBQXHaP
	dUG7s1ZGFdg3Nn2e5h800o1yl4atGTzBTdzXqa7YX+WUExD+W3qiGrB+r4odYDb1
	2NdpAkIvWyS96o+mFAbokhEBWYCkvy+1sPK2JCMHu8a2DptXubi7r4DrXrK1qGZU
	ix536fKURRDgJy1b2HkGY0hdUSp2SbQxrowETbjPpyFMFHZ/ZSJ45PNjWBxEafKt
	eDVVtUw2MLKkKyI8V0aw23s0FlMadhP8nHTHhg6iszBXPEeXoU3owAif6GixhEO3
	Dd5GWr3mP6rfD7EX9kbZe0gg5JUGTG2rHGIrm3XCnidEBDTCY0D9oHq+jb5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1713195054; x=1713202254; bh=uejkFuVJ7S+uU6TPaZslbYYiwuH4
	wYboz0/NG64qH38=; b=LcW+evzZpp86694hEWffDj/s0rO6BH/rY/Xu5CONrCA4
	sIQxjx/VixeHzG0pTaJrMwdcuLegHbOiyhUoaiQcJaF+LcVz4n7pttCBmR1O9Fn1
	N9D908gd2ldWni5GGvmgToONZ9Hfrx45QeJ+Jg5jzEznry6bgZ8mYziWmSE38HCo
	EEfqDUW5AGxfBM1WGzvGHrBrRjQCYAlgMF2d49VDQYGH/TBTTUFBafTQtcMjvuMw
	Qq0AJl/2YAT7ZbuoAKs9+48/CUtVnGbS1GcjTXrYZE5NUy1u1NqyLQAmXszCYKJS
	UplsrUiV2g1rlabPhZ9VLFsaKey00cMCgLY8UKJq0w==
X-ME-Sender: <xms:K0gdZkbb5i7y3pGau_0_x-2n1kjiZAlMHwFNqjeSYPHTUtKmpatK5w>
    <xme:K0gdZvZcyoF8AjrMBMCGanxj9J4KsMi4McvQC8zJiQcVASYqpsW0ClOESfH41MjSM
    r0tR-caUlGbOVwixC8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejvddgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:K0gdZu_w1hBYqk34h2IN9h1tV6e4PcDqSoanuTNlKgVLyTA6uf5IZA>
    <xmx:K0gdZuq7MuuSTVyPb54Of17l05-FsmZdX3FifENQAcOUlt-28o7ihA>
    <xmx:K0gdZvoCah0qR8yjkzdba-0Xo8gBdsDmMUq6F44I4zfywkYYR-mkhQ>
    <xmx:K0gdZsR8LtCSF6vvloD-WhjCN895MxrL28MmU9TXKGREwIJsuHteIg>
    <xmx:LkgdZt4Qw-FCcM8eb67qVfwUM4pmYcBpRpt_Pg5E_8coQPw7v3B_SkCD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B461EB6008D; Mon, 15 Apr 2024 11:30:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
MIME-Version: 1.0
Message-Id: <61d0584f-dfe4-4d8c-a178-78f000d477d4@app.fastmail.com>
In-Reply-To: <c20b433f-97ef-7faa-5122-9949af41f2fb@kalrayinc.com>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-31-ysionneau@kalray.eu>
 <f69adaf2-6582-c134-5671-4d6fd100fcf1@linaro.org>
 <c20b433f-97ef-7faa-5122-9949af41f2fb@kalrayinc.com>
Date: Mon, 15 Apr 2024 17:30:31 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yann Sionneau" <ysionneau@kalrayinc.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Yann Sionneau" <ysionneau@kalray.eu>,
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
Subject: Re: [RFC PATCH v2 30/31] kvx: Add power controller driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_083059_085461_99BDD8B7 
X-CRM114-Status: GOOD (  24.29  )
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

On Mon, Apr 15, 2024, at 16:08, Yann Sionneau wrote:
> On 1/22/23 12:54, Krzysztof Kozlowski wrote:
>> On 20/01/2023 15:10, Yann Sionneau wrote:
>>> From: Jules Maselbas <jmaselbas@kalray.eu>
>>>
>>> The Power Controller (pwr-ctrl) control cores reset and wake-up
>>> procedure.
>>> +
>>> +int __init kvx_pwr_ctrl_probe(void)
>>> +{
>>> +	struct device_node *ctrl;
>>> +
>>> +	ctrl = get_pwr_ctrl_node();
>>> +	if (!ctrl) {
>>> +		pr_err("Failed to get power controller node\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (!of_device_is_compatible(ctrl, "kalray,kvx-pwr-ctrl")) {
>>> +		pr_err("Failed to get power controller node\n");
>> No. Drivers go to drivers, not to arch directory. This should be a
>> proper driver instead of some fake stub doing its own driver matching.
>> You need to rework this.
>
> I am working on a v3 patchset, therefore I am working on a solution for 
> this "pwr-ctrl" driver that needs to go somewhere else than arch/kvx/.
>
> The purpose of this "driver" is just to expose a void 
> kvx_pwr_ctrl_cpu_poweron(unsigned int cpu) function, used by 
> kernel/smpboot.c function __cpu_up() in order to start secondary CPUs in 
> SMP config.
>
> Doing this, on our SoC, requires writing 3 registers in a memory-mapped 
> device named "power controller".
>
> I made some researches in drivers/ but I am not sure yet what's a good 
> place that fits what our device is doing (booting secondary CPUs).
>
> * drivers/power/reset seems to be for resetting the entire SoC
>
> * drivers/power/supply seems to be to control power supplies ICs/periph.
>
> * drivers/reset seems to be for device reset
>
> * drivers/pmdomain maybe ?

Right, I don't think any of the above are appropriate

> * drivers/soc ?
>
> * drivers/platform ?
>
> * drivers/misc ?

Not drivers/misc, that is mainly for things with a user-space
interface.

drivers/soc is mainly for drivers used by other drivers, but
this would work, especially if you expect to have multiple
SoC variants that all use the same architecture code but
incompatible register layouts

drivers/platform is really for things outside of the SoC
that are used for managing the system, especially across
architectures, so I don't think that is a good fit.

Traditionally we had this code in arch/{arm,mips,powerpc,sh,x86}
and we never created a drier subsystem for it since newer
targets (arm64, riscv, newer arm, most x86) all use a method
that is specified as part of the ISA or firmware interface.

The question what you expect to see with future hardware
iterations: if you think all arch/kvx/ hardware will use the
same code for maybe at least the next five years, I would
suggest you keep it in arch/kvx/kernel/smp.c, but if you
know or expect other implementations to be needed, I can
merge it as a driver through drivers/soc/.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
