Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27110ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 17:32:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED5E2206B5
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 17:32:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kZEmSn6J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED5E2206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5slqyVzTA3ro9RFnNrToS7D8oxgh8ck6JziFSbCDO8=; b=kZEmSn6JyAFp4+
	wycyWvCBtUk8xkqVXaMJ9m2z/gkFrrzbfYk33zgfJnqhlg6kCSk3ITQ4qEMDYSJLt3R8p0JazEpN/
	ycsljUyfWao5SRPRWMUgkPAMG7LJcQWlSNe8HL95hDxug1/SctwddZmgWukVi/sdfnAhX7P3Io0jo
	uSGq0ung+kxDoqZGoKgoL6SHOCy4YZMvxvx5Gc94qvD3menkfzMpQBNKuWSLYDqONth2ojg12zyuR
	WG2mBZBxaM9KCFDSqsZdNk3CV4S3GplMq7Uq6VKQB1799RwcRJIsiHUjpEnM/6/rFI8gQeKeNNRfu
	bSIwzSf8yZQdt4WF9xhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFN1V-0007aQ-7J; Wed, 24 Oct 2018 17:32:49 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFN1S-0007ZY-5z
 for linux-riscv@lists.infradead.org; Wed, 24 Oct 2018 17:32:48 +0000
Received: by mail-ot1-f68.google.com with SMTP id l1so5858157otj.5
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 10:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=5eK/ys7qQlVoNj6YzRGQKlOu50hpT9TYqptst3BzI6w=;
 b=GMfxpkRg7C215Z4tSTOltRTdZ5uK9/PuncHHbq3GAu64m3om4qGo+vidJ/BirdElO8
 wdX/6FT7AXi6x+O77QhhriPM/4NZu415VEfR8nFni47hgXjscX7q8mKpuIAfDfTdrad+
 xVLQ3l1AH5ldF814ERflg2th5urNhJg6IOa10ajxmpyS2N7+OViSTLYiE308vqsJRrPV
 L5ynGpRgsuJMW+adHx78lR8okPo1WSoWScdCMP6QNa8oQWgUdo8ieRSf4u7E7vlzj+/n
 oRK4IXefxLAo2QhIptVNP6aG49JCoLi0h49KQ3CEUJlFkEd1x3WnDDUyjSsj6xvwp6CD
 2Rzg==
X-Gm-Message-State: AGRZ1gLjaKjcqLp+8jUZmo+dPE9tngM02P7RPrlmiRDDWIBtKpDLl2J7
 bcmxZLB2Cmhfhc2+U4oQEQ==
X-Google-Smtp-Source: AJdET5e4ZDG1ZrIAdc/aWVV2PG76YYa2QCWXEC7CQMpPM3R8sG/EbEWtdsIMqb+D5MC8gAQ01fB9Ew==
X-Received: by 2002:a9d:7455:: with SMTP id p21mr2053108otk.247.1540402354631; 
 Wed, 24 Oct 2018 10:32:34 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p6sm2015763otc.43.2018.10.24.10.32.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Oct 2018 10:32:33 -0700 (PDT)
Date: Wed, 24 Oct 2018 12:32:32 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: add documentation for the
 SiFive UART driver
Message-ID: <20181024173232.GB5652@bogus>
References: <20181019184827.12351-1-paul.walmsley@sifive.com>
 <20181019184827.12351-2-paul.walmsley@sifive.com>
 <CAL_JsqJBSqaxnETdJg1Mdp+H2ay+WKT0JaxLe6D4Fwo_99qUkw@mail.gmail.com>
 <4317548d-f831-29ba-3be9-35f080587db9@sifive.com>
 <CAL_JsqLagTgjDhZ02X=wPFDB4WF2bR7=LyzSW9D=ooo_XB_zOg@mail.gmail.com>
 <6571bb0e-b36a-1196-4d90-8aa62d8a2a90@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6571bb0e-b36a-1196-4d90-8aa62d8a2a90@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_103246_230236_5009A7D7 
