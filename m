Return-Path: <SRS0=wGuT=HP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F3DC433E6
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Feb 2021 00:44:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60CD464E9C
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Feb 2021 00:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60CD464E9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=QscKFBt+yXxM9d7myGfKR/uMO06Pw91ErBQCQMNklvA=; b=xlR76TWcTrBAubQbiY/nd6c/r
	PH1s7scLEPK18Dy00kbeCmAmwUDZiICUg+wxCL8PGnbkeCWG5Xmr+/+PMesfKOJGVelqNF7kEvwgh
	9PXRLSKHHZTZ7W9NnwYrNmf90DO77eskulxz/tGEJrwfE9scv7w4Wcoo3nZWgGD67YOiXgnskNQSY
	ttrEhxVS1898xrR5jBTIiihPuo4RozBWYe6uGcxJz8S3zAuDoWfJQcdjx9b439C8usvTjGT8jpZ7n
	NuG+H8E5qXWFQfCPU6JzgapOsLUm8VmzfxocrbYudwSRoV8Ual1QDIRGzOyvb4BtNGetSq6dXBoON
	sVaetpCBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAj2b-00089y-KL; Sat, 13 Feb 2021 00:44:05 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAj2X-00088h-TA
 for linux-riscv@lists.infradead.org; Sat, 13 Feb 2021 00:44:03 +0000
Received: by mail-pf1-x42c.google.com with SMTP id u143so546346pfc.7
 for <linux-riscv@lists.infradead.org>; Fri, 12 Feb 2021 16:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=dbhUzwqGfG1hKMLbbUj/LjjWuHYf51AvOfJj5/4HJUU=;
 b=lOvDyZuCcqdlGpIpZqJwhKAdJ8v2iA4ozRlURXedM0oL6iIOUvFhraAQSlkyBpqhx5
 httUjscQ3/UM95/G0oBLqe5j5qxsxAJApYykpS3o/b+aNux4jCsg0Hhp4w4X68CAvGZo
 bhaXfGbLFlH+TqiuefsFSxAj9iMMm5ygvA6eyuulXQVvqpYVU0I8a/dkZ3e2T8e66Kem
 fPqXAX9NoXq1dac6LINFPFB5pxtnJV+H58P2Hqe5nxVSSiiQgIfjjNqDeoZPaR2vg04a
 1uJPv+KC0h9T2OjiE0PLBt5DcSFIGdvNuAP3ZUMWEEk/WTSzkAuixeEmTzmvmvUeifz+
 pL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=dbhUzwqGfG1hKMLbbUj/LjjWuHYf51AvOfJj5/4HJUU=;
 b=aCEKz4sT2hwT6cv9lcC9NBXxBX/ba/FWu+HQpUTxqwr/wSDkkoGr/lvjwvfZRhTkEW
 d2fHC4i/rGrX9gp1q+1PDiU1HXtFJwEA7SmY+C5IgxWIsZSfawV44Y50hOjC9PGF+5Zg
 z3r0YAuJ20uscPs+tejBNDXH3c9qBT2wLLk9OGjDoiB2wkFi1GT1jI4tAscFYI2EledF
 djjgCPACwGpgBAikBOdaDRFHdWKUn2maT0QxZyhbxAvXMtYjOluLu/hT0Ud2cRNCfXpw
 c2QM52YeEbRFNLdRuHMY6LabA1ZPHGptA2DpNm9IOeg+b2NvXbd7YLXFhJt60vWw5y3x
 6pyQ==
X-Gm-Message-State: AOAM53259ikH1z9O5VjUCyYuq9qbH8Hd/SHPST169tbsLsovCY/jO/Y+
 iNvw9SQh/Wa5J9dKNxWjk9a9/QdO5Muj1PFd
X-Google-Smtp-Source: ABdhPJzdBhGkqACtkkAi9SNbmD9Ucwde/9QRGP1PUg2zL/AcBwjgqor8b5sJsMl3wBwUtpZjEeQ8Kw==
X-Received: by 2002:a63:1826:: with SMTP id y38mr5577270pgl.252.1613177036325; 
 Fri, 12 Feb 2021 16:43:56 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n12sm9230574pff.29.2021.02.12.16.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 16:43:55 -0800 (PST)
Date: Fri, 12 Feb 2021 16:43:55 -0800 (PST)
X-Google-Original-Date: Fri, 12 Feb 2021 16:43:50 PST (-0800)
Subject: Re: [PATCH] Revert "dts: phy: add GPIO number and active state used
 for phy reset"
In-Reply-To: <877dngjdi1.fsf@igel.home>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-60c8c9ad-1184-4c41-b2c4-1cf5fe057473@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_194402_343105_9E007DB8 
X-CRM114-Status: GOOD (  13.88  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, anup@brainfault.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, yash.shah@sifive.com,
 robh+dt@kernel.org, sagar.kadam@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 10 Feb 2021 04:47:34 PST (-0800), schwab@linux-m68k.org wrote:
> On Feb 04 2021, Palmer Dabbelt wrote:
>
>> From: Palmer Dabbelt <palmerdabbelt@google.com>
>>
>> VSC8541 phys need a special reset sequence, which the driver doesn't
>> currentlny support.  As a result enabling the reset via GPIO essentially
>> guarnteees that the device won't work correctly.
>>
>> This reverts commit a0fa9d727043da2238432471e85de0bdb8a8df65.
>>
>> Fixes: a0fa9d727043 ("dts: phy: add GPIO number and active state used for phy reset")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
> This fixes ethernet on the HiFive Unleashed with 5.10.12.

Thanks for testing.  Looks like I forgot to reply, but it's in Linus' tree and 
should end up in stable.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
