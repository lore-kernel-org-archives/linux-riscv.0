Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3753DC54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 01:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LP8iN3Em8+k9wK1/FhyAw5ffQ2TXLV3EVQWMsD9Jkvw=; b=08p94ZJdjGGl7T
	sFQsnvVragGs7ncmmamH8MU7EuWD10aWBFvkNU77f9Lxj2qnK6vQQCxiiYQTuNZyL5NkczkC7h8x8
	8Jh7Dt7e1Za4EoKPLwtlz1u3521s/VqUgS5Kzv7OHbHMpolSKJYKMCJYJbmRtoDHdzj/jt/xMrXxE
	JJS/tHNiG+idGAxhKUVFPN8az1xnPK2puADQZke2ANxmUMJI+EqTwqY9f65mDEcRLLsO9Z4pxn/i7
	lKqedycHfXu+XeG3ZfhzSgcvM0WEisMaAds3rcJ8GAp8pGKNULHprzoXRWoTdyYYKuEkPYJ2s7rPB
	wLyDzWmAih96feQIVc7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkDiL-00000008T7S-1B9o;
	Wed, 13 Mar 2024 01:47:29 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkDiH-00000008T6U-0c7P
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 01:47:26 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso5719956276.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 18:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710294442; x=1710899242; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neheP9DerkPsxcw8dPCTPITWaO5C7p5MHh9oZcv7VT4=;
        b=G+PkUCdx1lv6PqEWCVJFUCbdR19HWBNIAqFIfwxOmUwDJ35Xu6wUQJfTw4FlIwfniy
         My4m3AGp73BkHnRHFU5fMgjZo2KF9Dg2Ch6vSYLlzYIQEqRk0CswLlGK7jXfl5sdcjGX
         ia7RYQfIgpKyfRsJHLwSXH6crNc1ifDDcoa9jG4HIn0Pahp8UStYgtHdbJufOCZ62iNh
         DmOvIW9NUMOXZ6HLIn/g4hXKacGhkbvvTr3TH8OSS88Xs01xfeQQ/WkByNGVC6j9xwbQ
         0cjCi9h5PgHv7D1K/LtvizTMxu1R2yFHphaA4v3fmf4AfK79tGhVdSDd1ZRyLxBdpx/e
         eKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710294442; x=1710899242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=neheP9DerkPsxcw8dPCTPITWaO5C7p5MHh9oZcv7VT4=;
        b=s3AGclSwAHPIC2tanjFnbHGjiNmIf8Sxt2500xtGIlMxXfiAsVuuNicR7FCO2WgpCk
         Ekjnjcx3i0dGX4rUMBdxsMkg0oprghtFmGPASLYfRLpKz1JtDCfwYxdYWufdjrQhqwcE
         Slp3Gf5FYry+lhhVrj6OTHoxnn+xJPzaglWnaCbbdgeFInlotgdx2HFXwJsr6LnJw+dE
         n1/y64Vec3G5HOIhS4P1pa0RPzoVouihQVuwNCzADeTZiAckebabet/24jpVneCa0Jw+
         qcjMFqc8XKoFmkVgRsUOFm28g+B/t4gUPnP2ZJ+laeVWCGpppGgEJ+mnENs1MP5kZ1By
         Hr4g==
X-Gm-Message-State: AOJu0YzwpzQjEuw9mAlRFLpyEcJbu/6ug2l8nNxeRY/Ahjn2CUNDiWpP
	KPNTcWz2E317IFKYMUjIk9f6GJKEKMTMnWJ5+t3dFNnl/S6s5nwhVbEk7Q60vgVeCs05LsL/KJ8
	JFynsHFVG/B7g23AhErhX+UvQp/Vte5yY1vAhdMOa5oREmI2xE1w=
X-Google-Smtp-Source: AGHT+IG6CSUIwBlNL6B3r7g3PswRZ/XZD/j2L2FrEJeieJXheZhyyfyHBlXR7bVSCijFzxraTFM0WQd9yQ7gdYePkec=
X-Received: by 2002:a25:9390:0:b0:dcd:97ad:74b3 with SMTP id
 a16-20020a259390000000b00dcd97ad74b3mr990161ybm.63.1710294442285; Tue, 12 Mar
 2024 18:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240312123627.9285-1-andy.chiu@sifive.com> <20240312123627.9285-6-andy.chiu@sifive.com>
 <1049078b-74f8-4461-a530-af1c4992dd9b@rivosinc.com>
In-Reply-To: <1049078b-74f8-4461-a530-af1c4992dd9b@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 13 Mar 2024 09:47:11 +0800
Message-ID: <CABgGipVhi3GGL354J03SJgvraCF_qnMLFK-fVbT12=Zg5BOdGg@mail.gmail.com>
Subject: Re: [v1, 5/6] riscv: hwprobe: add zve Vector subextesnions into
 hwprobe interface
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Evan Green <evan@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
	Andrew Jones <ajones@ventanamicro.com>, Costa Shulyupin <costa.shul@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_184725_218793_42B6A014 
