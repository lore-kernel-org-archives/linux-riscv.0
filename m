Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD879D3CCB0
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 04:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDrXUotIoF+fDanTt7y+Wp5mUYxO/KUa3hzotnMC6lk=; b=R9EegfSBhc/+yt
	EMxOctZDwlyZTXz1UmmUljwXPbwJc6GFKD2QGrIJa08zn2dW/n8fLzAg7YH9tQ/AMh33f1KJS2lz3
	hi0bLPLvIurm70a46YvIsYMTz2L+TyfYmZeSSPn/8a1D3QXbYyqrEAoWghcVvu32IFwrdXLNQw6iv
	6J60gfVAew4xEFvbTAJH34GNgMzY7YUOb5OXFV4CV2733i+ZDBM8F8FZdSuFEJbOcTqRklcbisXJG
	Q4diHNf/U/gmlAHKuu/gYh860Jan6VpPZW0FxRXyd3kPSC5aRJrWm4psQeav2QgLIKA3VOkqIXSBH
	mhYP0Sa4NkAR6eNrnXYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgFDB-0000000BmcM-0iOY;
	Thu, 15 Jan 2026 04:43:57 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgFD7-0000000Bmc2-3KZm
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 04:43:55 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-78fba1a1b1eso7567107b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 20:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1768452232; x=1769057032; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YKP2CZ3wzEHkWugF5eHJ0l3w6WM3TJ/wJevNxb3ZCQk=;
        b=nE1bMxaMPXjlf+aKWj1ZjjbBV8LQpayV+Uo7QvJoQjt3zdeDsCI3Z9HYyvZfJU6Z4N
         BRaBLSdTYNhPjQ0aR3AKUCv30RUXkbVV5WhgGDUTb/wVfH6tMbt3dMcQklCWUHj02IY9
         y900bA36tOGPb9sTxF7mBFZ5nufp41O/tpA94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768452232; x=1769057032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKP2CZ3wzEHkWugF5eHJ0l3w6WM3TJ/wJevNxb3ZCQk=;
        b=c0VMr4yfJG3o0Wou/PUxUuf74SrLz+ogW9FnHuOR7Ar96CkIpKVG4vRZpCf4SvUjV8
         18HlhXPOwvPF+ZGKRpuLbP+VUxhrxxf1mB3ubURowWmY3VzYKwNVuxK/EnX/aKeNvO2q
         UFlCc7tuuoUM6hdJZRnce7cAs/Kf8iMV0Svh0yzam4C20J9qG6sjSDHAf736/w3yXGV8
         xfX0oxpzyMOPLB3N4//NSyuOFsR+yFT4YtD/aQvMZDlCiebk3u6KO5/9eUyW6EHyQTsG
         wS1jmbjbCpsev9yBLNrWBSF/3O9Wjn78plimGVy8uLnCsYL9jy+MrO3bwwjK9s/HciLE
         1asA==
X-Forwarded-Encrypted: i=1; AJvYcCWge7TemTjT2a0NrYAkv1q7d2QSAyZerrBZQJqjQgTYN4SGZ+vBa+U3s9q0h2Xn4BnteL0C8tdbo840EA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3C3Y/YMZiOOe9WptFlIH2BjAuuGksQ46hCIFMh1WaX0XTmbL3
	835ARsPp3nAZ9VIRDjjKjSjDydMGAnDGBeKXCY45ZBoqGlhhCSOXdcaQIXVm4ZGxXHq8oiH/f9L
	gnT/nNceva31XANT6DrmHlYOzIMY1bY8=
X-Gm-Gg: AY/fxX5oa5R8FX015h4G4KvLVLGY8qbZs8wGVKQB1N8504Xr+pMFQxMY+LeKDBhWxdZ
	dP7mtWDK9gCoxxTowxV+tgJOz7+hv/w69iCcg+6eAxeeWNYPsvteOqZ0LCMmfdx/0Y2wM3tybBc
	cMRl1bYKz6+fhTH9X/2lXhKL1eqUNCT5zsMLEYvNPsvKS6pmG+kBA0fr9dWVOn+hgXe+aPbRfQD
	F0zn/iAXizuGIdlKGBxUYasHZC6wsnIvwCdcm7MhjV4mPwnaDYXKaNW2qhJnAv9Y1TJ9c+q4bm/
	YPTccfxYnfGrt3WRQinE22NK1XzINvNxg7NAYANAIwKWIX9OfEC5xwCT
X-Received: by 2002:a05:690e:128b:b0:644:60d9:7523 with SMTP id
 956f58d0204a3-6490a66cdfbmr1340966d50.48.1768452232029; Wed, 14 Jan 2026
 20:43:52 -0800 (PST)
MIME-Version: 1.0
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
In-Reply-To: <20260113082748.250916-1-jiangfeng@kylinos.cn>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Jan 2026 15:13:40 +1030
X-Gm-Features: AZwV_QhRSZoPQL1K1c2MUsNo1Uz-3GL8JoVUdSP7701Va_qmB_GYFJWYR5xt3qQ
Message-ID: <CACPK8Xc2inE8=mbPFt+iTtgOqF_1U9m+76014aDaQxVyTYy2UQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] riscv: optimize string functions and add kunit tests
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	kees@kernel.org, andy@kernel.org, akpm@linux-foundation.org, 
	ebiggers@kernel.org, martin.petersen@oracle.com, ardb@kernel.org, 
	ajones@ventanamicro.com, conor.dooley@microchip.com, 
	samuel.holland@sifive.com, linus.walleij@linaro.org, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, 
	"dfustini@oss.tenstorrent.com" <dfustini@oss.tenstorrent.com>, Michael Ellerman <mpe@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_204353_997992_E0C7F012 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

On Tue, 13 Jan 2026 at 18:58, Feng Jiang <jiangfeng@kylinos.cn> wrote:
>
> This series introduces optimized assembly implementations for strnlen,
> strchr, and strrchr on the RISC-V architecture. To support a rigorous
> verification process, the series also significantly expands the
> string_kunit test suite with both functional correctness tests and
> performance benchmarks.

I ran the kunit tests on Ascalon, a RVA23 CPU, in emulation. The arch
optimised version showed significant improvements over the plain
version.

I didn't have time to investigate if the numbers made sense. As Andy
noted, the 'long' benchmark had a much higher ratio improvement than
the short and medium.

Tested-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
