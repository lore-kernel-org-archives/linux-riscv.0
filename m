Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A57CD11C2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 01:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lm4n2LEbweCBz1lX3GGXuAYRsXbCwFnAN43kBmQXbVc=; b=dw+bk1DdXteVc/
	8lOdIZ7EBSMrHwqJ4RQtSGg4c1BOmhrRPveN1kmoOPFl6diN74MRBBk6ifGJjAOdMq71k23lAtyRO
	n5vwZpW8HPKsgudr5zXFJCScmNz7Z0JXV8aZPpadG/kDrkdHehFOWQrjXaMfAbBJoXlPjM5wV/TWH
	Szs45uqiH+BeWYJR3beIeYe3DQ5rrsiimjERtoyieVm9DB/+iLOGHPd6RmIgy5Aa0csXw0wOM1kLZ
	jl9SqUifK24b1RmQBP+i+cloz3mgW82WUPSaC3WuMUmbOgo3SnsVWQiSefBWlBEtBEm3MkedMbIkY
	/59K46zYH7u6aT9FyE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruipW-00000009l3p-0cSm;
	Thu, 11 Apr 2024 01:02:18 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruipS-00000009l2l-3Cli
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 01:02:16 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2a54fb929c8so2177555a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 18:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712797332; x=1713402132; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kLD5kpB2LP2j5uUBOjlchyyyLOgJsQ4KSunDLcwJfvc=;
        b=zSI/UJZmukzYk7dQMCfhQF4XooezOwFhhL4zJblr1pHjo9rxaVc3HfXkIGfPNbF5Hv
         MIhDqj+mv14Hjj/vjMxCeU8EmM0XGB7tbC224wUumbJ+DhRbL6QarzIxxidhzxV5nf+R
         NH95kJV7766mVIqo9mjVckbKtqmXKAUEaRqAWHex8aC0POOw08kkF6u55AKOxvU2Ordz
         qDANcBdqUrWxUJ/6CDAPCiELEZCA+NyDHKo0UkldzSbc64B0aB6tD3tyFGQCQWnUWHma
         ZgBp/CEKAhjE1d+y9sYWMeOH7B1RthnAKL3Cf9VUJoyhRJJC7/C6IwtJRz/z3iCflNG3
         ZN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712797332; x=1713402132;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLD5kpB2LP2j5uUBOjlchyyyLOgJsQ4KSunDLcwJfvc=;
        b=njVI5gPTmAJzLrResu7kdrt/CwWMa+cyYG2PuMpZhbtdFX2vadwGlLU1Fn+C1zZWU4
         1fKxKv8SU2tKrGKs2ODsGS3UVAXi/Ycvws1wZ+KfYe1cMPJ/SMInTnJnPbaGE4UQmLQO
         4LIPoWAfAV+FloD0vbCIqk8eQFtFbxcp36L3KkBBx8sArfVCn/27eAxEJniRlJ2Ppswi
         k4jd6OzaocTMhNBCMrVibiaKpiuPicqfp1GK0Fb/2bkv6/hLniQ7XoPvwmZWllSOvmRF
         6mNR3kjUR9AvNsmR+YCeK6EbQ9fln5MO0AESSjAkkOfDpzgeCL41jFcHt/A7yfOBmAjY
         cmgw==
X-Forwarded-Encrypted: i=1; AJvYcCUGr2yp0qliudR6a3EhO/7VXCToFAtQuiMcYo0gSFNYDY0v7JzD2SEtvug0qtF/XnlSatYaxBHabRs4dK1MjyOiSg2RCdqqwzFR1xYCqbpi
X-Gm-Message-State: AOJu0Yzo5XcK2hPgLWv0Oezmj8psFFCNNQBBCTWJAu1DKcJCedoXwctF
	AjHV21UOfnGFvI7jUIQ6ppsAanXr6msoq+O8TRqQl2U/Y3JhDj17KZPrv1aK6FI=
X-Google-Smtp-Source: AGHT+IFCQFsX0y012c0RYVyy1pzruF/1YvRQvQO3mIZBA6xLw4Uhegn+z6nHl9NsGJg7fqoOGUPO2w==
X-Received: by 2002:a17:90b:3643:b0:2a5:608e:1012 with SMTP id nh3-20020a17090b364300b002a5608e1012mr4531315pjb.21.1712797332116;
        Wed, 10 Apr 2024 18:02:12 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:8470:fcac:9b42:fe81:c62f])
        by smtp.gmail.com with ESMTPSA id q4-20020a17090a68c400b002a22c8e99afsm248176pjj.12.2024.04.10.18.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 18:02:11 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
  linux-arm-kernel@lists.infradead.org,  x86@kernel.org,
  linux-kernel@vger.kernel.org,  linux-arch@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  linux-riscv@lists.infradead.org,
  Christoph Hellwig <hch@lst.de>,  loongarch@lists.linux.dev,
  amd-gfx@lists.freedesktop.org,  Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
In-Reply-To: <75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com> (Samuel
	Holland's message of "Wed, 10 Apr 2024 17:47:27 -0500")
References: <20240329072441.591471-1-samuel.holland@sifive.com>
	<20240329072441.591471-14-samuel.holland@sifive.com>
	<87wmp4oo3y.fsf@linaro.org>
	<75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com>
User-Agent: mu4e 1.12.2; emacs 29.3
Date: Wed, 10 Apr 2024 22:02:09 -0300
Message-ID: <87wmp4ogoe.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_180215_231387_AEB28691 
X-CRM114-Status: GOOD (  11.71  )
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

Thank you for the quick reply!

Samuel Holland <samuel.holland@sifive.com> writes:
> On 2024-04-10 5:21 PM, Thiago Jung Bauermann wrote:
>>
>> Unfortunately this patch causes build failures on arm with allyesconfig
>> and allmodconfig. Tested with next-20240410.

<snip>

> In both cases, the issue is that the toolchain requires runtime support to
> convert between `unsigned long long` and `double`, even when hardware FP is
> enabled. There was some past discussion about GCC inlining some of these
> conversions[1], but that did not get implemented.

Thank you for the explanation and the bugzilla reference. I added a
comment there mentioning that the problem came up again with this patch
series.

> The short-term fix would be to drop the `select ARCH_HAS_KERNEL_FPU_SUPPORT` for
> 32-bit arm until we can provide these runtime library functions.

Does this mean that patch 2 in this series:

[PATCH v4 02/15] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT

will be dropped?

--
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
