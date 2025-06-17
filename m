Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706DAC7115A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 09:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87aLkRr9j4APtRismR/Cr81yaOdwHSrvm7hnXFvBHbY=; b=Zu3beumhYm0Lsn
	d9wEkkA7bbqCuKj+zbmDxHbZqSLIFaaVD0dwCuB/01z1xdADBK9A0PLhPdoGYGN6i0v5d3+/jKlkg
	V0mPGzXMbA9stXVMGweOqZADxQ6kIde2/OoOZu1Oul+rAjqifclsyPKvi6s3sg6Bq4pdCSc2VVXHy
	bgQSnU6tKoYU25mIgxVehFSJvnldT45MzV4DKNH9r4xZ7pw/pPEwNgBNd1y03tVKKpA6qr9xHTqdx
	LOcHnUlV0LDv+p7p1ZMGq62oGfkln5G0CTcUrvmqA9cjetJWroM581zTGbQPV3s2DrniqBc/FwaxB
	x5zo0Jat3+ncc3iQOufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRT1T-00000006pzw-1pBS;
	Tue, 17 Jun 2025 09:54:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSkQ-00000006mRP-0vga
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 09:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QeaQyg08N2bK9CSAL6amctKGL4o8t+/yBMjOyZjIdjM=;
	b=SUObzYDLvU/05hirX4C6KYkqMl9ls6c3aRL5GsfdXyz2oWamqKsGC7/Z0XYsFcmTSEA/WC
	fO3DI0MrJpkKRYAGwmqobiEXPKrm0kr3EkJc6Xa1HOYl84o2ni/IeEJSNIZ2vhTTURRGGo
	0pDW05tiMiTAvrwW1tmFGtSXoe7yOjw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-1ps-tBAkNkS4JBpfRQ7oAQ-1; Tue, 17 Jun 2025 05:36:50 -0400
X-MC-Unique: 1ps-tBAkNkS4JBpfRQ7oAQ-1
X-Mimecast-MFC-AGG-ID: 1ps-tBAkNkS4JBpfRQ7oAQ_1750153009
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d50eacafso32704335e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 02:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153009; x=1750757809;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QeaQyg08N2bK9CSAL6amctKGL4o8t+/yBMjOyZjIdjM=;
        b=keevftzYnYksvdLmcZyK4P/Hk+9kHuFQhvVaD2r/SUks7nYIqM55PNmHxxkBY1Bpli
         RBpXf8ZXW13duDc6hQa1FItdyeKE/cFww4C9RVWUKWee2LmEfhGMXYc/kKSJfG11Miwr
         9WuVqeu4SSL/swp8jn4Qv0ndhTb1moU/D5wCJSqXUsoMi2ZLZED2GYRmG6Dugouohy9U
         eU5eoozr4sx9dyN2lgnUeZXiMILwOxmTBcGDObWii6ozEPMrTa5dxn9j5e3ZdQT4O61a
         AiIDev7wRQ5J/LKiwEkESKIg1tDZ07KGnPPcuarzkDzM/Wl3+pq0PHIvtCiIeIU+fIwS
         CuRw==
X-Forwarded-Encrypted: i=1; AJvYcCV6rh21AAVHqTXNeY0FrlpBOadmcTotf2731ie6C7+LUhQCv1QbZjSLUigdm5nOHNJODRmNVxvUhdsEMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTkQ4aOQjE2fS3ZS8NR+ue8PQ3pzUMSeX7xTMhc2XDT9iq3bnt
	fwoIR1thZFrDBQ19zv7O2AX/97pWm7EiIKpoNUkuBeO5+EiH0Au8RuZN/uFmfFOx7uHZeOF1u4Y
	WFf3q9Ej4mErAPy9BKkCwu+sPv2I9SXHDeuufLAozrkRV28tzGBLkelcwyLMPhlg7jU+bgg==
