Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D4BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 12:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HtV1bayKiCTST6T8vsPs11WDoCxrO8JsLcxhl6NPkwY=; b=Ow0mRIw2xV8UY3
	d5ek91Rgt08ZcnFFWE6vCw61guPWwyX6JQfdf63u2fbl5OEuq28DUW6M6DbgOttR/Np2GB33bv+3L
	pkx06dll1nDXGTjzGd9f+wluyG6XSPdltbHylyx0lDjqzffHp+/ek5reC/6YKpolCSal+34YfWNIH
	fmf8UVAZvIlFpotslnXfiRZ+trLEoy8EnCajokg8XDSp4v4c1SV0Yg9xmVU8z4SY1VqX3U0KhXuEE
	BorjJ5iW7bBUFyr8DVXdnjz1RWVyWvlftricYTFtvcbxWGS6caKC+0nKVkawycfb4AVsjLLSkewHG
	TGWIjfgUy3uqQIx+euZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np89h-00Brfl-4O; Thu, 12 May 2022 12:42:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np89e-00Brew-AW
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 12:42:55 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1np89T-00025a-Rp; Thu, 12 May 2022 14:42:43 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, DTML <devicetree@vger.kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 1/2] RISC-V: Fix counter restart during overflow for RV32
Date: Thu, 12 May 2022 14:42:42 +0200
Message-ID: <23274575.ouqheUzb2q@diego>
In-Reply-To: <CAAhSdy3mbGdK9LrLxZX0JL0mQxP5FrFUuneX1cQS2SABpO=7dw@mail.gmail.com>
References: <20220511201107.2311757-1-atishp@rivosinc.com>
 <CAAhSdy3mbGdK9LrLxZX0JL0mQxP5FrFUuneX1cQS2SABpO=7dw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_054254_407830_FB2C82D6 
X-CRM114-Status: GOOD (  19.21  )
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

Am Donnerstag, 12. Mai 2022, 06:44:12 CEST schrieb Anup Patel:
> On Thu, May 12, 2022 at 1:41 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > Pass the upper half of the initial value of the counter correctly
> > for RV32.
> >
> > Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  drivers/perf/riscv_pmu_sbi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index a1317a483512..24cea59612be 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -526,7 +526,7 @@ static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
> >                         max_period = riscv_pmu_ctr_get_width_mask(event);
> >                         init_val = local64_read(&hwc->prev_count) & max_period;
> >                         sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
> > -                                 flag, init_val, 0, 0);
> > +                                 flag, init_val, init_val >> 32, 0);
> 
> This should be under "#if __riscv_xlen == 32".

What's the difference between using CONFIG_32BIT
and checking the __riscv_xlen flag value?

CONFIG_32BIT seems to be a bit the more kernel'ish
way to do this, but it looks like most SBI parts check the
__riscv_xlen instead.


In any case, looking at the opensbi-side of the call,
this fix is abviously correct, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
