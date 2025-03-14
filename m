Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE03EC28B2F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NRAYJK16j3gNDDni0RyK3uzCJ16Q9+42EODiJ4bkwfk=; b=jSPvOCo/tOt3qM
	J2iEbh205ulMG77WkfOUj2nTP1f3iqqr8/uXLy5xnDzyB1NYruGNSZflFFtzdmxbGv7br3H+TXElA
	L3wWIAG4eEpQNFyYTGtbqD0NM9QQmrRIYCTfd7Rj5SwuaU7kz6LqDThfEI8l0cdFkND/3E3729iot
	pVol7lWMLE+PQg4G1oNwlEMhIaIByNRTyN+2r7dp/2Zc8cfIrPkqZYg+5TjRPsmh9VEO4HrFvx0Pe
	MIWwjO3XFs4w3FQH3cmjYg5AerqdOHNdq8/VAguDACcaWutpdbWPwNpQGnlD7L6waqj6KFbuuv+DG
	ZnHaQEnyuNL81LS5cB+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lF-0000000DXGs-2tH3;
	Fri, 14 Mar 2025 08:51:21 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0QB-0000000DTId-25kY
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 08:29:36 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3d45503af24so15914955ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 01:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741940974; x=1742545774; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5fOLOajSrBR6ZehlHGaviL9PwTdryjms/axPqZeS40=;
        b=ToBQwMYsLaXdq1KCGlzjLfqFuCvSF6Tb61Iq8XIMdxrfLu/QvckWpxQ+EO2l/s3tpE
         5ckB2KSpXiQ28HcUXMk1fUyhGA5fcBN+60MOLi4FiFVDqizb+fJ0y7bYsNRBtBAfhR52
         lGHk8txF+e1WRJw61iaE+/LTo1C4riER9IyI7Yvs3VpfCZcbHg4XmX3uakuVnV+NC+73
         LzTq6C3nOuPe2EiqDRdOFprI1qHQJgkwnzkXW+X69GqDcbgNvxrwd13W3f7ws2T1sm/E
         jQmgJ6A8eKet7dCzBTPbM8HkbYbsa0bnH4HDoafS0XW7hPsalyWG9RC8cWVgYqYz3uHs
         K+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940974; x=1742545774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5fOLOajSrBR6ZehlHGaviL9PwTdryjms/axPqZeS40=;
        b=OdQm9m7j1AXoaTmPG4x3dEDN5Eo7xtI92X0XAmsZd+d1aYiTrHIbqyDZUUrRckbdD6
         8pZPmkVyQe578Oy/XbWBjyv9h0Wh3mx7aqIc+gZS++x7N1KYwoloRJUAwR5f1YTRBhaM
         LszWrP9fEpPmEhAraq4JYPtLQruHjjL+IqRbDM1/F0Pw5EIADXSbA2GKQ8t/RejSbaO3
         U9uO4zFK84I2I7UcW2mZVark2rwk7NakPzTfA2v0BnzOs7ahRYizZEI4ghfknKS91TKz
         +3jpM0UU/gJt7Bi5hWkybPmYwpBHyNgIudW9xeHhh4Kwcti/w6cGBNkzd7fRR+C+NOVJ
         LNaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIhYYv6msy3hq538NIgR1qvS972g/fZ2LVIfVkvDTTf8zJW3EtC2yzhYKuw6Mt2Pvl3lXXx+kd38+0Bw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEtu+xNDA9jfgHQRlDt0UXsthmDSYzpZGm5fNh7KWvhw7MEHzb
	v51WEO4KIAUw8WLsy8Cp1T9f0Ef1x8m0bGskGhszxU4worIs26E7dZvSprtGbCQUBJlD42lg6YX
	MzBWzdzAvxJv332csy4wy8/DxQE8vK0/IOj7h7A==
X-Gm-Gg: ASbGncsm37owkObUOAERx9JvbrNBIh1Jn08hT24Qf2EV6H/HcsTvCeobns2E4jG/4cN
	01zQiwEAyZtgOe/IbFNvcCqGPYE7d4jj+Xjo7DpAEon5shqoDNsbJbfr3WCSdSGFfDhm18zz7mL
	VVlyB9VEOufd+VbeJs38JAdg6Tny+NforIHj3fPA==
X-Google-Smtp-Source: AGHT+IF1IzeFSXc5t6kVVWv8i8rDzaqUJRpsZnVqf/BXWhjXn8Eu2b32nuMauWmsFnxhdPq/tzqKBzKTgmPHDPPhvSg=
X-Received: by 2002:a05:6e02:1fc4:b0:3d4:70ab:f96f with SMTP id
 e9e14a558f8ab-3d483a09d1cmr11887495ab.8.1741940974641; Fri, 14 Mar 2025
 01:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-8-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-8-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:29:24 +0800
X-Gm-Features: AQ5f1JohKPAVxeH34lYpuQcdUL49PMtbCo3vcu197rMCUGQtnZKVNP3QmOtRhiI
Message-ID: <CANXhq0qfX4M_F61fdHb-vQBUtw__1RNWvw7ePJsE8RJBc-6+-w@mail.gmail.com>
Subject: Re: [PATCH v11 08/27] riscv mmu: teach pte_mkwrite to manufacture
 shadow stack PTEs
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_012935_536213_6BABEBDA 
X-CRM114-Status: GOOD (  18.87  )
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

