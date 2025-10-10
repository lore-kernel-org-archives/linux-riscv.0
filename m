Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C47CCD185
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 18:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNc66W5hICDjtfg5u4+hDCex4vULH1VMP2W1aexT9ZI=; b=dRtSBGnRrPmin8
	jqtt+nN2tJlaDjVjW8o65XsfsbW3piWH7v6xOu02qV7S43xXLRRK523+1PRiJbcEAu014yQRmdHsW
	+gZVFxZlV12zDslZ5rnDG0elrfqi8S5qcXrFXbFddJyICK+SnXWAnS0O0HtAjj6S2p2Easub5t9WC
	7qypAY43OzhxFDtj/g8ZC2XbTa22dZON3hmuQf7OQIThRIaAsTHP1NinzmoDpGpKwIEQ3FCtQ/Dyy
	Fc4zzgO7/70y33nRTY7wsDaqSkPj4iwl4xxDZt2ydSvchvJkyTVyDElRWKv3/vqs767FWgyc7Ptvn
	Z5KdtjT2KKvrl7RZiZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HQy-000000097VE-30dj;
	Fri, 10 Oct 2025 18:01:40 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HQw-000000097Ur-2hYS
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 18:01:40 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-93e2d42d9b4so19433539f.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 11:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760119297; x=1760724097; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LcZRKSK4PXETXkF9exJHZznRCpFqtWz78yHtguUg1Eg=;
        b=gnUWpVeCCdcXmlaafAdFpu+eOkKqMSSC9TselwwvAtrgtueCMlFfdbUPflC+HTrAH9
         BH6A3Y2ZiGrS3NMXEphlfkKDludL4oqkCSNNJHtV+IsMbKP0Zjq2cbLi9LzN18dEwC0r
         mADfwP5RwGTcQhyWN3HbTqe73UaR6PpFj4XI17jD33meMi35MuFYKeBCaUO4y0RFav1k
         lDx2PZaAn7SaB207Y9j7igt9PQbY/9yclcUgxh+xinlVjp6unkyIyxN1J4hKb3BFeqY+
         MAwbZTEEscESO0d3pBC77ITnGTocnyOiZo5Aldl7JPhRZ6uL+jNZA5pp6QLwqISaUv6b
         tzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760119297; x=1760724097;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LcZRKSK4PXETXkF9exJHZznRCpFqtWz78yHtguUg1Eg=;
        b=o2AGLRSPsduhvRwml4dhe6yrnS+qc7Z2+85kgJz5JdInInNhhaXpfnOJB3r1p4HXyD
         vRbyr2//J2O20mqIY3XED2a1HHsd0bdSYU4xIQIliFS/dnSPj6ghLo0iq2WWcHsJAnbJ
         p4txvfWcn/UFftzteC2ik+zaDTobyb1sURotU9Qqvx04SQa6IpZ8n5kRGeOLDxSorOMR
         ZaI+yZEA+dBlgLMsFW3S+D5osD7pLKUrE8fedq5szkR/7/D3ALWYcBfumrkRJRAsTQ5t
         CLBAkaqnkumANgxwAFJAHa4DxVF/tZ7Z32MdSq//DITuga7i8lIYo2M0w1kIlyL3R5J0
         uYAA==
X-Forwarded-Encrypted: i=1; AJvYcCXM9XLToxNKAm4y+vkVJdCNr014iwp0NjOw/ZTPmfB+05VFIqdLmWh+nnMZ9kcYazrjHd6zZAmP7oqNvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeUGpFO0/ZQgu8uWxd5mjscURw7Yne3+/trDZ5g1GlTn2voAZX
	Ttm007zpIRZRyxOax94NWEa+pcwPSEY536T/aE5C6xgbRhp4/vaNdPGlg3vUi8uzSVQ=
X-Gm-Gg: ASbGncu7a6NtdqbE8CbwP6ZVRQdHMPnQ35rBPuPGNYtMbg2WWBL3sV9U5pMRlGshGqR
	UFRBpaq+ixqo41SeAf4bzUIFNZCEoArs1Qwe4ADpzymLRQ8QwcB+u0dcD/GthjY3O4f16KnQMGN
	nOUd0L5j7Jfv9J8u26EW+whmSvBxxqx5KgO6zyJCddmHUHICY1vy0BpTHrwKszudlkcUJ6cA6CP
	PEnCXYiTvRx9Hl5kCUxxqipOj2KuNTEZB25vLE+eZ6R+QH6ZMFk9eB5yZjqXh9C2VywnSQpyniu
	/t6+HvFcQT6Jm4pzBLeaMxWNOhbVKHgkdd28jxAkMRXAtkn5gKGa3Yo+Cvuwjikrzl8f6eFK2eI
	jE5+3umstCokC/ini9Ahc7LrI4QtRGYabUY00s3QEoPGQXzSqyqYtsGcaOA==
