Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D2BC25B4E
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jan 2023 11:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9uWK890r2MTOvpK4l/ntSv8iWjEQQOGdFV0D1cuuxk=; b=cqUBFyRqvaKIgx
	HfJC7zbJDkHxcsDpHw9e9NcRN6iOD5Vae70nvcVddPGZ00Lo6KlWPN7EDNsNNe4XU9VGMB89QVlNA
	Nv7lzqnpTAdnFqm/LyXXA7RkJc+QrjIpCeDJP4fNJdKUJkFOVvuKeBXTCNRwWonSQt2LAlKOy4++u
	bqrEeOjUDy22YGkmQZvfbv0IVq95D2dbxk6IoVc2ktkf8bzHjUft8ZaO90RQ1NEh06JxM+zmP9rAg
	aHN8oCKZBfkmrL9crS8Y0YZSC6E8THbkOTF4oGBg40w6Y595iROml+bl7x4nBkFSMJM07EM6w8sHd
	a9yPOJWiLSuiPPuDZdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJY9n-00FCvY-SZ; Sun, 22 Jan 2023 11:05:03 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJY9k-00FCuE-TV
	for linux-riscv@lists.infradead.org; Sun, 22 Jan 2023 11:05:02 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 208A45C003B;
	Sun, 22 Jan 2023 06:04:58 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sun, 22 Jan 2023 06:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674385498; x=1674471898; bh=PIGBqayUKu
	ArKaRHZD7sCBO6FDrvE59LUQTAu0TlFio=; b=Lxhnxo7ujOLMNwhq5OGDK6ZKiL
	ghNTbYaudfk7815ZYCsm9Y8XKiRED3XjCvkKaGoOhc6hStAzvEga0xZmdKmIdkQk
	eTdcUdlj6D/6Gip2mhSxlQgikIE4PVx5pW1Bxs6amsP6rVcfJNgtgZmCf1Ucczzk
	HGa6TsBVuoBKjs6gMcSEEd5TvizRU4rIgSwqAh5Z4U8krTZM55xHrLNqAFC1jFxx
	fIpuiCj7iPve1Jg5gonO+nkTZLrj9YhAYZVaTwqGMNwUDeiN6mY6XOBMWQB2xljw
	iDxX8SgFksBLKM5kPYQctaINyRdpsDNJ9Z3iwWu71rTdRFGKQj2oB/pK1Oog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674385498; x=1674471898; bh=PIGBqayUKuArKaRHZD7sCBO6FDrv
	E59LUQTAu0TlFio=; b=mqfFVKoA8Wv1ISopmIUdhhQQTWCzmhNjBh4V0QvcSI52
	jVBJy4enEBRHiYs3E4RUFI4uSXG3Wvla1TWuNJyikr2oKpxkXKcZ8+O2y1VITn0t
	sSWihFf596BuYflkgy5PrJYKO+GSEVafTrwoyrwFR7JNMp9H2zvHIyBkfi8NXmzR
	jeTlPX4zf78x1nQy5dR1FzjdPSIEJCGqMmOW+n8rUDgTJHE5mW+gYd4yqVShrWTu
	taS3BwPSDyBwETYLTvxAy7CKQhrlGZGn1rXO+Y6wnu4v+bnv79UupEFpLFLsxP8D
	Hc+83GyL277N8Nv+HZyNn3wyU7TCjDUJx/anr66M5w==
X-ME-Sender: <xms:VxjNY36T4R5HGVjLfJYYtxqEyP2x1xgQWFlhq9kv5ZVO1jab6HlfdA>
    <xme:VxjNY84crVRmJ1FsB_mrWtWyEBdO0z94G1BzOvZGM8BWP_dz8OwZePtphyWUf_Xx8
    -tJ7B49vKTHCE_v4CM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduiedgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:VxjNY-ev3r7tllrk__vfVuUx_oxxs-Z3VcJ-TbGZFYn3l0cz-6D3Lg>
    <xmx:VxjNY4LbsRaaf_rI5MeI3xO06SBON4XZBQ_MJDU8jvhPNfDA9OcGoA>
    <xmx:VxjNY7IGDcm8IZxX9zZNq3WEI529JOboGOsxZTEqfwqtUmOYd_wjcA>
    <xmx:WhjNYzKNh_OdNAcQ_a_7Qa_0GJ9CByCeLG_1cpEGg4ZdkbaDjoWoGw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D166BB60089; Sun, 22 Jan 2023 06:04:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <7ad668ba-d6f3-4ef9-9335-e42bfe8d4cce@app.fastmail.com>
