Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AA9C04FFE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 16:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aib+aOfyQOkNFc2+MZroguEKF1Sg/EJHlZ+3ayvvcTM=; b=HhMnL8cmMaCCC8
	GINpHHLBnwtOI6GMswR8cXuvB8xz5/ffNSU7TmdMjTl3ylRt8MmaTeJxySXxraw/y8gzuzztKLR1p
	esRhKIWNc5GOO+1erl/ZRghZUV1JptRGqn9mH3QU8LC8EYcAmJAu2/R/Dw7+iLHsgMIy4TkT/vaZ5
	wwk0dFFRvUOWVDSYop6qaBFPsriCuqkjB5KuM5FwO23Dk8JBm3W/kTOBhF23t/aDfy9jJLPwOuZYo
	+RrUAPZQo0bF9BE/La9KMmPt1ZGlCzp/aEQ8ovarc+50bzaFt/WJkrTetdn5j6SpzAgB80LUyAeqe
	m550l8uQAKmyteEb2Apg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Tm5-00000003ZE7-3vp3;
	Mon, 29 Apr 2024 16:22:41 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Tm3-00000003ZDA-01GO
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 16:22:40 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5ad2da2196aso3162952eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 09:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1714407756; x=1715012556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFh9S8iYJPFidlD2u3WsMVkPvkc/JSLTc7zLKFIpkEo=;
        b=E8B+2NASSOfrRP5sCM+SQN93DHFHmmm31IZ5XRIbhNl11+vLy44dL+vTwv6NRjsOOW
         4fyXawPncSaSEU0cHeodSlPTGkM4wo+0Bp1DTajnqFu7LjDNywChOXl1YJPlLbqGwsj/
         kp27V2+8M+Tg4yCoolkosfJP/bYFpg6jfuZS7v3KDkLYlRiEAk0bnwtKV76TJlI82HDZ
         0jrcDSwi9VbbUelr16cYRNqTQ+X6j2ayRiW+MFQOgPypxt7p+U4A2cMI70FaoJtNyJKE
         DsEg5B3DWLQmycwmWSqC0/LzMbKo1FSfp1gZINNcwYp9UqePet73/etTv6hAAmWNJMar
         dg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714407756; x=1715012556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFh9S8iYJPFidlD2u3WsMVkPvkc/JSLTc7zLKFIpkEo=;
        b=nAk1Wj+pBJWn446Dw+R3G2SdrThuqFVa7tid3tKJUK/tUJuemA8O7fYl6CSA4TnIbI
         deHra12q3+qA/9IuqxyJYRCqndVAGjvwySJ3mU1kDsgaNtMoIiQHeJZbswAWxQkPGk0C
         2ZDu0qy4Ym0+ZvE+zDoeMJ55xEu7txZ36D6Biv8BpH5rBfJm8Ik2NyaPFqlCJpUAchBT
         scyNiMWhQvShjirwcHoJfaJuCCSMmI0w0JFfwzpXQzIWzuqDkSJLoWTxRlddmSEZohXP
         cHrT5eRpbF4UXzyDI3Bg/r8mKOjEwPyOve4TgAXce1Yxpv4iI2t2RcbBFPsekXbsBtjV
         B2ww==
X-Forwarded-Encrypted: i=1; AJvYcCXKqNKpzrrGVTbgkxKBnKm02EB3SqVwYbr+fxfkUDwVIjpLbQ9OrcUahFyDXloZDozUMHsdMV/426q+eLFmH253ciISY/uIWSMooGt4jup0
X-Gm-Message-State: AOJu0YxJWAAfyIQUWags8Xnr+D4B6Iqu6VZofoR86jAVoHg5uUxpZGce
	9OCr8SzDFs2Q/vgZvtFmvJcKIQHfI2ftqL85iDOr9JUNeB7dPq5qXg39+GQDqGAbcsqrssWzemB
	T7CGM8ap6X+oMTq/sTBr2fbCQ2du1M325AI5FDQ==
