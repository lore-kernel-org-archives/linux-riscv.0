Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5423CCEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 11:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9JYhyxwasycadDtZa3QktDNRCMETFmBoFRaasDKdcI=; b=0NMijF5hFYUncZ
	eYDQabfgr5icLICHSSlsYai6y1zhErjRTrsk+Wrkt08yfFsjtII9IgvYch4fJnjUY62pstG/81AUp
	TrxSspSoTndUZHROxkx/nt+skxW/yUCGCd09hciq9SpR6ytQ0493OJxyEbTQhLEQtZo1KtgJoDCbj
	SV6fYlyLhkKx71LZSXq1kliPPozf07ZnVbhPrCk6zPJROvzs1UOb1bi5SIpAkOJsI4tdpNjMZ3arf
	ls/NkxmFs85ZVgWR5tnhvtpWLK5GRBNPaIgurIvlpyTm7+RjEgkQBqU1ZzfnM0+RZpl23vUE40kBz
	YdaAsibXHW2PoHt32ioQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxTr-0000000Fylq-1Cv8;
	Mon, 17 Nov 2025 11:33:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxTo-0000000FykV-1th2;
	Mon, 17 Nov 2025 11:33:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B2734326E;
	Mon, 17 Nov 2025 11:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FFEC4CEFB;
	Mon, 17 Nov 2025 11:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763379187;
	bh=7c7c0+Y2B/04JUOEwi1O55W3Y0JytX6yoqbHe2m//uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0iH7zKi3zR5ITzvZgCo9KeJonwjYrYbonjxhYepOF3+xHZpaS3i9D0kEds9bBtBm
	 tJVhUeo2NjA866SWv2uwt3B84zpsGt+rFkub8wba2n8v951OWWCU4Ddn/CRqhFholS
	 t3JB2pOs8OAnnfo4XkYh5ksbvyG8Z2wOlp8SyxiDt8FhWpp/46kJIUxDt07hIkoRYi
	 XHgQ9t+WpdVXZLdyBUt/JFVk0g3dfRlmreSb7STQNAVkigTmeYh/PoCPatGNe790Wb
	 Fc0XZYMC40b+xXj9qVj/Dhc27kCOKFThiDS6ouhgXyf3oZzLgiJvVxpO1KCY61s7In
	 tDypGsaVFETGQ==
Date: Mon, 17 Nov 2025 11:33:01 +0000
From: Will Deacon <will@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Ard Biesheuvel <ardb@kernel.org>, loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
Message-ID: <aRsH7RTpAah4g5Xr@willie-the-truck>
References: <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn>
 <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn>
 <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
 <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
 <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_033308_541770_A3495D8D 
X-CRM114-Status: GOOD (  24.27  )
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

