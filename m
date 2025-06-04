Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4213C5B552
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNUyERWr7V+SS/w+B2FlogZ12HTUcfCeubnC77lAuj8=; b=3dXs6T8a4afuT1
	RwOFphYr7+/Ath9R6cyUDMSItmTNFkiDzfclbkpcpAPYCMLLg7NuxGskMnHeHn7xFpDI7MlRu/LYk
	J4puNszuyS4EeAX2RAuDllEbRFVpgxY+2U2uwhCSAlhj06IAuYNGr4fLwqDtnJr90VmRaGqUHjItk
	VgMB/F0ZlHDuRKlrZqBUb3IaokUSs1FjIUxHwNRu20E2+rXb0hLilzlOoadtIjNyWnz+dOColT1qf
	D4DOcwR52E5BmuNq/kyJLSkjWaXfWmZ6xGucY43e7KsOOrQApQaYKxN2T6ua9pPJN4Q4zKm0rqUsM
	6eRSTTinsYU4FVGa1RTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjjx-0000000Cvhk-0urz;
	Wed, 04 Jun 2025 08:44:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjEt-0000000CrQK-2nnv
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 08:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749024766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wvgVOukUEEpNaUkwE3gsYqCFfAQ70mfdaWg/jB4/Ezc=;
	b=VWaHO4hws27QArKyeUeOQcLcHjWNqDbTisv5nj8YwADYIbgFH4hOdB8v10F7Z24xmSqLlH
	1EWwHkNb9KPuW0lTcR5NrLE0qd8nc6moDjLslZWOUFngPLgmt6ZG0khODxg+pQkoc4WsSE
	ZqGyDE4PcVdu4AtCqdxePP04dHkR4hw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-S_3rftuWNWu1uKxn5zCjrA-1; Wed, 04 Jun 2025 04:12:43 -0400
X-MC-Unique: S_3rftuWNWu1uKxn5zCjrA-1
X-Mimecast-MFC-AGG-ID: S_3rftuWNWu1uKxn5zCjrA_1749024763
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d886b9d5so18329115e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 01:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749024762; x=1749629562;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wvgVOukUEEpNaUkwE3gsYqCFfAQ70mfdaWg/jB4/Ezc=;
        b=f60koVbSe7AcJGm00mIZpzYZCZorhEs7VWAUO5d/N0yUfmprdPn7kmNlgAVFbknV4o
         dumzUZGhUzTH9416uKxCqzTXTUxdqSXj5kFDthBlgHIf5vu1O3D2hifvT/QaJenylOW5
         wYC/Aeac6GdPBOoz+GD3EaMb8cebvwDtbQij/y6NSdyOM+sNXhIE7tPIPcffQJ23Hvmy
         DpTzHOGyGnhPwaSaQ7OKa1Q0luwmjyt2QLB0AHIVevfNQ0xP4NOBDkkPxTb40AnatKxR
         RavbNUoH0asYTzmLrurWtiCL0upuDcoaj2Eaqf7XF312om4vA2j778Hergc+MnrEmvtw
         Mxkw==
X-Forwarded-Encrypted: i=1; AJvYcCWHRjLH/XPO5dOIrIUA3OWMowhgrO1g3h9u7idiQaUS2i0P+/pXGOe2AgRj5Agx4dxM/dXkCqhp9RTcsw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3GQih5x3mNibO+99DurJYKaWFXF/mGKDcLRbuNPWERsyWGC7a
	EfFsIsHkB6AbTrQZH5jBvmZvUL25a21qsc81Z1sLqgtqwSVqhxYNZqdkY9281vEmk06EVf/ACRm
	pvIHF9gHUr+MZ5ZvTGiQzz4TA+TjagYdAEtfngpHMEiMZb6weCVdodgEcnZljzFiptCY+2w==
