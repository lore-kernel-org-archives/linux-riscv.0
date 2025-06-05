Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C346C5B555
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 12:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+x/LhSDnTb3PkKs6425/kXcfSI6fLorTzpiAcEuBA8c=; b=NWGaT7JVFNa+SF
	N+el+UwqVSZFzF5SkHgcY7XaNU7NlFJ/KrOu5q7HdVDVtIyH5ihoQuBRsoRgrWNNK6rnPYWEk/jo6
	AkpDsKOINyTGQrWpmcemQK7CF42sHCh8ODPbZ1OwCkc/a0fBjXWhZaoEcBMPuVMTgqVzq33J2MLan
	QlQEoHuCfN2eCPbtiGPIwHS266YJDEHbsjKadiBpc9YBAzMgHpbc3bVy0jJ00vLGf9NL2Dx/R08Ao
	0eXCjYGgz5nx0kiX17r86GuedmWKZroB4sF2rBz2sZ1oo/tOJB5qcFnffSm4HjLJ4hN3TyOZLod/h
	Yc1lxKmDhUNYi2sPQxFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9bb-0000000FSwQ-0yvq;
	Thu, 05 Jun 2025 12:21:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9bY-0000000FSvV-2gBn
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 12:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749126115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wldJrlgD5xSFvxqsPYQgEMgA0AgR4qOzKzhiKtc8NNY=;
	b=d9n7yWYl/KnvznYlpyTgBrfB+Fg3koyQBn33fosbPdjlvZJjf54i5k+gxOvSQS0Jsjqn1H
	Mke88CwupzxBmvr7k//bERoXgS1F3jQqV9Ex9qqbOwK5lEZWGmHgZtDIfHbopt4PM44nlD
	5E604Mi18yZ5JFG6P6nlWY87mD2gYN0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-JKCaIaMUMuK-dTgf6XzevQ-1; Thu, 05 Jun 2025 08:21:54 -0400
X-MC-Unique: JKCaIaMUMuK-dTgf6XzevQ-1
X-Mimecast-MFC-AGG-ID: JKCaIaMUMuK-dTgf6XzevQ_1749126113
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4fabcafecso361278f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Jun 2025 05:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749126113; x=1749730913;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wldJrlgD5xSFvxqsPYQgEMgA0AgR4qOzKzhiKtc8NNY=;
        b=EdsytCzBrvjs6Kvirw2zFSO6gp51Xh+UYCkigcdMbOZpmUEza/NMIGi/c0A/HJ/k1z
         Z7Q2pa79KJLyODkkKjM3uFECfoNWDgB12HE4p8sg9I4dVmWzaq7TjheWCjMX0yt/38QR
         uXdnMA+7E1zSCYXhjW+LzzaysxBue5AhIdSZUrRWIwuPL7lMbKKozbI45wHDZXxPXo9P
         Rau+gt3elpmVceirrO/uhcbFX1yhZJm6cI4/W97cEHzw2FZw0g3eQjC0RLK68/Lk1dMM
         Ul2PQgKv4oHsrFxFpTBaxD8dmaayyLJ6+1kSYYDjQnu93TC2gUfk6Zvzt3z9JYI0O3tl
         OCxg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ04NODG+eMi+G+K3bKbjLtDGArs/gOB6Ds8Tv8Fj2PvkdU2F0CoHjK796eceWKEMqkbkHPWp9zMR00g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpPUd71w3jNFASOpH/UHCeDI8vffwIwjupS+vla/bV0a6cc++n
	zFxZq6s4XAGDkSrXb7bbsZIu7bjQCoLNaoimdbcl0qS4gs9PJS8qLwYoH+vadLT7yi/sHeyKdCp
	hFKj2ri/MYI1BJBj/x6F65CFG0rTgMaxstj8vtKFUhAVauenIzW47HzgJuTcRVUI9B5e2RQ==
