Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5142FCCD184
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 00:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5CLK4uzlRjpNtcfYyQStj6EF0l+c2Y86MgT7reyU9M=; b=kXBaRKrbXTZ2ei
	n/Wg3OqJJpmDH5gpk9PTeFAkkBSN7QaIvDMuuae0m4sHc/uY7gj2AlMwu43MRuI1sYSBgqGqYV5VQ
	FGbdzNggK1c9afqfogz/8+e4v1LiZB1448V7xQJX5Ua4n6XiXbQlQW7O4geTFAwEh+/pDqGEKow/0
	zX0dvWj6Bo7lXRodzO0B4zBFXT7xBoJiQzh5wJMs7M8UDiMx7X40o8ycUqiNsBwYZVtaCrpsrdyFK
	O7J83Klf3Ig8LiiQ3XnzfWNScE4FlH7gyV+M0TPvOtnMBeTNSGp6c6CcpMr7PzLI6ZZJk5EQYFWiJ
	dbSGdtiopzkikfaqAi+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86fY-0000000Bzxl-2Ssb;
	Mon, 13 Oct 2025 00:44:08 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86fV-0000000Bzwy-3rAo
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 00:44:07 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b62ed9c3e79so2229750a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 17:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760316245; x=1760921045; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yPwgPz14QMmJyiGXqsXB/z8FmJN7/401xIlwLm/DIq0=;
        b=IA3xZqvFi9CvtwNVG7kbdvPzwVgB3zFV90kaeceBiTU5Qvgeb4nemSDLWUl/VTsSCd
         9JJ/lANgShTTmDL0ea+gJjWRDJMJgEI7gWrvPCEZUTqAVwtXDeUfv6W7e7bGa9vNcRhm
         RcVfgkYgD58LshyLHbYYE6MRyxKZn9wj6MHD06qLIn+8qwkZYeYi8sBuELNVbUExm1kA
         QYCOG2oeugMstdQHXmg1LYiukfy9RUgKFixA67GcQXBhDNUwIYzm2JVMbnEE1GuNvycn
         ojQJG9FWCSxXq2pgPJ0C5grreU+TJ5bJ5lvqEFbKoebuBGKyhkQJwR0rhWDqgaAn1Ckh
         j6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760316245; x=1760921045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPwgPz14QMmJyiGXqsXB/z8FmJN7/401xIlwLm/DIq0=;
        b=j2tH7quVo7VlAyXk27Xe9FHt0GX40kGfT/JfDfmJS/ZQD2oc00kg3xPYqYEbQOwLXU
         JnE0Q1lAklBxaSEV/NsDgPAlRR8dlqqZILM0pBoVtKHg3oB8dueZxK6pMWj/S+r17nux
         MnWsP6Ud5JmvoA0ulP7aNOi/g8Pd5A3XCmpSKVMVrR2GNxmCGhxh2oUwLEsZ43B8DIFx
         rKoJz+SCpijXirYhEx6AIQWZJ1sHVnBk5GQtiUPTIMXqlQUL7sOsAiZbsGJTFYn+Tz2w
         sXtfyJdNXA7Y8EVmO/wUUKTSuRp9mTq+jfaeye0goSjRwyRbnL5RQ54TiZ/uv1MWhyhk
         4S6g==
X-Forwarded-Encrypted: i=1; AJvYcCX/zhLVSteLN8su4CDUx01Xaf36cBeUt6nULhL2MUPccMae3+Ck7t87A4saR1yJeI6yYyUspdB4UzE89g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2qCNozCaQb1bTXqDqDaiK4Xq60oncZwkketSbfmA3Js72l3gf
	5Yncooiqy++Tur3iCVsKIGeWz5tQxT4fXlNvxQ7m0lrLjOh50yWSA30N
X-Gm-Gg: ASbGncs5Ni3OmooxUz4il3nJzBZT52UkaLJQGkTGBuL1AYT2BKrE6v+7E0Li6wP6jPP
	96ixoBWog783fdY19ppM18C4L2mXzUthXcrbLjcTpSFte/Xpt67BX7WoGZ0GdIMjX6tFaaFvRP1
	Mkcz7zoQqFHPoqyUAbU02/3HK8MR5A4WOmfJRlfHyNdRUtfsaoRGaGsCTIG1SO2Ahm4c9sMoaha
	ohrdlKqpXkRGCPKyiHGmHeWVeQrtiRG7LS4gQBnAMpqr0lGMtDdr3HFBHylnnO8KBmSh0kZsbV9
	csH5R241u4swWl6rAifNOla8dKpUpeZxwKN0YPTr71OLMFeCiLIczl8rsR+BBESK/m7U8e/xaxn
	C9TuTfRSgwhGgk69qtG4ClnYkfCtn9WH3rzVshaqs
X-Google-Smtp-Source: AGHT+IECq70NJ5A63ESJRalAid7RnpozwDsfbFxId8ZL43D2ZxgrEq0z+oLu5gMzH/ZQF72Zp3uEIA==
X-Received: by 2002:a17:903:948:b0:249:37ad:ad03 with SMTP id d9443c01a7336-290273ee21fmr266565455ad.34.1760316244858;
        Sun, 12 Oct 2025 17:44:04 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-29034f9d177sm115904685ad.123.2025.10.12.17.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 17:44:04 -0700 (PDT)
Date: Mon, 13 Oct 2025 08:43:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, alexander.sverdlin@gmail.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, 
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <bsol3uim4brrrsdmvuk6f3uzampbki2pyhziap6x4rw7txl435@rwoxrnctkf3y>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-3-josh.milas@gmail.com>
 <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
 <aOqtt7BDXxItrs7W@sleek>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aOqtt7BDXxItrs7W@sleek>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_174406_012927_4B2C2972 
X-CRM114-Status: GOOD (  14.36  )
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

On Sat, Oct 11, 2025 at 03:19:19PM -0400, Joshua Milas wrote:
> Hi Inochi,
> 
> > Only enable device that can be accessed directly. These devices share
> > some pins and only one of them can be used. I suggest enabling devices
> > that are accessed by default (which means it is compatible with the
> > vendor kernel).
> 
> I decompiled the vendor device tree and will match what is in that.
> Surprisingly most of these are enabled there. 

Yeah, the vendor enable almost all, but it can not access at
the same time. The pinmux control which device can be accessed
IIRC, milkv already provides a tool, named duo-pinmux, for you
to check the pinmux.

> I also tried to check the pinouts [1] but didnt really get anything
> out of it.
> 
> Link: https://github.com/milkv-duo/duo-files/raw/refs/heads/main/duo-s/hardware/SG2000-PINOUT.xlsx [1]

You need to dump the pinconf register and check the configuration
with the document (the link you mentioned).

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
