Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FA3CA1009
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OATsXaUpQt0QwV49OXKbBzAwom3JYVaaUQINmG39Pf8=; b=ZapHl73m/jkte7
	TFFM0cO5ZBqOjYmwTG1ByQzZ11kDz4BPu4zyM+tNuqo11X+BQu8Skl0LXFX7mLhr9sBHAf1GZYfau
	cmJjSDO/UBh0jn19LPcPPSbAWuLizYOOHBCxxYVxnljzgmF265MM+AYb7ny3pOK5DWrjzGWK4xuv5
	LDRqmfD5loJBeqeXH+gVszT71wKBUjNlvoeu9gKqVbyX5tVVHak+9G3u0nT09U+pG00yKBtJCIcU+
	1T1lVAw31Ktvoi3UmaEz4joU7Cp5YFbIqLQ1HT8b/hsVagBkeAqdayKkSrFaC8oqefAEvfymsI5c5
	oirm2pHNB2SW8+nLshgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmvq-00000006SLw-1pRT;
	Wed, 03 Sep 2025 12:49:46 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utm6V-00000006IVx-2pdQ
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 11:56:44 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-31d7119322dso56160fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 04:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756900600; x=1757505400; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APKSuSS/fVxVxNIRz7xmQz/WCEFPilAmQiDv33UmZds=;
        b=QKNsEhXqr48iJsAKusFTRmGN2BNiAOxoRYZNLtAmisNdbaGwyN/v0i5xz0sPazegV4
         ICvnVmLeRFQ2kdgwt11BNT1nJIIrgDK15zbVN5kXY1DRTfGgqcOvaNpc5YzHsbcWV0PD
         lXOzio3Dlku9YyQcn88uLMtmIBvnoqPWyFwHOHa5J3xdeM5OVGrCr9hEULriPM356iQ7
         4YRetSwkar9wRQTcuwK7ZUDNUXjVRKDVUokkM4hHd34hsKxCMBd7PKfU0O2SCXCnVai4
         buzeskAbDeJbUuUNAtKnbCf3Ek5MvsAN1AWuOV+AW6PM897eLRqgjo2mDXFnDHXh5Zdf
         aKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900600; x=1757505400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APKSuSS/fVxVxNIRz7xmQz/WCEFPilAmQiDv33UmZds=;
        b=eg9yYfznjaqaRNPtZMtdrA6GKNGK5PEvb9AU7gd2dMPikGgnec2oKqU51lk1BvpsMe
         bxCkAU62U8DR4P6Qp4jhoRo4IKGzDaQBGZlN6GQD9X/QWe18/bahLYIHGbmUpDQf1LBu
         wG4+wBhb5Vd51uiP8CvBlG0/o8Rtaqy7zAuIe3i6uX5o0XrysimQhQVY9DDAHv0Q8HL6
         HsKEcjujAuHAuYo8I5KYwH5yeNHJNkmHChd/rieqKi7ppXAb0KPQacsfu59irLRIrGq4
         JfZo6P4FDsta/T9yukSf3ZB22Xyc2BPnLitA/fXWapikJ8sOouJUCVQEglTser1W8aFg
         56pg==
X-Forwarded-Encrypted: i=1; AJvYcCUsCS1fqZ4s8Cr2F+MGq9LrLUkeVcQadlPRu0rC8WbfyH6/4belBC786Sx7nOqbJemlgG3E6simZ3BTjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWcDlmRW0jnIYA1xtrUW0h7xIBSgAV3UrY5Pyi1H5O9aFMR9gs
	Yah7o9uOqT7RukwV55RqPbwBU9J/B1PpcBF24ytEWsEh8huhWYdMhpBc/GYUAgK1sqmWJZF+zSt
	5Lpqrav99kcCMzCJ+EHAqSujg+2xEkT0xZJux10T/1w==
X-Gm-Gg: ASbGncuIdEmerMCGHwIjc64DM2DCUtNfa/b0w3LprwbAZKboZbt91sjjp0Sw1FNmMgP
	QGjw8HsIFbgsggTj6+ur2jMObfwKruZz8fJAUc2jU+Up78xvUskOkpg9dTBuqwW1Bd1XnviHsvQ
	aHZc5g/QBsdJ4daAGSrGwc/xXQhnKkE2hEhl0IsQEGYp+dGQW4HtgOzjCksBRL6H8G+SXMOlkoE
	7Z+QJdOEFRwzLXfqP7ItTCufscLDrM=
X-Google-Smtp-Source: AGHT+IHzNG/bae/flkHEvpbYr0cWRiFGYBcRlfIUCA0hkHWscwORrD9erXClVYnAWO9a+v6BZHjoa+d3ZcNUM1a30FA=
X-Received: by 2002:a05:6871:3686:b0:314:b6a6:68a8 with SMTP id
 586e51a60fabf-31963480bf7mr6232182fac.48.1756900599934; Wed, 03 Sep 2025
 04:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
 <CAEEQ3wmBvevbkP8XmwR0_q_1QWQsie5g0UUxTFm6ovS1m41pEQ@mail.gmail.com> <CAD=FV=UzUCPtwuQRFR0SkAkh63MbzMefxNYmiOBxCemL3P_+EQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UzUCPtwuQRFR0SkAkh63MbzMefxNYmiOBxCemL3P_+EQ@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 3 Sep 2025 19:56:28 +0800
