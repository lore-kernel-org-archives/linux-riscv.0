Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5358C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 11:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+c4DnTs96xBs7T6VCGEHkW52AVxiTrB7bvdLRSqdqP8=; b=Lxvn1n/xZ3JcOsIZS4aYea78h4
	xnmscEre8RM0VV1krsXpmPyzgwc4hZdq1ejBzT+rx3AcXeCndyx4xy138ZuBhuzpV7AdXP2fQ1qyr
	Yi4eA70pFacHckomc+C6o61BrYNFoCqX6pBbGvJzm+Balqy4VJYNjFYyBVom3p7Tx8MdvVTubbPY+
	wwMCLG8c7NMlN+qh/GttEx5TCLYC7pfbKNKyQ56voMBcl2L8bVZLIluJ9tLAdNXTF/CP0ZGuSCjBt
	L3juQdAsltUjhBGj5TKOcz6s9LSebm2z5dFj6YRDwDKRkedMoFoFDjBCGLkgE1un5f8CHBmVu7EDv
	gSNlzZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sben0-00000004rSu-0StE;
	Wed, 07 Aug 2024 11:25:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbemw-00000004rRe-41T4
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 11:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723029906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kUmg6m+rX0ZdRF47MclkDhoxeaVkz+iC7VCa9/iV6Vw=;
	b=WV9Jw0cQosa9Xfj1zNSZ02DQ67xfXnYQKxRHnnmfrAmaDbqZnKmFc2H/k7y6l7rm0Qit26
	OJacTNeLEt9xzV17k8K62oSRo1p1WFJ4Ryh/v1KbWIVeqkEGM2L3wdaim4UYSoKR0ozWum
	JI6/93J1SIRnpc1ZCLkG290g4CHJ/NA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-Qk1Z-S53MfOjeIiJacfRBA-1; Wed, 07 Aug 2024 07:25:03 -0400
X-MC-Unique: Qk1Z-S53MfOjeIiJacfRBA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-428fc34f41bso12220895e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2024 04:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723029902; x=1723634702;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUmg6m+rX0ZdRF47MclkDhoxeaVkz+iC7VCa9/iV6Vw=;
        b=mMfkETGOnG1Hv/xU6exEaiohwLgMAb/6FkDTB/2vDGqNrLzECAIsTXtPyw4YQRGkRc
         tIBk4RTXm05ravH2Qr+MKqKxMqFjJVx0YoI41+pjNHH/Yx+lcJ5gkemVmQ0WYt3Mbp0O
         zYRMmWSn074viUPHsUR3uOdUwl30bCaePNKMwh3rOaY53xQAzLXguYZqs9eOPFAfNsta
         fmsrFUV4eqjFFmrT1EmSquTREvNd6TFqNLz3xrIoExgNGm12h/lbLlazjY9zZV/h0Eq0
         Q5SnNz2V7ZfhFp0bEUFKqqhcTC7lFB/WWBMoT2jpNDCO17WaCcrHGFHoe0/sheyTiWW7
         xQpg==
X-Forwarded-Encrypted: i=1; AJvYcCVjDaZ6PftssptfUCj4XVAia5cbdxcewRNahg4Tv63DHa91BnaB5shqK0cWqynw5v0TKcU8HubCqNCMDTGhhMvurirtsKvvJlO4Ka/FVreU
X-Gm-Message-State: AOJu0YxxLytN6WUGZGBFrpRmMdYarMeOjMu/W6D2y4f9NAPvmxV4XK7B
	Um9vgQtj7KuTxn4CK6sOit/rF5ucp1JqB1FIYxC7hIuhJD7zi3IwWjCjfcWuKn6mfh+jzTdrnhP
	hIUnTNI3kNnUIM64cLHM5hw0lmgTOObjp8S/mEuZLEy7vprGHn5vm55NBMqE5Ntw4xg==
X-Received: by 2002:a05:6000:2a6:b0:368:31c7:19d9 with SMTP id ffacd0b85a97d-36bbc0c54eamr16661115f8f.12.1723029901527;
        Wed, 07 Aug 2024 04:25:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSeCKCmaFkgVQy7NTVGMO35DBiIizaJ1GZqRtDIurBEJSTZSCwcCs/VepdNDXoauGMk9Tgsg==
X-Received: by 2002:a05:6000:2a6:b0:368:31c7:19d9 with SMTP id ffacd0b85a97d-36bbc0c54eamr16661039f8f.12.1723029900802;
        Wed, 07 Aug 2024 04:25:00 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:1a00:df86:93fe:6505:d096? (p200300cbc7081a00df8693fe6505d096.dip0.t-ipconnect.de. [2003:cb:c708:1a00:df86:93fe:6505:d096])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd059e44sm15739210f8f.70.2024.08.07.04.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 04:25:00 -0700 (PDT)
Message-ID: <8da4b0dc-6522-40ff-ba61-ea41fb3437b0@redhat.com>
Date: Wed, 7 Aug 2024 13:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: update the memmap stat before page is freed
To: Pasha Tatashin <pasha.tatashin@soleen.com>, agordeev@linux.ibm.com,
 akpm@linux-foundation.org, alexghiti@rivosinc.com, aou@eecs.berkeley.edu,
 ardb@kernel.org, arnd@arndb.de, bhe@redhat.com, bjorn@rivosinc.com,
 borntraeger@linux.ibm.com, bp@alien8.de, catalin.marinas@arm.com,
 chenhuacai@kernel.org, chenjiahao16@huawei.com, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, dawei.li@shingroup.cn,
 gerald.schaefer@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com,
 hpa@zytor.com, kent.overstreet@linux.dev, kernel@xen0n.name,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 loongarch@lists.linux.dev, luto@kernel.org, maobibo@loongson.cn,
 mark.rutland@arm.com, mcgrof@kernel.org, mingo@redhat.com,
 mpe@ellerman.id.au, muchun.song@linux.dev, namcao@linutronix.de,
 naveen@kernel.org, npiggin@gmail.com, osalvador@suse.de, palmer@dabbelt.com,
 paul.walmsley@sifive.com, peterz@infradead.org, philmd@linaro.org,
 rdunlap@infradead.org, rientjes@google.com, rppt@kernel.org,
 ryan.roberts@arm.com, souravpanda@google.com, svens@linux.ibm.com,
 tglx@linutronix.de, tzimmermann@suse.de, will@kernel.org, x86@kernel.org
References: <20240806221454.1971755-1-pasha.tatashin@soleen.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240806221454.1971755-1-pasha.tatashin@soleen.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_042507_086687_172EA231 
X-CRM114-Status: UNSURE (   6.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 07.08.24 00:14, Pasha Tatashin wrote:
> It is more logical to update the stat before the page is freed, to avoid
> use after free scenarios.
> 
> Fixes: 15995a352474 ("mm: report per-page metadata information")
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
