Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5AACEB2C0
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Nov 2025 03:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzqSuckn1MDuI3CT/aJiI6saZi+X3EEeTLga389lrgg=; b=ThGjFeLThjTHCR
	x271MophUi0dxw6bgOI8ae9H/yKUDL49v04I6b7hEeC3oWXGxQ20KNMEz8qAn/54YyjpnUxm2/SBI
	CpBGfxxpn5nHJLRhNP0034ipQPJwWcEsa/1k1Yhrh9gqOt1znDbKw6kkj7hvfi3sL3rK2Q7SBC82o
	wcYpi5Zt/eUJYVZLOAnJ+tz7DrIpLqws/1bympEWE/3+QsIemtwVV0SRCRBcqrcH7BOuYafII/1HX
	KuMvQvMmHozYM93C4Z7hZORzgvgdGY6xamCnDXmgEstiZZIZtWSmEUHSewvb9Z06yUFLP5bajrwnj
	ccopPuiDh5lQTs5nJuTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK6mY-0000000DP6U-0QdN;
	Sat, 15 Nov 2025 03:16:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK6mW-0000000DP63-0H4h
	for linux-riscv@lists.infradead.org;
	Sat, 15 Nov 2025 03:16:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 735F343D83
	for <linux-riscv@lists.infradead.org>; Sat, 15 Nov 2025 03:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCBDC2BCB2
	for <linux-riscv@lists.infradead.org>; Sat, 15 Nov 2025 03:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763176615;
	bh=1dM7txdnL3WwXxhzg0NfITbWJawqUJn8AxOVuQOmSOA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gzM3zeP5FIrXkPRuKUDq0lbVTzb3+XfJowk7C28SobZejzXWN83pXJEcyP4cRgB1f
	 dLzKFoPZ3octPecz1SMSWDH8nHJvzNfXENC3F1yAnCMPP2+Lu33dSvEADZWHigo6HP
	 FX7gf5H3uVur7vI7YK+rnT8AS0H8jzebkxI8WAXvIeSvK8Uyre4RTbMs/fCCMPSk6t
	 WTgALwDvLQ9dDGeEnhR6p6ypXYVRAF3bL9syz5UR4w25zcc99yA0hbY6o+xRCTEfXV
	 QEntL7cSSUzWtdBy9PUvqkczBTDH9p2f37yXcVSi0eqcSYlqWObC3hRGvFbzTybSaN
	 pM6myGQs8xcpQ==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso5825808a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Nov 2025 19:16:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVE02n1wqkHoOGkVtxVQj3oNeP8Jo85cw0nJLFZ0yKACPzLOAoEMGmH2Tr3wR3Rc0QbCY3kGfXyUv2CXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6bYy7JhOBMHLV0OamgYn6mWBGAjvKqyjW52wNBaa+1BcUo2ta
	wWNxwXgaG7wWohkWkMHaVKq3FOJlTBOSMj77XZ9FweH8RvqObC0dSgt5vYO75xvDIcs6x50ERLa
	dUlTPD9XgjU9kAWyVVT5rmx4O7jWi0qQ=
X-Google-Smtp-Source: AGHT+IEhCFcB8Sc5IPBxNenAIJu3Cub21VKbayDOKy8qEqMDOguZ4v0qRe+zt91ixvviR/N5Gw9ABrYXgf7ej1GR6n4=
X-Received: by 2002:a17:907:94cb:b0:b72:84bd:88f3 with SMTP id
 a640c23a62f3a-b73658ae241mr667286066b.11.1763176613598; Fri, 14 Nov 2025
 19:16:53 -0800 (PST)
MIME-Version: 1.0
References: <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx>
 <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn> <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn> <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn> <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
 <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
In-Reply-To: <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 15 Nov 2025 11:16:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com>
X-Gm-Features: AWmQ_bk1bIi26jaM84_oT28vQ-tc26Bh0XF8H8WDo5TPEOpn0O8V--WlioeejxY
Message-ID: <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Josh Poimboeuf <jpoimboe@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Ard Biesheuvel <ardb@kernel.org>, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_191656_147315_795BC613 
X-CRM114-Status: GOOD (  19.49  )
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

