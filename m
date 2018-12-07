Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8DAC07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 14:31:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD64620837
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 14:31:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="INmzoppu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YmHlXfSf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD64620837
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmThoYdqNIVLzy3jrtctWXiJwNTZivY45HJUTvXVSIM=; b=INmzoppuY1JIes
	/RJRG/7824Q2BREAwUbc1irqvOVwdGmv/zH4tWX+nmRFIur4e1PMLaipftIryg+1Xgqt01XE5v+GH
	gPQGQq1/A9IVYN9nHA9l8DLdYyH8qO+3xb7Ygr/vbQgtS6lJnhk4zku2rnAODl3Gr7kGbn5Jq2FLU
	kkLeGfwtFNqj+WLotdp4u/fMr2lvGzGbqssam4S5Z40QwbBC96ppJHebD4ev10+CisBZkMukOov6Y
	LKQtA/33Q1uPNCr8mj9EmKNLFz5ISEssrUlXEfMvZO88WBmK1Z+uQV+LQQ/4m2GjG2YDQB50e7JcG
	RUfvbfBKW91e38pV7YTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVHAS-0001IT-4v; Fri, 07 Dec 2018 14:31:48 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVHAQ-0001I0-36
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 14:31:47 +0000
Received: by mail-pf1-x444.google.com with SMTP id y126so2043009pfb.4
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 06:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=pQvrTvbt5ZlQ1ucq18V0+cEkB9byjzVJXmwH6c2GtJc=;
 b=YmHlXfSfWSnjXLfwbC7Ak6E0eZZK1vdJ08PFmlH2+wNupk0plHS15KD5XobbGw9g26
 DNLjhZdW0hfhhi0wWdHfjCUzOlsDekNHIaaimm/x2d09VkUx4skYog+CvRIPiO1LVqz5
 D3SWZUp+JNDupIYw7Ld7bO6cx0Bai+z9Pl7cjPUUgnqogpXWt3Si9Lans1d485AhaPUi
 pc+97LN26bnrF/+Obkp/3s2CzLYMm0bOFlCtOYUosg80f2L+xS+Dxhy8hXiVDgK5i+zS
 QwFq4FM7xrdJUm1Fl3hrAhk4EVhHHTodMV5JhO288aVBZheat7o1CnuLS3VH3AKUa7TO
 rFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=pQvrTvbt5ZlQ1ucq18V0+cEkB9byjzVJXmwH6c2GtJc=;
 b=PkoNqo6IHSrWjmpQhQL2a/ouk2q/IYVRJoD/+rr40fG1FJMQ4q5FJeyLZiTB+nGIZY
 GAnN7VBqnisnoYmfP5TTXAmqUxM8wuTMc9ZfDH4CoSyvUprfn64GPY7cWIjb8lVE6BFI
 AVrQo+a/o6MsC1IZd6QrbsSI+38qXoEpDl5KZuv4QRGcimIA1Re0O+D3vV4XA6g96xNk
 kqJjZlmTqWwgvRmTQARuGaJoeesfws9ot3hqiJG0h3oNw2Y2xITVyF/I3NxNuU/vN2MR
 rsNcSU9y7y8D3tuZf4TsN72IlMpB1iPKFGKq7ngkfuZl9ro+gwRdgQAlnF1bIUmbiSTX
 o7QQ==
X-Gm-Message-State: AA+aEWb4DXRsGBxlg+6kZNdqB4ngk2oEBnlXhX7nvc5bStD/fmHS7WAg
 KphmLgGZg9dUqcIk1W26Hx0aqQ==
X-Google-Smtp-Source: AFSGD/W4rz+ItvPt0+2xVpF39KYu2QCPOrHC1dKJby4nrZxQ0gBxahGgarhJWP8BtaUPLQ263iSePg==
X-Received: by 2002:a62:9419:: with SMTP id m25mr2566759pfe.147.1544193095301; 
 Fri, 07 Dec 2018 06:31:35 -0800 (PST)
Received: from localhost ([2607:f598:b382:d300::14ef])
 by smtp.gmail.com with ESMTPSA id d25sm5609037pfe.40.2018.12.07.06.31.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Dec 2018 06:31:34 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Fri, 7 Dec 2018 06:31:33 -0800 (PST)
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: sifive: describe sifive-blocks versioning
In-Reply-To: <CAL_JsqJgt3VxHLcxY54Ojpqz_bLwGSySZ9meowgy6pnLPdXuLQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1812070624180.16511@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
 <20181207000104.GA10814@bogus>
 <alpine.DEB.2.21.9999.1812061645070.29609@viisi.sifive.com>
 <CAL_JsqJgt3VxHLcxY54Ojpqz_bLwGSySZ9meowgy6pnLPdXuLQ@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_063146_140338_35067DF6 
X-CRM114-Status: GOOD (  13.11  )
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
 Paul Walmsley <paul@pwsan.com>, Wesley Terpstra <wesley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Megan Wachs <megan@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


On Fri, 7 Dec 2018, Rob Herring wrote:

> On Thu, Dec 6, 2018 at 6:46 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> > On Thu, 6 Dec 2018, Rob Herring wrote:
> > > On Wed, Nov 21, 2018 at 05:06:56PM -0800, Paul Walmsley wrote:
> > >
> > > >  .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
> > > >  1 file changed, 38 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> > >
> > > Use the path that was suggested.
> >
> > Could you remind me which one that is?
> 
> In this thread: bindings/riscv/sifive/

SiFive also produces ARM-based SoCs.  Some of those ARM SoCs may use these 
IP blocks from sifive-blocks as well.  As far as I know, there's nothing 
RISC-V-specific about most of these IP blocks.  (As an example, there's 
nothing CPU architecture-specific about a UART.)

I'm fine with putting these bindings under bindings/riscv/, if that's 
where you need them to go.  But I'd like to understand the rationale 
better - could you describe that?

thanks,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
