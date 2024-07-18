Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C247CC3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 16:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljBCdDCoxyIMuU426ZzZ00V/w7sbb4P6JQrgAHY3cKo=; b=rmndnW37cPFkDD
	nTyEFoUNSPAcKHHHS0q2a6c+pnb/cO5yqUnyc7iZzR2QTskWRY4+ae8NhJ4jOts0o2Oj6gbWCzpf4
	4zokQZS8Y6ivTkA1u6jLIixadWUleRmLn0xHVEJ/HliWl8xpmVmf5NuNCpzage8HqcFWOJEW8A+wY
	NL9nCK98OLETHy8KGKZAqiKyM5cniVs1u8+it2tmXLE/mz303Pq6EjxX0mwQIedycqyfDogNOgRAH
	3MDjGnv0iBd8Te326SDu2pDa38nBcMaLvdt2QGiEufX4a/F4O3ssfos8oZNHpuzCXrJ4Zq4Ek/A9i
	tjG9IqVhVDaatLOLOMCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUTrt-0000000HYrt-2vku;
	Thu, 18 Jul 2024 16:20:33 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUTrp-0000000HYqI-46Wa
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 16:20:31 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso87051366b.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 09:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721319627; x=1721924427; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7GxSN83wkZ2Gt6sREDponA0vNCLDJLytERV2W14H4I=;
        b=J2p8Mz1Yw4lRfmtmw/bA9PrQFhsyD4KWDesZy6mK/z3e/t+GBFdwx+rgIR5aP+2NYV
         qZlb5eWvxAii8WOviULI1H7walOH/dalx10pOSe7RbALKnjFJF9uu+wdAiyFP4ONwiju
         nABoHvTmUbHL7+V09DyrPp2Xeg4H+275+R168KNnWgYamVE2RfovC/HP5YfMMk0ucuuw
         knk3NPt+dlEFxB1RBwa7G2vfENGHpLzAV1kgkYPOuGCl8EPDJPQJUdJw+rDml5c+D3mg
         de11S2cu2ds7F55KASzX/2oCzMeqqRY9SX2n/QmYU4zDqbamIFbZf2SDpf4U6raq/90m
         102w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721319627; x=1721924427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7GxSN83wkZ2Gt6sREDponA0vNCLDJLytERV2W14H4I=;
        b=h3vaMuHZyFj8ShPsfUu0mMLg9gufHaqFZQ/l10K7UWINicidvUf7rvuLXjF6wl/Wst
         whn1MvodGwG/KEesCpW+qaONXOOK47k1YX03G5tv1YMJzUi+J33kGVEtS6TUIIIMvzxh
         fIS18oChuF168q03rAGQqr6C9Krv04R+M3dRYRZp8HN8xE0EtT1lE6G9nyitsSSi802K
         Tj1mByrAAGxkoaFW56B8/IOVlgSL3VqDgb4x+AiZdnEfvUGkmNl84y+j1YznpMvLpRTs
         FzYXYfmJg9zNpglSG0r4iHpiysifsbx5qiOEI8j3l1Ps0GPpvnUPbsBnT7IaBru++zru
         zK7A==
X-Forwarded-Encrypted: i=1; AJvYcCVq450BD/ZuxMiUCwr5SQaG1VLedJxKXiyInMCneNRdznVR4FaDz08FJtLx++awex3a013dXvIz1dHUtWW5NcIQFQ53ODUQa5t0qXjbsQjP
X-Gm-Message-State: AOJu0Yx9hj6hkS/ho4CPuso4EKbUNY3/+WlMQ1wem0+i+VQPh0VY1NCU
	OOf3VEKq+kjiW4DM5yGJDKLNviAR0tPwPAalJLgCg0Fy0Nd37w/hrC5SZBp7npbICHOjPlWwqFa
	aC5qR54XXkbgFNYqNBv15h7P5GdIt9AYXur5izA==
X-Google-Smtp-Source: AGHT+IFWxHKkplzJKRLqT5zU4jO3082AA0xXCpFalTdhVnKTUbtkr/nNZqNjYbQOPoY/7FuHv/90dOwfuXx6JMhiz28=
X-Received: by 2002:a17:906:6c4:b0:a77:d1ea:ab39 with SMTP id
 a640c23a62f3a-a7a0115bfe2mr329353566b.16.1721319627120; Thu, 18 Jul 2024
 09:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-4-alexghiti@rivosinc.com> <20240717-e7104dac172d9f2cbc25d9c6@orel>
 <fb03939b-502b-410a-85f5-2785b2bd0676@ghiti.fr> <20240718-d583846f09bc103b7eab6b4e@orel>