X-Google-Smtp-Source: AGHT+IFKgLGHx+BKJCv5SD2jm/e2+vh+LMFxfwH0dJjRXsjjJLUlmmNC4x7PzAmlyxFpMw53xJhAl3d5oxwc0MIYzj4=
X-Received: by 2002:a4a:44c6:0:b0:5ac:9f86:cc0d with SMTP id
 o189-20020a4a44c6000000b005ac9f86cc0dmr12775696ooa.6.1714407756077; Mon, 29
 Apr 2024 09:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240226065113.1690534-1-nick.hu@sifive.com> <CAPDyKFph3WsZMmALnzBQKE4S_80Ji5h386Wi0vHda37QUsjMtg@mail.gmail.com>
In-Reply-To: <CAPDyKFph3WsZMmALnzBQKE4S_80Ji5h386Wi0vHda37QUsjMtg@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 30 Apr 2024 00:22:25 +0800
Message-ID: <CAKddAkDcdaXKzpcKN=LCCx9S4Trv+joLX2s=nyhzaRtM5HorqA@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Add cluster_pm_enter()/exit()
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: palmer@dabbelt.com, anup@brainfault.org, rafael@kernel.org, 
	daniel.lezcano@linaro.org, paul.walmsley@sifive.com, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_092239_328226_958B79E0 
X-CRM114-Status: GOOD (  23.24  )
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