T24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMTE6NDLigK9QTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBwdGVfbWt3cml0ZSBjcmVhdGVzIFBURXMgd2l0aCBXUklU
RSBlbmNvZGluZ3MgZm9yIHVuZGVybHlpbmcgYXJjaC4KPiBVbmRlcmx5aW5nIGFyY2ggY2FuIGhh
dmUgdHdvIHR5cGVzIG9mIHdyaXRlYWJsZSBtYXBwaW5ncy4gT25lIHRoYXQgY2FuIGJlCj4gd3Jp
dHRlbiB1c2luZyByZWd1bGFyIHN0b3JlIGluc3RydWN0aW9ucy4gQW5vdGhlciBvbmUgdGhhdCBj
YW4gb25seSBiZQo+IHdyaXR0ZW4gdXNpbmcgc3BlY2lhbGl6ZWQgc3RvcmUgaW5zdHJ1Y3Rpb25z
IChsaWtlIHNoYWRvdyBzdGFjayBzdG9yZXMpLgo+IHB0ZV9ta3dyaXRlIGNhbiBzZWxlY3Qgd3Jp
dGUgUFRFIGVuY29kaW5nIGJhc2VkIG9uIFZNQSByYW5nZSAoaS5lLgo+IFZNX1NIQURPV19TVEFD
SykKPgo+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+
IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4g
LS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgIDcgKysrKysrKwo+ICBh
cmNoL3Jpc2N2L21tL3BndGFibGUuYyAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysrCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmgKPiBpbmRleCBlZGU0MzE4NWZmZGYuLmNjZDJmYTM0YWZiOCAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oCj4gQEAgLTQxNiw2ICs0MTYsMTAgQEAgc3RhdGljIGlubGluZSBwdGVf
dCBwdGVfd3Jwcm90ZWN0KHB0ZV90IHB0ZSkKPgo+ICAvKiBzdGF0aWMgaW5saW5lIHB0ZV90IHB0
ZV9ta3JlYWQocHRlX3QgcHRlKSAqLwo+Cj4gK3N0cnVjdCB2bV9hcmVhX3N0cnVjdDsKPiArcHRl
X3QgcHRlX21rd3JpdGUocHRlX3QgcHRlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Cj4g
KyNkZWZpbmUgcHRlX21rd3JpdGUgcHRlX21rd3JpdGUKPiArCj4gIHN0YXRpYyBpbmxpbmUgcHRl
X3QgcHRlX21rd3JpdGVfbm92bWEocHRlX3QgcHRlKQo+ICB7Cj4gICAgICAgICByZXR1cm4gX19w
dGUocHRlX3ZhbChwdGUpIHwgX1BBR0VfV1JJVEUpOwo+IEBAIC03NDksNiArNzUzLDkgQEAgc3Rh
dGljIGlubGluZSBwbWRfdCBwbWRfbWt5b3VuZyhwbWRfdCBwbWQpCj4gICAgICAgICByZXR1cm4g
cHRlX3BtZChwdGVfbWt5b3VuZyhwbWRfcHRlKHBtZCkpKTsKPiAgfQo+Cj4gK3BtZF90IHBtZF9t
a3dyaXRlKHBtZF90IHBtZCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOwo+ICsjZGVmaW5l
IHBtZF9ta3dyaXRlIHBtZF9ta3dyaXRlCj4gKwo+ICBzdGF0aWMgaW5saW5lIHBtZF90IHBtZF9t
a3dyaXRlX25vdm1hKHBtZF90IHBtZCkKPiAgewo+ICAgICAgICAgcmV0dXJuIHB0ZV9wbWQocHRl
X21rd3JpdGVfbm92bWEocG1kX3B0ZShwbWQpKSk7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
bW0vcGd0YWJsZS5jIGIvYXJjaC9yaXNjdi9tbS9wZ3RhYmxlLmMKPiBpbmRleCA0YWU2NzMyNGY5
OTIuLmJlNWQzODU0NmJiMyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL3BndGFibGUuYwo+
ICsrKyBiL2FyY2gvcmlzY3YvbW0vcGd0YWJsZS5jCj4gQEAgLTE1NSwzICsxNTUsMjAgQEAgcG1k
X3QgcG1kcF9jb2xsYXBzZV9mbHVzaChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAgICAg
ICAgIHJldHVybiBwbWQ7Cj4gIH0KPiAgI2VuZGlmIC8qIENPTkZJR19UUkFOU1BBUkVOVF9IVUdF
UEFHRSAqLwo+ICsKPiArcHRlX3QgcHRlX21rd3JpdGUocHRlX3QgcHRlLCBzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSkKPiArewo+ICsgICAgICAgaWYgKHZtYS0+dm1fZmxhZ3MgJiBWTV9TSEFE
T1dfU1RBQ0spCj4gKyAgICAgICAgICAgICAgIHJldHVybiBwdGVfbWt3cml0ZV9zaHN0ayhwdGUp
Owo+ICsKPiArICAgICAgIHJldHVybiBwdGVfbWt3cml0ZV9ub3ZtYShwdGUpOwo+ICt9Cj4gKwo+
ICtwbWRfdCBwbWRfbWt3cml0ZShwbWRfdCBwbWQsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
KQo+ICt7Cj4gKyAgICAgICBpZiAodm1hLT52bV9mbGFncyAmIFZNX1NIQURPV19TVEFDSykKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIHBtZF9ta3dyaXRlX3Noc3RrKHBtZCk7Cj4gKwo+ICsgICAg
ICAgcmV0dXJuIHBtZF9ta3dyaXRlX25vdm1hKHBtZCk7Cj4gK30KPiArCj4KTEdUTS4KClJldmll
d2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gLS0KPiAyLjM0LjEKPgo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
