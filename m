Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526E1C47DDF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 08:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=seHrbJBP1qTWyQSbJ6FvUw63BmipbuFwNBGoijMlxow=; b=SWFeqkbYqNVPbj
	2G7xefZ11PcurAAXYFXUTReFQAP8UqLeJNvbZbLj5J904h1meklJV7kowZN0aqLwbF51N6c2c6q/o
	ywuF/PqdkzN+8lw019yVCyoSt8SvL7+TLhUooPVTkYMLhNNz/m4ZcdCgMBN0AjUbcu0JHJFAeJaSt
	WCedpMeEgTEkbGF/nMHRAMlw9wlviZlFyOvfoKB09uz+gMvyMd/Fylzjz0j4HgX5mzxQlNjgqeApn
	sqqXVCpovDLm7Pl2QSl3VY3EnQSDoLuaPW2tW8/3zVwwX6fnEe/OBgOjLPy8XnfP3RhsbAtb8mxHI
	u1P/hLLVSndpkgFf1GcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSuwE-007Hum-1X;
	Thu, 25 Jan 2024 08:18:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSuwA-007Hrx-2W
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 08:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706170693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uXqJgm/c2OUlFe0pydromqbBJfahkXAhDOZB8V8CPy0=;
	b=TFix/3bwqCJi/Bmefa54vWyP3vmv+ARAV4oXl5gUkd8psdNuT2MgIN07yIsuJLcH/UVZlf
	e0foH/DRzzLeQj2DvjTeaw5e9S6NbrWQPxs5qDCcaVaBWMQq2Q5I8gzPlZbBqYlgPzaCw4
	Pggblqn+zETf31F+ZVfMaYlWFi3wYbg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-l_rhEHhbPy-ObbN0CR1ydw-1; Thu, 25 Jan 2024 03:18:12 -0500
X-MC-Unique: l_rhEHhbPy-ObbN0CR1ydw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40e530b7596so61103035e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 00:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706170691; x=1706775491;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXqJgm/c2OUlFe0pydromqbBJfahkXAhDOZB8V8CPy0=;
        b=RuT7vwuIZXuQUuzD+Ju/tlMv+VphAXoKQdQxNe41Oifd1CTQxPRIwgWEOlC/jV5XFp
         ZwA5kUXDwRrsHo/H83JbpocZy4LSfEtS5Jw3DYx+V3hYfx/cejmiSDjWHDPsEdkrv7kj
         AwPpGEh5LRTnue8FuBWytCP/fiXU1wLA46uJuavFB+4zaBR9U92XuGI6K06stq8Lf4WS
         kCsXs9E/33+gYx8oGpOaZaPf3q88O8r0x7oJpnIzCmhGbEFfGUc0FwKvwsiY16tBKzv+
         I7k16x/o6xqkIUPKYcdBj1A9q2L9VBlsFjZaIpY9nh/pGdzeiAOwnrN2U415jwOtf50o
         qY3g==
X-Gm-Message-State: AOJu0YykHG/1nFjvplO7JxUvH2jlde4QfW74FLTw17cb4y3f6mQq4mGG
	R2Uno2CCLv/S3yN/mizwTTEWsC0Qaf1FxRHX5gCwi36BUr+EjMa7O5zfM0iSqAYOPjtPZ59D46r
	prBx2su+mZZOdWDGIbGVkvgsHdwgmn90qggwyKgvgIDaYUfGaP1yUt549s1h6fSV4qQ==
X-Received: by 2002:a05:600c:c8b:b0:40e:4b11:663d with SMTP id fj11-20020a05600c0c8b00b0040e4b11663dmr267219wmb.66.1706170690819;
        Thu, 25 Jan 2024 00:18:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEshtEkNFMkm00s60/JsUTo/oUqMCiWSuFJI5nmGq2+g7C4FvJZO0iTHAUzos0dIk+wNed0Hw==
