Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B547C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 15:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2BE4AjssZb/Zs/WKYP1BMLGAQ4ZNFt10Pst9aJPv+I=; b=CtqZ9wbA99428i8h2FnBFrCIE4
	MXd/sSCGO3TcXn3G1xazVuk47xVLapP4jKgDPMGY5XGSugSU69r040Rsd2cdRQppoPz/rOn2YJNtx
	m4l3NKEi2P7M0c7zdNPwBbzip6PpqjPhkh9fupf0UjhlRAzZExf544sogZYH8hRmn2E3AVFlvQMpc
	cBrqPXH176K9ef2/EBkp0o2boseSQFGLbI6rFhQ+IkZ4DMpGPFeJJ0Dr69Mn9k1VdwyF1dcXikbYT
	ha894yZiRsv/Or56Q8d6rMdczlqUWAXFHvK3MFkny8fNXPLXpidAC+3/ltZoLXAS6trTa9PRcyzmt
	o94iSuAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6uZ7-0000000GPx7-2XvO;
	Tue, 14 May 2024 15:59:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6uZ4-0000000GPwD-1Pmw
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 15:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715702381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FziVE3UcEfelvdfJHO++cS7G6lDOTnc3Onquu2wEMDc=;
	b=NICjIw8kbeuhRyi6gyZND49N2X6WfGh/KBEn1541AxMtnQAxnpT9t4a8R85EkNtBQjqSxj
	KOT4xLkPKVYD0wriv/fbMRoFGygIOwxmu1fUeOitzKNsyPKbCWZJa2I6Yh3kimUuRbZt/l
	GL96x4LxoyL6WVNR6Ra7pDoQq9JnI4M=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-tJX0r6q6M4KtJZNC7X6XJA-1; Tue, 14 May 2024 11:59:40 -0400
X-MC-Unique: tJX0r6q6M4KtJZNC7X6XJA-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-5d8df7c5500so5257970a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 08:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715702378; x=1716307178;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FziVE3UcEfelvdfJHO++cS7G6lDOTnc3Onquu2wEMDc=;
        b=azGpW1LTzFGVDjkZAYJ3FxpDKb3V+9HQRxBbnJbSlQWyrLPUAlK0+Qyq1IpwvywbL+
         8/kcKMmv/LLJSKRUbwCtfgv8M9GbCUtG330LiJLlh1JXewqq6u8kf548tr9VAaAeq/nX
         Qq8xpyNdsqhx4mxGD2Yz67D1fegPAfsmk8NJqRRhpSBfsSM496/Zx7dNLuUUjMWLDMAg
         DQR2rmfEl+DcXETbACyrENDH052cSn+MqYP50gDGdMitEjLwkdyv9jD1RbgyQ/qczQ5h
         eAaAw2wyly8j/ql8EyzSUZoa5ml4u68huRbklMgA0rirs7lDqu5ntNSL0LdM/pSgR168
         H4FA==
X-Forwarded-Encrypted: i=1; AJvYcCWLwDYqbmSCQHFpNgQkXRIVSPJaBHhhyK+MpJiRXG3nmJZVbEEDawkuBFylka064pSmFoKLyB6D+bKFUCr00ewZhhd3KdREC7ilOsDwkYa3
X-Gm-Message-State: AOJu0YxKAxk3M6qiyPFnj+Lz8X1XAXv3dsI4I4cdJiEhVKsTJo0EMzcv
	wPHl3Fvw8fNzeEDJxOETJDvn0hAyylwZC5DJ57kliptsBigyHsIvZ4c1TSiPqEctWyzY/ClAhFS
	HlaSZWzmbwuTgoxRsdXErBCnBLvPDYRz4ETKmUo7GHrBjlU9Mmflk0gAi4yHLiFf67g==
X-Received: by 2002:a05:6a20:dda5:b0:1af:cf63:3df3 with SMTP id adf61e73a8af0-1afde0dbff0mr11112803637.14.1715702377763;
        Tue, 14 May 2024 08:59:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSNd/Htfdc4/rdZ1uK+BHQ4z/KWKOxdfhUlRcb1GSDkMKoVb5DPdGteWX7De0DfR/0THKowg==
X-Received: by 2002:a05:6a20:dda5:b0:1af:cf63:3df3 with SMTP id adf61e73a8af0-1afde0dbff0mr11112771637.14.1715702377262;
        Tue, 14 May 2024 08:59:37 -0700 (PDT)
Received: from [172.21.1.2] ([50.204.89.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-63a917264d6sm6709968a12.73.2024.05.14.08.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 08:59:36 -0700 (PDT)
Message-ID: <4551ca95-8ca2-49d5-92ff-15f490640ed9@redhat.com>
Date: Tue, 14 May 2024 17:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] riscv: mm: Change attribute from __init to
 __meminit for page functions
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-3-bjorn@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240514140446.538622-3-bjorn@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_085942_473334_1D1D7434 
X-CRM114-Status: GOOD (  12.66  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTQuMDUuMjQgMTY6MDQsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gRnJvbTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IAo+IFByZXBhcmUgZm9yIG1lbW9yeSBob3RwbHVn
Z2luZyBzdXBwb3J0IGJ5IGNoYW5naW5nIGZyb20gX19pbml0IHRvCj4gX19tZW1pbml0IGZvciB0
aGUgcGFnZSB0YWJsZSBmdW5jdGlvbnMgdGhhdCBhcmUgdXNlZCBieSB0aGUgdXBjb21pbmcKPiBh
cmNoaXRlY3R1cmUgc3BlY2lmaWMgY2FsbGJhY2tzLgo+IAo+IENoYW5naW5nIHRoZSBfX2luaXQg
YXR0cmlidXRlIHRvIF9fbWVtaW5pdCwgYXZvaWRzIHRoYXQgdGhlIGZ1bmN0aW9ucwo+IGFyZSBy
ZW1vdmVkIGFmdGVyIGluaXQuIFRoZSBfX21lbWluaXQgYXR0cmlidXRlIG1ha2VzIHN1cmUgdGhl
Cj4gZnVuY3Rpb25zIGFyZSBrZXB0IGluIHRoZSBrZXJuZWwgdGV4dCBwb3N0IGluaXQsIGJ1dCBv
bmx5IGlmIG1lbW9yeQo+IGhvdHBsdWdnaW5nIGlzIGVuYWJsZWQgZm9yIHRoZSBidWlsZC4KPiAK
PiBBbHNvLCBtYWtlIHN1cmUgdGhhdCB0aGUgYWx0bWFwIHBhcmFtZXRlciBpcyBwcm9wZXJseSBw
YXNzZWQgb24gdG8KPiB2bWVtbWFwX3BvcHVsYXRlX2h1Z2VwYWdlcygpLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAtLS0KClJldmlld2Vk
LWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KCi0tIApDaGVlcnMsCgpE
YXZpZCAvIGRoaWxkZW5iCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
