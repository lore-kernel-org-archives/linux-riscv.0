Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2733CCFA18
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 18:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v1pI+YcinD5wPwZXS57IYLhDZGxWFdXM5cuOR/9Gsbw=; b=nO3nwcu4k059kt
	rFsD0JLL7vRUVU2hD2zvSYY5tIDb0tgzgrdeX+lG2H4aCfULqZsya7CHpAdD8Y8pkXTRO6TNZ2f0n
	yHUWuYowl7a5KpGwfXTtFBDQVno4BGO8D1y+YUVIIV8xXd58CM3nQr/SduCJ79blPaAGRTGlERP5/
	4a/Hudwdx4iNAoiMOVNQLnTblUi0YMvo2L4Gd9H/Hj/KMOeG93/W0+3kU24fQaVNJbkoUsDIOLpwE
	vOplXoMZe9x65GVw2uCtztButIUgKGyL0J6+2jRDykqUF+9gAXgh5ClLQfYE1AhGsPeuMv3ta1K1B
	XaMdi7flvPFQI2I7Guzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsfA-00000007ZVL-2UcY;
	Tue, 11 Nov 2025 18:00:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsf9-00000007ZUu-0KCj;
	Tue, 11 Nov 2025 18:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 076F1601FF;
	Tue, 11 Nov 2025 18:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C089CC4CEF5;
	Tue, 11 Nov 2025 18:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762884012;
	bh=YbvVeIxBxMZpmXdjYhUx8nwj49MbsEoFDBh2JqYePf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qfOChaSGhMAFuWs2UzChw+LX7w9ddO0Lu3yodA88bbRsfPPZyivrIHB59q36dSaUY
	 IkZFm9AYnKMAgKui34Is98oeSzGTsaXWWlAp4ixzbQ3Lj9HPqHrijnaeJ8lghQ+kH8
	 Xpu8+ZMcIQHYSlqXF+0ef+2js6EBFfdtbZcHBXnXpfSpjMcKgNH56pX/fGq4tLAz6Y
	 tqQsWQzV/e9sCE7nn8JDr0tapUnCcAyaQTRZTTyl66tKX5xaJDFyL4J0njMQE/6eVz
	 q5GEwq1DSFSMfMwFi0A8w8kJd14LTQE2FYBnLfGCSuJrstkzbNLSGEuTzKO6DCNIuT
	 uzmjpi67z64QQ==
Date: Tue, 11 Nov 2025 10:00:10 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Ard Biesheuvel <ardb@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
Message-ID: <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
References: <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx>
 <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn>
 <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn>
 <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn>
 <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
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

T24gTW9uLCBOb3YgMTAsIDIwMjUgYXQgMDM6MDA6MDBQTSArMDgwMCwgSHVhY2FpIENoZW4gd3Jv
dGU6Cj4gT24gTW9uLCBOb3YgMTAsIDIwMjUgYXQgOToxOeKAr0FNIFRpZXpodSBZYW5nIDx5YW5n
dGllemh1QGxvb25nc29uLmNuPiB3cm90ZToKPiA+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHks
IEkgc2hvdWxkIG1vZGlmeSB0aGlzIHBhdGNoIHRvIHJlbW92ZSB0aGUKPiA+IGNoYW5nZXMgb2Yg
YXJtIGFuZCByaXNjdiBmb3Igbm93LCBkbyB0aGUgY2hhbmdlcyBvbmx5IHdoZW4gdGhlcmUgaXMK
PiA+IGEgcmVhbCBwcm9ibGVtIG9yIHJlcXVpcmVtZW50IHNvbWUgZGF5LCByaWdodD8gSWYgbm8g
bW9yZSBjb21tZW50cywKPiA+IEkgd2lsbCBzZW5kIHYzIGxhdGVyLgo+Cj4gTm93IGV2ZXJ5b25l
IGludm9sdmVkIGFncmVlcyB0aGF0IHRoZSBlZmlzdHViIGNvZGUgaXMgY29ycmVjdCwgc28gdGhl
Cj4gcHJvcGVyIHNvbHV0aW9uIGlzIHRvIGZpeCB0aGUgY29tcGlsZXIuCgpIbT8gIEkgZG9uJ3Qg
c2VlIGhvdyBpdCdzIGEgY29tcGlsZXIgYnVnLiAgSXQncyByZWFsbHkganVzdCBhbiBvYmp0b29s
CmxpbWl0YXRpb24uCgo+IENoYW5naW5nIGVmaXN0dWIgY29kZSBhbmQgY2hhbmdpbmcgb2JqdG9v
bCAoaWdub3JlIF9fZWZpc3R1YiBwcmVmaXgpCj4gYXJlIGJvdGggd29ya2Fyb3VuZHMsIGJ1dCBJ
IHRoaW5rIGNoYW5naW5nIG9ianRvb2wgaXMgYSBsaXR0bGUgbW9yZQo+IHJlYXNvbmFibGUuIE1h
eWJlIEpvc2ggaGFzIGRpZmZlcmVudCBpZGVhcz8KCkkgdGhvdWdodCB0aGUgY29udmVyc2F0aW9u
IGhhZCBjb252ZXJnZWQgb24gd2hhdCBUaWV6aHUgbWVudGlvbmVkIGFib3ZlLAp3aGljaCBpcyB0
byBza2lwIG9ianRvb2wgb24gbGlic3R1YiBmb3IgbG9vbmdhcmNoLCBidXQgbGVhdmUgdGhlIG90
aGVyCmFyY2hlcyBhbG9uZS4gIFRoYXQgd2F5IG9ianRvb2wgYmVoYXZpb3IgaXMgY29uc2lzdGVu
dCBiZXR3ZWVuIGxvb25nYXJjaAphbmQgeDg2LCBhbmQgb2JqdG9vbCBkb2Vzbid0IG5lZWQgdG8g
aWdub3JlIGFueSBwcmVmaXhlcy4KClNvIGJhc2ljYWxseSwgdGhlIHYyIHBhdGNoIG1pbnVzIHRo
ZSBhcm02NC9yaXNjdiBjaGFuZ2VzLgoKLS0gCkpvc2gKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
