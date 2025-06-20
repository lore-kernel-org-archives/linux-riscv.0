Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2548AC77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 11:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+4EtXLBatCJ1dGwsGBacm5ivIH/xJS/daAfKP1bayE=; b=lpuD6Ci+1pXpTF
	K6V2dPubeSpox0a5Ksy9cMIZzFJhuMnhwqAX5w1vxUiwTGLu4gfjlyGfbXtWi4qNdI0LmBiejIWdS
	gqdF5gTwMOU0+QddkjzJCMuC7mOM3qmViLmiRMKmd84jXmlZyndXN5YPVrpLd2aaRuwqIc0eLcPc6
	30wD3tGFqxdLhaZPmjizbhU63oGAjjpULhzyLyZv7aLquA9EQTz7odliDU2aPcX+vEUieqt8WC22L
	vSDRHdjJ6x7k+rN/FI2gmfkoXjxE1LFQdTBj9ZHkmv/HM2jkAkynCkkDLeat3uOb2IE2wPu7ZUqb/
	WpwNE40sXz/TC92uqQhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSa9s-0000000FUHK-1051;
	Fri, 20 Jun 2025 11:43:48 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZQE-0000000FPQU-2YaR
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 10:56:39 +0000
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 9A259341000;
	Fri, 20 Jun 2025 10:56:30 +0000 (UTC)
Date: Fri, 20 Jun 2025 10:56:19 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Alex Elder <elder@ieee.org>, Guodong Xu <guodong@riscstar.com>,
	Ze Huang <huangze@whut.edu.cn>, spacemit@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] riscv: dts: spacemit: Add DMA translation buses for
 K1
Message-ID: <20250620105619-GYA165049@gentoo>
References: <20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn>
 <5cc644f8-7394-48f2-b62b-1e7cd5ce27d3@ieee.org>
 <9e5e54a9-ef90-4a87-b082-d6eb9c7468c5@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e5e54a9-ef90-4a87-b082-d6eb9c7468c5@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_035638_687157_1873D242 
