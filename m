Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB92C3A5A7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 06:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOQQI+afosE6aVLG8X9L3Uh+f1RbdOXKcp8VKlLpaQI=; b=MBm0P+wbGCX99q
	Uxtecq7vWcade8GfonjNjD7SETlT3BvL8HgITET2tcRMqKi90iq8Y5o8hVyh/l0FmfLLElwIqNpRf
	9SyGTxtC0w+3g49YWxaBkRBpQIRYpriD8HcOMj24boODZnifqMsHXl6fg93dNs2k2SmMjtPrZ+cz9
	e+bOaF/WRRwAcdxhrGJ5TkAJa9kNUG4aotOcLLrL0IyHzZ/NMAZjbA2p0FlNuRgnTkEYFpe8edPis
	VhYFXXhIeeyUqCOQJJ4TZEVXz5Uwu8NLcAyHX5/+VNosIMFN4m/VB6Y5KWfVQXn7l8wWOEYUu+L9t
	HTheMEtYpKBSJbyQFIeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2RCf-001pEk-RE; Tue, 06 Dec 2022 06:13:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2RCc-001p5r-2l
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 06:13:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 00638CE178F
	for <linux-riscv@lists.infradead.org>; Tue,  6 Dec 2022 06:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4B7C4347C
	for <linux-riscv@lists.infradead.org>; Tue,  6 Dec 2022 06:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670307188;
	bh=th1V6+SkiuIfCPI17AmYfQBHSNCfb55wpqFcgPM9EAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NeV48oS7O6faZtRUsQrOrRKSVEssKcQHHkq6wEL3h8Bz95BsmenU2jbMig1oOGJEm
	 k4XYw+LaaEu6oO1qsV7j4IGq1hHg6PO5h5ovFAfzelcxwgasgKhYTJN0Uj5epulRd7
	 p+lY5+ZlJoo+LyRGchxuuotHduvoEk31ue6o/Ik8e0JqeBqWPSx2ESBzX8Y3spZ+AL
	 jio3gsth7v5sVEZn6b2xhwA02E43cqhdizeaGqDjOWMuSuUQZrAxX/6J0aUSCjskXS
	 cOLpjxgi1yO4Ft81G/uZBaGwcR8r3MLxsMGZjmC9qrbyJ5JLtB6H0cBBeo8hZnCG/6
	 23HluqiB7ewOw==
Received: by mail-ed1-f44.google.com with SMTP id e13so18831092edj.7
        for <linux-riscv@lists.infradead.org>; Mon, 05 Dec 2022 22:13:08 -0800 (PST)
X-Gm-Message-State: ANoB5pkTScS0HJ6gSZpwV2kVM6VlqebT4l7/hLqbhezEfWy1f3lablqn
	4mq/4d0vgK6VEM5X67Ih5Amomwv+DcZ9jwRKgUg=
X-Google-Smtp-Source: AA0mqf4Sdb09rPxgcsGDOHwTXPlNPlrB8zHFwXBW2+mnGaoopW1W/6+v9PyzrnVbfHcutZsp1vv3yvEtJaXjGdiuoz8=
X-Received: by 2002:a05:6402:22db:b0:46c:c16b:b4c4 with SMTP id
 dm27-20020a05640222db00b0046cc16bb4c4mr6428173edb.419.1670307186319; Mon, 05
 Dec 2022 22:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20221103075047.1634923-1-guoren@kernel.org> <877cz69o8f.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <877cz69o8f.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 6 Dec 2022 14:12:54 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSgvKV3Oh6t2dpbJGnt3cDZU14Qk_CxKPMXmEmgvMg8-Q@mail.gmail.com>
Message-ID: <CAJF2gTSgvKV3Oh6t2dpbJGnt3cDZU14Qk_CxKPMXmEmgvMg8-Q@mail.gmail.com>
Subject: Re: [PATCH -next V8 00/14] riscv: Add GENERIC_ENTRY support and
 related features
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com, 
	zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com, 
	chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_221314_497852_BBFACB3B 
X-CRM114-Status: GOOD (  19.15  )
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

