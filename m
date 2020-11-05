Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223B8C4741F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 18:54:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A2E12078E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 18:54:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PKXjWy71";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="vubNPTNX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A2E12078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=fqvin07PG+nU8AW58Vk0xcL93CkySxPes0mkOh/kCj4=; b=PKXjWy71U9DO3SV+M30Yweqq0
	McV8nV2zj8oLaks8nBruSrHrhNZmo+QHauXrVcmAad83BVZ+rvauQX920xyBgrQUzGPeINJ/5fqDw
	8j21N967u8W0VjycvM+cFNIJ61XzvExiQp63TPtl9FT3/zUL4jJYltBD+cA3+z5sjYABU75h8wHl6
	Y1p2emoY2KX8lHuzN2L5kkUHeLuTNl3RzpkFhGm6EU4n//ars8VoVcax9R7h9Opjlt+wIQarX4+fI
	KqvMNOGf2weJs52mo662hkAQannqhnA/Phx1sIPQRLltLPkQ2e6Z/fuMcnDJkopsDKQ9NQxbkHG4v
	0r3bX3Cjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kakOe-0002uv-CA; Thu, 05 Nov 2020 18:54:08 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kakOc-0002uT-B7
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 18:54:07 +0000
Received: by mail-pl1-x642.google.com with SMTP id z1so1210109plo.12
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 10:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HtLxZkv0TYlH01o2C6+4735a4rHSzmaJuyNckO1OmEo=;
 b=vubNPTNXQb0W2AOa0qY3gSc9NNtvmPNZtHq+hbpfahbGOKrqfc8qEIFLmJR6OjIrnz
 M2PKlPGln2O2B4T1T5fL+0eOnI93x+JUEpPyca+11W+R0NFkacD7yvvALn3ptG8FC+9J
 gT6UaSXZVREeguoRzPh8+TsG659OPAXdFkqLjc5NTgqNjAxP1F95L4i7MhGGpJUPb8UQ
 SefnFxeKpHGoL4suJs1Z4wRUrGHezEQMIAXKUQ+SPVezcECpLxvb75IcsQucNFZIFr0m
 brJ2tp/B0cUXkZMRbyxyR6GE9J7jC/5iZhbG8g8UtAEH2fDDSYIBtRGTfRCTl7rtsayU
 sB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=HtLxZkv0TYlH01o2C6+4735a4rHSzmaJuyNckO1OmEo=;
 b=EwwXi5C+dVOr/0/agLJje6n5qrP3P3Ml6Ne9MpxEdLEwdVVSuK0Jqmw3A0iI6XFd05
 CqHNNLyK/vMr0wpasM7lGA5CwlwFzoJyWReNOrRiwGq4g8McofEjYGnA+19Sl3hMDlug
 rNq+a/sbHVBqxItOxhDo9FDpiyBQspfv+l+ROT9KM/mHAW4Q8SlXcpNY358tZtkuZTGK
 5Z1Ow2o1KmGQjHsLDkyNT1GFN2HlbV2FtQyBbYu0uxAA9EFZ/DqEN0gtuRjNoTcJ4B5W
 F3o0p6mR1p4OSobbJzUOb7s9kapoZunmul2AxUlE6ulXBOHsqYch8y3vGDPpHDTPL3ja
 4/fQ==
X-Gm-Message-State: AOAM530Z2kpiyJ00O1ez7ni+OkU7esnrSCyUljXVoT7th1kwQVU5U5sY
 gIqwBc+Z3iUQW2sGQyuHPpGcWRJyO7l3dg==
X-Google-Smtp-Source: ABdhPJz3Aj79Afx5ycabhmbdXG/hrX0zqj+ndTipQTpQLmniaRkOC9FOCRo98/vWkB4/t2JnqKMMqg==
X-Received: by 2002:a17:90b:3798:: with SMTP id
 mz24mr3696165pjb.46.1604602443863; 
 Thu, 05 Nov 2020 10:54:03 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z13sm3027751pgc.44.2020.11.05.10.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 10:54:03 -0800 (PST)
Date: Thu, 05 Nov 2020 10:54:03 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 10:53:03 PST (-0800)
Subject: Re: [PATCH 2/4] clk: sifive: Use common name for prci configuration
In-Reply-To: <160454441626.3965362.17922436443029310228@swboyd.mtv.corp.google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sboyd@kernel.org
Message-ID: <mhng-e3785c68-4fbc-49be-aaa1-40043bcc1cab@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_135406_440558_48526155 
X-CRM114-Status: GOOD (  19.05  )
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
Cc: aou@eecs.berkeley.edu, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, yash.shah@sifive.com, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 04 Nov 2020 18:46:56 PST (-0800), sboyd@kernel.org wrote:
> Quoting Zong Li (2020-10-16 02:18:24)
>> Use generic name CLK_SIFIVE_PRCI instead of CLK_SIFIVE_FU540_PRCI. This
>> patch is prepared for fu740 support.
>> 
>> Signed-off-by: Zong Li <zong.li@sifive.com>
>> ---
>
> Looks ok but needs an ack from riscv maintainers to go through clk
> tree. I was worried it would break defconfigs but it seems that the arch
> selects the config so this should be OK, right?

Ya, looks fine.  TBH the whole Kconfig.socs thing was probably a mistake, but
at least in this case it makes things easy.

I was going to suggest spliting the Kconfigs out so there's a _FU540_PRCI and
an _FU740_PRCI, but looking at the code it doesn't really seem to buy us much
-- just that one offset table we could toss.

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

>>  arch/riscv/Kconfig.socs     | 2 +-
>>  drivers/clk/sifive/Kconfig  | 6 +++---
>>  drivers/clk/sifive/Makefile | 2 +-
>>  3 files changed, 5 insertions(+), 5 deletions(-)
>> 
>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> index 8a55f6156661..3284d5c291be 100644
>> --- a/arch/riscv/Kconfig.socs
>> +++ b/arch/riscv/Kconfig.socs
>> @@ -5,7 +5,7 @@ config SOC_SIFIVE
>>         select SERIAL_SIFIVE if TTY
>>         select SERIAL_SIFIVE_CONSOLE if TTY
>>         select CLK_SIFIVE
>> -       select CLK_SIFIVE_FU540_PRCI
>> +       select CLK_SIFIVE_PRCI
>>         select SIFIVE_PLIC
>>         help
>>           This enables support for SiFive SoC platform hardware.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
