Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E737C07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 15:19:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 486B820837
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 15:19:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZIK9gcnT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxdymbnM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 486B820837
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RV/A7VP4+LzVPYgRQs2lbsl3bZMP45YqF+Fwbibim0=; b=ZIK9gcnTQlmxlF
	Bwj++kHNEfnNux0vEm8la5iBYYP4b2oAurPecf8QGJNepARxtnAYdKjSRHD9yItSwNk4eHCS4CTAK
	UBGpSF3P7l2GsF08OypTtisJab3n8WcdJdwQXMTcbYvshuT5Ujfs3+Lv1sswUpGVKqRjWGcx0HPai
	UYzSjfLloo8oWuyFiD9+5DE3p7D8MA35x3bq4iUFaPvRlgxz4yd6U8AWMqsxKt3WaFo/F0Nb4MBLw
	OXk6pWLOxiYIQB+NRoDOMZKHZt+uSZkMolaPcI0Lg8mrfoENiGsTPw2wVTehiFdjaBDue/tPBHyYe
	xBdH/l45p1WLkceufKpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVHun-00007i-GH; Fri, 07 Dec 2018 15:19:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVHuk-00006M-PA
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 15:19:40 +0000
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE23720837
 for <linux-riscv@lists.infradead.org>; Fri,  7 Dec 2018 15:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1544195968;
 bh=GgQpZyggwvg1c0v49la1/Do0wIB1W4l6a9s+oeWC3Nk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hxdymbnMnfE9jqddXW+qQm04hAtP4VehwN1GOT9aMrVRtDNMvIQ/do8yIYUKPynyc
 h945N9F9juBjJHyeoLiLkC7HoBLhC6qUtlRhiyHyUCyyNkY8kKju3yatykceHMJBeF
 3zQwNNMQPrfeSkBBJ3WwERmlwGRW2xyBx4jN9zUM=
Received: by mail-wm1-f42.google.com with SMTP id y139so4698446wmc.5
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 07:19:27 -0800 (PST)
X-Gm-Message-State: AA+aEWZCsA0MvVqOn72N5VKOUALpQEYKrbNlioLyUIpDZrlEOG50tW7x
 GvLAfrHlttfj1uH4sBNygYgFxeb2y/t32ZP7VO4f9g==
X-Google-Smtp-Source: AFSGD/U8lJakSrxUD2N+1NYCVYC5+M6Wc1YI0Km9KFosyibzJNEgDZRzTD7kyaYrAMCKJWNR/Gz4KXE4yvyC5V+lLDc=
X-Received: by 2002:a1c:b687:: with SMTP id g129mr2543595wmf.59.1544195966260; 
 Fri, 07 Dec 2018 07:19:26 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
 <20181207000104.GA10814@bogus>
 <alpine.DEB.2.21.9999.1812061645070.29609@viisi.sifive.com>
 <CAL_JsqJgt3VxHLcxY54Ojpqz_bLwGSySZ9meowgy6pnLPdXuLQ@mail.gmail.com>
 <alpine.DEB.2.21.9999.1812070624180.16511@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1812070624180.16511@viisi.sifive.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 Dec 2018 09:19:14 -0600
X-Gmail-Original-Message-ID: <CABGGisyc-nLZkxtJAr5-BT4ziJO1AW6MU-4ChgBV73No67y0PA@mail.gmail.com>
Message-ID: <CABGGisyc-nLZkxtJAr5-BT4ziJO1AW6MU-4ChgBV73No67y0PA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: sifive: describe sifive-blocks versioning
To: paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_071938_837873_6FA97624 
X-CRM114-Status: GOOD (  14.05  )
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
 paul@pwsan.com, wesley@sifive.com, palmer@sifive.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, megan@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 7, 2018 at 8:31 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>
> On Fri, 7 Dec 2018, Rob Herring wrote:
>
> > On Thu, Dec 6, 2018 at 6:46 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> > > On Thu, 6 Dec 2018, Rob Herring wrote:
> > > > On Wed, Nov 21, 2018 at 05:06:56PM -0800, Paul Walmsley wrote:
> > > >
> > > > >  .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
> > > > >  1 file changed, 38 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> > > >
> > > > Use the path that was suggested.
> > >
> > > Could you remind me which one that is?
> >
> > In this thread: bindings/riscv/sifive/
>
> SiFive also produces ARM-based SoCs.  Some of those ARM SoCs may use these
> IP blocks from sifive-blocks as well.  As far as I know, there's nothing
> RISC-V-specific about most of these IP blocks.  (As an example, there's
> nothing CPU architecture-specific about a UART.)

Fair enough. As-is is fine.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
