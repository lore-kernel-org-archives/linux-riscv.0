Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49BCCA0EFD
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 17:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGpoyql5rhZZnXvRYf9sQKa+Qbrgy8TuU8Aue/L9sS0=; b=HV6bmY8xIKLTfz
	D1otBD+jPeEiz+xEwc5bt/sXZlSj4LD8810aLVvnorp5vjhSB6azS/S5bnylqrOIwewdxSk89TmIC
	JXE67Y8t70e9+kYTBujTmcJtTpCGNmFyfvw/F7KOPPrjLcQ5XrSosD/jZmEPMDmOYeFFxDDNXVZwe
	e3YW8Br3iXQZyyhUEwWXRCdcV+TXFjiy2jIrro3Sl447cQbvTfFDsirOxdO2eEtJav8CM3CGX3KBa
	/X1a20BUXt1R43CZt+GC2cgIMyn4kk+aar4baxpvuMTDEbqPnAqls8tFHGPB9rDcuVqX35zlTwEjm
	tAW7972xPtNGhL3czM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk5MS-00000007BPg-2yhJ;
	Fri, 30 Aug 2024 17:24:36 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk5M9-00000007BKz-0QbW
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 17:24:18 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7140ff4b1e9so1811434b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Aug 2024 10:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725038656; x=1725643456; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GD8wvv1xBSB3medjZL8T808Lpi6CMfSISHL7KoawLA4=;
        b=l/Hinq0HImIGd+PkCUs05zokpP/RkVyi3V6tuKE1CZu5alwpowX+0Qzh9dhHtaP8CG
         cHhusqngPcu9O1KCJ8qOOSlQXZvQrJo3Fe9uTjK1d+xl2Q7bKrKIMagl2ecOng8495GG
         jhYkexp87WMvxrdApUocV3WLt8bKKhlms33595a5p3CEdLukFPM0AkVfOHtnruhWHBts
         6WnHgNy9+YgLhBNsfN6ZwfwoCZ1DaFsiNuN+RYubmlx2ANyVFza2kn+MAaBl8Jzl8G//
         0UX1rDWzSeYIO5THSs5pA3pxbqoQjrb/DzjMg0JzZ5pSxkQ31zCK/VR/JpK0Sxw4C/P6
         Exkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725038656; x=1725643456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GD8wvv1xBSB3medjZL8T808Lpi6CMfSISHL7KoawLA4=;
        b=nNO0Ly/l+wIvYyKJpDB77K05ldvN+0x0Kd9Tr4N23cJF+hF9ikBy6h4LiWJdSZPJdz
         XVisKdVDXCeLmaXRRV9nuvk+972ztFWthy5VqDYL5rH82BQLKux4OhwALsaQ2sUARfA1
         0liiYmrcHvpRqL1ssWJexBQQdxKrh4GvXvd0FXFl5FIPN311j0BIurWSr7nOXErDQLwB
         ydvuozLv7VV/7d2DLhxMexbcoE00a6THXGBN/0Ps3kG7RBIOPBit0ZXhCDZb7xMuYLbN
         cEF7odHP2ITk3qTVx5lTc9MhjPL4I7x2nfM3nFPsPntrDN4XxMWG2oTJl1BOHwd7WlLu
         Tc9w==
X-Forwarded-Encrypted: i=1; AJvYcCUjn3b8nFlxGfOhA1Cl949p+k1TxGmhciGPBDH30jt6GdkyuXLne+A2ToGkiyg/VH6+99IWlSmtaOeWtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQj49gORZ9H/HLwUXvzYaCIVxFQMb0CzJoAW36Z630bfjDARCp
	wRF50FVrbfVVGxHjOTYSntf65X2gmuk1AIOs9xaLMbXf3fDmYQmB4DDRA0CXbGg=
X-Google-Smtp-Source: AGHT+IE4CqraNXUZ5B8F48fa05h+Siz1PY0ZBnO0S45G7J+IRtvSJMmGI4jTVQnHc2+5tA6nUzWvMw==
X-Received: by 2002:a17:902:f648:b0:1fb:4f8f:f212 with SMTP id d9443c01a7336-2050c4e89a1mr75585605ad.60.1725038656095;
        Fri, 30 Aug 2024 10:24:16 -0700 (PDT)
Received: from [192.168.1.78] (c-73-42-218-101.hsd1.wa.comcast.net. [73.42.218.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2052fe96c72sm12146585ad.145.2024.08.30.10.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 10:24:15 -0700 (PDT)
Message-ID: <85e93d99-8067-418f-86de-bf394734a93a@rivosinc.com>
Date: Fri, 30 Aug 2024 10:24:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/perf: riscv: Align errno for unsupported perf
 type in pmu_sbi_event_map
To: Pu Lehui <pulehui@huaweicloud.com>, linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>
References: <20240829094922.865638-1-pulehui@huaweicloud.com>
Content-Language: en-US
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240829094922.865638-1-pulehui@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_102417_174871_123DA8F1 
X-CRM114-Status: GOOD (  16.16  )
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

On 8/29/24 2:49 AM, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> RISC-V perf driver does not yet support PERF_TYPE_BREAKPOINT. It would
> be more appropriate to return -EOPNOTSUPP or -ENOENT for this type in
> pmu_sbi_event_map. Considering that other implementations return -ENOENT
> for unsupported perf types, let's synchronize this behavior. Due to this
> reason, a riscv bpf testcases perf_skip fail.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>   drivers/perf/riscv_pmu_sbi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 31a17a56eb3b..cdcb328f09b6 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -543,7 +543,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>   		}
>   		break;
>   	default:
> -		ret = -EINVAL;
> +		ret = -ENOENT;
>   		break;
>   	}
>   

Thanks for the fix. There are few more places where the error codes can 
be aligned.

1. We return EOPNOTSUPP for legacy driver.
https://elixir.bootlin.com/linux/v6.11-rc5/source/drivers/perf/riscv_pmu_legacy.c#L31

2. We should return ENOENT for invalid event mapping as well.

https://elixir.bootlin.com/linux/v6.11-rc5/source/drivers/perf/riscv_pmu_sbi.c#L312

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
