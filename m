Return-Path: <SRS0=S271=QN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B3BC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 10:49:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66710217F9
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 10:49:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aHBgLihl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CA4V+avY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66710217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YiI3V4PPp2XeuPObOIWx2xiwieykogESvowYg9OmWZI=; b=aHBgLihlK/zEVW
	8v9GBMmfq9Gkq4RA39wxl6j2PIzo6udrodmkamNH1ZBGPmE5k21vf6YHPfL1hXAXEf8JNTwh76P50
	3i4HhNJoBZ58U+PsdWbzA2mJteGy19dt2B5p7R7DfI55TXAx4EQIcLa5g5uo8AhOCxbduI8vYJnD1
	b9scEtyibJNNJMvJl+YYsTgOGVT1YeIsCeaQaQP9JrmZxHyk1nijReQ3ymzQvjHLsLeIC+MFmbqMI
	KF/vI0pO8RIGE3R+Ej2JpXvC76Rcosndjd1kiTTaHDGT3/D7GVSOMLnYigOk8EHm7xrnBeeYwsZ5O
	vyWXtMiZReW/+LToGQMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grKlk-0006p1-T9; Wed, 06 Feb 2019 10:49:28 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grKli-0006oZ-6F
 for linux-riscv@lists.infradead.org; Wed, 06 Feb 2019 10:49:27 +0000
Received: by mail-lf1-x144.google.com with SMTP id v5so4977612lfe.7
 for <linux-riscv@lists.infradead.org>; Wed, 06 Feb 2019 02:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1LMen8wTwY4yhWXGiMwywfKz0XY14FbbWinez9Hg6fg=;
 b=CA4V+avY2jaK5sTlGVIXKUl5CEV7OEsua2RvFxjm0TscZDYkE8mMXeEBhpZPM7Ue19
 QE4gNtVix+Qd0188wwomyPJp/gozn3WQB/HBYeYkoo6iTYZL26AOfwJbSMBlTtUjP3ya
 0MxeixPzH9k/+zTQeIp8Ok1doKU1zvlgGcTTgFVXBp7NmPmXtq/Wjb3L2vpt0jyeLXpT
 aP9UrfuuE2T3VklU75jY7QcxZVaq40lASZQ5pgXjl9XD6so52/BcS3S+M3bmyjwWFOyX
 Gb935135VQ/gkykiGWblTM5oushEQsAIWKIl0OIPt6TCe9lKbNCT8mEA6jdyQPxTSkQm
 IWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1LMen8wTwY4yhWXGiMwywfKz0XY14FbbWinez9Hg6fg=;
 b=rwf0fmVItYDn9N7JLh2BDG+0QQJY+/c5MG5GeUyBFlNP2Anc//oSTeBDKzTxIo+gzN
 5JTpE18Qh7ATkSItd166jvc7ZAEY29+HakkiWS6JRaGVFDZPTJvX5O74D/a/lBwMIoqY
 tvpoo59gRAMKQYeXLFXOtHX7MsBjoArMOo5QvRSCksF0lUs69qG1+Bx2GL15Djj2NxlP
 nzgBC8QlGFFwNY0212tsoRVmKOAbQOnHzdYNwqAWfDkbESL2yQJH9ETBZJDlCovC5Xt5
 dM4qkXlSLLC7VDj92q45XgROMesLT7/xzYFWqml4WKAxY3awZIq0khFfH6D8C3ULXz4E
 r5sQ==
X-Gm-Message-State: AHQUAuYT9Ks1johVOSoXpSKTg5WRQU207eoSxLAIBt333o+i3xC0cOzm
 p1l87Lw8azmySYiL4smlk9v3elGZCO+e5ceUK4dc0A==
X-Google-Smtp-Source: AHgI3IY3PEh/QNdiO+YB9WoO86tBF4SVaF7MbPvjb2iV8iivqhd7AoPIGoqRdsUvuwcHTYXC415JIoyAUpm7fFPXC/A=
X-Received: by 2002:ac2:42c5:: with SMTP id n5mr6033720lfl.115.1549450163444; 
 Wed, 06 Feb 2019 02:49:23 -0800 (PST)
MIME-Version: 1.0
References: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
 <1548762199-7065-2-git-send-email-yash.shah@sifive.com>
 <20190130081411.5rva7cpwoy2l5qjd@pengutronix.de>
