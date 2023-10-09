Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95017E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Gd0V4tEyJzeaV40sFoLV4WtRJ6LARzuZswW98acsug=; b=JxGjNsCxztyxEc
	OkBjE7Nu9cYCRgYMwWnaE4XnxjUM4vc4/yFOXr9V9XP6GNgCXK1t5pozsWkV4WSXzf0Uc+9K+17xE
	T1zdxkKFZ0gN3+dzpdHkLAjs9czLN2Bfge2BeIAM5zsnPUaeAF+Hx0VXRMaMZK0Px8bSsdxqgEM4y
	3dN6U7i29iXU+dWh9Mji3pz9uXgDvcH7kRDhXK6rYpx1iU7ZKTE1ZjSUJL3VSvQEB4393g+jFfibK
	Yq9qP2urLzlRCBhLZ2CDPknL+azaWnKuYAdhqKz2m5US9plSzzH0P5nUCeKDOMn6qUtmUIQe8eoMg
	KqIfMXkQMw8z5YgJ1u3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qplj5-009yyF-2j;
	Mon, 09 Oct 2023 08:34:55 +0000
Received: from mail-yw1-f172.google.com ([209.85.128.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qplj1-009yww-0h
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 08:34:54 +0000
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-59f6041395dso53385517b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 01:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696840488; x=1697445288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3OahYfdCxv80l6RdHzhMjxT84AMNbMTgSYeJWK9cGg=;
        b=pVK2JtUZL3yFJs5yNb0UpPXvyZyQKl7N3kmDUgJ+P4LHOC/cWp0+DogunODm2e/e5Y
         QYDV05LHEnmmRELpR5GaAE1kIz8fw8lurEw6IgTxCaelxLsQjYbz2oIkPKWi7//JuD69
         1/KnbtdTGCERowgctr/iqnOI42Mg+f+MIkCHGXRX46az/T0gUObv/X0yzdOrEt78HQil
         eP7ephen8v58BHj1afB02O1Dhfik6TPGQZ8xIVcCvnGQaZRGMVt2NCXh7SljmPTMLJzH
         dMwoxBkZ15wPpJO+656IQ5sh7SYUjpRyaZGm1PRP3Yte0IODCayJxnz4+8h9/aungvLb
         C08g==
X-Gm-Message-State: AOJu0YzDSxWHES/NfFwTO3JHFRiW0QQzO+d9G0zL+1HyOZfMLVU6A1EK
	zqSJqy8uFXrF8Z20Gr8DrFqE1L7CV/NyWg==
X-Google-Smtp-Source: AGHT+IEO379uwPIk2JGxnxflu8o0vgKc5UjtASFgtfuLniIYDkjJJY1SYvcIahveiggkmPg1Xa0Aew==
X-Received: by 2002:a81:8782:0:b0:577:51cd:1b4a with SMTP id x124-20020a818782000000b0057751cd1b4amr16590274ywf.41.1696840487813;
        Mon, 09 Oct 2023 01:34:47 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id d184-20020a0ddbc1000000b00586108dd8f5sm3499160ywe.18.2023.10.09.01.34.47
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 01:34:47 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59f55c276c3so53396357b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 01:34:47 -0700 (PDT)
X-Received: by 2002:a81:d24f:0:b0:5a1:d398:2e with SMTP id m15-20020a81d24f000000b005a1d398002emr18003738ywl.37.1696840486754;
 Mon, 09 Oct 2023 01:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231009-sandbar-botch-0f398fd2e289@wendy>
In-Reply-To: <20231009-sandbar-botch-0f398fd2e289@wendy>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Oct 2023 10:34:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVojwgOP8bqHobgbsgUA+7yxUA7v5M6Z800zxrCeuxZjg@mail.gmail.com>
Message-ID: <CAMuHMdVojwgOP8bqHobgbsgUA+7yxUA7v5M6Z800zxrCeuxZjg@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: select ERRATA_ANDES for R9A07G043 only when
 alternatives are present
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-renesas-soc@vger.kernel.org, conor@kernel.org, 
	Randy Dunlap <rdunlap@infradead.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_013451_251095_C5D49371 
X-CRM114-Status: GOOD (  20.15  )
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

SGkgQ29ub3IsCgpPbiBNb24sIE9jdCA5LCAyMDIzIGF0IDEwOjEy4oCvQU0gQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gUmFuZHkgcmVwb3J0ZWQgYSBy
YW5kY29uZmlnIGJ1aWxkIGlzc3VlIGFnYWluc3QgbGludXgtbmV4dDoKPiBXQVJOSU5HOiB1bm1l
dCBkaXJlY3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBFUlJBVEFfQU5ERVMKPiAgIERlcGVu
ZHMgb24gW25dOiBSSVNDVl9BTFRFUk5BVElWRSBbPW5dICYmIFJJU0NWX1NCSSBbPXldCj4gICBT
ZWxlY3RlZCBieSBbeV06Cj4gICAtIEFSQ0hfUjlBMDdHMDQzIFs9eV0gJiYgU09DX1JFTkVTQVMg
Wz15XSAmJiBSSVNDViBbPXldICYmIE5PTlBPUlRBQkxFIFs9eV0gJiYgUklTQ1ZfU0JJIFs9eV0K
Pgo+IC4uL2FyY2gvcmlzY3YvZXJyYXRhL2FuZGVzL2VycmF0YS5jOjU5OjU0OiB3YXJuaW5nOiAn
c3RydWN0IGFsdF9lbnRyeScgZGVjbGFyZWQgaW5zaWRlIHBhcmFtZXRlciBsaXN0IHdpbGwgbm90
IGJlIHZpc2libGUgb3V0c2lkZSBvZiB0aGlzIGRlZmluaXRpb24gb3IgZGVjbGFyYXRpb24KPiAg
ICA1OSB8IHZvaWQgX19pbml0X29yX21vZHVsZSBhbmRlc19lcnJhdGFfcGF0Y2hfZnVuYyhzdHJ1
Y3QgYWx0X2VudHJ5ICpiZWdpbiwgc3RydWN0IGFsdF9lbnRyeSAqZW5kLAo+Cj4gT24gUklTQy1W
LCBhbHRlcm5hdGl2ZXMgYXJlIG5vdCB1c2FibGUgaW4gWElQIGtlcm5lbHMsIHdoaWNoIHRoaXMK
PiByYW5kY29uZmlnIGhhcHBlbmVkIHRvIHNlbGVjdC4gQWRkIGEgY2hlY2sgZm9yIHdoZXRoZXIg
YWx0ZXJuYXRpdmVzIGFyZQo+IGF2YWlsYWJsZSBiZWZvcmUgc2VsZWN0aW5nIHRoZSBFUlJBVEFf
QU5ERVMgY29uZmlnIG9wdGlvbi4KPgo+IFJlcG9ydGVkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5s
YXBAaW5mcmFkZWFkLm9yZz4KPiBBY2tlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJh
ZGVhZC5vcmc+Cj4gVGVzdGVkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9y
Zz4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8wOWE2YjBmMC03NmExLTQ1
ZTMtYWI1Mi0zMjljNDczOTNkMWRAaW5mcmFkZWFkLm9yZy8KPiBTaWduZWQtb2ZmLWJ5OiBDb25v
ciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKVGhhbmtzIGZvciB5b3VyIHBh
dGNoIQoKPiAtLS0gYS9kcml2ZXJzL3NvYy9yZW5lc2FzL0tjb25maWcKPiArKysgYi9kcml2ZXJz
L3NvYy9yZW5lc2FzL0tjb25maWcKPiBAQCAtMzQzLDcgKzM0Myw3IEBAIGNvbmZpZyBBUkNIX1I5
QTA3RzA0Mwo+ICAgICAgICAgc2VsZWN0IEFSQ0hfUlpHMkwKPiAgICAgICAgIHNlbGVjdCBBWDQ1
TVBfTDJfQ0FDSEUgaWYgUklTQ1ZfRE1BX05PTkNPSEVSRU5UCj4gICAgICAgICBzZWxlY3QgRE1B
X0dMT0JBTF9QT09MCj4gLSAgICAgICBzZWxlY3QgRVJSQVRBX0FOREVTIGlmIFJJU0NWX1NCSQo+
ICsgICAgICAgc2VsZWN0IEVSUkFUQV9BTkRFUyBpZiAoUklTQ1ZfU0JJICYmIFJJU0NWX0FMVEVS
TkFUSVZFKQoKUGVyaGFwcyBBUkNIX1I5QTA3RzA0MyBzaG91bGQgZGVwZW5kIG9uIFJJU0NWX0FM
VEVSTkFUSVZFIChhbmQKUklTQ1ZfU0JJKSBpbnN0ZWFkPyAgSXQncyBub3QgbGlrZSBSWi9GaXZl
IGlzIGdvbm5hIHdvcmsgd2l0aG91dCB0aGUKQW5kZXMgZXJyYXRhIGhhbmRsaW5nIHByZXNlbnQg
KHVubGVzcyBhbGwgb2YgdGhlbSBhcmUgcmVsYXRlZCB0byBjYWNoZQpoYW5kbGluZywgYW5kIHdl
IGNhbiBydW4gdW5jYWNoZWQ7IGFsc28gc2VlIGJlbG93KSkuCgo+ICAgICAgICAgc2VsZWN0IEVS
UkFUQV9BTkRFU19DTU8gaWYgRVJSQVRBX0FOREVTCgpBbmQgdGhlbiB0aGlzICJpZiIgY2FuIGdv
IGFzIHdlbGwuCgpBbnkgb3RoZXIgaGFyZCBkZXBlbmRlbmNpZXM/CkUuZy4gY2FuIFJaL0ZpdmUg
d29yayB3aXRob3V0IFJJU0NWX0RNQV9OT05DT0hFUkVOVD8KCj4gICAgICAgICBoZWxwCj4gICAg
ICAgICAgIFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZvciB0aGUgUmVuZXNhcyBSWi9GaXZlIFNvQy4K
Ckdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
IGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtp
bmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxk
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
