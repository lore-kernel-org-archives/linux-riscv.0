Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD73CCD199
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JznZipAEfcRs/sYZNRqUWwL0NGfelj5m+G9Nc+xwfC4=; b=my3VkdzC7suuIrhn8rHmwNgV0M
	lK9Hi6PWHPWfkHwdDp5LegFQHsj26CcM6dAtBOTnMxHQll3SKNQogYwa9WQAKlxfS6JEXcPAJFyPE
	OcYq39C2qX2d/7PC+8aPA5Wn49ZU1Q9nzFJ+x0mm1MUhY4fPtjvmHYe2W+XbwDDMqaef8l2oiD4/L
	emQTKunw2ae2oum3e75GCkgo7pGqIaGu55zMCN28ZxbgJcc07Hp1axjBsC7+KCWabJkZq2OBcbMal
	fWBGm1jm6B+b6OIXe8v/9rFRLlUa8XloRM87iDeYZvgboHwP1JG06h7uJvUEnUjlAynbxgaBtS+zb
	iJTSsgDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Pwi-00000005Clp-3h06;
	Thu, 16 Oct 2025 15:31:16 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Pwe-00000005CiA-0XZ1
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 15:31:15 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b5a631b9c82so585203a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 08:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760628671; x=1761233471; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oPplYqAzpwU4gxjQp2Rw6jkCzCOQWdHbasm8KJuRgKg=;
        b=CUkIabeE2RUuEnOn44SB6nla4rEvG6FGdt0/c61iHQHfFeoqf5kT4G/EDItVlh/mug
         YZx/x/8z+hU6whEycU8N4stoqNzrUxTT0becI8AqdCBLkhQtpHbsQjmVrAyZUQXo1w37
         aLPJgMhtoOD4+xF7MnBtPDv24axYO1mM3ByMNPnRL9sZi/5iEyTfSfe09NQI2gnse5WU
         O5sea9dU+lCbuQVRwj36FKDRB6AfSN75BTR6a/0BkvhZYfIE1H5a32c1mn34Qs+tOmRI
         xOVH3gujUHbpcpgM6qcijCVAKv9LMsGT0RdY45krBW+Nzawxqob/q8/god2oh0RmVhvw
         8mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760628671; x=1761233471;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oPplYqAzpwU4gxjQp2Rw6jkCzCOQWdHbasm8KJuRgKg=;
        b=HQmnXT/ztvgyyYMYhFBQWVCCBFRjJqTLRavTj0XyocBpbp9ls0VTRXUSAdM7ZlGSOM
         2GHQR4RP15t2Crcp8XWaR4jGeVc/qyAzBwVJfz762M/KfTLruNLefdCdS5lt19fNwxUT
         xuHREdXcbOPESigGI7esWXzxEKQ8Zp6bPw2x7EVwuLVDNZATx/+t5mOCD0+b9VxE6JOk
         /rk50rLZF0NbbYGSohsvrW/pNtoOa9oG/3G+JQyBc3Ui+8AaAOc7r3nc0l89UyUTuBCB
         HSowwpUavXYhbwCLRo5bdGnjQpH4omzG7KHPaPhsubNByyxa4ios7xV1djBxDVSwi4eF
         G5qA==
X-Forwarded-Encrypted: i=1; AJvYcCXXOxcBNJB5w2zer6Rgl5na2LX3AZXWHzQvafs7AsaFn2YlbCSKcVK3Qj4A2PbKLTwKi2mfPcc21WX0Tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhINEqdvVij/GiBqd3UrMPIpv+qxGu3pzV/ydrwFqavkXHIBFn
	tszqgystCZk3kyGt/qlidyshw6bUAgYJCdToSHfW9Za5gkI+TXeH4Qw/FEvscLCtG9o=
X-Gm-Gg: ASbGncvV6G4i79VYdhgWd6r66qdYeGUiXn3vDz7USRN0eJ/PP7vcrRCIMWMjb92nyih
	RqNcvijkei/cTFwtqlDGxSVWRqNf84HWs+7tyHb1eBTE5ZOMVwo9FMZ/IafGmtGUgenq7t6Ahmp
	crzGT8x6B7WxvhtkIppNjntfw7FWBqlHic0AfjZ704Gg76tyB5iWOi6PqwoxJ9UNLibM4Usx5cG
	WPTx+lLq3Y9eq6Y8Cmcnww7n8Og+7tUtUkal38688ozLIxFBwX6Cai9RtYXh2ROTpRRxMDJdhpE
	qbmizfV6umqXKoXwZ0Ln9VaWO8HR17f2lwe+mi6Wk8UeozeEar4Rb2iuVwTvDGZU9WON7d//UHP
	1du6ugMmM0mf3XqrHgT2N4dgQGGYovNAz+o6fbc8dV5AoImAaPqfAAss39NjHmPOfWRZ1KgF/rH
	Qk2/CRNhZm3w==
