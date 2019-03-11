Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A854C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 11:41:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEA0B20657
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 11:41:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ghcaxUeD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GS9FAhbN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEA0B20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQJ33dJk0NH3GQY/u37dE8KEsFPSwwcemBpgGVEuXPk=; b=ghcaxUeD7hqNrj
	71FXt66A+YmbbnvbxDkx4nkDXKxStVqAv1AqWsuVbe/YJr1XrOep5mu67JBOBn+T6MZzckl1T5qfn
	bFgAQ2DVMKfVn5iD1BoViPSjwQ569ZIMxJ0tB0nCOKRdpJfNOpeqjaN4yRqO96CJ7iXZLqATDIMLd
	w6Sig1tSie+g0rixhOAFcRKANCceZ7nCGAeUDmvFdZio6aXBloEP4gsGwo05iBGHEP5BD8kU2PcAa
	VmGbfiAfEoUjdj/uxzjKDgWKTJJE7DbhYzCwfl/LvsPYY2IPQYvLEh2zN9FhiXMLDuWERSN+LQVby
	IhUEOGobZka+6kgKHjpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3JIi-0003zC-O7; Mon, 11 Mar 2019 11:41:00 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3JIe-0003yQ-V6
 for linux-riscv@lists.infradead.org; Mon, 11 Mar 2019 11:40:59 +0000
Received: by mail-lj1-x242.google.com with SMTP id p3so67098ljg.5
 for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2019 04:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XGeJu/yu28g981aZh9oEIyoO4PFUefFkvw/uajggBOc=;
 b=GS9FAhbNTX/8qMo8nHBu/ttexA19N/g6p56NBzYZxXSkQj3YnRxQt/wmwLjoPd3GIX
 HV53MiK5YhP+ZJOudnCYZtKg7r/wL026rlOV9qqTpSqW81t1PsyewmrFiqCnMht2O2tF
 HsD1NBlZaG2f1h3DADSBqv+cvmlYr7KXWTmvrL8aucQehIsgwb+LAVRSlPOUQTwg89N1
 zgu7s5Ecp5Td7kBYl4UJT99ibIzYPG5k33NJuZEs6zZnR6exGC3zq+qWl5ROF44alzj0
 MsnNeGSJjbqvS3wd8ShsaJ98vf9IJARaRXTWMqAhtL6Ap58ThzGquNxz2b/0oVe4vp2s
 Eg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XGeJu/yu28g981aZh9oEIyoO4PFUefFkvw/uajggBOc=;
 b=HzzVeNEZtVx1PF8dtSX7CU2ra3oOqq4Z76BnoshKLu4kv8OXCk29CZdbEi5lNm/0oN
 iEbPPwrcLH7dk1fUUqdKP74V1abiYdsi2UJW0fGeRL6l/UsQkSzuKWNzOE5rfBRNoU0A
 8Wu+qPylzhzinxb8FVDSAd3EeuY+Pfv8ZRy1Q3wskCd/bokwk7ExsbKs+pMZhUKeTT+X
 ADWoURQXU/Iilzxd4eUYFqcaoFlv+BJPlLLpZty9Xxw1mNJruI/YtQfgKXz/bU9X4DHk
 sVb57lrUbRBVOllUzHRtxboSJE0EaQM07tAa9resLKVwKwLVZhSkdIXvhEG3mb4D9XpL
 rPYw==
X-Gm-Message-State: APjAAAWvznqSdSbLjmUnGA5qlTi/WlZV6eG2izSyhULUQbjJIiJMLEHM
 13dsyS+iYcts83E9HkdcLvD83iZQo5pE0ib2cocUrA==
X-Google-Smtp-Source: APXvYqzqKkXivrFt8lFMFearykPYQ2344Dz1MEZFxmM6UyCkScX0jEkaEvwcCv33Eexb8RjxwaKb/sY2Q8cYaZnE+5A=
X-Received: by 2002:a2e:9843:: with SMTP id e3mr14492844ljj.57.1552304454297; 
 Mon, 11 Mar 2019 04:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <1551437599-29509-1-git-send-email-yash.shah@sifive.com>
 <1551437599-29509-3-git-send-email-yash.shah@sifive.com>
 <20190307152745.kaiv6q4ygf2apmuv@pengutronix.de>
 <CAJ2_jOFvr=sw7mWR53JbzMJa1jxwjhJSTibCsKYsxrht+PLPWw@mail.gmail.com>
 <20190308115726.smgooacsr37fmxwg@pengutronix.de>
