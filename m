Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444E5C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 17:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3aNwRG49+8O9AMs/7v1aIKorxORiHSdLgw9s5bd62s=; b=RO8HnA0tqtmspm
	3Q5qbbjAYJOb5yCcTMa5LJuWPi4MuCXUr57vvJUNYZ9Ahd2no3iC6xNja9eam+q91swvmThbfruqj
	apqu/F9DKnfZZCDkBEeNLN2L80++f2L6x8fvR8NI50L+kFyxKURCcgwKuMG/05ctFva4ZWtngAMAU
	sCXtHFbrWAv6BruWTP9rxUMK4vS/Dq1aUe8vReIAvz4ssHRqFUT5FRs7CVHdomvqHGhPk90XazIo4
	ipMq/SaTAu0GuAM/oN7acxWJ6dQov+srf/vzeVGBoMRPYHHSqbF5x2eHHbuGkk1xBwyRorKoFneQS
	ViqWUh8Lczet1fcsHyMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMaW-003b5T-1m;
	Thu, 21 Dec 2023 17:12:00 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMaQ-003b3J-1K;
	Thu, 21 Dec 2023 17:11:59 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-553eb74df60so1228637a12.0;
        Thu, 21 Dec 2023 09:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703178713; x=1703783513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8c7qdOK44Erw1rd2N9Dkc3C/rkBrTjfjshoie/DwZvs=;
        b=HQkr4H6v1hXbAez2+sx0uW138oIoDmsK2vb8UMli/VXTei6LGmD8pAzmliB7WG3Drv
         V6ayezHpddKmqFiO3xp5gDucpTTYVeWY+2oeQdm5X+sxJGYUdv4zyLeTSa9rPb4/spzG
         rRDXv/Pb4KtAba0X/4WBxF/wyLAptRIhVOAj3AQ8BLxz/WLyM6ZW97BFWAl17y4Q0/Wd
         amGfllABtk/26nLd0xWvd1gl3NZFKYe8F05r3f+J4W1IM4O+o4dMy/ZbuRL2eHL37fIv
         2I9UyVemLOK37VVEefXcbFY1RTDHBKgfjPdQtaFOpjR+SFdavPfyRneZdA3sbCRocr6a
         qVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703178713; x=1703783513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8c7qdOK44Erw1rd2N9Dkc3C/rkBrTjfjshoie/DwZvs=;
        b=qY1rkU5U9OGs4BIg36HEZzQjAL5rYTjZtRsVavJORyA/DR8NHNIP6mMCUbcGqs+G+Z
         umCX4NgLgsh3SzT5S0uSkZjOQDqMcL+aHw5+/lsaeu1JH+oJC/hH6P5GE+xaKKOs8toF
         LjFa5IAxesAjEQHALPIg3nuRf1sutC4LjhEnyO+wFhyT2MaISKxTSAYKcnvxMWAlJYZ5
         VJ8XKu4IngpmvuPmGIcw5nNTfSCzORpqQbRbLau1VMvOvHEtncblh5VmLGTXWVXzYuA+
         HV9by2hz5fJX1yAHIUtBhVrCVsrGjLKCvDCNHaz6U7I0d0htTcnoXd81eKT8/Y46z1fa
         YGFQ==
X-Gm-Message-State: AOJu0YwbDoq+Si8aPoJQwrpvJORrYy2KKxcFKnmf0FrKBsP6ynyiDiib
	5EeAOpXlqVezVT98YYWRmX4=
X-Google-Smtp-Source: AGHT+IHNiAZdFnzAEiUdKfNoeSk+geKiEkWgT/aPnMVG9zgCLJmSuW1YXNdZkHxCVKCqsDhOaSRiwg==
X-Received: by 2002:a50:c057:0:b0:54b:27e7:f965 with SMTP id u23-20020a50c057000000b0054b27e7f965mr12048802edd.19.1703178712653;
        Thu, 21 Dec 2023 09:11:52 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.204])
        by smtp.gmail.com with ESMTPSA id b24-20020a056402139800b0054cb316499dsm1400760edv.10.2023.12.21.09.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 09:11:52 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: andre.przywara@arm.com
Cc: aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	fusibrandon13@gmail.com,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	rafael@kernel.org,
	robh+dt@kernel.org,
	samuel@sholland.org,
	sfr@canb.auug.org.au,
	tiny.windzz@gmail.com,
	viresh.kumar@linaro.org,
	wens@csie.org
