Return-Path: <SRS0=X0/G=C7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB59C4363D
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 19:27:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3D4323787
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 19:27:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YqlLs8fq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wJfuNKf9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3D4323787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wTqJpLq/FS9yfXXF7f+UmXwKcnB1zgMC2KlPswl935c=; b=YqlLs8fqtppwEmK9cWH+4NmWP
	lEkdnFKh5IhH3q2+crNqvRvrAyzV/66gAQOsqi6QRjH7nZMC5946O+yFTQXeosNBnmw2kFbuhMCok
	4lYOZTXlxcxuyUiroXXW5lzRapIdF8CscrriWEe8bLEnLQ1b/dTdqPLfIbibQMmQe/xUKpMId6q0O
	VKE9vz9+AGJq21DrY0pxHNSoDk9vrnkQmcAHPLF3Q2PMea4dRMntG8bIWPYkk0Ss4Lokx90Oytogs
	c3fxjF/gl7574FyC4eh1DyDmQQzpstw8FGPLzTKckpwby1NlReYteZ0RHOmCRBUNWTaVGzR951kkN
	E2AjdTY5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKnwt-0002BA-OY; Tue, 22 Sep 2020 19:27:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKnwq-00029m-2a
 for linux-riscv@lists.infradead.org; Tue, 22 Sep 2020 19:27:33 +0000
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5C592395B
 for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2020 19:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600802850;
 bh=y4Fd+VRM7UpDSLqyMTN3OBbvyJnJFNwNQbYAe8OBzSM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wJfuNKf9Fxjix5TRnUu3VV/mdftdtMtbbVPUTttslBQnSagSVOMyUItXbc9pSdhtS
 XevikvDfGdiMxhOGyZNt3Pc57lHVubf0Etd9sspW7oOP4OGgcD5neN/xdtGtB5mBh1
 vBoVRPA5YmQlUfSYQ5NE0ZaM9ayOUk7g/3X2VvOQ=
Received: by mail-oi1-f171.google.com with SMTP id x69so22257601oia.8
 for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2020 12:27:30 -0700 (PDT)
X-Gm-Message-State: AOAM533HM1qVhvIlxqN6Bpc9Es01zLvuumF3Zoucu7X337sGTdaijpD+
 1nZ5QLxjW2LmEviUZfMGycyVcCk9/nW8SKX1ow==
X-Google-Smtp-Source: ABdhPJwhJMX8D3+trJZN/+08Gl+SD0tqa/EL4rPKkiuDbtL7YuTlvwm7x2n7VkNZnRT9wiHG5Sriw9wPMJIdmEwApBI=
X-Received: by 2002:aca:4d58:: with SMTP id a85mr3701800oib.147.1600802850151; 
 Tue, 22 Sep 2020 12:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <1598633743-1023-1-git-send-email-sagar.kadam@sifive.com>
 <1598633743-1023-2-git-send-email-sagar.kadam@sifive.com>
 <20200914180000.GA4136408@bogus>
 <DM6PR13MB3451786E8B73D50D36A89FD097200@DM6PR13MB3451.namprd13.prod.outlook.com>
In-Reply-To: <DM6PR13MB3451786E8B73D50D36A89FD097200@DM6PR13MB3451.namprd13.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Sep 2020 13:27:19 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+4i-zq1Ro90h6XEbwhyqWKKj+MQ5KW6U-qFSViWh3SNA@mail.gmail.com>
Message-ID: <CAL_Jsq+4i-zq1Ro90h6XEbwhyqWKKj+MQ5KW6U-qFSViWh3SNA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 1/1] dt-bindings: riscv: sifive-l2-cache:
 convert bindings to json-schema