X-Gm-Gg: ASbGncuAnN8IUwYjAvy0E0APG1LRFVQpvl+imBg7Kk0968UNsq6L3yPEBQIK0pmOLE7
	IG4PCpSOUn/C/cHOvKcNE8Nz+zltAvrkHv7HBwv802L/YKrbg/SO2G4XP0I1fEHBlAUStDaLR2C
	S2Lg7lcYjc1fgMiPKnisjcaW8iRVv6MRVwsqoxqL0smQmqOUliamoBGHRmvogF2pUY2DvlDnUwG
	XVK4WgpclTo9w9GU7lmiirB+h2eaQPyuNzdeIytDVh3cVThs+pcK7xc/VyfogmXjQP/UxHuRcwI
	ktEYFyCyGgNxRDAHdDQQRqgilZuruVAVp6nWfOme7oOIR5e4OZknqCn6N9QrS0fEEykg2s4CNzI
	LDGzNVIifBzZRUkDjsrM9IKk6wayVQbfnj8ZaIpw=
X-Received: by 2002:a05:600c:1c9c:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-451f0f9ed22mr12282525e9.25.1749024762581;
        Wed, 04 Jun 2025 01:12:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzb/FDz43e8wFgbzlacj4yn5C2qA7eJyJaco03PXI5pILsFZJQX31j60ijcZDaWL3tTDSZDQ==
X-Received: by 2002:a05:600c:1c9c:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-451f0f9ed22mr12282135e9.25.1749024762069;
        Wed, 04 Jun 2025 01:12:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8edebsm188022035e9.6.2025.06.04.01.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 01:12:41 -0700 (PDT)
Message-ID: <764d452d-446a-4b5e-aa03-e0d901126931@redhat.com>
Date: Wed, 4 Jun 2025 10:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
To: Mike Rapoport <rppt@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jann Horn <jannh@google.com>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org
References: <20250603192213.182931-1-lorenzo.stoakes@oracle.com>
 <51ec4269-b132-4163-9cb5-766042a3769d@redhat.com>
 <aD_-qdg2OvKQIyRg@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aD_-qdg2OvKQIyRg@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OBbFDJK-NUC-uN50RnpseeLCiVuKCO-neDajSz2cgw4_1749024763
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_011247_782694_A61025B5 
X-CRM114-Status: GOOD (  14.81  )
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

