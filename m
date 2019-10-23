Return-Path: <SRS0=37yX=YQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3608CA9EAE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2019 06:00:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A06B21906
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2019 06:00:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S8xGPrbK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mNuisqxP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A06B21906
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/yxydKaZBlnRfNOGhBqXQ886AfPoJ6OZ+NVXIxsC/o=; b=S8xGPrbK80Ts/x
	nn0ReJYdmIQ3ZD8D5Yn1Xf8SjJWvYFXIuivHyO9DsH6N3oSn+Bh6au758gjbz9zuX5Osop3mW77AK
	meD5dcev2A1lOzhM7c1wNniFZs0IY/G0NGJ8yufEclTyXI7eX5rJ9nhBCxiHVTzwtW0NRRvbQP40+
	393LudGkDuqP0rcocNLpjDK+bNDmkYkYNWBrR40NfEhcwIDPmqXSH70gebWrwlmFkjfrmhSS252mP
	TwmP9heGDKPYLq2Atkq37FrlN7qh5NChLER3boFSmOdDADotxO7on84KlDhOiYpbGMO3H/NeEZcfX
	3ziE5gcE5ywcHVsY5e5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iN9hV-0007wp-HM; Wed, 23 Oct 2019 06:00:53 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iN9hS-0007vd-37
 for linux-riscv@lists.infradead.org; Wed, 23 Oct 2019 06:00:51 +0000
Received: by mail-io1-xd43.google.com with SMTP id y12so5897971ioa.6
 for <linux-riscv@lists.infradead.org>; Tue, 22 Oct 2019 23:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=2TS9P6vv1/KjpwotibIUiV1WTOJaYFrPVFUeByFlL1Q=;
 b=mNuisqxPnrBkatCUeMElaoaTrErkbBygAOl6zWPZOAVkX2Stz0GU1mUC12VlrMoIbW
 vuB6nAAC3k/JQeWJfBTnYtBOOUhZX2mUFquCESHdcxKKbbYvmThayGWeR4D5WTYku5SG
 V6pKuxz6q2+L15NEIGb3U3UbEUsfFcA27BJUW4ntmGeqAx2kKrTzc8al36BVMB9g4OmS
 hbibqpfFJ5I/0cR6dBzDFAfcNaX1aVGgfegFIwikFbid0wmroSYHtAVd17W4M+aPFiBz
 OvDUhUiD/1LX+MjSV3HijvBZRo6c5tD2wTptIJUNY1xBWEMkJL9Ww1tbYqmITjTbotUy
 S/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=2TS9P6vv1/KjpwotibIUiV1WTOJaYFrPVFUeByFlL1Q=;
 b=H6lZik+iuCyioEO/BUFZyx0yVlQAiVMjidtmd3ntKMeTl++QL9cEpV9fjs+qOnFoSP
 K6LocE5irRJY4PgIy91ivUJbOdL8/2cIrMcmDCOBG7uSSc4YX/gSxknmjlux2DEAOL16
 0VVUca7l45M/pJkciZke/ILCUm9w8ofEWkxoQ2IGv6486jCxg3ua6U7fEpi4rq81TEiO
 roDX7H01I5Z6TVGIQYERx2gJetWnKbeCsOEckz8wlzKSMWYSeXdE1aCiLir9epz2apIR
 mNFzcO197amLa/DjQpi1IyOYsn3l+ZgCpuSZ9Vhb2OGH9HTMYTUoUi4p+4MUTQOAZmeI
 /ekg==
X-Gm-Message-State: APjAAAUMMzE0mT82b7Xd5oNh4MT33eXuw/RddZ4sXHzmJw2abF0YylLS
 uXv04Er4FHjUAC65AOsBFJY4TA==
X-Google-Smtp-Source: APXvYqwfDpE3nzzIjN1bK137BVcWtvN3np6xWr9wrQ/QFTSUe2FjyxmNtM+oS3OpO+ELEkCW66YfHg==
X-Received: by 2002:a02:a157:: with SMTP id m23mr3994445jah.135.1571810447594; 
 Tue, 22 Oct 2019 23:00:47 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id b11sm7664661ilr.87.2019.10.22.23.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 23:00:46 -0700 (PDT)
Date: Tue, 22 Oct 2019 23:00:44 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2 2/2] RISC-V: defconfig: Enable Goldfish RTC driver
In-Reply-To: <CAAhSdy3KccuzC0pV6Jy_diLwkdgb=SdHBQnsSoGrgpu6g7TCQA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1910222250490.5600@viisi.sifive.com>
References: <20190925063706.56175-3-anup.patel@wdc.com>
 <mhng-edb410db-fdd1-46f6-84c3-ae3b843f7e3a@palmer-si-x1c4>
 <MN2PR04MB606160F5306A5F3C5D97FB788D900@MN2PR04MB6061.namprd04.prod.outlook.com>
 <alpine.DEB.2.21.9999.1910221213490.28831@viisi.sifive.com>
 <17db4a6244d09abf867daf2a6c10de6a5cd58c89.camel@wdc.com>
 <alpine.DEB.2.21.9999.1910221751500.25457@viisi.sifive.com>
 <CAAhSdy3KccuzC0pV6Jy_diLwkdgb=SdHBQnsSoGrgpu6g7TCQA@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_230050_196279_9AE0469E 
X-CRM114-Status: GOOD (  12.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hch@infradead.org" <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "rkir@google.com" <rkir@google.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 23 Oct 2019, Anup Patel wrote:

> On Wed, Oct 23, 2019 at 6:37 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> > Incidentally, just looking at drivers/platform/goldfish, that driver seems
> > to be some sort of Google-specific RPC driver.  Are you all really sure
> 
> Nopes, it's not RPC driver.  In fact, all Goldfish virtual platform
> devices are MMIO devices.

Is drivers/platform/goldfish/goldfish_pipe.c required for the Goldfish RTC 
driver or not?

If not, then the first patch that was sent isn't the right fix.  It would 
be better to remove the Kbuild dependency between the code in 
drivers/platform/goldfish and the Goldfish RTC.

If it is required, then surely there must be a simpler RTC implementation 
available.

> The problem is VirtIO spec does not define any RTC device so instead of
> inventing our own virtual RTC device we re-use RTC device defined in
> Goldfish virtual platform for QEMU virt machine. This way we can re-use
> the Linux Goldfish RTC driver.

With 160+ RTC drivers in the kernel tree already, we certainly agree that 
it doesn't make sense to invent a new RTC.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
