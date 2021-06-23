Return-Path: <SRS0=kiTD=LR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FBAC4743C
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 18:51:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8255F611C1
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 18:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8255F611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8gJsnYRSnNYXpHL/aRWaGvuGXOnYV/OfL7QOf4Ovig=; b=LEewZ8m95xUnkS
	1x1Zg+3TsTkl2Hp9KdTi3r5IzNbO2/fqk0KifW3Dnjn3lrxrkR6IPk2D7Ppffq1qrYjufyHpE1vCl
	4lIT5S/fv0V0/GouahrCeCIfZGc3V/Q1A1szRZJycOZxM57JHi3BOUh8LGePTbRD/NVPUtomJ35L8
	+EPgS4pOAiS5wYFRIifzGyNIjodyCQDXGTXJjq8LcIvLEZhyVq2TRB915WV7k39Xwu07G+vzuWosR
	Obf01lXbxc8InqsQcuCac5NvQ+ZjEBtzmciTTfSTlPOuwwTGHkrYFs4Zj84BYoPiXYXfP+U0AU0lA
	2ePZnv2geiZP62am0d8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw7xc-00BiA7-3o; Wed, 23 Jun 2021 18:50:52 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw7xY-00Bi8h-4v
 for linux-riscv@lists.infradead.org; Wed, 23 Jun 2021 18:50:50 +0000
Received: by mail-pf1-x432.google.com with SMTP id s14so1787286pfg.0
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jun 2021 11:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ir9jY3nBe5iS3sggziqw4z6Vtt5ZPYlyAkE3Eq8Re1w=;
 b=Teg+shfiHdgmBiXQ/OBYwrl4Fmbf5gjlvU8VtroATqbWuwqWiGSyqG8afpfUeM+40E
 Gz2q5WHQAgY+tVj6xLTPC60S1LvckR/JcRY5Kmp9KzHKoiuQ2s5l6jCI/BOxQiXvqn8V
 tWS+S7+VujtLyuhP5Pg344KpfdowpUB9Rw6ecJNSYwtdQ4S/88QMZduV817RoNX9Rj22
 P/FFM8VghAqHklAxTnUpqD8+mBIiFEjFVvvjjZTqbUNBCeN4Samd7LGc5chMaIydGo0K
 sNf9fFXjRG4lm/iTXw9H9yxmr4jS0/iVwX2kHDtPjME9w6OL3I7vEFv8VfP0O+kAXBld
 OdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ir9jY3nBe5iS3sggziqw4z6Vtt5ZPYlyAkE3Eq8Re1w=;
 b=O2Q4iiAdGDh8I/m3bfSQxaPnMozKBBveaXE6IBra0JV3tdCYBny4lOKPmu1OOuLLK3
 ANIuIncObQKrFeaH4kwnhzSWTWF7wSO7LZb/Am3zfcaOwugKbQrlI90nMZ4HoE8h99ve
 CaNWLHSintcFSd7GyP985Sm2+B9Z/DaqSSISw3hLmTaRIhx3QPGVTc4PRXLqEBrZObYV
 otjqMlACzuKsSYqvy4u5zNf205I8Ir2peuhv5z4DJfYkrVt9UXHWKw768H97GLah2xCJ
 mstgaH8AFTKkfXJSj8SU7j4metJwcUuPWUkrWHyvRo3eG1En4NHitQvMxXfhhpxYxn7B
 rtJg==
X-Gm-Message-State: AOAM533S5VuEmwsgj8jCWVuFdY9pxxbVlzmonSxP5LGfiwISusZEmqPS
 TvpndBcgNn1UzpH/i2qVzf2jYQ==
X-Google-Smtp-Source: ABdhPJxCZMfCsSZ78Yj+voU+e+Y4Ki+GbrOGOAxXaLbA72duG/o6cTs5ZO7Bof7AHV928WS8Ll9sKQ==
X-Received: by 2002:a05:6a00:d4d:b029:307:78ef:d767 with SMTP id
 n13-20020a056a000d4db029030778efd767mr1115704pfv.12.1624474245873; 
 Wed, 23 Jun 2021 11:50:45 -0700 (PDT)
Received: from x1 ([174.127.163.79])
 by smtp.gmail.com with ESMTPSA id s4sm309782pjn.31.2021.06.23.11.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 11:50:45 -0700 (PDT)
Date: Wed, 23 Jun 2021 11:50:43 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] Adding jh7100 SoC to defconfig
Message-ID: <20210623185043.GA493015@x1>
References: <f22f6d7e-97ab-85db-5448-c2bcef0ea0e7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f22f6d7e-97ab-85db-5448-c2bcef0ea0e7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_115048_294483_977BDA84 
X-CRM114-Status: GOOD (  15.64  )
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

On Wed, Jun 23, 2021 at 09:45:52PM +0900, Akira Tsukamoto wrote:
> 
> Would like to have comments for adding jh7100 SoC to defconfig.

Thanks for preparing this defconfig.

Let's refer to the SoC as StarFive JH7100 SoC [1] which is used in the
BeagleV Starlight JH7100 board [2].

> To make the upstream friendly, try to add as minimum as possible in
> arch/riscv/configs/defconfig required for beaglev-beta against the

Please use "BeagleV Starlight JH7100" instead of beaglev-beta.

> upstream defconfig. I might have added too much configs.
> 
> Then the distro vendors could use:
> make defconfig beablev-fedora.config
> or
> make defconfig beablev-debian.config
> 
> while distro vendors keeping beablev-fedora.config and
> beablev-debian.config in their own repositories to make one binary kernel
> which boots for all riscv boards.

Note about naming, BeagleV refers to any RISC-V board produced by
BeagleBoard.org and likely in the future will include other SoC
families.

> 
> Probably, it is not good practice to add a different defconfig file under
> arch/riscv/configs/ when each new riscv board comes out.

We currently have:

  defconfig
  nommu_k210_defconfig
  nommu_k210_sdcard_defconfig
  nommu_virt_defconfig
  rv32_defconfig

It seems like 'defconfig' supports the SiFive Unleashed board which
makes sense as it was the only board for a longtime:

  $ git grep -i sifive
  defconfig:CONFIG_SOC_SIFIVE=y
  defconfig:CONFIG_SPI_SIFIVE=y
  defconfig:CONFIG_GPIO_SIFIVE=y

I suppose the kconfig options needed for BeagleV Starlight JH7100 could
be added to 'defconfig' as long as there were no incompatibilities.  I
assume the k210 versions were added because that is a rather odd SoC
that has a non-supported MMU and thus runs in m-mode.

Thanks,
Drew

[1] https://github.com/starfive-tech/beaglev_doc/
[2] https://github.com/beagleboard/beaglev-starlight

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
