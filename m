Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A092D0C82C
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QlGpXUwJlYUZRK+VailYIV/5gxcvTGqbvlQqXuCm2qQ=; b=P0M9nOnyvvaSTJ
	FNJkcmvpx5863e18ga7D5qIez1qm4DDs01g4fMmO+m8SUFNP0doojUWkLFjpl3XTuAmOvxsghSi2P
	75RWP7RVfsvQG9UMTjnZkJnQR4TyOLDXE/0zAh71kjOYutQxgNEONaK5zALf4K/AY6XtcgDVykJsl
	BapYKF6xzBUWruohANfHSkW0kn5CCNtOZXkgIWvIRdam+bZULPRSqHFM74sm1Mwv7Zo6E4raXy3yF
	3k14dZnZ3OGvkQYVwpUoAG0kisBE2uRnKPnMJKHInPczUz57AoK92jKo/2ySgsujQ5BMJ1JO1ckwD
	BxniTKBhH6u+4KVdJioQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfba2-00000006tvp-3DJE;
	Tue, 13 Jan 2026 10:24:56 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfba0-00000006tvO-4A8F
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 10:24:54 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-382fd8aaa6eso53866251fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 02:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768299891; x=1768904691; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=IROk3zwvFfwqCS4jfVF8XI8IEuWgNMzq4T6RwhvSvUTSxamPZB2m5zUk/+cvyTvGYj
         UgxfUeW7FoU89qXwv7XFB2VqAIfqyy3gDm9Ym44aAXwRU1DcUia4x1b10CYfvcYWzOLP
         xWwQZ5Or9xgbTGaLmkD7VY7QJLs9O5wpFSz9TezA+d1zTLlZw1oA5OsQPglS+F42ZDff
         OmOsjzk4DhfLWndq87/kvWR/AlgSo8drL/rkes5OU5sRBJjsDeZit531k3bzNM9aS4z5
         n1OocVXfoiRGWx6dxJDLuFCjvYwjJCs42cT8lwvxpasXQ5gv0dUweJhfcSk9GDBNSyws
         2gNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768299891; x=1768904691;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=VempWTreJ1MlEHKknMSEvfFqiBXUvVQLpbirBjYpoahDNM9AkgWMPMOICjgtErF4Zj
         FwLMM4zQzF4SMtJUi72GrviF040fkrSRyCkgy5pnZcZ43hQvZd6diIdMDQ4Bzylf205l
         8dOJyJMzj9GS/L371tZsjqhUcPlah6mvPct5893dP8JFjk34F3x/QHcMjy/HqzL7le6p
         BsyPQgcDDnmSpMg8mnrJ89cVfPJ3+xPeAKIgM5IkEXjnsfpz/4sjjHKD41Sf+W/V3kGq
         22gG9/ja4GC6frpj3buiNpG4Zl/Sg/WKAQMHyf7yiue6TXu3jqoGQbjJLBOB+/SYGV2T
         UHxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1NdR3JogJdMGwd4jxIc8kLvVpRhrNw781lIkQAZgtMiOESPJaGQ2lnP1H8NFneP6XafvTKI4i4KdScQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzL936hHN2uVwgJRcdb1NU8gOemfmwys/TLKiJb2TQSIRJS5r2N
	2xAbxAUqGe6QjEAjPbCwvp8bcNWBzCYCkTfwhq2A108R4iZKAodq/zMFTAs/GA==
X-Gm-Gg: AY/fxX6wBR7UHGqz3w92/+URvc5yRvoe+yqhLoVIS4sLqbO7l5Q/uiSnY9L204kzv7r
	v32GkQZnDs10KSWV8cMrLom+R+tE4PDEsMYL5f6oDRZ8pumijjwSZsC5Y2jCb/IHdUCLKZXAGkk
	7lk8bvCTGi+h5fZ7GGQ0QTlwjwWBZHiEYIEm8tLXgHlftfPKS0vPjuTi215PLDreOs0b9wlH4YS
	vddolSQULiM9HRsH6dahk9bWTJskjL6jXneRVhClqshzcFsqAk4N7z2CUB5pkpqS/UFYi83c4H9
	8up7z2gGc/EQAem31D9Sfee8Lg7LDnKEb1hurxgWY+7DNjdL1q3ttainl1/badcpLZOttuGOzTs
	nPG+g8/Pe3oWmuwtJIbGbDkgktC+GYTDkb1Bi7cLj4XMQauEk5eU1EDhpp6iPpqJiYbK9ogLNbu
	Ul5FBYj0Hqn73hhSkoKIZ2tFeKOKLLqQfWRFdXd0SlraF+YyBYy/OR4wF1nHDiFsHji1sH
