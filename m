Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D714ECCD185
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 19:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LLCZfYF2Bu811HIkXXnfqzoSEd1ukviNvDkMfpY9Av4=; b=nRgFlJVAGkxUKLyxfw7ULFVwsa
	sc2HtNnfMp2DsE/CQJF7Cuw0M0bBCns+cEmE6MM/wKDxBIADXp0mEkAj/yOQt8JaGfDxI9vaFCQpo
	3DRlV5/X1t5a2XPTrUfcNUEcpuHW4VvlLcaxVzolbwoKNlF3pXzWFr2IpP0eWZyQlUH7O4n+cTWd/
	0gZvq8jjISCNMAryovlnrIAJbog2QT+u5A/iAoVHWojje3+IMzM8RbWFCxCQSZz57bscCsBGQWXpS
	PrSsN+jYJLlWDpKhaD5B/FZH3D/jczAqP0PNzIXFa8rR+dEEnPpN2ftQEB9KlRwNJxOPGySJYV/r3
	/Vkxv6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7JD0-00000009H1A-3YQj;
	Fri, 10 Oct 2025 19:55:22 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7JCx-00000009H0l-43TQ
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 19:55:21 +0000
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B2D0B3F855
	for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 19:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1760126114;
	bh=kPhA/oNdZoYVHAUf6Erq79uJcMcXf1/DDMPMdaotDWc=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=i7QtjhtDDDMyUzT0k9YybFFk4K9MHOcnmTAcstEnRpga5gtMVMbCUSDlLEq+eUhqJ
	 5XQs+Wzu08h9HHpsIaoBx9RyIBnQmfEqdiswLx1tQe8Fh3hUKDyHn4kgLdx34iNOYd
	 4sREcbUAvIGp1Q5/UQLoDscAkr88ILh3H8F8QhCMG2VmXvJBR6q2LPNEZqiIETnW1m
	 p8gCpO4q7QNq59dSSstPgEt5mM5nJMXid+OdX/c7IbSfVs2zFWxm6oU0Duqg8g+fO8
	 Xts00WvyiD/tOMfGFpwuHM3cKfyRZKYokrdWS7OINvuN20mri60o1Vu1m0rNOdnJmJ
	 jORswfSkjfX2SvtAKo2d9GMmjwcL/g96QaJHsKgt8bK6IUZHYgqCCPmoKP+kIMcN2q
	 aM5I3N5CBgFntyBuwwfpDBREanOD0BSCme1qS31GGNdnATQ48O04Mnrnt3muTqF0cM
	 zzkR8iioGvqRILvj0qY+p3creBeGqfhrF8MjKBLbVUH7jRJrsAvbTgKEGHCA0Ll2jQ
	 x65016tuyIbY/08hljj7SME88bxxODGwWvCUcjXd3sSrGxkM8ICfjREJ2MMFHGTB0y
	 yhxbaSDwJmNg67tDsOTl1eNsMTP3jMnC//LnV1k5DzajF5lGyNPTTmNeUicFkvfrzB
	 iIGjMlvVta1eEmPjJgjxYa8A=
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5a265e0ed8cso2088518137.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 12:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760126113; x=1760730913;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPhA/oNdZoYVHAUf6Erq79uJcMcXf1/DDMPMdaotDWc=;
        b=GM69pH4suPUlS+TW6DuJHkCAEIifUMy1/hWjkNAhMuXy18pT0AEeWMNHXH9RI+rsP0
         xR0Tsq6ZW+dnZtx751ZM2Xd0P/WYAgAFNSiIFt/ZOLdZEZu9Gf7b5IiNdH10bDD4FV59
         X4ik51K36xjD114mpSoHtiINUzdd+xMPEjgaQwAU/XGT0eZQBaXcxWEBLDzNOnV6OXf4
         MYeo3hc4/dSg3gQrlKN0UDSJQ6IslDHxrdTa5b596N5fSwb2aBFaKANaCxC8rLOnH4+d
         50tAXTT0qmknvT34y9rUYnZixlupk8qfYKv1TPO+uiXTdBsg3MO9jOAhJ2hJvMSYUaTG
         aADQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2x+Q/AlLtXbR7UO4SVln/op8Fba+7bbldirjF+sQRg0svQ3DF/JBA7rO1njaO8a0JiOtfB9PU4Aj7+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLE/TWN7TSm1HkFuh73/NpMFZijAwR5oUftxMZLh20DLIoYjYH
	OjBw8ShDuI+T5/2JM/qYJjnGsAQdCJdfxkOSF2u3BIhVLbH/qopT4nlaDTx3ZQjcbx+nR+a7lCy
	H4rNe8ZlLpOQXDUTXNTnDBPPmFxBoLvWMp5KBh7bp+j2c/IUN5PXHwaWc8Ogig5Oqyy6QQMUFkH
	ch1io5utQTOsUsoVD2cIb6XkrMoNOO1QPqHsUzYnB3+uKIJ9FRBVbwlg8QpFaT
X-Gm-Gg: ASbGnctIOcQnigj9qsNKBFLnFJL59ZQ4qR6F/KPszPDv7I/4zj418bwg71C9nOrYf6A
	TcsYz0All7Ad6cHOd+tBmNPlOD20PGAoWQjvuunOPeM4ZqFyFojxjHWb7UTGzIcsmconvMIdUme
	U/RI4I2jTq2XEEDk9Ye2A=
X-Received: by 2002:a05:6102:162c:b0:5d5:f6ae:74b4 with SMTP id ada2fe7eead31-5d5f6ae7587mr2959679137.40.1760126113206;
        Fri, 10 Oct 2025 12:55:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl7uSNVMd1/CraY5eNdtkJsmXLfjZq71soXKG1D0wdaThXC8TnpM49Ya9Dq+mRSUiBMq5+qPE5yVu6PxXKKHU=
