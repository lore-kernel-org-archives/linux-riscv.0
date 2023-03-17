Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81567C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 04:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2Xpy2F0PUly4JhRbY8wkOzCCpMoYmF31AKTz6Gmjgw=; b=Ue0PqKb9jFvyz5
	Q1vSv4gQqo6jfIu6yJ5jB5BGY4YrKA41GRug6XVNIcEjln8YiPFMn6Xh7Q+0Ol3NWfzIOFiJbmjV6
	880sCUzKuMDWcRFgEbziS+oO+TmNYOUevCDWJXuu+3JAT3+CPdP79C396j235Gzr3q12cv3a3Xv/H
	aQM8Dfo4KtT/2bg6N1RsVDDKjnr0tgdAOd2vKlhZTnZCCiJJljVKCLnLsyXN4CBfVEI49ZRImw9Kx
	Ewtqn9RUndtaFtNZ1rctHGu0WBfvRh8lhqC4h+pY9hibrY3ryfm7/qAyaheNSYUAF+7vl2cNWrG1o
	zrXwSuqZBuS0iF7aHD0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd1Vk-000vRi-2g;
	Fri, 17 Mar 2023 04:16:12 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd1Vg-000vQn-1t
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 04:16:10 +0000
Received: by mail-ed1-x52d.google.com with SMTP id fd5so15647874edb.7
        for <linux-riscv@lists.infradead.org>; Thu, 16 Mar 2023 21:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1679026566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ev5OIriLd8TfqA5c4EtuME02ulo1DCJFDytsxJZBhk=;
        b=KVym4KsPs4lbipnClxHVlIDpvF0tz4OM52461JamvSARxqw4Qsd4Q1VhIogAigMF3P
         Zh1TNuTdXgoWtDExZPpqlsQDicuZu+tVLZQiglu7KWkCHyZGEOwAREoC67gtNvFU5hX0
         ed7KDbhUroQI/NLBZr2kwGwp0xBQmGQfS9eSK+a3QOIEPuLuQ5aLC9wOKPJmyp2Lk70M
         UosDdD9GJIYeAuYAho7SNTOa1YJSYOslH9t6ECfzQX0hcXvBmpyIXaqChCYA5tU9OJ5r
         rkAM8txuEzxv2nisB7MDMAHwr/hcgGqqUM54MVa0b41g0lDznS+AVy7aKBN0P3scAa2V
         09RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679026566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ev5OIriLd8TfqA5c4EtuME02ulo1DCJFDytsxJZBhk=;
        b=L7+wxg6xbHX3hhdVtzl2G9aPjKCmj6MnvItabGaYbW2kqhLjPxpndeeOLv2ZkRw3QH
         9EA3WSeJvNMixKSOFd6kfZ9bNkFThe0F+kDxE7jHUmEseJgEMAjAt8FNEt0stgr3WIZW
         +iNK3N9ZS/Cr2FH9AH5rUEEJFVLQO8yJ/I0on0FW1tdTTCtlF5Tu47mbl2Zf059J7bhv
         ZoQiL2gLozgwyfwF/hzqVte5EOXb5qx4Fnye1/bIMVr8ARl55Eh3Oa5mLtiSR9SnPQnR
         UdgFV5nMgYPNL5o7ZDWh+lyZvgU9nSYKDI7+KaYpPDPU2tVyAwOU1KlfNnR0Q2IQ2ugY
         Z7SQ==
X-Gm-Message-State: AO0yUKUmN7MB+mt7/5v/yqLFbld+J9XuVOkI8pAHLimh1yjVBiMc5v1n
	7KVYjBexwzud6Wpx9F+STIDNU935KM7wR9qv6jTNYQ==
X-Google-Smtp-Source: AK7set/XeeEOd+FtzL3MTXXII1yiO1F3TxBHDttiukeaTtzGeJdZUgTY3kqMR9FqRfno5OlhXVB5YA7QTCM53ahqloc=
X-Received: by 2002:a17:907:36e:b0:8b1:3d0d:5333 with SMTP id
 rs14-20020a170907036e00b008b13d0d5333mr6533936ejb.13.1679026566443; Thu, 16
 Mar 2023 21:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144703.1541888-1-robh@kernel.org>
In-Reply-To: <20230310144703.1541888-1-robh@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Mar 2023 09:45:55 +0530
Message-ID: <CAAhSdy1vqiLE40ZoFaw48zyU0QGapafh=ytVFjETX_9wruqHmg@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: Use of_property_present() for testing DT
 property presence
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_211608_837645_2153E831 
X-CRM114-Status: GOOD (  16.60  )
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

