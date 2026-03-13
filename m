Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AAB105F7B1
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 15:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omQyR76dCGU5sJOhWqsuirKZHfvoVwC6gGWumpz2fuE=; b=El161FmLJVu/uN
	FJcBLqUTXoa1qizKSTHc4UdolcHuOw00CWQCoa2jK1OAL8B8Aj/r+7UfTdngQaQ5Tjuo0kZc1NsVf
	7w7XSUrD3MpnsGf+7FGl4WrQhLOT92iFc7lqQbM+Mn8/0l0mjcVuw1eVAodVS3oso9z60L0c4mMfr
	ntWDgblg+g9rsgcq/nTAd3wZFxVX9F6ixJ4skj0jkEOG0uJZH3fITRzuLcQe5fhZRzt58SOnNVG9Y
	7NnCsEWzv0crFcD3vuXsJVCEA6Yw3tuDdisZ33sgB43voE2aZ7g+UHZ/FwBPK0gGgE8vOBxmlNK8T
	fCKoIZ9c+4GvF5fTKVhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w146T-00000000VAl-082g;
	Fri, 13 Mar 2026 15:07:05 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w146Q-00000000VAN-2UQj
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 15:07:03 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-64ae222d87dso2293493d50.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 08:07:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773414421; cv=none;
        d=google.com; s=arc-20240605;
        b=HyjnUvV0IMVs1e2dbDYq0nVx66NZekRZRMTPWM9SckTtjJBfeoxXJTObTqdlDBWcuO
         dijgbKZPWnJ0HZhn8G8rFnlYcOVIQiKtiQLFxYfeiHoDU5qcYPgRhhB+dBiOXQ5l1dMl
         mV3Wz+xIcn7vvj9ivrJ0sKLFCOo2Tb+7UNju9l6YhOnwBeqa39oyAYrBdlbQ3N1cW9Sp
         9rd/Xsgat19xtRJIlzj8rcJMc4brMZ/WLVe0Jjawd9cxjt65e0PVF8RGJHB/yKKVMqrw
         3DmuKqdHUyeJ1srC/yeLxClHsPmSxY2u9gZHQUOEhsu3ggBpeFb55UzkQzwzlSRds+3W
         HAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bwl3bu6QXSYK5p9OS9Lki1nNQiVBfsiIDBhWlq7lhck=;
        fh=uuOTUJl/u90v/35UZzxpVyTOMMFCbH8whji59XVnCqw=;
        b=fGEn7bjAUNDkjNJ4F2iHJ/V3odBWyGKCvSiRTxvjul+Vzy82C0uF7SzMoT5brrYEfd
         nGBsndChJpO6MTQGHNr8+m7F1ByGZQS7NcgKMGPKt2Jrqcw+H2PTUAER1qQegWziRvSm
         TzX8JUVZj9EzSYLVfSwmfIm8cmagLybLQ/6Lb0pSovnS0zb5AN5msGMUJXzPvWTIw4Y6
         Ojo5UNzzM4ado7Wk1PJsqfR2Xp+Pv9yOB4l3o3sCqUSjl7/6dcJmFa5pXcm1O11zkrWt
         nGmX6tqbKlINf7b9TK0w00clV0UP64jppC1bnc3LF0ngwhoEG++xoDQhU+VIq79Vao0A
         xD0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773414421; x=1774019221; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bwl3bu6QXSYK5p9OS9Lki1nNQiVBfsiIDBhWlq7lhck=;
        b=Gxp8HoilPtX7FzlmCCuzfU4f0QeHlKYQLIsB3z73HO4uEkccd6GuIM4uz5NVkFeQoP
         8vOIIQgsMuCgX0cDtp/FkDGQrBBSP5iIPoSBCUtFgxWvl8j4JAFE3mUuYqeO7CJ0AHXI
         AjiWWgj95o9It8AzgRCcMwA9ttrthXirmOa8JjHrIlTJqwRQ+U+WNdktuZShiHWhc9Go
         /4/zUMSHGeCNxDTO+e39rHxlwuIkG+aLT5qJdQEeq9MQ+6FImuoJ2zmtSaUitYLWrPUR
         CySypPm21osd/nfzHxvAwejc4I5wfDcT8LJVx0Is9YzApSh1FZ21KHxTGpjmEEmfLkxu
         OemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773414421; x=1774019221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bwl3bu6QXSYK5p9OS9Lki1nNQiVBfsiIDBhWlq7lhck=;
        b=cI+jkSwMRDbAD5WCrnGfo7gGc5NEW2dkfZcukfJ9rqkbHt5WgaCDwV0jNjDSrE2bLg
         ogMmYpcTau8PLqE6dVr4Uz/c4NsgS/xboUW+e0Kxlw/sKpSl1MJR2rzZU4hdx9DbySYp
         IgQLjg8um0bzwmMjbPXkEEeNaihTdpRr+bMJd4Oc6BTI3fPgZJJ3f7ygpRPbulj28UCf
         sn7b7IzM9mz+lkc/Cu9Zc2hV2wBhIOedAgjVsvAEzG98obbYqUSfVd79tFJ/p8zkuj88
         /0z1CYnLBWF+ce3B50N+lw9l/Tfr99q/D4XxIQCxNo3CH0vU+ocMba3HprMjBOu8MaAa
         3YSg==
