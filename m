Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1ADC83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 04:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISTKVWJZ1FGl7v7c3QJS5cEYPALhc70hz4WHfYQjEhE=; b=1rYOkL4IVcm+e8
	zlFPTOzp+kZOQpAt+8cQ0slw+K0V0pPjL8Iy7eaIXCFCTTc039SN9hLip1rQ746i9vZRmtV8Ck9yD
	+GggzwEExTam6vOJ0cMI8+nqO4+p5BTe9m6ft9cBKjPqdRFh2tPM6TDBB99Mu2BFInqTu6fQeIxaz
	XP/UHXsyGh9gyDEqeTNPWm/h3y9TuLX/YXnpihc9Wq2T46G3AUKhurt9QY/3BVNizYtn8GbA0bTXx
	fWJFCwSLq5Eh0coCyL2keW0qw7EJxaILRYUQZGBc/HpsAVAL5tSSY2AmWCfXNEX8Aq8hMb8qbOF9f
	OpA+SbLrTM+DQG2ft7Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccmS-0000000BfEY-33H3;
	Fri, 18 Jul 2025 04:33:08 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccmQ-0000000BfDb-1u2a
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 04:33:07 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-87c0166df31so103733139f.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Jul 2025 21:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752813185; x=1753417985; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BchHT2JqinVts/UeZMPzWB77o6GrLS5pyW1xcQuRic=;
        b=SNYb5LQ6lFafok8yAXgS/+ZRCn/gCbEdYzd36LziXcoJpYZcs7tFQqUCPFXcTwZ37R
         TCbImB926ejyMM6dTXvgjIOBuy/cBvzl5o1iiXMLMLcBtSDvJNhIWmkT5XyfoOIFh5qe
         hlYfIdGsj+loWQ0aRRNJdNEmzBfDWgO3Ytmj9iHhEycoE6cASPYJkw0wukbixlKqcTNX
         BevG0xmGq5+l4cZi3bFuzKvOPfLnqZ+FiVrh8k6iW129+x09yoV0AmOd2bJItJk2SaIP
         nuwU/+pbdH+vfNWZvw6OWfy6LzpQ7qBXfbc1qpSIEQq1ccKCO1IhwgluRsRo3Aq4/tN9
         bEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752813185; x=1753417985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BchHT2JqinVts/UeZMPzWB77o6GrLS5pyW1xcQuRic=;
        b=keVzJ3w8099AW+9tsQtUevuWWRbh5AJAtiRnq3ApT6ftwG+cHzSh6qeFHFzSY4IiTm
         P1mxoJxGa/yO86/KHAElUcteEcL8QzCGNbJwl8nQ6Q2woSp6qu9jaS27rrgUTd8J2rFQ
         vD07EcDtqebJdKdwUkLRfej1PjujX/JUbbO8pPjURqw0H2AMB17uRmTMN8hpKjLW2qXu
         MG5GjiCv+zVzAxQ5qXmUSNffhMk43+53SuF5TzDrq4j/G+yi7YPSLxZp/akW8P+tHPq0
         vh86lBrXS7vnlrkV7vso7MNVpuZJTv6LC2U99U0g8Vem1Hk1fQk9MGzbH5vzpFtQq0qR
         F53g==
X-Forwarded-Encrypted: i=1; AJvYcCUXjZ/yWLr0fGnsKJn6rQabDglT6bSmmk1d9T4KNg7sroRNOUPSAJ0989fP6QLwFxDVPeGt5Smlb/BojA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhOBTPcIqGa7qgcm5mv7yyErkXp2P+NCQyHfE7fXGBzj2CP/gJ
	ADQrtGNCMR2tIygVC+Sa1czmAj2XpHQhZra+nITqngPGi/lhZY+YX0FbtbVvpQfBXXmu6mtilRo
	RUzm9uK2LnvUGdVVaYP9cENxzzi7s79hQvECrLddZkg==
X-Gm-Gg: ASbGncsmenIivYWs4kwRB2FfoSkmIv+8Gm4xqwnklNIPSEimfP4fwg1kNMXuy7CPsJN
	IL21MD1hNTipMfj17xeIwgSqaI1Qc0ZEsd8cIbnB4d52anU9s/uv5/0+2swGUdKsUjirziO+KT3
	tqiz9nsAeR+WwOzlzK93R50ZNETe3HHfB4MejE6r6EGsDCREoAWMRTwK1yW8Yj2++FfWWfQim2Y
	MT8fKAT
