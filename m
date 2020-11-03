Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C257C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 10:03:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 986C221D91
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 10:03:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a0iCFvW7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2X1Xc7p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 986C221D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9o6drlThqjbkxxzFKCyhb9NrgMQxUcYZ2Lpchqr4kBs=; b=a0iCFvW76iKxNDRh6VwBZB8XV
	nBmXA41NNEnHP2WKepS0KTXvDw3vE8mtoq0JG9/pixr1Q+UrhpWGwz4bpDoq1C/w7B/azFlgFQ3O/
	Opke+0H9oJNTzf7G5RigM4fM5dPIGj5X0JHo1+IAlbkWXnn55EgPcb8nXXYnGZ4mKe0HK3FKSX6VU
	VQNUskSZRYWOXdeBHkVc5vnw2Hytq49P4CSutG33nAd4vU45zeg1A7oIk6pJwfavBRAriXvYl32yG
	bJ7SppL3M3rdvznTL1RAUuezCbzCEmV9IHQY7dN/rq2HZXrJOMGVIv2WBsEBSUgQZFbKWbv4V64ks
	wNxTTrekA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZt9s-0003Zy-NJ; Tue, 03 Nov 2020 10:03:20 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZt9m-0003ZD-Jt
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 10:03:15 +0000
Received: by mail-yb1-xb44.google.com with SMTP id n142so14335250ybf.7
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 02:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3U1CRIpx/MWyOqmEpa48IE1TM02vyyoxh0TJr6+0Jaw=;
 b=I2X1Xc7pOp9h2tU05SKde5aUeDYU9J+WbrRjOT8AmlQaQ+m+xqXnXP5sdZstRAOjSJ
 /6A3Kgr3+MkpVDqFv3hzwkwlRFzuMhIxU2OZe9TXEYdWuTyvKxEtZadoRo4adY9wN6bQ
 TJQ8eZBWZVoBd3MCktZT3K03SS5OYhoivEQLPJPd4DgPSiaUlE9ufgf4+yl0glz3tVdS
 N/iRrJZ0h2IJP7bUWmVZV4+oeY6mFLGTAEYfJGEscYabLCoO0Bx24VeMb4TBEcc2UnEs
 ubOJWUvBb9vpMjxMvRtJxEIAOkmoFp+24Z8fLCq3lptgBTNYP2h2K/YSWFcHASz2pYsn
 8l6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3U1CRIpx/MWyOqmEpa48IE1TM02vyyoxh0TJr6+0Jaw=;
 b=SdSZN6JbF9YyZY+NJ4j6tGQc/hSQLt/+rvWQouke9XIwep0bteuqp8qB6+Ud5bvccT
 tBE55U04nM3kilDa6/zEj0ErE3iacMZIEoYdrBKCF0+122Zk7WBsuF72UGMw4Ba+6SSL
 P0K1mTkcpV+Lj2/q+kaIQGDn5i8bXMmW1GdRKfVizV08VJJIWmBkbHLW6lm5Yw9svEq9
 fF0xIv8lNDr34Oz6t+JZuuGOLviR/miRtJrBkh732wo1M4Yfv9aPtiEDdvcbClVpQnO7
 05of/c718BO8yYy6xlVzjdgLRDuXDi9GzaATISdxlWB8gjGi4nXC/lN7xcOv6GOQfH+R
 qu1Q==
X-Gm-Message-State: AOAM530shECW4kC4C+M0ZCYOsaGuo4aDAe7RAAE93/tUupDteMFO+lm9
 PUaxrImEOiULjLfWEaZeCY+otMqvSx+ynHaEKN9KdIZv0H8=
X-Google-Smtp-Source: ABdhPJwFrA6yKwXiiNx0k7zymp/0xjInrlZ+6g5/M7+azUxS6iLhWvyJjYQGOed+fAcrzx4j3S4RAg1ZvSsBwsYR158=
X-Received: by 2002:a25:f81e:: with SMTP id u30mr27624153ybd.332.1604397793010; 
 Tue, 03 Nov 2020 02:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-4-atish.patra@wdc.com>
In-Reply-To: <20201028232759.1928479-4-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 3 Nov 2020 18:03:01 +0800
Message-ID: <CAEUhbmU5jUpSAzJS3oN2i6igHXOXMAq2KR5yWhbx1q2_qF-FHg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] RISC-V: Enable Microchip PolarFire ICICLE SoC
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_050314_699413_9042DD85 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup.patel@wdc.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Padmarao Begari <padmarao.begari@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29, 2020 at 6:00 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Enable Microchip PolarFire ICICLE soc config in defconfig.
> It allows the default upstream kernel to boot on PolarFire ICICLE board.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
