Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840E3CCD185
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 17:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7zQ7RVUnITHilSvYIn2sg9SZbzjLW6q6yS7W9JmoQJU=; b=TPmDVJcimlQyWceOjpW4O/+/Gs
	td87seM4xmZw/5iM4a3LIBSKZ9cIBo9k6hG+Q8EgRn/kIF4fyM1nh5e2h6RbjBsTKGBtrGcV1MalX
	0y5Ndjn82HgYfqTByRQTgsJ8TIkaKXZn3FxV/3vYtMU5FB8Dcpu9My+KMtG7fwefZtw5+c/TLaWfE
	VRvgoS8BTGjh1fwU9jgcqxU6hxRpBkftGtlAbYXqN/sGW3Qwp0Y1tBYuxeY9W8pgamtxz+9Gm/n/2
	JwvVSsZ6rsYzLhpxQ1kAtc9hpW7mGnD1iOiLd2Osfd6iRT3bQhRZAe3rx0aicBoFOPZC+cq2MeQL9
	9RPbSOfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GXY-00000009239-2CSE;
	Fri, 10 Oct 2025 17:04:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GXX-0000000922z-2t9s
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 Oct 2025 17:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:Mime-Version:References:In-Reply-To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VMMsbHNHQlUNowhauDzTqGTgCrfFH9KMpRorSuBG4rw=; b=AjT93O+NnwHJ51K14xygw3sfeI
	HESBGycexfIcusVQLjZECw3J4ooSBgFo1uzhbfY6eSJ1vGlC5W4NjKzaDq4/l/uo2Bdupvxp5Hymx
	uX5FZV/QMGM7hYE++tH+FyGQoFsgRVOcICwPoNownpXGcYriAkciYJelqQJCTD+OD8X1LQF/8xTQz
	8F6d7UwtpxvLwiGLjcvRRkmV4BWBGAI3qp7cArMY/dyw+4Y6UulMZZG3mIvzVrWE2pknn76fP7CX+
	Fr4LUimsgexiNH5HQ69xXHOQ80NXz4/qIfbDjmPHbKSKmQOPPlLOpbR2rL0deoTvZLkV4pwOYPR8H
	huEe7trw==;
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GXU-00000002JtD-0oOd
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 17:04:22 +0000
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 87EFF3F7D9
	for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1760115856;
	bh=VMMsbHNHQlUNowhauDzTqGTgCrfFH9KMpRorSuBG4rw=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=a5tk1Q2RFaKBve0xxBdEkKrQx3U5MDUNvrGH502dzk8UGJhQQtCi9eyBtTm6/ltQZ
	 Ee6kr74mZQtlNI2T9RlMspwFt3k+0S/WWhcj9F+rrPw9VunASwIQgfCYdyC7GQfzm3
	 q3+Zp7w5A3R7lym7eFcP3fp5EBJk0X60/MbUC4+G6+c+WCQZTAmrBSZB+/yoXigstf
	 rIV5ymr1lAxAQezrkKMj59Ma16tGIVR+zlqDXa/IWF8MmhWLbLy3uBALYGiiFx/7so
	 pmvCv067n5T2SB2ZuajhOORM4EkgyXRvReHRfrXjwV1BQJ+PKjDNHUECcLRVG7Q6El
	 TV+prLnDLTFApbxNu6TnGLtiZQBzzk1E8+DzS6KpsZyFXNxw3iPrP3smWYJ8CB1gtO
	 hSf7OoI+Xw2p8nbgzMMl/WZkTvpUlcEtirr3OvgHvgK7dYnCA0onesc38kJ1SLlNOm
	 VYoRXhugTWGZvvl4H7148iRjvtF38le1M26QenW7of6XlFmerUAxvBjOjwuWNCX8r9
	 bNQMRiZQmNJE7ucwL33d6N4IBRjgQewqPzsuKdlAAZVatPRDQ50m4aUSs9F9+9N0ev
	 fW2CfFwegOvotML7ymBMVt954ep+A2QRm0nRjfDAoTWELN8JVNTnADMQvKMzt4zonf
	 J+U7y+w399nIyjf49EdIfiIY=
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-92eb7ac6c06so5067100241.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 10:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760115855; x=1760720655;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMMsbHNHQlUNowhauDzTqGTgCrfFH9KMpRorSuBG4rw=;
        b=pJ04FwYrgqogM/EKqbeNSlt4E27Qq9Lmm8b3NnH7lk/syvNgnt3Npfr+IpMeSt0sUU
         EYucf/7bwpU+IVg/AzXit8ff2l0kJQMpxV0sfCkmwipWNXiebVrdESO4s84l6K5AA3wc
         qgmTLV1SeWqia/py1pa2PVv/jLH+OopU2UMurMQT9ofRMEh7FxRfQVSl9lXoxAi3U3UC
         /K7LinVA3lNfSQ2A8YwH1fNQInJAx7oRgYZkU+Xumo2ntx+Sf8Q01cV4BDkhWbpSAv0w
         rYitWNLl2ZOXOVi4GiE2nVUQCCPVABl8P8Z/dXvL0iuI+aW2mZ3ZiC4L4UEzeVSyrAla
         J+iA==