X-CRM114-Status: GOOD (  59.66  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Vivian, Alex,

On 23:42 Thu 19 Jun     , Vivian Wang wrote:
> Hi Alex,
> =

> Thank you for your comments on this.
> =

> On 6/19/25 23:11, Alex Elder wrote:
> > On 6/17/25 12:21 AM, Vivian Wang wrote:
> >> The SpacemiT K1 has various static translations of DMA accesses. Add
> >> these as simple-bus nodes. Devices actually using these translation wi=
ll
> >> be added in later patches.
> >>
> >> The bus names are assigned according to consensus with SpacemiT [1].
> >>
> >> [1] =

> >> https://lore.kernel.org/all/CAH1PCMaC+imcMZCFYtRdmH6ge=3DdPgnANn_GqVfs=
GRS=3D+YhyJCw@mail.gmail.com/
> >
> > So what you include here very closely matches what Guodong
> > said in the message above.=A0 Yours differs from his proposal
> > and that makes it hard to compare them.=A0 I have a few comments
> > on that below.
> >
> >> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> >> ---
> >> This is my concrete proposal for representing DMA translations for
> >> SpacemiT K1.
> >
> > It's worth acknowledging that this is derived from what Guodong
> > proposed (it's not "your" proposal in that respect).=A0 That said,
> > yours is a more complete and "formal" RFP than what he wrote.
> >
> I had thought that since the addresses were already there in vendor's DT =

> [2], and the names were provided by SpacemiT, anything other than the =

> names was "well-known information". In retrospect, I should have made =

> the chain of information of this clearer and make it explicit that this =

> was based on Guodong's note.
> =

> So, just to be clear, the information in my proposal is based on =

> Guodong's reply [1] (link the quoted text), which I had assumed, but not =

> explicitly confirmed, was based on already addresses in SpacemiT's DT =

> and names provided by SpacemiT.
> =

> [2]: https://github.com/spacemit-com/linux-k1x/blob/k1/arch/riscv/boot/dt=
s/spacemit/k1-x.dtsi
> =

> >> For context, memory on the SpacemiT K1 is split into two chunks:
> >>
> >> - 0x0000_0000 to 0x8000_0000: First 2 GiB of memory
> >> - 0x1_0000_0000 above: Rest of memory
> >>
> >> DMA-capable devices on the K1 all have access to the lower 2G of memory
> >> through an identity mapping. However, for the upper region of memory,
> >> each device falls under one of six different mappings. The mappings are
> >> provided in this patch as simple-bus nodes that device nodes should be
> >> added to.
> >>
> >> This patch is an RFC because it is not meant to be applied, or at leas=
t,
> >> not certainly meant to be applied. Instead, this is an attempt to come
> >> to a consensus on how these bus nodes should look like.
> >
> > I think the above is what Krzysztof might not have seen.=A0 Perhaps
> > it could have been made more clear--maybe in the "main" description
> > section (above the ---) or even the subject line.
> >
> Yeah, that's my mistake in organizing the paragraphs.
> =

> >> More specifically, I propose that the process proceeds as follows:
> >>
> >> - Firstly, relevant parties agree on these bus nodes given here.
> >> - After that, each time the first user of a bus appears, the series
> >> =A0=A0 should include a patch to add the bus required for that driver.
> >> - If a driver being submitted uses the same bus as another one that has
> >> =A0=A0 been submitted but hasn't yet landed, it can depend on the bus =
patch
> >> =A0=A0 from that previous series.
> >
> > Getting agreement is good, but otherwise this is basically
> > the process Guodong was suggesting, right?
> =

> Hmm, actually re-reading the discussion now, I realized that I may have =

> come to this late and missed out on some previous discussions, which =

> were alluded to in Yixun's messages. (This is again thread around link =

> [1] in quoted text.) This led me to believe that some of these were not =

> really agreed upon.
> =

> I also realized I think one of the things I may have not yet made clear =

> is that I would like the bus node to be a *separate* patch. I think this =

> makes sense, because it's dealing with two different subsystems.
> =

> >
> >> For conventions regarding coding style, I propose that:
> >>
> >> - #address-cells and #size-cells are 2 for consistency
> >> - These bus nodes are put at the end of /soc, inside /soc
> >> - These bus nodes are sorted alphabetically, not in vendor's order
> >> - Devices are added into *-bus nodes directly, not appended towards the
> >> =A0=A0 end with a label reference
> >
> > I do like that you're trying to be more complete and explicit
> > on what you think needs agreement on.
> >
> Being thorough was the main goal of this RFC. If there was previous =

> agreement on how dma-ranges should be done, I'm sorry for missing them, =

> but from my observations on the mailing list on how these ended up into =

> patches I really haven't seen much consistency. Maybe there was =

> misunderstanding, which I'm hoping to clear up.
> =

> (Although see my paragraph above, maybe I haven't been thorough enough.)
> =

> >> The K1 DMA translations are *not* interconnects, since they do not
> >> provide any configuration capabilities.
> >>
> >> These bus nodes names and properties are provided compliant with
> >> "simple-bus" bindings, and should pass "make dtbs_check".
> >>
> >> Remaining questions:
> >>
> >> - Should storage-bus exist? Or should drivers under it simply specify
> >> =A0=A0 32-bit DMA?
> >
> > Explicitly saying storage devices have one-to-one mapping
> > seems informative, to me.
sounds good to be explicit =


> >
> >> ---
> >> =A0 arch/riscv/boot/dts/spacemit/k1.dtsi | 53 =

> >> ++++++++++++++++++++++++++++++++++++
> >> =A0 1 file changed, 53 insertions(+)
> >
> > The short summary of what differs between your proposal
> > and what Guodong said is:
> > - You sort nodes alphabetically, Guodong did not
> > - You dropped the unit address
I'd agree with not adding unit number to the simple-bus

> > - You dropped the comments he had, which indicated which
> > =A0 devices "belonged" to each mapping
I went ahead and checked those comments, and found them all about =

devices under specific bus, I'm not strongly against adding the
comments but feel it's kind of unnecessary, or even in worst cases,
it may bring extra confusions.. on the other hand, you can always
check  device nodes under the bus to find what's there.

exmaple for dram4_range(vendor code)/dma_bus, the comments is
 /* DMA controller, and users */
what's is 'users'? still have to check the dts, and find them -
uart, spi, i2c, qspi, hdmi, sounds..

If people really want to add comments and help others to understand
this patch, then I'd suggest to add explanation in commit message(better?)
to fully describe all the busses, or why choose this name? -
 storage/multimedia/pcie/camera/dma/network_bus
pretty much in much high level perspective..

> > - You added a compatible property to each ("simple-bus")
> > - You added an explicit (empty) ranges property to each
> > - You add #address-cells and #size-cells properties, both 2
> > - Your dma-ranges properties are identical to Guodong's,
> > =A0 for all nodes
I think those all above already exist in Guodong's version which
align his idea

> >
> That was a good summary. Thanks!
> =

> My main goal of organizing the bus this way is making it actually pass =

> "make dtbs_check". I'm not sure if Krzysztof still objects to my reading =

> of simple-bus.yaml though.
It would be great if DT maintainer can clarify, or give an ACK

> =

> By the way, I don't think I will be making an RFC v2 of this. I think we =

> should get everything sorted under this one thread.
> =

Instead, from a SoC tree maintainer's perspective (whom taking care of
merging all the dts files), I'd rather perfer an independent or
separated patch for this given every party reached consesus, so we could
get this patch merged first and early, instead of getting them distributed =
all
over in different series, IMO, separated patches brings more dedependencies
if more than two series require one bus and result in more merge conflicts..
Besides, introducing new busses result in re-arrangement of previous nodes,
those like uart, i2c (even they have no DMA feature implemented currently)..

> Thanks again for taking a look.
> =

> Vivian "dramforever" Wang
> =


-- =

Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