To: Sagar Kadam <sagar.kadam@openfive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_152732_270578_900E79AA 
X-CRM114-Status: GOOD (  33.84  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yash Shah <yash.shah@openfive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2020 at 9:17 AM Sagar Kadam <sagar.kadam@openfive.com> wrote:
>
> Hello Rob,
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Monday, September 14, 2020 11:30 PM
> > To: Sagar Kadam <sagar.kadam@openfive.com>
> > Cc: linux-kernel@vger.kernel.org; linux-riscv@lists.infradead.org;
> > devicetree@vger.kernel.org; Paul Walmsley ( Sifive)
> > <paul.walmsley@sifive.com>; palmer@dabbelt.com;
> > aou@eecs.berkeley.edu; Yash Shah <yash.shah@openfive.com>
> > Subject: Re: [RESEND PATCH v2 1/1] dt-bindings: riscv: sifive-l2-cache:
> > convert bindings to json-schema
> >
> > [External Email] Do not click links or attachments unless you recognize the
> > sender and know the content is safe
> >
> > On Fri, Aug 28, 2020 at 10:25:43PM +0530, Sagar Kadam wrote:
> > > Convert the device tree bindings for the SiFive's FU540-C000 SoC's L2
> > Cache
> > > controller to YAML format.
> > >
> > > Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
> > > ---
> > >  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 51 ------------
> > >  .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 92
> > ++++++++++++++++++++++
> > >  2 files changed, 92 insertions(+), 51 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-
> > cache.txt
> > >  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-
> > cache.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > > deleted file mode 100644
> > > index 73d8f19..0000000
> > > --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > > +++ /dev/null
> > > @@ -1,51 +0,0 @@
> > > -SiFive L2 Cache Controller
> > > ---------------------------
> > > -The SiFive Level 2 Cache Controller is used to provide access to fast
> > copies
> > > -of memory for masters in a Core Complex. The Level 2 Cache Controller
> > also
> > > -acts as directory-based coherency manager.
> > > -All the properties in ePAPR/DeviceTree specification applies for this
> > platform
> > > -
> > > -Required Properties:
> > > ---------------------
> > > -- compatible: Should be "sifive,fu540-c000-ccache" and "cache"
> > > -
> > > -- cache-block-size: Specifies the block size in bytes of the cache.
> > > -  Should be 64
> > > -
> > > -- cache-level: Should be set to 2 for a level 2 cache
> > > -
> > > -- cache-sets: Specifies the number of associativity sets of the cache.
> > > -  Should be 1024
> > > -
> > > -- cache-size: Specifies the size in bytes of the cache. Should be 2097152
> > > -
> > > -- cache-unified: Specifies the cache is a unified cache
> > > -
> > > -- interrupts: Must contain 3 entries (DirError, DataError and DataFail
> > signals)
> > > -
> > > -- reg: Physical base address and size of L2 cache controller registers map
> > > -
> > > -Optional Properties:
> > > ---------------------
> > > -- next-level-cache: phandle to the next level cache if present.
> > > -
> > > -- memory-region: reference to the reserved-memory for the L2 Loosely
> > Integrated
> > > -  Memory region. The reserved memory node should be defined as per
> > the bindings
> > > -  in reserved-memory.txt
> > > -
> > > -
> > > -Example:
> > > -
> > > -     cache-controller@2010000 {
> > > -             compatible = "sifive,fu540-c000-ccache", "cache";
> > > -             cache-block-size = <64>;
> > > -             cache-level = <2>;
> > > -             cache-sets = <1024>;
> > > -             cache-size = <2097152>;
> > > -             cache-unified;
> > > -             interrupt-parent = <&plic0>;
> > > -             interrupts = <1 2 3>;
> > > -             reg = <0x0 0x2010000 0x0 0x1000>;
> > > -             next-level-cache = <&L25 &L40 &L36>;
> > > -             memory-region = <&l2_lim>;
> > > -     };
> > > diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > > new file mode 100644
> > > index 0000000..e14c8c6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > > @@ -0,0 +1,92 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +# Copyright (C) 2020 SiFive, Inc.
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/riscv/sifive-l2-cache.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: SiFive L2 Cache Controller
> > > +
> > > +maintainers:
> > > +  - Sagar Kadam <sagar.kadam@sifive.com>
> > > +  - Yash Shah <yash.shah@sifive.com>
> > > +  - Paul Walmsley  <paul.walmsley@sifive.com>
> > > +
> > > +description:
> > > +  The SiFive Level 2 Cache Controller is used to provide access to fast
> > copies
> > > +  of memory for masters in a Core Complex. The Level 2 Cache Controller
> > also
> > > +  acts as directory-based coherency manager.
> > > +  All the properties in ePAPR/DeviceTree specification applies for this
> > platform.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/cache-controller.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +     - enum:
> > > +        - sifive,fu540-c000-ccache
> > > +    description: |
> > > +      Should have "sifive,<soc>-cache" and "cache".
> >
> > That's not what the schema describes or the example has (the 'cache'
> > fallback).
> >
> Thanks for your suggestions.
> I see that if we include the standard 'cache' property here, it injects  error's in other yaml's as reported here [1]
> In plain txt format of this binding the standard "cache" property is mentioned to be also included along with soc specific compatible string.
>
> Please correct me if I am wrong here:
> So in order to retain the earlier description as Should have "sifive,<soc>-cache" and "cache",  I excluded "cache" property from example
> as I assumed it is implied for cacheinfo infrastructure to work properly.
> I will retain the earlier description (from.txt) which was "sifive,fu540-c000-ccache" and "cache"

You will need a custom 'select' schema to only match on
"sifive,fu540-c000-ccache". There's numerous examples in the tree.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
