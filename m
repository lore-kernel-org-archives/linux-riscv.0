Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A7BC4828F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 19:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4FT0eV4ztHy5XGhJKkUokfsvANUMUmExvTZcs2hYdU=; b=JYSxQ6JDktp2Gl
	2aJeSkOlfmaJC9cvTQrZZkBdTLPBJy4C5qydPpWxMa5QgY5xQF1eaqLWeAXAJSCg5G9X86mjZ59N2
	+YibwGXZtgvqpYb7mI2UnsLg7wL4bWI09S6VK+iLhVU/oslrtmVynAF0CjGKHKxDBnU3anOIiJnAe
	N5/3QPTEYaH9S8Bz3uLAkLZ4E3D09Q01FnsHCLfAtnNfivtFTZTsgGyBNhuhqN3vsqfU8hevV4QuG
	RActhtLVtiDZENeN+F8jkAX6IYkqU+L+FFdpkm79fTiOnu1FrlIlToOMUYAPF1K+mpnxvtauylqSC
	GEFo/Hz7R6f23PSaQqTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXnWb-0000000BbrM-1lLa;
	Wed, 07 Feb 2024 19:24:01 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXnWZ-0000000Bbqt-0k9h
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 19:24:00 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-42c44a3e49dso1486531cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Feb 2024 11:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707333838; x=1707938638; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lRrpZ4A7adNY9DTQi8mLdXm1HAB9Tl2AxirgbrNvbSc=;
        b=GOhuETTWZYcRsaKpM4iXieN5Wbo7Vq0QyIWW00/0QA34NLpAYJg34PU4KEIC59s69v
         wj1SAWHMLeCrz1RUDpMZhzbsIW6XdwxCT+5FPiPhPNne0uqLilLLyT82nvmNruiv8pBW
         5XADLscm87oiN+4kBC0pFPrdOHwphxoBjHDTKBCt41dhcx+FoEO9OKmuDsIL0vO++tnl
         sfEz+2HwPK5s2N0PmSVVyG5oSv3OKQdPmRTGJ8qnHmtSIGWlG8XNensewXbJ6pQMU9g3
         Hiofs4r4sCNZXium18CO/1G/FC/WTRnnPh5yeHyIur1I4BfUVnfM4DOGVFuagXMeTYZ1
         87Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707333838; x=1707938638;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRrpZ4A7adNY9DTQi8mLdXm1HAB9Tl2AxirgbrNvbSc=;
        b=CM1tvVYY5juv0MId3Pdw0BUJ+dLxblelLXs+YBgDQfwNigMI3RCDfMQQMRjk3tUrwx
         aRlsYehnldtiF9ASFPkpBubS9hkhh843tKadPrsuvejRdg5c9UXOhDMXBQ98eg6PVXAx
         DAljvypQ1YPMUuhCQVv3Unoy/lQ9xLxJZCdeCPDCR7vavvV4f9WK+6XF4XgJIOBZASjW
         TjAlbbWzHpZCYCJif9eEwKWe0CkqWORgRVHmXz1Ek+sz7bPm/US2lqne/DyDDD2DEy0e
         iR6nHoyrfYpyeB68Zg2u6BGzwxgZ6gXPdhUR4nDsDTHO6lMurQlEXr1j0cqTfR5t1ZtI
         aGpw==
X-Forwarded-Encrypted: i=1; AJvYcCVrOcZBed+NdbBEwGQzH/bPVIMC55bfIo2Cx+RcXRMzupMDEtB+uiRcoKyyjiLiNscPcc7rnqr2mJc+ilb7qBGmZcUe2WNwz/m4jH/fAIgQ
X-Gm-Message-State: AOJu0Ywgv2oKsj6jvLO30vsirYEgCGrM+PQYcVbsQWqx8VcKyAIKIUBO
	m84xqJnXfx7MRBlrwWSK3WR0L+z5PeJy4xeJkpdy/hdS4OZtzRsW65U6oxEnc7o=
X-Google-Smtp-Source: AGHT+IHPhabZVoyg+PaGyiXwFczOGRFN7wWZjq42Zif6CdgbYaC7rgdwdLbbO0UEq9gekiEFJ6F9Gw==
X-Received: by 2002:a05:622a:14cd:b0:42c:14c2:bff3 with SMTP id u13-20020a05622a14cd00b0042c14c2bff3mr763674qtx.3.1707333837841;
        Wed, 07 Feb 2024 11:23:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvGkEeWfyuyC+/wI+zPl0SzRwLoYhn+vcYjRxOL1PRJI26g+eg/OzjiDYYNASDYrjSHOsnAEWWc9k0dpxy/7d2fLMV6x0RWHiQgaiJmrhSP5Ed4uDYM+DYKKUW/hEiA6NtLqJ4bvLsAgorZ7hVKBOxGu6IMk7vXZ0bpj45sVLiiB+0ohUpI6qRSLS0r9R6iXEUAXvQZhdPB8lKeGQUfoXko8Ydi/7OugvKnDgx
Received: from [100.64.0.1] ([170.85.8.192])
        by smtp.gmail.com with ESMTPSA id o12-20020ac8428c000000b0042c00beee84sm785444qtl.43.2024.02.07.11.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 11:23:57 -0800 (PST)
Message-ID: <a21e4253-9ef6-4c44-917c-02742440d192@sifive.com>
Date: Wed, 7 Feb 2024 13:23:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes] riscv: Fix arch_tlbbatch_flush() by clearing the
 batch cpumask
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20240130115508.105386-1-alexghiti@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240130115508.105386-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_112359_261291_A35056B6 
X-CRM114-Status: GOOD (  13.07  )
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

Hi Alex,

On 2024-01-30 5:55 AM, Alexandre Ghiti wrote:
> We must clear the cpumask once we have flushed the batch, otherwise cpus
> get accumulated and we end sending IPIs to more cpus than needed.
> 
> Fixes: 54d7431af73e ("riscv: Add support for BATCHED_UNMAP_TLB_FLUSH")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/mm/tlbflush.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 99c3e037f127..c8efc3f87a0f 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -240,4 +240,5 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>  {
>  	__flush_tlb_range(NULL, &batch->cpumask,
>  			  0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
> +	cpumask_clear(&batch->cpumask);
>  }

This patch doesn't apply to fixes -- it looks like it was based on "riscv: Call
secondary mmu notifier when flushing the tlb"[1], which has not been merged and
would go in for-next anyway. Otherwise:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

[1]: https://lore.kernel.org/all/20240124080325.2324462-1-alexghiti@rivosinc.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
