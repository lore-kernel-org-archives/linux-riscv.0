Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CD1C47077
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 08:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trr8JCL+3j4FEMVCoC9ti9lCGlGJRagM7Dhsch4yGmg=; b=d8hmDmb3gqoFDU
	8qpsNfzu6gueNuAFJ8ok8CKPjo70OZsbBwGLK0iHtpdz5EdUuadWl6zpfcl5AsrE3PFW4xe7dSkrr
	QsL6fPlgFzoKTrF3zYSJNHUd6gKXw0TEYERBS58Hy+WZce1Ssq2LmPMH5o97HZGLGm/ixxnyIeAUw
	y9qfGAsSDPblqpQJVZHVb61UzksBMzxVAW6B58wUUABkAp9KIFfa/jWVm+5KuH2BYeKVKj7SIgeKq
	R9H5c1DKJx1ZHSQ/XWEXzBOV5rPEmMjcsKltUvw9AudrHm5WCWbsrLohWThDKXuHOFpGMc0QRETOJ
	yggBhEyrzil0gsqtetnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMkzG-004IzV-2b;
	Mon, 08 Jan 2024 08:27:59 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMkzD-004Ix4-0U
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 08:27:57 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-dbeff495c16so123286276.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 00:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704702472; x=1705307272; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvJpgUA4AhlF5UzDkm4aNhAt25RJ3NPKJbdB1Fs6ecM=;
        b=iC4+fOjOoWZfk6g6qrzrWdqvJCX2GMwLaNXtBksAhMfhrFLj+N+LktCTQ7M6Rm8U7z
         gG0UJip1zb4SyiVHI/h7diYpVGNzRwvdybxxOo3d1egvoJb1tQMZ1O29Sv4rcd3LmRpx
         5rHSdPab9dsxCwo1WIedjdmid+LVHbnS66nHnHzNMsF95KYlhdFSi40fG4dLgw7OlDR+
         xdNdp+xmpIuGY+EayDDQGpvMPzKIiJBpObFcAx7+iTEMDHSaIryIlvlgPN8Be/tA3awT
         0Lw9sTlORau9C3UqDbL/GJoFxPwQfxUQgDDN1Sn/JAR8ynZopSpp1LRUpxDQdKvmVghS
         ZLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704702472; x=1705307272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvJpgUA4AhlF5UzDkm4aNhAt25RJ3NPKJbdB1Fs6ecM=;
        b=lynTZCpm9GK+Wq/XoLr/kB7FT2MGOtZvr5bTbHbpl3PtHF//hp3VVjoSE4S2ChN2oo
         RA1c94VicqzTWs5Pqf6FUjjRCz+Sda6nz8kuXrWmyVUnZyQRjV90T0j/Kdy0FPGQTfXz
         lhPQrqBweYwNzc9J4L6jPcenumICd27GRTQO+2qEpU+/vFo3sFloGwGZYlu4vYHk0ieI
         SKNH/UhYaw3OP2GZRZz5zvhfs0Gw1eB2CYQm5eyDaJasOBXmMj6p2zgJuGyZpuigojrm
         ZxFv7QActbLIvMdFHPC8jcDHedEZAbINoD4GhSTfNoHtPT2m1QgRtuskSvOtF4bg7Aox
         oxYQ==
X-Gm-Message-State: AOJu0YxGGYy+xTAdLJ1QsPEaZ0sZA3lUuJkzzIXpyX49nu9I41wOo8Mb
	w4C6VdRoVosO9iFk5Dg4YfIcTgmC5pkjzIvF2HXu7klExYOaWw==
X-Google-Smtp-Source: AGHT+IFFb/Niyem1I290kG8fWBodwAxnQ44aza9G+jPqE1Lo+m061UGkuugFtDe83W4bVPZF0f7YxoMVpvdXsCZV7iU=
X-Received: by 2002:a25:2689:0:b0:dbe:9ef5:9605 with SMTP id
 m131-20020a252689000000b00dbe9ef59605mr1156037ybm.4.1704702472335; Mon, 08
 Jan 2024 00:27:52 -0800 (PST)
MIME-Version: 1.0
References: <20231024101902.6689-1-nylon.chen@sifive.com> <20231024101902.6689-3-nylon.chen@sifive.com>
 <20231211204950.fkaqsnpzb6kixqf2@pengutronix.de>
