Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC6DC4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 08:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9B/FMzeBNZs3XfkyEKF7bDVjl9+ztjpYYP5xnaU4430=; b=LqcYYxQA0ZjtBP
	SA9iIlBFoP/fXF+dcHPm5Q6rgB7+iyPFoRlWhDgyPiUVkwhRjWK+h0YVfy9Sjrr0gmE30tGfH7A3r
	MBIUcKC0S0hXny59VgjEzYkGO69x/7wVuBSlFmju5m6471+hYzUmRRkn/8W+19e/HzTfM57af9+AI
	KEIz+lPRVYZlaWjNzGflrfHtAkyQYr6H362jrM2hf23sLwGHBPfBTIHr2ECozeLu7hhSFn8OhZs66
	LDWXEtMcd31jE3j1EnzhnklMhAfNrnf21Jc9uZ6WrFtHLUvtnKGs+YwWrRM6f83CUlJcAJMCvhUEW
	jqtUIhR5RW5WiEpYFuzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpqj-00B6Wg-0E;
	Mon, 22 Jan 2024 08:40:09 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpqf-00B6VM-2k
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 08:40:07 +0000
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5955a4a9b23so1783438eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 00:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705912743; x=1706517543; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CdVvGiqfYdTCxC7+O9XTEejcr2f6NOrdLyxlbWMCWY=;
        b=EMcrEvC+4SK6zT2hGra6xINVZuNSOkuO/j4OULIk96CqNNc0l5ppzXu8makH7qHyOE
         FNAWo2plcXFvaJvhpxpahmV/jf6l9p0jeefrXejrvo6qI9FpSQKwu6urBUYFtqcvDpes
         3b58z//0KWUB9NMFePPtN9wF263imERN1Vgpn3SYaAj2tQXx/BNkz9JDjOw0uwIp4hCW
         w0i9141dk9Nlh4pzd+7qB5W5KUIK7qgVDb83RR5ceRgezMo2tnnpRFpWEfSdk7x2CaIi
         F7/hE8GbTfu4MiIrMV3SuMjKeibYpBC6V6WXQyrkbTI3sEnJDl9nuaxPYWEwYsiAUc7z
         PA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705912743; x=1706517543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CdVvGiqfYdTCxC7+O9XTEejcr2f6NOrdLyxlbWMCWY=;
        b=Gd++MqsKtuxvS3f2Be/fBaBCgUzX7EsXOD7a4ZAUkrC5pYMg+hcDuk02u+t7NvrQnY
         ZwkIdMzuxGXBvX0FbvhdHJIOl8XZ7dRafqL4wnZCMaI70SU1hXvY11jCUda136PFTSff
         AI3HI3uRn5YOUX5vRMv+SFqWk+zhezkCtnZlQ10w6dWbajSoTdKQdo6WOvIxii4e909Z
         rksY73ikKHelS3AdPlgZOH9XPJJ2W6NSkdN+2EVBz1l/AH+dEV9HUuSO2ALnRxmdbpD6
         EVq4Ne5DTuoBCnvUbsAgillEk+RWEkNa52O5BJYmzenNHVJRNtix2sTYLRZe4/ZVDJ0N
         T5hw==
X-Gm-Message-State: AOJu0YzkGM4F9NE/Lr/kFgpIMUD+WfrBccIwE+rVLLFHv7NCDbPdMBlN
	rx2oA35XaZ/kTDpkBJH4V22v91cZL3kMO2vMi6yOJ6dxIYJpDBD5z7dcmETZCRUwbPnk3tRM74i
	jjih+N0ebCoq4vz1bshL+95O8uqs=
X-Google-Smtp-Source: AGHT+IHSHIMyD+bK3Oc8MHc7OHFPOOY2TwpSZQRqXOls2z9umwLfN1gbC2rc8LCZseXuS1D9LFYzIcR/xEOocK6faz4=
X-Received: by 2002:a4a:a7c9:0:b0:591:b9ce:4f8f with SMTP id
 n9-20020a4aa7c9000000b00591b9ce4f8fmr2290811oom.19.1705912742390; Mon, 22 Jan
 2024 00:39:02 -0800 (PST)
