Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A012ECDE46
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 16:54:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDECD207DD
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 16:54:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uhDPRuwr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDECD207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ouf2405U7d1dsFedKQ1McAIbSsgrD6QvJ8mQiBD5hNI=; b=uhDPRuwrjFEcIP
	xe7bVZhDu3c63eJ28MwdsOkbI/a6tCUKLiKCw9BRkqZqPsT1DPyU9MmWk++RzWA4D1PzhLb3Kr67f
	e9UqqISNIqtjfabKDIRZDC4sZT7OtySoCKDzlgnXnA8xQJo0B4dmMPtH3+mTRiqJ9CS1QSpwHe2Cl
	mGF7vQBg0Eyt862YnvEVQY+Tlumq2FL5mR6ZAtC/hiOukClmSyas1ErarY2I3zkL/Bx5oh/jJYDhJ
	UMyDtGMufsrsKrvgvmsduEN5wqRlSjV7uY+R6t75R3vOmXO07HziNC4iskZsh1zZTnnx9Rlh5l9XZ
	5+nK59Yod5YSgLcQADbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFMQ3-0000Xx-Lz; Wed, 24 Oct 2018 16:54:07 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFMPy-0000WS-SK
 for linux-riscv@lists.infradead.org; Wed, 24 Oct 2018 16:54:06 +0000
Received: by mail-oi1-f193.google.com with SMTP id s69-v6so4648947oie.10
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 09:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9wnzo/fjgFoqpVEw9Od+hUuoxdFlrZ6oPYjM0/LOPyQ=;
 b=PZZlwhk9J8dyPXf/hs4Q2Ul79ecLBTUa3LrHh9uezCi06ZP+ffxTN+TGrnyiZWT6xF
 91JIlZq9pSAyFv2FndAJf7FzOuQEOAKCFl6qKkp4G/ycFArBjAeGCCJ+MxLGwtyAtTR2
 dJx3Vjg9KYlL0SpS77hLc8YGH7AVKKZgA+QdzyUESP5riVvnx9/+YOL+9Iw5ChQSxr8o
 8q1iMoektTP0zxS8k164XsT6fbQgDOPGx20ZKw6Dc7w9FGTeWVmzk6rznlQcilh38n7C
 EFCgNthCDfnMhrtAqH424m3hZKUxsDuR9yAwbfY5Tyo1A63IYO4LEq3Gt3fM3irEsKHO
 e8ow==
X-Gm-Message-State: AGRZ1gI8WN/WKXezCTKkfjfiicDwbpc0/SOOWHMTKyk8dDqrn3J7yMX4
 koPyYTWDAh/LY4+Oic/mkQ==
X-Google-Smtp-Source: AJdET5eUJtzcf52Qxko/WbSXxCJmakKplq/IlyHOroaN3JY6fLwXr/5oKeOgt3JpGjiGgCo+ylj58A==
X-Received: by 2002:aca:ed57:: with SMTP id
 l84-v6mr1779271oih.188.1540400031059; 
 Wed, 24 Oct 2018 09:53:51 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r83-v6sm1633007oia.55.2018.10.24.09.53.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Oct 2018 09:53:50 -0700 (PDT)
Date: Wed, 24 Oct 2018 11:53:49 -0500
From: Rob Herring <robh@kernel.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: add documentation for the
 SiFive UART driver
Message-ID: <20181024165349.GA5652@bogus>
References: <CAL_JsqJBSqaxnETdJg1Mdp+H2ay+WKT0JaxLe6D4Fwo_99qUkw@mail.gmail.com>
 <mhng-44b7601c-c2f4-4de8-a12e-7730e03d691e@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-44b7601c-c2f4-4de8-a12e-7730e03d691e@palmer-si-x1c4>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_095403_660748_F8321101 
