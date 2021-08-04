Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4A6C4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 21:14:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 556C161040
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 21:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 556C161040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3p+mXYz9/wSq0zxWTjbAMeia/SLQZWytmzze66wyZKs=; b=RCBq6xlgFHDRJeDKBAe5I7fz2R
	UWktK1yWK/wuhVeWD1YrFtT9fDK86+9CVVIAYmJR/szkH5tHnUkfw13gRWt36rNec/anhcnEyPVNy
	5YXRnXSadN4P6P1AMKe6lBazu9t9NVOFIS/CJu7hO8seJ1liU6WI/bwyGoVZ1hsdRN2iTprs0w4uG
	EPi1wudS55iYkAoYhSaf+NzYIw6A5x1yQzI3h8NQ9ZjpmNhHIMqItphHqnjbf1gF1LmmRGlT2IMon
	bratnCVa2vW/bZ9hayvb1iMkywqB0w07bj/MhsC0aDVxCmlJjE7VGdvPapIL6+RhVKNZsok0EgPJf
	m0T/QpUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBOD3-007SXJ-40; Wed, 04 Aug 2021 21:13:53 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBOCz-007SWZ-IA
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 21:13:51 +0000
Received: by mail-pl1-x636.google.com with SMTP id k2so4436575plk.13
 for <linux-riscv@lists.infradead.org>; Wed, 04 Aug 2021 14:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pWeVOPuGe2rwR/ROAXUfTRwXClu2H2NNWD6p4NOstS8=;
 b=PwQjaVNp8FyJDWyiUT0Z8kpUGe8+CNzROVRPRHgR/dDii1HFfBEbPrU/LViRYGNseN
 Goj+KxfWobnXG2w+YLWviBprLG/E4CYFs5ur6vBD4C4FjyBuhWYZBwdt9yS3hFRCov+O
 05y8JHO7qSM6VF8APQ8FAENHjfM94RLB7TQbg2uSgzLFH1T75yxAq5MnrBIBQ/5i4OYl
 EyjjbTHapBQVbJdkZoqYsUsEvzG2fwFK+Ua9xM1bWcClktpFT34aEgwdnOq3Zj2ivvXm
 D6PIGidNR5JuWZWtkjLpC/B+UNKt/GVXYwGP4jiAiWFmcJ89K5kB9YCQV3nh5LJ/EoUS
 +A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pWeVOPuGe2rwR/ROAXUfTRwXClu2H2NNWD6p4NOstS8=;
 b=naQZrfOiIM2z45WGl6gKeHPMfuWrisK0yUfiJd0HALJqXOUL7CBC+bX4JWHnHidyJd
 9812y5800gJPo21ISQW6SPvo4S9F9qcnbRbnpXmFp6n9X9CKh8bWG+Pxu/ZBICiSlLv7
 MTBESRPHkTuUIkKhc4vbICiUvapQ9nTrtUx6cZkdcXRq7Iu/MFdcun3uut/r+mcwKxYw
 f6hOoDJIsxoKKBZJC8aKEWDA5yaHthfMpHtsFebbILcozR05OFR3IF3YkIvI6zcmqNFM
 jg/t45wSoqWgxhUia+FXLJ/fCvtLpCcvMgLQZ3uzpo0NLB7JWVhB2mZEiaFzcJbWlyvo
 zGvw==
X-Gm-Message-State: AOAM533hgfp5891DF0WThUancH2akU99Ejr5zyColGPEzG0CggkkNZiz
 jQ7n6s0nrLmwsp+LNyVeTGuanw==
X-Google-Smtp-Source: ABdhPJxmNRnC1qh7wzjVxVKaFhVi5Z3hxxqwFofh38QlmmnLtXqmkYyJ4V9kVrsfo+kv7/42Wvm31A==
X-Received: by 2002:a62:1d06:0:b029:3ab:9703:b6b8 with SMTP id
 d6-20020a621d060000b02903ab9703b6b8mr1372593pfd.0.1628111628112; 
 Wed, 04 Aug 2021 14:13:48 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w15sm3279146pjc.45.2021.08.04.14.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 14:13:47 -0700 (PDT)
