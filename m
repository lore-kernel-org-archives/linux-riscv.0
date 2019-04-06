Return-Path: <SRS0=QxaH=SI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6C1C282DA
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2019 23:14:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77F3E2133F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2019 23:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y0Wo/cDe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="N0n5AeeB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77F3E2133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nq7zil1E3b6XLAw9mEZt7bcvo7ZVKzO4ZpO7Q/idMxg=; b=Y0Wo/cDe/9ozD3
	DMT7S3B1gpQag5+Mkrd4su7Qm02pEHdZqhgz6fGphFCBhN4P0AXJRIl6pVKogD0M9Z8diCah2MgT1
	5HKkDcCVHR9AJJuMdjlTElJ0dSms/GFyu9Lf6/C/e0q5+lvkdQFREOtSm2iargmW8Fk7gu2ZhuMTv
	WQcOYM53UAPd7IrxGJ1M1kboh0ItwKssjKD3plziSX3A0yFJC8l/HhfyA3GTQZgjCGqRn4ad0u1Ou
	U9CmYX5RnnsSp/TnsNrSPNGog3EMbVFy2qZ3/ATFN5YLb3tsznDcajrgMTQz/7p0zzXfNCnNyhnrm
	McnV6Bde5QRmo3h98Dkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCuWF-0005xX-0G; Sat, 06 Apr 2019 23:14:39 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCuWC-0005xB-Fw
 for linux-riscv@lists.infradead.org; Sat, 06 Apr 2019 23:14:37 +0000
Received: by mail-pf1-x443.google.com with SMTP id 9so5335609pfj.13
 for <linux-riscv@lists.infradead.org>; Sat, 06 Apr 2019 16:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=frF4c8dwjqAtQm7fNwHrFIJU5kbbeArN1OCV7ETeQ+A=;
 b=N0n5AeeBuyZPmfGfR4IqRd2JgNdFPd3TBiW8TqLcNt1h5vrST8rVGoeSgx9M4PGCYs
 IOFifl0SCGXtoCemErLvpr08zc8LBcB1esrj0gzX497N8tn/lXlT/TP4QmCCce+3xynH
 m7vaQ8maDu3Q3C+JsCzVNBW4zT7EMlStDEVqGp4ndd99Hg69Xl0hxC4qrwz2i/q+pSRN
 k5kmy8hv7orsO+SQ3RPTlLE5cV+Wd0Rht96GMP0xCq7S2ur10ZzX0K0/p3KRTb6Pnce6
 yLCAPp9+UyIOBzrPjk186+0V2nYL5wwvjB20/3Ac1cjFL/WxSucF0Rld+2Cpec2pEOwB
 cKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=frF4c8dwjqAtQm7fNwHrFIJU5kbbeArN1OCV7ETeQ+A=;
 b=U597rnj2jDo5v4hxKP6QkKrdD0timIjTPpI7gfOEniPyaqNBEnOlIvcVoIaZCLuZ6X
 enl5ZJElv86pcrH+jAYeDn3p8TQLMdlTlrPgDYRqFPGr4mpC+UozJyzhHpJ4+U5TeOse
 CdNxpBumGB5ZWNfqcaRSAKpIWN64fWhgkwM9j9GbUqgJON8Q5vwWkG8peb3iyD5CgaH1
 V1bP2r5hqNBkvP5MLgVYA9CCakiz+Z4+tAi2zTJ1+WFlcOad8ER3W6ShrlqXZPNAcjhd
 CKKEvyw46dgwXIv+KgRiqGquV8ShEg3Rbh8W93SEj4+nCKjHvZZ3EmjAGZzF/OOC+die
 YKzA==
X-Gm-Message-State: APjAAAVNGq85AO1DdAYUnnhofG/N7khJPG2KlEs8fbgW7jMmTfFT4/OT
 oP0dO7aqRsfS36GrbDfqcS0Etg==
X-Google-Smtp-Source: APXvYqyNm0WS2gDAuj6dHckm1kMDjqculrY2nMq6qtaMTQyF9OctGiI8gci+qK98/wgivkodd8Ko4A==
X-Received: by 2002:aa7:9ab7:: with SMTP id x23mr1272048pfi.27.1554592474693; 
 Sat, 06 Apr 2019 16:14:34 -0700 (PDT)
Received: from localhost ([52.119.120.223])
 by smtp.gmail.com with ESMTPSA id f15sm18564141pgf.18.2019.04.06.16.14.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 06 Apr 2019 16:14:33 -0700 (PDT)
Date: Sat, 6 Apr 2019 16:14:32 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 7/7] riscv: dts: add initial board data for the SiFive
 HiFive Unleashed
In-Reply-To: <20181220212618.GA27359@bogus>
Message-ID: <alpine.DEB.2.21.9999.1904061612310.18279@viisi.sifive.com>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
 <20181215052154.24347-8-paul.walmsley@sifive.com>
 <20181220212618.GA27359@bogus>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190406_161436_565794_F0C40EF0 
X-CRM114-Status: GOOD (  13.65  )
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
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 20 Dec 2018, Rob Herring wrote:

> On Fri, Dec 14, 2018 at 09:21:54PM -0800, Paul Walmsley wrote:
> > Add initial board data for the SiFive HiFive Unleashed A00.
> > 
> > Currently the data populated in this DT file describes the board
> > DRAM configuration and the external clock sources that supply the
> > PRCI.

...

> > diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
> > new file mode 100644
> > index 000000000000..0c6afabe69e3
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
> > @@ -0,0 +1,39 @@
> > +// SPDX-License-Identifier: Apache-2.0
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> 
> This should be a single line with: (Apache-2.0 OR GPL-2.0+)

Done.

> > +	model = "SiFive HiFive Unleashed A00 (FU540-C000)"
> > +	compatible = "sifive,hifive-unleashed-a00-fu540",
> > +		"sifive,hifive-unleashed-fu540";
> 
> SoC compatible should be here too.

Done.

> > +	soc {
> > +		hfclk: hfclk {
> > +			#clock-cells = <0>;
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <33333333>;
> > +			clock-output-names = "hfclk";
> > +		};
> > +		rtcclk: rtcclk {
> > +			#clock-cells = <0>;
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <1000000>;
> > +			clock-output-names = "rtcclk";
> > +		};
> 
> Are these the clock inputs to the SoC or dummy clocks until you write a 
> proper clock driver? If the former, they should be at the top level. 

Done.


Thanks for your comments; Will send an updated patch set.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