X-Google-Smtp-Source: AGHT+IHwQKe9LAMk6ozD/GRZ/4wHAc2uQ93fezPeXjgomM0kYDp4EL0uCq03NAVcolelP7TLwPE5CA==
X-Received: by 2002:a17:902:db0b:b0:24c:d6c6:c656 with SMTP id d9443c01a7336-290c9c8a84bmr4369005ad.4.1760628671090;
        Thu, 16 Oct 2025 08:31:11 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099343065sm34122695ad.26.2025.10.16.08.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:31:10 -0700 (PDT)
Date: Thu, 16 Oct 2025 08:31:07 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Zong Li <zong.li@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com,
	richard.henderson@linaro.org, jim.shu@sifive.com,
	andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
	alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v21 25/28] riscv: create a config for shadow stack and
 landing pad instr support
Message-ID: <aPEPuyYo_e4DFSMJ@debug.ba.rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
 <20251015-v5_user_cfi_series-v21-25-6a07856e90e7@rivosinc.com>
 <CANXhq0qHT=nnwG3SX3s_D3G2QqKGmQBbdzFwiQ5MMkimxCHJHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0qHT=nnwG3SX3s_D3G2QqKGmQBbdzFwiQ5MMkimxCHJHQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_083112_294325_A0141B5C 
X-CRM114-Status: GOOD (  19.55  )
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

