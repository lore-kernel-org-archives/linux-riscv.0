Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6058AC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 10:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rVWsDzXtg3WrezH6AO9NQ1XKGBQIrxS4VcIEMU1s1Y=; b=e1qMa5mvo2s8oM
	vjQeJgtc/pot/NpTy8IQeshTs0nYDWVBqkRfxSQFZEu0+la5h+lvAoXd0LjPwpFV90v0JktM8/pTQ
	q8kAkNrmqdhSzdn8c+rLdjmELtwsP0zMm8R0sNNG/4ZBGk77OkwrBupuwmVkXNlyVHKv3/Xd0mCZ3
	kQMTQGqR+G0dYPJvEApDHoSIkR3lcReXdeG+yP4LtEDnC/kwkhCa+AR8xMAVPI9VIeW7NfGSR+3DV
	H0RSzNSKZ7dzPXJewIJ14d6cIZ2naE5hCohKmwYePr/QECmAa5u3CbcYqkj3SsJ02qp2YtapR2sBo
	abfwzkFftDmI4qbHzm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppRoA-007nQO-0G;
	Thu, 20 Apr 2023 10:46:34 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppRo6-007nN3-1L
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 10:46:32 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F3BBD4131F
	for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 10:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1681987588;
	bh=F3y8BN0jlMaf7/OefEZ2rjMsbi1pghhAI/wUe5Hh9AI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=no12jD7QtVp8Bwzu8I+pe6tt1FXahbR7q6zKQuZ3Ofq9xTu9N0gCArHN2tifxa2Ke
	 KvRnxKT/zJXPbbIVM+K3MzZaiDKXEZlfgl3A1Jq7oB8jAFJbFdSzNS410VBemri1wm
	 U5evEulrZy6s3/Gwd7hdsjuFx8hTmqla3VoG9o61InqVhhl1aRYJALCIW2f+kFJDpL
	 8TOn1ct8rgMPI57qOlnoZsOEw0Z+KCmr7Ihoq9P+rCzR2u+M3cGu/tG1GgcfLdqM5r
	 r109UntZkGlLNv6fwviJmH2u1Cp8Ta625baU1QUuieoaO2lDx9D+rFazea05o16irT
	 Etp9wJIu1kZeg==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-3ef25aaeb5bso3343191cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 03:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681987587; x=1684579587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3y8BN0jlMaf7/OefEZ2rjMsbi1pghhAI/wUe5Hh9AI=;
        b=GNoYxHsWNPjglJE1vqADkf9PPvQBabBCrf/N1ObYtDaimCW6dOpm/4zM6ovPyXwSZ5
         4lNhF8OPZ23JGY7/6axHgIp5ZVfv4mGYngJjUIYb4fOppcr3rPAlSjobDaTjgDDYCioZ
         QEFm5Nepo86o90eTk30CMfHDCi4TygF9ViGPDiED9qJno1ZkGCi7CRoLgp6ePnEc2wHJ
         DnB8UZeOp5Q6GaIZlo070O1zf8kpbFI7tZBjX5fgg9QLEYR1KNnejInTs+oipgBlXOwU
         kd0AIysByFZGXT+RZU+4Z5OpPrQKoEmtd/dKwYfJFNKrhqwmRWJkq0xN123VMY4ge7yz
         vDeA==
X-Gm-Message-State: AAQBX9c2TZ3DWgAtS5Cw9T3c7jt+O3sFDfGuPLz4R7m2XkKclwH0BS6e
	iC5H/NuW9Z4BblB5UWLp3AzZ1x4IzJKiSyVC04d1q8PZBVF+WzXEawf+rJj5n9sH58S/nJ8GPJu
	iwZOFYkZy4AseIdmoK+9SWZ3kGm76Jc11J3ZAd3gTo+Ji3p8krfKQnJrO/TFjYw==
X-Received: by 2002:a05:622a:170b:b0:3ef:484e:7973 with SMTP id h11-20020a05622a170b00b003ef484e7973mr1456676qtk.14.1681987586897;
        Thu, 20 Apr 2023 03:46:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350aPYR7Fs/UFZEmSN2soKoZh191KzwTCbW7h0Z/qNLwNI/EkX6rPG4MJfxnGXHnvGnaLWVGWBBsurS54hcEETGE=
