Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5E9C6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 11:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ScjviM6fpeF+plBhEc5up5QLi2244HytTU6TyPuhzv0=; b=EdCcr6kayAPEul
	RK2Re8aoRJxIZoQsC7FJHkNq9OXRaVQiBVkDXYjuLGhgnAnAwRN56471WiGM7VcCRZXqiIfGOdf0d
	bmvvhtLQDZES0+2DG+czsKH2asi0/UQ7MJr/AQm8/28GPlsUQjmc18o8RnOP+eWoWN4wPjoC3eMHm
	aA8p/MwjBmoIkP/NuyVuf12+eJ2nAv1IiTtQIEBE9cd3w/AdsZZmZ8CWPuLCkdG6gix9ucNBcf85N
	kBzF4gXt878Y2eKhB8c5hj4qHm2STwnupsbSzW7qzEbndX/F/xuXRkERob+b0PUjSBtvMGbwI2sXd
	6fgMYvvmpcOFkpfxPycg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXhNn-001zCz-I4; Thu, 02 Mar 2023 11:45:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXhNl-001zBa-Kh
	for linux-riscv@bombadil.infradead.org; Thu, 02 Mar 2023 11:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=szoAPIE9RLg8SyW+42dEQKwq5qglsGdZPucFgQhY0/A=; b=GPbWxm79VmW4IAXH4uWMZ443vN
	zpa+/QsTFsQtxUyuILQKOCC50E5RvcYRKZatiRGfuUm0Q4fKDtY81nEBw1xavuKC5laQtd16eCcAB
	EXvxIh/tiQibIfAe2GW/9maBYSpOLpmJgqkcJDgQb/1gmRNkBtMfbezZ70Ben4CXsWnYbJXeQ/qbE
	/BI4KwK0Xw9S49pmQQauJiNBIdY9sYrPcr3V3RrMwiqAlPcfm5ZVo06guNPcsa9PxzhEfrJYDCntU
	nLm0F/d0xs9Cqv1KvHBhD/YdbafwxHgLnE08UyE28ijDJKc9CdaKoAk3sv+QFdW2zWw1SWh0Tu1tm
	B0Y4dNMQ==;
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pXgNh-00FFef-2g
	for linux-riscv@lists.infradead.org;
	Thu, 02 Mar 2023 10:41:52 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-536bf92b55cso418799627b3.12
        for <linux-riscv@lists.infradead.org>; Thu, 02 Mar 2023 02:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1677753706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szoAPIE9RLg8SyW+42dEQKwq5qglsGdZPucFgQhY0/A=;
        b=gtHXWnWEP7JrkAkqs7UngZsUtO12av+z17lis0xLuEyWguFdxpE7zD4/gRcrSbv4L3
         yjXXUO9hTUiTmKdAdBlW0gKaBZKKXpX4D9ZpvYvbtZuEJ7p0KaPbfHYaamVpoYgwElQs
         HiqxuJAHg9Hhc0tp2XQshv04T+2GF8hoXUpGLum0j8N3yDDrfRf3KhXR3OlcvRbEKl5G
         JU/ka4ea4V8Z0gWbvWteKXgwnZH9Iq2i9aQVK98iAIsZ2Kym5S5PqyxR7WjcaTMFvKVa
         rc9MVd2v3QVxwnblV2KkIKSNA4SfX8GrWkfeUsplhvLEOWxdYvLAlxJEF4GS9hV5uter
         pSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677753706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szoAPIE9RLg8SyW+42dEQKwq5qglsGdZPucFgQhY0/A=;
        b=aJqlLmhuErkR0sOLb2hV51lg1jFA+4Y+APlHyE7SB63sklN22Qusbc8oAOpWIzV4hW
         twzfHpQW42rn8DqRqyJjJwwqkyX+HPXDON4y+TggsOqrF7wZ7vU+ZrH2QTOmlTAYekgT
         jRO8fMsqafoGjfLYr6M21eWVUU3KPPw69hlJCT/ir/Q4Mhtp6RmR/mqhYEogugKnSyH8
         IxIcgzUjM1GkZG8fUKVTiNWJYxSa+J2yYEmIPCYiZnr8er2CYfLf9U0hYnw4Lm+0or73
         wDpOkc9n8zTAAXVVh9KMhXewaZDKmpEfmHLInjn34JOd9zalnjA1z9sCFJo1mmpfjyk0
         Ui7Q==
