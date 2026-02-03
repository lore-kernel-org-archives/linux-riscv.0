Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B6FE7FDF3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 00:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPxCSQvb/Xbq7PsgDtgT6mGuyII9W0b8IcW1UmCD6Qg=; b=3iH0GYag033HmW
	ltOWK2waOVJjgowauCsjLnu12NgeIQrfkp598iGr3UcOyOQt957ih4vWHcREBpXOw2N27qn+68rlz
	SLgKo/wQ6fWeKvfuHLT0Bxx4yKrMc4AGM9MXINKrMbaH3WOqTG690nl0t+vovPulCq855v5IExUkh
	ZlDRuU9wp45gj1FEIOtfydJSbERkgJMk2teH1UB7wQ9s3BYixBHRf59d5kXzRHAPw3dsmajzjDOLS
	AQnOa96HYsTNVGoUjLq5R3JHC01PojsaOmhyUySXY9HAiNv7oKQmNg5X/SSDjuKZose5lKDeJNOTd
	5mMVHA2AjELp3RIpPLxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4LX-00000005o8q-2Amd;
	Tue, 03 Feb 2026 00:32:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4LV-00000005o8U-243I
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 00:32:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BE7844311
	for <linux-riscv@lists.infradead.org>; Tue,  3 Feb 2026 00:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BCEC19425
	for <linux-riscv@lists.infradead.org>; Tue,  3 Feb 2026 00:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078764;
	bh=5b1YNgB+WSCy3gJc7w5bfdM+RGfw7hfgWgwTAQaFtvc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a8OVDdrHbwy9MxbepcgQSm3ydVa5B6saKW0MQzpcK7Oy3Tx8P/SKX9BoWJKZ+ts9y
	 pohTWk5IMih/KWNfOMLZwFHCCFnlMekCWPXALEgizwJmZrN+raE6iufYt1dXC9Yksd
	 WKI+Z3v7FenP9A4YkBHYTKR01hxfAZDz9M+Fzxg8BSGYck3/EFReEC7MxPoUZVJjVP
	 2npA9FRWukWz82sXOZV4oxPT9NCYtAt5Kox2BrQ2XH9pdQWetwbTX7BOKlhgk/TMkp
	 9TUnn/EGH+e6TENfMKFv9qY8OKZbYOiKD9s24iXu9VW6EITyp6UfzGEKpfC9sYtqtT
	 kmFhveWnCJX1A==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-649bd1f08acso2073760d50.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 16:32:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVHXTjunURaOCEo81LyM6m81MPhHuCAtqM40CUsiJmGscTmjEQP3SSaJoI718MWO5PlzOVxLXz+aLX6zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOT5YikvUVBEzr6I47gQXsV+hiD1ji7EBiHwZQ7bgnMpH/1PKL
	EjH60eq74R36dTjDIYFdgGrU8bOqzlZMuFiVdsQqq+TFE1Q//xllM89Cr8QeWGGKlZSuYXD3aML
	RH7+c9EpkmRuNoDIWwmRXC5jhQcFlEhc=
X-Received: by 2002:a05:690e:4183:b0:649:4640:f8ea with SMTP id
 956f58d0204a3-649a8393901mr9595658d50.4.1770078763406; Mon, 02 Feb 2026
 16:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20251228154947.194684-1-jiayu.riscv@isrc.iscas.ac.cn>
In-Reply-To: <20251228154947.194684-1-jiayu.riscv@isrc.iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:32:32 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Up=y_pX4Xy50in08cT978ANaoiD_98nn99frb8=5vOA@mail.gmail.com>
X-Gm-Features: AZwV_QhzATDF1xPyRh23xfkH5H_s0IyRTbaRsiEHxW24bbhKveJdGG3YYXSQugM
Message-ID: <CAD++jL=Up=y_pX4Xy50in08cT978ANaoiD_98nn99frb8=5vOA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: canaan: k230: Fix NULL pointer dereference
 when parsing devicetree
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, gaohan@iscas.ac.cn, me@ziyao.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_163245_605368_CF85259D 
X-CRM114-Status: GOOD (  12.14  )
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

T24gU3VuLCBEZWMgMjgsIDIwMjUgYXQgNDo1M+KAr1BNIEppYXl1IER1IDxqaWF5dS5yaXNjdkBp
c3JjLmlzY2FzLmFjLmNuPiB3cm90ZToKCj4gV2hlbiBwcm9iaW5nIHRoZSBrMjMwIHBpbmN0cmwg
ZHJpdmVyLCB0aGUga2VybmVsIHRyaWdnZXJzIGEgTlVMTCBwb2ludGVyCj4gZGVyZWZlcmVuY2Uu
IFRoZSBjcmFzaCB0cmFjZSBzaG93ZWQ6Cj4gWyAgICAwLjczMjA4NF0gVW5hYmxlIHRvIGhhbmRs
ZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAw
MDAwMDAwMDAwMDY4Cj4gWyAgICAwLjc0MDczN10gLi4uCj4gWyAgICAwLjc3NjI5Nl0gZXBjIDog
azIzMF9waW5jdHJsX3Byb2JlKzB4MWJlLzB4NGZjCj4KPiBJbiBrMjMwX3BpbmN0cmxfcGFyc2Vf
ZnVuY3Rpb25zKCksIHdlIGF0dGVtcHQgdG8gcmV0cmlldmUgdGhlIGRldmljZQo+IHBvaW50ZXIg
dmlhIGluZm8tPnBjdGxfZGV2LT5kZXYsIGJ1dCBpbmZvLT5wY3RsX2RldiBpcyBvbmx5IGluaXRp
YWxpemVkCj4gYWZ0ZXIgazIzMF9waW5jdHJsX3BhcnNlX2R0KCkgY29tcGxldGVzLgo+Cj4gQXQg
dGhlIHRpbWUgb2YgRFQgcGFyc2luZywgaW5mby0+cGN0bF9kZXYgaXMgc3RpbGwgTlVMTCwgbGVh
ZGluZyB0bwo+IHRoZSBpbnZhbGlkIGRlcmVmZXJlbmNlIG9mIGluZm8tPnBjdGxfZGV2LT5kZXYu
Cj4KPiBVc2UgdGhlIGFscmVhZHkgYXZhaWxhYmxlIGRldmljZSBwb2ludGVyIGZyb20gcGxhdGZv
cm1fZGV2aWNlCj4gaW5zdGVhZCBvZiBhY2Nlc3NpbmcgdGhyb3VnaCB1bmluaXRpYWxpemVkIHBj
dGxfZGV2Lgo+Cj4gRml4ZXM6IGQ5NGEzMmFjNjg4ZiAoInBpbmN0cmw6IGNhbmFhbjogazIzMDog
Rml4IG9yZGVyIG9mIERUIHBhcnNlIGFuZCBwaW5jdHJsIHJlZ2lzdGVyIikKPiBTaWduZWQtb2Zm
LWJ5OiBKaWF5dSBEdSA8amlheXUucmlzY3ZAaXNyYy5pc2Nhcy5hYy5jbj4KClBhdGNoIGFwcGxp
ZWQhCgpTb3JyeSBmb3IgbWlzc2luZyB0aGlzLCBJIHdhcyB3YWl0aW5nIGZvciBtYWludGFpbmVy
IGZlZWRiYWNrCmJ1dCBpdCBuZXZlciBhcnJpdmVkLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
