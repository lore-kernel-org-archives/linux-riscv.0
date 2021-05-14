Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC31C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 08:28:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E556261454
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 08:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E556261454
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=02btt3k3Ga9XvIF0LgrrutrHqtyrrEwUh8jFfujCnNM=; b=BXPABYn72hZsNHAyiylx9KBUp
	v8XKuhAeq7zIaNKGQ2hKmzHsAC6vnh5linicAkDGZIPPMLmjBU4M0XTuNMUzHeRtcEBQ7A+A3ez2V
	0ef7OcTF9n1wHvPs8UQ9D5FFRpkVuYoplL3FIJPiXIF9al/VMB8ZHNKGjKow27PDaljTQayhdDUnl
	24qTm9tfxqVQZoKhktgaYhrL3fwDDKfngT0lgseQcsZeq26RP721JlxHh6ugiBN0vFi86HSy94qV6
	TB9TPoO9kuEIuRKxx6zMEEWMFxyAQOFHn/1TkiLWS++d2hhxxvjtoKrpX5bT9YfCVKtRq514Fcmwu
	TKkObzLdA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhTBR-007VE1-Tf; Fri, 14 May 2021 08:28:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhTBL-007V9T-3K
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 08:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=5w0DUc6v8+Ohu3/Un9/gp8Wn9KzAdxtOI/JJ1rmwYuM=; b=KYgzA5HPQ+UaL73Avn+FWXUAM/
 McUCk4Krfb/AlzQ1XYKAu6EmoCO+wKahD9Wg3iBDnpHi6Cnjlz2po9FOwJQjJ6ImVq58Lcm8/tx/H
 QQHSNlg9OdJodiIc1WyWFpuXRkG3MmPwu4fmr5k6NySleWEMZNhkCXitV6yW0SVGlSZkb/EHLnNTe
 EDnxxUSy+HTUGT2DYGmMeYL/alKJctTigYisUh/dSYBKqKUGI8DVaPdBiJ9zy394Fuy+KyMArAMJb
 dJDEc5PDGeNDqIieszsA6BlpEyS1EFsxu8gq36jWUq+wgYM/1i6RAW3FGY7kDqqu2GBhgyrAXeHCJ
 KpE58hog==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhTBI-00BolX-Iz
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 08:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620980903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5w0DUc6v8+Ohu3/Un9/gp8Wn9KzAdxtOI/JJ1rmwYuM=;
 b=MFp+EYNbog+UbV2XVhYnOj/c1lOm9aOA/xV5gEKAbUNc96DQ1DGZ5eudogQW02T+1p8vdz
 zsuMpxLNWMCxbAC0kF5UMTbQU7AOgk/cMs3wZl44c729Uw0iOfiwRVRmYNIFd8+k3GUVC0
 0ybJIzxSzkSaz1XT9cYmp1f+sXfWXUs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-wy8mUgeEM5qiwiiZ2jBF4Q-1; Fri, 14 May 2021 04:28:20 -0400
X-MC-Unique: wy8mUgeEM5qiwiiZ2jBF4Q-1
Received: by mail-ej1-f72.google.com with SMTP id
 zo1-20020a170906ff41b02903973107d7b5so9297322ejb.21
 for <linux-riscv@lists.infradead.org>; Fri, 14 May 2021 01:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5w0DUc6v8+Ohu3/Un9/gp8Wn9KzAdxtOI/JJ1rmwYuM=;
 b=R0+1faKmTfh8j14w9XZwWohwpEgTxtFDrGSogq0DueV4chS7qbeBJOMRoQnq1jEcsh
 Ozh6wF5MaOkoLpZ5Wrm/iXPNxzdnWycUeuqdUGByzCMzUfYfCINWjn23wrVBYHBGnT+M
 E5KR1oVSpEsW6zBnsx/f60i1cvyKh0wtuCxMWEkBuS2gj3xonDx4hXjvtzjvKTIpKXNT
 e99QToOoCuHVX/IiMJIAXnDmLfb6QYaGQauEsbyRg86fUXdPeJsr32p2P3GsTo1xtY5P
 qy6dmEEnimJFZTZC/Ng78oOT+CUKanIRLh2UJMA2zn9n7f1AQPqWPEjjt92dq56TOA+D
 i4Kw==
X-Gm-Message-State: AOAM533ZfifcODoMfH0O2SP+lwrqeH7FVRQyYC2kPp1W9oXP9eoA1Os2
 Mmn+fXzfMetK8kt+J5PNUDCr7kOAZgGtWsompoV0dvnVJvz05lVVOdjqhpxL7AGzqFMnA4VRQVj
 ZwPvzmlpOL5ocQhUFNYk4EKHKSrrQ
X-Received: by 2002:aa7:c510:: with SMTP id o16mr54629595edq.310.1620980898861; 
 Fri, 14 May 2021 01:28:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAa7CtEGRAWr1lF7BGwkWkyoH00MJ3yOs2g5NJWUfLIy+27BD8PFUUKz633oLeJlXdgmtb9Q==
X-Received: by 2002:aa7:c510:: with SMTP id o16mr54629525edq.310.1620980898588; 
 Fri, 14 May 2021 01:28:18 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6501.dip0.t-ipconnect.de. [91.12.101.1])
 by smtp.gmail.com with ESMTPSA id
 s4sm4090012edq.96.2021.05.14.01.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 01:28:18 -0700 (PDT)
Subject: Re: [PATCH v19 2/8] riscv/Kconfig: make direct map manipulation
 options depend on MMU
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Ingo Molnar <mingo@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Kees Cook <keescook@chromium.org>, "Kirill A. Shutemov"
 <kirill@shutemov.name>, Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org,
 kernel test robot <lkp@intel.com>
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-3-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <adb9f79a-8b9a-0302-e83c-03ad17d3743b@redhat.com>
Date: Fri, 14 May 2021 10:28:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513184734.29317-3-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_012824_709728_0294C2EE 
X-CRM114-Status: GOOD (  21.65  )
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

On 13.05.21 20:47, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> ARCH_HAS_SET_DIRECT_MAP and ARCH_HAS_SET_MEMORY configuration options have
> no meaning when CONFIG_MMU is disabled and there is no point to enable
> them for the nommu case.
> 
> Add an explicit dependency on MMU for these options.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>   arch/riscv/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a8ad8eb76120..c426e7d20907 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -26,8 +26,8 @@ config RISCV
>   	select ARCH_HAS_KCOV
>   	select ARCH_HAS_MMIOWB
>   	select ARCH_HAS_PTE_SPECIAL
> -	select ARCH_HAS_SET_DIRECT_MAP
> -	select ARCH_HAS_SET_MEMORY
> +	select ARCH_HAS_SET_DIRECT_MAP if MMU
> +	select ARCH_HAS_SET_MEMORY if MMU
>   	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
>   	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
>   	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
