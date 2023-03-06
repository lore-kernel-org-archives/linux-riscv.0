Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F382C64EC4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 22:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=96+BEU9Opr3UlKqNNxFcHFO2nMw5DUikaWlEDxxwbTQ=; b=1ZJ28U/B2ktDTjB/hX//46iuLI
	wWg/ZfLefUOgG9YohCwCBGIUG8cEiCVIGMOtOLTJ47XCFDD2mR8j3KhuBOGaNBR7CaJY0uYOq7JAQ
	WhsxycSoz8/wPI5ve9Gtih8UQfJQaBBC5PXvJfd83p4QKHlc6A2kPCjcZFMZC/qqrskVvLZzS0LHZ
	tmcmHOSTt+dlU59M5g+RHdTGPJf7VhMXYvyikzt+D6q9ThwjRxzM5cwiMSmj6ZZyr9q3weAxYJpWN
	DVKByt1+MPKwY7aV3EHddUN3TAtdNo62DM6s79x++vYm/STPhIC4JQuyZexIV35iq+0pX6rT2i2Zd
	2Y6ORQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJdH-00FKvG-Hb; Mon, 06 Mar 2023 22:48:39 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJdD-00FKuN-AT
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 22:48:37 +0000
Received: by mail-pl1-x631.google.com with SMTP id ky4so12223009plb.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 14:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678142914;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2PUC/BxoB7qwCAPqVN+Ej42oH74nlkoVsCW1qtw7mc=;
        b=aw7Rhz9g02YjhDdZ3BLd6m67ejXVqnj6ruaIXalqGoAqsY+L/qOM0AgUMiAB4kITVO
         z+RMoPZp6kcx03oOi95k5TCh9/V9dWSC4OWQ/ah2tSx9T5GjrvTTUalvgbtgyKHQpdNH
         ilsi7B88apqw1MKBjEdlfO55p9nlciV0IlmxKyV0M+7qv9l+x6aSJJ3Fj5JKhjLhIY2I
         xjEtS/RTyX3gkIor+K6By8X2qS+skygRcTKu9JexRNFMyCnfirXn8+TMKKQL3Fvyl/1q
         pO1T22Ag2fvH6ZEdceWdMyStDC+kgeB4/frB9NmpUImsZnSPncD9c2B8I7DAM7khdzLW
         qklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678142914;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2PUC/BxoB7qwCAPqVN+Ej42oH74nlkoVsCW1qtw7mc=;
        b=RHslHbExVok3uGA69jxMu0Ntuw1HSFEW6forf7K5nNwukp3KnwNuXzQxwnzzICYBVt
         PGDbFMeQ6nr0ao9JKzCb63APG8bWKUsWt2Q0euOkrHGY53z3PENu6GgUvyGpGy/tIYNB
         8zjonyOZdXyeLu/FEJeEuskaHXnpSGOmhIrLg+Y97Y6v3NgiiJrjjQa6M/NAmDUAKdou
         DX7iDYPItZAdL4JT97srvZI0Y7iERPGlHaILD92hzL8p6IRmQ+UVxYTWY8XE7Wqy08cp
         81qZ4uIAcUa+KX1s3TsOPl5alZzyhE5ZoxWOPCbecNfDOKnG/x6y5dHJ7a8vEsp5VmlC
         PGtA==
X-Gm-Message-State: AO0yUKU+9oudIIawcO7MCmrYA6tCCyQkHHforW33saF8BnY5eygwUSny
	hw7YgRlmWrCzxUA7/OBQI/IoIw==
X-Google-Smtp-Source: AK7set8pvRV+c4zoKVLszD+Hz59GPB9xs1KAx+cphhOhNNBx1YnJ3bEiCT45YT2mB2awAX9GfnLsug==
X-Received: by 2002:a17:902:f54c:b0:19a:8304:21eb with SMTP id h12-20020a170902f54c00b0019a830421ebmr18203598plf.6.1678142913951;
        Mon, 06 Mar 2023 14:48:33 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id y8-20020a655a08000000b00502e48db9aesm6660230pgs.53.2023.03.06.14.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 14:48:33 -0800 (PST)
Date: Mon, 06 Mar 2023 14:48:33 -0800 (PST)
X-Google-Original-Date: Mon, 06 Mar 2023 14:47:45 PST (-0800)
Subject: Re: [PATCH v3 1/3] clk: k210: remove an implicit 64-bit division
In-Reply-To: <774cb6d15fef0e0b41e7a071eedef980.sboyd@kernel.org>
CC: mr.bossman075@gmail.com, linux-riscv@lists.infradead.org,
  linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mr.Bossman075@gmail.com, ustcymgu@gmail.com,
  damien.lemoal@wdc.com, mturquette@baylibre.com, wbx@openadk.org, aou@eecs.berkeley.edu,
  Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, lkp@intel.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sboyd@kernel.org
Message-ID: <mhng-8b4fc148-76c1-4dae-b5ab-34f218e7ffe6@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_144835_670741_B788711D 
X-CRM114-Status: GOOD (  11.80  )
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

On Mon, 06 Mar 2023 14:41:11 PST (-0800), sboyd@kernel.org wrote:
> Quoting Jesse Taube (2023-02-28 16:26:55)
>> From: Conor Dooley <conor.dooley@microchip.com>
>> 
>> The K210 clock driver depends on SOC_CANAAN, which is only selectable
>> when !MMU on RISC-V. !MMU is not possible on 32-bit yet, but patches
>> have been sent for its enabling. The kernel test robot reported this
>> implicit 64-bit division there.
>> 
>> Replace the implicit division with an explicit one.
>> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Link: https://lore.kernel.org/linux-riscv/202301201538.zNlqgE4L-lkp@intel.com/
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>> ---
>
> Seems better to merge this one-liner earlier to unblock 32-bit.
>
> Applied to clk-fixes

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