X-Gm-Features: Ac12FXxqD3B_4az_DfqpBxwMDURjxHr7LFapX1M6NDjnkBWeIMm-90QquXtdgEE
Message-ID: <CAEEQ3wmLOjZxVh_vBhmctH-u_ZSxnyg0GiN-_e_4v8_pfxcbSw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: Doug Anderson <dianders@chromium.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com, 
	masahiroy@kernel.org, suzuki.poulose@arm.com, maz@kernel.org, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, mingo@kernel.org, 
	lihuafei1@huawei.com, akpm@linux-foundation.org, jpoimboe@kernel.org, 
	rppt@kernel.org, kees@kernel.org, thomas.weissschuh@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_045643_722655_1DBB258A 
X-CRM114-Status: GOOD (  22.68  )
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

SGkgRG91Z++8jAoKT24gV2VkLCBTZXAgMywgMjAyNSBhdCAxOjA04oCvQU0gRG91ZyBBbmRlcnNv
biA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gU3VuLCBBdWcg
MzEsIDIwMjUgYXQgMTA6NTfigK9QTSB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNv
bT4gd3JvdGU6Cj4gPgo+ID4gSGkgRG91ZywKPiA+Cj4gPiBPbiBTYXQsIEF1ZyAzMCwgMjAyNSBh
dCA1OjM04oCvQU0gRG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToK
PiA+ID4KPiA+ID4gSGksCj4gPiA+Cj4gPiA+IE9uIFdlZCwgQXVnIDI3LCAyMDI1IGF0IDM6MTDi
gK9BTSBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4K
PiA+ID4gPiBNb3ZlIHdhdGNoZG9nX2hsZC5jIHRvIGtlcm5lbC8sIGFuZCByZW5hbWUgYXJtX3Bt
dV9pcnFfaXNfbm1pKCkKPiA+ID4gPiB0byBhcmNoX3BtdV9pcnFfaXNfbm1pKCkgZm9yIGNyb3Nz
LWFyY2ggcmV1c2FiaWxpdHkuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkg
Q3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgYXJjaC9h
cm02NC9rZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAxIC0KPiA+ID4gPiAgZHJp
dmVycy9wZXJmL2FybV9wbXUuYyAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gPiA+ID4g
IGluY2x1ZGUvbGludXgvbm1pLmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gPiA+
ID4gIGluY2x1ZGUvbGludXgvcGVyZi9hcm1fcG11LmggICAgICAgICAgICAgICAgIHwgMiAtLQo+
ID4gPiA+ICBrZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIg
Ky0KPiA+ID4gPiAge2FyY2gvYXJtNjQva2VybmVsID0+IGtlcm5lbH0vd2F0Y2hkb2dfaGxkLmMg
fCA4ICsrKysrKy0tCj4gPiA+ID4gIDYgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQo+ID4gPiA+ICByZW5hbWUge2FyY2gvYXJtNjQva2VybmVsID0+IGtlcm5l
bH0vd2F0Y2hkb2dfaGxkLmMgKDk3JSkKPiA+ID4KPiA+ID4gSSdtIG5vdCBhIGh1Z2UgZmFuIG9m
IHRoZSBwZXJmIGhhcmRsb2NrdXAgZGV0ZWN0b3IgYW5kIElNTyB3ZSBzaG91bGQKPiA+ID4gbWF5
YmUganVzdCBkZWxldGUgaXQuIFRodXMgc3ByZWFkaW5nIGl0IHRvIHN1cHBvcnQgYSBuZXcgYXJj
aGl0ZWN0dXJlCj4gPiA+IGlzbid0IG15IGZhdm9yaXRlIHRoaW5nIHRvIGRvLiBDYW4ndCB5b3Ug
dXNlIHRoZSBidWRkeSBoYXJkbG9ja3VwCj4gPiA+IGRldGVjdG9yPwo+ID4KPiA+IFdoeSBpcyB0
aGVyZSBhIHBsYW4gdG8gcmVtb3ZlIENPTkZJR19IQVJETE9DS1VQX0RFVEVDVE9SX1BFUkY/IENv
dWxkCj4gPiB5b3UgZXhwbGFpbiB0aGUgc3BlY2lmaWMgcmVhc29ucz8gSXMgdGhlIGNvbW11bml0
eSdzIGZ1dHVyZSBwbGFuIHRvCj4gPiBmYXZvciBDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9C
VUREWT8KPgo+IEkgZG9uJ3QgdGhpbmsgdGhlcmUgYXJlIGFueSBjb25jcmV0ZSBwbGFucywgYnV0
IHRoZXJlIHdhcyBzb21lIGRpc2N1c3Npb24gaGVyZToKPgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC9DQUQ9RlY9V1dVaUNpNmJaQ3NfZ3NlRnBERFdOa3VKTW9MNlhDZnRFbzZXN3E2alJD
a2dAbWFpbC5nbWFpbC5jb20vCj4KPiAtRG91Zwo+CgpJ4oCZdmUgcmVhZCB5b3VyIGxpbmtlZCBj
b250ZW50LCB3aGljaCBkZXRhaWxzIHRoZSBwcm9zIGFuZCBjb25zIG9mIHBlcmYKd2F0Y2hkb2cg
YW5kIGJ1ZGR5IHdhdGNoZG9nLgpJIHRoaW5rIGV2ZXJ5b25lIHdpbGwgYWdyZWUgb24gY2hvb3Np
bmcgb25lIGFzIHRoZSBkZWZhdWx0LgpJdCBzZWVtcyB0aGVyZeKAmXMgbm8ga2VybmVsL3dhdGNo
ZG9nIGVudHJ5IGluIE1BSU5UQUlORVJT4oCUd2hhdOKAmXMgbmV4dApmb3IgdGhlc2UgdHdvIGFw
cHJvYWNoZXM/CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
