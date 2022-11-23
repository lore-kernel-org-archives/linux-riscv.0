Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAB2C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 14:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFYOUxh7egRuwuTcnHIy/FdnCOGJkrsozUoffDpS0Ys=; b=wa6VAbTFgcoQJu
	jLZiVmnTd90mudvkTb86TIAdTH66UjjPWN8ClqW5hHGI9XwZ/H6hKt+0CEvhUPOZQf6M8arYnfXVh
	dPx6sYEszsIQvqTX8fEadaYz69Ysq9PD+Lo4o5XjX1dQYWJgCx5yDi35/MFx9EOsstZI/Dlsi9WLO
	tNCYchoZSnaSLZZfshbSyczm+7zWpxGhlDo2R8RtKYo4jDRWAGVwEWMHtf1U6hrq3N58q1qAQLDt0
	PZdcgINm61bJ4sG/COGNYlkhFe1fU4Jk0ztr52FT5B2IOCLSEkxCwLJvoYdeBTrAS+1Rt0d4iLmik
	hkQDdH3RcN0+4Ow/Af9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqeT-00HauN-SH; Wed, 23 Nov 2022 14:23:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqeR-00Har1-3g
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 14:23:00 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5so13165892wmo.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 06:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O7q+XYng1M6vgFUaz+j49ftUqX+WR8ClrflugSdb5kc=;
        b=edHq3RVn9DSBBq7CRndmDwodvYiy6GSiaortnHNkU6FOZWSCBhRhKpcbD62GCAhPw9
         /QiFv4N/dcL4PCAc8CwIoWgti2RFrN1ptwSQL0NtPHwcbKbUqlyO+hcPAUD4iuJfgM/u
         Ttyxu3uU1BcjwRrqjOsT6g0JZlFH2GQPo0wptSB28ssX8nhyIWd/fZm21ZOVgb/f8jG7
         dEj7s9ihNu16XHgRAoWDEMiIvuX851EkdduRncHXNnUCDGiUhbd1n868j6a1dG2ms/Lv
         Q63rnrk4Y5W3PM18eUUFU39GgY5FBU5TQAbbSFMAytnz4X22ZENR6rkQvHNZxYHni10e
         K2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7q+XYng1M6vgFUaz+j49ftUqX+WR8ClrflugSdb5kc=;
        b=y2LKZpHUaAzAI0JcoxiylZMfYYRnrdVEDYzSf9pQApY6xzQSsdzuOZlDWueb12FsBf
         uu4Y/KTd+RcpSNyB6vlTBCPCSyPumx8WWiFamQe8afqjJTD2g/j2MFSNlYFTQnkILHtN
         dnAdGiS+JzB87+ZtWj/aowpl9DWHo2Jy70MmeRzB/bGOYh2uvoIBmDO9R3OQUkUdTvmp
         6vk2Z6ArT4I2Y9WjOOta6v+OcVocZ97TOTBtTAQf5dwnCOUeob9RWxwl6aP0nCTyhlHt
         Fm3b4qmIf5gEX7z/CbfsL7KbdTXrTOB6IOMtrFpXc5oBFSt+ppgNGijM549GnOaIFQWr
         /NfQ==
X-Gm-Message-State: ANoB5pm9Fwg6Kq3fhMHyGM5UG2idY8yR3D/ecCBba5jT7FOznW1yyh78
	Cvj06TcNeimoy/7bgXXuoHKmdQ==
X-Google-Smtp-Source: AA0mqf5VfnqzmwMYBXMzkrpmg1rUoPfdo56SRwF7T9gCWmDowQUGoSpPvQQYpQ0z+4JO0FX8oiJQfw==
X-Received: by 2002:a05:600c:a51:b0:3cf:8df5:68dc with SMTP id c17-20020a05600c0a5100b003cf8df568dcmr19412226wmq.15.1669213376042;
        Wed, 23 Nov 2022 06:22:56 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id q11-20020a05600c46cb00b003c6f1732f65sm2730643wmo.38.2022.11.23.06.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 06:22:55 -0800 (PST)
Date: Wed, 23 Nov 2022 15:22:54 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC 8/9] RISC-V: KVM: Implement perf support
Message-ID: <20221123142254.2mc3j27kgw37jblv@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-9-atishp@rivosinc.com>
 <20221101153112.hpst2bohsdvqours@kamzik>
 <CAOnJCU++M5jd6toy1J8T+FPGJWSUaw8s9X7sxZY25naPoZeJJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCU++M5jd6toy1J8T+FPGJWSUaw8s9X7sxZY25naPoZeJJw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_062259_168455_81EA09F3 
X-CRM114-Status: GOOD (  15.66  )
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

On Tue, Nov 22, 2022 at 04:45:16PM -0800, Atish Patra wrote:
...
> This brings up another generic error returning problem in KVM SBI
> land. Usually, SBI error code numbers do not
> align with Linux error codes to accommodate other operating systems.
> However, most of the SBI error codes
> have 1-1 relationship with the Linux error code.
> Thus, kvm internal code returns a Linux specific error code and
> vcpu_sbi will map those to SBI error code using
> kvm_linux_err_map_sbi.
> 
> However, this will not work for SBI_ERR_ALREADY_STARTED/STOPPED as
> there are no corresponding
> Linux specific error codes. We can directly return the SBI error codes
> from vcpu_pmu.c and modify the
> kvm_linux_err_map_sbi to pass through those. In that case, we can't
> map any linux error code that
> collides with SBI error code. Any other ideas to handle this case ?
>

It seems like we should drop kvm_linux_err_map_sbi() and add another
parameter to kvm_vcpu_sbi_extension.handler for the SBI error. Another
option is to continue mapping SBI errors to Linux errors, e.g.
SBI_ERR_ALREADY_STARTED == EBUSY, but that may not be too easy in
all cases and the errors become ambiguous, as we can't tell if the
Linux implementation generated the error or if the SBI call did.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
