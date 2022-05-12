Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5551C43219
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 04:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47JmuCelZ7LuykjEkzO2+a8goQ5pz3SlPUQZ2S1N8fU=; b=CGwRPauRdct8e8
	yJczkkSiv/M7nArpyH4KBv/pGf+UA7gwCF4skBoG03TUgjNMA9X3Id9wbpsdmQgqo4d4lxlnqJGzX
	YcU9lp7pFFrfUvn71OPFkMk8J1S2SfK9gVEXIMHmfXI6USgR04RicL1KRN8Unq7WW0IbYjbFAy9BU
	z9kjy+qyXJ36b6d/p6M9TGVD9Eg9m2+8O0PbGkOH2rR7k11FsAXyovdW6k4vTGINAerfAjQX/KOG5
	HV7k1gsBcgi6Zz1gPObt83OgUSnz4cCwab5BtSywlXO5HxNVTnXtvVa4m0T8LQ9uAq4GFvm85an1O
	WjhJkQrkLsCHs00Zppyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np0gf-009zuV-Lh; Thu, 12 May 2022 04:44:29 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np0gd-009ztY-Jf
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 04:44:28 +0000
Received: by mail-wr1-x429.google.com with SMTP id q23so5542240wra.1
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 21:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oxm9sBcT1JV50HT4BCEDwPzwOlOzL6NEeugrpnzL0Jg=;
 b=panjBDErMFFeS1mpF1owMJAimp+H0bnPlz5Y2undu+JiEi0GPmaur6O4CzEKXus9v5
 Lw6Cqq1AX+NKjHUHxrSj6ibfkgpRNr9Ri/V4EWqF+kENnpoZCGkkphIgOPxwCL9ZHCTu
 fheb6cBnTch8v8xfGsOOxZrQKDn9XG5Kpi9J4rjbxJzuc0VnKVT/+zYJRJxOBYagb2mw
 /D9Lu9GITyoKqhvIzRsyqqLoDfJcIO9IUjmrsGNaT/3nMkXDsiRyPFYcSDkmxxTD5Osq
 mb3VFuEq6babUntnsclMHKP+QgSW/oHuit20EQTABbJI0zudfPflBr1yTSearkElGonP
 NFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oxm9sBcT1JV50HT4BCEDwPzwOlOzL6NEeugrpnzL0Jg=;
 b=hIDiRF2Y9Bp1YUVb2eWvHHb+lGkFxV53WW2riP3azz+4TQ5UTENWPsjMZyxVP87fwE
 qLIkcSNxEhH/BNlctKAoRTMUfk+0ZgvIQeO4V6DpMGkY/borjim1pIVtRUzvGSN5XvFW
 B2lZJP0KX10KvidV8v2LdXFxJcBhLUVn/7d+hPOBnG/1njPBkC0jXm3+CL2XyE8jr43D
 04kf4s9IiLw+9IZv0311R4PlWw1lAftTRIAvzJFLmw/FiHLTqfbIckJN/VExOg/ooCA/
 D0wGXcEsPZmj+1Bp/luklq4gthNy2K6yFR0XegRzMRWd9uUaObm45y9EvHxroMoFscp8
 bdFg==
X-Gm-Message-State: AOAM533ATyCy6iY0U7RCzZ2xdUAukSdQsVE6HVB+hq4MEMUCpnz0ESON
 WWq4N4xA5nM083gCFN2tgJkKUlyun5bnIJ9YyFN7t73NcmZ2RHwq
X-Google-Smtp-Source: ABdhPJzloFL8RAJGSh+cL9RNr8ybTq+w+uIZ+h1jRU55tsWHFmEuU068Wy0E4qfo4o4VW9DKpgQ7ocMtsolbEb1xNFE=
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr25588160wrz.690.1652330664582; Wed, 11
 May 2022 21:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220511201107.2311757-1-atishp@rivosinc.com>
In-Reply-To: <20220511201107.2311757-1-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 May 2022 10:14:12 +0530
Message-ID: <CAAhSdy3mbGdK9LrLxZX0JL0mQxP5FrFUuneX1cQS2SABpO=7dw@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Fix counter restart during overflow for RV32
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 DTML <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_214427_687462_15886791 
X-CRM114-Status: GOOD (  15.04  )
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

On Thu, May 12, 2022 at 1:41 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> Pass the upper half of the initial value of the counter correctly
> for RV32.
>
> Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index a1317a483512..24cea59612be 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -526,7 +526,7 @@ static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
>                         max_period = riscv_pmu_ctr_get_width_mask(event);
>                         init_val = local64_read(&hwc->prev_count) & max_period;
>                         sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
> -                                 flag, init_val, 0, 0);
> +                                 flag, init_val, init_val >> 32, 0);

This should be under "#if __riscv_xlen == 32".

>                 }
>                 ctr_ovf_mask = ctr_ovf_mask >> 1;
>                 idx++;
> --
> 2.25.1
>

Apart from above, this looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
