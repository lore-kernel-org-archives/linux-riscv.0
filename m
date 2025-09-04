Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28762CA1010
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 02:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LVE/sR9PVN8XloCOIM27V1QxFGI8bvjLNKywIE1/S0=; b=cTrB/Ko6N1I8zd
	YjeoKGnVqXFXYyFna8jbHcizgtt3GyIZI5ArDzrKkfTKadpByzZwg/YqJgSKdApKXGJReKP5YZugA
	fx38rSsujL8/x0qGWLHy82galBkjIKdVhJ5O865U3iELNbWUDfLeH9JPzYUEUHMrWCEzRd4uIHbkU
	AueZUDjiRGBfE8uldqIaT2lGZalUlZao6F0WewqvKmnnRTXX0/eQTXAnoM/XhDT+l8LMxlV3Znuo1
	R5wFPO+kt1qZa8Yqv3btmW5tMvd+7LC2R4PnmDwi4CW5JMSBHuVl+Mimf8NN1cZ7xAsoOd6jhSnj2
	boABKjGP5pLkvGwJDlRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzS5-00000008HQe-42FA;
	Thu, 04 Sep 2025 02:11:53 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utxvl-0000000801j-1DYH
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 00:34:27 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-323266d6f57so485858a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 17:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1756946064; x=1757550864; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLTUD5tAnhy3ZTN7uw5PbelnC7/OP8Jv6iyZLCIi7Hs=;
        b=UPVX6JFX/S8BLXAudAzZ6rhcNeFQUK+DzBRJA0M/62SgRminjWxs12lVb2pgVW2eb1
         myS3pNyxUws4gOjH9LvL192LG2Gx946nCRBnZU99wSpvmsZLEYkoUL3vi0uyUGP02jUL
         a3LNsTIYU2dh8QFMaULLjOWGNVTW6LHufyAQVXUlIZZpmhjX3rxBfSzkEm1LlMMCeo7t
         0MuGCErQ7GDKXo5MKs4X3dcHYSYUtUH2uZDRbZFKj3HUywGz3ta0F+F77ViYb1dhijaD
         kPPeMnVauQkLopXTxkhhvDY7HJKLTpaVFHZ/uq5UmrrKjTjHL4DalfmtbCPC6AbpZSZ+
         ByAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756946064; x=1757550864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLTUD5tAnhy3ZTN7uw5PbelnC7/OP8Jv6iyZLCIi7Hs=;
        b=gOA+Z+IyMZPSWEdDN9CCaJVlL/XDIEPxQOa5e9iCHsDD5Gwcgc1tGdg/4bMLhU3PIY
         Cmwk4spz1v1z/MIk1UVJGDo7aAx23j3x6FEprEwsVYo40NoGmrM7wUdHN5Nt6HFBc2Es
         ILigCrCpz1f5+wyhD1l2CJ5o6L5/228sNcqkEuoZgTe2hT1DfeZmP/N6Gls8ptTyb4BH
         ySwIfwNmsz0iRQthRBn9NURhagi/KKszO4OJSq6Qo7zyTBtPPKNZKdnIOLO5nvP3XZS1
         xhV8lFEJu++Ac+47UyNq4BpEgCQJ7EQx4QK5paZ967Ps3TPmqzGHdI8fx2AlxyVgDzgu
         wCXA==
X-Gm-Message-State: AOJu0YxrMBxybFFMa9/XazjiiUr0CC6c8PbzsBGRCEmaXWPd4Oih0XWb
	8NV1Gbzrz2YIUwVPihu97n1GZNdKy558kcVToDvmsOeAlra6I0elglpKaYY3tmq2k9xuG+LciN/
	jAg+prg==
X-Gm-Gg: ASbGncvL+eU0ErB0TFrC8N0sK6nXPtGem2cq8y/XCFyHvaDb7UyArfSNRo4JGuK26+r
	+Ax494/GVDzX86I1TQUpBsQeC6zASLpoG5PGLw8O5zzgIbggeeOc2baUiWm8QIFpUpB0VgP7M+X
	IschqgS9wfbZTJW8nsPwQWRGVAbqB618rsIo16uFHt6Gq0p/HltfC9k499w8qPRDiA0OABHxwIZ
	3qSQvXFiDxtyRHF/Po+EW6wnEfPc4JeP07WcNPa3s1gjNQGzJNViU7s5FIj792Rn3wnV202htxh
	T2aXFSDceVkmCZzctAU4EF3jzISz0PPWxqTKj+lzAScUKAVSlAtxqOsl/KewwDXlUoQ9D/zrUER
	WTp7bQXqacmgYBdZDHFgcHlJHLTzpJ6E9dZdB08ltdvsLioqz5LHptA==
X-Google-Smtp-Source: AGHT+IFZIGiF6FH1F1iBzUKNv9BF9Pzhn7yHPb40iqlLiXlzirACFZ3W/rhu2h8VU7pS2JXdY2M8tA==
X-Received: by 2002:a17:90b:394a:b0:32b:8edb:12ce with SMTP id 98e67ed59e1d1-32b8edb1412mr1878452a91.15.1756946064198;
        Wed, 03 Sep 2025 17:34:24 -0700 (PDT)
Received: from [192.168.50.200] ([202.172.96.68])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4e5684da06sm12474425a12.17.2025.09.03.17.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 17:34:23 -0700 (PDT)
Message-ID: <be993fd5-cbfb-4517-b9dd-0607281d03bc@tenstorrent.com>
Date: Thu, 4 Sep 2025 10:34:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: Fix sparse warning in __get_user_error()
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 kernel test robot <lkp@intel.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250903-dev-alex-sparse_warnings_v1-v1-0-7e6350beb700@rivosinc.com>
 <20250903-dev-alex-sparse_warnings_v1-v1-1-7e6350beb700@rivosinc.com>
Content-Language: en-US
From: Cyril Bur <cyrilbur@tenstorrent.com>
In-Reply-To: <20250903-dev-alex-sparse_warnings_v1-v1-1-7e6350beb700@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_173425_449963_F5F6CC93 
X-CRM114-Status: GOOD (  16.29  )
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

These two are on me. Sorry.

Thanks for fixing them Alexandre.

On 4/9/2025 4:53 am, Alexandre Ghiti wrote:
> We used to assign 0 to x without an appropriate cast which results in
> sparse complaining when x is a pointer:
> 
>>> block/ioctl.c:72:39: sparse: sparse: Using plain integer as NULL pointer
> 
> So fix this by casting 0 to the correct type of x.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508062321.gHv4kvuY-lkp@intel.com/
> Fixes: f6bff7827a48 ("riscv: uaccess: use 'asm_goto_output' for get_user()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Reviewed-by: Cyril Bur <cyrilbur@tenstorrent.com>

> ---
>   arch/riscv/include/asm/uaccess.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 22e3f52a763d1c0350e8185225e4c99aac3fc549..551e7490737effb2c238e6a4db50293ece7c9df9 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -209,7 +209,7 @@ do {									\
>   		err = 0;						\
>   		break;							\
>   __gu_failed:								\
> -		x = 0;							\
> +		x = (__typeof__(x))0;					\
>   		err = -EFAULT;						\
>   } while (0)
>   
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