T24gU2F0LCBOb3YgMTUsIDIwMjUgYXQgMTE6MTY6NDJBTSArMDgwMCwgSHVhY2FpIENoZW4gd3Jv
dGU6Cj4gT24gV2VkLCBOb3YgMTIsIDIwMjUgYXQgMjowMOKAr0FNIEpvc2ggUG9pbWJvZXVmIDxq
cG9pbWJvZUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIE5vdiAxMCwgMjAyNSBh
dCAwMzowMDowMFBNICswODAwLCBIdWFjYWkgQ2hlbiB3cm90ZToKPiA+ID4gT24gTW9uLCBOb3Yg
MTAsIDIwMjUgYXQgOToxOeKAr0FNIFRpZXpodSBZYW5nIDx5YW5ndGllemh1QGxvb25nc29uLmNu
PiB3cm90ZToKPiA+ID4gPiBJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCBJIHNob3VsZCBtb2Rp
ZnkgdGhpcyBwYXRjaCB0byByZW1vdmUgdGhlCj4gPiA+ID4gY2hhbmdlcyBvZiBhcm0gYW5kIHJp
c2N2IGZvciBub3csIGRvIHRoZSBjaGFuZ2VzIG9ubHkgd2hlbiB0aGVyZSBpcwo+ID4gPiA+IGEg
cmVhbCBwcm9ibGVtIG9yIHJlcXVpcmVtZW50IHNvbWUgZGF5LCByaWdodD8gSWYgbm8gbW9yZSBj
b21tZW50cywKPiA+ID4gPiBJIHdpbGwgc2VuZCB2MyBsYXRlci4KPiA+ID4KPiA+ID4gTm93IGV2
ZXJ5b25lIGludm9sdmVkIGFncmVlcyB0aGF0IHRoZSBlZmlzdHViIGNvZGUgaXMgY29ycmVjdCwg
c28gdGhlCj4gPiA+IHByb3BlciBzb2x1dGlvbiBpcyB0byBmaXggdGhlIGNvbXBpbGVyLgo+ID4K
PiA+IEhtPyAgSSBkb24ndCBzZWUgaG93IGl0J3MgYSBjb21waWxlciBidWcuICBJdCdzIHJlYWxs
eSBqdXN0IGFuIG9ianRvb2wKPiA+IGxpbWl0YXRpb24uCj4gPgo+ID4gPiBDaGFuZ2luZyBlZmlz
dHViIGNvZGUgYW5kIGNoYW5naW5nIG9ianRvb2wgKGlnbm9yZSBfX2VmaXN0dWIgcHJlZml4KQo+
ID4gPiBhcmUgYm90aCB3b3JrYXJvdW5kcywgYnV0IEkgdGhpbmsgY2hhbmdpbmcgb2JqdG9vbCBp
cyBhIGxpdHRsZSBtb3JlCj4gPiA+IHJlYXNvbmFibGUuIE1heWJlIEpvc2ggaGFzIGRpZmZlcmVu
dCBpZGVhcz8KPiA+Cj4gPiBJIHRob3VnaHQgdGhlIGNvbnZlcnNhdGlvbiBoYWQgY29udmVyZ2Vk
IG9uIHdoYXQgVGllemh1IG1lbnRpb25lZCBhYm92ZSwKPiA+IHdoaWNoIGlzIHRvIHNraXAgb2Jq
dG9vbCBvbiBsaWJzdHViIGZvciBsb29uZ2FyY2gsIGJ1dCBsZWF2ZSB0aGUgb3RoZXIKPiA+IGFy
Y2hlcyBhbG9uZS4gIFRoYXQgd2F5IG9ianRvb2wgYmVoYXZpb3IgaXMgY29uc2lzdGVudCBiZXR3
ZWVuIGxvb25nYXJjaAo+ID4gYW5kIHg4NiwgYW5kIG9ianRvb2wgZG9lc24ndCBuZWVkIHRvIGln
bm9yZSBhbnkgcHJlZml4ZXMuCj4gPgo+ID4gU28gYmFzaWNhbGx5LCB0aGUgdjIgcGF0Y2ggbWlu
dXMgdGhlIGFybTY0L3Jpc2N2IGNoYW5nZXMuCj4gCj4gSGksIEFSTTY0IGFuZCBSSVNDLVYgbWFp
bnRhaW5lcnMsCj4gCj4gV291bGQgeW91IG1pbmQgdGhhdCB0aGlzIHBhdGNoIG1vZGlmaWVzIHRo
ZSB0aHJlZSBhcmNoaXRlY3R1cmVzCj4gdG9nZXRoZXIgKHRoZXkgYXJlIGV4YWN0bHkgdGhlIHNh
bWUgc3R5bGUgbm93KT8KPiAKPiBNYWRoYXZhbiBpcyB0aGUgYXV0aG9yIG9mIEFSTTY0J3Mgb2Jq
dG9vbCwgSSB0aGluayB5b3VyIG9waW5pb24gaXMKPiBhbHNvIHZlcnkgaW1wb3J0YW50LgoKYXJt
NjQgZG9lc24ndCAoeWV0KSB1c2Ugb2JqdG9vbC4KCkkgZGVmZXIgdG8gQXJkIG9uIGFueXRoaW5n
IHJlbGF0aW5nIHRvIHRoZSBhcm02NCBlZmlzdHViLiBSZWFkaW5nIHRoZQpzdGFydCBvZiB0aGlz
IHRocmVhZCwgaXQgZG9lc24ndCBsb29rIGxpa2UgaGUncyBjb252aW5jZWQgYW5kIEknbSBub3QK
c3VycHJpc2VkIGlmIGl0J3MgcHVyZWx5IGFuIGlzc3VlIHdpdGggb2JqdG9vbC4KCldpbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
