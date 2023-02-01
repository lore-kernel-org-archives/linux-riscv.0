Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9862CC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 08:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqBp4OER8gNglcOMNVFGwdQ+YylpiX2fzp2UqgrBBgY=; b=JTrOOACSEcXPP1
	+eLSMjy4+UANMcqhuClgfTYQ0ZPG9lYs2F5hr3fTd3vCOfKOQwgqHEX3am88LJO3ciZgp0Y2K9nw9
	h7XaFp3iUEV6RXu5Srky5EVQVJ1LM+gXEAT3R9ZItkY7iLJt4Q3zDseWVbiz86XjKmTtSxuemT/zh
	z4Nr3dYKgE20FnJ1JX9yduDfW3s5lSmiQYj8qcMGHFVJqwiRHgPX74IbqYuGe56nOxgv5hQdb5o7B
	Ga+VlOKk9MDbTvt4HpiNmdRqQVYgQ+oLzYa1S37kDF0/hOTrYeOdgJX8+3bi3teyqC8bOG/eMrMg6
	XjS5zO5vxxC1xGcOB5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8vQ-00AteP-5f; Wed, 01 Feb 2023 08:57:04 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8vM-00Atd4-HY
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 08:57:02 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id u72so21418448ybi.7
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 00:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIDwgLQh+NbqNP8OLmpO2Vx3bIkolFmj8N0nOzJV3+k=;
        b=TLyEwLxYxs6dcNxg13tL0YvHZNaEW9ystM8icB0p1pEg3m4P/ZEXsxAhHEn5ADG8Ha
         cnRTVF/iaelxwZmVxFTfVD2YlSCKSt9ucC/HU4P3ALuEfDdy+8POAuguQSIBSp27nFP+
         E3KZ1wk/D9piWPJQJ7cVOFr0HlYhsOTHYXcNNOqKNsJCoAOKYRXdzHenkKZlLGQZHjUW
         mDsy3Wyb/o8g3eZDIrAICnOHwod4+DsXalQQ+X/Vq/BBAl8avH2ewj+uiRF9UL13CJZE
         4DIFVQVACV+aeF157msUhsPBPoo9OBYo1GR7xpN+VDvr5Cqr8SHc7IJhIJ2dUwQFkrIO
         SLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIDwgLQh+NbqNP8OLmpO2Vx3bIkolFmj8N0nOzJV3+k=;
        b=W+viVVE+LdOrQ2dK1RaFvRSZNZKGRdu5liLm3u995dzPyHL+PMq5i78j0qyDh3gtkj
         ApifDLamq3e6OAYfgcK61BWda0uV3bHozJxxoBvsfzwQ18QufdKNa/qCVTRgMmF1qF6R
         Uw/uhRQuoNcTZXXinBikMVVSLXUAUKgG+zfzerLWhZ63sUHay3B9IbGeQHCv9kxO9wwG
         35irhnvtDkOg4eXCxog7o7UTiqtSiJgUaVMYF+uD8psa+Vpu6oxIp9D2P/fj18gp+NPm
         ETpItp2x3i5tRVcAGhzhEApQM1xONIy4FtKKA+ueU7VDym+2R767XCum8ySDZk1vE7+N
         8zWw==
X-Gm-Message-State: AO0yUKVhsMa/9iSU893POQ/WJiptQh1MtNgCysokloS8YKbaNSMsbZPT
	ABbUQp8DMNfueXHa6AT1y4b1J62Wv7LFR2+a2QfdZA==
X-Google-Smtp-Source: AK7set8BNnJY9+pWPPb/CtKCpODIDdh4g/co09R/6gTTgNOK8AdgLPa9G6N+48YHmDvjNYnsTen/FrCksbGVOD6nEzc=
X-Received: by 2002:a25:8185:0:b0:80b:5cc8:6350 with SMTP id
 p5-20020a258185000000b0080b5cc86350mr277961ybk.154.1675241816664; Wed, 01 Feb
 2023 00:56:56 -0800 (PST)
MIME-Version: 1.0
References: <20230130093229.27489-1-nylon.chen@sifive.com> <20230130093229.27489-3-nylon.chen@sifive.com>
 <20230130101707.pdvabl3na2wpwxqu@pengutronix.de>
In-Reply-To: <20230130101707.pdvabl3na2wpwxqu@pengutronix.de>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Wed, 1 Feb 2023 16:56:42 +0800
Message-ID: <CAHh=Yk_hFOjwY1mbmYk8yqH_AKDs1_3J+5pYQStseNsZukPSoA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pwm: sifive: change the PWM controlled LED algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: aou@eecs.berkeley.edu, conor@kernel.org, 
	emil.renner.berthing@canonical.com, geert+renesas@glider.be, heiko@sntech.de, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org, thierry.reding@gmail.com, 
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nylon7717@gmail.com, zong.li@sifive.com, greentime.hu@sifive.com, 
	vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_005700_603883_A5500F01 
X-CRM114-Status: GOOD (  24.47  )
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