In-Reply-To: <20190130081411.5rva7cpwoy2l5qjd@pengutronix.de>
From: Yash Shah <yash.shah@sifive.com>
Date: Wed, 6 Feb 2019 16:18:47 +0530
Message-ID: <CAJ2_jOHiJ3X5VYZMCNk2bpvUdDOsrqHJna3HPvtdNQpJB9fxjg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_024926_239317_41971F87 
X-CRM114-Status: GOOD (  19.95  )
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
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMzAsIDIwMTkgYXQgMTo0NCBQTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgSmFuIDI5LCAyMDE5
IGF0IDA1OjEzOjE4UE0gKzA1MzAsIFlhc2ggU2hhaCB3cm90ZToKPiA+IERUIGRvY3VtZW50YXRp
b24gZm9yIFBXTSBjb250cm9sbGVyIGFkZGVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFdlc2xl
eSBXLiBUZXJwc3RyYSA8d2VzbGV5QHNpZml2ZS5jb20+Cj4gPiBbQXRpc2g6IENvbXBhdGlibGUg
c3RyaW5nIHVwZGF0ZV0KPiA+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRy
YUB3ZGMuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogWWFzaCBTaGFoIDx5YXNoLnNoYWhAc2lmaXZl
LmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tc2lmaXZl
LnR4dCAgICAgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAzMyBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLXNpZml2ZS50eHQKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tc2lmaXZlLnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLXNpZml2ZS50eHQK
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwLi44ZGNiNDBkCj4gPiAt
LS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cHdtL3B3bS1zaWZpdmUudHh0Cj4gPiBAQCAtMCwwICsxLDMzIEBACj4gPiArU2lGaXZlIFBXTSBj
b250cm9sbGVyCj4gPiArCj4gPiArVW5saWtlIG1vc3Qgb3RoZXIgUFdNIGNvbnRyb2xsZXJzLCB0
aGUgU2lGaXZlIFBXTSBjb250cm9sbGVyIGN1cnJlbnRseSBvbmx5Cj4gPiArc3VwcG9ydHMgb25l
IHBlcmlvZCBmb3IgYWxsIGNoYW5uZWxzIGluIHRoZSBQV00uIFRoaXMgaXMgc2V0IGdsb2JhbGx5
IGluIERUUy4KPgo+IFlvdSBjYW4gc2ltcGx5IGRyb3AgdGhpcyBpZiB0aGUgZmlyc3QgdXNlciBj
YW4gc2V0IHRoaXMgdXNpbmcgdGhlIHVzdWFsCj4gaW50ZXJmYWNlLiBEb24ndCB5b3UgbGlrZSB0
aGlzIHN1Z2dlc3Rpb24gdGhhdCBJIGFscmVhZHkgbWFkZSBhIGZldwo+IHRpbWVzIG5vdz8KPgo+
IERpZCB5b3UgY29uc2lkZXIgdG8gbWFrZSB0aGUgZHJpdmVyIHN1cHBvcnQgb25seSBhIHNpbmds
ZSBvdXRwdXQgd2l0aCBhCj4gbW9yZSBmbGV4aWJsZSBwZXJpb2Qgc2V0dGluZz8KCldlIGNhbm5v
dCBjb25zaWRlciBzdXBwb3J0aW5nIG9ubHkgc2luZ2xlIG91dHB1dCBzaW5jZSB3ZSBoYXZlIGJv
YXJkcyB0aGF0CnVzZSB0aGUgYWRkaXRpb25hbCBQV00gY2hhbm5lbHMgdG8gY29udHJvbCBpbmRp
dmlkdWFsIExFRCBicmlnaHRuZXNzCm9mIGEgdHJpLWNvbG9yIExFRC4KSWYgd2UgZ28gZG93biB0
byBvbmUgY2hhbm5lbCwgdGhlbiB3ZSBjYW4ndCBjb250cm9sIHRoZSBicmlnaHRuZXNzIG9mCnRo
ZSBpbmRpdmlkdWFsIExFRHMuCkl0IHdpbGwgYnJlYWsgdGhlIHVzZSBjYXNlLgoKSSBhbSBjb25z
aWRlcmluZyB0aGUgYmVsb3cgYXBwcm9hY2gsIGxldCBtZSBrbm93IGlmIGl0J3MgZmluZSBieSB5
b3UuCgotIERyb3AgdGhlIGdsb2JhbCBwZXJpb2QgcHJvcGVydHkgYW5kIGFsbG93IHRoZSBvbmx5
IGZpcnN0IHVzZXIgdG8gY2hhbmdlIHBlcmlvZAp1c2luZyB0aGUgdXN1YWwgaW50ZXJmYWNlLgot
IEEgbm90ZSBpbiB0aGUgYmluZGluZyB0aGF0IGFsbCBQV01zIG5lZWQgdG8gcnVuIGF0IHRoZSBz
YW1lCnBlcmlvZC4gSWYgdGhlIGRyaXZlciBhbHJlYWR5IHJlZnVzZXMgdG8gYXBwbHkgaW5jb21w
YXRpYmxlIHBlcmlvZHMsCnRoZSB1c2VycyBhcmUgZ29pbmcgdG8gbm90aWNlIHRoYXQgdGhleSd2
ZSBnb3QgdGhlIERUIHdyb25nLgotIEluIGRyaXZlciBjb2RlLCBjb3VudCB0aGUgdXNlcnMgdXNp
bmcgdGhlIC5yZXF1ZXN0IGFuZCAuZnJlZSBjYWxsYmFja3MuCkJhc2VkIG9uIHRoaXMsIGFsbG93
IGNoYW5nZXMgdG8gcGVyaW9kIGlmZiB0aGUgdXNlciBjb3VudCBpcyBvbmUuCgo+Cj4gPiArVGhl
IHBlcmlvZCBhbHNvIGhhcyBzaWduaWZpY2FudCByZXN0cmljdGlvbnMgb24gdGhlIHZhbHVlcyBp
dCBjYW4gYWNoaWV2ZSwKPiA+ICt3aGljaCB0aGUgZHJpdmVyIHJvdW5kcyB0byB0aGUgbmVhcmVz
dCBhY2hpZXZhYmxlIGZyZXF1ZW5jeS4KPgo+IFJvdW5kaW5nIGEgcGVyaW9kIHRvIGEgZnJlcXVl
bmN5IHNvdW5kcyB3cm9uZy4KPgo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+Cj4gLS0KPiBQZW5ndXRy
b25peCBlLksuICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBVd2UgS2xlaW5lLUvDtm5pZyAg
ICAgICAgICAgIHwKPiBJbmR1c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAg
fCBodHRwOi8vd3d3LnBlbmd1dHJvbml4LmRlLyAgfAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
