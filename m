Return-Path: <SRS0=E0x1=NQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A84AC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 20:40:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC3752081C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 20:40:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A63Qc/St";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTM5Fh9r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC3752081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NloXjdyE7kNZqYgUdEkhJN7IiiMGo7u2uLNVWEtrMq0=; b=A63Qc/StiSmY5P
	AjcgFfAUv/fQEgo7BdrD1DYjjohBdxT5e5CzV/UzZdeAquDwJz3BzPWBT+xyDSjUzoweuQ+PmQF09
	qCaF4Rvk0c/aBl6pTUwyod0SDu48zoyghYupKtyU3oxAdGhPr0M5tOKn4Mb6ACd7ezSC3B/xn/GpJ
	fqqvNJt04ragvkvLgI48n5XaiQECwZZ+Mx6hQysEzIuVfS7J3eooMSmyamZF3ZgefDpJyLQ84xJaz
	wliqVvAMVjjgz3s1GHYV1l4RqLLMavIXsppbT4cL63wplqk7GZNHxgjWzB4+66OCp8VEGRbiltESM
	EeuBcexSnitvrK3yIJbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJlfe-0003RF-Tf; Mon, 05 Nov 2018 20:40:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJlDG-0000XU-8r
 for linux-riscv@lists.infradead.org; Mon, 05 Nov 2018 20:12:09 +0000
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A41D2085B
 for <linux-riscv@lists.infradead.org>; Mon,  5 Nov 2018 20:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1541448649;
 bh=Zv2B+mhtmaoNujKxOuDJSpSGoeGTK5ri2wKqNhmkh3E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WTM5Fh9rU9Ak4R8/jHEFgnXrwmu1z03sB8hgK4aBMSbkcHNqaQsfusZ+ukLP0Nt7B
 IOcqB3gIVQ1xJtJW1aUwv9vTYfiRW58ZAX5GnWxpbqW+28VGAs04b9IKiJmghhVb55
 dVgOv41xj9L/PnkZ7ud8fEJk3jH0D4MnHon8Ds5s=
Received: by mail-qk1-f177.google.com with SMTP id y16so15863842qki.7
 for <linux-riscv@lists.infradead.org>; Mon, 05 Nov 2018 12:10:49 -0800 (PST)
X-Gm-Message-State: AGRZ1gJDXdLTurOoxuClWuw66t7nkAr4SfB/nr8B436x8QQ9RNt8j2KR
 6fl0okZL+1NMvMvMFVRVq/UxGsx4SlaFT6kGVw==
X-Google-Smtp-Source: AJdET5eTsZZoUbc/PRbLnGki8BKzSjnJ5+YGjaPBq5YJcbRH21xxOWRGIYEtr19hjL0j/1Rv2o76l/qdmQbAVl0ngwA=
X-Received: by 2002:ae9:edd8:: with SMTP id
 c207mr21211649qkg.184.1541448648384; 
 Mon, 05 Nov 2018 12:10:48 -0800 (PST)
MIME-Version: 1.0
References: <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
 <mhng-799bd6f4-e4af-481e-90d8-bdc0e30f2530@palmer-si-x1c4>
In-Reply-To: <mhng-799bd6f4-e4af-481e-90d8-bdc0e30f2530@palmer-si-x1c4>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 5 Nov 2018 14:10:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJOxdE=gD4MyKuL5XZ57Z6UdM4_SU4qs26BNz6YcqM76A@mail.gmail.com>
Message-ID:
 <CAL_JsqJOxdE=gD4MyKuL5XZ57Z6UdM4_SU4qs26BNz6YcqM76A@mail.gmail.com>
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181105_121152_742736_B5E33FC8 
X-CRM114-Status: GOOD (  30.28  )
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
 Damien.LeMoal@wdc.com, alankao@andestech.com, Zong Li <zong@andestech.com>,
 Anup Patel <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181105201036.m-pqG4cOvoVVrUZFMIW3fw5YbXhMrmn9NbJnQ0zCnag@z>

