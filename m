Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A98BCAC5A7
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ob6YH2GVh6dp5O+QkvsCRlOWRwshBaKHCXKt++fFBQ=; b=s44djFprIkXHm6fFQ90KFzBuvb
	/7Cehs0PZD1FtIG7N16uPMQyUdJ+v8k6C1Jn6zB8CdKLMYGeIfEq0sXcfB3Yv33g3xwmKqeRfpCew
	eQYckK5ZXDf9jIOFia/kDfHrpNABeLMXsWEcygwq81316Y5a9X992OH/n3X5fazR3q5M+GPzBMoEX
	558O5curkyw68ws3eUUUC0ZZymw1RTqd9UHjePKUk/zLi+J5dgsPHdg8TGeCra9+RO2SLM6OH329O
	98lKlngJjGYKm1wc1BpASVAPlQdiBq1Fstc33S0SffkEhNchumQd3aA13frVGpRKWFupGRR0VgahP
	VfJCMPiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mzU-0000000A40h-1dmM;
	Thu, 25 Sep 2025 14:30:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mzS-0000000A3xP-3a3A
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Sep 2025 14:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=B/ScXH9deltQU9YLRjtGdHjjN9goLEMoCpX6Ad5jX+g=; b=j/EpVn4jnZ3rrdH8lV+Iirz45j
	Q/rHP9xRn8hierLsKM6C4c/2lp4RUkjVsK466j+e6h9p7AP/IKzSWIldaDReH38vzGE3Cl4jFTlG8
	YyR2jqC+U1gu4PzvnnUSGHpV2Y5A6pWjypcQMOPtz+/xMJLvsmQEGgZsSav1bTaobsp44y5mG7FXH
	um08GgZ1EzqWJA0GaxndVbcgM6ifd3LOB7MkMWmd4qe3S7DULt2LxYtRspwIopkkbMPC7OqV9T5lP
	G9NQrgAVRkGgNg/q9ImdxqbwkOnLS5hqLW4JogtoG7cWmNZiQtJTSlLajXAvPJixOFZ0HGqdJLwnV
	tLn9dqmA==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mzP-00000009Fo8-3Tsn
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 14:30:33 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-27ee55fa1c0so3911285ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1758810629; x=1759415429; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B/ScXH9deltQU9YLRjtGdHjjN9goLEMoCpX6Ad5jX+g=;
        b=XpTwqiDZQ+n9c1dx0CnHxy4yvcZWJFuBndKNGA+nLoaQ7kBg1mPV65EvLtdVMyN4L8
         HK7tzN2O7RtMYRj9qWfy6GuKIRhQvh59klE72mlm6U9VQ6ld8NQUjwXvEmN90MPNpfQb
         vaK7z/0acXkSTpn4Kn1y7UvTiZ+fynEwwWsymTITRzU4pg/DrDdDL1lY1hzmVEMLdhvx
         Xld7J96dDK+DfL+np7pdiPTGG5n+g6oBGQsqlPJ+dXsArNQPfRR9K2KjLb5DF2XMUuCy
         fOZKQ9lX3j1KNdv+Yzx6KqGJQAS/hBmGouQqoO3zgEhJ7xW5G7n0S9aRTbqGH4AumWte
         xU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758810629; x=1759415429;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/ScXH9deltQU9YLRjtGdHjjN9goLEMoCpX6Ad5jX+g=;
        b=hOsESfF2mJZTjCQ1KH/ubaKdy/4k/jHW6oJfNG4Zs4EqyaV36XGoUfFiejYITFoQ9T
         OQlUBqk2lwctv8Pmvxes298OBdKpmRF7EpXt/xtBUTWp5xkQaPCMsNi76sBJX0iz9QUS
         ZFMpNbIe22SE9xXSXmHxp0PEwTDUA76JROPPwg5HJkqPDdFnStJ+5WWjqOhU67Z1GIWZ
         nD7u/bEPKznzOBUdR+zrmgwDYTBbtA/ArOPyKVuiDS+VM7N5ViY6vVP3mCe+qnwyckaY
         a5SmhROngRpgNO6hY6uwI1k3Btbka4dk3XjyVNT7/a9UggzY/cOEjpDxan7ft8OQNYXI
         QU/g==
X-Forwarded-Encrypted: i=1; AJvYcCUXCGkLwgekt3zvwq82euuupOso78ZRXkEOZ/qOFY0Z3U9RsdbPde9XKsYaYRKt63g9tYi9h+EZq6zTCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFKg4IAjcOsIY6D5A0k5rPOGeQZIWaHKiUJz4CtYI0S4Jz5Dus
	RpJmno8nIsO/gLAsInJFZWIC/QOc4LJ2dR7e8Hmx7c0rG/tRUGbT3Jo0c+x6A378EUY=
