Return-Path: <SRS0=LlRU=HV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AEAC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 07:21:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 546C864E77
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 07:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 546C864E77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=BfqL/SDtk2HnlkcoBTyqauB+Un3gWzUvAl6noQmT4zk=; b=PUySHDX5a2s7Bmy+I7gTT6GdO
	yY2L7aE7OpO2vNzQIUiJmp+b3WSLTEuHeistrp85Q9jG/CeXusX3L+Kzj90rdmW/t5Bf4rA7ss43j
	F3Kg1Giz2zCSPpWI2vMJfTyfDqmUrEASe9MDBu3gF1cZh+JYtcetLPKXds4Pk8FqgHZXDJ5d60yUY
	Pg1N4Bv03MebZwESSwMjykgJcbv4FpYgZNlHa/c8OM9MhTBYUl2fQFRdbtO7IB77mPZ8BqaLrCFei
	Gs9r0fhJ3en0BF+lWGCHWxResvPuQAg3bKlQVPOqNrucGUrUwyRVpooickAnFbufKduBiU5ByUo0L
	JU0HMu2Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lD060-0003Ss-P7; Fri, 19 Feb 2021 07:21:00 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lD05y-0003SJ-2D
 for linux-riscv@lists.infradead.org; Fri, 19 Feb 2021 07:20:59 +0000
Received: by mail-pl1-x636.google.com with SMTP id a24so2859826plm.11
 for <linux-riscv@lists.infradead.org>; Thu, 18 Feb 2021 23:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=1GlAl/OST5BOect0GC63qFciE+OwKMNcFl5A98T7cS8=;
 b=SXyCc/0E8NaLWy2sZhLWFntNmHiWj/iuFZnSYnfGGWpvMWl1mFKj4lteEz0srOYzfP
 y1uuvS2HQvER9awtxefI+TwRp+WWLqVEft6k7dnBgpQy9YHVOdymVwkIcOlGGsMlI9wj
 bv2lK+2FviU60l2cxCjpBjxGnU0liZTGDOH6zMZafkvxpOZHoWcL3eu9//0OYXi3kTxE
 RjXlPXiAk9bxPipOwg4Gl2yYdRDq67JLGPhWwOZUzm/b5Ls9k36JcxDs2JPCQwV+ZkEW
 H76v3RdX/punuR3LMZ5Omm6cZ1v8ElpZW4WF7ylsyCR9o39PoP4Ct1FYfqaxjl+5WjO6
 Omdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=1GlAl/OST5BOect0GC63qFciE+OwKMNcFl5A98T7cS8=;
 b=qiqwY0l2wnK91puMhm19lfuPRSx3tfPDFvV+9AOsahAqAXNCtjSeZ9S933dKvZxL2r
 QhVOhezX2i6r+dutEG0GQ6odZjV3IplU04HI/sW66TvkOCW88w79jHC6lVDoEoDEHxmU
 InWUQouR+A7rDuH5vNVAELWt+lqWxS8/da9L0UKYkLyNqUmdd56lttuhk4yi5sgsSz1s
 iZzXsVz3SlhMZR4KFuYTPYEQC/9wvKaOPGzfmOGEUBrCTOkc8OrK6havLRbb0MoF7l/r
 UHzGlHJ4+Rvu1OkXbvc3xehPHFmg2TUf3G30ImwjyRXNOy9J6YuhvPeLa/bSFylwE2RB
 OfHA==
X-Gm-Message-State: AOAM531WnT6NnDZlV7uYgZCgrbTKC0LDDp3hbYM32rJzrDvp+IQO7Vra
 usteHxlFp3MBkdRPtApUVCfX6hZ8Xn0ByDzP
X-Google-Smtp-Source: ABdhPJw8KpyY07UcO63uwGYg4/Pu/8mRYeBmWhXVToOFSblEDLySTJ/jP1LEIw7rxt6GwLXGgerP7Q==
X-Received: by 2002:a17:90a:ad97:: with SMTP id
 s23mr7875056pjq.212.1613719255580; 
 Thu, 18 Feb 2021 23:20:55 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w187sm7960326pfb.208.2021.02.18.23.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 23:20:55 -0800 (PST)
Date: Thu, 18 Feb 2021 23:20:55 -0800 (PST)
X-Google-Original-Date: Thu, 18 Feb 2021 23:20:53 PST (-0800)
Subject: Re: [PATCH v19 00/17] RISC-V Kendryte K210 support improvements
In-Reply-To: <BL0PR04MB65149B2F9A3722043CE65E79E7849@BL0PR04MB6514.namprd04.prod.outlook.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-67681b51-690a-4aaa-9fc7-13d35b2b1693@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210219_022058_210028_102E8311 
X-CRM114-Status: GOOD (  23.71  )
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
Cc: sboyd@kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 linux-riscv@lists.infradead.org, Anup Patel <Anup.Patel@wdc.com>,
 seanga2@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>On Thu, 18 Feb 2021 22:54:03 PST (-0800), Damien Le Moal wrote:
>> On 2021/02/19 15:29, Palmer Dabbelt wrote:
>> On Tue, 09 Feb 2021 21:02:13 PST (-0800), Damien Le Moal wrote:
>>> This series of patches improves support for boards based on the Canaan
>>> Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
>>> already included in the kernel. These patches complete it, enabling
>>> support for most peripherals present on the SoC as well as introducing
>>> device trees for the various K210 boards available on the market today
>>> from SiPeed and Kendryte.
>>>
>>> The patches here are the remaining patches not yet applied.
>>>
>>> Patch 1 adds the SoC clock driver.
>> 
>> I don't see a Review or Ack for this one, so I haven't taken it.  Not sure if I
>> just missed it or if it's going in through the clock tree.
>
>Stephen sent his reviewed-by. It is on lore:
>
>https://lore.kernel.org/linux-riscv/161301087300.1254594.18438542581140302342@swboyd.mtv.corp.google.com/
>
>There are a few additional nits he pointed out but I will send an incremental
>patch for these later. I think this patch needs to go through the risc-v tree
>since it touches the sysctl driver too.

Thanks, it's on for-next (and in order).

>
>> 
>>> Patches 2 to 9 add and update device tree bindings documentation to
>>> document the K210 device tree files. In particular, patch 2 and 3
>>> define compatible strings used for the SoC CPU and for the K210 based
>>> boards supported.
>>>
>>> Patches 10 to 15 update the existing K210 base device tree and add new
>>> device tree files for several K210 based boards: MAIX Bit, MAIXDUINO,
>>> MAIX Dock and MAIX Go boards from SiPeed and the KD233 development
>>> board from Canaan.
>> 
>> Looks like I already have patch 10.
>
>How come ? This version is the fixed one which removes undocumented dt nodes.
>Did you queue an older version ?

Yep -- I'd just spot checked some and didn't see a difference, but I guess I
didn't look closly enough.  It's fixed now.

Thanks!

>
>> 
>> The other DT files have an entry for a microphone with an undocumented
>> compatible string, which triggers checkpatch.  I've removed it, along with the
>> audio entry that references it.  I don't really have an opinion on how that
>> stuff is in the DT, just that we need to document whatever we put in there.  If
>> it breaks something I'm happy to swap it out for another version, I'm not
>> planning on sending it up until next week (I'm sening a PR this week, just with
>> some older stuff).
>
>Works for me. Thanks.
>
>> 
>> Thanks!
>
>
>-- 
>Damien Le Moal
>Western Digital Research
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
