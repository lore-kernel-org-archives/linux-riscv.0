Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1697C3DA6F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 22:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XiN0nSFvxM7FnfpVU44D1bcdaZclmWBsylw31ZEa8Jw=; b=msuSEG0gEepnZt
	O2WYcC3JR8HLZ9gTPBxn9+dw9V6hUw+jsS19TzUSj5240Q0ybkFuVAU3SUYDFu+nf6Y787yHTodVs
	eNyZZFfQB4t28tDJZ9xbcFIujZTrSC7fosdaW2NWWpiISc+ZrqwmCGnCUjuFrIEXpotur/G2ADe+8
	xwsDIqWGrHy3ytLCCW4AIb/ILdo/K7eETRLy3aSZawWAM+f1vFEbm4YHzVyUUFvdDgIbH8crVOQUs
	FT2bRmILRePsE/LzUR28lUDtzWERKZMtP9WmkH0vhyQ0A6wuaaU73OnGootEovfObxzxF2vtwmXAt
	chLhRZMoeaF7fP+2ljyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZIRV-003tr7-2M;
	Thu, 24 Aug 2023 22:04:41 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZIRT-003tps-0x
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 22:04:40 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bc63e0d8cdso3785331fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 15:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692914667; x=1693519467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfWfQ+lRO+WKeDH70mlU0lgd8cz1Kx8i7ys96tkzebQ=;
        b=S7NZJZ+VOsav0sm/ft26D6Am3LCuAyVsp1LgE/P0MvSw0PgpyVIrSlhTUdqCRQZx0Q
         6jGbYAmoXjd+l1k2UEpRUtp3wf0dnehG+voSHBpQHZQUIcNy2bzD7Lx3SYdMYSwbTUt1
         lDbxvrvN0Uvww5Dux82iOCG7s0ZDy419I/wItkmjUxslMl92oM0fiC3mqotaZJvpl9y0
         a2toHbjNxPddjYofXoUcCuTEeFmaESPtLfhtk5JcrD2C2BJXNQC94JrIqkT9GJ8Ad350
         Fvii1hj0VSe4wGhiLqCFpTX8MHow++qZu0S6zrPbeg5Y8oyN7YdI667ERQICARg6xgxP
         aiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692914667; x=1693519467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfWfQ+lRO+WKeDH70mlU0lgd8cz1Kx8i7ys96tkzebQ=;
        b=l0KssWVAqRDIpbu4TZrz/3xNuB7DZjhJLBOwKSrGyHKpEuXlL3njAe7XEE0quz6Y9W
         WeCxw9j7QCcniio3yt1MyYsbgPIDps/xGejU2Y6NNB8ni/cmaw2g2QgTguYMTauXJThr
         6Ng9UQ2pxj4d+GO4HtqxOPbMIJFi5mR6TKWz8k+FxHVXxBVS22dEcsLOSNHyEwX04lRk
         /KoJ4vZVQ19YDyaRnP6GCFCDAOUlwqsBVjNL/3hZJd2b/RRLXpUCO3ArefyGbec/zb2i
         EllL3s/XZUvcCa4G5HFNCrbdgE66r6gPf6Jvpeubwoqz9BVlZSJcmWmMTAOMKZpA3o9+
         Peig==
X-Gm-Message-State: AOJu0YxkHOOSwWRPuMtnclMaOQAt8XNwv9peA4em+4uqvMpR9h8nTCji
	BnWy3iz8CqGvLoXDRhj1POjoTm/m9VIY7+m4HGk=
X-Google-Smtp-Source: AGHT+IELeWgckaV4V/XWmfU+4z0tlYBZeZ4Q0PJTA5DJsAayONqHOr3jMuSh5u/qLWsZhrs02IZo919xV5Fr25tn+Jg=
X-Received: by 2002:a2e:9d10:0:b0:2bc:de8d:4ab1 with SMTP id
 t16-20020a2e9d10000000b002bcde8d4ab1mr4024122lji.6.1692914666983; Thu, 24 Aug
 2023 15:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230824133135.1176709-1-puranjay12@gmail.com>
 <20230824133135.1176709-2-puranjay12@gmail.com> <CAPhsuW5mMQbZ729W_5fhX0iYaNxG5JA1L7Sck-h0jQZQzEH8+Q@mail.gmail.com>
In-Reply-To: <CAPhsuW5mMQbZ729W_5fhX0iYaNxG5JA1L7Sck-h0jQZQzEH8+Q@mail.gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 25 Aug 2023 00:04:15 +0200
Message-ID: <CANk7y0i8YS70xbcXT7g0RmgR1Oi_Psk7gdNUdHzGCLvpddPd3g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/3] riscv: extend patch_text_nosync() for
 multiple pages
To: Song Liu <song@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	pulehui@huawei.com, conor.dooley@microchip.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, yhs@fb.com, 
	kpsingh@kernel.org, bjorn@kernel.org, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_150439_333756_CE1A13CE 
X-CRM114-Status: GOOD (  28.93  )
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

