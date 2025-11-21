Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC57CFA47C
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 14:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rnzw+W0BOKdSAQSBkyVGsvSWMnhx2xYlhqKiTls+bps=; b=uo1E6K4IediQuj
	6uJIkNy3axS6ur3ACs0areydHikrLlnLmMvHLu/nQ9tNoMGD++4T4mi/dfBEXjfrQgLfqeYdOpnF9
	UdA2OIj54oSwHlFvFoV2fd6sTh598aOZzrePoa1mx23VGFE67fFm45kWRfkkubMxUwKgESo6TphqJ
	AQJ4ZW8sPsiHZpsUm6ErJKIHfSWBAYbOk8A2Lp6el0rGGiMlY0/vRUoGfRRaMIn9SNzzmkX6KiYrz
	j07LBPimBvXgrKleApj8TeXr1aenIS/xInbkpnH43bKi427HtVcdmZCvS2UCp0ePrfJcwHKewfGOP
	fzFtzz7dpjgZVyFQ2RRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSFq-00000008X4p-1VnT;
	Fri, 21 Nov 2025 14:36:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSFo-00000008X4M-1PfU
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 14:36:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BABA605D3
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 14:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12120C19422
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 14:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763735811;
	bh=SmBuQ9/3jkzBF6e+X6HfAqHhQQeAfwauHNiCwCHezeU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hWSFHcysSdwZQUrKk+WqnHZKql8r4fws5zm+ngQOYlYGCd+lEP9qJWgKe+itDkptd
	 dQykKBD0J6RuNCeyAZBQ9DIuPET5rjB2B31vmzxOf1Fh5/8fkyBGbdNb45kjn6UBZL
	 9CHkPCiTNfG3GPecygJfoQ1JIS++/JIerWIyKnHuhw6c9oUDxG5dc/zqOBbJNm6t17
	 T1S+QVYU81Ydq9o2/b38VgYADoJ43W2LSaQQnKcHbcCfLgE2kQzAJ/iwrT1OMXyTX6
	 GdCeuvzJiqRKWvv3aNDBXImbCSRXGbZf33YBIAckFfEsfBBn/SeSIA2UNJjlB/ClH4
	 q5oTM34g4RCvg==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7277324204so361941766b.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 06:36:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXd/QOsjWfxDiXb00TwVg8Ckt0CCer7crkiIo1xfskWTVzLhm/srtJHzrFwRkXYIgEWRxl+u5SOy+KDdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfxM6A/yc61nAAA9S90A+Cvv8FJOfrwcQjUagTLF5NnIvrjs8/
	kke0aHvXKI2i7UGDaKTVk8D58i3ef9orOpZQYKMr65l0LT3L9t+2Lq/qw3Y0Bg2V83g/v/f6K0g
	gietuOcwcxoJ1iaPUa0FQ5AgEO0BoG34=
X-Google-Smtp-Source: AGHT+IF99ZcOKZxwHhj61TbMLuNJeoS2wkCa3w0U0FmKNTTd0uxPqztc32MWgNrKH3nOf/+gpJAsTUn3W2sc9TU7vnU=
X-Received: by 2002:a17:907:7286:b0:b71:ea7c:e509 with SMTP id
 a640c23a62f3a-b767173189bmr313742466b.41.1763735809607; Fri, 21 Nov 2025
 06:36:49 -0800 (PST)
MIME-Version: 1.0
References: <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn> <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn> <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
 <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
 <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com> <aRsH7RTpAah4g5Xr@willie-the-truck>
In-Reply-To: <aRsH7RTpAah4g5Xr@willie-the-truck>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 21 Nov 2025 22:36:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4AasfFet_Gi_mVyte3RPMH3qBS73dBfF-=Gd7HJ6ZPEw@mail.gmail.com>
X-Gm-Features: AWmQ_bmzF-PBbbGb1pyM-7ojfFGXsdzHVd24-gNLEumxbI6shCwp2NX04xLwnRw
Message-ID: <CAAhV-H4AasfFet_Gi_mVyte3RPMH3qBS73dBfF-=Gd7HJ6ZPEw@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Will Deacon <will@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Ard Biesheuvel <ardb@kernel.org>, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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