T24gMDQuMDYuMjUgMTA6MDcsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gT24gV2VkLCBKdW4gMDQs
IDIwMjUgYXQgMDk6Mzk6MzBBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+IE9u
IDAzLjA2LjI1IDIxOjIyLCBMb3JlbnpvIFN0b2FrZXMgd3JvdGU6Cj4+PiBUaGUgd2Fsa19wYWdl
X3JhbmdlX25vdm1hKCkgZnVuY3Rpb24gaXMgcmF0aGVyIGNvbmZ1c2luZyAtIGl0IHN1cHBvcnRz
IHR3bwo+Pj4gbW9kZXMsIG9uZSB1c2VkIG9mdGVuLCB0aGUgb3RoZXIgdXNlZCBvbmx5IGZvciBk
ZWJ1Z2dpbmcuCj4+Pgo+Pj4gVGhlIGZpcnN0IG1vZGUgaXMgdGhlIGNvbW1vbiBjYXNlIG9mIHRy
YXZlcnNhbCBvZiBrZXJuZWwgcGFnZSB0YWJsZXMsIHdoaWNoCj4+PiBpcyB3aGF0IG5lYXJseSBh
bGwgY2FsbGVycyB1c2UgdGhpcyBmb3IuCj4+Cj4+IC4uLiBhbmQgd2hhdCBwZW9wbGUgc2hvdWxk
IGJlIHVzaW5nIGl0IGZvciDwn5mCCj4+Cj4+Pgo+Pj4gU2Vjb25kbHkgaXQgcHJvdmlkZXMgYW4g
dW51c3VhbCBkZWJ1Z2dpbmcgaW50ZXJmYWNlIHRoYXQgYWxsb3dzIGZvciB0aGUKPj4+IHRyYXZl
cnNhbCBvZiBwYWdlIHRhYmxlcyBpbiBhIHVzZXJsYW5kIHJhbmdlIG9mIG1lbW9yeSBldmVuIGZv
ciB0aGF0IG1lbW9yeQo+Pj4gd2hpY2ggaXMgbm90IGRlc2NyaWJlZCBieSBhIFZNQS4KPj4+Cj4+
PiBUaGlzIGlzIGhpZ2hseSB1bnVzdWFsIGFuZCBpdCBpcyBmYXIgZnJvbSBjZXJ0YWluIHRoYXQg
c3VjaCBwYWdlIHRhYmxlcwo+Pj4gc2hvdWxkIGV2ZW4gZXhpc3QsIGJ1dCBwZXJoYXBzIHRoaXMg
aXMgcHJlY2lzZWx5IHdoeSBpdCBpcyB1c2VmdWwgYXMgYQo+Pj4gZGVidWdnaW5nIG1lY2hhbmlz
bS4KPj4+Cj4+PiBBcyBhIHJlc3VsdCwgdGhpcyBpcyB1dGlsaXNlZCBieSBwdGR1bXAgb25seS4g
SGlzdG9yaWNhbGx5LCB0aGluZ3Mgd2VyZQo+Pj4gcmV2ZXJzZWQgLSBwdGR1bXAgd2FzIHRoZSBv
bmx5IHVzZXIsIGFuZCBvdGhlciBwYXJ0cyBvZiB0aGUga2VybmVsIGV2b2x2ZWQKPj4+IHRvIHVz
ZSB0aGUga2VybmVsIHBhZ2UgdGFibGUgd2Fsa2luZyBoZXJlLgo+Pj4KPj4+IFNpbmNlIHdlIGhh
dmUgc29tZSBjb21wbGljYXRlZCBhbmQgY29uZnVzaW5nIGxvY2tpbmcgcnVsZXMgZm9yIHRoZSBu
b3ZtYQo+Pj4gY2FzZSwgaXQgbWFrZXMgc2Vuc2UgdG8gc2VwYXJhdGUgdGhlIHR3byB1c2FnZXMg
aW50byB0aGVpciBvd24gZnVuY3Rpb25zLgo+Pj4KPj4+IERvaW5nIHRoaXMgYWxzbyBwcm92aWRl
IHNlbGYtZG9jdW1lbnRhdGlvbiBhcyB0byB0aGUgaW50ZW50IG9mIHRoZSBjYWxsZXIgLQo+Pj4g
YXJlIHRoZXkgZG9pbmcgc29tZXRoaW5nIHJhdGhlciB1bnVzdWFsIG9yIGFyZSB0aGV5IHNpbXBs
eSBkb2luZyBhIHN0YW5kYXJkCj4+PiBrZXJuZWwgcGFnZSB0YWJsZSB3YWxrPwo+Pj4KPj4+IFdl
IHRoZXJlZm9yZSBtYWludGFpbiB3YWxrX3BhZ2VfcmFuZ2Vfbm92bWEoKSBmb3IgdGhpcyBzaW5n
bGUgdXNhZ2UsIGFuZAo+Pj4gZG9jdW1lbnQgdGhlIGZ1bmN0aW9uIGFzIHN1Y2guCj4+Cj4+IElm
IHdlIGhhdmUgdG8ga2VlcCB0aGlzIGRhbmdlcm91cyBpbnRlcmZhY2UsIGl0IHNob3VsZCBwcm9i
YWJseSBiZQo+Pgo+PiB3YWxrX3BhZ2VfcmFuZ2VfZGVidWcoKSBvciB3YWxrX3BhZ2VfcmFuZ2Vf
ZHVtcCgpCj4gCj4gV2UgY2FuIGFsc28gbW92ZSBpdCBmcm9tIGluY2x1ZGUvbGludXgvcGFnZXdh
bGsuaCB0byBtbS9pbnRlcm5hbC5oCgpBZ3JlZWQuCgotLSAKQ2hlZXJzLAoKRGF2aWQgLyBkaGls
ZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