X-Google-Smtp-Source: AGHT+IEOoK2sWcGzQ5k4NJjsFR/RmdeWAB9vvZrFfNJ0u+S6dsEFK74/fdYnqiqEV2XmHMt6sJ390w==
X-Received: by 2002:a05:6512:138b:b0:598:e851:1db3 with SMTP id 2adb3069b0e04-59b6ef05760mr8236951e87.11.1768293628066;
        Tue, 13 Jan 2026 00:40:28 -0800 (PST)
Received: from [172.20.10.9] (mobile-access-c1d2ca-216.dhcp.inet.fi. [193.210.202.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72f3ae82sm4416299e87.71.2026.01.13.00.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:40:27 -0800 (PST)
Message-ID: <f861a1c6-7ec7-477c-bc42-f9aaf6724bed@gmail.com>
Date: Tue, 13 Jan 2026 10:40:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/29] arch, mm: consolidate hugetlb early reservation
From: Kalle Niemi <kaleposti@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Ritesh Harjani <ritesh.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260112142323.495fc43e662e7d276b0fa371@linux-foundation.org>
 <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Content-Language: en-US
In-Reply-To: <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_022453_041255_993ADD76 
X-CRM114-Status: GOOD (  11.02  )
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

T24gMS8xMy8yNiAwODo1MCwgS2FsbGUgTmllbWkgd3JvdGU6Cj4gT24gMS8xMy8yNiAwMDoyMywg
QW5kcmV3IE1vcnRvbiB3cm90ZToKPj4gT24gU3VuLCAxMSBKYW4gMjAyNiAxMDoyMDozNCArMDIw
MCBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+Pj4gdjMgY2hhbmdl
czoKPj4+ICogZml4IGVtcHR5X3plcm9fcGFnZSBpbml0aWFsaXphdGlvbiBvbiBhcm0KPj4+ICog
Zml4IFpPTkVfRE1BIGxpbWl0IGNhbGN1bGF0aW9uIG9uIHBvd2VycGMKPj4+ICogYWRkIEFja3MK
Pj4KPj4gdXBkYXRlZCwgdGhhbmtzLsKgIEknbGwgc3VwcHJlc3MgdGhlIGVuc3VpbmcgZW1haWwg
Zmxvb2QuCj4+Cj4+IEthbGxlLCBjYW4geW91IHBsZWFzZSByZXRlc3Qgc29tZXRpbWUsIHNlZSBp
ZiB0aGUgQmVhZ2xlQm9uZSBCbGFjayBib290Cj4+IGZhaWx1cmUgd2FzIGZpeGVkPwo+Pgo+PiBT
ZWVtcyB3ZSBoYXZlbid0IGhlYXJkIGJhY2sgZnJvbSBybWsgcmVnYXJkaW5nCj4+IGh0dHBzOi8v
bGttbC5rZXJuZWwub3JnL3IvYVZyVURlU2txcVk5WkN0U0BzaGVsbC5hcm1saW51eC5vcmcudWsu
Cj4gCj4gSGVsbG8hCj4gCj4gSSB3aWxsIHRlc3QgdGhpcyB2MyBwYXRjaCBBU0FQIGFuZCByZXBs
eSByZXN1bHRzIGhlcmUuCj4gQ29sbGVjdGl2ZSBzb3JyeSBmb3IgdGhlIGRlbGF5OyBJIGhhdmUg
YmVlbiBidXN5IQo+IAo+IEJSCj4gS2FsbGUKCkhlbGxvIQoKSSB0cmllZCB0aGlzIHBhdGNoIGJ5
IGNsb25pbmcgCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3JwcHQvbGludXguZ2l0L2xvZy8/aD1odWdldGxiLWluaXQvdjMKCkJvb3RzIHN1Y2Nlc2Z1bGx5
IG9uIEJlYWdsZUJvbmUgQmxhY2shCgpCUgpLYWxsZQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
