Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F68DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 09:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MK+VUCvmpXpDkz3fzXk2R7yKzOlgV4J6B3cjUR+VHk=; b=YCquHXUbnWzOyO
	dSM0CAuF+TJ8TqJ2uA8+lIsQmONH4Hu0rOuBbxVpQ7Fw1mZtnR4xGaEtBFDnV/LocYgQyqmirCTjt
	QpIHydHPP3ogTjxY4AGwNcGTRVdWWI9C8H+sE2VWi6Qay/s+PC2UWHZ2bwvtHqj80KQicmVPWzIQO
	FFZnS1LDVau9ALQ1xIRa2/Yn2GV82o/jMIZrHX3C0VkJBqr690gizgQAYdQosoLyBemxn2M0TYd3x
	yeKuv13lcntm2kXA0AMB9u93IEM12tMrujUXmjzP8kzfPjjSwY+z63ak37zvWTYJo6SsF6lITDNB0
	X6nHN6nJncDOInr7DZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7DWR-00FacA-UP; Tue, 11 Jan 2022 09:32:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7DWP-00FaaU-CM
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 09:32:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so600527wmb.1
 for <linux-riscv@lists.infradead.org>; Tue, 11 Jan 2022 01:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=LMy8F7bXkWrfEku+dhz2YISyVBkNNTuMoqdf7ZkD0To=;
 b=swXL9gRXyWFnGDtv9BadckJ6mLhM/69zfWU8+ocZOa4z77GDZ8hKX0DOB+IIRfXo+x
 b674NAHat2ChsOGpuPvzN/U3YLXZyFBO4hmbtepec/oXDUnmVHK4Ebt9s41Vl8Wc8MNX
 nrA2tpPjnjIAnICQLZjtg4UV4b6iTP5OImqH8UEpFlJkZ/vzL00kYYg44u2zjAOtIyKa
 /6xKppWMPDmcz6K60WT/NXf77pvlHdaEiLHIaoXPVLkGVzaUEBNLI7jJ72q6nsIJ7401
 L5zwEFYwKbcsEKnFcjL5eS1n2WQ5bhgV1FcYc+2zPJtOPHAi4QHPVLQeyfJaSVvBs7aN
 e+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LMy8F7bXkWrfEku+dhz2YISyVBkNNTuMoqdf7ZkD0To=;
 b=08Oc4pHgKKhMLOYsCZs39Utl/RQVN4lIEx3aHOmWTywR1iA3DhpTM8sIx8AqegfYrk
 e/c0GaZdL3OgLDyGkUm5ttp0sTkzwSaqYECAU+JQsd+q3sEs49G34HIFQChePBADBLor
 jBsaB+vsFilda0zQtPGuK6rVxFAL5+19VWLH2y0DPZGuQSNR9VlqRlyIIP/CxNIDBby7
 cAvR+Vnea4zrLmm8NpkG+WZk/3o2Uc9X/ScPlXh/6rKXC/8hurttIhsrNyVvcEFlVv2c
 ZGF56dh71ZzCGWR5mr4VUF+yiXeNVRvIKz+Xoiv5JXKwDviiQPGlit43feT2bvobgtUb
 1JJg==
X-Gm-Message-State: AOAM532OOj+iMcXe0Z5fXOWMqv3vGU77shkmz0V6B4IX+y8sUD69JaW9
 nXwSC9Gd50Mkv3CMfxPlA1f0wQ==
X-Google-Smtp-Source: ABdhPJwQ6g3l92q6YTIRewH/TedS5Xf7kkSd9jd60tQw54xnN2pnwEFRMhX7cN9SGsdpzYFiPEF0gA==
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr1624941wmh.133.1641893571493; 
 Tue, 11 Jan 2022 01:32:51 -0800 (PST)
Received: from google.com ([31.124.24.179])
 by smtp.gmail.com with ESMTPSA id b14sm8798529wrg.15.2022.01.11.01.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 01:32:51 -0800 (PST)
Date: Tue, 11 Jan 2022 09:32:44 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Zong Li <zong.li@sifive.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 RESEND] clk: sifive: Fix W=1 kernel build warning
Message-ID: <Yd1OvFZ4pKw+aTgv@google.com>
References: <20220107090715.2601-1-zong.li@sifive.com>
 <YdwBWmF8OJYab7qS@google.com>
 <CANXhq0ookagQTZZrNduP5DjXs2awQdRkUxNzTWU=-dz+TVuUwg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0ookagQTZZrNduP5DjXs2awQdRkUxNzTWU=-dz+TVuUwg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_013253_479028_9F9183D5 