T24gTW9uLCBEZWMgNSwgMjAyMiBhdCA1OjQ2IFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gZ3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgo+Cj4gPiBGcm9tOiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gVGhlIHBhdGNoZXMgY29u
dmVydCByaXNjdiB0byB1c2UgdGhlIGdlbmVyaWMgZW50cnkgaW5mcmFzdHJ1Y3R1cmUgZnJvbQo+
ID4ga2VybmVsL2VudHJ5LyouIEFkZGl0aW9uYWxseSwgYWRkIGluZGVwZW5kZW50IGlycSBzdGFj
a3MgKElSUV9TVEFDS1MpCj4gPiBmb3IgcGVyY3B1IHRvIHByZXZlbnQga2VybmVsIHN0YWNrIG92
ZXJmbG93cy4gQWRkIGdlbmVyaWNfZW50cnkgYmFzZWQKPiA+IFNUQUNLTEVBSyBzdXBwb3J0LiBT
b21lIG9wdGltaXphdGlvbiBmb3IgZW50cnkuUyB3aXRoIG5ldyAubWFjcm8gYW5kCj4gPiBtZXJn
ZSByZXRfZnJvbV9rZXJuZWxfdGhyZWFkIGludG8gcmV0X2Zyb21fZm9yay4KPiA+Cj4gPiBXZSBo
YXZlIHRlc3RlZCBpdCB3aXRoIHJ2NjQsIHJ2MzIsIHJ2NjQgKyAzMnJvb3RmcywgYWxsIGFyZSBw
YXNzZWQuCj4gPgo+ID4gWW91IGNhbiBkaXJlY3RseSB0cnkgaXQgd2l0aDoKPiA+IFsxXSBodHRw
czovL2dpdGh1Yi5jb20vZ3VvcmVuODMvbGludXgvdHJlZS9nZW5lcmljX2VudHJ5X3Y4Cj4KPiBH
dW8sIHRoaXMgaXMgYSByZWFsbHkgbmljZSB3b3JrLCBhbmQgSSdtIGxvb2tpbmcgZm9yd2FyZCBo
YXZpbmcgZ2VuZXJpYwo+IGVudHJ5IHN1cHBvcnQgZm9yIFJWLiBIb3dldmVyLCB0aGVyZSBhcmUg
bWFueSBwYXRjaGVzIGluIHRoaXMgc2VyaWVzCj4gdGhhdCByZWFsbHkgc2hvdWxkbid0IGJlIHBh
cnQgb2YgdGhlIHNlcmllcy4KPgo+IFBhdGNoIDIsIDMsIDQsIGFuZCAxMCBzaG91bGQgZGVmaW50
ZWx5IGJlIHB1bGxlZCBvdXQuCk9rYXkuCgo+Cj4gSSdtIG5vdCBzdXJlIDcsIDgsIGFuZCA5IGJl
bG9uZyB0byBzZXJpZXMsIGFzIGl0J3MgcmVhbGx5IGEgc2VwYXJhdGUKPiBmZWF0dXJlLgpUaGUg
c2VwYXJhdGUgaXJxL3NvZnRpcnEgc3RhY2sgcGF0Y2hlcyBkcGVuZCBvbiBnZW5lcmljX2VudHJ5
IHRpZ2h0bHksCnNvIEkgcmVjb21tYW5kIHB1dCB0aGVtIHRvZ2V0aGVyLgoKPgo+IERpdG8gZm9y
IHBhdGNoIDExLCBpdCBqdXN0IG1ha2VzIHRoZSBzZXJpZXMgaGFyZGVyIHRvIHJldmlldy4KVGhl
IDExIGlzIG5vdCBzbyBuZWNlc3NhcnkgYXMgYWJvdmUsIEkgd291bGQgcmVtb3ZlIGl0IGZyb20g
dGhpcwpzZXJpZXMuIEFuZCBzZW5kIGl0IGFnYWluIGFmdGVyIGdlbmVyaWNfZW50cnkgbWVyZ2Vk
LgoKPgo+IEZvciBHRU5FUklDX0VOVFJZIHN1cHBvcnQgb25seSBwYXRjaCAxLCA1LCA2LCAxMiwg
MTMsIGFuZCAxNCwgcmVhbGx5Cj4gcmVxdWlyZWQuIFRoZSBvdGhlcnMgYXJlIHVucmVsYXRlZC4K
VGh4IGZvciB0aGUgcmVtaW5kZXI7IEkgd2lsbCByZS1vcmdhbml6ZSB0aGVtLgoKPgo+Cj4gVGhh
bmtzLAo+IEJqw7ZybgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