SGkgVWxmCgpPbiBNb24sIEFwciAyOSwgMjAyNCBhdCAxMDozMuKAr1BNIFVsZiBIYW5zc29uIDx1
bGYuaGFuc3NvbkBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgMjYgRmViIDIwMjQgYXQg
MDc6NTEsIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gV2hlbiB0
aGUgY3B1cyBpbiB0aGUgc2FtZSBjbHVzdGVyIGFyZSBhbGwgaW4gdGhlIGlkbGUgc3RhdGUsIHRo
ZSBrZXJuZWwKPiA+IG1pZ2h0IHB1dCB0aGUgY2x1c3RlciBpbnRvIGEgZGVlcGVyIGxvdyBwb3dl
ciBzdGF0ZS4gQ2FsbCB0aGUKPiA+IGNsdXN0ZXJfcG1fZW50ZXIoKSBiZWZvcmUgZW50ZXJpbmcg
dGhlIGxvdyBwb3dlciBzdGF0ZSBhbmQgY2FsbCB0aGUKPiA+IGNsdXN0ZXJfcG1fZXhpdCgpIGFm
dGVyIHRoZSBjbHVzdGVyIHdva2VuIHVwLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE5pY2sgSHUg
PG5pY2suaHVAc2lmaXZlLmNvbT4KPgo+IEkgd2FzIG5vdCBjY2VkIHRoaXMgcGF0Y2gsIGJ1dCBu
b3RpY2VkIHRoYXQgdGhpcyBwYXRjaCBnb3QgcXVldWVkIHVwCj4gcmVjZW50bHkuIFNvcnJ5IGZv
ciBub3Qgbm90aWNpbmcgZWFybGllci4KPgo+IElmIG5vdCB0b28gbGF0ZSwgY2FuIHlvdSBwbGVh
c2UgZHJvcC9yZXZlcnQgaXQ/IFdlIHNob3VsZCByZWFsbHkgbW92ZQo+IGF3YXkgZnJvbSB0aGUg
Q1BVIGNsdXN0ZXIgbm90aWZpZXJzLiBTZWUgbW9yZSBpbmZvcm1hdGlvbiBiZWxvdy4KPgo+ID4g
LS0tCj4gPiAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMgfCAyNCArKysrKysr
KysrKysrKysrKysrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVpZGxlL2NwdWlk
bGUtcmlzY3Ytc2JpLmMgYi9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYwo+ID4g
aW5kZXggZTgwOTRmYzkyNDkxLi4yOThkYzc2YTAwY2YgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYwo+ID4gKysrIGIvZHJpdmVycy9jcHVpZGxlL2Nw
dWlkbGUtcmlzY3Ytc2JpLmMKPiA+IEBAIC0zOTQsNiArMzk0LDcgQEAgc3RhdGljIGludCBzYmlf
Y3B1aWRsZV9wZF9wb3dlcl9vZmYoc3RydWN0IGdlbmVyaWNfcG1fZG9tYWluICpwZCkKPiA+ICB7
Cj4gPiAgICAgICAgIHN0cnVjdCBnZW5wZF9wb3dlcl9zdGF0ZSAqc3RhdGUgPSAmcGQtPnN0YXRl
c1twZC0+c3RhdGVfaWR4XTsKPiA+ICAgICAgICAgdTMyICpwZF9zdGF0ZTsKPiA+ICsgICAgICAg
aW50IHJldDsKPiA+Cj4gPiAgICAgICAgIGlmICghc3RhdGUtPmRhdGEpCj4gPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gPiBAQCAtNDAxLDYgKzQwMiwxMCBAQCBzdGF0aWMgaW50IHNiaV9j
cHVpZGxlX3BkX3Bvd2VyX29mZihzdHJ1Y3QgZ2VuZXJpY19wbV9kb21haW4gKnBkKQo+ID4gICAg
ICAgICBpZiAoIXNiaV9jcHVpZGxlX3BkX2FsbG93X2RvbWFpbl9zdGF0ZSkKPiA+ICAgICAgICAg
ICAgICAgICByZXR1cm4gLUVCVVNZOwo+ID4KPiA+ICsgICAgICAgcmV0ID0gY3B1X2NsdXN0ZXJf
cG1fZW50ZXIoKTsKPiA+ICsgICAgICAgaWYgKHJldCkKPiA+ICsgICAgICAgICAgICAgICByZXR1
cm4gcmV0Owo+Cj4gUmF0aGVyIHRoYW4gdXNpbmcgdGhlIENQVSBjbHVzdGVyIG5vdGlmaWVycywg
Y29uc3VtZXJzIG9mIHRoZSBnZW5wZAo+IGNhbiByZWdpc3RlciB0aGVtc2VsdmVzIHRvIHJlY2Vp
dmUgZ2VucGQgb24vb2ZmIG5vdGlmaWVycy4KPgo+IEluIG90aGVyIHdvcmRzLCBub25lIG9mIHRo
aXMgc2hvdWxkIGJlIG5lZWRlZCwgcmlnaHQ/Cj4KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2shCk1h
eWJlIEkgbWlzcyBzb21ldGhpbmcsIEknbSB3b25kZXJpbmcgYWJvdXQgYSBjYXNlIGxpa2UgYmVs
b3c6CklmIHdlIGhhdmUgYSBzaGFyZWQgTDIgY2FjaGUgY29udHJvbGxlciBpbnNpZGUgdGhlIGNw
dSBjbHVzdGVyIHBvd2VyCmRvbWFpbiBhbmQgd2UgYWRkIHRoaXMgY29udHJvbGxlciB0byBiZSBh
IGNvbnN1bWVyIG9mIHRoZSBwb3dlcgpkb21haW4sIFNob3VsZG4ndCB0aGUgZ2VucGQgaW52b2tl
IHRoZSBkb21haW4gaWRsZSBvbmx5IGFmdGVyIHRoZQpzaGFyZWQgTDIgY2FjaGUgY29udHJvbGxl
ciBpcyBzdXNwZW5kZWQ/CklzIHRoZXJlIGEgd2F5IHRoYXQgd2UgY2FuIHB1dCB0aGUgTDIgY2Fj
aGUgZG93biB3aGlsZSBhbGwgY3B1cyBpbiB0aGUKc2FtZSBjbHVzdGVyIGFyZSBpZGxlPwo+IFsu
Li5dCj4KPiBLaW5kIHJlZ2FyZHMKPiBVZmZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