In-Reply-To: <20230122072759.GA3703@lst.de>
References:  <CA+V-a8uF1s+dwKC_+apL+CBiHN8w_J0n_G2dqsgiAUZVEibfqg@mail.gmail.com>
 <9017adf0-acd4-4c43-8aea-3579b214b477@app.fastmail.com>
 <CA+V-a8u6jvR=EDeE3mAbDr6-06NoBJ7mwmi_Y9qVyHT+aC-9rg@mail.gmail.com>
 <45d6eb0c-cbe3-4a83-aa12-3483638473ae@app.fastmail.com>
 <20230110070144.GG10289@lst.de>
 <02988e70-b099-46fd-b260-2d537c50543a@app.fastmail.com>
 <20230113054807.GA23179@lst.de>
 <ea4cb121-97e9-4365-861a-b3635fd34721@app.fastmail.com>
 <20230121143733.GA7415@lst.de>
 <6a64b0b5-0ebc-43a5-a3d8-483a845a0b5e@app.fastmail.com>
 <20230122072759.GA3703@lst.de>
Date: Sun, 22 Jan 2023 12:04:35 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christoph Hellwig" <hch@lst.de>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, guoren <guoren@kernel.org>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Philipp Tomsich" <philipp.tomsich@vrull.eu>,
 "Nathan Chancellor" <nathan@kernel.org>, "Atish Patra" <atishp@rivosinc.com>,
 "Anup Patel" <apatel@ventanamicro.com>,
 "Tsukasa OI" <research_trasio@irq.a4lg.com>,
 "Jisheng Zhang" <jszhang@kernel.org>,
 "Mayuresh Chitale" <mchitale@ventanamicro.com>,
 "Will Deacon" <will@kernel.org>
Subject: Re: [RFC PATCH v6 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_030501_269301_AA88645F 
X-CRM114-Status: GOOD (  21.96  )
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

On Sun, Jan 22, 2023, at 08:27, Christoph Hellwig wrote:
> On Sat, Jan 21, 2023 at 08:30:23PM +0100, Arnd Bergmann wrote:
>> I was thinking of using STATIC_CALL() as an optimization here, which
>> I find easier to read and understand than alternatives. One advantage
>> here is that this allows the actual cache operations to be declared
>> locally in the architecture without letting drivers call them,
>> but still update the common code to work without indirect branches.
>> 
>> The main downside is that this is currently only optimized on
>> powerpc and x86, both of which don't actually need CPU specific
>> callbacks. ARC, ARM, and MIPS on the other hand already
>> have indirect function pointers, RISC-V would likely benefit the
>> most from either alternatives or static_call, as it already
>> uses alternatives and has one implementation that is clearly
>> preferred over the others.
>
> For now I'd just keep doing direct calls into the arch code, just
> for the lower level invalidate, writeback, invalidate+writeback
> calls as that helps cementinc the logic of which of those to use
> in well documented core code.

Ok.

> And I'm not really sure I'd like to go beyond that - making it too
> easy pluggable will make people feel more comfortable doing stupid
> things here. 

I fear the bigger risk is still making the functions callable
from device driver code than it is to make the functions
globally settable.

You introduced the mips version in f8c55dc6e828 ("MIPS: use generic
dma noncoherent ops for simple noncoherent platforms"), which
was clearly meant as an implementation detail, yet we already
have a driver that slipped in with 3bdffa8ffb45 ("Input: Add
N64 controller driver") that just calls this directly rather
than using the dma-mapping interface.

On the other hand, the indirect function pointers for
per-cpu cache operations are not easily translated anyway:
with the three architectures that multiplex between
cpu specific operations, arc uses physical addresses,
mips uses virtual addresses (because of highmem), and
arm even uses both because of incompatible requirements
between l1 and l2 cache operations. arm32 also seems to
have the superset of all possible corner cases that
one might see elsewhere (prefetching vs in-order,
writethrough vs writeback, broken broadcast invalidation,
...).

> And yes, maybe that's personal because I've warned
> the RISC-V people years ago that they'll need architectural
> cache management instructions yesterday and the answer was that
> no one is going to use them on modern CPUs.  *sigh*

To be fair, from the ISA point of view, it really shouldn't
be necessary as long as you have a sane SoC design.
In practice there are always chips that are cutting corners,
or use the new CPU core as a drop-in for an existing
design. Arm SBSA tried to enforce the same thing and also
failed for pretty much the same reason.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
