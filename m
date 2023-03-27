Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A001C76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 17:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/LASs8oEb7hU5mWDNhDUcjqYe6vGtwMfsAzCDuyZy4=; b=YPMVtVHLGEyU+a
	Ihwcwsb6yIDg+ABdZgzN8Ttnqz0TIt4g/i/pkGXTiog3pgqIQ5HI1pEFD9WD4yzbnH3BbvPbl1QtR
	ENg7gq9vNrw0VwPCOHumI7oc1X0Lx9XzWt6nq7Yvpvj0W9HKRcnzEXtwhL1/H0IocQ4D23JjEQDT3
	I8AKTcjyX3WtFZTs4S/zALrydFR5s3V57ToeUDM7wbfjlp/Rj3OJPf8uBRe3HaAbFeKxJrEdKUiBY
	/bjgOnr7I8yJLGVNQ5jeHJBTtqx5SBfTlbgQsuUjz9D9/w86RKQs5dtV9BiVHbJCRZzJ/Bb7DD59c
	XKzPxP85HqvAwkdm70VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqLr-00Br0V-1l;
	Mon, 27 Mar 2023 17:09:47 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqLn-00BqyQ-2P;
	Mon, 27 Mar 2023 17:09:45 +0000
Received: by mail-ed1-f49.google.com with SMTP id w9so39149263edc.3;
        Mon, 27 Mar 2023 10:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679936982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=916y5uBFwWgOo9alDh+0q8lvXTnxrYU+/IU/mAeJkWc=;
        b=0d9UKGwCXvdV7Ev4I0GxOmbVojSAN+85Xi0O71tU0Mf+tFG62q30ihEDdkPgYJUutP
         pbarH5qmldVOaGZdfIAo6hF5F8TqzlHykuzsi45Rqy6Ki9YVo5wdoTb2fdVnrptOLlrn
         YfJYHc0o49Uf5p9H6scCVvq821UDAOIsLVuw7XIPleQpdC2ikxm0pKdBdp9prIyDo1WA
         oKxZ0bOjocbtSDvDc0TdO7ncBXqd6uxxaPEOINCTdVdKM8PTCZSKMuKRm8CByjt0Aw/q
         WYsxQhWB92iq95NDE4x+zDyM2RuoD5r2MZlXENkll10QCrRB84DC4h6eUL6YgMrFLLTg
         8u8A==
X-Gm-Message-State: AAQBX9cb5XfVb9n0BKFrkLCrNDc/MN0qwfWRFDNPgLjfClWGPj6nl6FS
	P1EhMvu2vl19a9jBzpU7OeH2vpZ9U7jPsXbA9vU=
X-Google-Smtp-Source: AKy350YIAgoU5/pPhgYFHzwE54SIN2M00utwdiDdeoXlDJPlxpp6WHnTBlVa0Tn3T0Sq5dCVTup4C6TRcUIQImKqm20=
X-Received: by 2002:a17:906:5fca:b0:930:310:abcf with SMTP id
 k10-20020a1709065fca00b009300310abcfmr6216312ejv.2.1679936982247; Mon, 27 Mar
 2023 10:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144703.1541888-1-robh@kernel.org> <CAPDyKFoVUQEmseNT+dZFJDfwh7ijTwUs5_NckpZLhRQ=VuFpFQ@mail.gmail.com>
In-Reply-To: <CAPDyKFoVUQEmseNT+dZFJDfwh7ijTwUs5_NckpZLhRQ=VuFpFQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 Mar 2023 19:09:30 +0200
Message-ID: <CAJZ5v0hx_zQj+JHdgkvHaq4C_UVqNAH_8ANF-v4fEmRWKyRCMA@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: Use of_property_present() for testing DT
 property presence
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_100943_784758_C3D4747B 
X-CRM114-Status: GOOD (  19.94  )
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

