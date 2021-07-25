Return-Path: <SRS0=srnp=MR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC383C4338F
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jul 2021 22:29:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B39060E09
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jul 2021 22:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B39060E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0K1Bt3naphx946JH7PlFj5pIatXH2kRuCTWBFkRJyY=; b=sZve2CiDTI+UC5
	BD+8pQRh8iF8MBiB8Dtkz5lcHdvhSUctQVYn/5wcdxE72RU1S3cB9HS13j740fbvf+4wvOuzgkuvk
	jg3wg99+wuig0pe0wAaj14ZGIivQsCygc/nGSDioDPAOjjYs/JHxMuh5Rgf4krCKDOPTmVU3g775Y
	X6Rjpozfs8w28+QwDSksWXo0OCeGxKl/fEatUBZJQkKLTZ6klOfpIhGrKtFq7QTQ1hnika1UCNzZN
	okUqLzoi+9DzFl9FQUDLNRXZmP6Ahg14q4SikE6xz8dV2tYCFPsPInOjjpqBKMzSwid1Dq/pz2GCn
	5DCzPigvVW8mP2BKEbyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7mcj-009CrS-9e; Sun, 25 Jul 2021 22:29:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7mcg-009Cqt-IU
 for linux-riscv@lists.infradead.org; Sun, 25 Jul 2021 22:29:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85E4260F35
 for <linux-riscv@lists.infradead.org>; Sun, 25 Jul 2021 22:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627252165;
 bh=LXdv3SNozGddEOtTXiweAPm33gFyubUEqk9QT+fHMHc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NBPZZmLXXECARRRpEYQnILLiWAelyx07J8u147xeLgLnvwVuOuCbSyWtEgjGZdGXZ
 qczGtqvXBsxZc3Az2W3EwEoNOBBYlO16DwuPkJprDfNylmKUSeVQ3oCdothZgb2Bni
 9rQiM6bwtcPjqV3EfCv8OvpNve5f6FFEM6tPO6mUf1oWARwt2aBLkvV4tYPGnS0ifn
 reMmxDr85ZhAAxogPTTL8v3QrLWdyVkGkF5/MmZ6l9GlDyP2q3+tFQJpEqTHYN4Wqj
 lSlGFU29w6nStaab2+shG0nR9K87pYEGuvSnGCORJ80K0d5pqHvRyeMrP6BLDerHKd
 qZfasI1lM/seA==
Received: by mail-ej1-f50.google.com with SMTP id ga41so13383114ejc.10
 for <linux-riscv@lists.infradead.org>; Sun, 25 Jul 2021 15:29:25 -0700 (PDT)
X-Gm-Message-State: AOAM533Zwa8hRzdyJigQUd8csCUoFtpsiuH1wVYMBNDl0NnfRphfLRTy
 eSfIjS12mI4wWWOxkgA4utJlKyPeCq1sJuYjqA==
X-Google-Smtp-Source: ABdhPJwfSEK/zGq4H+iwJok9IKltb7Tkin7X2hIbv0FMn04qW6BMg5NfENWFO8APXBMeuB8xHMIhsh3UlasWyhyEfQE=
X-Received: by 2002:a17:906:95ce:: with SMTP id
 n14mr5509121ejy.130.1627252164182; 
 Sun, 25 Jul 2021 15:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-4-atish.patra@wdc.com>
In-Reply-To: <20210723214031.3251801-4-atish.patra@wdc.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Sun, 25 Jul 2021 16:29:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKG9xkSAQGkBE8_BEE+O9S+z09M8C9+gWN-58aXEZWqgg@mail.gmail.com>
Message-ID: <CAL_JsqKG9xkSAQGkBE8_BEE+O9S+z09M8C9+gWN-58aXEZWqgg@mail.gmail.com>
Subject: Re: [RFC 3/5] dma-mapping: Enable global non-coherent pool support
 for RISC-V
To: Atish Patra <atish.patra@wdc.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Christoph Hellwig <hch@lst.de>, devicetree@vger.kernel.org,
 Dmitry Vyukov <dvyukov@google.com>, 
 Frank Rowand <frowand.list@gmail.com>, Guo Ren <guoren@linux.alibaba.com>, 
 Linux IOMMU <iommu@lists.linux-foundation.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Robin Murphy <robin.murphy@arm.com>, 
 Tobias Klauser <tklauser@distanz.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_152926_669493_18B81A2A 
X-CRM114-Status: GOOD (  11.73  )
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

On Fri, Jul 23, 2021 at 3:40 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, linux,dma-default is used to reserve a global non-coherent pool
> to allocate memory for dma operations. This can be useful for RISC-V as
> well as the ISA specification doesn't specify a method to modify PMA
> attributes or page table entries to define non-cacheable area yet.
> A non-cacheable memory window is an alternate options for vendors to
> support non-coherent devices. "dma-ranges" must be used in conjunction with
> "linux,dma-default" property to define one or more mappings between device
> and cpu accesible memory regions.

'dma-ranges' applies to buses. And, well, maybe devices when the bus
is not well defined. It is not a reserved-memory property.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
