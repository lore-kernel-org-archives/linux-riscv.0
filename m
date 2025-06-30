Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E72CC8302F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 21:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qwb+MzZnj9tp97PUJxrPyIJC5TUAmbOW5KB7NmdcE+A=; b=bC3P4GjXDVIrfY
	5w9VJOqiuWXS4vNRLP3Ayk9P7mTG4SBvB+7h39UWHpFdL5WvX7R9fuOg0s34y+ZZL/kfFBLuP3nAb
	B9UlQDwBHNw+vqCHHDmHn1Y2KE6Csu1y+UFXhGrcI/4pAvF+LyvUpKRiNanOLRZR6R64zBa2s2mTF
	oTw4192XzYX7JjJexShXn5JVZKwMwyzHZGtKhYOU0dyEvpx4iIjdAv+zNWCSvXBuOEANtZeCCgy+t
	DXOdbZsYOx59wIqdr/g4AG+RxLexptKcE92VnsUkh/2aqv+XuPpgFia34eX33TfDnYBdTgCjKI1nS
	5ZVXlbg/tUSrG7f+tJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWLk9-00000003TB5-0kh1;
	Mon, 30 Jun 2025 21:08:49 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWLjx-00000003T9h-1HNu
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 21:08:38 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-60c6fea6742so9403923a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751317715; x=1751922515; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DfEAu4Z4aidz8WUdebCSoWtL+Ka/H89FRK6NQIVtr3U=;
        b=Znen2rkZgVmTwr2N1AOoG93DFlKzy9316V/x5wFSi/ZDDeTBupnfb9CnSW2nuoaD56
         YqhOBoPQ1CooyUWEV9NwGzejJq8PED8AwC1waSwQi4zyqboF0tcbhtgni+9gFwU2rXas
         XWBBKCxboI5uEikYTTp1p6XDf3rdJvZVYV+u7qJDm1SThvyC2v4zOIKRgPx4muEVdUrX
         /sjFUOpqcrQud+ukJT3zLzw9dkU6Jd8XCE+MXjc/+M32FBM74Qn4O60pAt+Mt6vb2/Y+
         Gbn0SCPLbItX0nJH6jKt3TLr3pI/viSloWY4glqaZD2tLt0QMZ4y5/Ngu4cZ1at0awh0
         Kn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751317715; x=1751922515;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DfEAu4Z4aidz8WUdebCSoWtL+Ka/H89FRK6NQIVtr3U=;
        b=PhtVt8Gc3+AAsJ5/uq+XJAPBpugdR6A2ttXvf8YGLiv5qGWh5+Nl6oO5thv79hhL1c
         1pNC2UTuuG0aUmcd7p195cc6eJhP9ws2xFZTh58phk+RCZQh59jr6sZ1wbyDSWKE8y1s
         oe3UKHCoWsPY5ZfrlbNcr84fAt9h481KurHQXyntv5hwK60KFtoQLJhT0SoLe8ME9ShF
         hVUTzai4gAw/rifJq1CfDgPacZ4jZ0jW5W1D+8lRdWoqjXXQC7UEvxgDGTGoX3HLayuG
         /hzc0z+tlmYXy+0I9y598AnKY+NvgFpIlNE2N97MMkDg0NdkxKbj2b7rW1a6xS4SOG0m
         M1Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWrIJvdXeBpg1fPLJg+aMVDZJ+TVZ5MlIVaEeUqwyd5QWweRTh7Pmr0I68+y56cAoEovSIFqx0MawUjUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUegL5atqz418veRzY5c2MfLktD3Y/KcQd6BLmckQUt7LJDUkH
	34MSzg5NnbYmXZQ5jFIaEWHNGOIpoGDRPsQUN1m7P1arMq8kcPnEHX7r