T24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgNjo0N+KAr1BNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgMTAgTWFyIDIwMjMgYXQgMTU6NDcsIFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEl0IGlzIHByZWZlcnJl
ZCB0byB1c2UgdHlwZWQgcHJvcGVydHkgYWNjZXNzIGZ1bmN0aW9ucyAoaS5lLgo+ID4gb2ZfcHJv
cGVydHlfcmVhZF88dHlwZT4gZnVuY3Rpb25zKSByYXRoZXIgdGhhbiBsb3ctbGV2ZWwKPiA+IG9m
X2dldF9wcm9wZXJ0eS9vZl9maW5kX3Byb3BlcnR5IGZ1bmN0aW9ucyBmb3IgcmVhZGluZyBwcm9w
ZXJ0aWVzLiBBcwo+ID4gcGFydCBvZiB0aGlzLCBjb252ZXJ0IG9mX2dldF9wcm9wZXJ0eS9vZl9m
aW5kX3Byb3BlcnR5IGNhbGxzIHRvIHRoZQo+ID4gcmVjZW50bHkgYWRkZWQgb2ZfcHJvcGVydHlf
cHJlc2VudCgpIGhlbHBlciB3aGVuIHdlIGp1c3Qgd2FudCB0byB0ZXN0Cj4gPiBmb3IgcHJlc2Vu
Y2Ugb2YgYSBwcm9wZXJ0eSBhbmQgbm90aGluZyBtb3JlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4KPiBBY2tlZC1ieTogVWxmIEhhbnNzb24g
PHVsZi5oYW5zc29uQGxpbmFyby5vcmc+Cj4KPiBSYWZhZWwsIGNhbiB5b3UgcGxlYXNlIHBpY2sg
dGhpcyB2aWEgeW91ciB0cmVlLgoKRG9uZSAocXVldWVkIHVwIGZvciA2LjQpLCB0aGFua3MhCgo+
ID4gLS0tCj4gPiAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcHNjaS1kb21haW4uYyB8IDIgKy0K
PiA+ICBkcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYyAgIHwgNiArKystLS0KPiA+
ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcHNjaS1kb21haW4uYyBiL2Ry
aXZlcnMvY3B1aWRsZS9jcHVpZGxlLXBzY2ktZG9tYWluLmMKPiA+IGluZGV4IDZhZDI5NTQ5NDhh
NS4uZTg3NWRkYWRjNTFiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUt
cHNjaS1kb21haW4uYwo+ID4gKysrIGIvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcHNjaS1kb21h
aW4uYwo+ID4gQEAgLTE2NSw3ICsxNjUsNyBAQCBzdGF0aWMgaW50IHBzY2lfY3B1aWRsZV9kb21h
aW5fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAgICAgICAgICogaW5p
dGlhbGl6ZSBhIGdlbnBkL2dlbnBkLW9mLXByb3ZpZGVyIHBhaXIgd2hlbiBpdCdzIGZvdW5kLgo+
ID4gICAgICAgICAgKi8KPiA+ICAgICAgICAgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShucCwgbm9k
ZSkgewo+ID4gLSAgICAgICAgICAgICAgIGlmICghb2ZfZmluZF9wcm9wZXJ0eShub2RlLCAiI3Bv
d2VyLWRvbWFpbi1jZWxscyIsIE5VTEwpKQo+ID4gKyAgICAgICAgICAgICAgIGlmICghb2ZfcHJv
cGVydHlfcHJlc2VudChub2RlLCAiI3Bvd2VyLWRvbWFpbi1jZWxscyIpKQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgY29udGludWU7Cj4gPgo+ID4gICAgICAgICAgICAgICAgIHJldCA9IHBz
Y2lfcGRfaW5pdChub2RlLCB1c2Vfb3NpKTsKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NwdWlk
bGUvY3B1aWRsZS1yaXNjdi1zYmkuYyBiL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNi
aS5jCj4gPiBpbmRleCBiZTM4M2Y0YjY4NTUuLjFmYWIxYWJjNmViNiAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4gPiArKysgYi9kcml2ZXJzL2Nw
dWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYwo+ID4gQEAgLTQ5Nyw3ICs0OTcsNyBAQCBzdGF0aWMg
aW50IHNiaV9nZW5wZF9wcm9iZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+ID4gICAgICAgICAg
KiBpbml0aWFsaXplIGEgZ2VucGQvZ2VucGQtb2YtcHJvdmlkZXIgcGFpciB3aGVuIGl0J3MgZm91
bmQuCj4gPiAgICAgICAgICAqLwo+ID4gICAgICAgICBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKG5w
LCBub2RlKSB7Cj4gPiAtICAgICAgICAgICAgICAgaWYgKCFvZl9maW5kX3Byb3BlcnR5KG5vZGUs
ICIjcG93ZXItZG9tYWluLWNlbGxzIiwgTlVMTCkpCj4gPiArICAgICAgICAgICAgICAgaWYgKCFv
Zl9wcm9wZXJ0eV9wcmVzZW50KG5vZGUsICIjcG93ZXItZG9tYWluLWNlbGxzIikpCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+Cj4gPiAgICAgICAgICAgICAgICAgcmV0
ID0gc2JpX3BkX2luaXQobm9kZSk7Cj4gPiBAQCAtNTQ4LDggKzU0OCw4IEBAIHN0YXRpYyBpbnQg
c2JpX2NwdWlkbGVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAgICAg
ICAgZm9yX2VhY2hfcG9zc2libGVfY3B1KGNwdSkgewo+ID4gICAgICAgICAgICAgICAgIG5wID0g
b2ZfY3B1X2RldmljZV9ub2RlX2dldChjcHUpOwo+ID4gICAgICAgICAgICAgICAgIGlmIChucCAm
Jgo+ID4gLSAgICAgICAgICAgICAgICAgICBvZl9maW5kX3Byb3BlcnR5KG5wLCAicG93ZXItZG9t
YWlucyIsIE5VTEwpICYmCj4gPiAtICAgICAgICAgICAgICAgICAgIG9mX2ZpbmRfcHJvcGVydHko
bnAsICJwb3dlci1kb21haW4tbmFtZXMiLCBOVUxMKSkgewo+ID4gKyAgICAgICAgICAgICAgICAg
ICBvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLCAicG93ZXItZG9tYWlucyIpICYmCj4gPiArICAgICAg
ICAgICAgICAgICAgIG9mX3Byb3BlcnR5X3ByZXNlbnQobnAsICJwb3dlci1kb21haW4tbmFtZXMi
KSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiAgICAgICAgICAg
ICAgICAgfSBlbHNlIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHNiaV9jcHVpZGxlX3Vz
ZV9vc2kgPSBmYWxzZTsKPiA+IC0tCj4gPiAyLjM5LjIKPiA+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
