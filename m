Return-Path: <SRS0=RZUB=PM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2D3C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Jan 2019 05:10:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 893652087F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Jan 2019 05:10:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G6xX19tA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="U2OKvrFD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 893652087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJmPqNGZnMFKma4vsg9f6wx9cisvu6kS1SCe7K8qxNM=; b=G6xX19tALbxHr7
	mWP6ELC4aA4kJ8YRy5WODA+88xSaHs+wa//bpzJNgLb5oLdSUg+95Y56I2/jBpt1pRDxwT/snBK2x
	QhyqV8E9Oj3v54WABULyZ13EkntBR07T6tG1hQXsGkiRjagJx9/ViKlwJPjGWoQ7rsBIY4O5mlkjV
	pQFpHmqoDtWbZfTN5igMe0dg7UHAGVPODPI9tC7WhVQNZB/jsFZqN4bTGTrD+lq8jzTJ0NzReMTwa
	Gc52uUtblq0kgT4LhyA6DX0j8GAH32cAvWQ01M7+Zr6/xLbfZL/5m6GAXJx/A7UPqU84O531v/art
	FwYy16e7/EPGXvUVCkqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfHkB-0006KI-0g; Fri, 04 Jan 2019 05:10:03 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfHk8-0006E7-6b
 for linux-riscv@lists.infradead.org; Fri, 04 Jan 2019 05:10:01 +0000
Received: by mail-lj1-x243.google.com with SMTP id l15-v6so31502731lja.9
 for <linux-riscv@lists.infradead.org>; Thu, 03 Jan 2019 21:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OWbEwfPubjq0NaWWAxIQeAnQxn47xm0j0nxY5ZbcMH0=;
 b=U2OKvrFDbCh2BufZJKA7dzETG7GV7qnMAogiHwfSECrvA44C3wt+VzKcouhkef8HuX
 9gXA4fgHSFE9aGTmsjX8anV2LAGJziR6q0bv0AWMqoh+snLVtr8o/8CW5UxE8n6NmF/L
 83MwWdd8gCUMeobCl6GnWkKK1A/3C+fsc4pIaRrxrmtM3zQiVXWVS9CFTUr8VfE+x2j4
 JRzdU6R8iR/V5Kd0Mc0pjkGRKfUSjCVLgN/v3u+SavqTN8XWMfR+gGLNZdo/5LnMSL0H
 H7WJx1dXHN5804O4xPfbUlEvKu1+WBgU5j4O2yiBEFyjnyQz1zD0G6m+y7gPXvfImHOL
 X50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OWbEwfPubjq0NaWWAxIQeAnQxn47xm0j0nxY5ZbcMH0=;
 b=gdK6zfOkr1zYxTUnLihTZbeUNlyd9TYSxhxYlyt9i+YYjfuyvEWeO6G47uG3uUV0jy
 lM4XWXt7AOmtH7lMIj2Oo+Ld0fcBF0yCixixmXllxp5inVkCwRRMo+316lqewrilDgwf
 tbLFTFL6H5TDX4oSiaNKwSMfZ9rxieUvi5UhWUt+xkeMlwccH7FA4gTtd+HBBSaMmGb4
 Ojw8dVKwuMAMpq8n8hgb/lEUQivTxAUYZZIX/AQtOzCiHH4RhPnTISpNYHqn9+cIakbS
 6hbzj7Rxypnl5Fzh9RJidohEJyPrgl7qSWE1qWhbfmu4OXC//uind4H8eSZvtkhTIoP7
 tvgA==
X-Gm-Message-State: AJcUukcyNv7Bhqkaa6cD1FyJncPhpp/KOYgmX89xjeWM3+fPzSqtH88g
 hKe/73ziqsrmJWWAyTmcQ6aVyVDOaYrsp1xCtnn0Gg==
X-Google-Smtp-Source: ALg8bN4NX1q9qUFDJuRi1APhXoCbCHOOEDefs8t7aFX3ddJu5xWVbeWWV2/MnDcQMXltIY7TuVQ/1NRifcFSmOCiq50=
X-Received: by 2002:a2e:8786:: with SMTP id
 n6-v6mr18777732lji.100.1546578596992; 
 Thu, 03 Jan 2019 21:09:56 -0800 (PST)
MIME-Version: 1.0
References: <1544768442-12530-1-git-send-email-yash.shah@sifive.com>
 <1544768442-12530-2-git-send-email-yash.shah@sifive.com>
 <20181217211624.5sj4n6pyartnd3fc@pengutronix.de>
