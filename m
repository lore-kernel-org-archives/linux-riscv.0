Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896B3C001B0
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 17:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DtT3wmaZmmDm5KKDY/Zv+tZgvlVhYq63bP+dPLjALzQ=; b=cGuB7GiLEgEDbp
	uRGnP2ttAthBwooclAle/415vzmP/DY33QXius/jMTJI4wZOG31y/UU4rID3H2GMWNU8GrOxgFWf3
	BLjLJHe4ZNnFTiCyDPKlt36epir2Utqt99wn0LfYfF7By9aiJlhTgCfgCMEVNdgtEc834DspIYJbS
	jtuoEZwTSNigs+VdSVkvyIfKW83nnnMgn1YU05s27SnEVeZTXh2nT7b1lHlrxyojsealKzHKz03cc
	numOuvZ6/FKkIP/+VHHQpW8P8eLdChjkxkuKv83cT5j+fLxsgspANhaCrYLQ2ewgvF6tpIjYi5pYu
	G32a8Ul16soGqvqSkRWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNcuD-001Vov-1h;
	Sun, 23 Jul 2023 17:30:05 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNcu9-001Vnu-1I
	for linux-riscv@lists.infradead.org;
	Sun, 23 Jul 2023 17:30:04 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6686ef86110so1961671b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 23 Jul 2023 10:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690133400; x=1690738200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=anD/aZSlr+vLjZWLNxtxT0F5flAWAxjs67Wwhw6u0QM=;
        b=E+ArsCyWXwauL0di3emQhq+Fmc/7kBA6oessKwzGOTGr4kxRa5UnXYIUloBVNs+ZKr
         vDWe5CeL4XVcghejAaiQh3imZha3QAH4TVK1+GJopZIWFYvcuRALPiYmvSNU0m21Sjw4
         mVVULeIdyuDTF05PGfRAe1xMhSQ+PXcdmc93bY7QEF2YeBfnOnwQMjPJMLGeFLu6qVOp
         rANcYkbU6ZNvd3ef9xGVGK+W/hs5zOaQkBpJdt3zkbqUAW489Q/sbs97BJXw3sWJjlGO
         HOkVEtQK3sZJZXzeXPOzzeXVCAuv1E4zHLc1i25OFc1QloXYwnyV0ITpoM7Mib5K5eJG
         m97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690133400; x=1690738200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anD/aZSlr+vLjZWLNxtxT0F5flAWAxjs67Wwhw6u0QM=;
        b=MQNH52qSJuOkX9ccbPIKlMi18+3XN0Za6dNxK1CHlemPnm+A5zueLz7y/sWHrEvwTE
         A62vqzr7sMTbEwmNCH8MPDNiJ/PvuxkYmgsYuYrE+O2qabA9X6Os90n9bzL/X0DSyj0i
         yYvAfcBv+6H362bei2flI+vN3F27dsJkFo0jukNvYRLsRu4k4/bTwgeGkI0hTP5j7zYP
         JIA/N5hwrrYbEemvtQbo+OxCxRpnVUE2QPb5RWfYpHY+5K/mbs+MddU6Q9oXwtHdZK34
         u8ZF0GcviEGZlSCXeThuEf3s+gYYvDF22f4msR0NrSFHpX2ODZei7y4o1EAL6x1DDbsh
         DL/A==
X-Gm-Message-State: ABy/qLYN90H0y+eMIazQabfxiH1nQKrOsLFB98gE9eHFizqTODNAvm5P
	/yKqWTTyN95eyu64kWQT3U9Exg==
X-Google-Smtp-Source: APBJJlGzn18xvFg4hiXQsp73KgOF0fT+h4xDUJN4Wco5VrV/ebEtcvNWM2uHS2/B+5arR7FXdrOezA==
X-Received: by 2002:a05:6a00:1307:b0:674:8fe0:1262 with SMTP id j7-20020a056a00130700b006748fe01262mr4911219pfu.18.1690133400075;
        Sun, 23 Jul 2023 10:30:00 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:2a8c:966f:392d:7230])
        by smtp.gmail.com with ESMTPSA id s123-20020a637781000000b005635bf2f09bsm6806460pgc.42.2023.07.23.10.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 10:29:59 -0700 (PDT)
Date: Sun, 23 Jul 2023 10:29:57 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>
Subject: Re: [PATCH 1/3] riscv: dts: thead: add BeagleV Ahead board device
 tree
Message-ID: <ZL1jlacHj7sgNg8M@x1>
References: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
 <20230722-upstream-beaglev-ahead-dts-v1-1-ccda511357f4@baylibre.com>
 <20230723-savor-trolling-e35ed4a7a751@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230723-savor-trolling-e35ed4a7a751@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_103001_664296_5A4520A5 
X-CRM114-Status: GOOD (  12.08  )
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

On Sun, Jul 23, 2023 at 11:32:17AM +0100, Conor Dooley wrote:
> On Sat, Jul 22, 2023 at 02:55:39PM -0700, Drew Fustini wrote:
> 
> > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > @@ -0,0 +1,61 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> Hmm, should this not be dual licensed?
> I notice the other th1520 stuff isn't either..

Good point, I'll resubmit with a dual license.

Jisheng: are you okay with the other arch/riscv/boot/dts/thead files
changing to a dual license?

> 
> 
> > +	memory@0 {
> > +		device_type = "memory";
> > +		reg = <0x0  0x00000000  0x1 0x00000000>;
> 
> There's some extra spaces in here for some reason.

Thanks for spotting that. I'll fix when I resubmit with dual licnese.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