X-Gm-Gg: ASbGncs5Q11938Glcb0BShZddpiY6YLglh9AV85omYMI0ZAWsuQdSv0YhqtHoAePlqX
	yPf/Rc54MDcraim4ot8+Q0hI7Zq3EKJjGXMA+gvre7qSI5PhqXlm9p60Q1qI/vqXEGwNa3AEbhH
	R2HOrH3zzAnKWPTrkqXN4y4tXev+5kLM/KLtBV26Yva8+C0hXUVRVntJHDyBbHZb0LDg1S1ickT
	lZjyZoMuLEk9GmNGrfQM2g9lnK8kljZ9xMNwqhBvau3sR/Cxl0xOki2e0QEJ/Tbwkem8l8LnB62
	0W6FbgIy04gASqj9PBNZwppwudKfA7spp+xata1v8CnddxqRC+f6/5zt9u1nijZvBIGMvc4UqN+
	ELMtNW5qF/7P4GJ9Dm3lRLTF0fAS9XFii
X-Google-Smtp-Source: AGHT+IGw4nlcyMj0x1ophUEj8Naebsm2dV8OM2R6VcoSoV/iVH85aly4v8pa48kMi8x3QmjHpu5KEw==
X-Received: by 2002:a17:903:3845:b0:26e:7ac9:9d3 with SMTP id d9443c01a7336-27ed722bb71mr33822815ad.18.1758810628859;
        Thu, 25 Sep 2025 07:30:28 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed670f748sm27032895ad.42.2025.09.25.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 07:30:28 -0700 (PDT)
Date: Thu, 25 Sep 2025 07:30:24 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com,
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Florian Weimer <fweimer@redhat.com>, bharrington@redhat.com,
	Aurelien Jarno <aurel32@debian.org>
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
Message-ID: <aNVSAD4Og23rNTms@debug.ba.rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
 <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org>
 <aNQ7D6_ZYMhCdkmL@debug.ba.rivosinc.com>
 <CAFTtA3Nxq0UmXcuN7jmQOiuTbrenKbR4ihH027ya1WWybgLq4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFTtA3Nxq0UmXcuN7jmQOiuTbrenKbR4ihH027ya1WWybgLq4Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_153032_074200_4154B7D7 
X-CRM114-Status: GOOD (  47.82  )
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

