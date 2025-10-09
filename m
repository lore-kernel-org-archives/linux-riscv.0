Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D09CCD184
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXBiBKsDQRPcSr9vARgsk081qOY03MRTlCWVTDYlrIE=; b=NI6CjVeVLgL2p1
	DSaXkzmgVdJo9sL8jUW6UKQWvSOCYUpHKzizhc/S3m/FLHUTwiDPs0B49gH1SZCu6am/5ICZjn6Sx
	4+3n0d7KfMyLopOLIa8U8Zn2sTR6QSuK1MmIPGrfWHcOow+RZhL2NVmD3TT9X9DQdFhHInz30hTvI
	OZ8eE943Y++fHfgQSYLp5WyaCmC0wXt60i6L1Ewn/iw893BgGqwfuUtx6zrY4bs6uiAr0ATLlWCZ+
	rThT5t5qpLCNVXdJr1T3BOszqKiqyEV4zdzF0KvsxtFXOZHyn6KLyM3Vm4PvPcMnzaPF4Ddd1Vp1s
	MuVvOb6D+6gkEv1dnTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6u9R-00000006n6h-0sZ4;
	Thu, 09 Oct 2025 17:10:01 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6u9P-00000006n5a-2BXc
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 17:10:00 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-9298eba27c2so53562339f.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760029798; x=1760634598; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QTeDxHV41BcjEs4ZzLufpAg+KIKFlFSe6LLaLPzOlwc=;
        b=pQywhEr3DoOsXosYN3ofxtYVhYidIa3rnwmFb3UfqgrSkkmmSIDX0FcdRPmsF1pRFR
         KkQF8y7ROplwzWwN498hO9YQhAqJq9pVcK/eh7nPlQnRSMeUJN30ucgwRO9n285ovtio
         5IRxyC1hh9HwBphichHZ8X2TGKClEOKI18pJkOnivCoFGw7M0Z65LEUshH/Qzvy+KkEJ
         tt47FClPH9ekBq42Kjnbc6l1bn+HMcJV8/fDQBSSwGge1144KN1xF6qzTKtEgoEQySYL
         hDx6It7D7mdgdPVUaB6fhsgPMwARhgvgbA2qO7pQA2JmrEEI3qJlkBLRhCIZ+qsLSOY5
         gp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760029798; x=1760634598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTeDxHV41BcjEs4ZzLufpAg+KIKFlFSe6LLaLPzOlwc=;
        b=dopfIm+PJhZYzUlSTczOs3byiqKTdUsg+fXdjVnOV3jA1IeQogykXAX93MpsPKRqxQ
         QMXomeimvPYnoLG2c1AFSCvxJXqqTQrfsABUIgiMcGdxDGjyxE2Vl+L84kbjp86j+mcK
         KKnoxaDH8/dZHtnOA/UgwkWE86hLVooTGXO3xZtjg+JiVA1apaZ7OUA4cv44A3oPuFcN
         rz1XWUO3sjUxXh3T8rFN1ptLCfYaA/L1giccQRNbAw/iB/Y5gvYe0Kk20PvzCnWlD7qN
         ymNC8jyeDoAHwmeNCYApByhzbi+1Tp0froBvPXcNcLzNSJeBXgqFf7ttqcMx+Jw0oA5n
         sDYw==
X-Gm-Message-State: AOJu0Yz2v2RpiTN4WteZf1VoUElDQ0UagoXnbZAXvKQQgRrURw7nB56Y
	s0bhrCkH+qoQNxsUfIkY1v7kamRWZcFKDOpivlm1z/7lOy1su+U/+KG/H47Et9Qy1NtzvEfMs56
	uteM1t7Q=