In-Reply-To: <20190308115726.smgooacsr37fmxwg@pengutronix.de>
From: Yash Shah <yash.shah@sifive.com>
Date: Mon, 11 Mar 2019 17:10:17 +0530
Message-ID: <CAJ2_jOFtg2_MAUYkTQM-=6KE2RN+FMxfEhLjZZfzM0k3A5RQiA@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_044057_033686_C1919684 
X-CRM114-Status: GOOD (  17.67  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXIgOCwgMjAxOSBhdCA1OjI3IFBNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBPbiBGcmksIE1h
ciAwOCwgMjAxOSBhdCAwNDo1OTozNlBNICswNTMwLCBZYXNoIFNoYWggd3JvdGU6Cj4gPiBPbiBU
aHUsIE1hciA3LCAyMDE5IGF0IDg6NTcgUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPiA+IDx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+ID4gPiA+ICtzdGF0aWMgaW50IHB3bV9z
aWZpdmVfYXBwbHkoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqZGV2
LAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHB3bV9zdGF0ZSAqc3Rh
dGUpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICBzdHJ1Y3QgcHdtX3NpZml2ZV9kZGF0YSAqcHdt
ID0gcHdtX3NpZml2ZV9jaGlwX3RvX2RkYXRhKGNoaXApOwo+ID4gPiA+ICsgICAgIHVuc2lnbmVk
IGludCBkdXR5X2N5Y2xlLCB4Owo+ID4gPiA+ICsgICAgIHUzMiBmcmFjOwo+ID4gPiA+ICsgICAg
IHN0cnVjdCBwd21fc3RhdGUgY3VyX3N0YXRlOwo+ID4gPiA+ICsgICAgIGJvb2wgZW5hYmxlZDsK
PiA+ID4gPiArICAgICBpbnQgcmV0ID0gMDsKPiA+ID4gPiArICAgICB1bnNpZ25lZCBsb25nIG51
bTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgaWYgKHN0YXRlLT5wb2xhcml0eSAhPSBQV01fUE9M
QVJJVFlfSU5WRVJTRUQpCj4gPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+
ID4gPiArCj4gPiA+ID4gKyAgICAgbXV0ZXhfbG9jaygmcHdtLT5sb2NrKTsKPiA+ID4gPiArICAg
ICBwd21fZ2V0X3N0YXRlKGRldiwgJmN1cl9zdGF0ZSk7Cj4gPiA+ID4gKyAgICAgZW5hYmxlZCA9
IGN1cl9zdGF0ZS5lbmFibGVkOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICBpZiAoc3RhdGUtPnBl
cmlvZCAhPSBjdXJfc3RhdGUucGVyaW9kKSB7Cj4gPiA+Cj4gPiA+IERpZCB5b3UgdGVzdCB0aGlz
IHdpdGggbW9yZSB0aGFuIG9uZSBjb25zdW1lcj8gRm9yIHN1cmUgdGhlIGZvbGxvd2luZwo+ID4g
PiBzaG91bGQgd29yazoKPiA+ID4KPiA+ID4gICAgICAgICBwd20xID0gcHdtX2dldCguLiB0aGUg
Zmlyc3QgLi4pOwo+ID4gPiAgICAgICAgIHB3bV9hcHBseV9zdGF0ZShwd20xLCB7IC5lbmFibGVk
ID0gdHJ1ZSwgLnBlcmlvZCA9IDEwMDAwMDAwLCAuLi4uIH0pOwo+ID4gPgo+ID4gPiAgICAgICAg
IHB3bTIgPSBwd21fZ2V0KC4uIHRoZSBzZWNvbmQgLi4pOwo+ID4gPiAgICAgICAgIHB3bV9hcHBs
eV9zdGF0ZShwd20yLCB7IC5lbmFibGVkID0gdHJ1ZSwgLnBlcmlvZCA9IDEwMDAwMDAwLCAuLi4u
IH0pOwo+ID4gPgo+ID4gPiBidXQgZm9yIHRoZSBzZWNvbmQgcHdtX2FwcGx5X3N0YXRlKCkgcnVu
IHN0YXRlLT5wZXJpb2QgaXMgbGlrZWx5IG5vdAo+ID4gPiBleGFjdGx5IDEwMDAwMDAwLgo+ID4K
PiA+IFllcywgSSBoYXZlIHRlc3RlZCBtdWx0aXBsZSBjb25zdW1lcnMgdXNpbmcgc3lzZnMgaW50
ZXJmYWNlLiBJdCBpcyB3b3JraW5nLgo+Cj4gQ2FuIHlvdSBwcm92aWRlIGRldGFpbHMgYWJvdXQg
eW91ciB0ZXN0aW5nIGhlcmU/IFdoYXQgaXMgdGhlIHBhcmVudCBjbGsKPiByYXRlPyBXaGljaCBz
ZXR0aW5ncyBkaWQgeW91IHRlc3Q/IENhbiB5b3UgY29uZmlybSBteSBjbGFpbSB0aGF0IHRoZQo+
IGFib3ZlIHNlcXVlbmNlIHdvdWxkIGZhaWwgb3IgcG9pbnQgb3V0IG15IGVycm9yIGluIHJlYXNv
bmluZz8KPgoKSSBoYXZlIHRlc3RlZCBvbiBIaUZpdmUgVW5sZWFzaGVkIGJvYXJkIHVzaW5nIHN5
c2ZzIGludGVyZmFjZS4KUGFyZW50IGNsayByYXRlIGlzIGFyb3VuZCA1MTIgTWh6LgpJIGhhdmUg
dGVzdGVkIHNjZW5hcmlvcyBhcyB5b3UgbWVudGlvbmVkIGFib3ZlIHdpdGggdmFyaW91cyBwZXJp
b2QgYW5kCmR1dHlfY3ljbGUgdmFsdWVzLgoKQWZ0ZXIgY29uc2lkZXJpbmcgeW91ciBiZWxvdyBz
dWdnZXN0aW9uLAogfCBUbyBnZXQgdGhlIHJlc3VsdCBpbmRlcGVuZGVudCBvZiB0aGUgcHJpb3Ig
Y29uZmlndXJhdGlvbiB5b3UgYmV0dGVyIHVzZQogfCB0aGUgcmVhbCB0YXJnZXRlZCBwZXJpb2Qg
bGVuZ3RoIGFzIGlucHV0IGluc3RlYWQgb2YgdGhlIGxhc3QgY29uZmlndXJlZAogfCBhcHByb3hp
bWF0aW9uCkkgd2lsbCBpbnRyb2R1Y2UgYXBwcm94X3BlcmlvZCBmZWlsZCwgd2hpY2ggd2lsbCBi
ZSB1c2VkIGFzIHRoZQp0YXJnZXRlZCBwZXJpb2QgbGVuZ3RoLgpBbHNvLCBpbiBwd21fc2lmaXZl
X2dldF9zdGF0ZSwgSSB3aWxsIG1ha2UgYmVsb3cgY2hhbmdlCi0gc3RhdGUtPnBlcmlvZCA9IHB3
bS0+cmVhbF9wZXJpb2Q7Cisgc3RhdGUtPnBlcmlvZCA9IHB3bS0+YXBwcm94X3BlcmlvZC4KU28g
d2l0aCB0aGlzIGNoYW5nZSBpbiBwbGFjZSwgSSBiZWxpZXZlIHRoZSBjdXJfc3RhdGUucGVyaW9k
IGZvciB0aGUKc2Vjb25kIHB3bV9hcHBseV9zdGF0ZSgpIGFib3ZlIChwd20yKSB3aWxsIGJlIGV4
YWN0bHkgMTAwMDAwMDAKCj4gPiA+ID4gKyAgICAgeCA9IDFVIDw8IFBXTV9TSUZJVkVfQ01QV0lE
VEg7Cj4gPiA+ID4gKyAgICAgbnVtID0gKHU2NClkdXR5X2N5Y2xlICogeCArIHggLyAyOwo+ID4g
PiA+ICsgICAgIGZyYWMgPSBkaXZfdTY0KG51bSwgc3RhdGUtPnBlcmlvZCk7Cj4gPiA+Cj4gPiA+
IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgIisgeCAvIDIiIHBhcnQuIFNob3VsZCB0aGlzIGJldHRl
ciBiZQo+ID4gPiAiKyBzdGF0ZS0+cGVyaW9kIC8gMiI/IFNvbWV0aGluZyBsaWtlCj4gPgo+ID4g
VGhpcyBlcW4gaXMgYXMgcGVyIHlvdXIgY29tbWVudHMgYWdhaW5zdCB2NSBvZiB0aGlzIHBhdGNo
IHNlcmllcy4KPiA+ICBmcmFjID0gKGR1dHlfY3ljbGUgKiAoMSA8PCBQV01fU0lGSVZFX0NNUFdJ
RFRIKSArICgxIDw8Cj4gPiBQV01fU0lGSVZFX0NNUFdJRFRIKSAvIDIpIC8gcGVyaW9kOwo+Cj4g
T0ssIHRoZW4gbm90IG9ubHkgdGhlIGNvZGUgaXMgd3JvbmcsIGJ1dCBhbHNvIG15IHN1Z2dlc3Rp
b24gd2FzLiA6LSkKPgo+ID4gPiAjZGVmaW5lIGRpdl91NjRfcm91bmQoYSwgYikgKHt0eXBlb2Yo
YikgX19iID0gYjsgZGl2X3U2NChhICsgX19iIC8gMiwgX19iKX0pCj4gPiA+Cj4gPiA+IHdvdWxk
IG1ha2UgdGhpcyBsZXNzIGVycm9yIHByb25lLgo+Cj4gVGhpcyBzdGlsbCBzdGFuZHMuIEl0IG1h
a2VzIGl0IGVhc2llciB0byBnZXQgdGhlIGNvZGUgcmlnaHQgYW5kIG1ha2VzIGl0Cj4gZWFzaWVy
IHRvIHVuZGVyc3RhbmQuCgpTdXJlLCB3aWxsIGltcGxlbWVudCB0aGlzLgoKPgo+IEJlc3QgcmVn
YXJkcwo+IFV3ZQo+Cj4gLS0KPiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCBVd2UgS2xlaW5lLUvDtm5pZyAgICAgICAgICAgIHwKPiBJbmR1c3RyaWFsIExpbnV4
IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAgfCBodHRwOi8vd3d3LnBlbmd1dHJvbml4LmRlLyAg
fAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
