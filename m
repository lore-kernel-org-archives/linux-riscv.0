Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF1FC4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Nov 2023 22:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=sH1j8Zx1tqqNbs/U4G65cJJqHSXNWlkN1XP4IaZSkm4=; b=NwSloSHkIAM1ECX2rLRJIRaaDI
	72yHCGOSSxF4W4qAB2WIwCik/qATkQghGKb2/0hml5uuB1gk/vF+kpuXpRf6fbmi155m0fez5jXSh
	dNpf2HqYyc6tZCSS3FG+HKVk2ARmWMNPYYoNfHAkp39rTNjQf/YV70yro3m4wqcMqmgukqHeXRYhu
	7/cIzBUiQCSod76HC6cXVSXBmynbKK9ramI9mbxibDkoV8itJU92jltrn3FwoMKOxatRFIDiT1+dJ
	3oBPvW7AwcZjTmKSvrLGIMf8Z1MsVkMp9DUGZA0EA0Qy+7XZXyCaCAW5MsSXkeBsBEoZKVr21v/j6
	W+Kx2i8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzlSJ-00Fa9T-0x;
	Sun, 05 Nov 2023 22:18:55 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzlSF-00Fa8y-1T
	for linux-riscv@lists.infradead.org;
	Sun, 05 Nov 2023 22:18:54 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5aaebfac4b0so2487348a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 05 Nov 2023 14:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1699222729; x=1699827529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbIKR0SHK/6vze23TumOHoZN2zuFH7uTxuat+3SKTaw=;
        b=vjl22nRfnMz3vs8jWYHaupR071hiysYHG9UpES66lKoG18oeX74VB8zjTwcR4sjHO/
         ASPyGNAHT/u2W3Khx0Z/ycyebqw6MJj9SmVWqItib57mdpolh9/tNWNVCEcCl7qDHdsf
         lEL7ylmF0rrxgiEPvIqYdovNlHZzrHrzLch0mKLZ95Q+gjfEjEPndCBLk7xy9q79rXt/
         JjkqrrilK5pIhNZWfwm2sgylVUv4OkJpuHKGn7wclg2NZjkL5lY/ngPf+rmX3LxkeauE
         NPhGLfgQWd0+f3ZFb+wpL2pffUPu3WpMvj7Eiu11CbIJrYcUykb23fnO8X8mHjCP6PwH
         8eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699222729; x=1699827529;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbIKR0SHK/6vze23TumOHoZN2zuFH7uTxuat+3SKTaw=;
        b=ukd7shJKF4+7zdu+1cHuoDUF94CUX3hKAEEPh22hheEJ1Wo7U2/e0fJ5RvKDeOQjKD
         W2cBD+vq295HjajfPBggdWvJapzYSPL+JEKXeV6kWmLQpa15O86NsrttSuAWt/OTV97S
         XOUkFFQhKsRnVpKiuHLF1bxOUpKB4W5UIOKqntyPXGifVC6Tr2U9aWP26qQJRbJ4YN6I
         ETH3eh1YUp0y0Xj+t/Ph7dWRI0Li0CGfCKBGMVyqxAeDb+5IYSq0PpNqImYNkS0yEOC6
         KCcm587aXV+BWQZBba+T9wCeeawRAw17E1zb2BMBz8iUp50SSL64ug3PV5Rpd5oGxC6g
         V2tw==
X-Gm-Message-State: AOJu0YwZBlNvC/cLlE2PBdW3IiJsark+YziC8APy7giZyjs1Wg+ZSzK+
	EzGo1BnEihVw90GHZA2jVvRybA==
X-Google-Smtp-Source: AGHT+IFNtEFNcFhbMv695ZTN84gvrl6e0WmhjMH71U8XWQV7/WJDEf+qpL0mtAFB6T+LMD1d0CzqcA==
X-Received: by 2002:a17:902:ec82:b0:1cc:6acc:8fa4 with SMTP id x2-20020a170902ec8200b001cc6acc8fa4mr15274773plg.32.1699222729504;
        Sun, 05 Nov 2023 14:18:49 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c20c00b001cc29ffcd96sm4597015pll.192.2023.11.05.14.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 14:18:48 -0800 (PST)