X-Forwarded-Encrypted: i=1; AJvYcCWTYv7G+aLOnjduzYlyDTLUzCiXJmlMkEqfm2Mx8ouf6dUyWjxzQNUjd1qvm1nTT4Tx2dh97ZI4zmhBJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoiabW1h7Nlcbg/jgonBO4F6iPemdGAps4wkSuyl/pKiBNvIeE
	dg9FP7NSHNdhGHCAor239Eq7v8WZ4Oz9+gSsVMmvF0BqA5Rx80+Om5lLQmaWbhSrPRroiP4C0xC
	/QWIqBjxZo3U5YWF/TbnBvSuH4BFQIIP3c8AwLzPC/rgQBNr/ixItJym57dEj3upWJ+Vo5/3E+j
	EzPk4sgG1A/j4/N1jHm/D/u4Pc4O868oeVaYIZivGCCi10/sakUKjOURaUqOqEg3a/ruJe
X-Gm-Gg: ASbGncs5R1vVmCnJEV/5PluAXqAhzQkUKv2RJbluCB1QVuBwbXsyy4iTXWVdkGBo8nU
	iK0Q3Wl9QYO8RS5jesnomYyxLGingwwxlAooXHpBS64PB7r6+a0riugX2XVHz1Qa1z5gjwJ1AL4
	gJob4Z5d926+9ROE9j4Rc=
X-Received: by 2002:a05:6102:3310:b0:555:56e0:f357 with SMTP id ada2fe7eead31-5d5e2351acamr6103884137.23.1760115853736;
        Fri, 10 Oct 2025 10:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBv28DNHJQ5jnD7uIITRjtmxvXAZjjFTFMwrxw+yeFjdrVbwveu4Y97WaEPytCYr30o/zb78JpBxe+rPRUAWY=
X-Received: by 2002:a05:6102:3310:b0:555:56e0:f357 with SMTP id
 ada2fe7eead31-5d5e2351acamr6103795137.23.1760115853023; Fri, 10 Oct 2025
 10:04:13 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Oct 2025 10:04:12 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Oct 2025 10:04:11 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <6fa3c728-5048-4d26-9b6f-21757320caad@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
 <20251009015839.3460231-17-samuel.holland@sifive.com> <CAJM55Z9kRpc53s3Kip=U-CcDxAX0UZD5AbTBy_owU8xPEYH5MA@mail.gmail.com>
 <6fa3c728-5048-4d26-9b6f-21757320caad@sifive.com>
Mime-Version: 1.0
Date: Fri, 10 Oct 2025 10:04:11 -0700
X-Gm-Features: AS18NWCTcud7R14NP1QO40mHS3XWKKbNmY-Wviavp42FX96J5d0QmbVlv50GxHg
Message-ID: <CAJM55Z8masgGn4vVe_2g1e9WXnLu0Vf5oGxbiniGpsbOhYPLRw@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] riscv: mm: Use physical memory aliases to apply PMAs
To: Samuel Holland <samuel.holland@sifive.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Emil Renner Berthing <kernel@esmil.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_180420_428299_187D6499 
X-CRM114-Status: GOOD (  18.63  )
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
> Hi Emil,
>
> Thanks for testing!
>
> On 2025-10-10 10:06 AM, Emil Renner Berthing wrote:
> > Samuel Holland wrote:
[ .. ]
> >> +
> >> +void __init riscv_init_memory_alias(void)
> >> +{
> >> +	int na = of_n_addr_cells(of_root);
> >> +	int ns = of_n_size_cells(of_root);
> >> +	int nc = na + ns + 2;
> >> +	const __be32 *prop;
> >> +	int pairs = 0;
> >> +	int len;
> >> +
> >> +	prop = of_get_property(of_root, "riscv,physical-memory-regions", &len);
> >> +	if (!prop)
> >> +		return;
> >> +
> >> +	len /= sizeof(__be32);
> >> +	for (int i = 0; len >= nc; i++, prop += nc, len -= nc) {
> >> +		unsigned long base = of_read_ulong(prop, na);
> >> +		unsigned long size = of_read_ulong(prop + na, ns);
> >> +		unsigned long flags = be32_to_cpup(prop + na + ns);
> >> +		struct memory_alias_pair *pair;
> >> +		int alias;
> >> +
> >> +		/* We only care about non-coherent memory. */
> >> +		if ((flags & PMA_ORDER_MASK) != PMA_ORDER_MEMORY || (flags & PMA_COHERENT))
> >> +			continue;
> >> +
> >> +		/* The cacheable alias must be usable memory. */
> >> +		if ((flags & PMA_CACHEABLE) &&
> >> +		    !memblock_overlaps_region(&memblock.memory, base, size))
> >> +			continue;
> >> +
> >> +		alias = FIELD_GET(PMR_ALIAS_MASK, flags);
> >> +		if (alias) {
> >> +			pair = NULL;
> >> +			for (int j = 0; j < pairs; j++) {
> >> +				if (alias == memory_alias_pairs[j].index) {
> >> +					pair = &memory_alias_pairs[j];
> >> +					break;
> >> +				}
> >> +			}
> >> +			if (!pair)
> >> +				continue;
> >> +		} else {
> >> +			/* Leave room for the null sentinel. */
> >> +			if (pairs == ARRAY_SIZE(memory_alias_pairs) - 1)
> >> +				continue;
> >> +			pair = &memory_alias_pairs[pairs++];
> >> +			pair->index = i;
> >
> > I think this needs to be pair->index = i + 1, so PMA_ALIAS(1) can refer to the
> > first entry (i = 0).
>
> The code here is as intended. It's the PMA_ALIAS(1) in the DT that I should have
> changed to PMA_ALIAS(0) after I removed the special first entry from the
> riscv,physical-memory-regions property. Patch 18 also needs this fix.

Hmm.. that doesn't quite work for me though. Then the "if (alias)" above won't
trigger with PMR_ALIAS(0) right?

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