T24gVGh1LCBTZXAgMjUsIDIwMjUgYXQgMDc6MzA6MDhBTSAtMDUwMCwgQW5keSBDaGl1IHdyb3Rl
Ogo+SGkgRGVlcGFrLAo+Cj5PbiBXZWQsIFNlcCAyNCwgMjAyNSBhdCAxOjQw4oCvUE0gRGVlcGFr
IEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+Pgo+PiBPbiBXZWQsIFNlcCAyNCwg
MjAyNSBhdCAwODozNjoxMUFNIC0wNjAwLCBQYXVsIFdhbG1zbGV5IHdyb3RlOgo+PiA+SGksCj4+
ID4KPj4gPk9uIFRodSwgMzEgSnVsIDIwMjUsIERlZXBhayBHdXB0YSB3cm90ZToKPj4gPgo+PiA+
WyAuLi4gXQo+PiA+Cj4+ID4+IHZEU08gcmVsYXRlZCBPcGVucyAoaW4gdGhlIGZsdXgpCj4+ID4+
ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+PiA+Pgo+PiA+PiBJIGFtIGxpc3Rp
bmcgdGhlc2Ugb3BlbnMgZm9yIGxheWluZyBvdXQgcGxhbiBhbmQgd2hhdCB0byBleHBlY3QgaW4g
ZnV0dXJlCj4+ID4+IHBhdGNoIHNldHMuIEFuZCBvZiBjb3Vyc2UgZm9yIHRoZSBzYWtlIG9mIGRp
c2N1c3Npb24uCj4+ID4+Cj4+ID4KPj4gPlsgLi4uIF0KPj4gPgo+PiA+PiBIb3cgbWFueSB2RFNP
cwo+PiA+PiAtLS0tLS0tLS0tLS0tLS0KPj4gPj4gU2hhZG93IHN0YWNrIGluc3RydWN0aW9ucyBh
cmUgY2FydmVkIG91dCBvZiB6aW1vcCAobWF5IGJlIG9wZXJhdGlvbnMpIGFuZCBpZiBDUFUKPj4g
Pj4gZG9lc24ndCBpbXBsZW1lbnQgemltb3AsIHRoZXkncmUgaWxsZWdhbCBpbnN0cnVjdGlvbnMu
IEtlcm5lbCBjb3VsZCBiZSBydW5uaW5nIG9uCj4+ID4+IGEgQ1BVIHdoaWNoIG1heSBvciBtYXkg
bm90IGltcGxlbWVudCB6aW1vcC4gQW5kIHRodXMga2VybmVsIHdpbGwgaGF2ZSB0byBjYXJyeSAy
Cj4+ID4+IGRpZmZlcmVudCB2RFNPcyBhbmQgZXhwb3NlIHRoZSBhcHByb3ByaWF0ZSBvbmUgZGVw
ZW5kaW5nIG9uIHdoZXRoZXIgQ1BVIGltcGxlbWVudHMKPj4gPj4gemltb3Agb3Igbm90Lgo+PiA+
Cj4+ID5JZiB3ZSBtZXJnZSB0aGlzIHNlcmllcyB3aXRob3V0IHRoaXMsIHRoZW4gd2hlbiBDRkkg
aXMgZW5hYmxlZCBpbiB0aGUKPj4gPktjb25maWcsIHdlJ2xsIHdpbmQgdXAgd2l0aCBhIG5vbi1w
b3J0YWJsZSBrZXJuZWwgdGhhdCB3b24ndCBydW4gb24gb2xkZXIKPj4gPmhhcmR3YXJlLiAgV2Ug
Z28gdG8gZ3JlYXQgbGVuZ3RocyB0byBlbmFibGUga2VybmVsIGJpbmFyeSBwb3J0YWJpbGl0eQo+
PiA+YWNyb3NzIHRoZSBwcmVzZW5jZSBvciBhYnNlbmNlIG9mIG90aGVyIFJJU0MtViBleHRlbnNp
b25zLCBhbmQgSSB0aGluawo+PiA+dGhlc2UgQ0ZJIGV4dGVuc2lvbnMgc2hvdWxkIGJlIG5vIGRp
ZmZlcmVudC4KPj4gPgo+PiA+U28gYmVmb3JlIGNvbnNpZGVyaW5nIHRoaXMgZm9yIG1lcmdpbmcs
IEknZCBsaWtlIHRvIHNlZSBhdCBsZWFzdCBhbgo+PiA+YXR0ZW1wdCB0byBpbXBsZW1lbnQgdGhl
IGR1YWwtdkRTTyBhcHByb2FjaCAob3Igc29tZXRoaW5nIGVxdWl2YWxlbnQpCj4+ID53aGVyZSB0
aGUgc2FtZSBrZXJuZWwgYmluYXJ5IHdpdGggQ0ZJIGVuYWJsZWQgY2FuIHJ1biBvbiBib3RoIHBy
ZS1aaW1vcAo+PiA+YW5kIHBvc3QtWmltb3AgaGFyZHdhcmUsIHdpdGggdGhlIGV4aXN0aW5nIHVz
ZXJzcGFjZXMgdGhhdCBhcmUgY29tbW9uCj4+ID50b2RheS4KPj4KPj4gQWRkZWQgc29tZSBkaXN0
cm8gZm9sa3MgaW4gdGhpcyBlbWFpbCBjaGFpbi4KPj4KPj4gQWZ0ZXIgcGF0Y2h3b3JrIG1lZXRp
bmcgdG9kYXksIEkgd2FudGVkIHRvIGNvbnRpbnVlIGRpc2N1c3Npb24gaGVyZS4gU28gdGhhbmtz
Cj4+IFBhdWwgZm9yIGxvb2tpbmcgaW50byBpdCBhbmQgaW5pdGlhdGluZyBhIGRpc2N1c3Npb24g
aGVyZS4KPj4KPj4gVGhpcyBwYXRjaCBzZXJpZXMgaGFzIGJlZW4gaW4gdGhlIHF1ZXVlIGZvciBx
dWl0ZSBhIGxvbmcgdGltZSBhbmQgd2UgaGF2ZSBoYWQKPj4gZGVsaWJlcmF0aW9ucyBvbiB2RFNP
IHRvcGljIGVhcmxpZXIgYXMgd2VsbCBhbmQgYWZ0ZXIgdGhvc2UgZGVsaWJlcmF0aW9ucyBpdAo+
PiB3YXMgZGVjaWRlZCB0byBnbyBhaGVhZCB3aXRoIG1lcmdlIGFuZCBpdCBpbmRlZWQgd2FzIHNl
bnQgZm9yIDYuMTcgbWVyZ2UKPj4gd2luZG93LiBVbmZvcnR1bmF0bGV5IGR1ZSB0byBvdGhlciB1
bmZvcmVzZWVuIHJlYXNvbnMsIGVudGlyZXR5IG9mIHJpc2N2Cj4+IGNoYW5nZXMgd2VyZSBub3Qg
cGlja2VkLiBTbyBpdCdzIGEgYml0IGRpc2FwcG9pbnRpbmcgdG8gc2VlIGJhY2stcGFkZGxpbmcg
b24KPj4gdGhpcyB0b3BpYy4KPj4KPj4gQW55d2F5cywgd2UgYXJlIGhlcmUuIFNvIEknbGwgcHJv
dmlkZSBhIGJpdCBvZiBjb250ZXh0IGZvciB0aGUgbGlzdCBhYm91dAo+PiBkZWxpYmVyYXRpb25z
IGFuZCBkaXNjdXNzaW9ucyB3ZSBoYXZlIGJlZW4gaGF2aW5nIGZvciBzbyBtYW55IG1lcmdlIHdp
bmRvd3MuCj4+IFRoaXMgc28gdGhhdCBhIGhvbGlzdGljIGRpc2N1c3Npb24gY2FuIGhhcHBlbiBv
biB0aGlzIGJlZm9yZSB3ZSBtYWtlIGEKPj4gZGVjaXNpb24uCj4+Cj4+IElzc3VlCj4+ID09PT09
PQo+Pgo+PiBJbnN0cnVjdGlvbnMgaW4gUklTQy1WIHNoYWRvdyBzdGFjayBleHRlbnNpb24gKHpp
Y2Zpc3MgLSBbMV0pIGFyZSBjYXJ2ZWQgb3V0IG9mCj4+ICJtYXkgYmUgb3BzIiBha2Egemltb3Ag
ZXh0ZW5zaW9uIFsyXS4gIm1heSBiZSBvcHMiIGFyZSBpbGxlZ2FsIG9uIG5vbi1SVkEyMwo+PiBo
YXJkd2FyZS4gVGhpcyBtZWFucyBhbnkgZXhpc3RpbmcgcmlzY3YgQ1BVIG9yIGZ1dHVyZSBDUFUg
d2hpY2ggaXNuJ3QgUlZBMjMKPj4gY29tcGxpYW50IGFuZCBub3QgaW1wbGVtZW50aW5nIHppbW9w
IHdpbGwgdHJlYXQgdGhlc2UgZW5jb2RpbmdzIGFzIGlsbGVnYWwuCj4+Cj4+IEN1cnJlbnQga2Vy
bmVsIHBhdGNoZXMgZW5hYmxlIHNoYWRvdyBzdGFjayBhbmQgbGFuZGluZyBwYWQgc3VwcG9ydCBm
b3IKPj4gdXNlcnNwYWNlIHVzaW5nIGNvbmZpZyBgQ09ORklHX1JJU0NWX1VTRVJfQ0ZJYC4gSWYg
dGhpcyBjb25maWcgaXMgc2VsZWN0ZWQgdGhlbgo+PiB2RFNPIHRoYXQgd2lsbCBiZSBleHBvc2Vk
IHRvIHVzZXIgc3BhY2Ugd2lsbCBhbHNvIGhhdmUgc2hhZG93IHN0YWNrCj4+IGluc3RydWN0aW9u
cyBpbiB0aGVtLiBLZXJuZWwgY29tcGlsZWQgd2l0aCBgQ09ORklHX1JJU0NWX1VTRVJfQ0ZJYCwg
Zm9yIHNha2Ugb2YKPj4gdGhpcyBkaXNjdXNzaW9uIGxldHMgY2FsbCBpdCBSVkEyMyBjb21waWxl
ZCBrZXJuZWwuCj4+Cj4+IElzc3VlIHRoYXQgd2UgZGlzY3Vzc2VkIGVhcmxpZXIgYW5kIGV2ZW4g
dG9kYXkgaXMgIlRoaXMgUlZBMjMgY29tcGlsZWQga2VybmVsCj4+IHdvbid0IGJlIGFibGUgdG8g
c3VwcG9ydCBub24tUlZBMjMgdXNlcnNwYWNlIG9uIG5vbi1SVkEyMyBoYXJkd2FyZSBiZWNhdXNl
Ii4KPj4gUGxlYXNlIG5vdGUgdGhhdCBpc3N1ZSBleGlzdHMgb25seSBvbiBub24tUlZBMjMgaGFy
ZHdhcmUgKHdoaWNoIGlzIGV4aXN0aW5nCj4+IGhhcmR3YXJlIGFuZCBmdXR1cmUgaGFyZHdhcmUg
d2hpY2ggaXMgbm90IGltcGxlbWVudGluZyB6aW1vcCkuIFJWQTIzIGNvbXBpbGVkCj4+IGtlcm5l
bCBjYW4gc3VwcG9ydCBhbnkgc29ydCBvZiB1c2Vyc3BhY2Ugb24gUlZBMjMgaGFyZHdhcmUuCj4+
Cj4+Cj4+IERpc2N1c3Npb24KPj4gPT09PT09PT09PT0KPj4KPj4gU28gdGhlIGlzc3VlIGlzIG5v
dCByZWFsbHkgc2hhZG93IHN0YWNrIGluc3RydWN0aW9ucyBidXQgcmF0aGVyIG1heSBiZSBvcAo+
PiBpbnN0cnVjdGlvbnMgaW4gY29kZWdlbiAoYmluYXJpZXMgYW5kIHZEU08pIHdoaWNoIGFyZW4n
dCBoaWRkZW4gYmVoaW5kIGFueQo+PiBmbGFnICh0byBoaWRlIHRoZW0gaWYgaGFyZHdhcmUgZG9l
c24ndCBzdXBwb3J0KS4gQW5kIGlmIEkgY2FuIG5hcnJvdyBkb3duCj4+IGZ1cnRoZXIsIHByaW1h
cnkgaXNzdWUgd2UgYXJlIGRpc2N1c3NpbmcgaXMgdGhhdCBpZiBjZmkgaXMgZW5hYmxlZCBkdXJp
bmcKPj4ga2VybmVsIGNvbXBpbGUsIGl0IGlzIGJyaW5naW5nIGluIGEgcGllY2Ugb2YgY29kZSAo
dkRTTykgd2hpY2ggd29uJ3Qgd29yawo+PiBvbiBleGlzdGluZyBoYXJkd2FyZS4gQnV0IHRoZSBj
b3VudGVyIHBvaW50IGlzIGlmIHNvbWVvbmUgd2VyZSB0byBkZXBsb3kKPj4gUlZBMjMgY29tcGls
ZWQga2VybmVsIG9uIG5vbi1SVkEyMyBoYXJkd2FyZSwgdGhleSBtdXN0IGhhdmUgY29tcGlsZWQK
Pj4gcmVzdCBvZiB0aGUgdXNlcnNwYWNlIHdpdGhvdXQgc2hhZG93IHN0YWNrIGluc3RydWN0aW9u
cyBpbiB0aGVtIGZvciBzdWNoCj4+IGEgaGFyZHdhcmUuIEFuZCB0aHVzIGF0IHRoaXMgcG9pbnQg
dGhleSBjb3VsZCBzaW1wbHkgY2hvb3NlICpub3QqIHRvIHR1cm4gb24KPj4gYENPTkZJR19SSVND
Vl9VU0VSX0NGSWAgd2hlbiBjb21waWxpbmcgc3VjaCBrZXJuZWwuIEl0J3Mgbm90IHRoYXQgZGlm
ZmljdWx0IHRvCj4+IGRvIHNvLgo+Pgo+PiBBbnkgZGlzdHJvIHdobyBpcyBzaGlwcGluZyB1c2Vy
c3BhY2UgKHdoaWNoIGFsbCBvZiB0aGVtIGFyZSkgYWxvbmcgd2l0aCBrZXJuZWwKPj4gd2lsbCBu
b3QgYmUgc2hpcHBpbmcgdHdvIGRpZmZlcmVudCB1c2Vyc3BhY2VzIChvbmUgd2l0aCBzaGFkb3cg
c3RhY2sgYW5kIG9uZQo+PiB3aXRob3V0IHRoZW0pLiBJZiBkaXN0cm8gYXJlIHNoaXBwaW5nIHR3
byBkaWZmZXJlbnQgdXNlcnNwYWNlcywgdGhlbiB0aGV5IG1pZ2h0Cj4+IGFzIHdlbGwgc2hpcCB0
d28gZGlmZmVyZW50IGtlcm5lbHMuIFRhZ2dpbmcgc29tZSBkaXN0cm8gZm9sa3MgaGVyZSB0byBn
ZXQgdGhlaXIKPj4gdGFrZSBvbiBzaGlwcGluZyBkaWZmZXJlbnQgdXNlcnNwYWNlIGRlcGVuZGlu
ZyBvbiB3aGV0aGVyIGhhcmR3YXJlIGlzIFJWQTIzIG9yCj4+IG5vdC4gQEhlaW5yaWNoLCBARmxv
cmlhbiwgQHJlZGJlYXJkIGFuZCBAQXVyZWxpZW4uCj4+Cj4+IE1ham9yIGRpc3RybydzIGhhdmUg
YWxyZWFkeSBkcmF3biBhIGRpc3RpbmN0aW9uIGhlcmUgdGhhdCB0aGV5IHdpbGwgZHJvcAo+PiBz
dXBwb3J0IGZvciBoYXJkd2FyZSB3aGljaCBpc24ndCBSVkEyMyBmb3IgdGhlIHNha2Ugb2Yga2Vl
cGluZyBiaW5hcnkKPj4gZGlzdHJpYnV0aW9uIHNpbXBsZS4KPj4KPj4gT25seSBvdGhlciB1c2Ug
Y2FzZSB0aGF0IHdhcyBkaXNjdXNzZWQgb2YgYSBwb3dlcmZ1bCBsaW51eCB1c2VyIHdobyBqdXN0
IHdhbnRzCj4+IHRvIHVzZSBhIHNpbmdsZSBrZXJuZWwgb24gYWxsIGtpbmRzIG9mIHJpc2N2IGhh
cmR3YXJlLiBJIGFtIGltYWdpbmluZyBzdWNoIGEKPj4gdXNlciBrbm93cyBlbm91Z2ggYWJvdXQg
a2VybmVsIGFuZCBpZiBpcyByZWFsbHkgZGVhciB0byB0aGVtLCB0aGV5IGNhbiBkZXZlbG9wCj4+
IHRoZWlyIG93biBwYXRjaGVzIGFuZCBzZW5kIGl0IHVwc3RyZWFtIHRvIHN1cHBvcnQgdGhlaXIg
b3duIHVzZWNhc2UgYW5kIHdlIGNhbgo+PiBkaXNjdXNzIHRoZW0gb3V0LiBDdXJyZW50IHBhdGNo
c2V0IGRvbid0IHByZXZlbnQgc3VjaCBhIGRldmVsb3BlciB0byBzZW5kIHN1Y2gKPj4gcGF0Y2hl
cyB1cHN0cmVhbS4KPj4KPj4gSSBoZWFyZCB0aGUgYXJndW1lbnQgaW4gbWVldGluZyB0b2RheSB0
aGF0ICJaYmIiIGVuYWJsaW5nIHdvcmtzIHNpbWlsYXIgZm9yCj4+IGtlcm5lbCB0b2RheS4gSSBs
b29rZWQgYXQgIlpiYiIgZW5hYmxpbmcuIEl0J3MgZm9yIGtlcm5lbCB1c2FnZSBhbmQgaXQncwo+
PiBzdXJnaWNhbGx5IHBsYWNlZCBpbiBrZXJuZWwgdXNpbmcgYXNtIGhpZGRlbiBiZWhpbmQgYWx0
ZXJuYXRpdmVzLiB2RFNPIGlzbid0Cj4+IGNvbXBpbGVkIHdpdGggWmJiLiBTaGFkb3cgc3RhY2sg
aW5zdHJ1Y3Rpb25zIGFyZSBwYXJ0IG9mIGNvZGVnZW4gZm9yIEMgZmlsZXMKPj4gY29tcGlsZWQg
aW50byB2RFNPLgo+Pgo+PiBGdXJ0aGVybW9yZSwKPj4KPj4gS2VybmVsIGNvbnRyb2wgZmxvdyBp
bnRlZ3JpdHkgd2lsbCBpbnRyb2R1Y2Ugc2hhZG93IHN0YWNrIGluc3RydWN0aW9ucyBhbGwKPj4g
b3ZlciB0aGUga2VybmVsIGJpbmFyeS4gU3VjaCBrZXJuZWwgd29uJ3QgYmUgZGVwbG95YWJsZSBv
biBub24tUlZBMjMgaGFyZHdhcmUuCj4+IEhvdyB0byBkZWFsIHdpdGggdGhpcyBwcm9ibGVtIGZv
ciBhIHNhdnZ5IGtlcm5lbCBkZXZlbG9wZXIgd2hvIHdhbnRzIHRvIHJ1bgo+PiBzYW1lIGNmaSBl
bmFibGVkIGtlcm5lbCBiaW5hcnkgb24gbXVsdGlwbGUgaGFyZHdhcmU/Cj4+Cj4+IENvbWluZyBm
cm9tIGVuZ2luZWVyaW5nIGFuZCBoYWNrZXIgcG9pbnQgb2YgdmlldywgSSB1bmRlcnN0YW5kIHRo
ZSBkZXNpcmUgaGVyZQo+PiBidXQgSSBzdGlsbCBzZWUgdGhhdCBpdCdzIGNvbXBsZXhpdHkgZW5m
b3JjZWQgb24gcmVzdCBvZiB0aGUga2VybmVsIGZyb20gYSB1c2VyCj4+IGJhc2Ugd2hpY2ggYW55
d2F5cyBjYW4gYWNoaWV2ZSBzdWNoIGdvYWxzLiBGb3IgbWFqb3JpdHkgb2YgdXNlY2FzZXMsIEkg
ZG9uJ3QKPj4gc2VlIGEgcmVhc29uIHRvIGluY3JlYXNlIGNvbXBsZXhpdHkgaW4gdGhlIGtlcm5l
bCBmb3IgYnVpbGQsIHBvc3NpYmx5IHJ1bnRpbWUKPj4gcGF0Y2hpbmcgYW5kIHRodXMgcG9zc2li
bHkgaW50cm9kdWNlIG1vcmUgaXNzdWVzIGFuZCBlcnJvcnMganVzdCBmb3IgdGhlIHNha2UKPj4g
b2YgYSBzY2llbmNlIHByb2plY3QuCj4+Cj4+IEJlaW5nIHNhaWQgdGhhdCwgcmUtaXRlcmF0aW5n
IHRoYXQgY3VycmVudGx5IGRlZmF1bHQgZm9yIGBDT05GSUdfUklTQ1ZfVVNFUl9DRklgCj4+IGlz
ICJuIiB3aGljaCBtZWFucyBpdCB3b24ndCBiZSBicmVha2luZyBhbnl0aGluZyB1bmxlc3MgYSB1
c2VyIG9wdHMgIlkiLiBTbyBldmVuCj4+IHRob3VnaCBJIHJlYWxseSBkb24ndCBzZWUgYSByZWFz
b24gYW5kIHVzYWJpbGl0eSB0byBoYXZlIGNvbXBsZXhpdHkgaW4ga2VybmVsIHRvCj4+IGNhcnJ5
IG11bHRpcGxlIHZEU09zLCBjdXJyZW50IHBhdGNoc2V0cyBhcmUgbm90IGEgaGluZGVyYW5jZSBm
b3Igc3VjaCBmdXR1cmUKPj4gY2FwYWJpbGl0eSAoYmVjYXVzZSBjdXJyZW50IGRlZmF1bHQgaXMg
Tm8pIGFuZCBtb3RpdmF0ZWQgZGV2ZWxvcGVyIGlzIHdlbGNvbWUKPj4gdG8gYnVpbGQgb24gdG9w
IG9mIGl0LiBCb3R0b21saW5lIGlzIEkgZG9uJ3Qgc2VlIGEgcmVhc29uIHRvIGJsb2NrIGN1cnJl
bnQKPj4gcGF0Y2hzZXQgZnJvbSBtZXJnaW5nIGluIHY2LjE4Lgo+Cj5Tb3JyeSBmb3IgcmVpdGVy
YXRpbmcsIEkgaGF2ZSBiZWVuIGdvbmUgZm9yIGEgd2hpbGUsIHNvIG1heWJlIEkgbG9zdCBhCj5i
aXQgb2YgY29udGV4dC4KPgo+SW4gdGhhdCBjYXNlLCBzaG91bGQgd2UgYWRkIGEgY29tbWVudCBp
biB0aGUgS2NvbmZpZyB0aGF0IHNheXMgIml0Cj5icmVha3MgdXNlcnNwYWNlIG9uIG9sZGVyLXRo
YW4gUlZBMjMgcGxhdGZvcm1zIj8KCkl0cyBxdWl0ZSBhcHBhcmFudCBmb3Igd2hvZXZlciBpcyBj
b21waWxpbmcgdXNlcnNwYWNlIGZvciBub24tUlZBMjMgaGFyZHdhcmUuCkZpcnN0IHNzcHVzaC9z
c3BvcGNoayBpbnN0cnVjdGlvbiBpbiBsZC9saWJjIHdpbGwgZG8gaWxsZWdhbCBpbnN0cnVjdGlv
bi4gSXQKd29uJ3QgZXZlbiBjb21lIHRvIHZEU08ncyBzc3B1c2gvc3Nwb3BjaGsuCgpCdXQgc3Vy
ZSBpZiB0aGF0J3Mgd2hhdCBnZXQgdGhlc2UgcGF0Y2hlcyBtZXJnZWQgaW4sIEkgY2FuIGFkZCB0
aGF0IGNvbW1lbnQuCgo+Cj5QZXJoYXBzIGEgdmVyeSB1Z2x5IHdheSB0byBtYWtlIFJWQTIzLWNv
bXBpbGVkIGtlcm5lbCBjb21wYXRpYmxlIHdpdGgKPnByZS1SVkEyMyBwbGF0Zm9ybXMgaXMgdG8g
ZGVjb2RlIG1heWJlLW9wcyBpbiB0aGUgaWxsZWdhbCBleGNlcHRpb24KPmhhbmRsZXIuLi4KClll
cyB0aGF0IGNhbiBiZSBkb25lIGJ1dCB0aGF0IHNob3VsZG4ndCBnYXRlIGN1cnJlbnQgcGF0Y2hz
ZXQgZnJvbSBtZXJnaW5nIGluLgoKPgo+QnR3LCBJIGRvbid0IHRoaW5rIGtlbnJlbC1sZXZlbCBz
aGFkb3cgc3RhY2sgc2hvdWxkIGJlIGFuIGFyZ3VtZW50CgpBcmd1bWVudCB0byBibG9jayBjdXJy
ZW50IHBhdGNoZXMgaXMgYmVsb3cKIktlcm5lbCBzaG91bGQgYmUgYmluYXJ5IHBvcnRhYmxlIi4g
VGhhdCdzIHdoeSBJIGdhdmUgdGhhdCBhcmd1bWVudC4KQSBrZXJuZWwgY29tcGlsZWQgd2l0aCBz
aGFkb3cgc3RhY2sgKGtjZmkpIGlzIG5vdCBwb3J0YWJsZSBvbiBub24tUlZBMjMKaGFyZHdhcmUu
CgpZZXMgd2UgY2FuIHRyeSBtYWtpbmcga2VybmVsIHBvcnRhYmxlIGJ5IGNhcnJ5aW5nIHR3byBk
aWZmZXJlbnQgdkRTTy4KT25lIHRoYXQgaXMgZm9yIG5vbi1SVkEyMyAoYWN0dWFsbHkgbm9uLXpp
bW9wKSBoYXJkd2FyZSBhbmQgb25lIGZvcgpSVkEyMyBoYXJkd2FyZS4gQnV0IEkgZG9uJ3QgaW1h
Z2luZSBhIGRpc3RybyBzaGlwcGluZyB0d28gZGlmZmVyZW50CnVzZXJzcGFjZXMgKGxkL2dsaWJj
LCBldmVyeXRoaW5nKSBvbmNlIHRoZXkgc3RhcnQgY29tcGlsaW5nIHRoZWlyCnVzZXJzcGFjZSB3
aXRoIFJWQTIzLiBJZiBmb3IgYW4gaW5zdGFuY2UgdGhleSBzdGFydCBjb21waWxpbmcgdHdvCnVz
ZXJzcGFjZXMsIGl0cyBub3QgdGhhdCBiaWcgb2YgYW4gZWZmb3J0IHRvIGNvbXBpbGUga2VybmVs
IGRpZmZlcmVudGx5CmFzIHdlbGwuIElmIGZvciBhbiBpbnN0YW5jZSB0aGV5IGNob29zZSB0byBv
bmx5IHN1cHBvcnQgcnY2NGdjIGZvcgp1c2Vyc3BhY2UgdGhlbiB0aGV5IGFyZSBub3Qgb3B0aW5n
IGFueXdheXMgZm9yIENGSSB0aGVuIGp1c3Qgbm90IHNlbGVjdAp0aGF0IG9wdGlvbiBpbiBrZXJu
ZWwgY29tcGlsZS4gSSBqdXN0IGRvbid0IHNlZSBhIHNjZW5hcmlvIHdoZXJlIGtlcm5lbAppcyBm
b3JjZWQgdG8gY2FycnkgdHdvIGRpZmZlcmVudCBsaWJyYXJpZXMgd2hpbGUgcmVzdCBvZiB0aGUg
dXNlcnNwYWNlCndpbGwgbm90IGRpc3RyaWJ1dGUgdHdvIGRpZmZlcmVudCBiaW5hcmllcyBmb3Ig
c2FtZSByZWxlYXNlLgoKPmhlcmUsIGFzIGtlcm5lbC1sZXZlbCBBUElzIGFyZSBtb3JlIGZsZXhp
YmxlIGJ5IG5hdHVyZS4KCkkgZGlkbid0IGdldCBpdC4gSG93IGtlcm5lbCBsZXZlbCBBUElzIGhl
bHAgd2l0aCBiaW5hcnkgcG9ydGFiaWxpdHkKb2YgYSBrZXJuZWwgY29tcGlsZWQgaW4gd2l0aCBz
aGFkb3cgc3RhY2sgaW5zdHJ1Y3Rpb25zIHRvIHJ1biBvbiBoYXJkd2FyZQp3aGVyZSB0aGVzZSBp
bnN0cnVjdGlvbnMgYXJlIGlsbGVnYWw/Cgo+Cj5UaGFua3MsCj5BbmR5CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