X-Gm-Message-State: AO0yUKUPrmLKTMkGruLZYhFwpyDhSRs6D0dJPXJuhTIYA4O2GR80pIUl
	yBmjznLYP7pRsTseL+AjiAV2X6cOy3uJUM59xgbSXQ==
X-Google-Smtp-Source: AK7set87M/AbgxYhMgy1BNJoD32ttiD+1yNN3ghOZW22JFluXJamrHcQOmG2Ay4OU54yPfNiSO4wP3Fp8RerwNWIWtQ=
X-Received: by 2002:a81:441b:0:b0:52e:d2a7:1ba1 with SMTP id
 r27-20020a81441b000000b0052ed2a71ba1mr5998495ywa.1.1677753706026; Thu, 02 Mar
 2023 02:41:46 -0800 (PST)
MIME-Version: 1.0
References: <20230130093229.27489-1-nylon.chen@sifive.com> <20230130093229.27489-3-nylon.chen@sifive.com>
 <20230130101707.pdvabl3na2wpwxqu@pengutronix.de> <CAHh=Yk_hFOjwY1mbmYk8yqH_AKDs1_3J+5pYQStseNsZukPSoA@mail.gmail.com>
 <20230301092050.gwwbfsltyuow7pq6@pengutronix.de>
In-Reply-To: <20230301092050.gwwbfsltyuow7pq6@pengutronix.de>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Thu, 2 Mar 2023 18:41:31 +0800
Message-ID: <CAHh=Yk-Yt4q78tpThGR=HTz-Rgjp0LsU1H=eULgo3pg8scS=XA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230302_104150_042664_10FA5EF2 
X-CRM114-Status: GOOD (  32.70  )
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