X-CRM114-Status: GOOD (  24.79  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgODo0MuKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMTIvMDMvMjAyNCAxMzozNiwgQW5keSBD
aGl1IHdyb3RlOgo+ID4gVGhlIGZvbGxvd2luZyBWZWN0b3Igc3ViZXh0ZW5zaW9ucyBmb3IgImVt
YmVkZGVkIiBwbGF0Zm9ybXMgYXJlIGFkZGVkCj4gPiBpbnRvIFJJU0NWX0hXUFJPQkVfS0VZX0lN
QV9FWFRfMDoKPiA+ICAtIFpWRTMyWAo+ID4gIC0gWlZFMzJGCj4gPiAgLSBaVkU2NFgKPiA+ICAt
IFpWRTY0Rgo+ID4gIC0gWlZFNjRECj4gPgo+ID4gRXh0ZW5zaW9ucyBlbmQgd2l0aCBYIG1lYW4g
dGhlIHBsYXRmb3JtIGRvbid0IGhhdmUgYSBWZWN0b3IgRlBVLgo+ID4gRXh0ZW5zaW9ucyBlbmQg
d2l0aCBGL0QgbWVhbiB3aGV0aGVyIHNpbmdsZSAoRikgb3IgZG91YmxlIChEKSBwcmVjaXNpb24K
PiA+IFZlY3RvciBvcGVyYXRpb24gaXMgc3VwcG9ydGVkLgo+ID4KPiA+IFRoZSBudW1iZXIgMzIg
b3IgNjQgZm9sbG93cyBmcm9tIFpWRSB0ZWxscyB0aGUgbWF4aW11bSBlbGVtZW50IGxlbmd0aC4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+
ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDE1ICsr
KysrKysrKysrKysrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgg
fCAgNSArKysrKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgfCAg
NSArKysrKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVu
dGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiA+IGluZGV4IGIyYmNjOWVlZDlhYS4uZDBi
MDJlMDEyZTVkIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJv
YmUucnN0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiA+
IEBAIC0xODgsNiArMTg4LDIxIEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPiA+
ICAgICAgICAgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IDk1Y2YxZjkgKCJBZGQgY2hhbmdl
cyByZXF1ZXN0ZWQgYnkgVmVkCj4gPiAgICAgICAgIGR1cmluZyBzaWdub2ZmIikKPiA+Cj4gPiAr
ICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVkUzMlhgOiBUaGUgVmVjdG9yIHN1Yi1l
eHRlbnNpb24gWnZlMzJ4IGlzCj4gPiArICAgIHN1cHBvcnRlZCwgYXMgZGVmaW5lZCBieSB2ZXJz
aW9uIDEuMCBvZiB0aGUgUklTQy1WIFZlY3RvciBleHRlbnNpb24gbWFudWFsLgo+ID4gKwo+ID4g
KyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZFMzJGYDogVGhlIFZlY3RvciBzdWIt
ZXh0ZW5zaW9uIFp2ZTMyZiBpcwo+ID4gKyAgICBzdXBwb3J0ZWQsIGFzIGRlZmluZWQgYnkgdmVy
c2lvbiAxLjAgb2YgdGhlIFJJU0MtViBWZWN0b3IgZXh0ZW5zaW9uIG1hbnVhbC4KPiA+ICsKPiA+
ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWRTY0WGA6IFRoZSBWZWN0b3Igc3Vi
LWV4dGVuc2lvbiBadmU2NHggaXMKPiA+ICsgICAgc3VwcG9ydGVkLCBhcyBkZWZpbmVkIGJ5IHZl
cnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgVmVjdG9yIGV4dGVuc2lvbiBtYW51YWwuCj4gPiArCj4g
PiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVkU2NEZgOiBUaGUgVmVjdG9yIHN1
Yi1leHRlbnNpb24gWnZlNjRmIGlzCj4gPiArICAgIHN1cHBvcnRlZCwgYXMgZGVmaW5lZCBieSB2
ZXJzaW9uIDEuMCBvZiB0aGUgUklTQy1WIFZlY3RvciBleHRlbnNpb24gbWFudWFsLgo+ID4gKwo+
ID4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZFNjREYDogVGhlIFZlY3RvciBz
dWItZXh0ZW5zaW9uIFp2ZTY0ZCBpcwo+ID4gKyAgICBzdXBwb3J0ZWQsIGFzIGRlZmluZWQgYnkg
dmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBWZWN0b3IgZXh0ZW5zaW9uIG1hbnVhbC4KPiA+ICsK
PiA+ICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzBgOiBBIGJpdG1hc2sg
dGhhdCBjb250YWlucyBwZXJmb3JtYW5jZQo+ID4gICAgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNl
bGVjdGVkIHNldCBvZiBwcm9jZXNzb3JzLgo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaAo+ID4gaW5kZXggOWYyYThlM2ZmMjA0Li5iOWEwODc2ZTk2OWYgMTAwNjQ0Cj4g
PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gPiBAQCAtNTksNiArNTksMTEg
QEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewo+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJU0NW
X0hXUFJPQkVfRVhUX1pUU08gICAgICAgICAgKDFVTEwgPDwgMzMpCj4gPiAgI2RlZmluZSAgICAg
ICAgICAgICAgUklTQ1ZfSFdQUk9CRV9FWFRfWkFDQVMgICAgICAgICAoMVVMTCA8PCAzNCkKPiA+
ICAjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aSUNPTkQgICAgICAgICgx
VUxMIDw8IDM1KQo+ID4gKyNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pW
RTMyWCAgICAgICAgKDFVTEwgPDwgMzYpCj4gPiArI2RlZmluZSAgICAgICAgICAgICAgUklTQ1Zf
SFdQUk9CRV9FWFRfWlZFMzJGICAgICAgICAoMVVMTCA8PCAzNykKPiA+ICsjZGVmaW5lICAgICAg
ICAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aVkU2NFggICAgICAgICgxVUxMIDw8IDM4KQo+ID4g
KyNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pWRTY0RiAgICAgICAgKDFV
TEwgPDwgMzkpCj4gPiArI2RlZmluZSAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9FWFRfWlZF
NjREICAgICAgICAoMVVMTCA8PCA0MCkKPiA+ICAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQ
VVBFUkZfMCAgNQo+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfTUlTQUxJ
R05FRF9VTktOT1dOICAgICAgICAoMCA8PCAwKQo+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJ
U0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRCAgICAgICAoMSA8PCAwKQo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9zeXNfaHdwcm9iZS5jCj4gPiBpbmRleCBhN2M1NmI0MWVmZDIuLjI1MDBkMTc1ZWQ2NiAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiA+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiA+IEBAIC0xMTEsNiArMTExLDExIEBAIHN0
YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCj4g
PiAgICAgICAgICAgICAgIEVYVF9LRVkoWlRTTyk7Cj4gPiAgICAgICAgICAgICAgIEVYVF9LRVko
WkFDQVMpOwo+ID4gICAgICAgICAgICAgICBFWFRfS0VZKFpJQ09ORCk7Cj4gPiArICAgICAgICAg
ICAgIEVYVF9LRVkoWlZFMzJYKTsKPiA+ICsgICAgICAgICAgICAgRVhUX0tFWShaVkUzMkYpOwo+
ID4gKyAgICAgICAgICAgICBFWFRfS0VZKFpWRTY0WCk7Cj4gPiArICAgICAgICAgICAgIEVYVF9L
RVkoWlZFNjRGKTsKPiA+ICsgICAgICAgICAgICAgRVhUX0tFWShaVkU2NEQpOwo+Cj4gSGkgQW5k
eSwKPgo+IEknbSBub3Qgc3VyZSBidXQgc2luY2UgdGhlc2UgZXh0ZW5zaW9ucyBhcmUgY29uZGl0
aW9uZWQgYnkgdGhlIGZhY3QKPiB2ZWN0b3Igc2hvdWxkIGJlIHN1cHBvcnRlZCBieSB0aGUga2Vy
bmVsLCB0aGV5IHByb2JhYmx5IG5lZWRzIHRvIGJlIHB1dAo+IHVuZGVyIHRoZSBpZiBiZWxvdzoK
Pgo+ID4KPiA+ICAgICAgICAgICAgICAgaWYgKGhhc192ZWN0b3IoKSkgewo+Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgPC0tLSBIZXJlIC0tLT4KPiA+ICAgICAgICAgICAgICAgICAgICAgICBF
WFRfS0VZKFpWQkIpOwoKWWVzLCBpdCBtYWtlcyBzZW5zZS4gSSB3aWxsIGFkZCB0aGVtIHVuZGVy
IHRoaXMgY29uZGl0aW9uLiBDb21iaW5lZAp3aXRoIHRoZSBsYXN0IHBhdGNoIG9uIHRoaXMgc2Vy
aWVzLCBpdCB3b3VsZCBiZSBzb21ldGhpbmcgbGlrZSB0aGlzIGluCnRoZSBlbmQuCgppZiAoaGFz
X3ZlY3RvcihaVkUzMlgpKSB7CiAgICAgICAgPC0tIEhlcmUgLS0+CiAgICAgICAgRVhUX0tFWSha
VkJCKTsKfQoKPgo+IFRoYW5rcyAhCj4KPiBDbMOpbWVudAoKVGhhbmtzLApBbmR5CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