X-Forwarded-Encrypted: i=1; AJvYcCWKHaZptFUNAowT3RodLRNJ4AFyA4mHQ91jdGtay/tGeIxvkBg5Z9v8yznkAt/XjakcxoFvUIn/1k+mIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLvQR8p8LqzlokQCltlFcZZCXNaS0xEQXGuuNSReS5gPl7IozR
	w/zPIkVHJuYb23JsadzA8IBR4iC4zO/ViHBIFUzL9Hjv1BryMaPJuwHlDNAdWMQjioyRxUYZdAo
	DJw6XQdTer6iWQWNHFAyCl1t61A+0sk8=
X-Gm-Gg: ATEYQzx2VSAHXyR9l+Y/jl7s1SOhCB7VHqSB/+bWfuf8NOYExaccDwDWpEOZRgylCVk
	5xeLmFhZrjmmF57voYar71Qd3TML6bF+2NX1/si8rT+Jft1wGdJWLRGWsvXa83DuQELSNRch9ZG
	5RfQcsfMc8N+uS7ISBpyRmWDFoul0JgszBHDpXViM3Y/Hi1J8RD/Q8KhM72pPhwXbQZQ3GCtp0z
	01XpPTft4IbEzf0UR4k6AfnvfMkXvIxzP8HDGY0OuOJ0zNw6hvF4eXRTrExf429VZ808p+vItp/
	z+tLUj/Gx/mBOpkiwQ==
X-Received: by 2002:a05:690c:4a08:b0:798:7322:b676 with SMTP id
 00721157ae682-79a1c0cf4d8mr40164837b3.20.1773414421451; Fri, 13 Mar 2026
 08:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-6-5bb2b574df5d@gmail.com>
 <8e91c86d-ea41-4535-a7cd-5b602c546cb7@baylibre.com> <20260313001940-GKA407679@kernel.org>
 <CABdCQ=Mv-3X8KE1WOWKVTmq+POgJczsL-qFdAyp5qzM6=0s28A@mail.gmail.com> <20260313111108-GKM302167@kernel.org>
In-Reply-To: <20260313111108-GKM302167@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 13 Mar 2026 16:06:49 +0100
X-Gm-Features: AaiRm52ZDS_Bl9kTuuFRUA2s_aJbBWslNAWTIUfq3zQrzhaCgdDVn7wblDGcbW8
Message-ID: <CABdCQ=O9PEXWrPnofK56tGc_KT64PF3QtFGNr-r2Kx_-3Zzi0A@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC
 and power infrastructure
To: Yixun Lan <dlan@kernel.org>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_080702_644775_C5EBFAAB 
X-CRM114-Status: GOOD (  23.71  )
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

