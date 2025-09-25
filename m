Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B5DCAC5A7
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQcmnJI3I3yWsIG9I4kEcty6sdK7Yi4AKThaefxRNa0=; b=N5WZWYj5zBEL/K
	XoyUQsUPbTWzap7/4oRNBHzZUvSiJkLSY0/VoDfSPkp9rpOya/m3aVVTYAgOK6VnGTgJd9r3+OJGX
	G8LrSKuhby9jpfjx4Qzdq9UMLq7TV9nLgnesQJCiRm27ybrBRM6007VSyinjQKpH8LOL5qN8JmOhk
	p+yIw3Mh0SJ/jTk10r6eaqWw6B0F3bYu740Si18vu4dvHDJ1bGhDByMeFnVV45KcnzxHN0DsTySxl
	VpMU9CTNIeEvuY6TG77OSF2BuNGaA3/NdFf+bQYFk1YuuSleQzAa8/vZJYAKkolf3MG49r7pK0HBL
	JZI7zgxFiwZFoPngFbJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iR5-00000007iKP-2ryn;
	Thu, 25 Sep 2025 09:38:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iR4-00000007iIm-0iTV
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 09:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758793125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=it1xa6zCsSImRY+xGhkMLXcJ8czGI9ZV2cO7XzXjMBU=;
	b=LmWnD79QMX//6h8MG1gcxG9ReTbGAuwuD1E1yjwXayDmIj1vSL1mcbmp0qEXmrVKHZ8dJc
	9JamP+EqFLTqggTMlsogF2LpBQXqBoPyULKGrOO5XfnLKhCZLDlsph9IVZnBkFcHJ1ZP3r
	ejg8O/dEofXo5GwoIpXe5lpMjqm3y20=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-PepQBCyCPH2vnnC7aeZxJg-1; Thu, 25 Sep 2025 05:38:43 -0400
X-MC-Unique: PepQBCyCPH2vnnC7aeZxJg-1
X-Mimecast-MFC-AGG-ID: PepQBCyCPH2vnnC7aeZxJg_1758793122
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45cb604427fso4294515e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 02:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758793122; x=1759397922;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=it1xa6zCsSImRY+xGhkMLXcJ8czGI9ZV2cO7XzXjMBU=;
        b=OiXSGyPP1FolXduITSzQ7I2p2CxDbQE6P09+gBN/yDxJ3QdFbqoNNU8w1OePSy74Qb
         JeopFDG51Nbb6MgsIz+vMgl0SmaeanLpjRsoG/rH4fIdJb1245PitVjrir45kJmhg0K2
         /G+VkwkrNrD/Q8mRnMGjvkPwx6hdVo5PBKQA++FRCxkkzT65gT6O743yFIZ6qpOyuD3v
         oaZArbGlOmxiOi3IlyPaA+Y4pi+p+n599npjNZrFvoQcHUxLwazfu/58W5fC/3a0fjw5
         0+U/AIGGRIvAfx2dlk5lAymsEDHo/yfd5aTUJotlsj4JGAOj9vpghxvvFxq/PGiKQeCE
         WKQw==
X-Forwarded-Encrypted: i=1; AJvYcCUPswBwvHdzcWSTbNt/8S2cNmugdurBculnjR2Me8mlzIeDJt5yfsUsccqrDmCrlBzJPxmEBh9qBaIRSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkecgemJ8FMeM/J6H1xbbedsfmYkol17F+hFohGJ5WkJHdKAPi
	R72809hZqx1JxrrOey22EGJPhsm4Aa4M1e0xsnxrJsxUhNPupDg07NWGuHnaRlrroLgQlMp3+l2
	NmE3AjyBPtjg7a5b33d9xnzxkAp/Y5bqE67RjMDDRoj+VPSfHLFiSWwmbT9+6wW7qewbACw==
