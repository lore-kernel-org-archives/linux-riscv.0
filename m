Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D435C433E4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 03:36:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB35D20714
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 03:36:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="okbG7wPI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="n5kU7X/C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB35D20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EAs650IbOFu656/NkNhXMqbO4442PX0/R+SL4RPbaJg=; b=okbG7wPICYZFW+dmiug5Gjj0M
	Xe3dx6w41mpwJd7jJ5YdE7NPeTzZwDGOJ45XU26eptKx3ppHWOzCmW9WoSn9+UMvZuuePX2mf2pvN
	xyxX2i1N7VNL8Tyz7LNDUwjVcSRkSQR15+W4L6vkVhK+ME8nFTnlXxIhTYrgEF/B5AF8JeRdm0iYb
	042nu4BRpqlsDftTH5JtSEDCehr3QSUD3Z/hgf3bxk28UXKxM3lLxiy8ZJuuPUvQLxce80zN2wPmJ
	7HzdPc8dmbo96zTBdy2f9kBjyzRb7Xp5C8oD+kBUcKFb+eMW+3UOJ6YGxvwljqO5K9+dFja4TO8+k
	R/UkFbFAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy5Ye-0006CN-Rs; Wed, 22 Jul 2020 03:36:40 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy5Yb-0006Bu-NA
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 03:36:38 +0000
Received: by mail-wm1-x342.google.com with SMTP id a6so3448324wmm.0
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 20:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZYjf/M8LtGnB4n0AyVVMXshArfiVRiM4rRLy+QhAdfs=;
 b=n5kU7X/CI3Z5fW6+a551VM3WKGThHB5ECCmvscA5jslOS6TIK8br9x2moqjvPMW/cO
 4IROMHQFonmY+VuZyRzuCUu0Br+fXUw4ZZh9w+kNVins/sX+FDLeCUpDLXWopq4L4KKR
 JJwgau3DxCOp6ISAphnMaIyhgaekZHeFaBxBcykEqImIhN5bxU5bUFH/nihdD8K5vnv3
 1ohikFnZFDtlWYURDzaqbbthwJJijaRT2nDXJbRxgS25kCrD7dM0khqGcZl59dAyAxR1
 7YuAlnecgKJrux+CpYjmP4mCDKs634ykK+DO0MEpxfSao+US+//ueJcWdf6vHNJyYdBU
 Z3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZYjf/M8LtGnB4n0AyVVMXshArfiVRiM4rRLy+QhAdfs=;
 b=np/J68lmFVGkZjPtjFOQ9xMZ+FoAoiouUHQ7T82zzpTwcNuw/nguFUhtmIZhaO7cnM
 Rf+hBtqjeqmMK1j1ywEh++LWoULjkn6JuXwfb9S/ifqqWMlq6mJMVUnKnSv+itdO1jLg
 pssreiYKdDdFmYAo9kuLadACKtOPPKHITqu2Y/cv/MgirTd8UjchdAj6pFGnVFsFvGWJ
 pgMHEORsYc9afBQ6YO4IDW78o9vAYtdDxDiuGNWFRZqlqlHZp6qoTBqTVpd3LM95c4JW
 Aq6TKW1AbrhUz1iPfD8GUfZwQCTFn/I/SACREF7W9tlLC+9ARRDtT2vKDZvSQlmwfE7x
 eLHg==
X-Gm-Message-State: AOAM532mPYdNAf1lYDiOZ3+AEEP1/KDudN1kGMKZTpsB+PRbYv0ZmVpD
 wb6Qs0GLpJDCOO4zaeY7BINCZfZendSp/AshXZMpmQ==
X-Google-Smtp-Source: ABdhPJz1xTvLXcoVhk8ZPc7aGEiWIeZd45I4TtCBSHOm9CSA0MqoCjl6Ufc6dKkEIUr4LC9xvkDrLWvqNuc1sdfLi/k=
X-Received: by 2002:a1c:8117:: with SMTP id c23mr6252105wmd.157.1595388996424; 
 Tue, 21 Jul 2020 20:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200717075101.263332-1-anup.patel@wdc.com>
 <20200717075101.263332-3-anup.patel@wdc.com>
 <63f65ddd-b7c4-b8fd-151c-a77e8c87efed@linaro.org>
 <CAAhSdy2oGAk6A6=SwgCgZ+trmzCMRPOCiB6ibDTL2A_1sUu1og@mail.gmail.com>
 <107e3ef3-9f61-05d1-7a91-95d0dc7ea7b8@linaro.org>