RWwgdmllLCAxMyBtYXIgMjAyNiBhIGxhcyAxMjoxMSwgWWl4dW4gTGFuICg8ZGxhbkBrZXJuZWwu
b3JnPikgZXNjcmliacOzOgo+Cj4gSGkgSWtlciwKPgo+IE9uIDEwOjQyIEZyaSAxMyBNYXIgICAg
ICwgSWtlciBQZWRyb3NhIHdyb3RlOgo+ID4gRWwgdmllLCAxMyBtYXIgMjAyNiBhIGxhcyAxOjE5
LCBZaXh1biBMYW4gKDxkbGFuQGtlcm5lbC5vcmc+KSBlc2NyaWJpw7M6Cj4gPiA+Cj4gPiA+IEhp
IFRyZXZvciwgSWtlciwKPiA+ID4KPiA+ID4gT24gMTQ6MjcgV2VkIDExIE1hciAgICAgLCBUcmV2
b3IgR2FtYmxpbiB3cm90ZToKPiA+ID4gPiBIaSwKPiA+ID4gPgo+ID4gPiA+IE9uIDIwMjYtMDMt
MDkgMDc6NDAsIElrZXIgUGVkcm9zYSB3cm90ZToKPiA+ID4gPiA+IEFkZCBTcGFjZW1pdCBQMSBQ
TUlDIGNvbmZpZ3VyYXRpb24gYW5kIGJvYXJkIHBvd2VyIGluZnJhc3RydWN0dXJlIGZvcgo+ID4g
PiA+ID4gdm9sdGFnZSByZWd1bGF0aW9uIHN1cHBvcnQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gLSBB
ZGQgYm9hcmQgcG93ZXIgcmVndWxhdG9ycyAoMTJWIGlucHV0LCA0ViByYWlsKQo+ID4gPiA+ID4g
LSBFbmFibGUgSTJDOCBmb3IgUE1JQyBjb21tdW5pY2F0aW9uCj4gPiA+ID4gPiAtIENvbmZpZ3Vy
ZSBQTUlDIHdpdGggYnVjazQgKHZtbWMpIGFuZCBhbGRvMSAodnFtbWMpIHJlZ3VsYXRvcnMKPiA+
ID4gPiA+IC0gU2V0IHVwIHJlZ3VsYXRvciBjb25zdHJhaW50cyBmb3IgU0QgY2FyZCBvcGVyYXRp
b24KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJa2VyIFBlZHJvc2EgPGlrZXJw
ZWRyb3NhbUBnbWFpbC5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICAgYXJjaC9yaXNjdi9i
b290L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzIHwgNDggKysrKysrKysrKysrKysr
KysrKysrKysrCj4gPiA+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspCj4g
PiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2Vt
aXQvazEtb3JhbmdlcGktcnYyLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEt
b3JhbmdlcGktcnYyLmR0cwo+ID4gPiA+ID4gaW5kZXggN2I3MzMxY2IzYzcyNmYxMWQ1OTdmODE5
MTdmM2EzZjVmYzIxZTFiOS4uNDE0YjAzZjVlNjQ4MGYwNWY1ZDdlZWFhYTBhZmI0ZTg2NDI1YWUz
NiAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEt
b3JhbmdlcGktcnYyLmR0cwo+ID4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFj
ZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzCj4gPiA+ID4gPiBAQCAtMTksNiArMTksMjUgQEAgYWxp
YXNlcyB7Cj4gPiA+ID4gPiAgICAgICAgICAgICBldGhlcm5ldDEgPSAmZXRoMTsKPiA+ID4gPiA+
ICAgICB9Owo+ID4gPiA+ID4KPiA+ID4gPiA+ICsgICByZWdfZGNfaW46IGRjLWluLTEydiB7Cj4g
PiA+ID4gPiArICAgICAgICAgICBjb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7Cj4gPiA+
ID4gPiArICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJkY19pbl8xMnYiOwo+ID4gPiA+ID4g
KyAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTIwMDAwMDA+Owo+ID4gPiA+
ID4gKyAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTIwMDAwMDA+Owo+ID4g
PiA+ID4gKyAgICAgICAgICAgcmVndWxhdG9yLWJvb3Qtb247Cj4gPiA+ID4gPiArICAgICAgICAg
ICByZWd1bGF0b3ItYWx3YXlzLW9uOwo+ID4gPiA+ID4gKyAgIH07Cj4gPiA+ID4gPiArCj4gPiA+
ID4gSXMgdGhpcyB0aGUgY29ycmVjdCB2b2x0YWdlPyBJIGRvbid0IHNlZSBhIDEyViByYWlsIGlu
IHRoZSBSVjIncwo+ID4gPiA+IGRhdGFzaGVldCwgYW5kIHRoZSBib2FyZCdzIHNwZWNpZmljYXRp
b25zIG9ubHkgaW5kaWNhdGUgYSA1ViBVU0ItQyBpbnB1dC4KPiA+ID4KPiA+ID4gUmlnaHQsIHRo
aXMgc2hvdWxkIGJlIGZpeGVkLiBQbGVhc2Ugbm90ZSBIYW4gc3VibWl0dGVkIG9uZSB2ZXJzaW9u
IG9mIGJhc2ljIERUIGZvciBydjIKPiA+ID4gd2hpY2ggSSB0aGluayB0aGF0IHNlcmllcyB3aWxs
IGdvIGluIGZpcnN0Cj4gPiA+Cj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjAz
MTAxNjE4NTMuMzkwMDYwNS0xLWdhb2hhbkBpc2Nhcy5hYy5jbgo+ID4gPgo+ID4KPiA+IEknbSBm
aW5lIHdpdGggdGhhdC4gRG8gd2UgaGF2ZSBhbiBlc3RpbWF0ZSBvZiB3aGVuIHRoZXNlIGNoYW5n
ZXMgd2lsbAo+ID4gbGFuZD8gSSdtIGZpbmUgd2l0aCByZWJhc2luZyBvbmNlIHRob3NlIGFyZSBt
ZXJnZWQsIGJ1dCBJJ2QgbGlrZSB0bwo+ID4gY29udGludWUgd2l0aCB0aGUgcmV2aWV3IGZvciB0
aGUgcmVtYWluaW5nIGNoYW5nZXMgaW4gdGhpcyBwYXRjaAo+ID4gc2VyaWVzIGFuZCBJJ20gdW5z
dXJlIG9uIGhvdyB0byBwcm9jZWVkLgo+ID4KPiBGb3IgdGhhdCBjaGFuZ2VzLCBsaWtlbHkgd2ls
bCB0YXJnZXQgdjcuMSBtZXJnZSB3aW5kb3cKPgo+IFlvdSBjYW4gY29udGludWUgd2l0aCBjdXJy
ZW50IHZlcnNpb24sIG9uY2UgdGhhdCBoYXBwZW4sIHlvdSBjYW4gcmViYXNlIC4uCgpPaywgdGhh
dCBzb3VuZHMgZ29vZCB0byBtZQoKPgo+IC0tCj4gWWl4dW4gTGFuIChkbGFuKQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