X-Google-Smtp-Source: AGHT+IGxLSLfJEWbT94QQ9wDEPcHHk7UU5oQFPXNoEg2dmlbQDZqZkULuKjbXMOnhCheEHP/8Vs0hjk7tTvXdvuroqU=
X-Received: by 2002:a05:6e02:1488:b0:3e2:8172:25e3 with SMTP id
 e9e14a558f8ab-3e282e3961cmr83450795ab.14.1752813185443; Thu, 17 Jul 2025
 21:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-4-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-4-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Jul 2025 10:02:53 +0530
X-Gm-Features: Ac12FXz8CojGLXC08fo8TuectN9PJto19GIlEKkPXZw46d0UC0i4fpJCDCQw5Dc
Message-ID: <CAAhSdy1RyJyjus_SUOw7GUZsQLr5SFV4TZ9d7K1OEKDR27TaWQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] drivers/perf: riscv: Implement PMU event info function
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_213306_581315_73449689 
X-CRM114-Status: GOOD (  24.46  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6MzPigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBXaXRoIHRoZSBuZXcgU0JJIFBNVSBldmVudCBpbmZvIGZ1
bmN0aW9uLCB3ZSBjYW4gcXVlcnkgdGhlIGF2YWlsYWJpbGl0eQo+IG9mIHRoZSBhbGwgc3RhbmRh
cmQgU0JJIFBNVSBldmVudHMgYXQgYm9vdCB0aW1lIHdpdGggYSBzaW5nbGUgZWNhbGwuCj4gVGhp
cyBpbXByb3ZlcyB0aGUgYm9vdGltZSBieSBhdm9pZGluZyBtYWtpbmcgYW4gU0JJIGNhbGwgZm9y
IGVhY2gKPiBzdGFuZGFyZCBQTVUgZXZlbnQuIFNpbmNlIHRoaXMgZnVuY3Rpb24gaXMgZGVmaW5l
ZCBvbmx5IGluIFNCSSB2My4wLAo+IGludm9rZSB0aGlzIG9ubHkgaWYgdGhlIHVuZGVybHlpbmcg
U0JJIGltcGxlbWVudGF0aW9uIGlzIHYzLjAgb3IgaGlnaGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTog
QXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc2JpLmggfCAgOSArKysrKysKPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmku
YyB8IDY4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gaW5k
ZXggNmNlMzg1YTNhN2JiLi43N2I2OTk3ZWI2YzUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9zYmkuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiBA
QCAtMTM1LDYgKzEzNSw3IEBAIGVudW0gc2JpX2V4dF9wbXVfZmlkIHsKPiAgICAgICAgIFNCSV9F
WFRfUE1VX0NPVU5URVJfRldfUkVBRCwKPiAgICAgICAgIFNCSV9FWFRfUE1VX0NPVU5URVJfRldf
UkVBRF9ISSwKPiAgICAgICAgIFNCSV9FWFRfUE1VX1NOQVBTSE9UX1NFVF9TSE1FTSwKPiArICAg
ICAgIFNCSV9FWFRfUE1VX0VWRU5UX0dFVF9JTkZPLAo+ICB9Owo+Cj4gIHVuaW9uIHNiaV9wbXVf
Y3RyX2luZm8gewo+IEBAIC0xNTgsNiArMTU5LDE0IEBAIHN0cnVjdCByaXNjdl9wbXVfc25hcHNo
b3RfZGF0YSB7Cj4gICAgICAgICB1NjQgcmVzZXJ2ZWRbNDQ3XTsKPiAgfTsKPgo+ICtzdHJ1Y3Qg
cmlzY3ZfcG11X2V2ZW50X2luZm8gewo+ICsgICAgICAgdTMyIGV2ZW50X2lkeDsKPiArICAgICAg
IHUzMiBvdXRwdXQ7Cj4gKyAgICAgICB1NjQgZXZlbnRfZGF0YTsKPiArfTsKPiArCj4gKyNkZWZp
bmUgUklTQ1ZfUE1VX0VWRU5UX0lORk9fT1VUUFVUX01BU0sgMHgwMQo+ICsKPiAgI2RlZmluZSBS
SVNDVl9QTVVfUkFXX0VWRU5UX01BU0sgR0VOTUFTS19VTEwoNDcsIDApCj4gICNkZWZpbmUgUklT
Q1ZfUE1VX1BMQVRfRldfRVZFTlRfTUFTSyBHRU5NQVNLX1VMTCg2MSwgMCkKPiAgLyogU0JJIHYz
LjAgYWxsb3dzIGV4dGVuZGVkIGhwbWV2ZW50WCB3aWR0aCB2YWx1ZSAqLwo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9z
YmkuYwo+IGluZGV4IDI3M2VkNzAwOThhMy4uMzNkODM0OGJmNjhhIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiArKysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11
X3NiaS5jCj4gQEAgLTI5OSw2ICsyOTksNjYgQEAgc3RhdGljIHN0cnVjdCBzYmlfcG11X2V2ZW50
X2RhdGEgcG11X2NhY2hlX2V2ZW50X21hcFtQRVJGX0NPVU5UX0hXX0NBQ0hFX01BWF0KPiAgICAg
ICAgIH0sCj4gIH07Cj4KPiArc3RhdGljIGludCBwbXVfc2JpX2NoZWNrX2V2ZW50X2luZm8odm9p
ZCkKPiArewo+ICsgICAgICAgaW50IG51bV9ldmVudHMgPSBBUlJBWV9TSVpFKHBtdV9od19ldmVu
dF9tYXApICsgUEVSRl9DT1VOVF9IV19DQUNIRV9NQVggKgo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICBQRVJGX0NPVU5UX0hXX0NBQ0hFX09QX01BWCAqIFBFUkZfQ09VTlRfSFdfQ0FDSEVfUkVT
VUxUX01BWDsKPiArICAgICAgIHN0cnVjdCByaXNjdl9wbXVfZXZlbnRfaW5mbyAqZXZlbnRfaW5m
b19zaG1lbTsKPiArICAgICAgIHBoeXNfYWRkcl90IGJhc2VfYWRkcjsKPiArICAgICAgIGludCBp
LCBqLCBrLCByZXN1bHQgPSAwLCBjb3VudCA9IDA7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpcmV0IHJl
dDsKPiArCj4gKyAgICAgICBldmVudF9pbmZvX3NobWVtID0ga2NhbGxvYyhudW1fZXZlbnRzLCBz
aXplb2YoKmV2ZW50X2luZm9fc2htZW0pLCBHRlBfS0VSTkVMKTsKPiArICAgICAgIGlmICghZXZl
bnRfaW5mb19zaG1lbSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsg
ICAgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUocG11X2h3X2V2ZW50X21hcCk7IGkrKykK
PiArICAgICAgICAgICAgICAgZXZlbnRfaW5mb19zaG1lbVtjb3VudCsrXS5ldmVudF9pZHggPSBw
bXVfaHdfZXZlbnRfbWFwW2ldLmV2ZW50X2lkeDsKPiArCj4gKyAgICAgICBmb3IgKGkgPSAwOyBp
IDwgQVJSQVlfU0laRShwbXVfY2FjaGVfZXZlbnRfbWFwKTsgaSsrKSB7Cj4gKyAgICAgICAgICAg
ICAgIGZvciAoaiA9IDA7IGogPCBBUlJBWV9TSVpFKHBtdV9jYWNoZV9ldmVudF9tYXBbaV0pOyBq
KyspIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGsgPSAwOyBrIDwgQVJSQVlfU0la
RShwbXVfY2FjaGVfZXZlbnRfbWFwW2ldW2pdKTsgaysrKQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZXZlbnRfaW5mb19zaG1lbVtjb3VudCsrXS5ldmVudF9pZHggPQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG11X2Nh
Y2hlX2V2ZW50X21hcFtpXVtqXVtrXS5ldmVudF9pZHg7Cj4gKyAgICAgICAgICAgICAgIH0KPiAr
ICAgICAgIH0KPiArCj4gKyAgICAgICBiYXNlX2FkZHIgPSBfX3BhKGV2ZW50X2luZm9fc2htZW0p
Owo+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkKPiArICAgICAgICAgICAg
ICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfUE1VLCBTQklfRVhUX1BNVV9FVkVOVF9HRVRfSU5G
TywgbG93ZXJfMzJfYml0cyhiYXNlX2FkZHIpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdXBwZXJfMzJfYml0cyhiYXNlX2FkZHIpLCBjb3VudCwgMCwgMCwgMCk7Cj4gKyAgICAg
ICBlbHNlCj4gKyAgICAgICAgICAgICAgIHJldCA9IHNiaV9lY2FsbChTQklfRVhUX1BNVSwgU0JJ
X0VYVF9QTVVfRVZFTlRfR0VUX0lORk8sIGJhc2VfYWRkciwgMCwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvdW50LCAwLCAwLCAwKTsKPiArICAgICAgIGlmIChyZXQuZXJyb3Ip
IHsKPiArICAgICAgICAgICAgICAgcmVzdWx0ID0gLUVPUE5PVFNVUFA7Cj4gKyAgICAgICAgICAg
ICAgIGdvdG8gZnJlZV9tZW07Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgZm9yIChpID0gMDsg
aSA8IEFSUkFZX1NJWkUocG11X2h3X2V2ZW50X21hcCk7IGkrKykgewo+ICsgICAgICAgICAgICAg
ICBpZiAoIShldmVudF9pbmZvX3NobWVtW2ldLm91dHB1dCAmIFJJU0NWX1BNVV9FVkVOVF9JTkZP
X09VVFBVVF9NQVNLKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBwbXVfaHdfZXZlbnRfbWFw
W2ldLmV2ZW50X2lkeCA9IC1FTk9FTlQ7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgY291bnQg
PSBBUlJBWV9TSVpFKHBtdV9od19ldmVudF9tYXApOwo+ICsKPiArICAgICAgIGZvciAoaSA9IDA7
IGkgPCBBUlJBWV9TSVpFKHBtdV9jYWNoZV9ldmVudF9tYXApOyBpKyspIHsKPiArICAgICAgICAg
ICAgICAgZm9yIChqID0gMDsgaiA8IEFSUkFZX1NJWkUocG11X2NhY2hlX2V2ZW50X21hcFtpXSk7
IGorKykgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGZvciAoayA9IDA7IGsgPCBBUlJBWV9T
SVpFKHBtdV9jYWNoZV9ldmVudF9tYXBbaV1bal0pOyBrKyspIHsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGlmICghKGV2ZW50X2luZm9fc2htZW1bY291bnRdLm91dHB1dCAmCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSSVNDVl9QTVVfRVZFTlRfSU5G
T19PVVRQVVRfTUFTSykpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBtdV9jYWNoZV9ldmVudF9tYXBbaV1bal1ba10uZXZlbnRfaWR4ID0gLUVOT0VOVDsKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvdW50Kys7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgfQo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9Cj4gKwo+ICtmcmVlX21lbToK
PiArICAgICAgIGtmcmVlKGV2ZW50X2luZm9fc2htZW0pOwo+ICsKPiArICAgICAgIHJldHVybiBy
ZXN1bHQ7Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIHBtdV9zYmlfY2hlY2tfZXZlbnQoc3RydWN0
IHNiaV9wbXVfZXZlbnRfZGF0YSAqZWRhdGEpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBzYmlyZXQg
cmV0Owo+IEBAIC0zMTYsNiArMzc2LDE0IEBAIHN0YXRpYyB2b2lkIHBtdV9zYmlfY2hlY2tfZXZl
bnQoc3RydWN0IHNiaV9wbXVfZXZlbnRfZGF0YSAqZWRhdGEpCj4KPiAgc3RhdGljIHZvaWQgcG11
X3NiaV9jaGVja19zdGRfZXZlbnRzKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgewo+ICsg
ICAgICAgaW50IHJldDsKPiArCj4gKyAgICAgICBpZiAoc2JpX3YzX2F2YWlsYWJsZSkgewo+ICsg
ICAgICAgICAgICAgICByZXQgPSBwbXVfc2JpX2NoZWNrX2V2ZW50X2luZm8oKTsKPiArICAgICAg
ICAgICAgICAgaWYgKCFyZXQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwoKV2Ug
c2hvdWxkIG5vdCBmYWxsIGJhY2sgdG8gdGhlIG9sZCB3YXkgaWYgcmV0ICE9IDAuIFJhdGhlciwK
dGhlIHBtdV9zYmlfY2hlY2tfc3RkX2V2ZW50cygpIHNob3VsZCByZXR1cm4gZmFpbHVyZSBpZgpw
bXVfc2JpX2NoZWNrX2V2ZW50X2luZm8oKSBmYWlscy4KCj4gKyAgICAgICB9Cj4gKwo+ICAgICAg
ICAgZm9yIChpbnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHBtdV9od19ldmVudF9tYXApOyBpKysp
Cj4gICAgICAgICAgICAgICAgIHBtdV9zYmlfY2hlY2tfZXZlbnQoJnBtdV9od19ldmVudF9tYXBb
aV0pOwo+Cj4KPiAtLQo+IDIuNDMuMAo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
