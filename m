Return-Path: <SRS0=hRw5=MF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5B5C11F67
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 06:04:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70E2961279
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 06:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70E2961279
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Gc3s2ii7sIddlvdsoU6NlGGt4144B4wuphBLXerPMk=; b=C9HOOpqkljqURl
	3EgMfr81m/6ILpvW5HJxkdSYgaAnID7B+ndDc36g+Ef8REng9CpUAX/ShF3biczPV1kcXMp67fItv
	A5Rn6W4AqfQHhlReuPq1FzpCyOMXtOAKRWF/fhO8HF4+l4ngYyfDBqc56wFviU7yK5c2KdySJWYnL
	3McfjbmBhfLTbPJ78dIDcZ7zob6c4uR3Ej9akieC/h3kpP9+bSjQ5ebrEHz3YtEgNzv6LZh+sgewh
	OBpsk5K5+5G6Qim6jT8L0ODylMXaqItbWul6nz/B930lAlA5xXfMqico7thGuVZ/mrcBuTMCBXmm7
	+2+auO5DPrwrLIgv0WNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3BWE-009F2Z-SS; Tue, 13 Jul 2021 06:03:46 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3BWB-009F0q-ER
 for linux-riscv@lists.infradead.org; Tue, 13 Jul 2021 06:03:45 +0000
Received: by mail-pf1-x42a.google.com with SMTP id o201so13514050pfd.1
 for <linux-riscv@lists.infradead.org>; Mon, 12 Jul 2021 23:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FB5vlvnYYvrU21B0CO4PGpbTyzy5lXFnKOJGx4/Q5XE=;
 b=H4eCa4SvuHL/QWjRdLmS+gv2GALPuJmxIAHxiRqfZdnVu6of/q5Co0QFLNCiInuu1k
 LUirhDbKxTne3QHePIiEfmQ77whgezOlJ8Nwelh11uNtXr2Pk2A3x0jt0Ven/CSYeQqM
 Ds24EAskBKW8wcANZhwqsBkrWJIP9lcJiuGn/j6UdIDP7OottKITrU8q8dAiWSy74/+b
 eyTi2D5XOH5KY5XmzsmFnftZixqqDxFQOIT3DBwkEIXh4YcurcRGQqUOW8UAYiQJiEkt
 cPgfcyi/HFc+oVcbfXjAeOVL1z6mWhweZuNbrpiV2UizV88hZKSX+Xv4EWVho1gOBUj9
 EcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FB5vlvnYYvrU21B0CO4PGpbTyzy5lXFnKOJGx4/Q5XE=;
 b=pjLgbtlCwVktGzIbuFj3RqaTn9yseSRYQHq0EeiMj8oJn6vObFDlGZ1oJ9m7Ntc7g6
 Qhh9d4i8Q4tUoIYjis8fVrSoAIZoR61/LqsEdgavjwVzpV3CgQ6H9++MXgw5XQCfCJok
 akXirSLP5SjBysBd6Pi6gmFW6pRbUsWSsRaFz+dQkysv3cz/34dRjGgx+vq05I9UAWnZ
 T0tfFmPFlHbyF458NVCxik+KqVhkQfBKn7UN1pRJGHuXXxPqvKdS0P+p8eOGzTe16D6E
 UVORNVJlaOhb8JDx2DcjH1lz6vOhgAql82PEXE4YwdyB2UJ+vFe2FIL7pK7ezxww5UYN
 +61A==
X-Gm-Message-State: AOAM532SQrBpvZ1Oo6O8bvA6ouyhNZTAeIygu8CABYW5x+4aquBVNjC6
 EP7InohJDe6n06cGcp6hDEEPCg==
X-Google-Smtp-Source: ABdhPJw2WQAbtFk5/oGiEfXgsdAIOhd7cw/6gmLcg2Wkdqol49gEbGfNEypCUC8rP0zYXi+GhAGHkQ==
X-Received: by 2002:aa7:8218:0:b029:316:88e:2a3a with SMTP id
 k24-20020aa782180000b0290316088e2a3amr2814735pfi.16.1626156220600; 
 Mon, 12 Jul 2021 23:03:40 -0700 (PDT)
Received: from x1 ([174.127.163.79])
 by smtp.gmail.com with ESMTPSA id n6sm12039049pgb.60.2021.07.12.23.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 23:03:39 -0700 (PDT)
Date: Mon, 12 Jul 2021 23:03:38 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Wei Fu <tekkamanninja@gmail.com>, Jack Zhu <jack.zhu@starfivetech.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] dt-bindings: riscv: add starfive jh7100 bindings
Message-ID: <20210713060338.GA2992629@x1>
References: <20210709201603.2625664-1-drew@beagleboard.org>
 <CAMuHMdVBVAzy3cZtR1pOTNq3wTgGx+0_dvUXU118XfT+rCOSrw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVBVAzy3cZtR1pOTNq3wTgGx+0_dvUXU118XfT+rCOSrw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_230343_516731_7146FCBA 
X-CRM114-Status: GOOD (  25.58  )
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

On Mon, Jul 12, 2021 at 01:24:19PM +0200, Geert Uytterhoeven wrote:
> Hi Drew,
> 
> On Fri, Jul 9, 2021 at 10:17 PM Drew Fustini <drew@beagleboard.org> wrote:
> > Add DT binding documentation for the StarFive JH7100 Soc [1] and the
> > BeagleV Starlight JH7100 board [2].
> >
> > [1] https://github.com/starfive-tech/beaglev_doc
> > [2] https://github.com/beagleboard/beaglev-starlight
> >
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > ---
> > v3 changes:
> > - added revision number for the board and soc after question from Palmer
> 
> Thanks for the update!
> 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> > @@ -0,0 +1,27 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/starfive.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive SoC-based boards
> > +
> > +maintainers:
> > +  - Michael Zhu <michael.zhu@starfivetech.com>
> > +  - Drew Fustini <drew@beagleboard.org>
> > +
> > +description:
> > +  StarFive SoC-based boards
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: beagle,beaglev-starlight-jh7100-r0
> > +          - const: starfive,jh7100-r0
> 
> While I can be convinced about the board revision number (probably you
> know better if there will be different board revisions that matter),
> I'm wondering if the revision number makes sense for the SoC part.
> Will there be a new revision of jh7100, or will the next revision
> be jh7110, which will use a different compatible value anyway?
> Is there an on-chip register that allows the kernel to find out the
> revision info? Might be better to use that with soc_device_register()
> and soc_device_match()

We do anticipate making additional BeagleV Starlight boards with the
JH7100 SoC and those new boards may need to have a different USB hub
chip due to sourcing. Thus it is possible that there will be a r1 board
in the future.

However, I think you are correct about the SoC. There won't be any new
revisions of the JH7100 SoC. All chips with that part number will have
the same design. There will eventually be JH7110 which is a different
design but I did not want to prematurely add a compatible for that.


Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