X-Received: by 2002:a05:622a:170b:b0:3ef:484e:7973 with SMTP id
 h11-20020a05622a170b00b003ef484e7973mr1456646qtk.14.1681987586654; Thu, 20
 Apr 2023 03:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230420093457.18936-1-nylon.chen@sifive.com> <20230420093457.18936-3-nylon.chen@sifive.com>
 <CAJM55Z-smXpgL+QyTSeAWt=B-RS_qtbrFZtJpP-cQS0gsQnDSw@mail.gmail.com> <CAHh=Yk86AV542Y7wG6rkHTc4va1Gof3uXtj84zzK5m+khL_Aiw@mail.gmail.com>
In-Reply-To: <CAHh=Yk86AV542Y7wG6rkHTc4va1Gof3uXtj84zzK5m+khL_Aiw@mail.gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 20 Apr 2023 12:46:10 +0200
Message-ID: <CAJM55Z9TPVyJyWwWAS2FznSc8FvnR7qMxQ412eMzBkD=5abp6g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pwm: sifive: change the PWM controlled LED algorithm
To: Nylon Chen <nylon.chen@sifive.com>
Cc: aou@eecs.berkeley.edu, conor@kernel.org, geert+renesas@glider.be, 
	heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org, thierry.reding@gmail.com, 
	u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nylon7717@gmail.com, zong.li@sifive.com, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_034630_860117_4297B0C9 
X-CRM114-Status: GOOD (  29.61  )
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

