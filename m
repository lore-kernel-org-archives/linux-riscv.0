Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15A2C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 15:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=t8cs//gBknB+0KjgWwfLp4nSR8sULXMNCpGImYjGhI0=; b=Ff0oVzmKUP0loJjoVsihQnvvAh
	Kzvh9CcAPDOkjxpL+t1uqGa7t604U2SSJXa7XFqrryoNk3XBVjdBHQ+hDOu28KyOIsFhlqahftVid
	Cd/WY3jgUoqnlC8ZaIFOnoh+zmBniNSVBlXm003IilZWnCDs3lTZ2BAVuTRVrbC5BgpRPqigp4cR6
	NqgoipI8nIsG3pQs1bc95w18h6Iaf8vih59pg+xkpXXC9/OoPwCV20uZs8i3D0ZHYcQSfGKn6tvZA
	YdZWg+wQg9+WP2vSt80pJ++KxbMNn8MH/6/LmBeAfAcfd1IicOzdse+wLiE/N9Ns5m3sMLJ7s+u0Y
	frHWdTcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppAD9-005pY9-2j;
	Wed, 19 Apr 2023 15:59:11 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppAD6-005pWF-0X
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 15:59:10 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-51b6d137403so1424408a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1681919946; x=1684511946;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVtjPMREOOUQQbJrVJ+PVQx4OKxpFf/ZUEP61+e+1gQ=;
        b=pSNQgsRy6zo4qwpA3cM7sZoO6B12NlJORUyb/G2Re//6S+0e1azyZJRcvB6HH/av+Y
         Zhw0kXTsTikczygqBFM4Yp3Hyv7ur0zrB1trqD1cysW6TfYCCmgH8qg+HEUrKLad+A9m
         sntYiEwLiRW6HnFuJHQMgNxlxmIxwj0fk3Z7+Nn6eDMqS04NLZezsOh0p0OUY1Tal+YV
         cojLn1Qz31cIgKY7IXNKFfTjK3XNXYvocXQ6uijOLZL169wMho3mgHYBP2SVvZ4bu512
         9J652Xvn90ZV+JbuHpRsxBgPvFVR67JA3JAAwizOlz3w6enwOzsccwvVa1Y5WHzCdNNG
         NJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681919946; x=1684511946;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVtjPMREOOUQQbJrVJ+PVQx4OKxpFf/ZUEP61+e+1gQ=;
        b=QkI2RjwOyUn+Td8r13V/43ljZgKWc/6V/DCEWPhcXA5SN//dl65rQo9bnudWnhrx4a
         iJJrl6P31n+Fb8qWGKPtcgMtlZxyoF7Cu86385v2G6rvaJSTd1mMKhIM41LtzBhoXB5q
         zuUZJrZ6xWQW4DXIzd6VHzrwegULCzUyNcL5o+z+2yr9pf+LSGJcVnhzhETJGsAkAbK8
         4nr9tTk+bjhAP3yS9vGetem8u6xwcP72iv7b5G6KUgKrb49kT+6sDYvGIPPZ4nWO15Wr
         o6mihqBKd0w1ZRiFlDpdpH6nb/Y25VErt7uV3AJ+IAz19s0IwVvVWaQTlempoJBqU04X
         MmpA==
X-Gm-Message-State: AAQBX9fcLYSNS5aRL7ln9LDjP79yRWrVgLAoAuUX8X3ApAmRudJBHM2Q
	XwSF59oe71j/B0C5BAwEchXEAipF4hWZ8kFmHy+gJQ==
X-Google-Smtp-Source: AKy350Z2QE182sNm3aUj8RGCOEigVzYtoSb+0d9wOzIYohC9AAOYJzzfsi7c8UvRD0MGHAA7O2OL5w==
X-Received: by 2002:a17:90a:930b:b0:24b:2e6a:24ed with SMTP id p11-20020a17090a930b00b0024b2e6a24edmr1085199pjo.37.1681919943842;
        Wed, 19 Apr 2023 08:59:03 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id l9-20020a17090a49c900b002353082958csm1570643pjm.10.2023.04.19.08.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 08:59:03 -0700 (PDT)
Date: Wed, 19 Apr 2023 08:59:03 -0700 (PDT)
X-Google-Original-Date: Wed, 19 Apr 2023 08:57:41 PDT (-0700)
Subject: Re: [PATCH v8 0/7] Add non-coherent DMA support for AX45MP
In-Reply-To: <ZDzs3eYIKPFcv0HQ@infradead.org>
CC: Conor Dooley <conor@kernel.org>, prabhakar.csengg@gmail.com,
  Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, geert+renesas@glider.be,
  heiko@sntech.de, guoren@kernel.org, ajones@ventanamicro.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, samuel@sholland.org, linux-riscv@lists.infradead.org,
  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
  prabhakar.mahadev-lad.rj@bp.renesas.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-e296c86c-71b1-46f8-88c6-16eda3590a3d@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_085908_397560_D7D0A826 
X-CRM114-Status: GOOD (  16.79  )
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

On Sun, 16 Apr 2023 23:53:17 PDT (-0700), Christoph Hellwig wrote:
> On Wed, Apr 12, 2023 at 09:32:30PM +0100, Conor Dooley wrote:
>> On Wed, Apr 12, 2023 at 12:08:53PM +0100, Prabhakar wrote:
>>
>> > Note,
>> > - This series requires testing on Cores with zicbom and T-Head SoCs
>>
>> As I said last time, I dunno what actual Zicbom stuff exists, other than
>> perhaps the Ventana lads having something. I did some tyre kicking on my
>> D1 and it was fine, although nothing has actually changed materially for
>> either of them with this series in v8..
>
> And as saying before, there is absolutely no reason to add non-standard
> non-coherent DMA support and let this cancer creep.  If you want Linux
> support implement Zicbom, be that in hardware or the SBI.

IMO we should just take the support in Linux: trying to hide stuff behind the
SBI leads to more more headaches than it's worth, we end up with a bunch of
broken firmware to try and work around.  We've already got a mess here because
of the D1 support, we might as well just live with it.

In practice there's just going to be a ton of mess in arch/riscv, as the ISA
has been missing many core features for many years and hardware vendors are
allowed to do whatever they want.  That's obviously a huge headache, but I
think there's nothing we can really do about it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