SGkgVXdlLAoKVGhhbmtzIGZvciB5b3VyIHJlcGx5LgoKVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4g5pa8IDIwMjPlubQx5pyIMzDml6Ug6YCx5LiAIOS4
i+WNiDY6MTflr6vpgZPvvJoKPgo+IE9uIE1vbiwgSmFuIDMwLCAyMDIzIGF0IDA1OjMyOjI5UE0g
KzA4MDAsIE55bG9uIENoZW4gd3JvdGU6Cj4gPiBUaGUgYGZyYWNgIHZhcmlhYmxlIHJlcHJlc2Vu
dHMgdGhlIHB1bHNlIGluYWN0aXZlIHRpbWUsIGFuZCB0aGUgcmVzdWx0IG9mCj4gPiB0aGlzIGFs
Z29yaXRobSBpcyB0aGUgcHVsc2UgYWN0aXZlIHRpbWUuIFRoZXJlZm9yZSwgd2UgbXVzdCByZXZl
cnNlIHRoZQo+ID4gcmVzdWx0Lgo+ID4KPiA+IFRoZSByZWZlcmVuY2UgaXMgU2lGaXZlIEZVNzQw
LUMwMDAgTWFudWFsWzBdLgo+ID4KPiA+IFswXTogaHR0cHM6Ly9zaWZpdmUuY2RuLnByaXNtaWMu
aW8vc2lmaXZlLzFhODJlNjAwLTFmOTMtNGY0MS1iMmQ4LTg2ZWQ4YjE2YWNiYV9mdTc0MC1jMDAw
LW1hbnVhbC12MXA2LnBkZgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE55bG9uIENoZW4gPG55bG9u
LmNoZW5Ac2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyB8
IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgYi9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMK
PiA+IGluZGV4IDYyYjZhY2M2MzczZC4uYTVlZGExNjVkMDcxIDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy9wd20vcHdtLXNpZml2ZS5jCj4gPiArKysgYi9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMK
PiA+IEBAIC0xNTgsNiArMTU4LDcgQEAgc3RhdGljIGludCBwd21fc2lmaXZlX2FwcGx5KHN0cnVj
dCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPiA+ICAgICAgIGZyYWMg
PSBESVY2NF9VNjRfUk9VTkRfQ0xPU0VTVChudW0sIHN0YXRlLT5wZXJpb2QpOwo+ID4gICAgICAg
LyogVGhlIGhhcmR3YXJlIGNhbm5vdCBnZW5lcmF0ZSBhIDEwMCUgZHV0eSBjeWNsZSAqLwo+ID4g
ICAgICAgZnJhYyA9IG1pbihmcmFjLCAoMVUgPDwgUFdNX1NJRklWRV9DTVBXSURUSCkgLSAxKTsK
PiA+ICsgICAgIGZyYWMgPSAoMVUgPDwgUFdNX1NJRklWRV9DTVBXSURUSCkgLSAxIC0gZnJhYzsK
Pgo+IFRoZSBzYW1lIHByb2JsZW0gZXhpc3RzIGluIHB3bV9zaWZpdmVfZ2V0X3N0YXRlKCksIGRv
ZXNuJ3QgaXQ/Cj4KPiBBcyBmaXhpbmcgdGhpcyBpcyBhbiBpbnRlcnJ1cHRpdmUgY2hhbmdlIGFu
eWhvdywgdGhpcyBpcyB0aGUgb3Bwb3J0dW5pdHkKPiB0byBhbGlnbiB0aGUgZHJpdmVyIHRvIHRo
ZSBydWxlcyB0ZXN0ZWQgYnkgUFdNX0RFQlVHLgo+Cj4gVGhlIHByb2JsZW1zIEkgc2VlIGluIHRo
ZSBkcml2ZXIgKG9ubHkgY2hlY2tlZCBxdWlja2x5LCBzbyBJIG1pZ2h0IGJlCj4gd3JvbmcpOgo+
Cj4gIC0gc3RhdGUtPnBlcmlvZCAhPSBkZGF0YS0+YXBwcm94X3BlcmlvZCBpc24ndCBuZWNlc3Nh
cmlseSBhIHByb2JsZW0uIElmCj4gICAgc3RhdGUtPnBlcmlvZCA+IGRkYXRhLT5yZWFsX3Blcmlv
ZCB0aGF0J3MgZmluZSBhbmQgdGhlIGRyaXZlciBzaG91bGQKPiAgICBjb250aW51ZQo+Cj4gIC0g
ZnJhYyA9IERJVjY0X1U2NF9ST1VORF9DTE9TRVNUKG51bSwgc3RhdGUtPnBlcmlvZCk7Cj4gICAg
aXMgd3JvbmcgZm9yIHR3byByZWFzb25zOgo+ICAgIGl0IHNob3VsZCByb3VuZCBkb3duIGFuZCB1
c2UgdGhlIHJlYWwgcGVyaW9kLgo+CkkgbmVlZCBhIGxpdHRsZSB0aW1lIHRvIGNsYXJpZnkgeW91
ciBhc3N1bXB0aW9ucy4gSWYgcG9zc2libGUsIEkgd2lsbAptYWtlIHNpbWlsYXIgY2hhbmdlcy4K
CmUuZy4Kcm91bmRkb3duKG51bSwgc3RhdGUtPnBlcmlvZCk7CmlmIChzdGF0ZS0+cGVyaW9kIDwg
ZGRhdGEtPmFwcHJveF9wZXJpb2QpCiAgICAuLi4KCnRoYW5rcyBhIGxvdC4KCgoKCgoKPiBCZXN0
IHJlZ2FyZHMKPiBVd2UKPgo+IC0tCj4gUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgVXdlIEtsZWluZS1Lw7ZuaWcgICAgICAgICAgICB8Cj4gSW5kdXN0cmlhbCBM
aW51eCBTb2x1dGlvbnMgICAgICAgICAgICAgICAgIHwgaHR0cHM6Ly93d3cucGVuZ3V0cm9uaXgu
ZGUvIHwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