SGkgVXdlCgpUaGFua3MgZm9yIHlvdXIgcmVwbHkuCgpVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiDmlrwgMjAyM+W5tDPmnIgx5pelIOmAseS4iSDkuIvl
jYg1OjIx5a+r6YGT77yaCj4KPiBIZWxsbyBOeWxvbiwKPgo+IE9uIFdlZCwgRmViIDAxLCAyMDIz
IGF0IDA0OjU2OjQyUE0gKzA4MDAsIE55bG9uIENoZW4gd3JvdGU6Cj4gPiBVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiDmlrwgMjAyM+W5tDHmnIgzMOaX
pSDpgLHkuIAg5LiL5Y2INjoxN+Wvq+mBk++8mgo+ID4gPiBPbiBNb24sIEphbiAzMCwgMjAyMyBh
dCAwNTozMjoyOVBNICswODAwLCBOeWxvbiBDaGVuIHdyb3RlOgo+ID4gPiA+IFRoZSBgZnJhY2Ag
dmFyaWFibGUgcmVwcmVzZW50cyB0aGUgcHVsc2UgaW5hY3RpdmUgdGltZSwgYW5kIHRoZSByZXN1
bHQgb2YKPiA+ID4gPiB0aGlzIGFsZ29yaXRobSBpcyB0aGUgcHVsc2UgYWN0aXZlIHRpbWUuIFRo
ZXJlZm9yZSwgd2UgbXVzdCByZXZlcnNlIHRoZQo+ID4gPiA+IHJlc3VsdC4KPiA+ID4gPgo+ID4g
PiA+IFRoZSByZWZlcmVuY2UgaXMgU2lGaXZlIEZVNzQwLUMwMDAgTWFudWFsWzBdLgo+ID4gPiA+
Cj4gPiA+ID4gWzBdOiBodHRwczovL3NpZml2ZS5jZG4ucHJpc21pYy5pby9zaWZpdmUvMWE4MmU2
MDAtMWY5My00ZjQxLWIyZDgtODZlZDhiMTZhY2JhX2Z1NzQwLWMwMDAtbWFudWFsLXYxcDYucGRm
Cj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNp
Zml2ZS5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyB8
IDEgKwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+ID4gPgo+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgYi9kcml2ZXJzL3B3bS9w
d20tc2lmaXZlLmMKPiA+ID4gPiBpbmRleCA2MmI2YWNjNjM3M2QuLmE1ZWRhMTY1ZDA3MSAxMDA2
NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPiA+ID4gPiArKysgYi9k
cml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPiA+ID4gPiBAQCAtMTU4LDYgKzE1OCw3IEBAIHN0YXRp
YyBpbnQgcHdtX3NpZml2ZV9hcHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21f
ZGV2aWNlICpwd20sCj4gPiA+ID4gICAgICAgZnJhYyA9IERJVjY0X1U2NF9ST1VORF9DTE9TRVNU
KG51bSwgc3RhdGUtPnBlcmlvZCk7Cj4gPiA+ID4gICAgICAgLyogVGhlIGhhcmR3YXJlIGNhbm5v
dCBnZW5lcmF0ZSBhIDEwMCUgZHV0eSBjeWNsZSAqLwo+ID4gPiA+ICAgICAgIGZyYWMgPSBtaW4o
ZnJhYywgKDFVIDw8IFBXTV9TSUZJVkVfQ01QV0lEVEgpIC0gMSk7Cj4gPiA+ID4gKyAgICAgZnJh
YyA9ICgxVSA8PCBQV01fU0lGSVZFX0NNUFdJRFRIKSAtIDEgLSBmcmFjOwo+ID4gPgo+ID4gPiBU
aGUgc2FtZSBwcm9ibGVtIGV4aXN0cyBpbiBwd21fc2lmaXZlX2dldF9zdGF0ZSgpLCBkb2Vzbid0
IGl0Pwo+ID4gPgo+ID4gPiBBcyBmaXhpbmcgdGhpcyBpcyBhbiBpbnRlcnJ1cHRpdmUgY2hhbmdl
IGFueWhvdywgdGhpcyBpcyB0aGUgb3Bwb3J0dW5pdHkKPiA+ID4gdG8gYWxpZ24gdGhlIGRyaXZl
ciB0byB0aGUgcnVsZXMgdGVzdGVkIGJ5IFBXTV9ERUJVRy4KPiA+ID4KPiA+ID4gVGhlIHByb2Js
ZW1zIEkgc2VlIGluIHRoZSBkcml2ZXIgKG9ubHkgY2hlY2tlZCBxdWlja2x5LCBzbyBJIG1pZ2h0
IGJlCj4gPiA+IHdyb25nKToKPiA+ID4KPiA+ID4gIC0gc3RhdGUtPnBlcmlvZCAhPSBkZGF0YS0+
YXBwcm94X3BlcmlvZCBpc24ndCBuZWNlc3NhcmlseSBhIHByb2JsZW0uIElmCj4gPiA+ICAgIHN0
YXRlLT5wZXJpb2QgPiBkZGF0YS0+cmVhbF9wZXJpb2QgdGhhdCdzIGZpbmUgYW5kIHRoZSBkcml2
ZXIgc2hvdWxkCj4gPiA+ICAgIGNvbnRpbnVlCj4gPiA+Cj4gPiA+ICAtIGZyYWMgPSBESVY2NF9V
NjRfUk9VTkRfQ0xPU0VTVChudW0sIHN0YXRlLT5wZXJpb2QpOwo+ID4gPiAgICBpcyB3cm9uZyBm
b3IgdHdvIHJlYXNvbnM6Cj4gPiA+ICAgIGl0IHNob3VsZCByb3VuZCBkb3duIGFuZCB1c2UgdGhl
IHJlYWwgcGVyaW9kLgo+ID4gPgo+ID4gSSBuZWVkIGEgbGl0dGxlIHRpbWUgdG8gY2xhcmlmeSB5
b3VyIGFzc3VtcHRpb25zLiBJZiBwb3NzaWJsZSwgSSB3aWxsCj4gPiBtYWtlIHNpbWlsYXIgY2hh
bmdlcy4KPiA+Cj4gPiBlLmcuCj4gPiByb3VuZGRvd24obnVtLCBzdGF0ZS0+cGVyaW9kKTsKPiA+
IGlmIChzdGF0ZS0+cGVyaW9kIDwgZGRhdGEtPmFwcHJveF9wZXJpb2QpCj4gPiAgICAgLi4uCj4K
PiB0aGUgaWRlYSBpcyB0aGF0IGZvciBhIGdpdmVuIHJlcXVlc3QgYXBwbHkgc2hvdWxkIGRvIHRo
ZSBmb2xsb3dpbmcgdG8KPiBzZWxlY3QgdGhlIGhhcmR3YXJlIHNldHRpbmc6Cj4KPiAgLSBDaGVj
ayBwb2xhcml0eSwgaWYgdGhlIGhhcmR3YXJlIGRvZXNuJ3Qgc3VwcG9ydCBpdCwgcmV0dXJuIC1F
SU5WQUwuCj4gICAgKEEgcGVyaW9kIGFsd2F5cyBzdGFydHMgd2l0aCB0aGUgYWN0aXZlIHBoYXNl
IGZvciB0aGUgZHVyYXRpb24gb2YKPiAgICBkdXR5X2N5Y2xlLiBGb3Igbm9ybWFsIHBvbGFyaXR5
IGFjdGl2ZSA9IGhpZ2guKQo+ICAtIFBpY2sgdGhlIGJpZ2dlc3QgcGVyaW9kIGxlbmd0aCBwb3Nz
aWJsZSB0aGF0IGlzIG5vdCBiaWdnZXIgdGhhbiB0aGUKPiAgICByZXF1ZXN0ZWQgcGVyaW9kLgo+
ICAtIEZvciB0aGUgcGlja2VkIHBlcmlvZCwgc2VsZWN0IHRoZSBiaWdnZXN0IGR1dHlfY3ljbGUg
cG9zc2libGUgdGhhdCBpcwo+ICAgIG5vdCBiaWdnZXIgdGhhbiB0aGUgcmVxdWVzdGVkIGR1dHlf
Y3ljbGUuCj4KPiBUaGVuIGlmIHBvc3NpYmxlIHN3aXRjaCB0byB0aGUgc2VsZWN0ZWQgc2V0dGlu
ZyBpbiBhbiBhdG9taWMgc3RlcC4KPgo+IERvZXMgdGhpcyBjbGVhcmlmeSB5b3VyIGRvdWJ0cz8K
SSBuZWVkIGEgbGl0dGxlIHRpbWUgdG8gY2xhcmlmeSB5b3VyIGFzc3VtcHRpb25zLiBUaGFua3Mg
YWdhaW4uCj4KPiBCZXN0IHJlZ2FyZHMKPiBVd2UKPgo+IC0tCj4gUGVuZ3V0cm9uaXggZS5LLiAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgVXdlIEtsZWluZS1Lw7ZuaWcgICAgICAgICAgICB8
Cj4gSW5kdXN0cmlhbCBMaW51eCBTb2x1dGlvbnMgICAgICAgICAgICAgICAgIHwgaHR0cHM6Ly93
d3cucGVuZ3V0cm9uaXguZGUvIHwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