X-Gm-Gg: ASbGncvmIwRmLBJIl5mzw8LUuvJcoDmSUkLvEAq/4cQ9H6Fv6Ht9R6ozDoB8q/EWWnK
	ZVeW+bMYzZAug1FpsFqUsPyybu9dKvQYBY+zClkt7CpYZGQPl4luEmP30rsrrqXI9is5NnYfgDK
	N2LhdXw7Nf1UzVjTc5SoO5p6CH3kgIRDxSPE1bdwHkae4uWw8al4DXm+Y/I+K+Mhl3nfKq4Ny5y
	nLlfrV4ktOKRx4nJGKE4bJMIUxiaNkFxW/VjxfLcyX9uIQYikTj1FPYmxBxA4ADwRxX7S8icdgK
	PNnAFp6VVKNspllv37jyKICNZUJktf4kN8jPq1Xz9clNGvhDqkeFEw7REyTDEyxfRyjEztT7k9x
	2RbYKIZQrLvwidnVnVSRQX2gAqjlo2FFWs+k8
X-Received: by 2002:a05:6000:2411:b0:3a5:2ed2:118e with SMTP id ffacd0b85a97d-3a52ed213bbmr588073f8f.9.1749126112952;
        Thu, 05 Jun 2025 05:21:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqjyD+ON8FzosZudBIIk1cZ1N02kAPjk9ZRTcKJAP4iMjdx7JwYGTIDMl9lWAJcTgFebdUXw==
X-Received: by 2002:a05:6000:2411:b0:3a5:2ed2:118e with SMTP id ffacd0b85a97d-3a52ed213bbmr588039f8f.9.1749126112497;
        Thu, 05 Jun 2025 05:21:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2? (p200300d82f27ec004f4d0d38ba979aa2.dip0.t-ipconnect.de. [2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a526057278sm2657445f8f.63.2025.06.05.05.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 05:21:52 -0700 (PDT)
Message-ID: <897590f7-99a5-4053-8566-76623b929c7c@redhat.com>
Date: Thu, 5 Jun 2025 14:21:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] mm: Remove redundant pXd_devmap calls
To: Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 gerald.schaefer@linux.ibm.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@groves.net
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
 <6841026c50e57_249110022@dwillia2-xfh.jf.intel.com.notmuch>
 <20250605120909.GA44681@ziepe.ca>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250605120909.GA44681@ziepe.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0tgsyoO_K2WjVj8nN9uAbghDcMRYE4mR3ri90jmmNZw_1749126113
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_052156_756182_20676927 
X-CRM114-Status: GOOD (  13.06  )
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

On 05.06.25 14:09, Jason Gunthorpe wrote:
> On Wed, Jun 04, 2025 at 07:35:24PM -0700, Dan Williams wrote:
> 
>> If all dax pages are special, then vm_normal_page() should never find
>> them and gup should fail.
>>
>> ...oh, but vm_normal_page_p[mu]d() is not used in the gup path, and
>> 'special' is not set in the pte path.
> 
> That seems really suboptimal?? Why would pmd and pte be different?
> 
>> I think for any p[mu]d where p[mu]d_page() is ok to use should never set
>> 'special', right?
> 
> There should be dedicated functions for installing pages and PFNs,
> only the PFN one would set the special bit.
> 
> And certainly your tests *should* be failing as special entries should
> never ever be converted to struct page.

Worth reviewing [1] where I clean that up and describe the current 
impact. ;)

What's even worse about this pte_devmap()/pmd_devmap()/... shit (sorry! 
but it's absolute shit) is that some pte_mkdev() set the pte special, 
while others ... don't.

E.g., loongarch

static inline pte_t pte_mkdevmap(pte_t pte)	{ pte_val(pte) |= 
_PAGE_DEVMAP; return pte; }

I don't even know how it can (could) survive vm_normal_page().


Of course, a wild (and different) mixture on pmd_mkdevmap() as well.

So happy to see that go away.

[1] https://lkml.kernel.org/r/20250603211634.2925015-1-david@redhat.com

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