X-Received: by 2002:a05:6102:162c:b0:5d5:f6ae:74b4 with SMTP id
 ada2fe7eead31-5d5f6ae7587mr2959658137.40.1760126112724; Fri, 10 Oct 2025
 12:55:12 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Oct 2025 14:55:12 -0500
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Oct 2025 14:55:12 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <178f4daf-c752-457b-8f0c-c6273f3a63dd@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
 <20251009015839.3460231-17-samuel.holland@sifive.com> <CAJM55Z9kRpc53s3Kip=U-CcDxAX0UZD5AbTBy_owU8xPEYH5MA@mail.gmail.com>
 <6fa3c728-5048-4d26-9b6f-21757320caad@sifive.com> <CAJM55Z8masgGn4vVe_2g1e9WXnLu0Vf5oGxbiniGpsbOhYPLRw@mail.gmail.com>
 <178f4daf-c752-457b-8f0c-c6273f3a63dd@sifive.com>
Mime-Version: 1.0
Date: Fri, 10 Oct 2025 14:55:12 -0500
X-Gm-Features: AS18NWAlCRC7l99R73r3woSIp-vlQ76Jq27BWW9v6hsv7x0ENpHaGmY-XmjOCps
Message-ID: <CAJM55Z_wOkC767T1p749aVzAL5uQD5Lw6D6eqHb9wp-f=nAO0g@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] riscv: mm: Use physical memory aliases to apply PMAs
To: Samuel Holland <samuel.holland@sifive.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Emil Renner Berthing <kernel@esmil.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_125520_266051_27D54538 
X-CRM114-Status: GOOD (  23.71  )
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

Samuel Holland wrote:
> On 2025-10-10 12:04 PM, Emil Renner Berthing wrote:
> > Samuel Holland wrote:
> >> Hi Emil,
> >>
> >> Thanks for testing!
> >>
> >> On 2025-10-10 10:06 AM, Emil Renner Berthing wrote:
> >>> Samuel Holland wrote:
> > [ .. ]
> >>>> +
> >>>> +void __init riscv_init_memory_alias(void)
> >>>> +{
> >>>> +	int na = of_n_addr_cells(of_root);
> >>>> +	int ns = of_n_size_cells(of_root);
> >>>> +	int nc = na + ns + 2;
> >>>> +	const __be32 *prop;
> >>>> +	int pairs = 0;
> >>>> +	int len;
> >>>> +
> >>>> +	prop = of_get_property(of_root, "riscv,physical-memory-regions", &len);
> >>>> +	if (!prop)
> >>>> +		return;
> >>>> +
> >>>> +	len /= sizeof(__be32);
> >>>> +	for (int i = 0; len >= nc; i++, prop += nc, len -= nc) {
> >>>> +		unsigned long base = of_read_ulong(prop, na);
> >>>> +		unsigned long size = of_read_ulong(prop + na, ns);
> >>>> +		unsigned long flags = be32_to_cpup(prop + na + ns);
> >>>> +		struct memory_alias_pair *pair;
> >>>> +		int alias;
> >>>> +
> >>>> +		/* We only care about non-coherent memory. */
> >>>> +		if ((flags & PMA_ORDER_MASK) != PMA_ORDER_MEMORY || (flags & PMA_COHERENT))
> >>>> +			continue;
> >>>> +
> >>>> +		/* The cacheable alias must be usable memory. */
> >>>> +		if ((flags & PMA_CACHEABLE) &&
> >>>> +		    !memblock_overlaps_region(&memblock.memory, base, size))
> >>>> +			continue;
> >>>> +
> >>>> +		alias = FIELD_GET(PMR_ALIAS_MASK, flags);
> >>>> +		if (alias) {
> >>>> +			pair = NULL;
> >>>> +			for (int j = 0; j < pairs; j++) {
> >>>> +				if (alias == memory_alias_pairs[j].index) {
> >>>> +					pair = &memory_alias_pairs[j];
> >>>> +					break;
> >>>> +				}
> >>>> +			}
> >>>> +			if (!pair)
> >>>> +				continue;
> >>>> +		} else {
> >>>> +			/* Leave room for the null sentinel. */
> >>>> +			if (pairs == ARRAY_SIZE(memory_alias_pairs) - 1)
> >>>> +				continue;
> >>>> +			pair = &memory_alias_pairs[pairs++];
> >>>> +			pair->index = i;
> >>>
> >>> I think this needs to be pair->index = i + 1, so PMA_ALIAS(1) can refer to the
> >>> first entry (i = 0).
> >>
> >> The code here is as intended. It's the PMA_ALIAS(1) in the DT that I should have
> >> changed to PMA_ALIAS(0) after I removed the special first entry from the
> >> riscv,physical-memory-regions property. Patch 18 also needs this fix.
> >
> > Hmm.. that doesn't quite work for me though. Then the "if (alias)" above won't
> > trigger with PMR_ALIAS(0) right?
>
> Yes, you're right. My fault for trying to be clever last time, where the special
> first entry meant PMR_ALIAS(0) would never be used. (And for not testing with
> the same DT as I sent, since EIC7700 needs downstream DT changes to integrate
> noncoherent peripherals.)
>
> For v3, I plan to make PMR_ALIAS(0) set a flag so it will be distinct from lack
> of PMR_ALIAS, and keep the indexes zero-based. For now, you should be able to
> test by keeping PMR_ALIAS(1) and adding a dummy entry at the beginning (for
> example by copying the first entry).

Great that also works. To be clear the JH7100 also boots with the pair->index =
i + 1 solution above.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
