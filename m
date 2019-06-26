Return-Path: <SRS0=5cCT=UZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836D7C48BD6
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2019 21:01:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54E4A216FD
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2019 21:01:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OKVKDtsA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XYNuR30T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54E4A216FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qiZczkXmQtkmvL4IDNvM7nuX+WDbGYoFecRtwvmrWVw=; b=OKVKDtsAufmCvp
	CPdLd/215i0FD1ZioBVSyj0DBP/3cIxfhnPZ7P2vdJZnf8BkzOEOIWrmMla/yNF5J+GEaapt9sOy8
	UKOikZg6kiu5i0/9gX/KBXghfLV9gALZMoh1VUn2oCygRe+2itud9rwZMpPIxEy7Mi2S/Aw3KBiWT
	6b1KxQm+cUuymx7n4lstGXQQKikOsMgWTLUfUnkUTItzLSDoI317Ibu+cZL+2H6rMkmfAVOIrcnCJ
	rX4huvNu/zX5tB4IUy1AvF2RWdSfLa9H2V+sHNgmB+jMcD+llW9Qqeo2YJpqRxgGGpApMiOhxVsY6
	6tQnzfsWaG/kxrMk+tGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgF2n-0004JI-SE; Wed, 26 Jun 2019 21:01:29 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgF2l-0004Ip-CR
 for linux-riscv@lists.infradead.org; Wed, 26 Jun 2019 21:01:28 +0000
Received: by mail-io1-xd42.google.com with SMTP id k20so8145028ios.10
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2019 14:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=PtByYI9t5DpYVWm2H7GeEhPtk58KGByxBL002Rq++Nc=;
 b=XYNuR30T2ykXXMBZUWk7+kaY55TQJBy/Rx9mq1LrtlauSuY+nyJZ26jGoCSpbkfuur
 nNIdMfn9ibJViTMYN5LUqvvZUJglVXOYUUDXonx8WoDIeudxDCHhzH5tyQ/hdxQ5pQNF
 PzPWNQwzkIZktsTcU2hxcG8Biu/fJiki6ZfsHcPy6ogs9EdGZzjWHKBPJmKXjcOTa3OM
 LoA8Lby6vONaglUTGTL77UUWdyI5+7+6Gb1fhg68jwo0Dkbqn3CeIMsIa8TKAp3qwlIj
 CWMYJ31J5Jda9fDtjvzcn5JFUyHgQpfWLf0xjinGpC5aRTw0W6tzIZ7CXiZI8Wx85Xm+
 jcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=PtByYI9t5DpYVWm2H7GeEhPtk58KGByxBL002Rq++Nc=;
 b=e59WYocDTH9vBroMi7RsnnkRhXzXAqHv9bHu9mrJtwfbOW/HJYsqfrX7l6+J8gyFmI
 Pzdz/u8UTNbPL2gjRqYvUFwLm+NVh5FD+MLIRJHVpE9+R4vkDNzuM3cKxzTVb0oBgH+F
 wQESKo/+dLCYO58COlqbpG+FotYQEL+WCRXmEjxWW2nSpfFVt0seMR8tnrAm8OXxJmfb
 OQ7RpQl61DVZAQCqCLOEBV8/6jUFVrnaIOCWlu4U+1Pgj6vZFwq3myO63SHJulCTuILn
 8+66XimkxAe3CcHa25U605z5lqh/BbfuwJeVfPQbRuAHgp5g8aP+IIYXgORhRQ/CqT1L
 Emug==
X-Gm-Message-State: APjAAAWXRr/k82IQ3lalcSyRC6XY2VyBMqVT5fAjONZh0/V3okmLoFAw
 21QSz7bzddbx1bbOIBJ/jeLmyQ==
X-Google-Smtp-Source: APXvYqyaC/Rknevvr0RNsSk494GNIwNMoZEzEKFydW08aOjnIS+l9ESG3JKcMXLHukEsIAy5/kV9Ng==
X-Received: by 2002:a5d:87c6:: with SMTP id q6mr223932ios.115.1561582886347;
 Wed, 26 Jun 2019 14:01:26 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 d17sm206248iom.28.2019.06.26.14.01.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 14:01:25 -0700 (PDT)
Date: Wed, 26 Jun 2019 14:01:23 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: riscv: resolve 'make dt_binding_check'
 warnings
In-Reply-To: <alpine.DEB.2.21.9999.1906261325290.23534@viisi.sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1906261358440.23534@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1906260829030.21507@viisi.sifive.com>
 <CAL_JsqJs6MtvmuyAknsUxQymbmoV=G+=JfS1PQj9kNHV7fjC9g@mail.gmail.com>
 <alpine.DEB.2.21.9999.1906261325290.23534@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_140127_488023_5E294F51 
X-CRM114-Status: GOOD (  15.65  )
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
Cc: linux-riscv@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 26 Jun 2019, Paul Walmsley wrote:

> On Wed, 26 Jun 2019, Rob Herring wrote:
> 
> > On Wed, Jun 26, 2019 at 9:30 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> > >
> > > Rob pointed out that one of the examples in the RISC-V 'cpus' YAML schema
> > > results in warnings from 'make dt_binding_check'.  Fix these.
> > >
> > > While here, make the whitespace in the second example consistent with the
> > > first example.
> > >
> > > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > > Cc: Rob Herring <robh@kernel.org>
> > > ---
> > >  .../devicetree/bindings/riscv/cpus.yaml       | 26 ++++++++++---------
> > >  1 file changed, 14 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > index 27f02ec4bb45..f97a4ecd7b91 100644
> > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > @@ -152,17 +152,19 @@ examples:
> > >    - |
> > >      // Example 2: Spike ISA Simulator with 1 Hart
> > >      cpus {
> > > -            cpu@0 {
> > > -                    device_type = "cpu";
> > > -                    reg = <0>;
> > > -                    compatible = "riscv";
> > > -                    riscv,isa = "rv64imafdc";
> > > -                    mmu-type = "riscv,sv48";
> > > -                    interrupt-controller {
> > > -                            #interrupt-cells = <1>;
> > > -                            interrupt-controller;
> > > -                            compatible = "riscv,cpu-intc";
> > > -                    };
> > > -            };
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +        cpu@0 {
> > 
> > This only works because you removed 'cpus' and therefore none of this
> > schema is applied.
> 
> I'm not following you - could you point out where "cpus" was removed?

If it helps, this patch is simply to fix the dtc warnings that you 
mentioned in your post on devicetree-spec@.  Without this patch, with 
"make dtbs_check", the following warnings are generated:

  DTC     Documentation/devicetree/bindings/riscv/cpus.example.dtb
Documentation/devicetree/bindings/riscv/cpus.example.dts:75.25-35: Warning (reg_format): /example-1/cpus/cpu@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/riscv/cpus.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/riscv/cpus.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/riscv/cpus.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/riscv/cpus.example.dts:73.23-84.19: Warning (avoid_default_addr_size): /example-1/cpus/cpu@0: Relying on default #address-cells value
Documentation/devicetree/bindings/riscv/cpus.example.dts:73.23-84.19: Warning (avoid_default_addr_size): /example-1/cpus/cpu@0: Relying on default #size-cells value

When the patch is applied, dtc doesn't report any of these warnings.

Let me know if I'm missing something obvious.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