X-Google-Smtp-Source: AGHT+IEBjqYLg0XLwORZyVN3qQnBYBCNWqLCOzyqFwj64pAzvRZBLWpl1DIWXO+pr6Q6ErFNviLU5w==
X-Received: by 2002:a05:6602:b91:b0:93b:c3cf:9873 with SMTP id ca18e2360f4ac-93bd17ec199mr1511233839f.8.1760119297356;
        Fri, 10 Oct 2025 11:01:37 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e25a95cbbsm116859739f.22.2025.10.10.11.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 11:01:36 -0700 (PDT)
Message-ID: <178f4daf-c752-457b-8f0c-c6273f3a63dd@sifive.com>
Date: Fri, 10 Oct 2025 13:01:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/18] riscv: mm: Use physical memory aliases to apply
 PMAs
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Conor Dooley <conor@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>,
 Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
 <20251009015839.3460231-17-samuel.holland@sifive.com>
 <CAJM55Z9kRpc53s3Kip=U-CcDxAX0UZD5AbTBy_owU8xPEYH5MA@mail.gmail.com>
 <6fa3c728-5048-4d26-9b6f-21757320caad@sifive.com>
 <CAJM55Z8masgGn4vVe_2g1e9WXnLu0Vf5oGxbiniGpsbOhYPLRw@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAJM55Z8masgGn4vVe_2g1e9WXnLu0Vf5oGxbiniGpsbOhYPLRw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_110138_914183_736316BF 
X-CRM114-Status: GOOD (  18.73  )
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

On 2025-10-10 12:04 PM, Emil Renner Berthing wrote:
> Samuel Holland wrote:
>> Hi Emil,
>>
>> Thanks for testing!
>>
>> On 2025-10-10 10:06 AM, Emil Renner Berthing wrote:
>>> Samuel Holland wrote:
> [ .. ]
>>>> +
>>>> +void __init riscv_init_memory_alias(void)
>>>> +{
>>>> +	int na = of_n_addr_cells(of_root);
>>>> +	int ns = of_n_size_cells(of_root);
>>>> +	int nc = na + ns + 2;
>>>> +	const __be32 *prop;
>>>> +	int pairs = 0;
>>>> +	int len;
>>>> +
>>>> +	prop = of_get_property(of_root, "riscv,physical-memory-regions", &len);
>>>> +	if (!prop)
>>>> +		return;
>>>> +
>>>> +	len /= sizeof(__be32);
>>>> +	for (int i = 0; len >= nc; i++, prop += nc, len -= nc) {
>>>> +		unsigned long base = of_read_ulong(prop, na);
>>>> +		unsigned long size = of_read_ulong(prop + na, ns);
>>>> +		unsigned long flags = be32_to_cpup(prop + na + ns);
>>>> +		struct memory_alias_pair *pair;
>>>> +		int alias;
>>>> +
>>>> +		/* We only care about non-coherent memory. */
>>>> +		if ((flags & PMA_ORDER_MASK) != PMA_ORDER_MEMORY || (flags & PMA_COHERENT))
>>>> +			continue;
>>>> +
>>>> +		/* The cacheable alias must be usable memory. */
>>>> +		if ((flags & PMA_CACHEABLE) &&
>>>> +		    !memblock_overlaps_region(&memblock.memory, base, size))
>>>> +			continue;
>>>> +
>>>> +		alias = FIELD_GET(PMR_ALIAS_MASK, flags);
>>>> +		if (alias) {
>>>> +			pair = NULL;
>>>> +			for (int j = 0; j < pairs; j++) {
>>>> +				if (alias == memory_alias_pairs[j].index) {
>>>> +					pair = &memory_alias_pairs[j];
>>>> +					break;
>>>> +				}
>>>> +			}
>>>> +			if (!pair)
>>>> +				continue;
>>>> +		} else {
>>>> +			/* Leave room for the null sentinel. */
>>>> +			if (pairs == ARRAY_SIZE(memory_alias_pairs) - 1)
>>>> +				continue;
>>>> +			pair = &memory_alias_pairs[pairs++];
>>>> +			pair->index = i;
>>>
>>> I think this needs to be pair->index = i + 1, so PMA_ALIAS(1) can refer to the
>>> first entry (i = 0).
>>
>> The code here is as intended. It's the PMA_ALIAS(1) in the DT that I should have
>> changed to PMA_ALIAS(0) after I removed the special first entry from the
>> riscv,physical-memory-regions property. Patch 18 also needs this fix.
> 
> Hmm.. that doesn't quite work for me though. Then the "if (alias)" above won't
> trigger with PMR_ALIAS(0) right?

Yes, you're right. My fault for trying to be clever last time, where the special
first entry meant PMR_ALIAS(0) would never be used. (And for not testing with
the same DT as I sent, since EIC7700 needs downstream DT changes to integrate
noncoherent peripherals.)

For v3, I plan to make PMR_ALIAS(0) set a flag so it will be distinct from lack
of PMR_ALIAS, and keep the indexes zero-based. For now, you should be able to
test by keeping PMR_ALIAS(1) and adding a dummy entry at the beginning (for
example by copying the first entry).

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
