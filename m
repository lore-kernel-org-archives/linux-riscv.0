Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACDEC47DDF
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 08:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tqyjwcj867KPI569QtLp8dS1zf7f6x5AiakpcxJMd3A=; b=NM6I19S0gUITR+
	CZD8qg/w9nK7Orf48kWoxgdvzrcXeReQDWzgZF3CU5RlFHmbtuN1uJr40pB/njvGtFL0ZkMyaepVg
	BY7Yi3j6Mj8xPYxxrEhz6Uyvp/VB517tI5UlpR2PS4WNrb74oSNDH/tPHt4fkcsyLxD2B/ZNlzZom
	GOOT2xJaxy2oxx/v+PS7Wawwet3lWvtnPnRKCMxRORdE9mrITpepOEnp0qVu+1y7E1R9jYsjEzJqL
	DZFXRMpa4E3s7V0hOY8s/jhv/5b6bpiX3l8kCSyW4ueY5H0GtKYof9v2JwqPWPx5d/bkAIvpIjzBo
	2hn+7LpgAyor0+rEO4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSfV-0000000784X-09gn;
	Thu, 01 Feb 2024 08:43:33 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSfS-0000000783e-2HTw
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 08:43:31 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7bc32b0fdadso28745939f.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 00:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1706777008; x=1707381808; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ao4eLU5tdpHEycqvq3kREW2Bipgab7R6ZJUONGAvtxk=;
        b=gPZGKa/D++xWkKyMMN2TSeUQCGarcXfiGxYwAXfnmZAuyZufXogFRm5b0fSJnYB5AZ
         4+zSphyV0/B/6jI9uDCgGqn8UmzVxDyh05DmgcsaFsRutJ0w7Ev9mzCY96tC2fU+SnCg
         Z+m7NDnM8uli9R+cr4baf7bB/BuTulzUPYcdaZRPHVd6YQdiqxxsDy1c6bGWYMoQ1f1g
         cpT+ZyK63TfkqVbfUv6DM3emR0q7UOXPxinf1bLW6/Uc2NlRzLR7H21xOngLVBJWeL2v
         O/2nLgj4Qax6roz76H/POwtmKifnUb6aMHErF2qvH8NGXWi5PLC5WQ0Uo46ey1K23Qy0
         OzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706777008; x=1707381808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ao4eLU5tdpHEycqvq3kREW2Bipgab7R6ZJUONGAvtxk=;
        b=SKepk6g7z3Mm7HM8v804VTpCfgKpXRchrbwQmB1NO20D61w6xOHfNpiOirLEe+TbO5
         QDM+5cIifwK2Qw+Sq7NqO4jy8Hihz7gLLP80UGLuBmUe8mDgf5tTWqfy/BZxPRyTKXcI
         I+T8rvXg/k22Fkn1WW+8JiCMlLq1SJn4Ek494wmMWvpo3wSI+9UJLIDZmnJihvCss50O
         kV3/+CrPXEeeH+LQZAfimVCE8tze2KEQItWCaz+AIrOBItwv+03l+SWZqieYZROllWOI
         07+bZ6rSO2PiBwS26KAw65N+WekZ+ggCNYOVhMC5APHwAfnk356hEIoPI4gISwfL1ym0
         b6Mw==
X-Gm-Message-State: AOJu0YxEx5aeDMyCi3QDZ5CSK2PXuyPbqgN1veO0nIaMUkJktDQspO+C
	wewxazdCmKiH1fiB7yYULBF17unJNI5I2Cor9J756eT7MuaPHar0LIxWrUtKN4GdsbtwCiGxZl7
	EWtv5fJV71xzSEiofPspgpFvgYWYxq2RLFSyR6w==