X-CRM114-Status: GOOD (  31.42  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, paul@pwsan.com,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024165349.NUjqxnAEUuHgg6G5F1HrPAmY15VdjLRlbxhuQWuQQdU@z>

On Mon, Oct 22, 2018 at 09:41:51AM -0700, Palmer Dabbelt wrote:
> On Fri, 19 Oct 2018 13:45:57 PDT (-0700), robh+dt@kernel.org wrote:
> > On Fri, Oct 19, 2018 at 1:48 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> > > 
> > > Add DT binding documentation for the Linux driver for the SiFive
> > > asynchronous serial IP block.  Nothing too exotic.
> > > 
> > > Cc: linux-serial@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-riscv@lists.infradead.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: Palmer Dabbelt <palmer@sifive.com>
> > > Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> > > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > > Signed-off-by: Paul Walmsley <paul@pwsan.com>
> > > ---
> > >  .../bindings/serial/sifive-serial.txt         | 21 +++++++++++++++++++
> > >  1 file changed, 21 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.txt b/Documentation/devicetree/bindings/serial/sifive-serial.txt
> > > new file mode 100644
> > > index 000000000000..8982338512f5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/serial/sifive-serial.txt
> > > @@ -0,0 +1,21 @@
> > > +SiFive asynchronous serial interface (UART)
> > > +
> > > +Required properties:
> > > +
> > > +- compatible: should be "sifive,fu540-c000-uart0" or "sifive,uart0"
> > 
> > I assume once again, the last '0' is a version? As I mentioned for the
> > intc and now the pwm block bindings, if you are going to do version
> > numbers please document the versioning scheme. Palmer mentioned the
> > compatible string is part of the IP block repository? Where does the
> > number come from? What's the next version? Major vs. minor versions?
> > ECO fixes? Is the version s/w readable? How do you ensure it gets
> > updated? All that should be addressed.
> 
> The RISC-V ecosystem is a bit different than that of ARM, MIPS, or Intel in
> that the ISA is an royalty-free open standard that anyone can implement (ie,
> without even signing a license agreement), with only the "RISC-V" trademark
> being held behind a pay+conformance wall.  As a result, we don't actually
> have any control over who builds a RISC-V chip so all we at SiFive can
> really to is try to demonstrate good practices in software land and go from
> there.

Rights to the ISA and cores may be different, but how chips are built 
is not really all that different (or doesn't have to be).

> As far as SiFive's codebase is concerned, the version number is embedded in
> the RTL generator, and a device tree is generated along with the RTL.  This
> device tree is then embedded into a mask ROM on the chip, which allows the
> earliest stage of boot to proceed.  As I'm sure you know, boot is a very
> complicated process and as a result the device tree passed to Linux doesn't
> necessarily look like what's in the ROM, but the intent is to keep iterating
> until we can get these as similar as possible -- that's why we're submitting
> every devicetree binding to the standard.

So all this discussion is purely SiFive specific and really has nothing 
to do with RISC-V ecosystem.

Putting the DT into the ROM isn't something I'd do. It's simply not 
going to work timeline wise IMO.

> Specifically as far as the UART is concerned, the compat string that's not
> chip-specific lives here (the "sifive,fu540-c000-uart" string lives in an
> internal chip repo that I can't point to):
> 
>    https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/uart/UART.scala#L43
> 
> The version numbering scheme right now is pretty simple: I try to pay as
> much attention as possible to how the hardware changes (both by looking and
> with some automation), and I go yell at anyone who does something stupid.  I
> know it's not the most scalable of schemes, but it's the best we have.  The
> UART is actually an interesting case right now because we have an
> outstanding pull request that adds a bit to the UART and then adds
> "sifive,uart1" to the compat string
> 
>    https://github.com/sifive/sifive-blocks/pull/90

Relying on people to catch whether changes are important or not is bound 
to fail. It's really got to be built into the design flow.

Even just updating a version register I've experienced the h/w designers 
forgetting to update it.

> My intent is to ensure that the device tree's compat string uniquely
> identifies the software interface to a block.  Thus, whenever a device's
> implementation changes in a software-visible way (bug fix or feature
> addition) we change the compat string -- either adding one (as is the case
> of the UART, where the compat string will be both "sifive,uart1" and
> "sifive,uart0" since the new feature is backwards compatible with the old
> software) or changing one (if the interface change is not compatible with
> old software).

What about config options? Say the UART has a configurable FIFO size.

What about major vs. minor version changes? Respins of chips would need 
to make minor changes if picking up major changes are deemed too risky.

> Like I said above, this is all a manual process right now and this only
> applies to SiFive's implementations.  I'm confident that I can at least
> ensure that, for any given SiFive implementation, a block's compat string
> will uniquely identify the software interface to it.  For the rest of the
> RISC-V world all we can do is set a good example and review the software.

This is all good information and is essentially what I'm looking for. I 
just don't want it lost in a reply to an email, but something you can 
reference. Look at bindings/arm/primecell.txt for example. That 
describes a family of IP blocks and not any specific device.

Whether the versioning is sufficient or not, I don't really care as long 
as you docuemnt what it is so it is consistent. Since you have a common 
schema across IP blocks, that means you should have a common document.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
