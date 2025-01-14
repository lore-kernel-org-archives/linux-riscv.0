Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44397E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 06:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkKEywHOCDOwTyW9VoBMuW5Z4fe3htESgCBkRTdbZh8=; b=OLwi7IVwUYRA81
	oD88sdtPUtVUpMyWVCoxKh/Nlata2YqP28Tgxiv+In3u+MjeM9BF4TEXrTc8ZKFGEZqQFCbj4LdTQ
	MUlv+dh9I9+cv0aYPNpzPZjErZbX8Z/Cs/ZU4IosPqf1YVZ3PrOc96NKYyn+822lctjexB12wmAUC
	jkKEvg//d5LJdegU6hvCkEaLukGofT7S2K+801z75z+g/PQQ9QuhOWmGa52Vs9wdEfih66Q+wfMC5
	pOy+k4dwfVLExtgfUDcDCCIIT2maKcTT5klA73usTfzVgYUnbBN42PnSf/YgTFC+HkXMDyWBu8BgE
	pi5AD7bvdCINm10/d3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXaaQ-00000007c1C-1jgi;
	Tue, 14 Jan 2025 06:39:38 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXaaM-00000007c0g-47Ll
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 06:39:36 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f4448bf96fso6466297a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 22:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736836773; x=1737441573; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VC5EI+Wdc74KN8yFTiG4LlZGMfcGCq1v/ByOPTNlxQo=;
        b=V6XJ00WlBuOUov8N8hCtYy2A2XTJvn9fo8Ny7YS25w0sffki7xea+CQVbzK9TTLurk
         RA9Mfs6RLnv9J6qfnuD+clzuzHxR433vzhUDx2btQTb3aeB7zSYvQ+pYeZ4qWGMaPkfR
         o5JSQuWFhh3a26m58UQfE/RNYI0Q6ehP8GUh+A/bqNdvM3mcy+Z4MiZQhYjdzWJJC3tu
         2198w9foYY77PLuCZsdfeJShNm9EiNc9QtmrQc26Ll3AY6wo0ZiUDPVnrqndxFpQAQ4s
         RgGEMke62hBaXihPZ0Ys5cTwgEiGpDd0PYVzX6rUEI2fMHMPEL/pPhxrbHCW7gVXdkk8
         8cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736836773; x=1737441573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VC5EI+Wdc74KN8yFTiG4LlZGMfcGCq1v/ByOPTNlxQo=;
        b=AM0qj6ogQ/M0wVe+q4tkv+dO8ebhjkLDl4FVOp0j8SyJriIG5ABLBWcMsWyP0LUAjm
         UGtecy0JHQ4Jg3/cfr+dwUphAeg2nku3bUFetnWtI41EeEntHChsHvdgApnu/JLoGaqp
         6+5hzbRKonDyndaO+c3V5bmdkVcGM7yKktl6Gfm9JFjA2KpVIB3g+hY/YnzARHnLYn7/
         iY9ooAhqGG8ohFwEPgC39fnIfHvUWVqIOTqajQrr0pbJBmWdbpyg+wNtE+uBqXyIvCWR
         tXItaKPQdMRUWkkMiLo4pSdIx70G63WtrL2VJ6esmOMkaNI6ZHBPG6wE4KDfmFuagE9I
         fxOw==
X-Forwarded-Encrypted: i=1; AJvYcCWE/7Xd+EM+SB5NlyA8Slo6yyirbihZ8NHqE6tRqmG6bRVUAtLgjqKeYifrVlZK5+x6OL4pa3XJZlszMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkgFmWkbS4ML544QVQmMFf52XdMzxZyU5p0TU50xhC6mqV5cuK
	9fU5lFrGWkfdbKFQL4U4tBO9+jrUCkZ7tR7/MT2ebQYvW+dhThZxdTWspQJXWUCE1y1JvI5Qn+n
	CvHTFR/vkMTd8E8tP0BYk7pi0TdXEW6k33ntbCLJZJqJRyVctFpP+2A==
X-Gm-Gg: ASbGncu+i2yO0AGcoHRN3uHB8qlFLFqlz/B9KKTjOMb5zUCFx1q85BbNWFgCId/Oa84
	/Jzqp9nrcWsIlawWEzACLYNr+ROmxQWCTkK1q4sW44tOBryrvTZQ=
X-Google-Smtp-Source: AGHT+IFiJeeIlF0g5KxkBRN7/VqcEZP6kKQSFwIkALfiw25opBFKRRNJCdL05st0mH2pjsfhKvrYWHLJ98JjBLGtGXM=
X-Received: by 2002:a17:90a:d64b:b0:2ee:8aa7:94a0 with SMTP id
 98e67ed59e1d1-2f548f42490mr29285939a91.32.1736836773063; Mon, 13 Jan 2025
 22:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20250113150933.65121-1-luxu.kernel@bytedance.com>
 <20250113150933.65121-4-luxu.kernel@bytedance.com> <CAAhSdy1UaFVyGMCtGHZZTuEhxGAja=9viN10SbFXKcNwjwJ8yw@mail.gmail.com>
In-Reply-To: <CAAhSdy1UaFVyGMCtGHZZTuEhxGAja=9viN10SbFXKcNwjwJ8yw@mail.gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Tue, 14 Jan 2025 14:39:22 +0800
X-Gm-Features: AbW1kvbBFk197XV7hb0sIEw7cMbcGtjtvCnz47p_TWAyG1TuaOYHGDPzIRzxQyY
Message-ID: <CAPYmKFviTHKTH=Me74qvjFwq6JxwiCYwtrpft-jMb_SkyvRuSQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 3/5] irqchip/riscv-imsic: Use wmb() to
 order normal writes and IPI writes