On Mon, Nov 5, 2018 at 1:39 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Fri, 02 Nov 2018 06:09:39 PDT (-0700), robh+dt@kernel.org wrote:
> > On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com> wrote:
> >>
> >> Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
> >> But it doesn't need a separate thread node for defining SMT systems.
> >> Multiple cpu phandle properties can be parsed to identify the sibling
> >> hardware threads. Moreover, we do not have cluster concept in RISC-V.
> >> So package is a better word choice than cluster for RISC-V.
> >
> > There was a proposal to add package info for ARM recently. Not sure
> > what happened to that, but we don't need 2 different ways.
> >
> > There's never going to be clusters for RISC-V? What prevents that?
> > Seems shortsighted to me.
> >
> >>
> >> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >> ---
> >>  .../devicetree/bindings/riscv/topology.txt         | 154 +++++++++++++++++++++
> >>  1 file changed, 154 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/riscv/topology.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/riscv/topology.txt b/Documentation/devicetree/bindings/riscv/topology.txt
> >> new file mode 100644
> >> index 00000000..96039ed3
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/riscv/topology.txt
> >> @@ -0,0 +1,154 @@
> >> +===========================================
> >> +RISC-V cpu topology binding description
> >> +===========================================
> >> +
> >> +===========================================
> >> +1 - Introduction
> >> +===========================================
> >> +
> >> +In a RISC-V system, the hierarchy of CPUs can be defined through following nodes that
> >> +are used to describe the layout of physical CPUs in the system:
> >> +
> >> +- packages
> >> +- core
> >> +
> >> +The cpu nodes (bindings defined in [1]) represent the devices that
> >> +correspond to physical CPUs and are to be mapped to the hierarchy levels.
> >> +Simultaneous multi-threading (SMT) systems can also represent their topology
> >> +by defining multiple cpu phandles inside core node. The details are explained
> >> +in paragraph 3.
> >
> > I don't see a reason to do this differently than ARM. That said, I
> > don't think the thread part is in use on ARM, so it could possibly be
> > changed.
> >
> >> +
> >> +The remainder of this document provides the topology bindings for ARM, based
> >
> > for ARM?
> >
> >> +on the Devicetree Specification, available from:
> >> +
> >> +https://www.devicetree.org/specifications/
> >> +
> >> +If not stated otherwise, whenever a reference to a cpu node phandle is made its
> >> +value must point to a cpu node compliant with the cpu node bindings as
> >> +documented in [1].
> >> +A topology description containing phandles to cpu nodes that are not compliant
> >> +with bindings standardized in [1] is therefore considered invalid.
> >> +
> >> +This cpu topology binding description is mostly based on the topology defined
> >> +in ARM [2].
> >> +===========================================
> >> +2 - cpu-topology node
> >
> > cpu-map. Why change this?
> >
> > What I would like to see is the ARM topology binding reworked to be
> > common or some good reasons why it doesn't work for RISC-V as-is.
>
> I think it would be great if CPU topologies were not a RISC-V specific thing.
> We don't really do anything different than anyone else, so it'd be great if we
> could all share the same spec and code.  Looking quickly at the ARM cpu-map
> bindings, I don't see any reason why we can't just use the same thing on RISC-V
> -- it's not quite how I'd do it, but I don't think the differences are worth
> having another implementation.  Mechanically I'm not sure how to do this:
> should there just be a "Documentation/devicetree/bindings/cpu-map.txt"?

Yes, but ".../bindings/cpu/cpu-topology.txt".

And if we need $arch extensions, they can be moved there. (Really, I'd
like to get rid of /bindings/$arch/* except for maybe a few things.)

> If everyone is OK with that then I vote we just go ahead and genericise the ARM
> "cpu-map" stuff for CPU topology.  Sharing the implementation looks fairly
> straight-forward as well.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
