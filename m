Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C550CC46CD2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 03:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ygJg+FEav6fbRpdf1/wG8Qb+kSbuDTAUA5j/CfyNN8=; b=FX/OFEofRnhzHf
	f5a9WS9/qAen4KVJPbDN6aC3b1plH+hAjia9LqlqbPKrxl2ZCRZ67ICWAj0Ih+awYTvi2qDh+lXqI
	jUclAZ11k+mb4svt7bWYIm0YARLIvNirbiDEPFsZ7kNO3ndk9hJSjrfGtjRrUaosyaElUE79Iwwcq
	BS4yJlVqTtLmaW2gA9YSeJ/366XqNTtnYVznv3PK1leaNbRrcvK+uJWTdFQXIIUbwU3Vz4jyWO+WS
	y6mTqayJ7EbQl5NCfmYSRbGhMtwKJN4YYOW8agsM0xHxFN41gzDSOsW8G2dUXwkaO88O6WgNUxUrX
	Z6WgjAPfXE4qayxG9/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGWJo-004m1G-1K;
	Fri, 22 Dec 2023 03:35:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGWJj-004m0R-1b
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 03:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703216118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y8TmxaP4mrskjqZXgi+cBjlEzOM/y71ITq0aMJjTxko=;
	b=Zd3Snbigf2hJ4bBSPOx1O0A9kJPqXKvR8gEBTjH8/2dj1FnGuYff5k7VKY45wzRG1CNEkw
	NrZpjeWdlKpenztIbZSVlhHfCIJCQ7H5pqUZJVyjZqh8bQpv5BAz5dVkGY/0wTF3CSXFaM
	54OU3TwKXUYPNzt3UQAD/tpox7IthVA=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-19HLv4UONsCZEUCgh3ooew-1; Thu, 21 Dec 2023 22:35:17 -0500
X-MC-Unique: 19HLv4UONsCZEUCgh3ooew-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-5c6bd30ee89so1347766a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 19:35:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703216116; x=1703820916;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8TmxaP4mrskjqZXgi+cBjlEzOM/y71ITq0aMJjTxko=;
        b=BC2/Y4Q1eH91SDHj3/bUY+YdcXClPVkG1VI36Ga4tH7VLtaCP6vBsr6mlT49F1CBgG
         MvKIFOEwBUUOg58odSyZ73emA6HREUljWWwhepPdI/r1KtvrpuOutSh/UjQQIOdEpqdH
         Z+QevohPGPoduCQcvPnZ4P8crvcJ3Wu8HhuUKzBukNfIV3BXVy57bKNfPrQkRRUOqCXi
         vd7dgJUaVpx+EkkyrbsB3VdKpLzJl2pO0KzuTdZK2lORBcYwi9zUttuywnuvec5h5amb
         xCsaB9C1UuuUrAS2/E6oSPRIMEQoHjuejHIFIWbwt0lLv1Ehej6jatpMK1liU6jswxP/
         Qq8g==
X-Gm-Message-State: AOJu0Yza1Eus/Jz5v3MRKbY/Op+sp0LxqC5NrjuTWtgaBCdBtNiNJ1OB
	uEYNan+JrCBKUI0mMX3rovqNfC3J6mAl2+G/dUcWt9BwAsFpVva4YcY0ABbq63qIYrtclhsVbEy
	/QothK1h4jxTsDg4bKWpzhp914aEAIoiWtQqZ
X-Received: by 2002:a05:6a20:3947:b0:18f:f359:bca5 with SMTP id r7-20020a056a20394700b0018ff359bca5mr914877pzg.64.1703216116071;
        Thu, 21 Dec 2023 19:35:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqO36BVnV3pzvB8GMCCtjZUoRDM68B3iwcPsT+deqxYS7JKss4F1R+kLGypmArdvd1klJX/Q==
X-Received: by 2002:a05:6a20:3947:b0:18f:f359:bca5 with SMTP id r7-20020a056a20394700b0018ff359bca5mr914855pzg.64.1703216115792;
        Thu, 21 Dec 2023 19:35:15 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id r16-20020a17090ad41000b0028b03f9107asm6270280pju.55.2023.12.21.19.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 19:35:15 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Cc: Leonardo Bras <leobras@redhat.com>,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH V2 2/4] riscv: mm: Fixup compat arch_get_mmap_end
Date: Fri, 22 Dec 2023 00:34:56 -0300
Message-ID: <ZYUD4C1aXWt2oFJo@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221154702.2267684-3-guoren@kernel.org>
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-3-guoren@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_193519_605806_DD45CC87 
X-CRM114-Status: GOOD (  19.41  )
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

On Thu, Dec 21, 2023 at 10:46:59AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> When the task is in COMPAT mode, the arch_get_mmap_end should be 2GB,
> not TASK_SIZE_64. The TASK_SIZE has contained is_compat_mode()
> detection, so change the definition of STACK_TOP_MAX to TASK_SIZE
> directly.

ok

> 
> Cc: stable@vger.kernel.org
> Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/processor.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index f19f861cda54..1f538fc4448d 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -16,15 +16,13 @@
>  
>  #ifdef CONFIG_64BIT
>  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
> -#define STACK_TOP_MAX		TASK_SIZE_64
> +#define STACK_TOP_MAX		TASK_SIZE

It means STACK_TOP_MAX will be in 64BIT:
- TASK_SIZE_32 if compat_mode=y
- TASK_SIZE_64 if compat_mode=n

Makes sense for me.

>  
>  #define arch_get_mmap_end(addr, len, flags)			\
>  ({								\
>  	unsigned long mmap_end;					\
>  	typeof(addr) _addr = (addr);				\
> -	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
> -		mmap_end = STACK_TOP_MAX;			\
> -	else if ((_addr) >= VA_USER_SV57)			\
> +	if ((_addr) == 0 || (_addr) >= VA_USER_SV57)		\
>  		mmap_end = STACK_TOP_MAX;			\
>  	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
>  		mmap_end = VA_USER_SV48;			\


I don't think I got this change, or how it's connected to the commit msg.

Before:
- addr == 0, or addr > 2^57, or compat: mmap_end = STACK_TOP_MAX
- 2^48 < addr < 2^57: mmap_end = 2^48
- 0 < addr < 2^48 : mmap_end = 2^39

Now:
- addr == 0, or addr > 2^57: mmap_end = STACK_TOP_MAX
- 2^48 < addr < 2^57: mmap_end = 2^48
- 0 < addr < 2^48 : mmap_end = 2^39

IIUC compat mode addr will be < 2^32, so will always have mmap_end = 2^39 
if addr != 0. Is that desireable? 
(if not, above change is unneeded)

Also, unrelated to the change:
- 2^48 < addr < 2^57: mmap_end = 2^48
Is the above correct?
It looks like it should be 2^57 instead, and a new if clause for 
2^32 < addr < 2^48 should have mmap_end = 2^48.

Do I get it wrong?

(I will send an RFC 'fixing' the code the way I am whinking it should look 
like)

Thanks, 
Leo





> -- 
> 2.40.1
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
