Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24143C52D7C
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ddv8qpTFOeXQyesa+uhVdwnYZ5mj5ri1jpzWvG1L5Us=; b=tHVyBiKc7rGXvcSVfEOK+n6gaL
	JUsTIFxRTGGRHXA27zXZWXkuSMeTM/zZw54m+6qMrOOQrWWWDq5GxAdqrY3aHhRSOoc8iR+GsU5bM
	cfXKksJEqTzeDf0koXzHLptyBckUSaeZ1wIh/EIeQiAWKWnvpofpe7HD8oC0VxNQHZ5EOdBYQAjpd
	XLoRnDzx1GFEy1uR5dL0V5G7qC/eHqMjjSM1s4tvpav+t4prsbusQTJ7pYRf+UBhFEdc6PmkrSUd5
	NlMPmUyl6d9N5RxtkK6ZWYY2ntrR3V1BeO+5BtlJ9JoOkNlzcCZXfoZphcwXxywIWsZVcLbvUGNCT
	CQyP+DCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdvaX-00000004X3O-1BmT;
	Tue, 13 Aug 2024 17:45:41 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdvaU-00000004X2E-0L8Q
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 17:45:40 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-260f057aa9bso3575977fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 10:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1723571136; x=1724175936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MubgzmTkGoLk6Sy+ubAhLb2lJQ+c10dRYN9KCEZDVvQ=;
        b=MJaci5axKOBZHnybjrtuLP8wpXb4oSSMqLRL5PzjqCEKWC+yzpaULguRiYC2w3vEN0
         8Fnb19ZlvvZcB631wfQU4ujtVoqZf73SunTgwjHzLYgJjJEBe2XAoMj35SnY45t+n++3
         VcBfeQrnfoCmYKO0cuBLlc+xz43i8eBF6mTGpKfrfu3iZKXrgdvgYtD1MGyntFbMkS5R
         V/XOZjtdUrzAyNGyfx/s5qZu/svmM37n9lK4aqKipZGju3N+CVp8r+lXGtQigW8M9L7/
         XDtuex/+0MQx0h+8EuPRfOxKmdhhLMv0dxtV7LupVgO9Y7PW0gO5vC2jptG3K0u3WdKa
         JI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723571136; x=1724175936;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MubgzmTkGoLk6Sy+ubAhLb2lJQ+c10dRYN9KCEZDVvQ=;
        b=t6LL0mZC7hmFNv/bwzFvfkn624rxOd9nhBgx14PKASUlxWCGdANY3RO7i7fpKfzGAe
         +OodG9ezXm0BhcMequ3Mf3S4J7WTE3O4QZokMIZ+d7lJi2OiUM54PaLdg0tg23j0CLdQ
         ENgCULbYTgDB4PrGcrBW5WcCIBL1tNkv5L2ei7DmLT47Wf/SMSpiS2YaW+Cybzh/lREf
         51hIPDNoWVJb4mSuaVetrimNEV1wJ8pw1JNgBwsXnXARYeK1XFLUvnVPsKNMGDFnALxr
         EFo56Do5fXGLPPgou3YEM6G80WWY/q8GNYTfXd+hxebEohYkISaaAoQTJA1Zjg3tKo+Z
         6LgA==
X-Forwarded-Encrypted: i=1; AJvYcCWSoPcXFm/5Cj/rcaAnp4o3IoiYRcMnahVcTIhPd99t/VFvM2h3zHXGqk9zpvQDhiFVxpDopJbysUuPJtG8iNdoipL2iU0Uzw7/0HTCFIcc
X-Gm-Message-State: AOJu0YzUmGstAvCzPXZc/nZLb2w6wTnthAue0D+IIYoPD/irZ2Y87qcL
	4xITR/MuByvspEoNE/5EEuYNda+/Yrtzk6JXgzL3BKFiD04LZeCxAdsZ4trtSmk=
X-Google-Smtp-Source: AGHT+IE3uqwNiNxWMS0aZLT9JubHN+Eh10Kr02K6qabc5dhWWvlSu3SRh9RQgttofqo3VUev7YFzlQ==
X-Received: by 2002:a05:6870:1612:b0:261:1eb4:dd8e with SMTP id 586e51a60fabf-26fe5a04303mr455099fac.2.1723571135449;
        Tue, 13 Aug 2024 10:45:35 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6979d3d58sm1755063a12.18.2024.08.13.10.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 10:45:34 -0700 (PDT)
Date: Tue, 13 Aug 2024 10:45:34 -0700 (PDT)
X-Google-Original-Date: Tue, 13 Aug 2024 10:45:21 PDT (-0700)
Subject: Re: [RFC PATCH] riscv: Enable generic CPU vulnerabilites support
In-Reply-To: <20240703022732.2068316-1-ruanjinjie@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  samuel.holland@sifive.com, tglx@linutronix.de, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, ruanjinjie@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ruanjinjie@huawei.com
Message-ID: <mhng-8bda3a10-9d6d-4aac-acdf-1287278e7e82@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_104538_395213_3E96DCF8 
X-CRM114-Status: GOOD (  18.82  )
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

On Tue, 02 Jul 2024 19:27:32 PDT (-0700), ruanjinjie@huawei.com wrote:
> Currently x86, ARM and ARM64 support generic CPU vulnerabilites, but
> RISC-V not, such as:
>
> 	# cd /sys/devices/system/cpu/vulnerabilities/
> x86:
> 	# cat spec_store_bypass
> 		Mitigation: Speculative Store Bypass disabled via prctl and seccomp
> 	# cat meltdown
> 		Not affected
>
> ARM64:
>
> 	# cat spec_store_bypass
> 		Mitigation: Speculative Store Bypass disabled via prctl and seccomp
> 	# cat meltdown
> 		Mitigation: PTI
>
> RISC-V:
>
> 	# cat /sys/devices/system/cpu/vulnerabilities
> 	# ... No such file or directory
>
> As SiFive RISC-V Core IP offerings are not affected by Meltdown and
> Spectre, it can use the default weak function as below:
>
> 	# cat spec_store_bypass
> 		Not affected
> 	# cat meltdown
> 		Not affected
>
> Link: https://www.sifive.cn/blog/sifive-statement-on-meltdown-and-spectre
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0525ee2d63c7..3b44e7b51436 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -85,6 +85,7 @@ config RISCV
>  	select GENERIC_ATOMIC64 if !64BIT
>  	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>  	select GENERIC_CPU_DEVICES
> +	select GENERIC_CPU_VULNERABILITIES
>  	select GENERIC_EARLY_IOREMAP
>  	select GENERIC_ENTRY
>  	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO

Thanks.  This is an RFC, but I'm just going to pick it up on for-next: 
we had a recent round of RISC-V vulnerabilities crop up, so it's time to 
start tracking those for users.

It's queued up for now, it'll show up on for-next proper assumin it 
passes the tests.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