In-Reply-To: <20240718-d583846f09bc103b7eab6b4e@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 18 Jul 2024 18:20:15 +0200
Message-ID: <CAHVXubjQo9WaHu1FwEaJ496xpYtshrOkkw_HP9cP_3rWjnMxzw@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] riscv: Implement cmpxchg8/16() using Zabha
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_092030_039360_06756410 
X-CRM114-Status: GOOD (  11.09  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMTgsIDIwMjQgYXQgNjowNuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdWwgMTgsIDIwMjQgYXQgMDI6NTA6
MjhQTSBHTVQsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiAuLi4KPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiA+ID4gKyAgICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICggICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgIHByZXBlbmQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAiICAgICAgIGFtb2NhcyIgY2FzX3NmeCAiICUwLCAlejIsICUxXG4iICAgICAgICBc
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgYXBwZW5kICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgIDogIismciIgKHIp
LCAiK0EiICgqKHApKSAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiArICAgICAgICAg
ICAgICAgICA6ICJySiIgKG4pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgOiAibWVtb3J5Iik7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICsgICAgICAgICBnb3RvIGVuZDsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiArIH0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICtub196YWJoYV96YWNhczo7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gdW5uZWNlc3Nhcnkg
Owo+ID4KPiA+Cj4gPiBBY3R1YWxseSBpdCBpcywgaXQgZml4ZXMgYSB3YXJuaW5nIGVuY291bnRl
cmVkIG9uIGxsdm06Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0
MDUyODE5MzExMC5HQTIxOTY4NTVAdGhlbGlvLTM5OTBYLwo+Cj4gSSdtIG5vdCBjb21wbGFpbmlu
ZyBhYm91dCB0aGUgJ2VuZDonIGxhYmVsLiBUaGF0IG9uZSB3ZSBuZWVkICc7JyBiZWNhdXNlCj4g
dGhlcmUncyBubyBmb2xsb3dpbmcgc3RhdGVtZW50IGFuZCBsYWJlbHMgbXVzdCBiZSBmb2xsb3dl
ZCBieSBhIHN0YXRlbWVudC4KPiBCdXQgbm9femFiaGFfemFjYXMgYWx3YXlzIGhhcyBmb2xsb3dp
bmcgc3RhdGVtZW50cy4KCk15IGJhZCwgdGhhdCdzIGFub3RoZXIgd2FybmluZyB0aGF0IGlzIGVt
aXR0ZWQgYnkgbGx2bSBhbmQgcmVxdWlyZXMgdGhlICc7JzoKCi4uL2luY2x1ZGUvbGludXgvYXRv
bWljL2F0b21pYy1hcmNoLWZhbGxiYWNrLmg6MjAyNjo5OiB3YXJuaW5nOiBsYWJlbApmb2xsb3dl
ZCBieSBhIGRlY2xhcmF0aW9uIGlzIGEgQzIzIGV4dGVuc2lvbiBbLVdjMjMtZXh0ZW5zaW9uc10K
IDIwMjYgfCAgICAgICAgIHJldHVybiByYXdfY21weGNoZygmdi0+Y291bnRlciwgb2xkLCBuZXcp
OwogICAgICB8ICAgICAgICAgICAgICAgIF4KLi4vaW5jbHVkZS9saW51eC9hdG9taWMvYXRvbWlj
LWFyY2gtZmFsbGJhY2suaDo1NToyMTogbm90ZTogZXhwYW5kZWQKZnJvbSBtYWNybyAncmF3X2Nt
cHhjaGcnCiAgIDU1IHwgI2RlZmluZSByYXdfY21weGNoZyBhcmNoX2NtcHhjaGcKICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgIF4KLi4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmg6
MzEwOjI6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8KJ2FyY2hfY21weGNoZycKICAzMTAgfCAg
ICAgICAgIF9hcmNoX2NtcHhjaGcoKHB0ciksIChvKSwgKG4pLCAiLnJsIiwgIi5hcXJsIiwKICAg
ICAgICAgXAogICAgICB8ICAgICAgICAgXgouLi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhj
aGcuaDoyNjk6Mzogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybwonX2FyY2hfY21weGNoZycKICAy
NjkgfCAgICAgICAgICAgICAgICAgX19hcmNoX2NtcHhjaGdfbWFza2VkKHNjX3NmeCwgIi5iIiBj
YXNfc2Z4LAogICAgICAgICBcCiAgICAgIHwgICAgICAgICAgICAgICAgIF4KLi4vYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jbXB4Y2hnLmg6MTc4OjI6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8K
J19fYXJjaF9jbXB4Y2hnX21hc2tlZCcKICAxNzggfCAgICAgICAgIHUzMiAqX19wdHIzMmIgPSAo
dTMyICopKCh1bG9uZykocCkgJiB+MHgzKTsKICAgICAgICAgXAogICAgICB8ICAgICAgICAgXgoK
Cj4KPiBUaGFua3MsCj4gZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