X-CRM114-Status: GOOD (  26.89  )
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

T24gVHVlLCAxMSBKYW4gMjAyMiwgWm9uZyBMaSB3cm90ZToKCj4gT24gTW9uLCBKYW4gMTAsIDIw
MjIgYXQgNTo1MCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90ZToKPiA+
Cj4gPiBQbGVhc2UgaW1wcm92ZSB0aGUgc3ViamVjdCBsaW5lLgo+ID4KPiA+IElmIHRoaXMgaXMg
YSBzdHJhaWdodCByZXZlcnQsIHRoZSBzdWJqZWN0IGxpbmUgc2hvdWxkIHJlZmxlY3QgdGhhdC4K
PiA+Cj4gPiBJZiBub3QsIHlvdSBuZWVkIHRvIGdpdmUgdXMgc3BlY2lmaWMgaW5mb3JtYXRpb24g
cmVnYXJkaW5nIHRoZSBwdXJwb3NlCj4gPiBvZiB0aGlzIHBhdGNoLiAgUGxlYXNlIHJlYWQgdGhl
IEdpdCBsb2cgZm9yIGJldHRlciwgbW9yZSBmb3J0aGNvbWluZwo+ID4gZXhhbXBsZXMuCj4gPgo+
IAo+IEl0IHNlZW1zIHRvIG1lIHRoYXQgdGhpcyBwYXRjaCBpcyBub3QgYSBzdHJhaWdodCByZXZl
cnQsIGl0IHByb3ZpZGVzCj4gYW5vdGhlciB3YXkgdG8gZml4IHRoZSBvcmlnaW5hbCBidWlsZCB3
YXJuaW5ncywganVzdCBsaWtlCj4gJzQ4N2RjN2JiNmEwYycgdHJpZWQgdG8gZG8uIEkgZ3Vlc3Mg
dGhlIGNvbW1pdCBtZXNzYWdlIGhhcyBkZXNjcmliZWQKPiB3aGF0IHRoZSBvcmlnaW5hbCB3YXJu
aW5ncyBpcyBhbmQgd2hhdCB0aGUgcm9vdCBjYXVzZSBpcywgaXQgYWxzbwo+IG1lbnRpb25lZCB3
aGF0IGlzIGNoYW5nZWQgaW4gdGhpcyBwYXRjaC4gSSdtIGEgYml0IGNvbmZ1c2VkIHdoZXRoZXIg
d2UKPiBuZWVkIHRvIGFkZCBmaXhlcyB0YWcsIGl0IGxvb2tzIGxpa2UgdGhhdCBpdCBtaWdodCBj
YXVzZSBzb21lCj4gbWlzdW5kZXJzdGFuZGluZz8KCkkgdGhpbmsgaXQncyB0aGUgcGF0Y2ggZGVz
Y3JpcHRpb24gYW5kIHN1YmplY3QgdGhhdCBpcyBjYXVzaW5nIHRoZQptaXN1bmRlcnN0YW5kaW5n
LgoKUGxlYXNlIGhlbHAgbWUgd2l0aCBhIGNvdXBsZSBvZiBwb2ludHMgYW5kIEknbGwgaGVscCB5
b3UgZHJhZnQKc29tZXRoaW5nIHVwLgoKRmlyc3RseSwgd2hhdCBhbGVydGVkIHlvdSB0byB0aGUg
cHJvYmxlbSB5b3UncmUgYXR0ZW1wdGluZyB0byBzb2x2ZT8KCj4gPiA+IC0tLSBhL2RyaXZlcnMv
Y2xrL3NpZml2ZS9mdTU0MC1wcmNpLmMKPiA+ID4gKysrIGIvZHJpdmVycy9jbGsvc2lmaXZlL2Z1
NTQwLXByY2kuYwo+ID4gPiBAQCAtMjAsNyArMjAsNiBAQAo+ID4gPgo+ID4gPiAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2Nsb2NrL3NpZml2ZS1mdTU0MC1wcmNpLmg+Cj4gPiA+Cj4gPiA+IC0jaW5j
bHVkZSAiZnU1NDAtcHJjaS5oIgoKSG93IGlzIHRoaXMgcmVsYXRlZCB0byB0aGUgaXNzdWUvcGF0
Y2g/Cgo+ID4gPiArc3RydWN0IHByY2lfY2xrX2Rlc2MgcHJjaV9jbGtfZnU1NDAgPSB7Cj4gPiA+
ICsgICAgIC5jbGtzID0gX19wcmNpX2luaXRfY2xvY2tzX2Z1NTQwLAo+ID4gPiArICAgICAubnVt
X2Nsa3MgPSBBUlJBWV9TSVpFKF9fcHJjaV9pbml0X2Nsb2Nrc19mdTU0MCksCj4gPiA+ICt9OwoK
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3NpZml2ZS9mdTU0MC1wcmNpLmggYi9kcml2
ZXJzL2Nsay9zaWZpdmUvZnU1NDAtcHJjaS5oCj4gPiA+IGluZGV4IGMyMjA2NzdkYzAxMC4uOTMx
ZDZjYWQ4YzFjIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2Nsay9zaWZpdmUvZnU1NDAtcHJj
aS5oCj4gPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3NpZml2ZS9mdTU0MC1wcmNpLmgKPiA+ID4gQEAg
LTcsMTAgKzcsNiBAQAo+ID4gPiArZXh0ZXJuIHN0cnVjdCBwcmNpX2Nsa19kZXNjIHByY2lfY2xr
X2Z1NTQwOwoKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3NpZml2ZS9zaWZpdmUtcHJj
aS5jIGIvZHJpdmVycy9jbGsvc2lmaXZlL3NpZml2ZS1wcmNpLmMKPiA+ID4gaW5kZXggODBhMjg4
YzU5ZTU2Li45MTZkMmZjMjhiOWMgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3NpZml2
ZS9zaWZpdmUtcHJjaS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3NpZml2ZS9zaWZpdmUtcHJj
aS5jCj4gPiA+IEBAIC0xMiwxMSArMTIsNiBAQAo+ID4gPiAgI2luY2x1ZGUgImZ1NTQwLXByY2ku
aCIKPiA+ID4gICNpbmNsdWRlICJmdTc0MC1wcmNpLmgiCj4gPiA+Cj4gPiA+IC1zdGF0aWMgY29u
c3Qgc3RydWN0IHByY2lfY2xrX2Rlc2MgcHJjaV9jbGtfZnU1NDAgPSB7Cj4gPiA+IC0gICAgIC5j
bGtzID0gX19wcmNpX2luaXRfY2xvY2tzX2Z1NTQwLAo+ID4gPiAtICAgICAubnVtX2Nsa3MgPSBB
UlJBWV9TSVpFKF9fcHJjaV9pbml0X2Nsb2Nrc19mdTU0MCksCj4gPiA+IC19Owo+ID4gPiAtCgpJ
J20gbm90IHN1cmUgaWYgaXQncyB5b3Ugb3IgSSB0aGF0IGlzIG1pc3NpbmcgdGhlIHBvaW50IGhl
cmUsIGJ1dApwcmNpX2Nsa19mdTU0MCBpcyB1c2VkIHdpdGhpbiAqdGhpcyogZmlsZSBpdHNlbGY6
Cgogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc2lmaXZlX3ByY2lfb2ZfbWF0Y2hb
XSA9IHsKICAgICAgICAgey5jb21wYXRpYmxlID0gInNpZml2ZSxmdTU0MC1jMDAwLXByY2kiLCAu
ZGF0YSA9ICZwcmNpX2Nsa19mdTU0MH0sCiAgICAgICAgIHsuY29tcGF0aWJsZSA9ICJzaWZpdmUs
ZnU3NDAtYzAwMC1wcmNpIiwgLmRhdGEgPSAmcHJjaV9jbGtfZnU3NDB9LAogICAgICAgICB7fQog
fTsKClNvIHdoeSBhcmUgeW91IG1vdmluZyBpdCBvdXQgdG8gc29tZXdoZXJlIGl0IGlzICpub3Qq
IHVzZWQgYW5kIG1ha2luZwppdCBhbiBleHRlcm4/ICBUaGlzIHNvdW5kcyBsaWtlIHRoZSBvcHBv
c2l0ZSB0byB3aGF0IHlvdSdkIHdhbnQ/CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClByaW5j
aXBhbCBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBP
cGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sg
fCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
