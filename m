Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB62C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 01:55:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 410F964E9A
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 01:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 410F964E9A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=g+mQgtLE/spo5AOUYmBG9CwEz7bjhvPeACS7HRTQrIA=; b=mda7dUiwh4FHVYM3QuPrSCHhn
	rUj/wf7nNu1QnamEgrAr15WehoSnyA7Fj9+tBisSBVJLq5o3UPZPfsB/ZXKAdtXpX366P79NNyv2L
	ewMR/ksrn6xorKteqK1+22AXsO74rNGM3apIzU0f2wIylrG5wfVwfjhj33u3s4EMih6Vw6lzqlHmv
	2DK0H4XrFiByxKu2K0Ld41APRgW3b/nthNHW+m8F5eulDREaS9tDTt35FRHhlWHUYzANj6RRRJ3MF
	IsLqmIfcRkEitsNnvniaLN34EJPxjghQYpNFjK4spnDrdg/QjgeXcuc1AczdNCPqB9UEqNOpbiT1u
	fyy8IDTeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9IFN-0007FI-QX; Tue, 09 Feb 2021 01:55:21 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9IFL-0007El-Gi
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 01:55:20 +0000
Received: by mail-pg1-x531.google.com with SMTP id z21so11485669pgj.4
 for <linux-riscv@lists.infradead.org>; Mon, 08 Feb 2021 17:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Vb2nlQGaP26yPlUIcez5sRj184B9EgE/jeGXiB1oSwU=;
 b=KDHCzh7PFsqmsUNzwhs/0SaFtOeHp5NK39m/SWsVxNCMkMQCBJOThPz9AT8UCS1v0K
 lzdYXIJlBuOviEEuWWmSrVnU18ki6NjaJJRE9b4gemyDD+hHqlp+xnsunzIyJtD7Jv1y
 N8l19/Pg+7WHf0zDqu93BsYmen6Dl2oFrLGcnCuJr4sQgoFNupTePeXDlUkVi8D982ye
 vPgbJTp+uekwQ9rE12FqMZuIV4PZpOk2Ymx1LTQ75SHsn4UJvW2jRo8L56Psoq3KTkGx
 72+PO0cilAlVo0HaDzRejUEAL9jg2Utpp9F2MFTIc47HK/k+JsdLdhDsBSR1xwdqlnkH
 LnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Vb2nlQGaP26yPlUIcez5sRj184B9EgE/jeGXiB1oSwU=;
 b=Sb4mlGRfav2BMgv8Ufuo+KMAYPedP0UjoV4o4q+1M60lqsZ9N7BacGkstrOu8MGlmF
 eKMqRY4YEzW5NkhjyHflBk5c5A46EDBr2zaqBh7u3woqaeLNZjC+3fgIfhtQFEzjPwD0
 lwbbvVDnyOvDqWqIKMACruIzbYHa4i3a3FzS3Irw3vMmY4QNaFo1wRE+KmcenH75tV+X
 AIyxQwfWkLZOD0mo8PvaklRwMHENT4p+AAIYUs8tFBx+RzXb9FUgY7AMy53Pep5s0ck7
 tkwivgE0kKH5Nn1u/T0rcae3Hfx0s/iYnpJgfCqAemkSd3PdoEX6gFftgf4p+SnPMQzF
 YnEQ==
X-Gm-Message-State: AOAM530Sm48W6wpOP36/gMBaW7DlFJ+tPFKV010arjZAQEns+0HXEIoL
 avfQvY+UgRWI7pn/6nk45pxDvA==
X-Google-Smtp-Source: ABdhPJz5tJe/wnpCrfYutRhPvkqG17RyE0LdVbep6txq+E9zTwTkas85e4iOsPhlMDk3hdBq3cChvQ==
X-Received: by 2002:a63:134f:: with SMTP id 15mr4132329pgt.128.1612835715181; 
 Mon, 08 Feb 2021 17:55:15 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 74sm3895691pfw.53.2021.02.08.17.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 17:55:14 -0800 (PST)
Date: Mon, 08 Feb 2021 17:55:14 -0800 (PST)
X-Google-Original-Date: Mon, 08 Feb 2021 17:55:11 PST (-0800)
Subject: Re: [PATCH] selftests/vDSO: fix ABI selftest on riscv
In-Reply-To: <5a8923b2-0c5e-ab6c-52fd-f00bc1361a3f@linuxfoundation.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: skhan@linuxfoundation.org
Message-ID: <mhng-6ff7da88-6f30-4910-833b-b4a9a4eb71e4@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_205519_705145_988FD5A9 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: aou@eecs.berkeley.edu, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, tklauser@distanz.ch,
 vincenzo.frascino@arm.com, shuah@kernel.org, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 08 Feb 2021 15:37:24 PST (-0800), skhan@linuxfoundation.org wrote:
> On 2/5/21 12:57 AM, Tobias Klauser wrote:
>> On 2021-02-05 at 08:06:37 +0100, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>> On Thu, 04 Feb 2021 06:50:42 PST (-0800), tklauser@distanz.ch wrote:
>>
>> [...]
>>
>>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>
>> Thank you!
>>
>>> Not sure if you want this through the RISC-V tree, so I'm leaving it out for
>>> now and assuming it'll go through a kselftest tree.
>>
>> Either way is fine for me.
>>
>
> Thank you. Applied to linux-kselftest next for 5.12-rc1

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
