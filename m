Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD72C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 10:18:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FD65610C7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 10:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FD65610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Cc:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IdyVDB5drm+rz+N1H70D6NhdhBJPYXvt0CwN9eY4uJo=; b=4cBeXxuq66eSJyeOjr0roHhdBJ
	gJSUcXgw3BZ+0qxs0OGXdAzOWhwfxw2tB4FFg5gBphwS7J+GMeTmOnCOUnL7Ihxjze02MTh43ikj9
	zuh8KuugibnzvtWTPxS82ygf4SGN0Yw6E6VN79qHc46lzmakDx0yMhLObY39XARnjsnYKUNpL9Qed
	mFwV81XHIVCydLhZffakPAsAPToDzMUJNvxbq9VrJpeKLJIDS9kxyJEp6EORgz4R7+N7QkNDwDTeG
	A+KctUj100l9g0N7bCLO+0aRwCZxTJV8eqk+BRpLZuVu/0yIdXB/Q+Cx4XhXUYxbAIiDIJ+mOhv4e
	51AxsTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5mpn-00CUwy-Aj; Tue, 20 Jul 2021 10:18:43 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5mpk-00CUw8-85
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 10:18:41 +0000
Received: by mail-pj1-x1035.google.com with SMTP id g24so13371810pji.4
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 03:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pjGXHhlsJXpMCFuAdGKhMv/rBK1kCdyMKVIj/X10+qU=;
 b=OgMYs9wdRGDVFn92Cde46FS6HH/GLxa9ZfDpj0LDOb/LlyAk4NiJMLagfMvjuQXhld
 bbEzaAOM5GZVAyMlN5owyX6H9AOevEu+LdEex+lJ/gCqA+kQHhNELg1LK1ds1OmbwCPV
 YHUd6koNim1cPqx407RenfEoKPDfR9ckvI7cXlBdwTIELlXTFoSzgp0eXqu5PriqmC79
 /lZGjilHrGbh2he7slmtTfvl4G/9oFvpu9C3HqspM8lwBIX8R8g6hh7h53Kp3cplyyCH
 PKZ6naph/JES0YtELdXN8XkrdeoG6l3vHitnqkRha7egJYDx7Q5lVEL0zeh63Uel2NY9
 aegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pjGXHhlsJXpMCFuAdGKhMv/rBK1kCdyMKVIj/X10+qU=;
 b=DYGWu8pu9V1aZeWHlIZXx6JAa6KjA6VmiydHzY7QA6lR6wOTLkVGlxI4Bz4I0ahvRW
 a+tTapLXhOK4P9Nm4wSzii45Z/DkTgnToLsIKPsCDGdslg2887/rNFKVmYtvvYtnbtMi
 xOnKDoqpt4ajDgq4T6mo5/NsJ/HhcDmcADHUEAq8u85SqTKe2e9dM4XzFxW5VgqQ0Od0
 QKhtlwlSYLvQV71ZSaPPtMn+Od2qILJcn0veB/xIj7QZFm3DarKwtS+rFhpfAjedzTdc
 DI6589wOG2qXef6B4PjB4FTsFD/1gaowcDW6Mb2RiIEHTFltotvWwiJM7yui7dAhBT6j
 YMKw==
X-Gm-Message-State: AOAM533o23Qo4oyQc5LgopMoMJOix6NI7UaInL6O63gC04HNHEiNyyw/
 fcjMY1NLsCdZzSEQ05630MM=
X-Google-Smtp-Source: ABdhPJz0teYPmNQHBdbGCNYldG1/FoD32crh2/voQ9Zgt5lnx9h6hzVS3/YS2b6hLl+U15a5jYFfvw==
X-Received: by 2002:a17:90a:510d:: with SMTP id
 t13mr34487868pjh.28.1626776319022; 
 Tue, 20 Jul 2021 03:18:39 -0700 (PDT)
Received: from [10.252.1.51]
 (ec2-52-196-129-95.ap-northeast-1.compute.amazonaws.com. [52.196.129.95])
 by smtp.gmail.com with ESMTPSA id u37sm23843190pfg.140.2021.07.20.03.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 03:18:38 -0700 (PDT)
Cc: akira.tsukamoto@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] riscv: __asm_copy_to-from_user: Fix: fail on RV32
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
 <93a6ae3b-3271-5edb-0a1b-260ba789f3f1@gmail.com>
 <CAMuHMdUnD58W6qAbxnT3y-BMTHb+De+z29YNGYVA3mWD0B-37g@mail.gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <9b2bff0b-7ebd-80f4-47be-9844aaed1393@gmail.com>
Date: Tue, 20 Jul 2021 19:18:34 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUnD58W6qAbxnT3y-BMTHb+De+z29YNGYVA3mWD0B-37g@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_031840_350482_16B2A695 
X-CRM114-Status: GOOD (  12.49  )
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

Hi Geert,

On 7/20/2021 6:49 PM, Geert Uytterhoeven wrote:
> Hi Tsukamoto-san,
> 
> Thanks for your patch!
> 
> On Tue, Jul 20, 2021 at 10:51 AM Akira Tsukamoto
> <akira.tsukamoto@gmail.com> wrote:
>> Had a bug when converting bytes to bits when the cpu was rv32.
>>
>> The a3 contains the number of bytes and multiple of 8
>> would be the bits. The LGREG is holding 2 for RV32 and 3 for
>> RV32, so to achieve multiple of 8 it must always be constant 3.
> 
> RV64

Thanks, the LGREG is holding 2 for RV32 and 3 for RV64 (not RV32).

Akira

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
