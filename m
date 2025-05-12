Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48B6C3ABD4
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 14:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0scGF+ZAmHtmzwUSfuwDAeJgunSE3hsoX4NTqb8KzQ=; b=lyXP2DkFPD9Ckd
	9FXksFxutrWYF8g2pfIG1Or/nT8+j4ITzxOCUyzL5+Q788QdNhVrGFDoa4bRdTRwaeFOxPFgqMxt3
	omkgiyfZ2wT9ahy9jfHAV/eEDUOmLvSGcQ53XnJzb/FrKcdGAPm0GE2O3TpMbzHcBvcCD/lHyE19W
	NJT6J9gZUbNtX6gDJMtzo/PWxHxvumarYrxhoRVXlWT5PnTMgYlo8qaDgrXt3ijZ6cHdeiB5DDRd3
	TNFBcTxcvme0/v2KiHKLj5tSx8IVABhWyXD+YfYifyWWxZSbHrGAdrUVd5igaEaU3YnLs1VTonlT8
	p08k58J3nrbyPe8qJQ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU4x-00000009i8n-2nQU;
	Mon, 12 May 2025 14:24:27 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETee-00000009dsu-0qQB
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 13:57:17 +0000
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-864687c830aso384040439f.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 06:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747058234; x=1747663034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgMxKbZ7K9g85ek1e//i/rL6U+/AzknhLB8CNs42xFw=;
        b=UftZIb9cruiDQ/6OJXldAI2L/kftH3f8/0n2xwFd6Z+/NNgCSpkUzvQuxC6W+Ds43n
         Ytdx61WYqUI4djp457/U7KWeYaRFRXT4rv/BYIGkdIQ7WW5w/ktKquwpEW6V5lcj90KU
         7U4UxYxUUJtYXH1afgzOJrn6q7xXaLP9Fnr9pibk9soUyKtAO0OBl2U99eIsJFHTeq5r
         dCDp03kqetJmMFvNIltsh3PbAiQY0L7CKI/5cOU+K7Y7A/DrXR/x9qV3zrD3MklyyVZu
         J+ElLT18zr7qSh+CFdPvDOoJ8V2SkbdWCxs6lDKviCt08XQuxFIk+0BTUxd/rhJiRloO
         p6GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV8QWG3bpns61rR+OtEvQY3CoT0RTRCmZHEI88Sxw7jEBeZvi8OLMJsOeYZ5coC3sfW5tFmkfTjplYfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYMqI5748P9uH4NG9HZtNWTxzF7mSRaW0QjUWZf06ssavF7wLR
	o8RfvkgdT25aznSByrvY2D4Abcv92xLuyLwGdKYa48ChQvBWn8rxhR3mLzZL
X-Gm-Gg: ASbGncvr8VUgLBGIR7v/g56g0YK6/c6ge6jJd3Uf+recUxcu5an1cXAjGx5VnNJWn7J
	mASkuD9FTD593ZlJKQQpTvBFNS1LHb9Fo9xzuz1yWopOVolpIKp8plaVAirqlHhN4ShQAalQnxM
	m4iYCmC5Vrt1VtNOwGyU0Bi1LkKKunHT/72+OK5qeivqECfQQwSMvP+VfdlUHLfKVKzhqDiMCyD
	14kFQLtEDLpLPiYbxfZSJgEQ2A8xPFKAp8wZZPzmOR8ZZEWbqFf9akzydAmpovJzszyv1Uwc+SJ
	m+svWowFPn8ssJf1ru+uVRyJ+AlMuXPq+NyH8YBMc6VxdOD6lCKIV9lNFOaV/cs8TCjJpk6vPfn
	80i7o7Vxpuehyyg==
X-Google-Smtp-Source: AGHT+IFzm75NzviZqosalfCZ1jE+1AGa0FMKbCunCKLtgQ+fBqICtVWz+hZa7paEiiY+1Qe8DY5lyw==
X-Received: by 2002:a05:6602:3a07:b0:869:d4df:c2a6 with SMTP id ca18e2360f4ac-869d4dfc3fcmr941624539f.14.1747058233985;
        Mon, 12 May 2025 06:57:13 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-867636e0f85sm180483339f.34.2025.05.12.06.57.13
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 06:57:13 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-864687c830aso384036239f.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 06:57:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXvCMRq8sLeQJdJiZnwr0aU+LBDffSwc+FOiGGAcWlQ7nsceUR7E5ODAAX2OA69FDbQI/dl4ZVkckB0yw==@lists.infradead.org
X-Received: by 2002:a05:6102:3c9f:b0:4db:e01:f2db with SMTP id
 ada2fe7eead31-4deed223b1amr11915712137.0.1747058222503; Mon, 12 May 2025
 06:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250512-daily-saga-36a3a017dd42@spud> <20250512-sevenfold-yeah-d40078a9249e@spud>
In-Reply-To: <20250512-sevenfold-yeah-d40078a9249e@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 15:56:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVH+wfdNpNBMdaG3D=z7WcTMmgW2sK_fAgiuJcvLaOig@mail.gmail.com>
X-Gm-Features: AX0GCFum_LUMr8r2c59zTXaq3hHr3KqFC29268O1TVZJ_KjAKwGQIm8MscJpbNI
Message-ID: <CAMuHMdUVH+wfdNpNBMdaG3D=z7WcTMmgW2sK_fAgiuJcvLaOig@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
To: Conor Dooley <conor@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_065716_244051_5E4C6F6D 
X-CRM114-Status: GOOD (  19.67  )
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

On Mon, 12 May 2025 at 15:48, Conor Dooley <conor@kernel.org> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> When the binding was originally written, it was assumed that all
> ax45mp-caches had the same properties etc. This has turned out to be
> incorrect, as the QiLai SoC has a different number of cache-sets.
>
> Add a specific compatible for the RZ/Five for property enforcement and
> in case there turns out to be additional differences between these
> implementations of the cache controller.
>
> Acked-by: Ben Zong-You Xie <ben717@andestech.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
