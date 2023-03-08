Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B91DC64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 03:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:CC:Mime-Version:Message-ID:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=YtKHpUnckMAN1kvsFvBCkZNSx9KmJ0uP+y+xbVC/qfs=; b=BO8SR2MoaKavf7QIyawW+j15Qi
	yccNzfuIdCryr4ONFvoFkxqNl/wuFB87TJUHdwAUqqZkDfgAHWhKvScX3BomHH36FyLQDmrUdW8jI
	h9gHZQAxyJw2O6vjNWLjSDWd4g7l4LBRdinW5ROktZiWLeBA3bkNYltSIWcBzJbJiWOrrxR1WNrnI
	ZA1A5Cn7vNzzDXTfNU7KcTfzLz3aTCzcwQXxsj9WjJomY1Cld3fNNvx9HCkdwIuBt9wsgqa1ZFztT
	N5kkIbCGa/D18nKsvC0y9UtUFhR1TePOCVBhJyeAXG+q99jw1ReXZvbDPm96D2G2fU5e6xsnB9YQc
	4kGWrlXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZkkA-003Mfa-5Q; Wed, 08 Mar 2023 03:45:34 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZkk5-003Mek-UT
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 03:45:31 +0000
Received: by mail-pl1-x62a.google.com with SMTP id ky4so16503513plb.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 19:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678247128;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4ZCOc3mfCj0AC3biqgCZENtlzkJ+33Pb7B/SIsDo+k=;
        b=0u+x9DsomFyjMNGcbtzfyoTHwt8qOxy9beSxjhMmj8zh+5aCKJ9DVMCQ9okbiC8o5E
         /EWcvzRVoDt1knCL3ZNYRHvGRMrdMOc4qvbO2TaP3ZtVyEQjHSFhvYnkZKsoMgukdm6X
         Y44TMP0zQzcxNdBmJgFa58tSjRmPy7P5mWEJyeUA6G9pT4ak9ORl+iwRKJs7lNqxLb/b
         YMActfD5KxmxmHn0Bq3/0lOq6tcWrp4lOq53JMlxR/0CRFIiiatHVczfNzlhhc38kjWr
         kQ/L7SKY8VUONFkeifPsWzliVHJhpa9NNax0yjUt2rRPlI4Sczua7LAdZPJWQBHz5lgK
         +Vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678247128;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4ZCOc3mfCj0AC3biqgCZENtlzkJ+33Pb7B/SIsDo+k=;
        b=5OBqvFEb4k9/qWCPJK4nJFxzE9cY+7T3yAf/lf1YBxCxKBfHGjYbX0mXpAXkyFQuND
         dhT+Uad2bdSJMIhkKgS7HxGfypRhy54MKJzleq2HkM7c4Fx65TTaCx0yDyLwReREPkQy
         brJOTaSrg/AkcwFwWIs/Lyi9sq7v8R86x+fqyeTVu/Jjo6FhQi84IcmJV5CS4On7hgYh
         iqv5x0/Gt3sIfpizAmFtrjokc286mYO2KKXbvVmjHh/FXpwsvpwdUrVRf+RWGngXmksP
         nS3quwsqPJtTI1+uQAm01j2DQs/P7upNCQxE7aPLhk9TgSYTCIJIP2Urxg0gbfz3w1tz
         ir0A==
X-Gm-Message-State: AO0yUKVhBfZEwoPM5mYFYrsCNUpSb4517U0PpaOC2+2n+KXfS9i0xAxw
	0CC4OHOOST2xs0QopjP7zPDp8g==
X-Google-Smtp-Source: AK7set+KZksDT7X01j+FCtcezLtBZ3kJ3ekK4zHcOoOG+0PqmHkRbQb66FGlMa23SEDhQpnyPDwbqw==
X-Received: by 2002:a17:902:ea0c:b0:19a:727e:d4f3 with SMTP id s12-20020a170902ea0c00b0019a727ed4f3mr23665335plg.5.1678247128449;
        Tue, 07 Mar 2023 19:45:28 -0800 (PST)
Received: from localhost ([135.180.224.71])
        by smtp.gmail.com with ESMTPSA id ko16-20020a17090307d000b0019472226769sm9069473plb.251.2023.03.07.19.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 19:45:27 -0800 (PST)
Date: Tue, 07 Mar 2023 19:45:27 -0800 (PST)
X-Google-Original-Date: Tue, 07 Mar 2023 19:44:57 PST (-0800)
Subject: Re: [PATCH v4 0/6] RISC-V kasan rework
In-Reply-To: <167824615129.30763.10646446884793553712.b4-ty@rivosinc.com>
Message-ID: <mhng-0481a843-8d7f-4f2d-b110-f357324c7c73@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
CC: aou@eecs.berkeley.edu, andreyknvl@gmail.com, vincenzo.frascino@arm.com,
  linux-efi@vger.kernel.org, kasan-dev@googlegroups.com, Paul Walmsley <paul.walmsley@sifive.com>,
  glider@google.com, ryabinin.a.a@gmail.com, linux-riscv@lists.infradead.org, ardb@kernel.org,
  linux-kernel@vger.kernel.org, dvyukov@google.com, Conor Dooley <conor@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_194530_221017_C3BDA7C5 
X-CRM114-Status: GOOD (  18.43  )
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

On Tue, 07 Mar 2023 19:29:11 PST (-0800), Palmer Dabbelt wrote:
>
> On Fri, 3 Feb 2023 08:52:26 +0100, Alexandre Ghiti wrote:
>> As described in patch 2, our current kasan implementation is intricate,
>> so I tried to simplify the implementation and mimic what arm64/x86 are
>> doing.
>>
>> In addition it fixes UEFI bootflow with a kasan kernel and kasan inline
>> instrumentation: all kasan configurations were tested on a large ubuntu
>> kernel with success with KASAN_KUNIT_TEST and KASAN_MODULE_TEST.
>>
>> [...]
>
> Applied, thanks!
>
> [1/6] riscv: Split early and final KASAN population functions
>       https://git.kernel.org/palmer/c/70a3bb1e1fd9
> [2/6] riscv: Rework kasan population functions
>       https://git.kernel.org/palmer/c/fec8e4f66e4d
> [3/6] riscv: Move DTB_EARLY_BASE_VA to the kernel address space
>       https://git.kernel.org/palmer/c/1cdf594686a3
> [4/6] riscv: Fix EFI stub usage of KASAN instrumented strcmp function
>       https://git.kernel.org/palmer/c/415e9a115124
> [5/6] riscv: Fix ptdump when KASAN is enabled
>       https://git.kernel.org/palmer/c/fe0c8624d20d
> [6/6] riscv: Unconditionnally select KASAN_VMALLOC if KASAN
>       https://git.kernel.org/palmer/c/4cdc06c5c741
>
> Best regards,

Sorry, this one didn't actually get tested -- I'd thought it was in the 
queue before I kicked off the run, but it wasn't.  It's testing now, 
I've dropped it from for-next for a bit as I don't remember if this is 
one of the patch sets that had a bulid/test failure.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