In-Reply-To: <20181217211624.5sj4n6pyartnd3fc@pengutronix.de>
From: Yash Shah <yash.shah@sifive.com>
Date: Fri, 4 Jan 2019 10:39:20 +0530
Message-ID: <CAJ2_jOGBK6OtXe0UO6nYc1KPDVi39NtD8f+hUkpxROhzukPw7w@mail.gmail.com>
Subject: Re: [RFC v2 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190103_211000_254624_1E0DF6DC 
X-CRM114-Status: GOOD (  21.52  )
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

T24gVHVlLCBEZWMgMTgsIDIwMTggYXQgMjo0NiBBTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIEZyaSwgRGVjIDE0LCAyMDE4
IGF0IDExOjUwOjQxQU0gKzA1MzAsIFlhc2ggU2hhaCB3cm90ZToKPiA+IERUIGRvY3VtZW50YXRp
b24gZm9yIFBXTSBjb250cm9sbGVyIGFkZGVkIHdpdGggdXBkYXRlZCBjb21wYXRpYmxlCj4gPiBz
dHJpbmcuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogV2VzbGV5IFcuIFRlcnBzdHJhIDx3ZXNsZXlA
c2lmaXZlLmNvbT4KPiA+IFtBdGlzaDogQ29tcGF0aWJsZSBzdHJpbmcgdXBkYXRlXQo+ID4gU2ln
bmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBZYXNoIFNoYWggPHlhc2guc2hhaEBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3B3bS1zaWZpdmUudHh0ICAgICAgICAgfCA0NCArKysr
KysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykK
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3B3bS9wd20tc2lmaXZlLnR4dAo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcHdtL3B3bS1zaWZpdmUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tc2lmaXZlLnR4dAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiA+IGluZGV4IDAwMDAwMDAuLjI1MGQ4ZWUKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLXNpZml2ZS50eHQKPiA+
IEBAIC0wLDAgKzEsNDQgQEAKPiA+ICtTaUZpdmUgUFdNIGNvbnRyb2xsZXIKPiA+ICsKPiA+ICtV
bmxpa2UgbW9zdCBvdGhlciBQV00gY29udHJvbGxlcnMsIHRoZSBTaUZpdmUgUFdNIGNvbnRyb2xs
ZXIgY3VycmVudGx5IG9ubHkKPiA+ICtzdXBwb3J0cyBvbmUgcGVyaW9kIGZvciBhbGwgY2hhbm5l
bHMgaW4gdGhlIFBXTS4gVGhpcyBpcyBzZXQgZ2xvYmFsbHkgaW4gRFRTLgo+ID4gK1RoZSBwZXJp
b2QgYWxzbyBoYXMgc2lnbmlmaWNhbnQgcmVzdHJpY3Rpb25zIG9uIHRoZSB2YWx1ZXMgaXQgY2Fu
IGFjaGlldmUsCj4gPiArd2hpY2ggdGhlIGRyaXZlciByb3VuZHMgdG8gdGhlIG5lYXJlc3QgYWNo
aWV2YWJsZSBmcmVxdWVuY3kuCj4gPiArCj4gPiArUmVxdWlyZWQgcHJvcGVydGllczoKPiA+ICst
IGNvbXBhdGlibGU6IHNob3VsZCBiZSBzb21ldGhpbmcgc2ltaWxhciB0byAic2lmaXZlLDxjaGlw
Pi1wd20iIGZvcgo+ID4gKyAgICAgICAgICAgdGhlIFBXTSBhcyBpbnRlZ3JhdGVkIG9uIGEgcGFy
dGljdWxhciBjaGlwLCBhbmQKPiA+ICsgICAgICAgICAgICJzaWZpdmUscHdtPHZlcnNpb24+IiBm
b3IgdGhlIGdlbmVyYWwgUFdNIElQIGJsb2NrCj4gPiArICAgICAgICAgICBwcm9ncmFtbWluZyBt
b2RlbC4gU3VwcG9ydGVkIGNvbXBhdGlibGUgc3RyaW5ncyBhcmU6Cj4gPiArICAgICAgICAgICAi
c2lmaXZlLGZ1NTQwLWMwMDAtcHdtIiBmb3IgdGhlIFNpRml2ZSBQV00gdjAgYXMKPiA+ICsgICAg
ICAgICAgIGludGVncmF0ZWQgb250byB0aGUgU2lGaXZlIEZVNTQwIGNoaXAsIGFuZCAic2lmaXZl
LHB3bTAiCj4gPiArICAgICAgICAgICBmb3IgdGhlIFNpRml2ZSBQV00gdjAgSVAgYmxvY2sgd2l0
aCBubyBjaGlwIGludGVncmF0aW9uCj4gPiArICAgICAgICAgICB0d2Vha3MuCj4gPiArLSByZWc6
IHBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBjb250cm9sbGVyJ3MgcmVn
aXN0ZXJzCj4gPiArLSBjbG9ja3M6IFRoZSBmcmVxdWVuY3kgdGhlIGNvbnRyb2xsZXIgcnVucyBh
dAo+Cj4gVGhpcyBpcyB1bnVzdWFsIGFuZCB0aGUgZXhhbXBsZSBiZWxvdyBsaXN0cyBhIGNsb2Nr
IHBoYW5kbGUgKHdoaWNoIGlzCj4gdGhlIGNvbW1vbiB0aGluZyksIHNvIEkgZ3Vlc3MgdGhlIGRl
c2NyaXB0aW9uIGlzIGp1c3Qgd3JvbmcuCgpZb3UgYXJlIHJpZ2h0LCBJIHdpbGwgY29ycmVjdCB0
aGUgZGVzY3JpcHRpb24uCgo+Cj4gPiArLSAjcHdtLWNlbGxzOiBTaG91bGQgYmUgMi4KPiA+ICsg
IFRoZSBmaXJzdCBjZWxsIGlzIHRoZSBQV00gY2hhbm5lbCBudW1iZXIKPiA+ICsgIFRoZSBzZWNv
bmQgY2VsbCBpcyB0aGUgUFdNIHBvbGFyaXR5Cj4gPiArLSBzaWZpdmUsYXBwcm94LXBlcmlvZDog
dGhlIGRyaXZlciB3aWxsIGdldCBhcyBjbG9zZSB0byB0aGlzIHBlcmlvZCBhcyBpdCBjYW4KPgo+
IFdoYXQgaXMgdGhlIHVuaXQ/IEknZCBkcm9wICJhcHByb3giLCB0aGF0IHRoZSBkcml2ZXIgbWln
aHQgbm90IGJlIGFibGUKPiB0byBleGFjdGx5IGhpdCB0aGUgc3BlY2lmaWVkIHBlcmlvZCBpcyAo
SU1ITykgb2J2aW91cyBhbmQgZG9lc24ndCBuZWVkCj4gdG8gYmUgbWVudGlvbmVkIGluIHRoZSBw
cm9wZXJ0eSBuYW1lLgoKVGhlIHVuaXQgaXMgbmFub3NlY29uZHMuIFdpbGwgYWRkIHRoZSB1bml0
IHN1ZmZpeCB0byB0aGUgcHJvcGVydHkgbmFtZS4KCj4KPiA+ICstIGludGVycnVwdHM6IG9uZSBp
bnRlcnJ1cHQgcGVyIFBXTSBjaGFubmVsCj4gPiArCj4gPiArUFdNIFJUTCB0aGF0IGNvcnJlc3Bv
bmRzIHRvIHRoZSBJUCBibG9jayB2ZXJzaW9uIG51bWJlcnMgY2FuIGJlIGZvdW5kCj4gPiAraGVy
ZToKPiA+ICsKPiA+ICtodHRwczovL2dpdGh1Yi5jb20vc2lmaXZlL3NpZml2ZS1ibG9ja3MvdHJl
ZS9tYXN0ZXIvc3JjL21haW4vc2NhbGEvZGV2aWNlcy9wd20KPiA+ICsKPiA+ICtGdXJ0aGVyIGlu
Zm9ybWF0aW9uIG9uIHRoZSBmb3JtYXQgb2YgdGhlIElQCj4gPiArYmxvY2stc3BlY2lmaWMgdmVy
c2lvbiBudW1iZXJzIGNhbiBiZSBmb3VuZCBpbgo+ID4gK0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zaWZpdmUvc2lmaXZlLWJsb2Nrcy1pcC12ZXJzaW9uaW5nLnR4dAo+ID4gKwo+
ID4gK0V4YW1wbGVzOgo+ID4gKwo+ID4gK3B3bTogIHB3bUAxMDAyMDAwMCB7Cj4gPiArICAgICBj
b21wYXRpYmxlID0gInNpZml2ZSxmdTU0MC1jMDAwLXB3bSIsInNpZml2ZSxwd20wIjsKPiA+ICsg
ICAgIHJlZyA9IDwweDAgMHgxMDAyMDAwMCAweDAgMHgxMDAwPjsKPiA+ICsgICAgIGNsb2NrcyA9
IDwmdGxjbGs+Owo+ID4gKyAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmcGxpYz47Cj4gPiArICAg
ICBpbnRlcnJ1cHRzID0gPDQyIDQzIDQ0IDQ1PjsKPiA+ICsgICAgICNwd20tY2VsbHMgPSA8Mj47
Cj4gPiArICAgICBzaWZpdmUsYXBwcm94LXBlcmlvZCA9IDwxMDAwMDAwPjsKPiA+ICt9Owo+Cj4g
QmVzdCByZWdhcmRzCj4gVXdlCgpUaGFua3MgZm9yIHRoZSBjb21tZW50cyEKCj4KPiAtLQo+IFBl
bmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBLbGVpbmUtS8O2
bmlnICAgICAgICAgICAgfAo+IEluZHVzdHJpYWwgTGludXggU29sdXRpb25zICAgICAgICAgICAg
ICAgICB8IGh0dHA6Ly93d3cucGVuZ3V0cm9uaXguZGUvICB8CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
