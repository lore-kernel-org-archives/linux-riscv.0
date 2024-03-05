Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FE9C54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 23:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXcfhgfbqOFVWh733Xh9mGxnvCAcPEixGk6w0jLbZv8=; b=G2UQ7M7SDMKeQV
	ZwLDuFpQtuFkCpiSzKmr2odpUlwWbBv6d6mWIAOB7mGYXXsSKodax2aEqszb5Qgh11EaI1sVSf7s3
	rIRxwqCS5rlVDI0jxiCQICBS3B5hmACmoMiV5kIZifJRiGMzaSyrZ5qQvTm3UojwdTWZRnHzP03OG
	FDTbmddvCLPcLRjcmSuy6e0DU4li+VPMo10sb3hND95xJHxvjdg8kwiWmJoaouOgWtN2NxDKfni/X
	NISflCpYwXPnHIPE98ZSophbqBxmZY2to5j/H2NUYWo6zxGAMOD2kC5w4rLlwGT4OQSe2qYoPAbnA
	TGE2dEyMS5YSEEKUuzsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhe7G-0000000Facz-0J3V;
	Tue, 05 Mar 2024 23:22:34 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhe7C-0000000FabY-1JF2
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 23:22:32 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso5457420a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 15:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709680948; x=1710285748; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R4U2Xkw/IBgvoNoGeIYqYiemkRY93cmWxyD/xaF/gu4=;
        b=MiU43txikGbu/LXOuNBndL86A3h3ZcBHwB0Uhp2v/O/rpxW8H7K7g9bf4OID4yNGJ2
         L+K5ZNwEegoqQVvJ2/dHwnHcJWwtMtrrW7mkeU0+ZWDgoxRD6qcGKLCxI5exwEyR5N4w
         0F3VoqDseak16+OkUZ0Pxz2nLWMBBUp7QCLyLX075I0ODR7MKToogGmYUU/y2f4PONn7
         y+TAn6VmZFNhozxTLzca6XeWcKg+LGZWpaj3+hniEO4loW84RmPBh1ioUq0kSTGq0ivv
         gSQRDyAr5HTK8gOmAe44OabnF7r06Na0k1wuRAXbtNtaGboYQZ+hp9tRMKKpdQKot3FK
         z+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709680948; x=1710285748;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4U2Xkw/IBgvoNoGeIYqYiemkRY93cmWxyD/xaF/gu4=;
        b=BAnx5drFoK/HurgkyLWclBtNiU1SdUf4K68jgpQ0QVzF9L95SluFjxYmLjMvuvIMPd
         Y095Va6YV5soOZYL16Ja3Q1+e8S0wbwgewfG+XCOEElDEQx0T7DIiY4czZRXsSKzfKYO
         tC6tnv8f/rjJZ48rqYKRP9DHRgJiTnMi0zDCyky18nwcttft5JlWCNVT1qStkjMgwQHu
         e+u2t8IRTPifsgTdZJEcavmx9M70/9z5neInCfwnlKEGI0tm6CaHsWhSgYrw5bmU9cgo
         ryOzGw32YcwO8qpJN0xPKbhE7/rtD3ZUJFtWRDZKB9D6qhmP6dm8yy66oFG3qjVDkmWP
         0v+g==
X-Gm-Message-State: AOJu0YzjV9RF2BpO57enGdc3fPrFtOauLtP+e1dhAJdfcYs0+PJf5/Ge
	4UdkZ+34OhQm+zU8vtyGlxFYXJ+u6V5ndvkmwQw/CNvvtMAAtDDuKx0qcn6sn1I=
X-Google-Smtp-Source: AGHT+IHMRmxHiMb/Kmx0F2hLj8iRRMjaNRQUVODlVPukYARpd+a2KaUJJPnOKWnaEIr+cFIgSRnr7w==
X-Received: by 2002:a05:6a20:9381:b0:1a1:4d85:5d73 with SMTP id x1-20020a056a20938100b001a14d855d73mr3830127pzh.25.1709680948217;
        Tue, 05 Mar 2024 15:22:28 -0800 (PST)