X-Gm-Gg: ASbGncvdawuqp8IAi1x1kOtP8ob5/Ie/930IsWfmBzs2ugIq2AV8UibiO5EKZXtQbhL
	HeGO/tzcPH3SIgiYill17k2sQCh3EJ+LuY7iWK0SJPvmZoLwk0p1/CA6Sr1HszfmqlEXSpdEmYD
	PODlQkaZSDT++jNmh79Q37a4j5WKOaRiW+9LQQe2bfGXT2o+a85BXdeWVpJCJtQxe5518IniGwH
	QriBKqHzu8hJWpoG+AeWRmciQGh2w4FvvvYCJwE3TUeVTtvCx+fylFoEYKlBu0zCe1qT8EWChcG
	H8xyR4h7ltWy8E+niK2S8czwsjmaYHhO7D3OXMaQCf2FbkRmtSpithUpiERdUtpP8u3jDqwBPDw
	TIqbU+ZMwD8vlBRFfD6OkuQX1Y8BTpcYfTffc6O8/BL4kaZpORL8wO39P/1b2Ju0ih52h
X-Received: by 2002:a05:600c:8a1a:20b0:45d:f7f9:9822 with SMTP id 5b1f17b1804b1-46e329b27c2mr24051055e9.12.1758793122214;
        Thu, 25 Sep 2025 02:38:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVxkfcKZdBRrn77cRbQGAcPMp2dfiwtZjiOl6HprH7JU8Dt7NVvFTN8NqQoWgRk2N1EMDfHw==
X-Received: by 2002:a05:600c:8a1a:20b0:45d:f7f9:9822 with SMTP id 5b1f17b1804b1-46e329b27c2mr24050635e9.12.1758793121780;
        Thu, 25 Sep 2025 02:38:41 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:f800:c101:5c9f:3bc9:3d08? (p200300d82f3ff800c1015c9f3bc93d08.dip0.t-ipconnect.de. [2003:d8:2f3f:f800:c101:5c9f:3bc9:3d08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5602dc2sm2225863f8f.32.2025.09.25.02.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:38:41 -0700 (PDT)
Message-ID: <54195a6a-7cc6-4df1-a787-45d8f564c0bd@redhat.com>
Date: Thu, 25 Sep 2025 11:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] mm: add PMD-level huge page support for
 remap_pfn_range()
To: Yin Tirui <yintirui@huawei.com>, akpm@linux-foundation.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, anshuman.khandual@arm.com,
 yangyicong@hisilicon.com, ardb@kernel.org, willy@infradead.org,
 apopple@nvidia.com, samuel.holland@sifive.com, luxu.kernel@bytedance.com,
 abrestic@rivosinc.com, yongxuan.wang@sifive.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
Cc: wangkefeng.wang@huawei.com, chenjun102@huawei.com
References: <20250923133104.926672-1-yintirui@huawei.com>
 <20250923133104.926672-3-yintirui@huawei.com>
 <f8571506-30c0-4dc8-9995-41a6469f8fc7@redhat.com>
 <8313b0c1-bf62-4257-951c-fd7e29193ae2@huawei.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <8313b0c1-bf62-4257-951c-fd7e29193ae2@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8lfes56wgVz_ctxVs1kASLASZLzPC0VrFVbw4TaEF7A_1758793122
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_023846_292950_6F23AE66 
X-CRM114-Status: UNSURE (   8.96  )
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

On 25.09.25 03:43, Yin Tirui wrote:
> 
> 
> On 9/24/2025 5:50 PM, David Hildenbrand wrote:
>>> Introduce pfnmap_max_page_shift parameter to control maximum page
>>> size and "nohugepfnmap" boot option to disable huge pfnmap entirely.
>>
>> Why? If an arch supports it we should just do it. Or what's the reason
>> behind that?
>>
> There's no specific reason for this - it was just intended to provide an
> additional option. I'll remove it in the next version.

Good, then let's keep it simple :)

-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