Date: Wed, 04 Aug 2021 14:13:47 -0700 (PDT)
X-Google-Original-Date: Wed, 04 Aug 2021 14:13:46 PDT (-0700)
Subject: Re: [PATCH v4] dt-bindings: riscv: add starfive jh7100 bindings
In-Reply-To: <CAOnJCUL9uU5G1LOgfYPz9Ny77yFYaP5sgtdxG3_w=Zcsi+f96Q@mail.gmail.com>
CC: bmeng.cn@gmail.com, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 michael.zhu@starfivetech.com, tekkamanninja@gmail.com,
 jack.zhu@starfivetech.com, 
 leyfoon.tan@starfivetech.com, geert@linux-m68k.org, kernel@esmil.dk,
 devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org, drew@beagleboard.org
Message-ID: <mhng-c9300c9e-6877-492f-a290-7c51066d3920@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_141349_657061_4192E10D 
X-CRM114-Status: GOOD (  30.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 04 Aug 2021 13:54:16 PDT (-0700), atishp@atishpatra.org wrote:
> On Wed, Aug 4, 2021 at 1:33 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Thu, 15 Jul 2021 19:17:23 PDT (-0700), bmeng.cn@gmail.com wrote:
>> > On Tue, Jul 13, 2021 at 2:34 PM Drew Fustini <drew@beagleboard.org> wrote:
>> >>
>> >> Add DT binding documentation for the StarFive JH7100 Soc [1] and the
>> >> BeagleV Starlight JH7100 board [2].
>> >>
>> >> [1] https://github.com/starfive-tech/beaglev_doc
>> >> [2] https://github.com/beagleboard/beaglev-starlight
>> >>
>> >> Signed-off-by: Drew Fustini <drew@beagleboard.org>
>> >> ---
>> >> v4 changes:
>> >> - removed JH7100 SoC revision number after discussion with Geert
>> >>
>> >> v3 changes:
>> >> - added revision number for the board and soc after question from Palmer
>> >>
>> >> v2 changes:
>> >> - removed "items:" entry that only had "const: starfive,jh7100"
>> >> - correct typo in Description:
>> >>
>> >> Results of running checks:
>> >>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check \
>> >>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
>> >>     CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
>> >>     DTEX    Documentation/devicetree/bindings/riscv/starfive.example.dts
>> >>     SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
>> >>     DTC     Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
>> >>     CHECK   Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
>> >>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dtbs_check \
>> >>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
>> >>     SYNC    include/config/auto.conf.cmd
>> >>     UPD     include/config/kernel.release
>> >>     SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>> >>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb
>> >>     DTC     arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
>> >>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
>> >>     DTC     arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
>> >>     CHECK   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
>> >>     CHECK   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
>> >>     CHECK   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
>> >>
>> >> The dts file is from vendor repo and is being cleaned up right now in
>> >> preperation for submitting to the mailing list:
>> >> https://github.com/starfive-tech/linux/tree/beaglev/arch/riscv/boot/dts/starfive
>> >>
>> >>  .../devicetree/bindings/riscv/starfive.yaml   | 27 +++++++++++++++++++
>> >>  1 file changed, 27 insertions(+)
>> >>  create mode 100644 Documentation/devicetree/bindings/riscv/starfive.yaml
>> >>
>> >
>> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>>
>> Thanks.  This is on for-next, as Rob suggested taking it via the RISC-V
>> tree.
>>
> Given that beagleV starlight mass production is cancelled [1], are we
> still upstreaming the support for this ?

I'm not sure, but I wasn't quite sure where to have that discussion.  I 
figured that the boards exist so there's no reason to shoot this down, 
given that it's just the vendor DT list.  At a bare minimum there's out 
of tree support for this, so having the DT strings defined seems sane as 
that's a defacto interface with bootloaders.

Maybe this is more of a question for Drew: I think we were all OK 
working through the issues with the first-run chip when there was going 
to be a lot of them, but with such a small number produced I'm not sure 
if there's going to be enough interested to take on all that effort.  

I'm not quite sure where we stand on support for this: at some point 
there were some ideas floating around as to a way to support it without 
major software changes (allocating into the non-caching regions).  If 
that pans out then I'm fine handling this, at least from the RISC-V 
side, but if we're going to have to go through all the ISA/SBI stuff 
then it's probably not worth it.  Also not sure if there are a bunch of 
starfive-specific drivers that would be needed to make this boot, in 
which case it's probably best to wait for whatever comes next.

>
> [1] https://www.cnx-software.com/2021/07/31/beaglev-starlight-sbc-wont-be-mass-manufactured-redesigned-beaglev-risc-v-sbc-expected-in-q1-2022/
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