X-Gm-Gg: ASbGncs/5YEko0mK4V0q2IBCpBE+MHNoxAYbuCX5iqO9AVtwIXZjDghDdvem+1gmiWw
	8pcDtk1I6hhGMMMP5WOgrFdoC7fTU+V78R3lDMGkv100NUl+0RbT8KTJDEbfvxVWvCCODf0b5MI
	JcS8vieurnSCMbcHMKALO085mydMQJeBqfsiGKqJMcON12i96dV7V5fgrgNm6Cr2CzWnGy/s6jf
	DGaWUgl66VEJ13SlAwDnlTDsWc2ESnk0BGPkMEr5E4TuN6G6/L6ntg81i583xJp4m8dJ9EynAK8
	G4OdOh4BNZ+2T2F53eeMnNIT2zpxZTR6J4a+nwNRrWnoGArGgc5AgwLYyJ6s0P5eebanv88Pwvb
	O6xxswlatlP7Yolg9OgUZEurj2+W0gzuOSF0pC1V5glZdUls=
X-Received: by 2002:a05:600c:6205:b0:441:a715:664a with SMTP id 5b1f17b1804b1-4533caa628fmr107487155e9.20.1750153008754;
        Tue, 17 Jun 2025 02:36:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiGU6rdJOxze5zntN178WfWP080iOaFrEHA392zHARPkcDs+AZMCwZ9uBzuwzj+r+ddywNSA==
X-Received: by 2002:a05:600c:6205:b0:441:a715:664a with SMTP id 5b1f17b1804b1-4533caa628fmr107486885e9.20.1750153008407;
        Tue, 17 Jun 2025 02:36:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54a36sm13644198f8f.15.2025.06.17.02.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:36:47 -0700 (PDT)
Message-ID: <911e7b40-e30e-477f-a4e5-df34df1d0e14@redhat.com>
Date: Tue, 17 Jun 2025 11:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] mm: Remove devmap related functions and page
 table bits
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net,
 m.szyprowski@samsung.com, Will Deacon <will@kernel.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <bf6221bf1e3a290845417a60c27cf301203fd99c.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bf6221bf1e3a290845417a60c27cf301203fd99c.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QgR3mfESo7f861Hw5YF3THjXTWrnXEGe3T6BvblOC7o_1750153009
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_023654_331191_1A45154D 
X-CRM114-Status: UNSURE (   6.20  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTYuMDYuMjUgMTM6NTgsIEFsaXN0YWlyIFBvcHBsZSB3cm90ZToKPiBOb3cgdGhhdCBEQVgg
YW5kIGFsbCBvdGhlciByZWZlcmVuY2UgY291bnRzIHRvIFpPTkVfREVWSUNFIHBhZ2VzIGFyZQo+
IG1hbmFnZWQgbm9ybWFsbHkgdGhlcmUgaXMgbm8gbmVlZCBmb3IgdGhlIHNwZWNpYWwgZGV2bWFw
IFBURS9QTUQvUFVECj4gcGFnZSB0YWJsZSBiaXRzLiBTbyBkcm9wIGFsbCByZWZlcmVuY2VzIHRv
IHRoZXNlLCBmcmVlaW5nIHVwIGEKPiBzb2Z0d2FyZSBkZWZpbmVkIHBhZ2UgdGFibGUgYml0IG9u
IGFyY2hpdGVjdHVyZXMgc3VwcG9ydGluZyBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGlzdGFp
ciBQb3BwbGUgPGFwb3BwbGVAbnZpZGlhLmNvbT4KPiBBY2tlZC1ieTogV2lsbCBEZWFjb24gPHdp
bGxAa2VybmVsLm9yZz4gIyBhcm02NAo+IFN1Z2dlc3RlZC1ieTogQ2h1bnlhbiBaaGFuZyA8emhh
bmcubHlyYUBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJp
dm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNv
bT4KPiAtLS0KCkFja2VkLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4K
Ci0tIApDaGVlcnMsCgpEYXZpZCAvIGRoaWxkZW5iCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
