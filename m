Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E616FD59D77
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 17:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZ92qxupLNC9C8DfsJar5iDhqT4t7b/PS7xMYyfKJCI=; b=3JtU4gnqQNwLtb
	Tf/LW/m02W9U0Aa3n03Ky5uS+uhhehpGN/fE2trTuZ351fYU0m7idvrcOn4oJD3W9MNgvqd1P7Wfs
	nX1QYqoC0ZWSTDVgYrXjVZ9CdcRg7ngwt5oldSYGU2bzngrLyXqhZ9ZwYYrsJ+86PSPar+Ud6nneU
	tXQu5/ESucA+AHLKxWr+pyMKLoWVMjPheg8yJVqkxnTlpfHZ1Lsa2ihUloCb52LLB3j4d6MH4nDss
	9Qsr/kp77QMsipLEvMr7jl50UnjLLeo+OZrOXOhPmFzOZSlG1wwPZvC9g2I8r0hFpuPGcpOMBSoR0
	YCMX7JYu3WPJDcOtWFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU7NZ-00000000uyy-3Cfx;
	Fri, 12 Dec 2025 17:56:33 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU7NX-00000000uxz-03eU
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 17:56:32 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b725ead5800so222266066b.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Dec 2025 09:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1765562187; x=1766166987; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OcS8a0/8s9a8JTU78PtVC9Y+lOz3UE5scrw2tzT8jNk=;
        b=YHOCxz2vXiS72sSioiM4WNwFQRtT2bOXAxTjEt7hnOIcZAuwAMeu++qDe70YU4HBJk
         HfvQV8kPXT5WJG5MH8M3MTioPmEz6Doh644TuDqliSHmZYKkNdaEtmGQGh/nQQL4hnsb
         2eb+U5ylJLaDIO974W3pxRv3BYK4sXNtRKrkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765562187; x=1766166987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcS8a0/8s9a8JTU78PtVC9Y+lOz3UE5scrw2tzT8jNk=;
        b=F+UODRhHYAgtbNeho6HBqDIJTTrhT5X5A3rJKcEZOMWJ93lZ+xEkIv0ZEHkfWfMCwx
         TAiO7AblR1owmfmbnIW3eBdkHsGns8siQiuSOGagZKmc3hq+cxhAf7FQenLvi3fSIix0
         DIq2Ayogb2LMK3TG60wYJeUmNd6XTct5m94+ATtEewGwUhAMqYSEqkAN+9tONPeTFlyz
         zZqfDlk8N12BzEyxO0K8A0a43Q3vsWgRflAGIsrbSGJK2C25VxzOxplSNf+tX6wmoVho
         RBHI4m4j9goe0rdvxAPdUB8m2jLIUo16qEWMjo59o6/OUZHRz1ERpUX6jfpzqL4Oosgm
         8/Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVhCCuYFX0ERPK/MxQzcZZMdN5z/vGWOq5PbJDxu4TeoNyRo4o9CsDpX1lVEAh9HzNAuAmjDz+NfDhGxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPSphnawsgCTL11rQz/s7mJQylC+QUjMWUcyT4725D8JJ8LFup
	qbGVo5QTbHUWtn64E6UVhwvFm6B++GNsWufbQh+cq/bLp94KnxuPNUQjXVEwftg6w5vhxxVr/uw
	M77GffaLykQ==
X-Gm-Gg: AY/fxX6NwLNdZnLair7p7JcbzLX696PVHw83mHMdufi3xk7F2dnq/NWvHRwoJglZxjR
	g9qkjhN/KAg3QeR1W1CthuARaNKbRInx+6JHdvQnWf/gmzWCf0Ti8YQGWSAU2OQrgHZYzOpplaO
	6TMD2i0M5ga6SvrgsnJmsflXsleqy51dDbs/+/9F0rgvWFOJe5dptBhyQDnTxfDbvljyXHkJfLk
	85EJBst5F9lB/IkAjTsShEZIm27sJpriPeFloY7Zo2o/3GoAyvPe31+Zt/TFjPlmga4IzdLp1nn
	eppqjxBFJyOB38ceST4nVKxaICbNgU+gY246mB9eixORx3OjvHs+UOxac/mIW87oUccyIcwysVZ
	g6BguVnUnzDNdkhU8Ji3rXaSuPzLibjNF9ikfYxsl3zkkZCGqnihKr2VwU42H4dCho8soHpXzb1
	GJ4kqBtdTBLi36Pi3n+JAApiCa3g4Kwkxs6z1srHIV4EWuyNcJqSpmwywvjIC2
X-Google-Smtp-Source: AGHT+IF1nx27wIw0SuTfaCVSHpGUBYjLYeHlmBY8fNMmSvnSJsEzZuVCHsOjxS+Ec2EQjBkvD0B3jw==
X-Received: by 2002:a17:907:2d1f:b0:b73:58a0:e064 with SMTP id a640c23a62f3a-b7d23b884admr294211866b.50.1765562186683;
        Fri, 12 Dec 2025 09:56:26 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5d0af6sm631953166b.68.2025.12.12.09.56.26
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 09:56:26 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6498850d3f6so1966762a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Dec 2025 09:56:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXNBIxSYaV2tgwY9vn5iEBJCj7vazuWNPqkvkTQqXf7AIsam6awUiQpN84t0DmsynlwbvujpHoYdhgYlA==@lists.infradead.org
X-Received: by 2002:a17:907:d19:b0:b76:23b0:7d70 with SMTP id
 a640c23a62f3a-b7d23ad8414mr342276066b.39.1765562185764; Fri, 12 Dec 2025
 09:56:25 -0800 (PST)
MIME-Version: 1.0
References: <98b74397-05bc-dbee-cab4-3f40d643eaac@kernel.org>
In-Reply-To: <98b74397-05bc-dbee-cab4-3f40d643eaac@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 13 Dec 2025 05:56:08 +1200
X-Gmail-Original-Message-ID: <CAHk-=wiBP2B788uvFxyiy38JvtTb_3HrbjABWkCyXf_Rxbo4vQ@mail.gmail.com>
X-Gm-Features: AQt7F2rYmYrdWgBfjwKJcmBQU2bqvM35nrdRv8RaH-NxEsckq9Xbibw_T_Z1uh0
Message-ID: <CAHk-=wiBP2B788uvFxyiy38JvtTb_3HrbjABWkCyXf_Rxbo4vQ@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V updates for the v6.19 merge window (part two)
To: Paul Walmsley <pjw@kernel.org>
Cc: sfr@canb.auug.org.au, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_095631_182825_3CE3A552 
X-CRM114-Status: GOOD (  11.93  )
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

On Fri, 12 Dec 2025 at 14:36, Paul Walmsley <pjw@kernel.org> wrote:
>
> Please pull this second and final set of RISC-V patches for the v6.19
> merge window.  The primary addition in this pull request is support for
> CFI in user processes.  This series has been around for almost two years.

It can damn well be around for another release then.

Because I'm really tired of these late pull requests. That's true in
general, but it's particularly true when I've told people I'm
traveling with a laptop. I was spending extra time the first week of
the merge window to get things out of the way so that I would *not*
have to deal with conflicts etc when on the road.

I appreciate people who send me a second pull request with *fixes* for
the first one because they are starting to already react to bug
reports. But your whole thing where you think you send me a first pull
request and then a second one late in the merge window with more
development is simply not ok.

Either it was ready to go early, or it's not ready to go at all. None
of this "I have more presents for you".

The merge window is not for late development or for "Let's make extra
work for Linus the last day of the merge window when he's on the road
in a strange time zone"

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