X-Gm-Gg: ASbGncv3FNjCtUDLkLUd9h5LU1rq6KNmNakB1QjTznx9Ud2Qc2vadrkuD7Lh5Mzvpms
	ezBMf5kxrsaa8fFh4pJDYaPPf8OoePHvqzhtwuvndlvbMyc3pwSJmn59YSKRCcNK5G9wvEPDZ72
	NT+XKKPj0AaoIHcKbIJv5JLFUkTkXZXlQIGAGucfiwO8Y+arFoIj/nEEXLHylbF+YrXSHLEB4pW
	dw9tIAPa08k0gCUark5SFpwFmRQ8KpwkplmzabONR2vdZ+1FDUYOcZaDh8uF8kLHpScNoWwUVK6
	8ijZjHHWFcwg43GsuVwwV4wy1tSR7E0Qmpsf4brrCcjrzxAlZ4YSzud/H4QoGG7Ww9RHMqjMcCX
	TgnDp2C8Lyk6ZtIU0wv36D2qwr5x0/AsFU9jQFaPd62CIyUYQwlZghrzdNjo=
X-Google-Smtp-Source: AGHT+IGjllGdtDWAnTrCzVKrcM1t+/BGFwh2qkqJDVXQhEyBcLiRTPJa0KrImioBzGzUP3lZRVUBCQ==
X-Received: by 2002:a05:6602:27c9:b0:8e8:a857:1f89 with SMTP id ca18e2360f4ac-93bd1780c1cmr894428639f.3.1760029798409;
        Thu, 09 Oct 2025 10:09:58 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ea80655sm8164172173.34.2025.10.09.10.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 10:09:58 -0700 (PDT)
Date: Thu, 9 Oct 2025 12:09:57 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	alexghiti@rivosinc.com, shuah@kernel.org, samuel.holland@sifive.com, evan@rivosinc.com, 
	cleger@rivosinc.com, zihongyao@outlook.com, zhangyin2018@iscas.ac.cn, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v2 0/4] riscv: hwprobe: Add Zicbop support
Message-ID: <20251009-440720dc2e40b8a0b8296956@orel>
References: <20251009134318.23040-1-zihong.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251009134318.23040-1-zihong.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_100959_563136_E4B8C756 
X-CRM114-Status: GOOD (  15.62  )
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

On Thu, Oct 09, 2025 at 09:41:50PM +0800, Yao Zihong wrote:
> Changes since v1:
> ------------------
> - Bump RISCV_HWPROBE_MAX_KEY (modified 1/4).
> - Add documentation for the Zicbop hwprobe bit/key (new 3/4).
> - Add a selftest(prefetch.c) for Zicbop (new 4/4).
> 
> Add UAPI and kernel plumbing to expose the Zicbop extension presence
> and its block size through hwprobe. The interface mirrors
> Zicbom/Zicboz. This allows userspace to safely discover and optimize
> for Zicbop when available.
> 
> Background: Zicbop is mandated by the RVA22U64 profile. Downstream may
> combine the presence bit with ZICBOP_BLOCK_SIZE to make profile-level
> policy decisions or enable Zicbop-specific optimizations.
> 
> Yao Zihong (4):
>   uapi: riscv: hwprobe: Add Zicbop extension bit and block-size key
>   riscv: hwprobe: Report Zicbop presence and block size
>   docs: riscv: Document hwprobe for Zicbop
>   selftests/riscv: Add Zicbop prefetch test
> 
>  Documentation/arch/riscv/hwprobe.rst          |   8 +-
>  arch/riscv/include/asm/hwprobe.h              |   2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h         |   2 +
>  arch/riscv/kernel/sys_hwprobe.c               |   6 +
>  .../testing/selftests/riscv/hwprobe/Makefile  |   5 +-
>  .../selftests/riscv/hwprobe/prefetch.c        | 236 ++++++++++++++++++
>  6 files changed, 256 insertions(+), 3 deletions(-)
>  create mode 100644 tools/testing/selftests/riscv/hwprobe/prefetch.c
> 
> -- 
> 2.47.2
>

I'm not sure why patches 1-3 aren't just squashed together like commit
eb1003970940 ("RISC-V: hwprobe: Expose Zicbom extension and its block
size") does for zicbom.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
