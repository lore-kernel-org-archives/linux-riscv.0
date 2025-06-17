Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC07C71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 09:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izl4mQ+gj3mx8d04tWpx3bAcCUxK4ExB7NSLUsl8bbw=; b=O5KmgSdQipgZWv
	xr3WYWghi0erhta6ft1D10yqNoaizfznRzE7CX3jrjSiS5zp0RdEhhLcI95UbAotVugj/nzukFfBX
	dpg5cBkEg13XC9cgrnrEmiHkjzFD7oYNhjjDWpmqfTetDvgi0YMmpQ8tGjHtfYEl27y4YsTjsYpZW
	5DI5VPpG4igQsHzGr323hrUysaXSzwBmj9TxA2zqXpCC57bP/FtZ6TKtyUrrfMAmwcbV6Vtwhy5vm
	Z0FMVcJHEeLI026xiG3Tb4px3HpIVSUQ779aCTae0fBkxFMwU0BEMhuS7FeLERcp4N0DvYI2JwAqx
	SNqs3GQj7dmQED0qitHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSuc-00000006oCp-1SjK;
	Tue, 17 Jun 2025 09:47:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSiC-00000006lrn-0dPn
	for linux-riscv@bombadil.infradead.org;
	Tue, 17 Jun 2025 09:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UoO6Im3sdMj9qrKiZw97K0g1BjWI//UD+48kISxcxhU=; b=M3HSoVd5cryncQhcEDbLlnqUK6
	pMQVop/C6NVEKv9Weqa5aDaoFTY4mdi1AX6RR6KJPvO22a4oDsiBYVrreYI8PAWWyJ8uFZOovql8N
	4c5DbTf3HWbqL0+2pq21Vp2qnAGntUF8L1W2UAeB3k/lflIKYiizTrnthtBWCTZqXAH6O9atPoYqO
	dSmejkYgvlYDsOs2retzdW5n4Txxqeb46YZ/PVNk15m6+Y55anGk51HIwbqTTtwleyV/bW8JD3s8B
	S+u2r2P7Xs9bdoXEwDm5AHpkNSbfWmeM3XhMr9MBXFAjRdC79x5yBVAV2hOpj3hOxIbkkOLJXFBv0
	0eMMW9uA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSi9-00000003kv9-1sf8
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 09:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750152870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UoO6Im3sdMj9qrKiZw97K0g1BjWI//UD+48kISxcxhU=;
	b=P0Hk6bD6wxQTca12pKKbgCBpYhsT1GlA4LXlIrZV1+bg98dExREgcdgGysP/4TUYq91jY+
	DJ8WnQLCc2+F7bLUBKu4dPjkC4eTgqZkGqCpfnq32ngpVbS6fdOpp8eKBNxBY+WG6dmAi+
	KmfAp/3LxdnaV8NvQKve/Qa+Dy27UKI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750152870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UoO6Im3sdMj9qrKiZw97K0g1BjWI//UD+48kISxcxhU=;
	b=P0Hk6bD6wxQTca12pKKbgCBpYhsT1GlA4LXlIrZV1+bg98dExREgcdgGysP/4TUYq91jY+
	DJ8WnQLCc2+F7bLUBKu4dPjkC4eTgqZkGqCpfnq32ngpVbS6fdOpp8eKBNxBY+WG6dmAi+
	KmfAp/3LxdnaV8NvQKve/Qa+Dy27UKI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-61CqvatWMqiTJ7K1sgiZeA-1; Tue, 17 Jun 2025 05:34:29 -0400
