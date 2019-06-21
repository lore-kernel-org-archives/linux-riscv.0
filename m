Return-Path: <SRS0=JY4f=UU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E4BC43613
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2019 19:50:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01FC62075E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2019 19:50:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kl6pzYU2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/DvUGTR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01FC62075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2gUspzDl2ZXk6ZqgMgTTu1eh5FVfPOlgvI2LhPX4Pg=; b=Kl6pzYU2YXR12b
	2Z8eWQYU4F6b/PjtVN0qvEdwPZqYpWC0C0YYSScLZZ6rICJKEVVOPZf0VKe4aTZ9h5ugZYI7NRnmP
	MrzgvHovej9latc/ByM7/8Zva403L+1jpYrwNXCrSM+dr9HRXciOzBYR6+mBQD07YFhjqrLrFhDAq
	pa6m4YXCC9rJMOM2cfcbPFRfcU4BKuWBeBh9qBrEG2W+wbZarApKR8rsvKNUFlKMNjK0nxDm1vM8I
	LnwTzDlzWFQBVH7EZlJsj3uacO9duFPOLXnz48+T8QE9bOfIYmjIHjgAd106b1NUJI1BQZdf6HHRu
	hBJ8xwqRaBNPZOFP/OTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hePY6-0002bR-Bh; Fri, 21 Jun 2019 19:50:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hePY2-0002aa-UD
 for linux-riscv@lists.infradead.org; Fri, 21 Jun 2019 19:50:12 +0000
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 081B1208CA
 for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2019 19:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561146610;
 bh=04JoEBxD3BFQvCruh9qRPwf97IIUDRYFCn4G/UANqMg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=c/DvUGTRbo284HFgnXzdQ1URo3qv+8FtczRuvG/PEF2kvColGkafTHWVSlKwemimP
 QimdsMdIrkhxHixKgp+8wxLp9u6+NU66LuWrYMI1SyaNdJBD3W3eByS7n67tu2oZw1
 nhYNqW3ADmPBB/XGFH9x2gwJpEpW9kmECmb5AIw0=
Received: by mail-qk1-f181.google.com with SMTP id c70so5323030qkg.7
 for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2019 12:50:09 -0700 (PDT)
X-Gm-Message-State: APjAAAXA599GSB+evGVRnkEp3APp6CjSLZTwaV1FRC7nYCUX6rvWNiS/
 VMAwp2B/l5XaFbi2OEI/EzGpHi3dtnUxfr6+pg==
X-Google-Smtp-Source: APXvYqz5cBp3x+DmSEQitU24gvMNTmfNuB58xPNZsCfkqZeUWaT8NtfpQbGa48QKpKo3Wv6jZktZ44i2bkYwwhqXESo=
X-Received: by 2002:a05:620a:1447:: with SMTP id
 i7mr17358138qkl.254.1561146609224; 
 Fri, 21 Jun 2019 12:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190602080126.31075-1-paul.walmsley@sifive.com>
 <20190602080126.31075-4-paul.walmsley@sifive.com>
 <CAL_JsqJd6s6ta==AoxmNXdpzWL1RytSwR2P4MOfAFSEJavbt+w@mail.gmail.com>
In-Reply-To: <CAL_JsqJd6s6ta==AoxmNXdpzWL1RytSwR2P4MOfAFSEJavbt+w@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 21 Jun 2019 13:49:58 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL1a-irBa4MaVzak5DrTjxiySuqTJSQOqwzymVa=Uz=gg@mail.gmail.com>
Message-ID: <CAL_JsqL1a-irBa4MaVzak5DrTjxiySuqTJSQOqwzymVa=Uz=gg@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: riscv: convert cpu binding to json-schema
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_125010_994079_4EF34848 
X-CRM114-Status: GOOD (  15.40  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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
 Paul Walmsley <paul@pwsan.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 10, 2019 at 3:46 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Sun, Jun 2, 2019 at 2:01 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> >
> > At Rob's request, we're starting to migrate our DT binding
> > documentation to json-schema YAML format.  Start by converting our cpu
> > binding documentation.  While doing so, document more properties and
> > nodes.  This includes adding binding documentation support for the E51
> > and U54 CPU cores ("harts") that are present on this SoC.  These cores
> > are described in:
> >
> >     https://static.dev.sifive.com/FU540-C000-v1.0.pdf
> >
> > This cpus.yaml file is intended to be a starting point and to
> > evolve over time.  It passes dt-doc-validate as of the yaml-bindings
> > commit 4c79d42e9216.
> >
> > This patch was originally based on the ARM json-schema binding
> > documentation as added by commit 672951cbd1b7 ("dt-bindings: arm: Convert
> > cpu binding to json-schema").
> >
> > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > Signed-off-by: Paul Walmsley <paul@pwsan.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-riscv@lists.infradead.org
> > ---
> >  .../devicetree/bindings/riscv/cpus.yaml       | 168 ++++++++++++++++++
> >  1 file changed, 168 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/cpus.yaml
>
> Reviewed-by: Rob Herring <robh@kernel.org>

You all have applied this now leaving the binding checks broken. I
have a fix for one issue validating the schema, but there's a
dependency on schemas/cpus.yaml which I gave feedback on.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