Received: from ghost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id p12-20020aa7860c000000b006e50e79f155sm9469415pfn.60.2024.03.05.15.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 15:22:27 -0800 (PST)
Date: Tue, 5 Mar 2024 15:22:21 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v11 0/4] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Message-ID: <ZeepLbzqeQbGRWNm@ghost>
References: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_152230_585732_41D2B317 
X-CRM114-Status: GOOD (  16.60  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 12, 2024 at 03:36:25PM -0800, Charlie Jenkins wrote:
> Improve the performance of icache flushing by creating a new prctl flag
> PR_RISCV_SET_ICACHE_FLUSH_CTX. The interface is left generic to allow
> for future expansions such as with the proposed J extension [1].
> =

> Documentation is also provided to explain the use case.
> =

> Patch sent to add PR_RISCV_SET_ICACHE_FLUSH_CTX to man-pages [2].
> =

> [1] https://github.com/riscv/riscv-j-extension
> [2] https://lore.kernel.org/linux-man/20240124-fencei_prctl-v1-1-0bddafce=
f331@rivosinc.com
> =

> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> Changes in v11:
> - Add back PR_RISCV_CTX_SW_FENCEI_OFF (Samuel)
> - Fix under nosmp (Samuel)
> - Change set_prev_cpu (Samuel)
> - Fixup example testcase in docs
> - Change wording of documentation slightly (Alejandor Colomar)
> - Link to v10: https://lore.kernel.org/r/20240124-fencei-v10-0-a25971f430=
1d@rivosinc.com
> =

> Changes in v10:
> - Fix fence.i condition to properly only flush on migration (Alex)
> - Fix documentation wording (Alex)
> - Link to v9: https://lore.kernel.org/r/20240123-fencei-v9-0-71411bfe8d71=
@rivosinc.com
> =

> Changes in v9:
> - Remove prev_cpu from mm (Alex)
> - Link to v8: https://lore.kernel.org/r/20240116-fencei-v8-0-43a42134f021=
@rivosinc.com
> =

> Changes in v8:
> - Only flush icache if migrated to different cpu (Alex)
> - Move flushing to switch_to to catch per-thread flushing properly
> - Link to v7: https://lore.kernel.org/r/20240112-fencei-v7-0-78f0614e1db0=
@rivosinc.com
> =

> Changes in v7:
> - Change "per_thread" parameter to "scope" and provide constants for the
>   parameter.
> - Link to v6: https://lore.kernel.org/r/20240109-fencei-v6-0-04116e51445c=
@rivosinc.com
> =

> Changes in v6:
> - Fixup documentation formatting
> - Link to v5: https://lore.kernel.org/r/20240108-fencei-v5-0-aa1e51d7222f=
@rivosinc.com
> =

> Changes in v5:
> - Minor documentation changes (Randy)
> - Link to v4: https://lore.kernel.org/r/20240107-fencei-v4-0-d4cf2fb905d3=
@rivosinc.com
> =

> Changes in v4:
> - Add OFF flag to disallow fence.i in userspace (Atish)
> - Fix documentation issues (Atish)
> - Link to v3: https://lore.kernel.org/r/20231213-fencei-v3-0-b75158238eb7=
@rivosinc.com
> =

> Changes in v3:
> - Check if value force_icache_flush set on thread, rather than in mm
>   twice (Cl=E9ment)
> - Link to v2: https://lore.kernel.org/r/20231130-fencei-v2-0-2cb623ab1b1f=
@rivosinc.com
> =

> Changes in v2:
> - Fix kernel-doc comment (Conor)
> - Link to v1: https://lore.kernel.org/r/20231122-fencei-v1-0-bec0811cb212=
@rivosinc.com
> =

> ---
> Charlie Jenkins (4):
>       riscv: Remove unnecessary irqflags processor.h include
>       riscv: Include riscv_set_icache_flush_ctx prctl
>       documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
>       cpumask: Add assign cpu
> =

>  Documentation/arch/riscv/cmodx.rst |  98 +++++++++++++++++++++++++++++++=
+++
>  Documentation/arch/riscv/index.rst |   1 +
>  arch/riscv/include/asm/irqflags.h  |   1 -
>  arch/riscv/include/asm/mmu.h       |   2 +
>  arch/riscv/include/asm/processor.h |  12 +++++
>  arch/riscv/include/asm/switch_to.h |  23 ++++++++
>  arch/riscv/mm/cacheflush.c         | 105 +++++++++++++++++++++++++++++++=
++++++
>  arch/riscv/mm/context.c            |  18 +++++--
>  include/linux/cpumask.h            |  16 ++++++
>  include/uapi/linux/prctl.h         |   6 +++
>  kernel/sys.c                       |   6 +++
>  11 files changed, 282 insertions(+), 6 deletions(-)
> ---
> base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
> change-id: 20231117-fencei-f9f60d784fa0
> -- =

> - Charlie
> =


Copy Samuel Holland on this patch.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
