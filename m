Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D91CD11C2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 01:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YrdEnVpMuXINnrXLPCGPb/XJumqb4Gmo/RI3cKu46F0=; b=suyASvQgeEwpVC
	We+fpUCA8aUbYr9c+eqpr0kSESnZz0+rt+J4+DtSLWmR0YcCexyd1KKQk8cffgn1g56bTmm+KF0UV
	yKc1NbXobBylJnbjX8WX1QvXXnM+KKiD19A9af1WkvvipAC/cvN23WrONz/urxNqZQQ24fI0WhTLG
	8wSfTcF4e8heyABBQ3/DmhvVwMmTwnMcBxWXIteBvzHqiGxVcA7oWn3iTeQ+R/NyYBmPrLrXWp00N
	6lVaCgY6q2ax4EHTu1aa35j22IALz/2mNU+RRdADiM+99uhuU1tYtbyYUq98oD05cbgcw5vi18ZFF
	oRvHbmW0pbi9dVhyWuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rujEP-00000009ptn-0sII;
	Thu, 11 Apr 2024 01:28:01 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rujEK-00000009prd-39Rd
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 01:27:58 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-22ecc103220so3815084fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 18:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712798875; x=1713403675; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zY1vBuYzXUVAUPu7RYDaF9UtFORvIFjy44r4Y5Ige4g=;
        b=Dho5xIqj3rvmtrajHHzEGzF1vndJC/QL869/4K1hYXUcJkWFcMADPuybhhYruQnzRg
         kC8+B+MgD31+TebFXj20wjPmiXyHWrstnhnJfL/XaoTnWS1MUv2AhSrJb/ii0L64vudj
         sDhQVUl+UfdeNtSddOjaaZ5qhSxiS1/CXThTkBhmYNiaYk3W6+BTzq3nq+7Ut2RMrKjR
         eYKln2/OYIfWhWuxQ2ltGiuWzUROD2mxouVysTaW3OriCcQxODncBjTwhP/TYDCUUMfj
         qZqtfnXTCnceqeHQRiHYRSBcZBBqxs+oDD9qA1WpbTARLBb1P77fC6+mPoyKnnJH8uX3
         gUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712798875; x=1713403675;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zY1vBuYzXUVAUPu7RYDaF9UtFORvIFjy44r4Y5Ige4g=;
        b=FCNUo3xMZhX35zfHZziIkwXqPGkz8Qu/w3n5wMfOkBOPDWUe2bc+Xh7ActOynZhkLz
         NVnaWUdQE1UIruAkqrDA75ppFdHliE0MIpVQwpZEtAq7myWePV8DpSBuTYOfIg9F/vyi
         e+3ho7IiJmNaRcm7WiuZptf8dNGzQotD8u8CdH7lGxKrvXkP3Vo4BFBvSliODPd882jz
         irGseXEUkOfCWA1aeUro821sccB3c1LkxHKrneUWPgTwRlK71uS8ovpBM/80EwwXD5mC
         hh9U7UpD97EGzQ1EDScmbyuq0lCMlM3V8vtBIUzfpFwjvFS75klp57wDv/2cFqcG8AKK
         FnKw==
X-Forwarded-Encrypted: i=1; AJvYcCUZcjbWTb/9LKp3KoAdhiV+S88FtiLzzQewk9pRl9HnIRqbXdpxXYA8OQWVsh4Yc5EX+foDWiO0PFMqXvtbc/BGYOWuNQvB1BMLeQqiUoFK
X-Gm-Message-State: AOJu0Yw+hjkUOlCyg4xULOkXmU5ukaTAJ6Dgdmy9Uymp1vXt6I5T0NP6
	b57+yO8REIoOzIRwIVdn1u6/2DdlQn3DjKMP7rC3FhMVGqo3Rm2Ux3AvtiwDEdo=
X-Google-Smtp-Source: AGHT+IF8lPPFTalL1WPSfnBvduuYhf5K6F9EIeC9RLCCka0Vl/mHkW4wRauCXJubFXwb7faJCr3ffA==
X-Received: by 2002:a05:6870:518:b0:22e:bcfd:deb0 with SMTP id j24-20020a056870051800b0022ebcfddeb0mr4667832oao.41.1712798874921;
        Wed, 10 Apr 2024 18:27:54 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:8470:fcac:9b42:fe81:c62f])
        by smtp.gmail.com with ESMTPSA id c1-20020aa78c01000000b006ed38291aebsm289791pfd.178.2024.04.10.18.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 18:27:54 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
  linux-arm-kernel@lists.infradead.org,  x86@kernel.org,
  linux-kernel@vger.kernel.org,  linux-arch@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  linux-riscv@lists.infradead.org,
  Christoph Hellwig <hch@lst.de>,  loongarch@lists.linux.dev,
  amd-gfx@lists.freedesktop.org,  Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
In-Reply-To: <4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com> (Samuel
	Holland's message of "Wed, 10 Apr 2024 20:11:04 -0500")
References: <20240329072441.591471-1-samuel.holland@sifive.com>
	<20240329072441.591471-14-samuel.holland@sifive.com>
	<87wmp4oo3y.fsf@linaro.org>
	<75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com>
	<87wmp4ogoe.fsf@linaro.org>
	<4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com>
User-Agent: mu4e 1.12.2; emacs 29.3
Date: Wed, 10 Apr 2024 22:27:52 -0300
Message-ID: <87le5kofhj.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_182756_859590_472853A3 
X-CRM114-Status: GOOD (  14.82  )
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


Hello Samuel,

Samuel Holland <samuel.holland@sifive.com> writes:

> On 2024-04-10 8:02 PM, Thiago Jung Bauermann wrote:
>> Samuel Holland <samuel.holland@sifive.com> writes:
>>> On 2024-04-10 5:21 PM, Thiago Jung Bauermann wrote:
>>>>
>>>> Unfortunately this patch causes build failures on arm with allyesconfig
>>>> and allmodconfig. Tested with next-20240410.
>>
>> <snip>
>>
>>> In both cases, the issue is that the toolchain requires runtime support to
>>> convert between `unsigned long long` and `double`, even when hardware FP is
>>> enabled. There was some past discussion about GCC inlining some of these
>>> conversions[1], but that did not get implemented.
>>
>> Thank you for the explanation and the bugzilla reference. I added a
>> comment there mentioning that the problem came up again with this patch
>> series.
>>
>>> The short-term fix would be to drop the `select ARCH_HAS_KERNEL_FPU_SUPPORT` for
>>> 32-bit arm until we can provide these runtime library functions.
>>
>> Does this mean that patch 2 in this series:
>>
>> [PATCH v4 02/15] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>>
>> will be dropped?
>
> No, because later patches in the series (3, 6) depend on the definition of
> CC_FLAGS_FPU from that patch. I will need to send a fixup patch unless I can
> find a GPL-2 compatible implementation of the runtime library functions.

Ok, thank you for clarifying.

Andrew Pinski just responded on the GCC bugzilla and if I understood his
point correctly, it seems to be a matter of changing function names to
what GCC (or actually the arm EABI) expects...

--
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
