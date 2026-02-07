Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8308EE0AF3
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7BsrZRPzmOP1FR68PUe46MqohM+d1eqWj5M8AiPXgo=; b=PgD1CdvBn/A8Gk
	eu4XPO/SIKgkEnKF6vnhm6rTp9IJuNpN24JZHKktGesAlI6mKiLG/k/Xdp3G++BmxmN1W5Fg7uyRL
	K/ugeQRcoaUwhEo8uiMg1SqiTZCKAgEpwOFrPfs73ZJ0BiRfjSc14/tjAHa/P5feTWkGoauBOFwMZ
	FNBuSWDL9SctS30aMVGe/8/5EDmaOnnrSAXcz+1Isocot0PVOoR4EsCKVBM4AvI7HIldGiQOw39OC
	8Y8ra5XHEOuJo/sjdJ/n5zJBy62YwGuX4QeqRWknGcYVV1BjhsCmOdnyet+KTUP3EI9M68om1RIH0
	NbSspUR8kRc8Yn8POBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voomp-0000000CkSA-27Tw;
	Sat, 07 Feb 2026 20:20:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voomm-0000000CkRe-2cfI
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 20:20:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4833115090dso4632445e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 12:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770495607; x=1771100407; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CLN/nBgZu1TXV2x2w92nD7nqppwuTNa2tEtzd/B9Hg=;
        b=kYGIaQrayja3B+Bs46rj/bgoxCkz6KYmQv45Oyjvg7NkQooKiwcqNY3lF1IoNxJXTo
         kUAVZjkSBatnoFVFg95JYuBvqy5jsVGP66iUl3xRbS/XFW4L7wCcABn8kIfGLXGhfV7G
         kI9BboQ5yduLbjPdeNmGwEZW8qcqhxy8zpBlIou9oGLHAP9kCR/f0vXOm5udvjHzLVF/
         5raZxzCnK2mARrBdJS5WJwxxqli+2Cor39eAkS4ACMCe9wRfKS/jhrqCl1RqpPzG3p9B
         g7ke/MVFb49iZvnrTnT3IYhJysqnHo8XEt2i/FAPkbmxaehTp5jgDRGoa1HIaGMXkbvF
         GS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770495607; x=1771100407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CLN/nBgZu1TXV2x2w92nD7nqppwuTNa2tEtzd/B9Hg=;
        b=hS8JDCst8N9c5EItBYMewy9M8I6zpjO/4+kFo2fLM1n/p2U04ffD4T7HB3ZsNQxxzP
         dPVucrecO92AtQd3A53BrZv1X8B9ub//IbyAQUCXJD3fmbP5p8cQcAZWYJrNBHgnVZVx
         +sOhB3iVBRL5eo+uDsoRVAFfoA7hUxbmdykUmB15iFBoANutxwB5/f6LaM/SlIuhNILE
         Sp51bAJOjjumvGi2spxQybUySbVkTGAQ3SnPfMogFmF1XP2dY4z33WPoRRTn0CWEaMLC
         fYrSUMf/8HCJbinTQtlVD5dG91+TTfik4qnnc2ILLcO2dcFgOu8frhhHBEyX+U5Mk5uZ
         Vgrg==
X-Forwarded-Encrypted: i=1; AJvYcCUUoC0pv8M4wclFLSCg+X0959QPzN7AYqn5sZOlN7JYM+jQDZCBaifBqaRrN7RwuOlMsGZt+ICTZhAO1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwBo51CL/Hf5sPVZpFm9ukFV8pMEa5YC5bmpFjXNnItTkAKjtA
	hPtj10m9hJfrOqCukmWIhfPB6ssKjlHI0xsX/qm3FjIueOAo2WDLVjtN
X-Gm-Gg: AZuq6aIvXwnqiSwzgS81tLJXY0UNXshN4D8J7NxkOGqPjnwuXc/lnem+K+vACVdxVbU
	/5BnGmO8ElorqVrdQ2rRFWx+LUz9O+kLYG0ENa052ukfdLfnfirlPn+LiS/UMnB5kKrFclpqzae
	Imc4FZ2EwG8I0JKRB31OWCT7WcTDPwwncFbCuKs2uJUZ2FQV9Dxn/bQdDPC+b0l0SseiYMCmXzx
	Tm0rbqpVKTRuAV49cQOQlxmgvYPptqkpODnl9jj5xsZBdfnYJyHYKFIKqCcIwEKQSYpir96jhkn
	ofnqKUqsm5LCucTswfg1Rt2Jw7zaWH1Fr16/ysDZvnH5iR7NY/OmzO9P21nLQCo26Q0SdB1qbaV
	6ROjXKG/HbD75P6wmebebNkM3uDjYK+A5qKpaCBp3Tj4/G6ux5+166k2brq2vKZmTacUDMH7JXb
	Gh+QdV2Um4WftyBvVdB38DtefEWpENm/DI9uL6xsagpu11fe4kqvK4FNUQS++TUavHyPpXW41WB
	u0nFv9/PXdMk+s=
X-Received: by 2002:a05:600c:548d:b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-483201ecd90mr108547085e9.13.1770495606497;
        Sat, 07 Feb 2026 12:20:06 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e752:9400:18cf:c773:ee86:c436? ([2a02:6b6f:e752:9400:18cf:c773:ee86:c436])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483209cfd77sm51750705e9.14.2026.02.07.12.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 12:20:05 -0800 (PST)
Message-ID: <f4e66e8d-d285-4362-8bc9-fef00f2f624d@gmail.com>
Date: Sat, 7 Feb 2026 20:20:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 01/17] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
Content-Language: en-GB
To: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 "David Hildenbrand (Red Hat)" <david@kernel.org>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-2-kas@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20260202155634.650837-2-kas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_122008_691465_AA9A5E61 
X-CRM114-Status: UNSURE (   6.03  )
X-CRM114-Notice: Please train this message.
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



On 02/02/2026 15:56, Kiryl Shutsemau wrote:
> Move MAX_FOLIO_ORDER definition from mm.h to mmzone.h.
> 
> This is preparation for adding the vmemmap_tails array to struct
> pglist_data, which requires MAX_FOLIO_ORDER to be available in mmzone.h.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Acked-by: Muchun Song <muchun.song@linux.dev>

Acked-by: Usama Arif <usamaarif642@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
