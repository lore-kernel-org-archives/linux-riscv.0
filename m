Return-Path: <SRS0=rW/4=OB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266EAC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Nov 2018 07:34:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD9D420820
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Nov 2018 07:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MBUg2KyU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie5m9BK8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD9D420820
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ybXblko6nw0dm/0DAmMASZwXZDy7HInRgLub4zOAQSs=; b=MBU
	g2KyUPe8L0D4KkHHd4VLyDmEA7q7HDbDcqdWiW864eHIDgxGxChKZJ51fkmJs5UuLAs4B3VVV0L4L
	Hn/P9ZnLCHCDHPU4Ewv/DXyS9cau7BOf2pOx6KUi4MfZCtYy9yWMR9auGHoEzlErNsnZDmu0ZQo9j
	zn9Vl4gqyeLXOktNsLSS6HOTSLB2eUWWIBG2VjjYkFUyxcSk2FjrDHUNvmNzobCAsac8ONoDIaZ+7
	WN85oEoBqWLQhXoGVwPm1tJpeeRnXKXEz1XCo7jUTaC0UwRATtnvmV58SaOuE28BHeSIhS7BFMHJ5
	EpFoxzE4Oo7BuOlidGpPQTh3PtkMYvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPjVP-00086h-B5; Thu, 22 Nov 2018 07:34:31 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPjVM-00086H-Nr
 for linux-riscv@lists.infradead.org; Thu, 22 Nov 2018 07:34:30 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id y14so1799752vky.9
 for <linux-riscv@lists.infradead.org>; Wed, 21 Nov 2018 23:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rP1gIWRMl3uqbvG4b8kTkQRRCOgDV34GQRn8ye7ClCQ=;
 b=Ie5m9BK87zGrwZacQxTP/rXR/IWiWR1x0twMnkKyU9MeyULpVYG2vraVkaGnpoQs60
 zIfpgbf2Utj6KNg7IteQSzRTY8twDU8lE0dHKGC+DVVrqJw/ioG6yPX49KiWAnFtDANt
 8FHRs2dzrwjbDHrSAw7LIGKdKlprU/kRvh5UWxoVTHznMqHJoXom8qPxIuOgLqxDA1jy
 281C3pN6M53oBmAPOv4JqeFOGM8waxBXPiwWVwguC8jM55NAhHIoxxTsVVpso6aJ/PvH
 ECaPzGphKadc7SnW4idZpt0CFFbRUrgs4ZiBhKXOlhvLnvm82dgQ/cOGIotJ9BGXbcJs
 sAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rP1gIWRMl3uqbvG4b8kTkQRRCOgDV34GQRn8ye7ClCQ=;
 b=Zzls/XdR4lC5VEJBbcxJ8qELjbF8ImKohnufWG3lKkLq0/2WIXKN43JcIknZUAMquK
 lyVQYvkQoSi4ro0J0lQwbabEqrkT3/EYM5wdo3A4jeKPVELavvPRDFnxtIoOFUA+iWT2
 p1lQnExpD9tY5vMHpLo7GvT4lYyAEMbayh3iTbmocHVSWr4iWqxmA0JoGQdf5sLCcWy9
 mH74pqYg94tiJ6pMl5zv5yKd9EtnGaItmExi5Zleoq4G3/2kuRBL1C9KYfkleaEH0HNT
 jdO+CPq1U9SawZ3nsVdARRJlSqI+OwGlfjZRxmNOAXOcAM0b9gMO3Y2E2V6E/hjPX/Kf
 Rkdg==
X-Gm-Message-State: AA+aEWbx3HdSfe5jqVe0CVfHnakKvYiyOmVoy0KrQ1rZYx3H3+kkIVnM
 1aerZd9vf1OZow1Bas268r30PTMjc8d1yCtQlxg=
X-Google-Smtp-Source: AFSGD/UCp4bnUP/JlyrpYWBgPi87BDjDem1CdMRJABfyDYdtE4MN1hb4T4ZE+V97Vjk3tn5cy6dgQDcHfVwRLH3XdLc=
X-Received: by 2002:a1f:f0d:: with SMTP id 13mr4127581vkp.21.1542872054776;
 Wed, 21 Nov 2018 23:34:14 -0800 (PST)
MIME-Version: 1.0
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Thu, 22 Nov 2018 13:04:03 +0530
Message-ID:
 <CAOuPNLiQWiqwkhKXyKV08mWz-Zfis8O3dHB0W5UVfroLU=W4Rw@mail.gmail.com>
Subject: RISCV64 SoC Architecture diagram
To: isa-dev@groups.riscv.org, linux-riscv@lists.infradead.org, 
 sw-dev@groups.riscv.org, Gurucharan Kaur Saluja <gurucharankaurs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181121_233428_810218_9825F6E3 
X-CRM114-Status: UNSURE (   3.74  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181122073403.i3245wklLxAU5qdumn9k9PlaQx61oGd8n0FSlbwlsks@z>

Hi All,

For the education purpose, we need RISCV SoC internal architecture
diagram which can give a pictorial overview of RISCV internals.
As part of study, we want to compare this with ARMv8 architecture.

If anybody have it please share.

Also, if anybody have risv64 benchmarking data with arm64, please
share this as well.


Thanks,
Pintu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