X-CRM114-Status: GOOD (  45.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024173232.weMmDg7qzk4ot5OnGRGDkpIU7USPWH_3LqekjZgdyVQ@z>

On Tue, Oct 23, 2018 at 10:05:40AM -0700, Paul Walmsley wrote:
> =

> On 10/20/18 7:21 AM, Rob Herring wrote:
> > On Fri, Oct 19, 2018 at 5:06 PM Paul Walmsley <paul.walmsley@sifive.com=
> wrote:
> > > On 10/19/18 1:45 PM, Rob Herring wrote:
> > > > On Fri, Oct 19, 2018 at 1:48 PM Paul Walmsley <paul.walmsley@sifive=
.com> wrote:
> > > > > Add DT binding documentation for the Linux driver for the SiFive
> > > > > asynchronous serial IP block.  Nothing too exotic.
> > > > > =

> > > > > Cc: linux-serial@vger.kernel.org
> > > > > Cc: devicetree@vger.kernel.org
> > > > > Cc: linux-riscv@lists.infradead.org
> > > > > Cc: linux-kernel@vger.kernel.org
> > > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > Cc: Rob Herring <robh+dt@kernel.org>
> > > > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > > > Cc: Palmer Dabbelt <palmer@sifive.com>
> > > > > Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> > > > > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > > > > Signed-off-by: Paul Walmsley <paul@pwsan.com>
> > > > > ---
> > > > >    .../bindings/serial/sifive-serial.txt         | 21 +++++++++++=
++++++++
> > > > >    1 file changed, 21 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/serial/si=
five-serial.txt
> > > > > =

> > > > > diff --git a/Documentation/devicetree/bindings/serial/sifive-seri=
al.txt b/Documentation/devicetree/bindings/serial/sifive-serial.txt
> > > > > new file mode 100644
> > > > > index 000000000000..8982338512f5
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/serial/sifive-serial.txt
> > > > > @@ -0,0 +1,21 @@
> > > > > +SiFive asynchronous serial interface (UART)
> > > > > +
> > > > > +Required properties:
> > > > > +
> > > > > +- compatible: should be "sifive,fu540-c000-uart0" or "sifive,uar=
t0"
> > > > > =

> > > > As I mentioned for the
> > > > intc and now the pwm block bindings, if you are going to do version
> > > > numbers please document the versioning scheme.
> > > > =

> > > > =

> > > > Will add that to the binding document.
> > I don't seem to be making my point clear. I don't want any of this
> > added to a binding doc for particular IP blocks. Write a common doc
> > that explains the scheme and addresses the questions I asked. Then
> > just reference that doc here.
> > =

> > Maybe this is documented somewhere already? Otherwise, if one is
> > creating a new IP block, how do they know what the versioning scheme
> > is or what goes in the DT ROM?
> =

> =

> Seems like there might be some confusion between IP blocks as integrated =
on
> an SoC vs. IP blocks in isolation.=A0 It's not necessarily the SoC integr=
ator
> that sets an IP block version number; this can come from the IP block ven=
dor
> itself.=A0 So each IP block may have its own version numbering practices =
for
> the IP block alone.
> =

> =

> For SiFive IP blocks, we at SiFive could probably align on a common versi=
on
> numbering structure for what's in the sifive-blocks repository.

I thought you had that from what Palmer said and what I've seen so far. =

You have at least 3 bindings so far it seems.

> But other IP blocks from other vendors may not align to that, or may not
> have version numbers exposed at all.=A0 In those cases there's no way for
> software folks to find out what they are,=A0 as you pointed out earlier.=
=A0 This
> is the case with most DT compatible strings in the kernel tree.
> =

> For example, we've integrated the NVDLA IP block, from NVIDIA, on some
> designs.=A0 Any NVIDIA version numbers in that IP block will probably not
> follow the SiFive version numbering scheme.=A0 I'd propose the right thin=
g to
> do for an IP block compatible string is to follow the vendor's practice, =
and
> then use the SoC integrator's version numbering practice for the
> SoC-integrated compatible string.

Experience has shown that using compatible strings only specific to =

vendor IP blocks (with or without version numbers) is pretty useless.

For licensed IP, I'd suggest you follow standard practices. A genericish
fallback is generally only used when there's lots of SoCs sharing a =

block.

In these cases though it needs to be clear what bindings follow some =

common versioning scheme and which don't. That's accomplished =

by referencing what the version scheme is. Otherwise, I'd expect I'll =

see the versioning scheme copied when in fact the source IP in no way =

follows it.

> In effect, an SoC integration DT compatible string like
> "sifive,fu540-c000-uart" implicitly states an IP block version number:
> "whatever came out of the fab on the chip"[**].=A0=A0 I'd propose that ev=
en in
> these cases, there's an advantage to keeping the "0" on the end, since it
> uniquely identifies an SoC-independent IP block, rather than just the type
> of the IP block. =A0 But if the "0" on the end of the SoC integration DT
> compatible string is problematic for you, we can certainly drop that last=
 0
> from the SoC integration DT compatible string, and only suffer a slight l=
ack
> of clarity as to what version was integrated on that chip.

Personally I'd leave it off, but I'm fine with either way. It just needs
to be the way you document for SiFive IP blocks.

> But for IP block-specific version strings like "sifive,uart0", I think we
> can address your concern, at least for these public IP blocks. Since the
> SiFive UART and some other peripheral IP blocks are open-source, the publ=
ic
> can have a pretty good idea of what DT version number corresponds to the
> source RTL, since the RTL is public. =A0 The version number identifies a
> specific programming model, without tying that programming model to any
> SoC-specific workarounds, etc.=A0 So for these cases, I think there's a p=
retty
> good case for having IP block-specific version numbers in DT compatible
> strings, and I hope you'll agree.
> =

> =

> The advantage for all of us is that there's then no need to embed
> chip-specific DT match strings in these drivers, for the most part.=A0 We=
 just
> match on "sifive,uart0" and that's it, assuming no chip-specific workarou=
nds
> are needed.
> =

> =

> > > >    Where does the
> > > > number come from?
> > > =

> > > It comes from the RTL, which is public:
> > > =

> > > https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/de=
vices/uart/UART.scala#L43
> > I'm not going to go read your RTL, sorry.
> =

> =

> There's no need, but you did ask where it came from.=A0 Sorry you didn't =
like
> the answer.

I only meant that in context of reviewing the IP block. My questions =

were meant to be what questions should a common document answer.

> Please let us know what you want us to do.
> =

> =

> Thanks for your review
> =

> =

> - Paul
> =

> =

> ** The caveat is that even with SoC identifiers in the Linux DT compatible
> strings, there's not enough information in many of the existing kernel DT
> compatibility strings to uniquely identify chip versions.=A0 Taking OMAP =
and
> Tegra as examples, there are several different chip versions for a given =
SoC
> generation that came out of the fab.=A0 =A0 OMAP chip version strings usu=
ally
> began with "ES"; Tegra version numbers, as I recall, were a letter and two
> numbers.=A0 For the most part, those versions were never specifically
> identified in the upstream kernel DT strings or in DT file names. (There =
are
> some exceptions with OMAP where we did identify specific chip version
> numbers, because sizable numbers of folks had boards with early silicon, =
and
> we were committed to supporting them at the time.)=A0=A0=A0 Sadly even ad=
ding
> these additional chip version identifiers to the DT strings wouldn't be
> perfect: I've seen at least one large vendor implementing metal-only ECOs
> without incrementing public chip version numbers. The point here is that
> we're already not uniquely identifying IP blocks with our current Linux DT
> compatibility string scheme.

Yes, I'm certainly aware of this aspect. We have to draw the line =

somewhere between enough information to distinguish differences and =

having a sane number of compatible strings. I mainly expect that the 1st =

versions of SoCs are short lived and ECO changes don't affect =

compatibility. That's obviously not always the case, but hopefully is =

sufficient in most cases.

Really, I'd just like to see folks get better at putting version and =

configuration information into registers. We only need DT for what we =

can't discover.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