X-Gm-Gg: ASbGncuR6+8RMgSWQgkFd4zJoRyYicE/Mt2dTPdzH8gAd1zHZDko5W8WmSmfpS5vlnu
	Oumto/5kgn69dUAczMvU8et0VDiLY5zz2H8SRqZuQbi4PULagcwzt7zGTh8xwt28R5d/sHnE7gK
	BSHm4Z89BrSc5XYKgbY2Fwmgf+I6UDq5BUlNIyV6LuCgoSTrz1LmpAq377FM8MpjOPLr4ys9e/j
	q7qJFQwBNwXHS8o4jjMaY1bXWQg2xBlIHcwO8zbxVFLzRzKnHkFX2BxU7RnwHEp16NT7Nkpsjr1
	hrAVAG9Hib3r7Uw1j62nBEerk0XN1BLn58T/L2t4jR01VLWwvAc9L/lM9UmL2pDCDti1TGC9wRu
	SfzzZ2Q==
X-Google-Smtp-Source: AGHT+IFiNDi56K5x37KH9GR/A8jMN8Z9TvqTUcjmru8/4qInJ8CfMFwW3ZXy8hbURvxLCUDm+/aZcw==
X-Received: by 2002:a05:6402:3586:b0:608:66a3:fec with SMTP id 4fb4d7f45d1cf-60c88b3453bmr13656712a12.2.1751317714969;
        Mon, 30 Jun 2025 14:08:34 -0700 (PDT)
Received: from giga-mm-8.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831ccc90sm6200391a12.56.2025.06.30.14.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:08:34 -0700 (PDT)
Message-ID: <b8e37f3b89209f6674b0419ec28e0302de6b3c4e.camel@gmail.com>
Subject: Re: [PATCH net-next 2/2] net: mdio-mux: Add MDIO mux driver for
 Sophgo CV1800 SoCs
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Yixun Lan	 <dlan@gentoo.org>, Longbin Li
 <looong.bin@gmail.com>
Date: Mon, 30 Jun 2025 23:08:37 +0200
In-Reply-To: <20250611080228.1166090-3-inochiama@gmail.com>
References: <20250611080228.1166090-1-inochiama@gmail.com>
	 <20250611080228.1166090-3-inochiama@gmail.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_140837_350446_EA0FD7B6 
X-CRM114-Status: GOOD (  20.57  )
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