Date: Sun, 05 Nov 2023 14:18:48 -0800 (PST)
X-Google-Original-Date: Sun, 05 Nov 2023 14:18:19 PST (-0800)
Subject: Re: [PATCH v2] riscv: mm: update T-Head memory type definitions
In-Reply-To: <ZR1Vh6kXay3uNvs0@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, guoren@kernel.org, dfustini@baylibre.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-86aba837-61bd-4ab5-a52c-85ec9b77bc82@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_141851_698029_F3CBDD46 
X-CRM114-Status: GOOD (  18.25  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 04 Oct 2023 05:07:35 PDT (-0700), jszhang@kernel.org wrote:
> On Tue, Sep 12, 2023 at 03:25:10PM +0800, Jisheng Zhang wrote:
>> Update T-Head memory type definitions according to C910 doc [1]
>> For NC and IO, SH property isn't configurable, hardcoded as SH,
>> so set SH for NOCACHE and IO.
>>
>> And also set bit[61](Bufferable) for NOCACHE according to the
>> table 6.1 in the doc [1].
>>
>> Link: https://github.com/T-head-Semi/openc910 [1]
>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> Reviewed-by: Guo Ren <guoren@kernel.org>
>> Tested-by: Drew Fustini <dfustini@baylibre.com>
>
> Hi Palmer,
>
> I believe this is a fix, could you please review and take it for 6.6
> fix?

Sorry for being slow, I'm still pretty behind from getting COVID and such.
This LGTM, it's queued up for testing and it'll show up on for-next assuming
everything passes.

>
> Thanks
>
>> ---
>>
>> Since v1:
>>  - collect Reviewed-by and Tested-by tag
>>  - rebase on linux 6.6-rc1
>>
>>  arch/riscv/include/asm/pgtable-64.h | 14 +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
>> index 7a5097202e15..9a2c780a11e9 100644
>> --- a/arch/riscv/include/asm/pgtable-64.h
>> +++ b/arch/riscv/include/asm/pgtable-64.h
>> @@ -126,14 +126,18 @@ enum napot_cont_order {
>>
>>  /*
>>   * [63:59] T-Head Memory Type definitions:
>> - *
>> - * 00000 - NC   Weakly-ordered, Non-cacheable, Non-bufferable, Non-shareable, Non-trustable
>> + * bit[63] SO - Strong Order
>> + * bit[62] C - Cacheable
>> + * bit[61] B - Bufferable
>> + * bit[60] SH - Shareable
>> + * bit[59] Sec - Trustable
>> + * 00110 - NC   Weakly-ordered, Non-cacheable, Bufferable, Shareable, Non-trustable
>>   * 01110 - PMA  Weakly-ordered, Cacheable, Bufferable, Shareable, Non-trustable
>> - * 10000 - IO   Strongly-ordered, Non-cacheable, Non-bufferable, Non-shareable, Non-trustable
>> + * 10010 - IO   Strongly-ordered, Non-cacheable, Non-bufferable, Shareable, Non-trustable
>>   */
>>  #define _PAGE_PMA_THEAD		((1UL << 62) | (1UL << 61) | (1UL << 60))
>> -#define _PAGE_NOCACHE_THEAD	0UL
>> -#define _PAGE_IO_THEAD		(1UL << 63)
>> +#define _PAGE_NOCACHE_THEAD	((1UL < 61) | (1UL << 60))
>> +#define _PAGE_IO_THEAD		((1UL << 63) | (1UL << 60))
>>  #define _PAGE_MTMASK_THEAD	(_PAGE_PMA_THEAD | _PAGE_IO_THEAD | (1UL << 59))
>>
>>  static inline u64 riscv_page_mtmask(void)
>> --
>> 2.40.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