MIME-Version: 1.0
References: <20240122080631.2880-1-qiujingbao.dlmu@gmail.com> <90ae0cad-34a8-4e19-a72f-5e497b72b45c@linaro.org>
In-Reply-To: <90ae0cad-34a8-4e19-a72f-5e497b72b45c@linaro.org>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Mon, 22 Jan 2024 16:38:51 +0800
Message-ID: <CAJRtX8SWyUJmiR-z108XcVY77kCXhz7E4=sLE0+gmzsXjipW9w@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alexandre.belloni@bootlin.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_004005_893100_43C85DE0 
X-CRM114-Status: GOOD (  20.09  )
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

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgNDoyOeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAyMi8wMS8yMDI0IDA5
OjA2LCBKaW5nYmFvIFFpdSB3cm90ZToKPiA+IEltcGxlbWVudCB0aGUgUlRDIGRyaXZlciBmb3Ig
Q1YxODAwLCB3aGljaCBhYmxlIHRvIHByb3ZpZGUgdGltZSBhbGFybQo+ID4gYW5kIGNhbGlicmF0
ZSBmdW5jdGlvbmFsaXR5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEppbmdiYW8gUWl1IDxxaXVq
aW5nYmFvLmRsbXVAZ21haWwuY29tPgo+ID4gLS0tCj4gPgo+ID4gRGVwZW5kcyBvbiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvSUExUFIyME1CNDk1M0M3NzRENDFFREYxRUFEQjZFQzE4QkI2
RDJASUExUFIyME1CNDk1My5uYW1wcmQyMC5wcm9kLm91dGxvb2suY29tLwo+ID4KPgo+IFdoeT8K
Pgo+IEhvdyBjb3VsZCBhIFJUQyBkcml2ZXIgZGVwZW5kIG9uIGNsb2NrIGRyaXZlciBvciBjbG9j
ayBiaW5kaW5ncz8gVGhpcwo+IGxvb2tzIHdyb25nIGFuZCBpdCBwcmV2ZW50cyB5b3VyIGRyaXZl
ciBiZWluZyBtZXJnZWQgdmlhIGVhc3kgcGF0aC4KClRoYW5rcyxJIHdpbGwgZml4IGl0LgoKPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1jdjE4MDAuYyBiL2RyaXZlcnMvcnRjL3J0
Yy1jdjE4MDAuYwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAw
MC4uZmJmMmU1NzVlYTk0Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9kcml2ZXJzL3J0Yy9y
dGMtY3YxODAwLmMKPiA+IEBAIC0wLDAgKzEsNDA2IEBACj4gPiArLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ID4gKy8qCj4gPiArICogcnRjLWN2MTgwMC5jOiBSVEMg
ZHJpdmVyIGZvciBTb3BoZ28gY3YxODAwIFJUQwo+ID4gKyAqCj4gPiArICogQXV0aG9yOiBKaW5n
YmFvIFFpdSA8cWl1amluZ2Jhby5kbG11QGdtYWlsLmNvbT4KPiA+ICsgKi8KPiA+ICsjaW5jbHVk
ZSA8bGludXgva2VybmVsLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgo+ID4gKyNpbmNs
dWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvaXJxLmg+Cj4gPiArI2lu
Y2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3J0Yy5oPgo+ID4gKyNp
bmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvbWZk
L3N5c2Nvbi5oPgo+Cj4gRHJvcAoKVGhhbmtzLCBJIHdpbGwgZG8gdGhhdC4KCj4KPiA+ICsjaW5j
bHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4KPiBLZWVw
IHRoZSBpbmNsdWRlcyBzb3J0ZWQsIHByZWZmZXJhYmx5IGFscGhhYmV0aWNhbGx5LgoKVGhhbmsg
eW91IGZvciB5b3VyIHN1Z2dlc3Rpb24uSSB3aWxsIGRvIHRoYXQuCgo+Cj4gLi4uCj4KPiA+ICsK
PiA+ICtzdGF0aWMgaW50IGN2MTgwMF9ydGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgY3YxODAwX3J0Y19wcml2ICpydGM7Cj4gPiAr
ICAgICB1aW50MzJfdCBjdHJsX3ZhbDsKPiA+ICsgICAgIHZvaWQgX19pb21lbSAqYmFzZTsKPiA+
ICsgICAgIGludCByZXQ7Cj4gPiArCj4gPiArICAgICBydGMgPSBkZXZtX2t6YWxsb2MoJnBkZXYt
PmRldiwgc2l6ZW9mKHN0cnVjdCBjdjE4MDBfcnRjX3ByaXYpLAo+Cj4gc2l6ZW9mKCopCgpJIHdp
bGwgZG8gdGhhdC4KCj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMKTsK
PiA+ICsgICAgIGlmICghcnRjKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiA+
ICsKPiA+ICsgICAgIGJhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwg
MCk7Cj4gPiArICAgICBpZiAoSVNfRVJSKGJhc2UpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4g
UFRSX0VSUihiYXNlKTsKPiA+ICsKPiA+ICsgICAgIHJ0Yy0+cnRjX21hcCA9Cj4KPiBVbm5lZWRl
ZCBibGFuayBsaW5lLiBEb24ndCB3cmFwIGF0ID0uCgpUaGFua3MsIEkgd2lsbCBkbyB0aGF0LgoK
QmVzdCByZWdhcmRzLApKaW5nYmFvIFFJdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