X-Google-Smtp-Source: AGHT+IHBzPPfuPk7WAEZLvLmarQrhiLi8C68HmDuy98JSViVi9R3hkGEt5C9YikDQVvMEz5qfy2pE+Jb/kaAS9dUBag=
X-Received: by 2002:a05:6602:17c5:b0:7c0:31a7:a755 with SMTP id
 z5-20020a05660217c500b007c031a7a755mr526890iox.8.1706777008498; Thu, 01 Feb
 2024 00:43:28 -0800 (PST)
MIME-Version: 1.0
References: <20231205085959.32177-1-zong.li@sifive.com> <139cdbd6-73d9-4452-94ce-825689b7c0c8@ghiti.fr>
In-Reply-To: <139cdbd6-73d9-4452-94ce-825689b7c0c8@ghiti.fr>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 1 Feb 2024 16:43:17 +0800
Message-ID: <CANXhq0oA7LsKev+5gZCtNzCJ64RVOyimM1yQnY0kqs22VE6S4A@mail.gmail.com>
Subject: Re: [PATCH] riscv: add CALLER_ADDRx support
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_004330_618361_0A331B72 
X-CRM114-Status: GOOD (  38.43  )
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

T24gVGh1LCBGZWIgMSwgMjAyNCBhdCAxOjEw4oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdo
aXRpLmZyPiB3cm90ZToKPgo+IE9uIDA1LzEyLzIwMjMgMDk6NTksIFpvbmcgTGkgd3JvdGU6Cj4g
PiBDQUxMRVJfQUREUnggcmV0dXJucyBjYWxsZXIncyBhZGRyZXNzIGF0IHNwZWNpZmllZCBsZXZl
bCwgdGhleSBhcmUgdXNlZAo+ID4gZm9yIHNldmVyYWwgdHJhY2Vycy4gVGhlc2UgbWFjcm9zIGV2
ZW50dWFsbHkgdXNlCj4gPiBfX2J1aWx0aW5fcmV0dXJuX2FkZHJlc3MobikgdG8gZ2V0IHRoZSBj
YWxsZXIncyBhZGRyZXNzIGlmIGFyY2ggZG9lc24ndAo+ID4gZGVmaW5lIHRoZWlyIG93biBpbXBs
ZW1lbnRhdGlvbi4KPiA+Cj4gPiBJbiBSSVNDLVYsIF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcyhu
KSBvbmx5IHdvcmtzIHdoZW4gbiA9PSAwLCB3ZSBuZWVkCj4gPiB0byB3YWxrIHRoZSBzdGFjayBm
cmFtZSB0byBnZXQgdGhlIGNhbGxlcidzIGFkZHJlc3MgYXQgc3BlY2lmaWVkIGxldmVsLgo+Cj4K
PiBJcyB0aGF0IGEgYnVnIGluIGdjYyBvciBzb21ldGhpbmcgZXhwZWN0ZWQgZm9yIHJpc2N2IGlu
IGdlbmVyYWw/Cj4KCkkgdGhpbmsgaXQgaXNuJ3Qgc3VwcG9ydGVkIGZvciByaXNjdiBpbiBnZW5l
cmFsLgoKPgo+ID4KPiA+IGRhdGEubGV2ZWwgc3RhcnRlZCBmcm9tICdsZXZlbCArIDMnIGR1ZSB0
byB0aGUgY2FsbCBmbG93IG9mIGdldHRpbmcKPiA+IGNhbGxlcidzIGFkZHJlc3MgaW4gUklTQy1W
IGltcGxlbWVudGF0aW9uLiBJZiB3ZSBkb24ndCBoYXZlIGFkZGl0aW9uYWwKPiA+IHRocmVlIGl0
ZXJhdGlvbiwgdGhlIGxldmVsIGlzIGNvcnJlc3BvbmRpbmcgdG8gZm9sbG93czoKPiA+Cj4gPiBj
YWxsc2l0ZSAtPiByZXR1cm5fYWRkcmVzcyAtPiBhcmNoX3N0YWNrX3dhbGsgLT4gd2Fsa19zdGFj
a2ZyYW1lCj4gPiB8ICAgICAgICAgICB8ICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAg
ICAgfAo+ID4gbGV2ZWwgMyAgICAgbGV2ZWwgMiAgICAgICAgICAgbGV2ZWwgMSAgICAgICAgICAg
IGxldmVsIDAKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5j
b20+Cj4gPiAtLS0KPiA+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaCAgICB8ICA1
ICsrKysKPiA+ICAgYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgICAgICB8ICAyICsrCj4g
PiAgIGFyY2gvcmlzY3Yva2VybmVsL3JldHVybl9hZGRyZXNzLmMgfCA0OCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCsp
Cj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9yZXR1cm5fYWRkcmVz
cy5jCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gPiBpbmRleCAyYjJmNWRmN2VmMmMu
LjQyNzc3ZjkxYTljNSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRy
YWNlLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPiA+IEBAIC0y
NSw2ICsyNSwxMSBAQAo+ID4KPiA+ICAgI2RlZmluZSBBUkNIX1NVUFBPUlRTX0ZUUkFDRV9PUFMg
MQo+ID4gICAjaWZuZGVmIF9fQVNTRU1CTFlfXwo+ID4gKwo+ID4gK2V4dGVybiB2b2lkICpyZXR1
cm5fYWRkcmVzcyh1bnNpZ25lZCBpbnQgbGV2ZWwpOwo+ID4gKwo+ID4gKyNkZWZpbmUgZnRyYWNl
X3JldHVybl9hZGRyZXNzKG4pIHJldHVybl9hZGRyZXNzKG4pCj4gPiArCj4gPiAgIHZvaWQgTUNP
VU5UX05BTUUodm9pZCk7Cj4gPiAgIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBmdHJhY2Vf
Y2FsbF9hZGp1c3QodW5zaWduZWQgbG9uZyBhZGRyKQo+ID4gICB7Cj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQo+
ID4gaW5kZXggZmVlMjJhM2QxYjUzLi40MGQwNTQ5MzlhZTIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZp
bGUKPiA+IEBAIC03LDYgKzcsNyBAQCBpZmRlZiBDT05GSUdfRlRSQUNFCj4gPiAgIENGTEFHU19S
RU1PVkVfZnRyYWNlLm8gICAgICA9ICQoQ0NfRkxBR1NfRlRSQUNFKQo+ID4gICBDRkxBR1NfUkVN
T1ZFX3BhdGNoLm8gICAgICAgPSAkKENDX0ZMQUdTX0ZUUkFDRSkKPiA+ICAgQ0ZMQUdTX1JFTU9W
RV9zYmkubyA9ICQoQ0NfRkxBR1NfRlRSQUNFKQo+ID4gK0NGTEFHU19SRU1PVkVfcmV0dXJuX2Fk
ZHJlc3MubyAgICAgICA9ICQoQ0NfRkxBR1NfRlRSQUNFKQo+ID4gICBlbmRpZgo+ID4gICBDRkxB
R1Nfc3lzY2FsbF90YWJsZS5vICAgICAgKz0gJChjYWxsIGNjLW9wdGlvbiwtV25vLW92ZXJyaWRl
LWluaXQsKQo+ID4gICBDRkxBR1NfY29tcGF0X3N5c2NhbGxfdGFibGUubyArPSAkKGNhbGwgY2Mt
b3B0aW9uLC1Xbm8tb3ZlcnJpZGUtaW5pdCwpCj4gPiBAQCAtNDYsNiArNDcsNyBAQCBvYmoteSAg
ICAgICArPSBpcnEubwo+ID4gICBvYmoteSAgICAgICArPSBwcm9jZXNzLm8KPiA+ICAgb2JqLXkg
ICAgICAgKz0gcHRyYWNlLm8KPiA+ICAgb2JqLXkgICAgICAgKz0gcmVzZXQubwo+ID4gK29iai15
ICAgICAgICArPSByZXR1cm5fYWRkcmVzcy5vCj4gPiAgIG9iai15ICAgICAgICs9IHNldHVwLm8K
PiA+ICAgb2JqLXkgICAgICAgKz0gc2lnbmFsLm8KPiA+ICAgb2JqLXkgICAgICAgKz0gc3lzY2Fs
bF90YWJsZS5vCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcmV0dXJuX2FkZHJl
c3MuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3JldHVybl9hZGRyZXNzLmMKPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmMyMDA4ZDRhYTZlNQo+ID4gLS0tIC9k
ZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcmV0dXJuX2FkZHJlc3MuYwo+ID4g
QEAgLTAsMCArMSw0OCBAQAo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9ubHkKPiA+ICsvKgo+ID4gKyAqIFRoaXMgY29kZSBjb21lIGZyb20gYXJjaC9hcm02NC9rZXJu
ZWwvcmV0dXJuX2FkZHJlc3MuYwo+ID4gKyAqCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIzIFNp
Rml2ZS4KPiA+ICsgKi8KPiA+ICsKPiA+ICsjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+Cj4gPiAr
I2luY2x1ZGUgPGxpbnV4L2twcm9iZXMuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvc3RhY2t0cmFj
ZS5oPgo+ID4gKwo+ID4gK3N0cnVjdCByZXR1cm5fYWRkcmVzc19kYXRhIHsKPiA+ICsgICAgIHVu
c2lnbmVkIGludCBsZXZlbDsKPiA+ICsgICAgIHZvaWQgKmFkZHI7Cj4gPiArfTsKPiA+ICsKPiA+
ICtzdGF0aWMgYm9vbCBzYXZlX3JldHVybl9hZGRyKHZvaWQgKmQsIHVuc2lnbmVkIGxvbmcgcGMp
Cj4gPiArewo+ID4gKyAgICAgc3RydWN0IHJldHVybl9hZGRyZXNzX2RhdGEgKmRhdGEgPSBkOwo+
ID4gKwo+ID4gKyAgICAgaWYgKCFkYXRhLT5sZXZlbCkgewo+ID4gKyAgICAgICAgICAgICBkYXRh
LT5hZGRyID0gKHZvaWQgKilwYzsKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4g
KyAgICAgfQo+ID4gKwo+ID4gKyAgICAgLS1kYXRhLT5sZXZlbDsKPiA+ICsKPiA+ICsgICAgIHJl
dHVybiB0cnVlOwo+ID4gK30KPiA+ICtOT0tQUk9CRV9TWU1CT0woc2F2ZV9yZXR1cm5fYWRkcik7
Cj4gPiArCj4gPiArdm9pZCAqcmV0dXJuX2FkZHJlc3ModW5zaWduZWQgaW50IGxldmVsKQo+Cj4K
PiBNYXliZSByZXR1cm5fYWRkcmVzcygpIHNob3VsZCBiZSBub2lubGluZSB0byBtYWtlIHN1cmUg
aXQncyBub3QgaW5saW5lZAo+IGFzIGl0IHdvdWxkIGJyZWFrIHRoZSAiKyAzIj8gTm90IHN1cmUg
aXQncyBuZWNlc3NhcnkgdGhvdWdoLgoKWWVzLCB0aGFua3MgZm9yIHBvaW50aW5nIGl0IG91dC4g
V2Ugc2hvdWxkIGVuc3VyZSBpdCdzIG5vdCBpbmxpbmVkIGluCmFueSBjYXNlLiBJIHdpbGwgc2Vu
ZCB0aGUgbmV4dCB2ZXJzaW9uLgoKPgo+Cj4gPiArewo+ID4gKyAgICAgc3RydWN0IHJldHVybl9h
ZGRyZXNzX2RhdGEgZGF0YTsKPiA+ICsKPiA+ICsgICAgIGRhdGEubGV2ZWwgPSBsZXZlbCArIDM7
Cj4gPiArICAgICBkYXRhLmFkZHIgPSBOVUxMOwo+ID4gKwo+ID4gKyAgICAgYXJjaF9zdGFja193
YWxrKHNhdmVfcmV0dXJuX2FkZHIsICZkYXRhLCBjdXJyZW50LCBOVUxMKTsKPiA+ICsKPiA+ICsg
ICAgIGlmICghZGF0YS5sZXZlbCkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGRhdGEuYWRkcjsK
PiA+ICsgICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiArCj4gPiAr
fQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKHJldHVybl9hZGRyZXNzKTsKPiA+ICtOT0tQUk9CRV9T
WU1CT0wocmV0dXJuX2FkZHJlc3MpOwo+Cj4KPiBBbmQgSSBzZWUgdGhhdCB3aXRoIHRoaXMgcGF0
Y2gsIGZ0cmFjZV9yZXR1cm5fYWRkcmVzcygpIGlzIG5vdyBkZWZpbmVkCj4gd2hldGhlciBDT05G
SUdfRlJBTUVfUE9JTlRFUiBpcyBzZXQgb3Igbm90LCBpcyB0aGF0IGNvcnJlY3Q/CgpZZXMsIHRo
YXQgaXMgd2hhdCBJIHVuZGVyc3RhbmQuIEluIHRoaXMgcGF0Y2gsIHRoZQpmdHJhY2VfcmV0dXJu
X2FkZHJlc3MoKSBpcyBzdGlsbCBkZWZpbmVkIHRvIHJldHVybl9hZGRyZXNzKCkgd2hlbgpDT05G
SUdfRlJBTUVfUE9JTlRFUiBpc24ndCBlbmFibGVkLCBhbmQgcmV0dXJuX2FkZHJlc3Mgc3RpbGwg
d29ya3MKYmVjYXVzZSByaXNjdiBwb3J0IGNhbiB3YWxrIHN0YWNrZnJhbWUgd2l0aG91dCBmcC4K
Cj4KPiBUaGlzIGxvb2tzIGxpa2UgYSBmaXggdG8gbWUgc28gdGhhdCBzaG91bGQgZ28gaW50byAt
Zml4ZXMgd2l0aCBhIEZpeGVzCj4gdGFnIChidXQgd2UnbGwgaGF2ZSB0byBtYWtlIHN1cmUgdGhh
dCB0aGUgIisgMyIgaXMgY29ycmVjdCBvbiBhbGwKPiBiYWNrcG9ydHMuLi4pOgo+Cj4gRml4ZXM6
IDEwNjI2YzMyZTM4MiAoInJpc2N2L2Z0cmFjZTogQWRkIGJhc2ljIHN1cHBvcnQiKQoKVGhlIHJl
dHVybl9hZGRyZXNzKCkgaW52b2tlcyBhcmNoX3N0YWNrX3dhbGsoKSwgd2hpY2ggZW5hYmxlZCBi
eSB0aGUKJzVjYjAwODBmMWJmZCAoInJpc2N2OiBFbmFibGUgQVJDSF9TVEFDS1dBTEsiKScKCkkg
Z3Vlc3MgdGhhdCB3ZSBhcmUgbm90IGFibGUgdG8gYXBwbHkgaXQgb24gYWxsIGJhY2twb3J0cy4g
SXMgdGhpcwpyaWdodD8gIiszIiBpcyBjb3JyZWN0IGFmdGVyIGVuYWJsaW5nIEFSQ0hfU1RBQ0tX
QUxLLgoKPgo+IEFuZCB5b3UgY2FuIGZpbmFsbHkgYWRkIGZvciB5b3VyIHYyIChvciBub3QgaWYg
eW91IGRvbid0IHJlc3Bpbik6Cj4KPiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4
Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LCBBbGV4YW5kcmUuIEkg
d2lsbCBhZGQgaXQgaW4gdjI6KQoKPgo+IFRoYW5rcyBhbmQgc29ycnkgZm9yIHRoZSBkZWxheSEK
Pgo+IEFsZXgKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