T24gV2VkLCBOb3YgMTIsIDIwMjUgYXQgMjowMOKAr0FNIEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJv
ZUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgTm92IDEwLCAyMDI1IGF0IDAzOjAwOjAw
UE0gKzA4MDAsIEh1YWNhaSBDaGVuIHdyb3RlOgo+ID4gT24gTW9uLCBOb3YgMTAsIDIwMjUgYXQg
OToxOeKAr0FNIFRpZXpodSBZYW5nIDx5YW5ndGllemh1QGxvb25nc29uLmNuPiB3cm90ZToKPiA+
ID4gSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgSSBzaG91bGQgbW9kaWZ5IHRoaXMgcGF0Y2gg
dG8gcmVtb3ZlIHRoZQo+ID4gPiBjaGFuZ2VzIG9mIGFybSBhbmQgcmlzY3YgZm9yIG5vdywgZG8g
dGhlIGNoYW5nZXMgb25seSB3aGVuIHRoZXJlIGlzCj4gPiA+IGEgcmVhbCBwcm9ibGVtIG9yIHJl
cXVpcmVtZW50IHNvbWUgZGF5LCByaWdodD8gSWYgbm8gbW9yZSBjb21tZW50cywKPiA+ID4gSSB3
aWxsIHNlbmQgdjMgbGF0ZXIuCj4gPgo+ID4gTm93IGV2ZXJ5b25lIGludm9sdmVkIGFncmVlcyB0
aGF0IHRoZSBlZmlzdHViIGNvZGUgaXMgY29ycmVjdCwgc28gdGhlCj4gPiBwcm9wZXIgc29sdXRp
b24gaXMgdG8gZml4IHRoZSBjb21waWxlci4KPgo+IEhtPyAgSSBkb24ndCBzZWUgaG93IGl0J3Mg
YSBjb21waWxlciBidWcuICBJdCdzIHJlYWxseSBqdXN0IGFuIG9ianRvb2wKPiBsaW1pdGF0aW9u
Lgo+Cj4gPiBDaGFuZ2luZyBlZmlzdHViIGNvZGUgYW5kIGNoYW5naW5nIG9ianRvb2wgKGlnbm9y
ZSBfX2VmaXN0dWIgcHJlZml4KQo+ID4gYXJlIGJvdGggd29ya2Fyb3VuZHMsIGJ1dCBJIHRoaW5r
IGNoYW5naW5nIG9ianRvb2wgaXMgYSBsaXR0bGUgbW9yZQo+ID4gcmVhc29uYWJsZS4gTWF5YmUg
Sm9zaCBoYXMgZGlmZmVyZW50IGlkZWFzPwo+Cj4gSSB0aG91Z2h0IHRoZSBjb252ZXJzYXRpb24g
aGFkIGNvbnZlcmdlZCBvbiB3aGF0IFRpZXpodSBtZW50aW9uZWQgYWJvdmUsCj4gd2hpY2ggaXMg
dG8gc2tpcCBvYmp0b29sIG9uIGxpYnN0dWIgZm9yIGxvb25nYXJjaCwgYnV0IGxlYXZlIHRoZSBv
dGhlcgo+IGFyY2hlcyBhbG9uZS4gIFRoYXQgd2F5IG9ianRvb2wgYmVoYXZpb3IgaXMgY29uc2lz
dGVudCBiZXR3ZWVuIGxvb25nYXJjaAo+IGFuZCB4ODYsIGFuZCBvYmp0b29sIGRvZXNuJ3QgbmVl
ZCB0byBpZ25vcmUgYW55IHByZWZpeGVzLgo+Cj4gU28gYmFzaWNhbGx5LCB0aGUgdjIgcGF0Y2gg
bWludXMgdGhlIGFybTY0L3Jpc2N2IGNoYW5nZXMuCgpIaSwgQVJNNjQgYW5kIFJJU0MtViBtYWlu
dGFpbmVycywKCldvdWxkIHlvdSBtaW5kIHRoYXQgdGhpcyBwYXRjaCBtb2RpZmllcyB0aGUgdGhy
ZWUgYXJjaGl0ZWN0dXJlcwp0b2dldGhlciAodGhleSBhcmUgZXhhY3RseSB0aGUgc2FtZSBzdHls
ZSBub3cpPwoKTWFkaGF2YW4gaXMgdGhlIGF1dGhvciBvZiBBUk02NCdzIG9ianRvb2wsIEkgdGhp
bmsgeW91ciBvcGluaW9uIGlzCmFsc28gdmVyeSBpbXBvcnRhbnQuCgoKSHVhY2FpCgo+Cj4gLS0K
PiBKb3NoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