Subject: Re: [RFC PATCH v2 2/3] cpufreq: sun50i: Add support for D1's speed bin decoding
Date: Thu, 21 Dec 2023 18:11:07 +0100
Message-Id: <20231221171107.85991-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231221124957.27fa9922@donnerap.manchester.arm.com>
References: <20231221124957.27fa9922@donnerap.manchester.arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_091154_467264_F42ED9A0 
X-CRM114-Status: GOOD (  37.30  )
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

T24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTo1MOKAr1BNIEFuZHJlIFByenl3YXJhIDxhbmRyZS5w
cnp5d2FyYUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIFRodSwgMjEgRGVjIDIwMjMgMTE6MTA6MTIg
KzAxMDAKPiBCcmFuZG9uIENoZW8gRnVzaSA8ZnVzaWJyYW5kb24xM0BnbWFpbC5jb20+IHdyb3Rl
Ogo+Cj4gSGkgQnJhbmRvbiwKPgo+IHRoYW5rcyBmb3IgdGhlIHF1aWNrIHR1cm5hcm91bmQsIGFu
ZCBmb3Igc3BsaXR0aW5nIHRoaXMgY29kZSB1cCwgdGhhdAo+IG1ha2VzIHJlYXNvbmluZyBhYm91
dCB0aGlzIG11Y2ggZWFzaWVyIQo+Cj4gPiBBZGRzIHN1cHBvcnQgZm9yIGRlY29kaW5nIHRoZSBl
ZnVzZSB2YWx1ZSByZWFkIGZyb20gRDEgZWZ1c2Ugc3BlZWQKPiA+IGJpbnMsIGFuZCBmYWN0b3Jz
IG91dCBlcXVpdmFsZW50IGNvZGUgZm9yIHN1bjUwaS4KPiA+Cj4gPiBUaGUgYWxnb3JpdGhtIGlz
IGdvdHRlbiBmcm9tCj4gPgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL1RpbmEtTGludXgvbGludXgt
NS40L2Jsb2IvbWFzdGVyL2RyaXZlcnMvY3B1ZnJlcS9zdW41MGktY3B1ZnJlcS1udm1lbS5jI0wy
OTMtTDMzOAo+ID4KPiA+IGFuZCBtYXBzIGFuIGVmdXNlIHZhbHVlIHRvIGVpdGhlciAwIG9yIDEs
IHdpdGggMSBtZWFuaW5nIHN0YWJsZSBhdAo+ID4gYSBsb3dlciBzdXBwbHkgdm9sdGFnZSBmb3Ig
dGhlIHNhbWUgY2xvY2sgZnJlcXVlbmN5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJyYW5kb24g
Q2hlbyBGdXNpIDxmdXNpYnJhbmRvbjEzQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMv
Y3B1ZnJlcS9zdW41MGktY3B1ZnJlcS1udm1lbS5jIHwgMzQgKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2NwdWZyZXEvc3VuNTBpLWNwdWZyZXEtbnZtZW0uYyBiL2RyaXZlcnMv
Y3B1ZnJlcS9zdW41MGktY3B1ZnJlcS1udm1lbS5jCj4gPiBpbmRleCBmYzUwOWZjNDkuLmIxY2I5
NTMwOCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvY3B1ZnJlcS9zdW41MGktY3B1ZnJlcS1udm1l
bS5jCj4gPiArKysgYi9kcml2ZXJzL2NwdWZyZXEvc3VuNTBpLWNwdWZyZXEtbnZtZW0uYwo+ID4g
QEAgLTI5LDYgKzI5LDMzIEBAIHN0cnVjdCBzdW54aV9jcHVmcmVxX2RhdGEgewo+ID4gICAgICAg
dTMyICgqZWZ1c2VfeGxhdGUpKHUzMiAqc3BlZWRiaW4sIHNpemVfdCBsZW4pOwo+ID4gIH07Cj4g
Pgo+ID4gK3N0YXRpYyB1MzIgc3VuMjBpX2VmdXNlX3hsYXRlKHUzMiAqc3BlZWRiaW4sIHNpemVf
dCBsZW4pCj4KPiBJIGZlZWwgbGlrZSB0aGlzIHByb3RvdHlwZSBjYW4gYmUgc2hvcnRlbmVkIHRv
Ogo+Cj4gc3RhdGljIHUzMiBzdW4yMGlfZWZ1c2VfeGxhdGUodTMyIHNwZWVkYmluKQo+Cj4gU2Vl
IGJlbG93Lgo+Cj4gPiArewo+ID4gKyAgICAgdTMyIHJldCwgZWZ1c2VfdmFsdWUgPSAwOwo+ID4g
KyAgICAgaW50IGk7Cj4gPiArCj4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgbGVuOyBpKyspCj4g
PiArICAgICAgICAgICAgIGVmdXNlX3ZhbHVlIHw9ICgodTMyKXNwZWVkYmluW2ldIDw8IChpICog
OCkpOwo+Cj4gVGhlIGNhc3QgaXMgbm90IG5lZWRlZC4gTG9va2luZyBkZWVwZXIgaW50byB0aGUg
b3JpZ2luYWwgY29kZSB5b3UgbGlua2VkCj4gdG8sIGNlbGxfdmFsdWVbXSB0aGVyZSBpcyBhbiBh
cnJheSBvZiB1OCwgc28gdGhleSBhc3NlbWJsZSBhIGxpdHRsZSBlbmRpYW4KPiAzMi1iaXQgaW50
ZWdlciBmcm9tICp1cCB0byogZm91ciA4LWJpdCB2YWx1ZXMgcmVhZCBmcm9tIHRoZSBudm1lbS4K
Pgo+IFNvIEkgdGhpbmsgdGhpcyBjb2RlIGhlcmUgaXMgd3JvbmcsIGxlbiBpcyB0aGUgc2l6ZSBv
ZiB0aGUgbnZtZW0gY2VsbHMKPiBob2xkaW5nIHRoZSBiaW4gaWRlbnRpZmllciwgaW4gKmJ5dGVz
Kiwgc28gdGhlIGlkZWEgaGVyZSBpcyB0byBqdXN0IHJlYWQKPiB0aGUgKGxvd2VzdCkgMTYgYml0
cyAoaW4gdGhlIEQxIGNhc2UsIGNmLiAicmVnID0gPDB4MDAgMHgyPjsiIGluIHRoZSBuZXh0Cj4g
cGF0Y2gpIGZyb20gdGhpcyBudm1lbSBjZWxsLiBIZXJlIHlvdSBhcmUgY29tYmluaW5nIHR3byAz
Mi1iaXQgd29yZHMgaW50bwoKVGhpcyBpcyB0cnVlLiBOb3Qgc3VyZSB0aG91Z2ggd2hhdCB0aGUg
J2luIHRoZSBEMSBjYXNlLi4uJyBiaXQgbWVhbnMuCgo+IGVmdXNlX3ZhbHVlLgo+Cj4gU28gSSB0
aGluayB0aGlzIHdob2xlIHBhcnQgYWJvdmUgaXMgYWN0dWFsbHkgbm90IG5lY2Vzc2FyeTogd2Ug
YXJlCj4gZXhwZWN0aW5nIG1heGltdW0gMzIgYml0cywgYW5kIG52bWVtX2NlbGxfcmVhZCgpIHNo
b3VsZCB0YWtlIGNhcmUgb2YKPiBtYXNraW5nIG9mZiB1bnJlcXVlc3RlZCBiaXRzLCBzbyB3ZSBn
ZXQgdGhlIGNvcnJlY3QgdmFsdWUgYmFjayBhbHJlYWR5LiBTbwo+IGNhbiB5b3UgdHJ5IHRvIHJl
bW92ZSB0aGUgbG9vcCBhYm92ZSwgYW5kIHVzZSAuLi4KPgo+ID4gKwo+ID4gKyAgICAgc3dpdGNo
IChlZnVzZV92YWx1ZSkgewo+Cj4gICAgICAgICBzd2l0Y2ggKCpzcGVlZGJpbiAmIDB4ZmZmZikg
ewo+CgpTaG91bGRuJ3QgdGhlIGJ5dGVzIGluICpzcGVlZGJpbiBiZSByZXZlcnNlZD8gCgo+IGhl
cmUgaW5zdGVhZD8gT3IgZHJvcCB0aGUgcG9pbnRlciBhdCBhbGwsIGFuZCBqdXN0IHVzZSBvbmUg
dTMyIHZhbHVlLCBzZWUKPiB0aGUgYWJvdmUgcHJvdG90eXBlLgo+CgpJIHdhcyB1bmNvbWZvcnRh
YmxlIGRyb3BwaW5nIHRoZSBsZW4gcGFyYW1ldGVyLCBiZWNhdXNlIHRoZW4gZWFjaApwbGF0Zm9y
bSdzIGVmdXNlX3hsYXRlIHdvdWxkIGlnbm9yZSB0aGUgbnVtYmVyIG9mIHZhbGlkIGJ5dGVzIGFj
dHVhbGx5CnJlYWQuCgo+IENoZWVycywKPiBBbmRyZQo+Cj4gUC5TLiBUaGlzIGlzIGp1c3QgYSAi
cGVlcGhvbGUgcmV2aWV3IiBvZiB0aGlzIHBhdGNoLCBJIGhhdmVuJ3QgZ290IGFyb3VuZAo+IHRv
IGxvb2sgYXQgdGhpcyB3aG9sZSBzY2hlbWUgaW4gd2hvbGUgeWV0LCB0byBzZWUgaWYgd2UgYWN0
dWFsbHkgbmVlZCB0aGlzCj4gb3IgY2FuIHNpbXBsaWZ5IHRoaXMgb3IgY2xlYW4gaXQgdXAuCj4K
Pgo+ID4gKyAgICAgY2FzZSAweDVlMDA6Cj4gPiArICAgICAgICAgICAgIC8qIFFGTiBwYWNrYWdl
ICovCj4gPiArICAgICAgICAgICAgIHJldCA9IDA7Cj4gPiArICAgICAgICAgICAgIGJyZWFrOwo+
ID4gKyAgICAgY2FzZSAweDVjMDA6Cj4gPiArICAgICBjYXNlIDB4NzQwMDoKPiA+ICsgICAgICAg
ICAgICAgLyogUUZOIHBhY2thZ2UgKi8KPiA+ICsgICAgICAgICAgICAgcmV0ID0gMTsKPiA+ICsg
ICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICBjYXNlIDB4NTAwMDoKPiA+ICsgICAgIGRlZmF1
bHQ6Cj4gPiArICAgICAgICAgICAgIC8qIEJHQSBwYWNrYWdlICovCj4gPiArICAgICAgICAgICAg
IHJldCA9IDA7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICByZXR1cm4gcmV0Owo+ID4gK30K
PiA+ICsKPiA+ICBzdGF0aWMgdTMyIHN1bjUwaV9lZnVzZV94bGF0ZSh1MzIgKnNwZWVkYmluLCBz
aXplX3QgbGVuKQo+ID4gIHsKPiA+ICAgICAgIHUzMiBlZnVzZV92YWx1ZSA9IDA7Cj4gPiBAQCAt
NDYsNiArNzMsMTAgQEAgc3RhdGljIHUzMiBzdW41MGlfZWZ1c2VfeGxhdGUodTMyICpzcGVlZGJp
biwgc2l6ZV90IGxlbikKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+
ICtzdHJ1Y3Qgc3VueGlfY3B1ZnJlcV9kYXRhIHN1bjIwaV9jcHVmcmVxX2RhdGEgPSB7Cj4gPiAr
ICAgICAuZWZ1c2VfeGxhdGUgPSBzdW4yMGlfZWZ1c2VfeGxhdGUsCj4gPiArfTsKPiA+ICsKPiA+
ICBzdHJ1Y3Qgc3VueGlfY3B1ZnJlcV9kYXRhIHN1bjUwaV9jcHVmcmVxX2RhdGEgPSB7Cj4gPiAg
ICAgICAuZWZ1c2VfeGxhdGUgPSBzdW41MGlfZWZ1c2VfeGxhdGUsCj4gPiAgfTsKPiA+IEBAIC01
NCw2ICs4NSw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGNwdV9vcHBfbWF0
Y2hfbGlzdFtdID0gewo+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNTBp
LWg2LW9wZXJhdGluZy1wb2ludHMiLAo+ID4gICAgICAgICAuZGF0YSA9ICZzdW41MGlfY3B1ZnJl
cV9kYXRhLAo+ID4gICAgICAgfSwKPiA+ICsgICAgIHsgLmNvbXBhdGlibGUgPSAiYWxsd2lubmVy
LHN1bjIwaS1kMS1vcGVyYXRpbmctcG9pbnRzIiwKPiA+ICsgICAgICAgLmRhdGEgPSAmc3VuMjBp
X2NwdWZyZXFfZGF0YSwKPiA+ICsgICAgIH0sCj4gPiAgICAgICB7fQo+ID4gIH07Cj4gPgo+CgpU
aGFuayB5b3UgZm9yIHJldmlld2luZy4KQnJhbmRvbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