X-MC-Unique: 61CqvatWMqiTJ7K1sgiZeA-1
X-Mimecast-MFC-AGG-ID: 61CqvatWMqiTJ7K1sgiZeA_1750152868
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43eed325461so34358075e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 02:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152868; x=1750757668;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UoO6Im3sdMj9qrKiZw97K0g1BjWI//UD+48kISxcxhU=;
        b=wYs85Cd7XCArT525+qmQeMu3xvFMC4Th4CzuDJiWcyspD34AGIe/1+3Ig1PSI4/Oo9
         u6XeQ+IE9e32MVQrDkImAxwM5z7zn8eDaIihQjxYZl9FKVaDgMYfikq2ZLcQ9laMavRS
         pdUR+bcMnoa9DJNDBg6fteYWbsw4zQluFIipqsEG9SaCzeuHG1t25XGPNIx8wC5VsoN6
         ewjbrXkKgLC7NTVWE7qo4f3/M1i7RHe7yjaYnW9bDPuzcrPm0WFiphPb1bHB+4sQ5bHL
         W1lVmkclT5e2MNUjf7pfwcgQ9y92MK/RfWAnmJ6Svx6r8qEAW903Lv+aEUM4JPDXRJu8
         r1qg==
X-Forwarded-Encrypted: i=1; AJvYcCWXvKSHdhMvkVGL1yCMSPnrSglLVOI8XG5Thwx4de4y6ItV1J32Czp7BuuGZ2QpIpPiA9Dxeana5yxLmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxD3cwTQ6JH4ZpC6BURmLi4Q3M5qqTX43G2QJ6vBHd3tnrQT772
	KJsD0r/fj6fuOg8GVRbFFpVgwpd0anbltLXuXNbRQ+kk9jVfeXa9vycT5jzM9+wp3XDkQ4X0HUb
	eEvI1GPzmy1UZ8yzUkHEcuaKBQds5MlJgukmBN/BNjr0EdNSOH6Jj228a2TUTBi8ZhmsYfQ==
X-Gm-Gg: ASbGncuZXz2CuJguTnBqLLHu0uF/l/5+WLhbNOISS/yVmjW5Q6HgAAxIw9ksoQ7L8uY
	CUYs54NuAgKq6MBGRsU661D9y3KG8gnDTaWVbphE664y9Kt2l4875uiWqIt3yL9jXaeSRg0hWzK
	18rgm2QLRQh5Jp1MgN/U9mvMf9gGbnISmWg3gCewApXIl1Mkwi8K80QVPKGIeNIXDaWJ47VtJT9
	d+gtcaHyvrxzxQaDuTLilSAg469GlK4vCqoo2FA/bcS4jGy2seaIeexkCfi19U6YVYn3CNk+U9R
	Y8j/vq2VgO+/ZkSDcIHwc0rZ2VL/kM3Hr8IhOfGMOEh9InVHrRRbRVirYN+eFEsSS6C0CA5Z1yO
	h87BVVNik77nlI6/y+PGDeOoKpQM8C+5G84Q0ikghIuWO52o=
X-Received: by 2002:a05:6000:480d:b0:3a4:ed2f:e82d with SMTP id ffacd0b85a97d-3a5723a49e0mr9462632f8f.22.1750152867969;
        Tue, 17 Jun 2025 02:34:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAmkCmIe8r1op6vQb6TFjyJmDKs7yVrH6V8NRIzvLkSM/8ZQuEH09JTbMfp0YgKwsQ3nxlSg==
X-Received: by 2002:a05:6000:480d:b0:3a4:ed2f:e82d with SMTP id ffacd0b85a97d-3a5723a49e0mr9462594f8f.22.1750152867607;
        Tue, 17 Jun 2025 02:34:27 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7f8f9sm13367621f8f.42.2025.06.17.02.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:34:27 -0700 (PDT)
Message-ID: <b2640810-d528-4a3f-b69a-87847943dc2b@redhat.com>
Date: Tue, 17 Jun 2025 11:34:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] mm/memremap: Remove unused devmap_managed_key
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
 m.szyprowski@samsung.com, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <51ccdbbc3d7b76a7f6e2aefb543eba52d653a230.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <51ccdbbc3d7b76a7f6e2aefb543eba52d653a230.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JoyJuQGdtzP1Rsa6JtJG5g3zYrVsbcFf8qYt8jmrlv8_1750152868
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_103433_769371_C053D4F5 
X-CRM114-Status: UNSURE (   5.33  )
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

On 16.06.25 13:58, Alistair Popple wrote:
> It's no longer used so remove it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