To: Anup Patel <anup@brainfault.org>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_223935_342976_FBE0C808 
X-CRM114-Status: GOOD (  20.84  )
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

SGkgQW51cCwKCkkgd2FudCB0byBlbnN1cmUgd2hlbiB0aGUgcmVjZWl2ZXIgQ1BVIHRyYXBzIGlu
dG8gaW50ZXJydXB0LCBpdCBjYW4Kc2VlIGFsbCBtZW1vcnkgdXBkYXRlcyBtYWRlIGJ5IHRoZSBz
ZW5kZXIgYmVmb3JlLgoKVGhlIHNtcF9tYl9fYWZ0ZXJfYXRvbWljKCkgdXNlcyAnZmVuY2Ugcncs
IHJ3JyB3aGljaCBvcmRlcnMgbm9ybWFsCm1lbW9yeSByZWFkcy93cml0ZXMuIFRoZSBJTVNJQyB3
cml0ZSBpcyBhY3R1YWxseSBJTyB3cml0ZXMgYW5kIGlzIG5vdApvcmRlcmVkIGJ5IGl0LgoKU28g
SSB3b3JyeSBpbiBleHRyZW1lIGNhc2VzLCB0aGUgcmVjZWl2ZXIgQ1BVIGNhbiByZWNlaXZlIHRo
ZSBJUEkKZmlyc3QsIHNlZSBubyB1cGRhdGVzIHRvIGlwaV9tdXhfcGNwdS0+Yml0cyBhbmQgcmV0
dXJuIGltbWVkaWF0ZWx5LgpUaGVuIHRoaXMgSVBJIHdpbGwgbm90IGJlIGhhbmRsZWQgdW50aWwg
YW5vdGhlciBJUEkgY29tZXMuCgpCZXN0IFJlZ2FyZHMsCgpYdSBMdQoKT24gVHVlLCBKYW4gMTQs
IDIwMjUgYXQgMTI6MzTigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90
ZToKPgo+IE9uIE1vbiwgSmFuIDEzLCAyMDI1IGF0IDg6MznigK9QTSBYdSBMdSA8bHV4dS5rZXJu
ZWxAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRHVyaW5nIGFuIElQSSBwcm9jZWR1cmUs
IHdlIG5lZWQgdG8gZW5zdXJlIGFsbCBwcmV2aW91cyB3cml0ZSBvcGVyYXRpb25zCj4gPiBhcmUg
dmlzaWJsZSB0byBvdGhlciBDUFVzIGJlZm9yZSBzZW5kaW5nIGEgcmVhbCBJUEkuIFdlIHVzZSB3
bWIoKSBiYXJyaWVyCj4gPiB0byBlbnN1cmUgdGhpcyBhcyBJTVNJQyBpc3N1ZXMgSVBJIHZpYSBt
bWlvIHdyaXRlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0
ZWRhbmNlLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMt
ZWFybHkuYyB8IDYgKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLWVhcmx5
LmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLWVhcmx5LmMKPiA+IGluZGV4IDYz
MDk3ZjJiYmFkZi4uYzYzMTdjYjU1N2ZiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlw
L2lycS1yaXNjdi1pbXNpYy1lYXJseS5jCj4gPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJp
c2N2LWltc2ljLWVhcmx5LmMKPiA+IEBAIC0yOSw2ICsyOSwxMiBAQCBzdGF0aWMgdm9pZCBpbXNp
Y19pcGlfc2VuZCh1bnNpZ25lZCBpbnQgY3B1KQo+ID4gIHsKPiA+ICAgICAgICAgc3RydWN0IGlt
c2ljX2xvY2FsX2NvbmZpZyAqbG9jYWwgPSBwZXJfY3B1X3B0cihpbXNpYy0+Z2xvYmFsLmxvY2Fs
LCBjcHUpOwo+ID4KPiA+ICsgICAgICAgLyoKPiA+ICsgICAgICAgICogRW5zdXJlIHRoYXQgc3Rv
cmVzIHRvIG5vcm1hbCBtZW1vcnkgYXJlIHZpc2libGUgdG8gdGhlIG90aGVyIENQVXMKPiA+ICsg
ICAgICAgICogYmVmb3JlIGlzc3VpbmcgSVBJLgo+ID4gKyAgICAgICAgKi8KPiA+ICsgICAgICAg
d21iKCk7Cj4gPiArCj4KPiBUaGUgaW1zaWNfaXBpX3NlbmQoKSBpcyBjYWxsZWQgdGhyb3VnaCBp
cGlfbXV4X3NlbmRfbWFzaygpCj4gd2hpY2ggZG9lcyBzbXBfbWJfX2FmdGVyX2F0b21pYygpIGJl
Zm9yZSBjYWxsaW5nIHNvIG5vIG5lZWQKPiBmb3IgYW55IGJhcnJpZXIgaGVyZS4gQWxzbywgYmFy
cmllcnMgbmVlZCB0byBiZSBpbi1wYWlyIHNvIGFkZGluZwo+IGEgc2luZ2xlIGJhcnJpZXIgYXQg
cmFuZG9tIGxvY2F0aW9uIGlzIGluYXBwcm9wcmlhdGUuCj4gKFJlZmVyLCBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJl
ZS9rZXJuZWwvaXJxL2lwaS1tdXguYz9oPXY2LjEzLXJjNyNuNzgpCj4KPiBCYXNlZCBvbiB0aGUg
YWJvdmUsIHRoaXMgcGF0Y2ggaXMgbm90IG5lZWRlZC4KPgo+IFJlZ2FyZHMsCj4gQW51cAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