T24gTW9uLCBOb3YgMTcsIDIwMjUgYXQgNzozM+KAr1BNIFdpbGwgRGVhY29uIDx3aWxsQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBOb3YgMTUsIDIwMjUgYXQgMTE6MTY6NDJBTSArMDgw
MCwgSHVhY2FpIENoZW4gd3JvdGU6Cj4gPiBPbiBXZWQsIE5vdiAxMiwgMjAyNSBhdCAyOjAw4oCv
QU0gSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9lQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBNb24sIE5vdiAxMCwgMjAyNSBhdCAwMzowMDowMFBNICswODAwLCBIdWFjYWkgQ2hlbiB3
cm90ZToKPiA+ID4gPiBPbiBNb24sIE5vdiAxMCwgMjAyNSBhdCA5OjE54oCvQU0gVGllemh1IFlh
bmcgPHlhbmd0aWV6aHVAbG9vbmdzb24uY24+IHdyb3RlOgo+ID4gPiA+ID4gSWYgSSB1bmRlcnN0
YW5kIGNvcnJlY3RseSwgSSBzaG91bGQgbW9kaWZ5IHRoaXMgcGF0Y2ggdG8gcmVtb3ZlIHRoZQo+
ID4gPiA+ID4gY2hhbmdlcyBvZiBhcm0gYW5kIHJpc2N2IGZvciBub3csIGRvIHRoZSBjaGFuZ2Vz
IG9ubHkgd2hlbiB0aGVyZSBpcwo+ID4gPiA+ID4gYSByZWFsIHByb2JsZW0gb3IgcmVxdWlyZW1l
bnQgc29tZSBkYXksIHJpZ2h0PyBJZiBubyBtb3JlIGNvbW1lbnRzLAo+ID4gPiA+ID4gSSB3aWxs
IHNlbmQgdjMgbGF0ZXIuCj4gPiA+ID4KPiA+ID4gPiBOb3cgZXZlcnlvbmUgaW52b2x2ZWQgYWdy
ZWVzIHRoYXQgdGhlIGVmaXN0dWIgY29kZSBpcyBjb3JyZWN0LCBzbyB0aGUKPiA+ID4gPiBwcm9w
ZXIgc29sdXRpb24gaXMgdG8gZml4IHRoZSBjb21waWxlci4KPiA+ID4KPiA+ID4gSG0/ICBJIGRv
bid0IHNlZSBob3cgaXQncyBhIGNvbXBpbGVyIGJ1Zy4gIEl0J3MgcmVhbGx5IGp1c3QgYW4gb2Jq
dG9vbAo+ID4gPiBsaW1pdGF0aW9uLgo+ID4gPgo+ID4gPiA+IENoYW5naW5nIGVmaXN0dWIgY29k
ZSBhbmQgY2hhbmdpbmcgb2JqdG9vbCAoaWdub3JlIF9fZWZpc3R1YiBwcmVmaXgpCj4gPiA+ID4g
YXJlIGJvdGggd29ya2Fyb3VuZHMsIGJ1dCBJIHRoaW5rIGNoYW5naW5nIG9ianRvb2wgaXMgYSBs
aXR0bGUgbW9yZQo+ID4gPiA+IHJlYXNvbmFibGUuIE1heWJlIEpvc2ggaGFzIGRpZmZlcmVudCBp
ZGVhcz8KPiA+ID4KPiA+ID4gSSB0aG91Z2h0IHRoZSBjb252ZXJzYXRpb24gaGFkIGNvbnZlcmdl
ZCBvbiB3aGF0IFRpZXpodSBtZW50aW9uZWQgYWJvdmUsCj4gPiA+IHdoaWNoIGlzIHRvIHNraXAg
b2JqdG9vbCBvbiBsaWJzdHViIGZvciBsb29uZ2FyY2gsIGJ1dCBsZWF2ZSB0aGUgb3RoZXIKPiA+
ID4gYXJjaGVzIGFsb25lLiAgVGhhdCB3YXkgb2JqdG9vbCBiZWhhdmlvciBpcyBjb25zaXN0ZW50
IGJldHdlZW4gbG9vbmdhcmNoCj4gPiA+IGFuZCB4ODYsIGFuZCBvYmp0b29sIGRvZXNuJ3QgbmVl
ZCB0byBpZ25vcmUgYW55IHByZWZpeGVzLgo+ID4gPgo+ID4gPiBTbyBiYXNpY2FsbHksIHRoZSB2
MiBwYXRjaCBtaW51cyB0aGUgYXJtNjQvcmlzY3YgY2hhbmdlcy4KPiA+Cj4gPiBIaSwgQVJNNjQg
YW5kIFJJU0MtViBtYWludGFpbmVycywKPiA+Cj4gPiBXb3VsZCB5b3UgbWluZCB0aGF0IHRoaXMg
cGF0Y2ggbW9kaWZpZXMgdGhlIHRocmVlIGFyY2hpdGVjdHVyZXMKPiA+IHRvZ2V0aGVyICh0aGV5
IGFyZSBleGFjdGx5IHRoZSBzYW1lIHN0eWxlIG5vdyk/Cj4gPgo+ID4gTWFkaGF2YW4gaXMgdGhl
IGF1dGhvciBvZiBBUk02NCdzIG9ianRvb2wsIEkgdGhpbmsgeW91ciBvcGluaW9uIGlzCj4gPiBh
bHNvIHZlcnkgaW1wb3J0YW50Lgo+Cj4gYXJtNjQgZG9lc24ndCAoeWV0KSB1c2Ugb2JqdG9vbC4K
Pgo+IEkgZGVmZXIgdG8gQXJkIG9uIGFueXRoaW5nIHJlbGF0aW5nIHRvIHRoZSBhcm02NCBlZmlz
dHViLiBSZWFkaW5nIHRoZQo+IHN0YXJ0IG9mIHRoaXMgdGhyZWFkLCBpdCBkb2Vzbid0IGxvb2sg
bGlrZSBoZSdzIGNvbnZpbmNlZCBhbmQgSSdtIG5vdAo+IHN1cnByaXNlZCBpZiBpdCdzIHB1cmVs
eSBhbiBpc3N1ZSB3aXRoIG9ianRvb2wuCk9LLCBJIGtub3csIGJ1dCBJIGhhdmUgYSBjb25jZXJu
LgoKQXJkIHNhaWQgdGhhdCBoZSBpcyByZWx1Y3RhbnQgdG8gbWFrZSBjaGFuZ2VzIHRvIGFjY29t
bW9kYXRlIGEgZmxhd2VkCmJ1aWxkIHRpbWUgdG9vbCBhbmQgdGhlcmUgbWF5IGJlIHJlZ3Jlc3Np
b24gcmlzay4KClNvLCBJJ20gYWxzbyByZWx1Y3RhbnQgYW5kIGRvbid0IHdhbnQgTG9vbmdBcmNo
IHRvIG1lZXQgcmVncmVzc2lvbgpyaXNrLiBJZiBvbmUgZGF5IExvb25nQXJjaCBoYXMgYSByZWdy
ZXNzaW9uLCB3ZSBwcm9iYWJseSBuZWVkIGFub3RoZXIKd29ya2Fyb3VuZCB0byAiZml4IiB0aGlz
IHdvcmthcm91bmQuIEJ1dCBpZiB0aGVzZSB0aHJlZSBhcmNoaXRlY3R1cmVzCmNoYW5nZSBpbiB0
aGUgc2FtZSB3YXksIHdlIG1heSBoYXZlIGEgY2hhbmNlIHRvIHNvbHZlIHNvbWUgZnVuZGFtZW50
YWwKcHJvYmxlbXMuLi4KCkh1YWNhaQoKPgo+IFdpbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
