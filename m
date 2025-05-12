Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50EDC3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 08:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQqBpCHnjWlp7SceeD/wctYUFftgGzJDwfWxoUkBUGs=; b=mj6ZhAQXfM7YIf
	ozSSpFFrY/4pnsCp6nQjQQWkm1x43A/brjWPfR8vwKmosofdW3uOTMIFhKAahCAAKsbh2L+DzNvs0
	+d7xqNMyQdbq2V+YyZQQsieI/ujfOB61o/Affa3Gu6nKNWWEQPXqWufdmI6LKm91UDbIUwZLRDeBR
	Obmo12afqG9p4IgzpMthu8JszF5bzU1VyOqiBjZoqZ0saJGUdvAjf1YehDMvE1IEKj5bQuwUGb5Zw
	KCyR2s9Jyz4PSZk5A7hkW3bstCOcwAL+96hYWtEFh2807WimLdcUUzCpa88PJZtRBVHmpz0K+fkM+
	ixCPh/fjDBLCuA6EQsQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEO5x-00000008gSy-1pJf;
	Mon, 12 May 2025 08:01:05 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEO5j-00000008gOG-2uDD
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 08:00:56 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5290be1aedcso4084672e0c.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 01:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747036842; x=1747641642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2Xr6rU3pyh1doXsCafY9wNh1BG2tohj2YQ2ikWY5u4=;
        b=OGNDXnPWC0Z6HSRmKoIMIdOiZisZlUF4tBoCcZ1oG1X180gm4T1cNt/qN3+awinQCe
         wL2xW9C94Nz0XVr4e+Q1sKQUJNAjDC+jFBLbogQltLWY2qIVTdH1Upvp24SSBT+JdaEU
         LA0kH9FiqE+tDLQaTBRSi6hrWrHpoNBJYhEwYL4Fm/xrTYf1I+TAD3C/bAplTNBBokXZ
         rmLmlpyWSaZCDtDz2nFz9yxTiyZa5uDtfpOkCIHsBLuXN9L+UQRaWRxqvtutsf9uuF2T
         PZRrOV/uIxRde3Es2jA7ouM6R57mhLa65t+c4Jyxl6wpLfw1EIHeX7gKruVuucEhHMGI
         7tUg==
X-Forwarded-Encrypted: i=1; AJvYcCULx0j5jWCAbutyHgFbjRz9lXsTD1DdlPnfQ8ee+0cRJnFvnJDxfMtCRK7/Trh2GabKmFVsJlzCcd5EXA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9ybyMSQsaYddz/a+Mt9OKIP+PTCuP89U0Vycxr6aUXrU7lCvl
	P50GNKwch+4LqFaZJL0bZuflx8VgBAA456JZOolZZ5z1b06d7UR5PmkGy1R7
X-Gm-Gg: ASbGnctBM8e9ZyK6g72ouk12GAOctwxlwf254mYhOhsrOyezf6Smv0rE8IdORoW+w7U
	/jiSQ8G9oSuX5eps+y6H/wHVopuVFk9893m7LbSewItuXA0Kl4EVrOUiPEBlSTE6C7Q9eBnbE+j
	qQcQfLMpIIJWAWRxSU2sQ/xn07Ue49dC60Z4qGGtKWwRR9tfYqnB1J4HWrQATezaD6Oi4hG/WT7
	81j3P/1C1cyGes5skulh1u80VB6mZOSgsLryEFMwpxpby53KwUEa3FwyDhx2Q7/oaJ59Ky+EeT+
	KV9nINkWTCCwN7cpeEKfsaUXZZITOqSta3vs2rh/jNIFgermpeqAuuawC/OChztXtFXm1wP6gQX
	L8Vtu0cdp4i62cvI989QU7kNctMbV
X-Google-Smtp-Source: AGHT+IFispIulNUwt8dBqLgu6AzFtHspThFLZr6AqaMuLlREo7U2oWeaJ6I4std7pQLEjo38bA+kbQ==
X-Received: by 2002:a05:6122:91b:b0:520:4806:a422 with SMTP id 71dfb90a1353d-52c54c9c149mr9245856e0c.3.1747036842452;
        Mon, 12 May 2025 01:00:42 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c5375fde5sm5326004e0c.27.2025.05.12.01.00.42
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 01:00:42 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-52c5cb15931so1826742e0c.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 01:00:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEfxyXt3Giguht59ixU6spot/6Mg+SoqnKMZnDqVrvp+DyddSziE8O6aPZQs4F6v2j0/1zHDlgAUMYWQ==@lists.infradead.org
X-Received: by 2002:a05:6122:2a8f:b0:52c:4751:cb79 with SMTP id
 71dfb90a1353d-52c4751cd0fmr10603959e0c.2.1747036841991; Mon, 12 May 2025
 01:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-sapling-exhale-72815a023ac1@spud>
In-Reply-To: <20250509-sapling-exhale-72815a023ac1@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 10:00:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfPdV0_MYCNeWHC7GOcb5b7GybnhzaiYzBV1Es3KuVaA@mail.gmail.com>
X-Gm-Features: AX0GCFu30jU-MXjUmemDPu1vyUre39ZfWfjYVH1FtkL6G9ermaqV-FJxTuk0Re4
Message-ID: <CAMuHMdWfPdV0_MYCNeWHC7GOcb5b7GybnhzaiYzBV1Es3KuVaA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add specific RZ/Five cache compatible
To: Conor Dooley <conor@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_010051_739689_AFBDC077 
X-CRM114-Status: GOOD (  19.92  )
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

Hi Conor,

On Fri, 9 May 2025 at 17:38, Conor Dooley <conor@kernel.org> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> I opted not to add fixes tags, but I can create them if you (Prabhakar
> or Geert etc) think that I should.

It depends ;-)

Do you see a need for matching on the new compatible value in the
near future?
Is it OK to postpone the DTS patch to v6.17, or do you want to
fast-track it as a fix? I just sent my last normal PR for v6.16 on
Friday, before this series came in.

Thanks!

> Conor Dooley (2):
>   dt-bindings: cache: add specific RZ/Five compatible to ax45mp
>   riscv: dts: renesas: add specific RZ/Five cache compatible

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