SGkgU29uZywKCk9uIFRodSwgQXVnIDI0LCAyMDIzIGF0IDExOjU34oCvUE0gU29uZyBMaXUgPHNv
bmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAyNCwgMjAyMyBhdCA2OjMx4oCv
QU0gUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBU
aGUgcGF0Y2hfaW5zbl93cml0ZSgpIGZ1bmN0aW9uIGN1cnJlbnRseSBkb2Vzbid0IHdvcmsgZm9y
IG11bHRpcGxlCj4gPiBwYWdlcyBvZiBpbnN0cnVjdGlvbnMsIHRoZXJlZm9yZSBwYXRjaF90ZXh0
X25vc3luYygpIHdpbGwgZmFpbCB3aXRoIGEKPiA+IHBhZ2UgZmF1bHQgaWYgY2FsbGVkIHdpdGgg
bGVuZ3RocyBzcGFubmluZyBtdWx0aXBsZSBwYWdlcy4KPiA+Cj4gPiBUaGlzIGNvbW1pdCBleHRl
bmRzIHRoZSBwYXRjaF9pbnNuX3dyaXRlKCkgZnVuY3Rpb24gdG8gc3VwcG9ydCBtdWx0aXBsZQo+
ID4gcGFnZXMgYnkgY29weWluZyBhdCBtYXggMiBwYWdlcyBhdCBhIHRpbWUgaW4gYSBsb29wLiBU
aGlzIGltcGxlbWVudGF0aW9uCj4gPiBpcyBzaW1pbGFyIHRvIHRleHRfcG9rZV9jb3B5KCkgZnVu
Y3Rpb24gb2YgeDg2Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFB1cmFuamF5IE1vaGFuIDxwdXJh
bmpheTEyQGdtYWlsLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jIHwgMzkg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDM0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCj4g
PiBpbmRleCA1NzVlNzFkNmM4YWUuLjQ2NWIyZWViYmMzNyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3BhdGNoLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMK
PiA+IEBAIC01MywxMiArNTMsMTggQEAgc3RhdGljIHZvaWQgcGF0Y2hfdW5tYXAoaW50IGZpeG1h
cCkKPiA+ICB9Cj4gPiAgTk9LUFJPQkVfU1lNQk9MKHBhdGNoX3VubWFwKTsKPiA+Cj4gPiAtc3Rh
dGljIGludCBwYXRjaF9pbnNuX3dyaXRlKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc24sIHNp
emVfdCBsZW4pCj4gPiArc3RhdGljIGludCBfX3BhdGNoX2luc25fd3JpdGUodm9pZCAqYWRkciwg
Y29uc3Qgdm9pZCAqaW5zbiwgc2l6ZV90IGxlbikKPiA+ICB7Cj4gPiAgICAgICAgIHZvaWQgKndh
ZGRyID0gYWRkcjsKPiA+ICAgICAgICAgYm9vbCBhY3Jvc3NfcGFnZXMgPSAoKCh1aW50cHRyX3Qp
IGFkZHIgJiB+UEFHRV9NQVNLKSArIGxlbikgPiBQQUdFX1NJWkU7Cj4gPiAgICAgICAgIGludCBy
ZXQ7Cj4gPgo+ID4gKyAgICAgICAvKgo+ID4gKyAgICAgICAgKiBPbmx5IHR3byBwYWdlcyBjYW4g
YmUgbWFwcGVkIGF0IGEgdGltZSBmb3Igd3JpdGluZy4KPiA+ICsgICAgICAgICovCj4gPiArICAg
ICAgIGlmIChsZW4gPiAyICogUEFHRV9TSVpFKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOwo+Cj4gVGhpcyBjaGVjayBjYW5ub3QgZ3VhcmFudGVlIF9fcGF0Y2hfaW5zbl93cml0
ZSB0b3VjaCBhdCBtb3N0IHR3byBwYWdlcy4KClllcywgSSBqdXN0IHJlYWxpc2VkIHRoaXMgY2Fu
IHNwYW4gMyBwYWdlcyBpZiBsZW4gPSAyICogUEFHRV9TSVpFIGFuZApvZmZzZXRfaW5fcGFnZShh
ZGRyKSA+IDAuCgo+IE1heWJlIHVzZQo+Cj4gICAgIGlmIChsZW4gKyBvZmZzZXRfaW5fcGFnZShh
ZGRyKSA+IDIgKiBQQUdFX1NJWkUpCj4gICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA/CgpXaWxs
IGZpeCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPgo+IFRoYW5rcywKPiBTb25nCj4KPiA+ICAg
ICAgICAgLyoKPiA+ICAgICAgICAgICogQmVmb3JlIHJlYWNoaW5nIGhlcmUsIGl0IHdhcyBleHBl
Y3RlZCB0byBsb2NrIHRoZSB0ZXh0X211dGV4Cj4gPiAgICAgICAgICAqIGFscmVhZHksIHNvIHdl
IGRvbid0IG5lZWQgdG8gZ2l2ZSBhbm90aGVyIGxvY2sgaGVyZSBhbmQgY291bGQKPiA+IEBAIC03
NCw3ICs4MCw3IEBAIHN0YXRpYyBpbnQgcGF0Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25z
dCB2b2lkICppbnNuLCBzaXplX3QgbGVuKQo+ID4gICAgICAgICAgICAgICAgIGxvY2tkZXBfYXNz
ZXJ0X2hlbGQoJnRleHRfbXV0ZXgpOwo+ID4KPiA+ICAgICAgICAgaWYgKGFjcm9zc19wYWdlcykK
PiA+IC0gICAgICAgICAgICAgICBwYXRjaF9tYXAoYWRkciArIGxlbiwgRklYX1RFWFRfUE9LRTEp
Owo+ID4gKyAgICAgICAgICAgICAgIHBhdGNoX21hcChhZGRyICsgUEFHRV9TSVpFLCBGSVhfVEVY
VF9QT0tFMSk7Cj4gPgo+ID4gICAgICAgICB3YWRkciA9IHBhdGNoX21hcChhZGRyLCBGSVhfVEVY
VF9QT0tFMCk7Cj4gPgo+ID4gQEAgLTg3LDE1ICs5MywzOCBAQCBzdGF0aWMgaW50IHBhdGNoX2lu
c25fd3JpdGUodm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbiwgc2l6ZV90IGxlbikKPiA+Cj4g
PiAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAgfQo+ID4gLU5PS1BST0JFX1NZTUJPTChwYXRjaF9p
bnNuX3dyaXRlKTsKPiA+ICtOT0tQUk9CRV9TWU1CT0woX19wYXRjaF9pbnNuX3dyaXRlKTsKPiA+
ICAjZWxzZQo+ID4gLXN0YXRpYyBpbnQgcGF0Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25z
dCB2b2lkICppbnNuLCBzaXplX3QgbGVuKQo+ID4gK3N0YXRpYyBpbnQgX19wYXRjaF9pbnNuX3dy
aXRlKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc24sIHNpemVfdCBsZW4pCj4gPiAgewo+ID4g
ICAgICAgICByZXR1cm4gY29weV90b19rZXJuZWxfbm9mYXVsdChhZGRyLCBpbnNuLCBsZW4pOwo+
ID4gIH0KPiA+IC1OT0tQUk9CRV9TWU1CT0wocGF0Y2hfaW5zbl93cml0ZSk7Cj4gPiArTk9LUFJP
QkVfU1lNQk9MKF9fcGF0Y2hfaW5zbl93cml0ZSk7Cj4gPiAgI2VuZGlmIC8qIENPTkZJR19NTVUg
Ki8KPiA+Cj4gPiArc3RhdGljIGludCBwYXRjaF9pbnNuX3dyaXRlKHZvaWQgKmFkZHIsIGNvbnN0
IHZvaWQgKmluc24sIHNpemVfdCBsZW4pCj4gPiArewo+ID4gKyAgICAgICBzaXplX3QgcGF0Y2hl
ZCA9IDA7Cj4gPiArICAgICAgIHNpemVfdCBzaXplOwo+ID4gKyAgICAgICBpbnQgcmV0ID0gMDsK
PiA+ICsKPiA+ICsgICAgICAgLyoKPiA+ICsgICAgICAgICogQ29weSB0aGUgaW5zdHJ1Y3Rpb25z
IHRvIHRoZSBkZXN0aW5hdGlvbiBhZGRyZXNzLCB0d28gcGFnZXMgYXQgYSB0aW1lCj4gPiArICAg
ICAgICAqIGJlY2F1c2UgX19wYXRjaF9pbnNuX3dyaXRlKCkgY2FuIG9ubHkgaGFuZGxlIGxlbiA8
PSAyICogUEFHRV9TSVpFLgo+ID4gKyAgICAgICAgKi8KPiA+ICsgICAgICAgd2hpbGUgKHBhdGNo
ZWQgPCBsZW4gJiYgIXJldCkgewo+ID4gKyAgICAgICAgICAgICAgIHNpemUgPSBtaW5fdChzaXpl
X3QsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0VfU0laRSAqIDIgLSBvZmZz
ZXRfaW5fcGFnZShhZGRyICsgcGF0Y2hlZCksCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGxlbiAtIHBhdGNoZWQpOwo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IF9fcGF0Y2hfaW5z
bl93cml0ZShhZGRyICsgcGF0Y2hlZCwgaW5zbiArIHBhdGNoZWQsIHNpemUpOwo+ID4gKwo+ID4g
KyAgICAgICAgICAgICAgIHBhdGNoZWQgKz0gc2l6ZTsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4g
KyAgICAgICByZXR1cm4gcmV0Owo+ID4gK30KPiA+ICtOT0tQUk9CRV9TWU1CT0wocGF0Y2hfaW5z
bl93cml0ZSk7Cj4gPiArCj4gPiAgaW50IHBhdGNoX3RleHRfbm9zeW5jKHZvaWQgKmFkZHIsIGNv
bnN0IHZvaWQgKmluc25zLCBzaXplX3QgbGVuKQo+ID4gIHsKPiA+ICAgICAgICAgdTMyICp0cCA9
IGFkZHI7Cj4gPiAtLQo+ID4gMi4zOS4yCj4gPgoKVGhhbmtzLApQdXJhbmpheQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