In-Reply-To: <20231211204950.fkaqsnpzb6kixqf2@pengutronix.de>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Mon, 8 Jan 2024 16:27:40 +0800
Message-ID: <CAHh=Yk-9-M2G_cfdxLig2d0g1DucEytXhfFO5dp5HcDn+egWBw@mail.gmail.com>
Subject: Re: [v5 2/2] pwm: sifive: change the PWM controlled LED algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	thierry.reding@gmail.com, emil.renner.berthing@canonical.com, 
	vincent.chen@sifive.com, greentime.hu@sifive.com, zong.li@sifive.com, 
	nylon7717@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_002755_216910_B084B103 
X-CRM114-Status: GOOD (  26.69  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4g5pa8IDIw
MjPlubQxMuaciDEy5pelIOmAseS6jCDkuIrljYg0OjUw5a+r6YGT77yaCj4KPiBIZWxsbyBOeWxv
biwKCkhpIFV3ZSwgdGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLgo+Cj4KPgo+IE9uIFR1ZSwgT2N0
IDI0LCAyMDIzIGF0IDA2OjE5OjAyUE0gKzA4MDAsIE55bG9uIENoZW4gd3JvdGU6Cj4gPiBUaGUg
YGZyYWNgIHZhcmlhYmxlIHJlcHJlc2VudHMgdGhlIHB1bHNlIGluYWN0aXZlIHRpbWUsIGFuZCB0
aGUgcmVzdWx0Cj4gPiBvZiB0aGlzIGFsZ29yaXRobSBpcyB0aGUgcHVsc2UgYWN0aXZlIHRpbWUu
IFRoZXJlZm9yZSwgd2UgbXVzdCByZXZlcnNlIHRoZSByZXN1bHQuCj4gPgo+ID4gVGhlIHJlZmVy
ZW5jZSBpcyBTaUZpdmUgRlU3NDAtQzAwMCBNYW51YWxbMF0KPiA+Cj4gPiBMaW5rOiBodHRwczov
L3NpZml2ZS5jZG4ucHJpc21pYy5pby9zaWZpdmUvMWE4MmU2MDAtMWY5My00ZjQxLWIyZDgtODZl
ZDhiMTZhY2JhX2Z1NzQwLWMwMDAtbWFudWFsLXYxcDYucGRmIFswXQo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IE55bG9uIENoZW4gPG55bG9uLmNoZW5Ac2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgfCAxMCArKysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gPiBp
bmRleCBlYWJkZGI3Yzc4MjAuLjM1M2MyMzQyZmJmMSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
cHdtL3B3bS1zaWZpdmUuYwo+ID4gKysrIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gPiBA
QCAtMTAxLDcgKzEwMSw3IEBAIHN0YXRpYyB2b2lkIHB3bV9zaWZpdmVfdXBkYXRlX2Nsb2NrKHN0
cnVjdCBwd21fc2lmaXZlX2RkYXRhICpkZGF0YSwKPiA+Cj4gPiAgICAgICAvKiBBcyBzY2FsZSA8
PSAxNSB0aGUgc2hpZnQgb3BlcmF0aW9uIGNhbm5vdCBvdmVyZmxvdy4gKi8KPiA+ICAgICAgIG51
bSA9ICh1bnNpZ25lZCBsb25nIGxvbmcpTlNFQ19QRVJfU0VDIDw8IChQV01fU0lGSVZFX0NNUFdJ
RFRIICsgc2NhbGUpOwo+ID4gLSAgICAgZGRhdGEtPnJlYWxfcGVyaW9kID0gZGl2NjRfdWwobnVt
LCByYXRlKTsKPiA+ICsgICAgIGRkYXRhLT5yZWFsX3BlcmlvZCA9IERJVl9ST1VORF9VUF9VTEwo
bnVtLCByYXRlKTsKPgo+IEl0J3MgdW5jbGVhciB0byBtZSwgd2h5IHlvdSBjaGFuZ2VkIHRoYXQu
CkJlY2F1c2UgdGhlcmUgaXMgYSBnYXAgaW4gaWRlbXBvdGVudCB0ZXN0cy4KZS5nLgpyb290QHVu
bWF0Y2hlZDp+IyBlY2hvIDExMCA+Ci9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9sZWQtY29udHJvbGxl
ci0xL2xlZHMvZDEyL2JyaWdodG5lc3MKWyAgNzA2Ljk4NzcxMl0gLmFwcGx5IGlzIG5vdCBpZGVt
cG90ZW50IChlbmE9MSBwb2w9MCAxNzM5NjkyLzQwMzI5ODUpCi0+IChlbmE9MSBwb2w9MCAxNzM5
NjMwLzQwMzI5ODUpCnJvb3RAdW5tYXRjaGVkOn4jIGVjaG8gMTIwID4KL3N5cy9kZXZpY2VzL3Bs
YXRmb3JtL2xlZC1jb250cm9sbGVyLTEvbGVkcy9kMTIvYnJpZ2h0bmVzcwpbICA3MDkuODE3NTU0
XSAuYXBwbHkgaXMgbm90IGlkZW1wb3RlbnQgKGVuYT0xIHBvbD0wIDE4OTc4NDYvNDAzMjk4NSkK
LT4gKGVuYT0xIHBvbD0wIDE4OTc3ODQvNDAzMjk4NSkKClJvdW5kIHRoZSByZXN1bHQgdG8gdGhl
IG5lYXJlc3Qgd2hvbGUgbnVtYmVyLiBUaGlzIGVuc3VyZXMgdGhhdApyZWFsX3BlcmlvZCBpcyBh
bHdheXMgYSByZWFzb25hYmxlIGludGVnZXIgdGhhdCBpcyBub3QgbG93ZXIgdGhhbiB0aGUKYWN0
dWFsIHZhbHVlLgoKQWZ0ZXIgbW9kaWZpY2F0aW9uLCBpZGVtcG90ZW50IGVycm9ycyBjYW4gYmUg
YXZvaWRlZC4KPgo+Cj4gPiAgICAgICBkZXZfZGJnKGRkYXRhLT5jaGlwLmRldiwKPiA+ICAgICAg
ICAgICAgICAgIk5ldyByZWFsX3BlcmlvZCA9ICV1IG5zXG4iLCBkZGF0YS0+cmVhbF9wZXJpb2Qp
Owo+ID4gIH0KPiA+IEBAIC0xMjEsMTMgKzEyMSwxNCBAQCBzdGF0aWMgaW50IHB3bV9zaWZpdmVf
Z2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwK
PiA+ICAgICAgICAgICAgICAgc3RhdGUtPmVuYWJsZWQgPSBmYWxzZTsKPiA+Cj4gPiAgICAgICBz
dGF0ZS0+cGVyaW9kID0gZGRhdGEtPnJlYWxfcGVyaW9kOwo+ID4gKwo+ID4gKyAgICAgZHV0eSA9
ICgxVSA8PCBQV01fU0lGSVZFX0NNUFdJRFRIKSAtIDEgLSBkdXR5Owo+Cj4gSSB3b3VsZCBoYXZl
IHBsYWNlZCB0aGF0IGRpcmVjdGx5IGFmdGVyCj4KPiAgICAgICAgIGR1dHkgPSByZWFkbCguLi4p
Owo+Cj4gd2hpY2ggdGhlbiBhbHNvIGluZmx1ZW5jZXMKPgo+ICAgICAgICAgc3RhdGUtPmVuYWJs
ZWQgPSBkdXR5ID4gMDsKPgo+IChhcyBpdCBzaG91bGQ/KS4KPgpZZXMsIHlvdSBhcmUgcmlnaHQu
IEkgd2lsbCBtYWtlIHJlbGV2YW50IGNvcnJlY3Rpb25zLgouLi4KICAgICAgICBkdXR5ID0gcmVh
ZGwoZGRhdGEtPnJlZ3MgKyBQV01fU0lGSVZFX1BXTUNNUChwd20tPmh3cHdtKSk7CisgICAgICAg
ZHV0eSA9ICgxVSA8PCBQV01fU0lGSVZFX0NNUFdJRFRIKSAtIDEgLSBkdXR5OwotICAgICAgIHN0
YXRlLT5lbmFibGVkID0gZHV0eSA8PSA2NTUzNTsKKyAgICAgICBzdGF0ZS0+ZW5hYmxlZCA9IGR1
dHkgPiAwOwouLi4KICAgICAgICBzdGF0ZS0+cGVyaW9kID0gZGRhdGEtPnJlYWxfcGVyaW9kOwot
ICAgICAgIGR1dHkgPSAoMVUgPDwgUFdNX1NJRklWRV9DTVBXSURUSCkgLSAxIC0gZHV0eTsKCj4K
PiA+ICAgICAgIHN0YXRlLT5kdXR5X2N5Y2xlID0KPiA+ICAgICAgICAgICAgICAgKHU2NClkdXR5
ICogZGRhdGEtPnJlYWxfcGVyaW9kID4+IFBXTV9TSUZJVkVfQ01QV0lEVEg7Cj4gPiAtICAgICBz
dGF0ZS0+cG9sYXJpdHkgPSBQV01fUE9MQVJJVFlfSU5WRVJTRUQ7Cj4gPiArICAgICBzdGF0ZS0+
cG9sYXJpdHkgPSBQV01fUE9MQVJJVFlfTk9STUFMOwo+ID4KPiA+ICAgICAgIHJldHVybiAwOwo+
ID4gIH0KPiA+IC0KPiA+ICBzdGF0aWMgaW50IHB3bV9zaWZpdmVfYXBwbHkoc3RydWN0IHB3bV9j
aGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBzdHJ1Y3QgcHdtX3N0YXRlICpzdGF0ZSkKPiA+ICB7Cj4gPiBAQCAtMTM5
LDcgKzE0MCw3IEBAIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9hcHBseShzdHJ1Y3QgcHdtX2NoaXAg
KmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCj4gPiAgICAgICBpbnQgcmV0ID0gMDsKPiA+
ICAgICAgIHUzMiBmcmFjOwo+ID4KPiA+IC0gICAgIGlmIChzdGF0ZS0+cG9sYXJpdHkgIT0gUFdN
X1BPTEFSSVRZX0lOVkVSU0VEKQo+ID4gKyAgICAgaWYgKHN0YXRlLT5wb2xhcml0eSAhPSBQV01f
UE9MQVJJVFlfTk9STUFMKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+Cj4g
PiAgICAgICBjdXJfc3RhdGUgPSBwd20tPnN0YXRlOwo+ID4gQEAgLTE1OCw2ICsxNTksNyBAQCBz
dGF0aWMgaW50IHB3bV9zaWZpdmVfYXBwbHkoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3Qg
cHdtX2RldmljZSAqcHdtLAo+ID4gICAgICAgbnVtID0gKHU2NClkdXR5X2N5Y2xlICogKDFVIDw8
IFBXTV9TSUZJVkVfQ01QV0lEVEgpOwo+ID4gICAgICAgZnJhYyA9IERJVjY0X1U2NF9ST1VORF9D
TE9TRVNUKG51bSwgc3RhdGUtPnBlcmlvZCk7Cj4gPiAgICAgICAvKiBUaGUgaGFyZHdhcmUgY2Fu
bm90IGdlbmVyYXRlIGEgMTAwJSBkdXR5IGN5Y2xlICovCj4gPiArICAgICBmcmFjID0gKDFVIDw8
IFBXTV9TSUZJVkVfQ01QV0lEVEgpIC0gMSAtIGZyYWM7Cj4gPiAgICAgICBmcmFjID0gbWluKGZy
YWMsICgxVSA8PCBQV01fU0lGSVZFX0NNUFdJRFRIKSAtIDEpOwo+Cj4gZnJhYyBjYW4gb25seSBi
ZSA+ICgxVSA8PCBQV01fU0lGSVZFX0NNUFdJRFRIKSAtIDEgaWYgYW4gb3ZlcmZsb3cKPiBoYXBw
ZW5kIHRoZSBsaW5lIGFib3ZlLiBJcyB0aGF0IHdoYXQgeW91IHdhbnQgaGVyZT8KSSBtYWRlIGEg
bWlzdGFrZSwgSSBwdXNoZWQgdGhlIHdyb25nIGNoYW5nZXMuCgpJIHdhbnQgdG8gaW52ZXJ0IGl0
IGFmdGVyIHRha2luZyB0aGUgbWluaW11bSB2YWx1ZSwgd2hpY2ggbWFrZXMgc2Vuc2UgdG8gbWUu
CiAgICAgICAgZnJhYyA9IERJVjY0X1U2NF9ST1VORF9DTE9TRVNUKG51bSwgc3RhdGUtPnBlcmlv
ZCk7CiAgICAgICAgLyogVGhlIGhhcmR3YXJlIGNhbm5vdCBnZW5lcmF0ZSBhIDEwMCUgZHV0eSBj
eWNsZSAqLwogICAgICAgIGZyYWMgPSBtaW4oZnJhYywgKDFVIDw8IFBXTV9TSUZJVkVfQ01QV0lE
VEgpIC0gMSk7CisgICAgICAgZnJhYyA9ICgxVSA8PCBQV01fU0lGSVZFX0NNUFdJRFRIKSAtIDEg
LSBmcmFjOwoKPgo+ID4gICAgICAgbXV0ZXhfbG9jaygmZGRhdGEtPmxvY2spOwo+Cj4gQmVzdCBy
ZWdhcmRzCj4gVXdlCkJlc3QgcmVnYXJkcwpOeWxvbgo+Cj4gLS0KPiBQZW5ndXRyb25peCBlLksu
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBVd2UgS2xlaW5lLUvDtm5pZyAgICAgICAgICAg
IHwKPiBJbmR1c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAgfCBodHRwczov
L3d3dy5wZW5ndXRyb25peC5kZS8gfAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