SGkgSW5vY2hpIQoKT24gV2VkLCAyMDI1LTA2LTExIGF0IDE2OjAyICswODAwLCBJbm9jaGkgQW1h
b3RvIHdyb3RlOgo+IEFkZCBkZXZpY2UgZHJpdmVyIGZvciB0aGUgbXV4IGRyaXZlciBmb3IgU29w
aGdvIENWMThYWC9TRzIwMFgKPiBzZXJpZXMgU29Dcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJbm9j
aGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9uZXQvbWRp
by9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTAgKysrCj4gwqBkcml2ZXJzL25l
dC9tZGlvL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4gwqBkcml2ZXJz
L25ldC9tZGlvL21kaW8tbXV4LWN2MTgwMGIuYyB8IDExOSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDEzMCBpbnNlcnRpb25zKCspCj4gwqBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9uZXQvbWRpby9tZGlvLW11eC1jdjE4MDBiLmMKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvbWRpby9LY29uZmlnIGIvZHJpdmVycy9uZXQvbWRpby9LY29u
ZmlnCj4gaW5kZXggN2RiNDBhYWEwNzlkLi5mZTU1MzAxNmI3N2QgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9uZXQvbWRpby9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9uZXQvbWRpby9LY29uZmlnCj4g
QEAgLTI3OCw1ICsyNzgsMTUgQEAgY29uZmlnIE1ESU9fQlVTX01VWF9NTUlPUkVHCj4gwqAKPiDC
oAnCoCBDdXJyZW50bHksIG9ubHkgOC8xNi8zMiBiaXRzIHJlZ2lzdGVycyBhcmUgc3VwcG9ydGVk
Lgo+IMKgCj4gK2NvbmZpZyBNRElPX0JVU19NVVhfU09QSEdPX0NWMTgwMEIKPiArCXRyaXN0YXRl
ICJTb3BoZ28gQ1YxODAwIE1ESU8gbXVsdGlwbGV4ZXIgZHJpdmVyIgo+ICsJZGVwZW5kcyBvbiBB
UkNIX1NPUEhHTyB8fCBDT01QSUxFX1RFU1QKPiArCWRlcGVuZHMgb24gT0ZfTURJTyAmJiBIQVNf
SU9NRU0KPiArCXNlbGVjdCBNRElPX0JVU19NVVgKPiArCWRlZmF1bHQgbSBpZiBBUkNIX1NPUEhH
Two+ICsJaGVscAo+ICsJwqAgVGhpcyBtb2R1bGUgcHJvdmlkZXMgYSBkcml2ZXIgZm9yIHRoZSBN
RElPIG11bHRpcGxleGVyL2dsdWUgb2YKPiArCcKgIHRoZSBTb3BoZ28gQ1YxODAwIHNlcmllcyBT
b0MuIFRoZSBtdWx0aXBsZXhlciBjb25uZWN0cyBlaXRoZXIKPiArCcKgIHRoZSBleHRlcm5hbCBv
ciB0aGUgaW50ZXJuYWwgTURJTyBidXMgdG8gdGhlIHBhcmVudCBidXMuCj4gwqAKPiDCoGVuZGlm
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L21kaW8vTWFrZWZpbGUgYi9kcml2ZXJzL25ldC9t
ZGlvL01ha2VmaWxlCj4gaW5kZXggYzIzNzc4ZTczODkwLi5hNjdiZTJhYmMzNDMgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9uZXQvbWRpby9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvbmV0L21kaW8v
TWFrZWZpbGUKPiBAQCAtMzMsMyArMzMsNCBAQCBvYmotJChDT05GSUdfTURJT19CVVNfTVVYX01F
U09OX0cxMkEpCSs9IG1kaW8tbXV4LW1lc29uLWcxMmEubwo+IMKgb2JqLSQoQ09ORklHX01ESU9f
QlVTX01VWF9NRVNPTl9HWEwpCSs9IG1kaW8tbXV4LW1lc29uLWd4bC5vCj4gwqBvYmotJChDT05G
SUdfTURJT19CVVNfTVVYX01NSU9SRUcpwqAJKz0gbWRpby1tdXgtbW1pb3JlZy5vCj4gwqBvYmot
JChDT05GSUdfTURJT19CVVNfTVVYX01VTFRJUExFWEVSKcKgCSs9IG1kaW8tbXV4LW11bHRpcGxl
eGVyLm8KPiArb2JqLSQoQ09ORklHX01ESU9fQlVTX01VWF9TT1BIR09fQ1YxODAwQikgKz0gbWRp
by1tdXgtY3YxODAwYi5vCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L21kaW8vbWRpby1tdXgt
Y3YxODAwYi5jIGIvZHJpdmVycy9uZXQvbWRpby9tZGlvLW11eC1jdjE4MDBiLmMKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNmM2OWU4M2MzZGNkCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvbmV0L21kaW8vbWRpby1tdXgtY3YxODAwYi5jCj4gQEAg
LTAsMCArMSwxMTkgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiAr
LyoKPiArICogU29waGdvIENWMTgwMCBNRElPIG11bHRpcGxleGVyIGRyaXZlcgo+ICsgKgo+ICsg
KiBDb3B5cmlnaHQgKEMpIDIwMjUgSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4K
PiArICovCj4gKwo+ICsjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KPiArI2luY2x1ZGUgPGxp
bnV4L2JpdHMuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4gKyNpbmNsdWRlIDxsaW51
eC9jbGsuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2lvLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tZGlv
LW11eC5oPgo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9w
bGF0Zm9ybV9kZXZpY2UuaD4KPiArCj4gKyNkZWZpbmUgRVBIWV9QQUdFX1NFTEVDVAkJMHgwN2MK
PiArI2RlZmluZSBFUEhZX0NUUkwJCQkweDgwMAo+ICsjZGVmaW5lIEVQSFlfUkVHX1NFTEVDVAkJ
CTB4ODA0Cj4gKwo+ICsjZGVmaW5lIEVQSFlfUEFHRV9TRUxFQ1RfU1JDCQlHRU5NQVNLKDEyLCA4
KQo+ICsKPiArI2RlZmluZSBFUEhZX0NUUkxfQU5BTE9HX1NIVVRET1dOCUJJVCgwKQo+ICsjZGVm
aW5lIEVQSFlfQ1RSTF9VU0VfRVhUUEhZCQlCSVQoNykKPiArI2RlZmluZSBFUEhZX0NUUkxfUEhZ
TU9ERQkJQklUKDgpCj4gKyNkZWZpbmUgRVBIWV9DVFJMX1BIWU1PREVfU01JX1JNSUkJMQo+ICsj
ZGVmaW5lIEVQSFlfQ1RSTF9FWFRQSFlfSUQJCUdFTk1BU0soMTUsIDExKQo+ICsKPiArI2RlZmlu
ZSBFUEhZX1JFR19TRUxFQ1RfTURJTwkJMAo+ICsjZGVmaW5lIEVQSFlfUkVHX1NFTEVDVF9BUEIJ
CTEKPiArCj4gKyNkZWZpbmUgQ1YxODAwQl9NRElPX0lOVEVSTkFMX0lECTEKPiArI2RlZmluZSBD
VjE4MDBCX01ESU9fRVhURVJOQUxfSUQJMAo+ICsKPiArc3RydWN0IGN2MTgwMGJfbWRpb19tdXgg
ewo+ICsJdm9pZCBfX2lvbWVtICpyZWdzOwo+ICsJdm9pZCAqbXV4X2hhbmRsZTsKPiArfTsKPiAr
Cj4gK3N0YXRpYyBpbnQgY3YxODAwYl9lbmFibGVfbWRpbyhzdHJ1Y3QgY3YxODAwYl9tZGlvX211
eCAqbWRtdXgsIGJvb2wgaW50ZXJuYWxfcGh5KQo+ICt7Cj4gKwl1MzIgdmFsOwo+ICsKPiArCXZh
bCA9IHJlYWRsKG1kbXV4LT5yZWdzICsgRVBIWV9DVFJMKTsKPiArCj4gKwlpZiAoaW50ZXJuYWxf
cGh5KQo+ICsJCXZhbCAmPSB+RVBIWV9DVFJMX1VTRV9FWFRQSFk7Cj4gKwllbHNlCj4gKwkJdmFs
IHw9IEVQSFlfQ1RSTF9VU0VfRVhUUEhZOwo+ICsKPiArCXdyaXRlbCh2YWwsIG1kbXV4LT5yZWdz
ICsgRVBIWV9DVFJMKTsKPiArCj4gKwl3cml0ZWwoRVBIWV9SRUdfU0VMRUNUX01ESU8sIG1kbXV4
LT5yZWdzICsgRVBIWV9SRUdfU0VMRUNUKTsKPiArCj4gKwlyZXR1cm4gMDsKPiArfQoKU2VlbXMg
dGhhdCBpdCBhY3R1YWxseSBkb2Vzbid0IG11bHRpcGxleCB0aGUgYnVzZXM/IEFzIHNlZW4gb24g
U0cyMDAwOgoKIyBtZGlvIG1kaW9fbXV4LTAuMAogREVWICAgICAgUEhZLUlEICBMSU5LCjB4MDAg
IDB4MDA0MzU2NDkgIHVwCjB4MDEgIDB4MDA0MzU2NDkgIHVwCjB4MDIgIDB4MDAwMDAwMDAgIGRv
d24KLi4uCiMgbWRpbyBtZGlvX211eC0wLjEKIERFViAgICAgIFBIWS1JRCAgTElOSwoweDAwICAw
eDAwNDM1NjQ5ICB1cAoweDAxICAweDAwNDM1NjQ5ICB1cAouLi4KClRoZSBzaW5nbGUgaW50ZXJu
YWwgUEhZIGFwcGVhcnMgb24gdHdvIGFkZHJlc3NlcyAoMCBhbmQgMSkgYW5kIG9uIGJvdGggYnVz
ZXMuCk1heWJlIGl0IGp1c3Qgc3dpdGNoZXMgdGhlIGV4dGVybmFsIE1ESU8gbWFzdGVyIG9uL29m
Zj8KU2VlbXMgdGhhdCB3ZSBuZWVkIHRoZSBkb2N1bWVudGF0aW9uIGZvciB0aGlzIHRoaW5nIDst
KQoKQlRXLCBhYm92ZSBMSU5LIHVwIGlzIHVuZm9ydHVuYXRlbHkgd2l0aG91dCBhbnkgY2FibGUg
YXR0YWNoZWQuLi4KCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