T24gVGh1LCBPY3QgMTYsIDIwMjUgYXQgMDQ6Mjk6NDhQTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
Pk9uIFRodSwgT2N0IDE2LCAyMDI1IGF0IDI6MTTigK9BTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4+Cj4+IFRoaXMgcGF0Y2ggY3JlYXRlcyBhIGNvbmZpZyBmb3Ig
c2hhZG93IHN0YWNrIHN1cHBvcnQgYW5kIGxhbmRpbmcgcGFkIGluc3RyCj4+IHN1cHBvcnQuIFNo
YWRvdyBzdGFjayBzdXBwb3J0IGFuZCBsYW5kaW5nIGluc3RyIHN1cHBvcnQgY2FuIGJlIGVuYWJs
ZWQgYnkKPj4gc2VsZWN0aW5nIGBDT05GSUdfUklTQ1ZfVVNFUl9DRklgLiBTZWxlY3RpbmcgYENP
TkZJR19SSVNDVl9VU0VSX0NGSWAgd2lyZXMKPj4gdXAgcGF0aCB0byBlbnVtZXJhdGUgQ1BVIHN1
cHBvcnQgYW5kIGlmIGNwdSBzdXBwb3J0IGV4aXN0cywga2VybmVsIHdpbGwKPj4gc3VwcG9ydCBj
cHUgYXNzaXN0ZWQgdXNlciBtb2RlIGNmaS4KPj4KPj4gSWYgQ09ORklHX1JJU0NWX1VTRVJfQ0ZJ
IGlzIHNlbGVjdGVkLCBzZWxlY3QgYEFSQ0hfVVNFU19ISUdIX1ZNQV9GTEFHU2AsCj4+IGBBUkNI
X0hBU19VU0VSX1NIQURPV19TVEFDS2AgYW5kIERZTkFNSUNfU0lHRlJBTUUgZm9yIHJpc2N2Lgo+
Pgo+PiBSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+PiBTaWduZWQt
b2ZmLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+ICBhcmNo
L3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICB8IDIxICsrKysrKysrKysrKysrKysrKysr
Kwo+PiAgYXJjaC9yaXNjdi9jb25maWdzL2hhcmRlbmluZy5jb25maWcgfCAgNCArKysrCj4+ICAy
IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiBpbmRleCAwYzYwMzhkYzVkZmQu
LmFlZDAzM2UyYjUyNiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4+ICsrKyBi
L2FyY2gvcmlzY3YvS2NvbmZpZwo+PiBAQCAtMTE0Niw2ICsxMTQ2LDI3IEBAIGNvbmZpZyBSQU5E
T01JWkVfQkFTRQo+Pgo+PiAgICAgICAgICAgIElmIHVuc3VyZSwgc2F5IE4uCj4+Cj4+ICtjb25m
aWcgUklTQ1ZfVVNFUl9DRkkKPj4gKyAgICAgICBkZWZfYm9vbCB5Cj4+ICsgICAgICAgYm9vbCAi
cmlzY3YgdXNlcnNwYWNlIGNvbnRyb2wgZmxvdyBpbnRlZ3JpdHkiCj4+ICsgICAgICAgZGVwZW5k
cyBvbiA2NEJJVCAmJiAkKGNjLW9wdGlvbiwtbWFiaT1scDY0IC1tYXJjaD1ydjY0aW1hX3ppY2Zp
c3MpCj4+ICsgICAgICAgZGVwZW5kcyBvbiBSSVNDVl9BTFRFUk5BVElWRQo+PiArICAgICAgIHNl
bGVjdCBSSVNDVl9TQkkKPj4gKyAgICAgICBzZWxlY3QgQVJDSF9IQVNfVVNFUl9TSEFET1dfU1RB
Q0sKPj4gKyAgICAgICBzZWxlY3QgQVJDSF9VU0VTX0hJR0hfVk1BX0ZMQUdTCj4+ICsgICAgICAg
c2VsZWN0IERZTkFNSUNfU0lHRlJBTUUKPj4gKyAgICAgICBoZWxwCj4+ICsgICAgICAgICBQcm92
aWRlcyBDUFUgYXNzaXN0ZWQgY29udHJvbCBmbG93IGludGVncml0eSB0byB1c2Vyc3BhY2UgdGFz
a3MuCj4+ICsgICAgICAgICBDb250cm9sIGZsb3cgaW50ZWdyaXR5IGlzIHByb3ZpZGVkIGJ5IGlt
cGxlbWVudGluZyBzaGFkb3cgc3RhY2sgZm9yCj4+ICsgICAgICAgICBiYWNrd2FyZCBlZGdlIGFu
ZCBpbmRpcmVjdCBicmFuY2ggdHJhY2tpbmcgZm9yIGZvcndhcmQgZWRnZSBpbiBwcm9ncmFtLgo+
PiArICAgICAgICAgU2hhZG93IHN0YWNrIHByb3RlY3Rpb24gaXMgYSBoYXJkd2FyZSBmZWF0dXJl
IHRoYXQgZGV0ZWN0cyBmdW5jdGlvbgo+PiArICAgICAgICAgcmV0dXJuIGFkZHJlc3MgY29ycnVw
dGlvbi4gVGhpcyBoZWxwcyBtaXRpZ2F0ZSBST1AgYXR0YWNrcy4KPj4gKyAgICAgICAgIEluZGly
ZWN0IGJyYW5jaCB0cmFja2luZyBlbmZvcmNlcyB0aGF0IGFsbCBpbmRpcmVjdCBicmFuY2hlcyBt
dXN0IGxhbmQKPj4gKyAgICAgICAgIG9uIGEgbGFuZGluZyBwYWQgaW5zdHJ1Y3Rpb24gZWxzZSBD
UFUgd2lsbCBmYXVsdC4gVGhpcyBtaXRpZ2F0ZXMgYWdhaW5zdAo+PiArICAgICAgICAgSk9QIC8g
Q09QIGF0dGFja3MuIEFwcGxpY2F0aW9ucyBtdXN0IGJlIGVuYWJsZWQgdG8gdXNlIGl0LCBhbmQg
b2xkIHVzZXItCj4+ICsgICAgICAgICBzcGFjZSBkb2VzIG5vdCBnZXQgcHJvdGVjdGlvbiAiZm9y
IGZyZWUiLgo+PiArICAgICAgICAgZGVmYXVsdCBuLgo+Cj5NYXliZSBpdCBpcyBkZWZhdWx0ICd5
JyBpbnN0ZWFkIG9mICduJwoKYWFoIHllcywgdGhpcyBuZWVkcyB0byBjaGFuZ2UuIHRoYW5rcy4K
SSdsbCBzZWUgaWYgdGhlcmUgYXJlIG90aGVyIHNpZ25pZmljYW50IGlzc3VlcywgaWYgeWVzIHRo
ZW4gSSdsbCBmaXggaXQgaW4gdGhhdAp2ZXJzaW9uLiBFbHNlIEkgcmVxdWVzdCBQYXVsIHRvIGZp
eCBpdC4KCj4KPj4gKwo+PiAgZW5kbWVudSAjICJLZXJuZWwgZmVhdHVyZXMiCj4+Cj4+ICBtZW51
ICJCb290IG9wdGlvbnMiCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2NvbmZpZ3MvaGFyZGVu
aW5nLmNvbmZpZyBiL2FyY2gvcmlzY3YvY29uZmlncy9oYXJkZW5pbmcuY29uZmlnCj4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMDg5ZjRjZWU4MmY0Cj4+IC0t
LSAvZGV2L251bGwKPj4gKysrIGIvYXJjaC9yaXNjdi9jb25maWdzL2hhcmRlbmluZy5jb25maWcK
Pj4gQEAgLTAsMCArMSw0IEBACj4+ICsjIFJJU0NWIHNwZWNpZmljIGtlcm5lbCBoYXJkZW5pbmcg
b3B0aW9ucwo+PiArCj4+ICsjIEVuYWJsZSBjb250cm9sIGZsb3cgaW50ZWdyaXR5IHN1cHBvcnQg
Zm9yIHVzZXJtb2RlLgo+PiArQ09ORklHX1JJU0NWX1VTRVJfQ0ZJPXkKPj4KPj4gLS0KPj4gMi40
My4wCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