X-Received: by 2002:a05:600c:c8b:b0:40e:4b11:663d with SMTP id fj11-20020a05600c0c8b00b0040e4b11663dmr267209wmb.66.1706170690365;
        Thu, 25 Jan 2024 00:18:10 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:7600:9a0b:ceef:a304:b9a7? (p200300cbc70a76009a0bceefa304b9a7.dip0.t-ipconnect.de. [2003:cb:c70a:7600:9a0b:ceef:a304:b9a7])
        by smtp.gmail.com with ESMTPSA id o14-20020a05600c4fce00b0040d30af488asm1658538wmq.40.2024.01.25.00.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 00:18:09 -0800 (PST)
Message-ID: <2f34f6aa-99fa-4545-b706-a1d50864f9e9@redhat.com>
Date: Thu, 25 Jan 2024 09:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 09/28] mm: abstract shadow stack vma behind
 `arch_is_shadow_stack`
To: debug@rivosinc.com, rick.p.edgecombe@intel.com, broonie@kernel.org,
 Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org,
 ajones@ventanamicro.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 conor.dooley@microchip.com, cleger@rivosinc.com, atishp@atishpatra.org,
 alex@ghiti.fr, bjorn@rivosinc.com, alexghiti@rivosinc.com
Cc: corbet@lwn.net, aou@eecs.berkeley.edu, oleg@redhat.com,
 akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
 shuah@kernel.org, brauner@kernel.org, guoren@kernel.org,
 samitolvanen@google.com, evan@rivosinc.com, xiao.w.wang@intel.com,
 apatel@ventanamicro.com, mchitale@ventanamicro.com, waylingii@gmail.com,
 greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
 shikemeng@huaweicloud.com, charlie@rivosinc.com, panqinglin2020@iscas.ac.cn,
 willy@infradead.org, vincent.chen@sifive.com, andy.chiu@sifive.com,
 gerg@kernel.org, jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
 ancientmodern4@gmail.com, mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
 bhe@redhat.com, chenjiahao16@huawei.com, ruscur@russell.cc,
 bgray@linux.ibm.com, alx@kernel.org, baruch@tkos.co.il,
 zhangqing@loongson.cn, catalin.marinas@arm.com, revest@chromium.org,
 josh@joshtriplett.org, joey.gouly@arm.com, shr@devkernel.io,
 omosnace@redhat.com, ojeda@kernel.org, jhubbard@nvidia.com,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-10-debug@rivosinc.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240125062739.1339782-10-debug@rivosinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_001814_907519_41D855A4 
X-CRM114-Status: GOOD (  18.48  )
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

On 25.01.24 07:21, debug@rivosinc.com wrote:
> From: Deepak Gupta <debug@rivosinc.com>
> 
> x86 has used VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) to encode shadow
> stack VMA. VM_SHADOW_STACK is thus not possible on 32bit. Some arches may
> need a way to encode shadow stack on 32bit and 64bit both and they may
> encode this information differently in VMAs.
> 
> This patch changes checks of VM_SHADOW_STACK flag in generic code to call
> to a function `arch_is_shadow_stack` which will return true if arch
> supports shadow stack and vma is shadow stack else stub returns false.
> 
> There was a suggestion to name it as `vma_is_shadow_stack`. I preferred to
> keep `arch` prefix in there because it's each arch specific.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>   include/linux/mm.h | 18 +++++++++++++++++-
>   mm/gup.c           |  5 +++--
>   mm/internal.h      |  2 +-
>   3 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index dfe0e8118669..15c70fc677a3 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -352,6 +352,10 @@ extern unsigned int kobjsize(const void *objp);
>    * for more details on the guard size.
>    */
>   # define VM_SHADOW_STACK	VM_HIGH_ARCH_5
> +static inline bool arch_is_shadow_stack(vm_flags_t vm_flags)
> +{
> +	return (vm_flags & VM_SHADOW_STACK);
> +}
>   #endif
>   
>   #ifdef CONFIG_RISCV_USER_CFI
> @@ -362,10 +366,22 @@ extern unsigned int kobjsize(const void *objp);
>    * with VM_SHARED.
>    */
>   #define VM_SHADOW_STACK	VM_WRITE
> +
> +static inline bool arch_is_shadow_stack(vm_flags_t vm_flags)
> +{
> +	return ((vm_flags & (VM_WRITE | VM_READ | VM_EXEC)) == VM_WRITE);
> +}
> +

Please no such hacks just to work around the 32bit vmflags limitation.

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