In-Reply-To: <107e3ef3-9f61-05d1-7a91-95d0dc7ea7b8@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 22 Jul 2020 09:06:24 +0530
Message-ID: <CAAhSdy0fmtaExqEx-7qW6Bpzu23d6A4OnUY7b785VJW_5a6rdA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] clocksource/drivers: Add CLINT timer driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_233637_961054_CF504AB5 
X-CRM114-Status: GOOD (  29.91  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berhing <kernel@esmil.dk>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMjEsIDIwMjAgYXQgNTo0NSBQTSBEYW5pZWwgTGV6Y2Fubwo8ZGFuaWVsLmxl
emNhbm9AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAyMS8wNy8yMDIwIDEzOjQ5LCBBbnVwIFBh
dGVsIHdyb3RlOgo+ID4gT24gVHVlLCBKdWwgMjEsIDIwMjAgYXQgNDozMiBQTSBEYW5pZWwgTGV6
Y2Fubwo+ID4gPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24g
MTcvMDcvMjAyMCAwOTo1MCwgQW51cCBQYXRlbCB3cm90ZToKPiA+Pj4gV2UgYWRkIGEgc2VwYXJh
dGUgQ0xJTlQgdGltZXIgZHJpdmVyIGZvciBMaW51eCBSSVNDLVYgTS1tb2RlIChpLmUuCj4gPj4+
IFJJU0MtViBOb01NVSBrZXJuZWwpLgo+ID4+Pgo+ID4+PiBUaGUgQ0xJTlQgTU1JTyBkZXZpY2Ug
cHJvdmlkZXMgdGhyZWUgdGhpbmdzOgo+ID4+PiAxLiA2NGJpdCBmcmVlIHJ1bm5pbmcgY291bnRl
ciByZWdpc3Rlcgo+ID4+PiAyLiA2NGJpdCBwZXItQ1BVIHRpbWUgY29tcGFyZSByZWdpc3RlcnMK
PiA+Pj4gMy4gMzJiaXQgcGVyLUNQVSBpbnRlci1wcm9jZXNzb3IgaW50ZXJydXB0IHJlZ2lzdGVy
cwo+ID4+Pgo+ID4+PiBVbmxpa2Ugb3RoZXIgdGltZXIgZGV2aWNlcywgQ0xJTlQgcHJvdmlkZXMg
SVBJIHJlZ2lzdGVycyBhbG9uZyB3aXRoCj4gPj4+IHRpbWVyIHJlZ2lzdGVycy4gVG8gdXNlIENM
SU5UIElQSSByZWdpc3RlcnMsIHRoZSBDTElOVCB0aW1lciBkcml2ZXIKPiA+Pj4gcHJvdmlkZXMg
SVBJIHJlbGF0ZWQgY2FsbGJhY2tzIHRvIGFyY2gvcmlzY3YuCj4gPj4+Cj4gPj4+IFNpZ25lZC1v
ZmYtYnk6IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAd2RjLmNvbT4KPiA+Pj4gVGVzdGVkLWJ5OiBF
bWlsIFJlbm5lciBCZXJoaW5nIDxrZXJuZWxAZXNtaWwuZGs+Cj4gPj4+IC0tLQo+ID4+PiAgZHJp
dmVycy9jbG9ja3NvdXJjZS9LY29uZmlnICAgICAgIHwgICA5ICsrCj4gPj4+ICBkcml2ZXJzL2Ns
b2Nrc291cmNlL01ha2VmaWxlICAgICAgfCAgIDEgKwo+ID4+PiAgZHJpdmVycy9jbG9ja3NvdXJj
ZS90aW1lci1jbGludC5jIHwgMjMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4+
PiAgaW5jbHVkZS9saW51eC9jcHVob3RwbHVnLmggICAgICAgIHwgICAxICsKPiA+Pj4gIDQgZmls
ZXMgY2hhbmdlZCwgMjQyIGluc2VydGlvbnMoKykKPiA+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLWNsaW50LmMKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZpZyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZp
Zwo+ID4+PiBpbmRleCA5MTQxODM4MWZjZDQuLmUxY2UwZDUxMGEwMyAxMDA2NDQKPiA+Pj4gLS0t
IGEvZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmlnCj4gPj4+ICsrKyBiL2RyaXZlcnMvY2xvY2tz
b3VyY2UvS2NvbmZpZwo+ID4+PiBAQCAtNjU4LDYgKzY1OCwxNSBAQCBjb25maWcgUklTQ1ZfVElN
RVIKPiA+Pj4gICAgICAgICBpcyBhY2Nlc3NlZCB2aWEgYm90aCB0aGUgU0JJIGFuZCB0aGUgcmRj
eWNsZSBpbnN0cnVjdGlvbi4gIFRoaXMgaXMKPiA+Pj4gICAgICAgICByZXF1aXJlZCBmb3IgYWxs
IFJJU0MtViBzeXN0ZW1zLgo+ID4+Pgo+ID4+PiArY29uZmlnIENMSU5UX1RJTUVSCj4gPj4+ICsg
ICAgIGJvb2wgIlRpbWVyIGZvciB0aGUgUklTQy1WIHBsYXRmb3JtIgo+ID4+PiArICAgICBkZXBl
bmRzIG9uIEdFTkVSSUNfU0NIRURfQ0xPQ0sgJiYgUklTQ1ZfTV9NT0RFCj4gPj4+ICsgICAgIHNl
bGVjdCBUSU1FUl9QUk9CRQo+ID4+PiArICAgICBzZWxlY3QgVElNRVJfT0YKPiA+Pj4gKyAgICAg
aGVscAo+ID4+PiArICAgICAgIFRoaXMgb3B0aW9uIGVuYWJsZXMgdGhlIENMSU5UIHRpbWVyIGZv
ciBSSVNDLVYgc3lzdGVtcy4gVGhlIENMSU5UCj4gPj4+ICsgICAgICAgZHJpdmVyIGlzIHVzdWFs
bHkgdXNlZCBmb3IgTm9NTVUgUklTQy1WIHN5c3RlbXMuCj4gPj4KPiA+PiBWMyBoYXMgYSBjb21t
ZW50IGFib3V0IGZpeGluZyB0aGUgS2NvbmZpZyBvcHRpb24uCj4gPgo+ID4gSSBoYXZlIHJlbW92
ZWQgImRlZmF1bHQgeSIgZnJvbSB0aGUgS2NvbmZpZyBvcHRpb24gYXMtcGVyIHlvdXIgc3VnZ2Vz
dGlvbnMuCj4gPgo+ID4gSSBsb29rZWQgYXQgb3RoZXIgVGltZXIgS2NvbmZpZyBvcHRpb25zLiBN
b3N0IG9mIHRoZW0gaGF2ZSBtZW51Y29uZmlnIG5hbWUuCj4gPiBBbHNvLCB3ZSBjYW4gY2VydGFp
bmx5IGhhdmUgZGlmZmVyZW50IHRpbWVyIE1NSU8gdGltZXIgZHJpdmVycyBpbiBmdXR1cmUuIERv
Cj4gPiB5b3Ugc3RpbGwgaW5zaXN0IG9uIG1ha2luZyB0aGlzIGtjb25maWcgb3B0aW9uIHRvdGFs
bHkgc2lsZW50ID8/Cj4KPiBZZXMsIGFuZCB0aGVyZSBpcyBhbiBlZmZvcnQgdG8gY2hhbmdlIHRo
ZSBlbnRyaWVzIHRvIGJlIHNpbGVudCBhcyBtdWNoCj4gYXMgcG9zc2libGUuCj4KPiBKdXN0IGFk
ZDoKPgo+ICAgICAgICAgYm9vbCAiVGltZXIgZm9yIHRoZSBSSVNDLVYgcGxhdGZvcm0iIGlmIENP
TVBJTEVfVEVTVAoKT2theSwgSSB3aWxsIHVwZGF0ZS4KCj4KPiBhbmQgcmVtb3ZlIHRoZSBSSVND
Vl9NX01PREUgZGVwZW5kZW5jeS4KCkNMSU5UIGRyaXZlciBkZXBlbmRzIG9uIFJJU0MtViBzcGVj
aWZpYyBzeW1ib2xzIGZyb20gYXNtL3NtcC5oCnNvIHdlIHNob3VsZCBhdCBsZWFzdCBoYXZlICJk
ZXBlbmRzIG9uIFJJU0NWIiBzbyB0aGF0IGNvbXBpbGUKdGVzdCBkb2VzIG5vdCBmYWlsLgoKQWdy
ZWUgPz8KCj4KPiBPciBhbHRlcm5hdGl2ZWx5Ogo+Cj4gcmVwbGFjZSB0aGUgUklTQ1ZfTV9NT0RF
IGRlcGVuZGVuY3kgd2l0aCBDT01QSUxFX1RFU1QKPgo+IFRoZSBnb2FsIGlzIHRvIGJlIGFibGUg
dG8gY29tcGlsZSB0aGUgZHJpdmVyIG9uIGRpZmZlcmVudCBwbGF0Zm9ybXMgZm9yCj4gY29tcGls
YXRpb24gdGVzdCBjb3ZlcmluZy4KClBsZWFzZSBzZWUgdGhlIGFib3ZlIGNvbW1lbnQuCgo+Cj4g
VGhlbiB3aGVuIG1vcmUgbW1pbyBkcml2ZXJzIHdpbGwgYWRkZWQgd2Ugd2lsbCBmaWd1cmUgb3V0
Lgo+Cj4gPj4gWyAuLi4gXQo+ID4+Cj4gPj4+ICt7Cj4gPj4+ICsgICAgIGJvb2wgKnJlZ2lzdGVy
ZWQgPSBwZXJfY3B1X3B0cigmY2xpbnRfY2xvY2tfZXZlbnRfcmVnaXN0ZXJlZCwgY3B1KTsKPiA+
Pj4gKyAgICAgc3RydWN0IGNsb2NrX2V2ZW50X2RldmljZSAqY2UgPSBwZXJfY3B1X3B0cigmY2xp
bnRfY2xvY2tfZXZlbnQsIGNwdSk7Cj4gPj4+ICsKPiA+Pj4gKyAgICAgaWYgKCEoKnJlZ2lzdGVy
ZWQpKSB7Cj4gPj4+ICsgICAgICAgICAgICAgY2UtPmNwdW1hc2sgPSBjcHVtYXNrX29mKGNwdSk7
Cj4gPj4+ICsgICAgICAgICAgICAgY2xvY2tldmVudHNfY29uZmlnX2FuZF9yZWdpc3RlcihjZSwg
Y2xpbnRfdGltZXJfZnJlcSwgMjAwLAo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFVMT05HX01BWCk7Cj4gPj4+ICsgICAgICAgICAgICAgKnJlZ2lz
dGVyZWQgPSB0cnVlOwo+ID4+PiArICAgICB9Cj4gPj4KPiA+Pgo+ID4+IEkgd2FzIHVuc3VyZSBh
Ym91dCB0aGUgY2xvY2tldmVudHNfY29uZmlnX2FuZF9yZWdpc3RlcigpIG11bHRpcGxlIGNhbGxz
Cj4gPj4gd2hlbiBkb2luZyB0aGUgY29tbWVudC4gSXQgc2VlbXMgbGlrZSBpdCBpcyBmaW5lIHRv
IGNhbGwgaXQgc2V2ZXJhbAo+ID4+IHRpbWVzIGFuZCB0aGF0IGlzIGRvbmUgaW4gc2V2ZXJhbCBw
bGFjZXMgbGlrZSByaXNjdiBvciBhcmNoX2FybV90aW1lci4KPiA+Pgo+ID4+IEl0IGlzIHByb2Jh
Ymx5IHNhZmUgdG8gZHJvcCB0aGUgJ3JlZ2lzdGVyZWQnIGNvZGUgaGVyZSwgc29ycnkgZm9yIHRo
ZQo+ID4+IGNvbmZ1c2lvbi4KPiA+Cj4gPiBPa2F5LCB3aWxsIHJldmVydCB0aGVzZSBjaGFuZ2Vz
Lgo+ID4KPiA+Pgo+ID4+PiArICAgICBlbmFibGVfcGVyY3B1X2lycShjbGludF90aW1lcl9pcnEs
Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGlycV9nZXRfdHJpZ2dlcl90eXBlKGNsaW50
X3RpbWVyX2lycSkpOwo+ID4+PiArICAgICByZXR1cm4gMDsKPiA+Pj4gK30KPiA+Pj4gKwo+ID4+
Cj4gPj4gWyAuLi4gXQo+ID4+Cj4gPj4KPiA+PiAtLQo+ID4+IDxodHRwOi8vd3d3LmxpbmFyby5v
cmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKPiA+
Pgo+ID4+IEZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGlu
YXJvPiBGYWNlYm9vayB8Cj4gPj4gPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3
aXR0ZXIgfAo+ID4+IDxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCj4g
Pgo+ID4gUmVnYXJkcywKPiA+IEFudXAKPiA+Cj4KPgo+IC0tCj4gPGh0dHA6Ly93d3cubGluYXJv
Lm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29Dcwo+
Cj4gRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+
IEZhY2Vib29rIHwKPiA8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8
Cj4gPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKClJlZ2FyZHMsCkFu
dXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