T24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgODoxN+KAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gSXQgaXMgcHJlZmVycmVkIHRvIHVzZSB0eXBlZCBwcm9wZXJ0eSBh
Y2Nlc3MgZnVuY3Rpb25zIChpLmUuCj4gb2ZfcHJvcGVydHlfcmVhZF88dHlwZT4gZnVuY3Rpb25z
KSByYXRoZXIgdGhhbiBsb3ctbGV2ZWwKPiBvZl9nZXRfcHJvcGVydHkvb2ZfZmluZF9wcm9wZXJ0
eSBmdW5jdGlvbnMgZm9yIHJlYWRpbmcgcHJvcGVydGllcy4gQXMKPiBwYXJ0IG9mIHRoaXMsIGNv
bnZlcnQgb2ZfZ2V0X3Byb3BlcnR5L29mX2ZpbmRfcHJvcGVydHkgY2FsbHMgdG8gdGhlCj4gcmVj
ZW50bHkgYWRkZWQgb2ZfcHJvcGVydHlfcHJlc2VudCgpIGhlbHBlciB3aGVuIHdlIGp1c3Qgd2Fu
dCB0byB0ZXN0Cj4gZm9yIHByZXNlbmNlIG9mIGEgcHJvcGVydHkgYW5kIG5vdGhpbmcgbW9yZS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpGb3IgY3B1
aWRsZS1yaXNjdi1zYmk6CgpBY2tlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcHNjaS1k
b21haW4uYyB8IDIgKy0KPiAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMgICB8
IDYgKysrLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXBzY2ktZG9tYWlu
LmMgYi9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1wc2NpLWRvbWFpbi5jCj4gaW5kZXggNmFkMjk1
NDk0OGE1Li5lODc1ZGRhZGM1MWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jcHVpZGxlL2NwdWlk
bGUtcHNjaS1kb21haW4uYwo+ICsrKyBiL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXBzY2ktZG9t
YWluLmMKPiBAQCAtMTY1LDcgKzE2NSw3IEBAIHN0YXRpYyBpbnQgcHNjaV9jcHVpZGxlX2RvbWFp
bl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICogaW5pdGlh
bGl6ZSBhIGdlbnBkL2dlbnBkLW9mLXByb3ZpZGVyIHBhaXIgd2hlbiBpdCdzIGZvdW5kLgo+ICAg
ICAgICAgICovCj4gICAgICAgICBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKG5wLCBub2RlKSB7Cj4g
LSAgICAgICAgICAgICAgIGlmICghb2ZfZmluZF9wcm9wZXJ0eShub2RlLCAiI3Bvd2VyLWRvbWFp
bi1jZWxscyIsIE5VTEwpKQo+ICsgICAgICAgICAgICAgICBpZiAoIW9mX3Byb3BlcnR5X3ByZXNl
bnQobm9kZSwgIiNwb3dlci1kb21haW4tY2VsbHMiKSkKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBjb250aW51ZTsKPgo+ICAgICAgICAgICAgICAgICByZXQgPSBwc2NpX3BkX2luaXQobm9kZSwg
dXNlX29zaSk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNi
aS5jIGIvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMKPiBpbmRleCBiZTM4M2Y0
YjY4NTUuLjFmYWIxYWJjNmViNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NwdWlkbGUvY3B1aWRs
ZS1yaXNjdi1zYmkuYwo+ICsrKyBiL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5j
Cj4gQEAgLTQ5Nyw3ICs0OTcsNyBAQCBzdGF0aWMgaW50IHNiaV9nZW5wZF9wcm9iZShzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wKQo+ICAgICAgICAgICogaW5pdGlhbGl6ZSBhIGdlbnBkL2dlbnBkLW9m
LXByb3ZpZGVyIHBhaXIgd2hlbiBpdCdzIGZvdW5kLgo+ICAgICAgICAgICovCj4gICAgICAgICBm
b3JfZWFjaF9jaGlsZF9vZl9ub2RlKG5wLCBub2RlKSB7Cj4gLSAgICAgICAgICAgICAgIGlmICgh
b2ZfZmluZF9wcm9wZXJ0eShub2RlLCAiI3Bvd2VyLWRvbWFpbi1jZWxscyIsIE5VTEwpKQo+ICsg
ICAgICAgICAgICAgICBpZiAoIW9mX3Byb3BlcnR5X3ByZXNlbnQobm9kZSwgIiNwb3dlci1kb21h
aW4tY2VsbHMiKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPgo+ICAgICAg
ICAgICAgICAgICByZXQgPSBzYmlfcGRfaW5pdChub2RlKTsKPiBAQCAtNTQ4LDggKzU0OCw4IEBA
IHN0YXRpYyBpbnQgc2JpX2NwdWlkbGVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgICAgICAgIGZvcl9lYWNoX3Bvc3NpYmxlX2NwdShjcHUpIHsKPiAgICAgICAgICAgICAg
ICAgbnAgPSBvZl9jcHVfZGV2aWNlX25vZGVfZ2V0KGNwdSk7Cj4gICAgICAgICAgICAgICAgIGlm
IChucCAmJgo+IC0gICAgICAgICAgICAgICAgICAgb2ZfZmluZF9wcm9wZXJ0eShucCwgInBvd2Vy
LWRvbWFpbnMiLCBOVUxMKSAmJgo+IC0gICAgICAgICAgICAgICAgICAgb2ZfZmluZF9wcm9wZXJ0
eShucCwgInBvd2VyLWRvbWFpbi1uYW1lcyIsIE5VTEwpKSB7Cj4gKyAgICAgICAgICAgICAgICAg
ICBvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLCAicG93ZXItZG9tYWlucyIpICYmCj4gKyAgICAgICAg
ICAgICAgICAgICBvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLCAicG93ZXItZG9tYWluLW5hbWVzIikp
IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAgICAgICAgICAgICAgICAg
fSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBzYmlfY3B1aWRsZV91c2Vfb3NpID0g
ZmFsc2U7Cj4gLS0KPiAyLjM5LjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
