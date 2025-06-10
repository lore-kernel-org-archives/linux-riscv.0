Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6C9C5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hwv52Z6ZBR5QxjJKXykJrcx4XRoVr17hKuicoWk3n78=; b=R0KhU252Yxn1g/
	pFdPgmYkxJB8cxoGjsBWspqQtIgaZzghSmU5mZrsfIB+WyJ2uqEnKCW7jJCT1t/Ra0orF4v0CBnBM
	PorrlgXbNZZc8ohZy9H8AtkQZtnN9fEw2N1mnMkxgS5y+ysjHHfAoFhGE7F7EQ3z1EXLb4j7Pj2Fk
	GBhAJZJWKUjBzugJx3cDBHOgaHcMOUBXg+3b7l8OjSV1OenW2qC2jT27auS3cYoisPfclMFcB41oi
	N8qpa6c5hSX0cJ0QhUnHc+u/MCDrsOm0dlC9rjTOQLVI75hnq7ojKnxBadV+MMAphJt5i+1wsKNCi
	TpA0IC/gt2/72JGMesdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOpxO-00000005hgb-2wqB;
	Tue, 10 Jun 2025 03:47:26 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOpxL-00000005hfm-3tPQ
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 03:47:25 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6f8b2682d61so64501236d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 20:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749527242; x=1750132042; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zDCiCjFRxyiCWt4jIH5Z3HVu6j2gY+Qm8orsgIXQqP0=;
        b=KwhVeThdRnr27/BMyQ4gYoD8Qw3mlp0dj15Z/ggCibfN9cfLmr6ZpfUZQB3J7/+ymd
         aBAZ6pL7+VfM9NjjMzoTCqRDxGDMVoREreDD8hORR6i3WZmw3CXTkWMkJVkef5StJzHX
         wgJex+D+STXRiL2acW+BHkvHEFu+HB9umlLg9WISD6YrYkxrEUAMsHZ4XF6+Y0Y1yCfT
         SaA1XpwtIJGb3bOFsU+at7mlquvMEKwsdcIHRK3R49VlzdPe077tAGbzu5rnlj8PwOpR
         G8d0B7BS52n5IpFVzSYbuwFMtuvpQmWgRwULf1DKWNqI8zXe5aMugL7R1FP02NA32OV3
         2rBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749527242; x=1750132042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDCiCjFRxyiCWt4jIH5Z3HVu6j2gY+Qm8orsgIXQqP0=;
        b=ZEIc9uiCUhAbpqYj+rkgTfmpANHLvh3Hjg2DK1dkxvyN0Qs4TAD9wbH+enmsyKOfx4
         yvvj0BQlfh0eyr7HpKWeFgrciBCE5HYogSuAO5bIi5DmxddVd8zrjb91rO6TUFAf8k1+
         wfsvqtauAN0IjHDYf3mmLetVQafTJ0azuuzQv7yE+9JvXgusg+f26qVWukUc9DF+ab3Y
         ly6BynfEbRhcO1aUhLwCszxeUenMh7okZW87QfRNEe6DlK/DKAqg1yu+QMFk2BEt7n3b
         nIRv0/FvjiPqD+PilUiImS+45QhQCxQesZOdMAM3iphPztwannFrfFp2BlSLCBxDtDi0
         Oz3g==
X-Forwarded-Encrypted: i=1; AJvYcCVpJecYxUKiwUNw0mI2wdSPo7AJ/nSXgAUEu+v91J1W18v1PYyJ1Xyd7HU059eiM8w4TA4+cJhB+hbvbA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9P8g9Uglgbgla+PzbzpPE8vZjQ/W3pc1pzzJpQsjblsMAEOLG
	V4mrwpY+Aht9+XldaBrvzL4GEjSRQXzInFNDLbalbdqC1LJlTIO/8u2R
X-Gm-Gg: ASbGnctmGEy0SHkobkME701f2P72FAJwUZ0cU9PXaJcHKSDPoJmO2VCVkVLkRbBYM2l
	5Dk59sK6SAdA7atpTSW8lgvd3/NebHiQ5MseOIpXFK/lwNsqFBHK0LjVO1lSHQSau59ZYGmTTd+
	dff8/yRwYMt5c4S2oEM7FQQX1mzADizW11XKbSurcS3obSQzktz2PO8YZZ0izBB7s8wDwY2OI70
	1BBz2c5kgK8wc8Sh4b/X5ROnnG4a6aG6mbbeka7mzlWFv7n9AeTn1A901t/2+ZzcOsGsOZSJlv6
	OCahibEREpheBlWzJy1HDNgEFHOT73Mw2rbEiA==
X-Google-Smtp-Source: AGHT+IFExzcjd3nECuvCDrhqt2cMUduWzh5W32C4n8+lgZH4pHu74tz/o2U2TyL8FHM90amPFhcd1A==
X-Received: by 2002:ad4:5ae2:0:b0:6fa:b467:aa67 with SMTP id 6a1803df08f44-6fb239acc8fmr32720396d6.20.1749527241748;
        Mon, 09 Jun 2025 20:47:21 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b354aasm60401156d6.108.2025.06.09.20.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 20:47:21 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:46:14 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: sophgo: cv18xx: Add reset generator support
Message-ID: <p3fgduezi466wxyc7d6z6msmlyzwrriuwfha5xny5bd4qwzbah@zsgdahiylooy>
References: <20250608232214.771855-1-inochiama@gmail.com>
 <MA0P287MB2262D3E1D44D6B4C5E9A06C1FE6AA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB2262D3E1D44D6B4C5E9A06C1FE6AA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_204723_964351_97F7E61E 
X-CRM114-Status: GOOD (  14.13  )
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

On Tue, Jun 10, 2025 at 11:27:01AM +0800, Chen Wang wrote:
> hi, Inochi,
> 
> Judging from the title of the email, your patch should be for supporting all
> cv18xx series socs, including cv1800b/SG2002 (formerly CV181xC)/SG2000
> (formerly CV181xH), right?

Yes, you are right.

> I see Alex is submiting a PR to support reset for SG2000 [1], so suggest you
> discuss with Alex and merge your work with his to avoid forking.
> 
> Link: https://lore.kernel.org/lkml/20250609230417.620089-1-alexander.sverdlin@gmail.com/
> [1]
> 
> Alex Sverdlin, I see you are also in the to-list, what's your point?
> 
> Thanks,
> 
> Chen
> 
> On 2025/6/9 7:22, Inochi Amaoto wrote:
> > Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
> > Add necessary code and bindings for it.
> > 
> > Changes from v1:
> > 1. rebase to v6.16-rc1
> > 2. patch 1: apply Rob's tag
> > 2. patch 4: fix wrong reset ID
> 
> two 2's, makes me confused :)
> 

Oh, a small mistake....

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
