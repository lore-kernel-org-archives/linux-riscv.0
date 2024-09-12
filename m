Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1841EEE25C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 20:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQoVUSRSulTVAhe6QIbDoVgV//upx2dLX6HVvKEZB9U=; b=B3lLx59EP9mAKQ
	QynkxKEq1RLvcu5O4CUz5pC8d3zRbJ7cfrsr2RxBC3wvF7owXAXwVc8tOcC4bMKFAu1ebt/71g+LL
	SWQBrvSblwgA+tDpey1lEJtveb8BfpwAiHsfocjn2M6ewrdUwEbceFq7pVx7tHJd4XRkwv8l7khkR
	EvxPJcrceExZaGibfWZG2VMIu9sB29ohXV2vvwLTlCdgHYpvjbrfR7LK8QMSA3+3JJOt5XrBb6TPe
	1znK1cqKHxdtsylLto/U8coISZOMEFc2U5c4HHbWJq90+CeoS9ZOMhwyWd1XHhZiM960mCBiUZAE7
	OQKbnYcikcgbKhCQ2LHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soqit-0000000ECgW-0ETm;
	Thu, 12 Sep 2024 20:47:27 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soqiq-0000000ECfo-3DYC
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 20:47:26 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-70b2421471aso116720a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 13:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726174043; x=1726778843; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QkYEDgSUi+q4cC1mKbyRLPDEigMYGApwN1eBhMPthC4=;
        b=gMfeEcTgvntkvkzTf6idDc6hpW/7KOvu1OLuKI/345dCgrjJEBxBILFS3Muy5Wimq2
         G6hM23u7Xq9rQaiui2aUWV6RlRLBPHxDwXnPfhckO/jowMZ0BEnCldDMnVADkazk3tAS
         9M37PbG4WbWF30Gx5fi3bPM9QX9QBRJG+/m/tl044SYRE3skOiypC7wM/QMKoN5KBz8F
         rpOK86r1rsUge8BMOI9T4v+hWD4fO/8D0K5qJ0155HQoCmSYl/PXaPeFh/nlbwBNgZjf
         ZNg20DUOP3rCDHJ/Tifuma07RqwlMIIk9zpChMTCLFbYu1mqLNO2mxnLSaTeTqqiCkkq
         JuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726174043; x=1726778843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkYEDgSUi+q4cC1mKbyRLPDEigMYGApwN1eBhMPthC4=;
        b=BeuL/ZFPNJ6H37taG05YSWfhpP7N7uJC9iwcU55seBN0I7pgxADIJGaeNN8qr4bxPd
         fITzxiqhG+GbY0h/287jQWgMGyQuj3a19uyNrystWQpW2Vj6MR4fJsw72QLylLCW7k04
         p8R48ypvpdaRcJ1Dpqvjta8w5BKq5F/p8LMg3WI0JYnRfxLAClcaitNQRCWCwe7UEmUP
         WSdkNXE8c6cNjhtyM2fEdvTvbrEE1FIu9PPR2OzCBX5DQpAxgQMW/FpcBSJX0NuljhLu
         TwkpjG61hYFNNLJMaCMKE7QaTplU8I3uxtd1W8l5FwkL3EF8Gu6ZejBo9itsCI5z5/mc
         rxgg==
X-Forwarded-Encrypted: i=1; AJvYcCXFwuJLMduO5VRImIjInzNlV8MAskDYOh01fNCR2dy1Y8CQ11RtCvNJyufP3Y/31GS1ZvrTtgn6Ik/3eA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOQqgQoDQ8Sh0wPXBQJaf6hP4EoKvPK1SD+gqLEeXK6EHW8U1v
	lWITxzv3YwhtMGyBaCK4fbSGh8KiZQV0DjwvLPTqCy2EdPLy7tiAHmSWKOJ5zk0=
X-Google-Smtp-Source: AGHT+IHY1ulWf8xIoYCgymvFfMz7AvIjbgg3u2pIVYFSwdjBxA8LW0bzDtVMfKaopkm+QTibJTkj8w==
X-Received: by 2002:a05:6a21:e90:b0:1cf:6d67:fe5a with SMTP id adf61e73a8af0-1d112edc9b4mr484866637.50.1726174043300;
        Thu, 12 Sep 2024 13:47:23 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fddd1c4sm2128722a12.63.2024.09.12.13.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 13:47:22 -0700 (PDT)
Date: Thu, 12 Sep 2024 13:47:20 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH] selftest/mm: Do not use hint for riscv mmap
Message-ID: <ZuNTWCsPPLTm1zdX@ghost>
References: <20240912100018.736447-1-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240912100018.736447-1-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_134724_828834_9C02526C 
X-CRM114-Status: GOOD (  23.96  )
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

On Thu, Sep 12, 2024 at 06:00:18PM +0800, Chunyan Zhang wrote:
> When the virtual address range selftest is run on RISC-V platforms,
> it is observed that using the hint address when calling mmap cannot
> get the address in the range of that validate_addr() checks, also
> that will cause '/proc/self/maps' have gaps larger than MAP_CHUNK_SIZE.
> 
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>  tools/testing/selftests/mm/virtual_address_range.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/virtual_address_range.c b/tools/testing/selftests/mm/virtual_address_range.c
> index 4e4c1e311247..25f3eb304999 100644
> --- a/tools/testing/selftests/mm/virtual_address_range.c
> +++ b/tools/testing/selftests/mm/virtual_address_range.c
> @@ -64,6 +64,14 @@
>  #define NR_CHUNKS_HIGH  NR_CHUNKS_384TB
>  #endif
>  
> +#if defined(__riscv) && (__riscv_xlen == 64)
> +static char *hind_addr(void)

This is not a typo by you since this is the name of the original
function but this should be "hint_addr" right?

> +{
> +	return NULL;
> +}
> +
> +static void validate_addr(char *ptr, int high_addr) { }
> +#else

This is something that I am trying to solve over at
https://lore.kernel.org/lkml/20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com/
(the solution is still in flux). Since riscv doesn't currently have this
behavior of restricting the virtual address space, I think it is more
reasonable to disable this test entirely. After we have a longer-term
solution with the patch I have up we can adjust the test and re-enable
it. What do you think?

- Charlie

>  static char *hind_addr(void)
>  {
>  	int bits = HIGH_ADDR_SHIFT + rand() % (63 - HIGH_ADDR_SHIFT);
> @@ -81,6 +89,7 @@ static void validate_addr(char *ptr, int high_addr)
>  	if (addr > HIGH_ADDR_MARK)
>  		ksft_exit_fail_msg("Bad address %lx\n", addr);
>  }
> +#endif
>  
>  static int validate_lower_address_hint(void)
>  {
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