T24gVGh1LCAyMCBBcHIgMjAyMyBhdCAxMjo0MSwgTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZp
dmUuY29tPiB3cm90ZToKPgo+IEhpLCBFbWlsCj4KPiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1p
bC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4g5pa8IDIwMjPlubQ05pyIMjDml6Ug6YCx
5ZubIOS4i+WNiDY6MDTlr6vpgZPvvJoKPiA+Cj4gPiBPbiBUaHUsIDIwIEFwciAyMDIzIGF0IDEx
OjM1LCBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4g
PiBUaGUgYGZyYWNgIHZhcmlhYmxlIHJlcHJlc2VudHMgdGhlIHB1bHNlIGluYWN0aXZlIHRpbWUs
IGFuZCB0aGUgcmVzdWx0IG9mCj4gPiA+IHRoaXMgYWxnb3JpdGhtIGlzIHRoZSBwdWxzZSBhY3Rp
dmUgdGltZS4gVGhlcmVmb3JlLCB3ZSBtdXN0IHJldmVyc2UgdGhlCj4gPiA+IHJlc3VsdC4KPiA+
ID4KPiA+ID4gVGhlIHJlZmVyZW5jZSBpcyBTaUZpdmUgRlU3NDAtQzAwMCBNYW51YWxbMF0KPiA+
ID4KPiA+ID4gTGluazogaHR0cHM6Ly9zaWZpdmUuY2RuLnByaXNtaWMuaW8vc2lmaXZlLzFhODJl
NjAwLTFmOTMtNGY0MS1iMmQ4LTg2ZWQ4YjE2YWNiYV9mdTc0MC1jMDAwLW1hbnVhbC12MXA2LnBk
ZiBbMF0KPiA+ID4KPiA+ID4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1p
Y3JvY2hpcC5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOeWxvbiBDaGVuIDxueWxvbi5j
aGVuQHNpZml2ZS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgQ2hlbiA8dmluY2Vu
dC5jaGVuQHNpZml2ZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9wd20vcHdtLXNpZml2
ZS5jIHwgOSArKysrKystLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20t
c2lmaXZlLmMgYi9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPiA+ID4gaW5kZXggMzkzYTRiOTdm
YzE5Li5kNWQ1ZjM2ZGEyOTcgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zaWZp
dmUuYwo+ID4gPiArKysgYi9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPiA+ID4gQEAgLTEzMiwx
MyArMTMyLDEzIEBAIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9hcHBseShzdHJ1Y3QgcHdtX2NoaXAg
KmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCj4gPiA+ICB7Cj4gPiA+ICAgICAgICAgc3Ry
dWN0IHB3bV9zaWZpdmVfZGRhdGEgKmRkYXRhID0gcHdtX3NpZml2ZV9jaGlwX3RvX2RkYXRhKGNo
aXApOwo+ID4gPiAgICAgICAgIHN0cnVjdCBwd21fc3RhdGUgY3VyX3N0YXRlOwo+ID4gPiAtICAg
ICAgIHVuc2lnbmVkIGludCBkdXR5X2N5Y2xlOwo+ID4gPiArICAgICAgIHVuc2lnbmVkIGludCBk
dXR5X2N5Y2xlLCBwZXJpb2Q7Cj4gPiA+ICAgICAgICAgdW5zaWduZWQgbG9uZyBsb25nIG51bTsK
PiA+ID4gICAgICAgICBib29sIGVuYWJsZWQ7Cj4gPiA+ICAgICAgICAgaW50IHJldCA9IDA7Cj4g
PiA+ICAgICAgICAgdTMyIGZyYWM7Cj4gPiA+Cj4gPiA+IC0gICAgICAgaWYgKHN0YXRlLT5wb2xh
cml0eSAhPSBQV01fUE9MQVJJVFlfSU5WRVJTRUQpCj4gPiA+ICsgICAgICAgaWYgKHN0YXRlLT5w
b2xhcml0eSAhPSBQV01fUE9MQVJJVFlfTk9STUFMICYmIHN0YXRlLT5wb2xhcml0eSAhPSBQV01f
UE9MQVJJVFlfSU5WRVJTRUQpCj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
PiA+ID4KPiA+ID4gICAgICAgICBjdXJfc3RhdGUgPSBwd20tPnN0YXRlOwo+ID4gPiBAQCAtMTU0
LDEwICsxNTQsMTMgQEAgc3RhdGljIGludCBwd21fc2lmaXZlX2FwcGx5KHN0cnVjdCBwd21fY2hp
cCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPiA+ID4gICAgICAgICAgKiBjYWxjdWxh
dGluZyB0aGUgcmVnaXN0ZXIgdmFsdWVzIGZpcnN0IGFuZCB0aGVuIHdyaXRpbmcgdGhlbQo+ID4g
PiAgICAgICAgICAqIGNvbnNlY3V0aXZlbHkKPiA+ID4gICAgICAgICAgKi8KPiA+ID4gKyAgICAg
ICBwZXJpb2QgPSBtYXgoc3RhdGUtPnBlcmlvZCwgZGRhdGEtPmFwcHJveF9wZXJpb2QpOwo+ID4K
PiA+IEhpIE55bG9uLAo+ID4KPiA+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzIHBhdGNoLiBZb3Ug
aW50cm9kdWNlIHRoaXMgbmV3IHZhcmlhYmxlLAo+ID4gcGVyaW9kLCBhbmQgc2V0IGl0IGhlcmUg
YnV0IHlvdSBuZXZlciBzZWVtIHRvIHVzZSBpdC4gSWYgeW91IHBsYW5uZWQKPiA+IHRvIHVzZSBp
dCBpbnN0ZWFkIG9mIHN0YXRlLT5wZXJpb2QgYmVsb3csIHdoeSBzaG91bGQgaXQgYmUgdGhlIG1h
eCBvZgo+ID4gdGhlIG9sZCBwZXJpb2QgYW5kIHdoYXQgaXMgcmVxdWVzdGVkPyBXaGF0IGhhcHBl
bnMgaWYgdGhlIGNvbnN1bWVyCj4gPiB3YW50cyB0byBsb3dlciB0aGUgcGVyaW9kPwo+IFNvcnJ5
IHRoaXMgd2FzIGFuIG92ZXJzaWdodCBvbiBteSBwYXJ0LCB0aGVyZSB3YXMgYSBsaW5lIGNvcnJl
Y3Rpb24gdGhhdCBkaWRuJ3QgY2hhbmdlIHRvCj4gLSBmcmFjID0gRElWNjRfVTY0X1JPVU5EX0NM
T1NFU1QobnVtLCBzdGF0ZS0+cGVyaW9kKTsKPiArIGZyYWMgPSBESVY2NF9VNjRfUk9VTkRfQ0xP
U0VTVChudW0sIHBlcmlvZCk7CgpJIHNlZSwgc28gdGhlbiBteSBzZWNvbmQgcXVlc3Rpb24gd2Fz
IHdoeSBwZXJpb2QgbmVlZHMgdG8gYmUgdGhlCmxhcmdlciBvZiB0aGUgcHJldmlvdXMgcGVyaW9k
IGFuZCB0aGUgcmVxdWVzdGVkIHBlcmlvZC4KCldoYXQgaGFwcGVucyBpZiB0aGUgcmVxdWVzdGVk
IHBlcmlvZCwgc3RhdGUtPnBlcmlvZCwgaXMgbG93ZXIgdGhhbiB0aGUKb2xkIHBlcmlvZCwgZGRh
dGEtPmFwcHJveF9wZXJpb2Q/IFRoZW4gdGhlIHBlcmlvZCB3aWxsIGJlIGNoYW5nZWQgdG8Kc3Rh
dGUtPnBlcmlvZCBiZWxvdywgYnV0IHRoZSBjYWxjdWxhdGlvbnMgd2lsbCBiZSBtYWRlIHVzaW5n
IHBlcmlvZCA9CmRkYXRhLT5hcHByb3hfcGVyaW9kLCByaWdodD8KCj4gPgo+ID4gQWxzbyBhYm92
ZSB5b3Ugbm93IGFsbG93IGJvdGggUFdNX1BPTEFSSVRZX05PUk1BTCBhbmQKPiA+IFBXTV9QT0xB
UklUWV9JTlZFUlNFRCBidXQgeW91IHRyZWF0IGJvdGggY2FzZXMgdGhlIHNhbWUuCj4gSSBtYXkg
aGF2ZSBtaXN1bmRlcnN0b29kIHdoYXQgVXdlIG1lYW5zIGhlcmUsIEkgd2lsbCBjb25maXJtIGFn
YWluIGhlcmUKPiA+Cj4gPiAvRW1pbAo+ID4KPiA+ID4gICAgICAgICBudW0gPSAodTY0KWR1dHlf
Y3ljbGUgKiAoMVUgPDwgUFdNX1NJRklWRV9DTVBXSURUSCk7Cj4gPiA+ICAgICAgICAgZnJhYyA9
IERJVjY0X1U2NF9ST1VORF9DTE9TRVNUKG51bSwgc3RhdGUtPnBlcmlvZCk7Cj4gPiA+IC0gICAg
ICAgLyogVGhlIGhhcmR3YXJlIGNhbm5vdCBnZW5lcmF0ZSBhIDEwMCUgZHV0eSBjeWNsZSAqLwo+
ID4gPiAgICAgICAgIGZyYWMgPSBtaW4oZnJhYywgKDFVIDw8IFBXTV9TSUZJVkVfQ01QV0lEVEgp
IC0gMSk7Cj4gPiA+ICsgICAgICAgLyogVGhlIGhhcmR3YXJlIGNhbm5vdCBnZW5lcmF0ZSBhIDEw
MCUgZHV0eSBjeWNsZSAqLwo+ID4gPiArICAgICAgIGZyYWMgPSAoMVUgPDwgUFdNX1NJRklWRV9D
TVBXSURUSCkgLSAxIC0gZnJhYzsKPiA+ID4gKwo+ID4gPgo+ID4gPiAgICAgICAgIG11dGV4X2xv
Y2soJmRkYXRhLT5sb2NrKTsKPiA+ID4gICAgICAgICBpZiAoc3RhdGUtPnBlcmlvZCAhPSBkZGF0
YS0+YXBwcm94X3BlcmlvZCkgewo+ID4gPiAtLQo+ID4gPiAyLjQwLjAKPiA+ID4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
