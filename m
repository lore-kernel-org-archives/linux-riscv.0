Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086EDEE0207
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 19:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZX4AbagfADqaoVnU7UmHXJqoRhmq6EqSBGa3dfVbtY=; b=4Tdreu1e3IxXgU
	pN6+bt8KBAv7yrYqhqKUkvmXNTEQLLDaEAstr40Fw0MyxkWrOCx1NONQAHV7ZhYefKRmLhAOwnaee
	3CjtnhwDSF0SgXVqXo8Hg8hpCBM/MYlwUHC0ynwBjLBWjaozBumeK3WgQ8RMEpOkvEan+NHWynAsb
	LDcDQPumvjAquiKQ5Ev9v2g1Co3Utb/08CIMmszDT7THEBWdojWwagF2YfcBNcKyi8mtfkQnoFpes
	E5cKN8CqyIlh+ZSlzA3Z+HmhF6Ab3UW+kMgPN7ZZrc3zCUPZs+v997cQzRXc0KqBlQIH58F6BCtKA
	tvgT9o1SnT0jwvgWet9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgVYH-006c2f-2N;
	Wed, 13 Sep 2023 19:29:29 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgVYE-006c1T-1m
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 19:29:28 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so124903f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 12:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694633363; x=1695238163; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T31Y6ADFFsmyLBOtJgWzvVVmYv2JScM5XB6j3nMa+Gc=;
        b=e1h18vB/1nH4cY2drxzzLQ/rgagGu7KPr3iVP16gGJ7YWu9MpNhjrJiJgEWDl8yFsu
         mTLiftpS5HBnLLFvDDxR0L50bDg9+Mr6BHUqvBxooC0kGkU2tRksv1AMDyCkofToLzpy
         jMLnO2w59RMUSftry7V7ukpw8My/csyT3zrMv0Tz68UVGMxVnxQ7LjZKA3n4yTZXG/5V
         RT0VYaZEQ2K/8UaJ5SvBS+05BiymmcXbwOMSq3pQNjHS3Gqob+WmROC0QjYZQ/wdg0AC
         eWsdiDUtE0AvvIPrlRD8DJ8o+U65SwEndyhnb81rukT1k1A37LhzcvbL/dTWuO/4Exl8
         EKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694633363; x=1695238163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T31Y6ADFFsmyLBOtJgWzvVVmYv2JScM5XB6j3nMa+Gc=;
        b=uVVqf3iJXs9owCYEn2QuAcEZMBpsD6csP8TrFsoywme0MxdvVWgrkuT+ed+LHhxpML
         +O+WgUxfaynPqNbQmRYIUl9Xf4l5cmzQBTHIvoNEs3b70SZg4k7mrxkt4sBfHb5sT2jR
         G3Eo/7eFGP415nYPy4L9Zho3w3Wzkki85gq5B3s48PbpbXodxWJj0j98949Rdy2mbwzi
         siISQcqWhYJb+Ier5LGbE3fdzk/Kd9xnGcUKfp/CFus1hlwYFY8JLswylNJ4hV7oNG6H
         Evr60v3f0QU6P9KVV3ocb/D1A06yy69YlptTgBjJBFLPJg68QA7MWX2Mbm0QxrW5Sdk3
         y5wA==
X-Gm-Message-State: AOJu0YwE+KlyIoxWiou1mHK/HzKybUTbz4+gfusTOE+oSFKdtPs+ztcv
	60k3FLX6EWLS9y/cIVDLxrIeRcL7KLNiRJ3aQZTRXA==
X-Google-Smtp-Source: AGHT+IHK0TxwXTM7W/Z/2U4oklSQq+A9o1xceZ58v8xaUK+4Sl0mHqbws39rl1USVjfGjxquBf3yRbhTTcj7nvSi7Mg=
X-Received: by 2002:adf:b606:0:b0:31f:d15a:2230 with SMTP id
 f6-20020adfb606000000b0031fd15a2230mr571220wre.20.1694633362747; Wed, 13 Sep
 2023 12:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230913162458.2931065-1-peterlin@andestech.com>
In-Reply-To: <20230913162458.2931065-1-peterlin@andestech.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 13 Sep 2023 21:29:11 +0200
Message-ID: <CAHVXubhB_FY7Vc7105J_SuS8JbvVSyKTbtaamY1HPngyXRmWXA@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: Improve PTDUMP to show RSW with non-zero value
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	david@redhat.com, akpm@linux-foundation.org, bjorn@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ycliang@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_122926_595806_D13E7D6B 
X-CRM114-Status: GOOD (  25.42  )
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

SGkgWXUsCgpPbiBXZWQsIFNlcCAxMywgMjAyMyBhdCA2OjI14oCvUE0gWXUgQ2hpZW4gUGV0ZXIg
TGluCjxwZXRlcmxpbkBhbmRlc3RlY2guY29tPiB3cm90ZToKPgo+IFJTVyBmaWVsZCBpcyBhbGxv
d2VkIHRvIGVuY29kZSAyIGJpdHMgb2YgaW5mb3JtYXRpb24sIGN1cnJlbnRseQo+IFBURFVNUCBv
bmx5IHByaW50cyBSU1cgd2hlbiBpdHMgdmFsdWUgaXMgMSBvciAzLgo+Cj4gVG8gZml4IHRoaXMg
aXNzdWUgYW5kIGVuaGFuY2UgdGhlIGRlYnVnIGV4cGVyaWVuY2Ugd2l0aCBQVERVTVAsCj4gYWxs
b3cgaXQgdG8gcHJpbnQgdGhlIFJTVyB3aXRoIGFueSBub24temVybyB2YWx1ZSwgb3RoZXJ3aXNl
LAo+IGl0IHdpbGwgcHJpbnQgYSBlbXB0eSBzdHJpbmcgZm9yIGVhY2ggcm93Lgo+Cj4gVGhpcyBw
YXRjaCBhbHNvIHJlbW92ZXMgdGhlIHZhbCBmcm9tIHRoZSBzdHJ1Y3QgcHJvdF9iaXRzCj4gYXMg
aXQgaXMgbm8gbG9uZ2VyIG5lZWRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1IENoaWVuIFBldGVy
IExpbiA8cGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wZ3RhYmxlLWJpdHMuaCB8ICAyICstCj4gIGFyY2gvcmlzY3YvbW0vcHRkdW1wLmMgICAg
ICAgICAgICAgICAgfCAzMyArKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtYml0cy5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wZ3RhYmxlLWJpdHMuaAo+IGluZGV4IGY4OTY3MDhlODMzMS4uZDVlODI4YjdkN2M2
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS1iaXRzLmgKPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtYml0cy5oCj4gQEAgLTE2LDcgKzE2
LDcgQEAKPiAgI2RlZmluZSBfUEFHRV9HTE9CQUwgICAgKDEgPDwgNSkgICAgLyogR2xvYmFsICov
Cj4gICNkZWZpbmUgX1BBR0VfQUNDRVNTRUQgICgxIDw8IDYpICAgIC8qIFNldCBieSBoYXJkd2Fy
ZSBvbiBhbnkgYWNjZXNzICovCj4gICNkZWZpbmUgX1BBR0VfRElSVFkgICAgICgxIDw8IDcpICAg
IC8qIFNldCBieSBoYXJkd2FyZSBvbiBhbnkgd3JpdGUgKi8KPiAtI2RlZmluZSBfUEFHRV9TT0ZU
ICAgICAgKDEgPDwgOCkgICAgLyogUmVzZXJ2ZWQgZm9yIHNvZnR3YXJlICovCj4gKyNkZWZpbmUg
X1BBR0VfU09GVCAgICAgICgzIDw8IDgpICAgIC8qIFJlc2VydmVkIGZvciBzb2Z0d2FyZSAqLwoK
VGhhdCBtYWtlcyB0aGUgUEFHRV9TUEVDSUFMIGJlbG93IHVzZSB0aGUgMiBzb2Z0d2FyZSByZXNl
cnZlZCBiaXRzCnJpZ2h0PyBZb3Ugc2hvdWxkIHJlZGVmaW5lIFBBR0VfU1BFQ0lBTCB0byAoMSA8
PCA4KS4KCj4KPiAgI2RlZmluZSBfUEFHRV9TUEVDSUFMICAgX1BBR0VfU09GVAo+ICAjZGVmaW5l
IF9QQUdFX1RBQkxFICAgICBfUEFHRV9QUkVTRU5UCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
bW0vcHRkdW1wLmMgYi9hcmNoL3Jpc2N2L21tL3B0ZHVtcC5jCj4gaW5kZXggMjBhOWY5OTFhNmQ3
Li42MmJiZWExN2Q0NzUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9wdGR1bXAuYwo+ICsr
KyBiL2FyY2gvcmlzY3YvbW0vcHRkdW1wLmMKPiBAQCAtMTI5LDcgKzEyOSw2IEBAIHN0YXRpYyBz
dHJ1Y3QgcHRkX21tX2luZm8gZWZpX3B0ZF9pbmZvID0gewo+ICAvKiBQYWdlIFRhYmxlIEVudHJ5
ICovCj4gIHN0cnVjdCBwcm90X2JpdHMgewo+ICAgICAgICAgdTY0IG1hc2s7Cj4gLSAgICAgICB1
NjQgdmFsOwo+ICAgICAgICAgY29uc3QgY2hhciAqc2V0Owo+ICAgICAgICAgY29uc3QgY2hhciAq
Y2xlYXI7Cj4gIH07Cj4gQEAgLTEzNyw0NyArMTM2LDM4IEBAIHN0cnVjdCBwcm90X2JpdHMgewo+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IHByb3RfYml0cyBwdGVfYml0c1tdID0gewo+ICAgICAgICAg
ewo+ICAgICAgICAgICAgICAgICAubWFzayA9IF9QQUdFX1NPRlQsCj4gLSAgICAgICAgICAgICAg
IC52YWwgPSBfUEFHRV9TT0ZULAo+IC0gICAgICAgICAgICAgICAuc2V0ID0gIlJTVyIsCj4gLSAg
ICAgICAgICAgICAgIC5jbGVhciA9ICIgICAiLAo+ICsgICAgICAgICAgICAgICAuc2V0ID0gIlJT
VyglZCkiLAo+ICsgICAgICAgICAgICAgICAuY2xlYXIgPSAiICAgICAgIiwKPiAgICAgICAgIH0s
IHsKPiAgICAgICAgICAgICAgICAgLm1hc2sgPSBfUEFHRV9ESVJUWSwKPiAtICAgICAgICAgICAg
ICAgLnZhbCA9IF9QQUdFX0RJUlRZLAo+ICAgICAgICAgICAgICAgICAuc2V0ID0gIkQiLAo+ICAg
ICAgICAgICAgICAgICAuY2xlYXIgPSAiLiIsCj4gICAgICAgICB9LCB7Cj4gICAgICAgICAgICAg
ICAgIC5tYXNrID0gX1BBR0VfQUNDRVNTRUQsCj4gLSAgICAgICAgICAgICAgIC52YWwgPSBfUEFH
RV9BQ0NFU1NFRCwKPiAgICAgICAgICAgICAgICAgLnNldCA9ICJBIiwKPiAgICAgICAgICAgICAg
ICAgLmNsZWFyID0gIi4iLAo+ICAgICAgICAgfSwgewo+ICAgICAgICAgICAgICAgICAubWFzayA9
IF9QQUdFX0dMT0JBTCwKPiAtICAgICAgICAgICAgICAgLnZhbCA9IF9QQUdFX0dMT0JBTCwKPiAg
ICAgICAgICAgICAgICAgLnNldCA9ICJHIiwKPiAgICAgICAgICAgICAgICAgLmNsZWFyID0gIi4i
LAo+ICAgICAgICAgfSwgewo+ICAgICAgICAgICAgICAgICAubWFzayA9IF9QQUdFX1VTRVIsCj4g
LSAgICAgICAgICAgICAgIC52YWwgPSBfUEFHRV9VU0VSLAo+ICAgICAgICAgICAgICAgICAuc2V0
ID0gIlUiLAo+ICAgICAgICAgICAgICAgICAuY2xlYXIgPSAiLiIsCj4gICAgICAgICB9LCB7Cj4g
ICAgICAgICAgICAgICAgIC5tYXNrID0gX1BBR0VfRVhFQywKPiAtICAgICAgICAgICAgICAgLnZh
bCA9IF9QQUdFX0VYRUMsCj4gICAgICAgICAgICAgICAgIC5zZXQgPSAiWCIsCj4gICAgICAgICAg
ICAgICAgIC5jbGVhciA9ICIuIiwKPiAgICAgICAgIH0sIHsKPiAgICAgICAgICAgICAgICAgLm1h
c2sgPSBfUEFHRV9XUklURSwKPiAtICAgICAgICAgICAgICAgLnZhbCA9IF9QQUdFX1dSSVRFLAo+
ICAgICAgICAgICAgICAgICAuc2V0ID0gIlciLAo+ICAgICAgICAgICAgICAgICAuY2xlYXIgPSAi
LiIsCj4gICAgICAgICB9LCB7Cj4gICAgICAgICAgICAgICAgIC5tYXNrID0gX1BBR0VfUkVBRCwK
PiAtICAgICAgICAgICAgICAgLnZhbCA9IF9QQUdFX1JFQUQsCj4gICAgICAgICAgICAgICAgIC5z
ZXQgPSAiUiIsCj4gICAgICAgICAgICAgICAgIC5jbGVhciA9ICIuIiwKPiAgICAgICAgIH0sIHsK
PiAgICAgICAgICAgICAgICAgLm1hc2sgPSBfUEFHRV9QUkVTRU5ULAo+IC0gICAgICAgICAgICAg
ICAudmFsID0gX1BBR0VfUFJFU0VOVCwKPiAgICAgICAgICAgICAgICAgLnNldCA9ICJWIiwKPiAg
ICAgICAgICAgICAgICAgLmNsZWFyID0gIi4iLAo+ICAgICAgICAgfQo+IEBAIC0yMDgsMTUgKzE5
OCwyMCBAQCBzdGF0aWMgdm9pZCBkdW1wX3Byb3Qoc3RydWN0IHBnX3N0YXRlICpzdCkKPiAgICAg
ICAgIHVuc2lnbmVkIGludCBpOwo+Cj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0la
RShwdGVfYml0cyk7IGkrKykgewo+IC0gICAgICAgICAgICAgICBjb25zdCBjaGFyICpzOwo+IC0K
PiAtICAgICAgICAgICAgICAgaWYgKChzdC0+Y3VycmVudF9wcm90ICYgcHRlX2JpdHNbaV0ubWFz
aykgPT0gcHRlX2JpdHNbaV0udmFsKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHMgPSBwdGVf
Yml0c1tpXS5zZXQ7Cj4gKyAgICAgICAgICAgICAgIGNoYXIgc1s3XTsKPiArICAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyB2YWw7Cj4gKwo+ICsgICAgICAgICAgICAgICB2YWwgPSBzdC0+Y3Vy
cmVudF9wcm90ICYgcHRlX2JpdHNbaV0ubWFzazsKPiArICAgICAgICAgICAgICAgaWYgKHZhbCkg
ewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChwdGVfYml0c1tpXS5tYXNrID09IF9QQUdF
X1NPRlQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzcHJpbnRmKHMsIHB0ZV9i
aXRzW2ldLnNldCwgdmFsID4+IDgpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGVsc2UKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNwcmludGYocywgIiVzIiwgcHRlX2JpdHNb
aV0uc2V0KTsKPiArICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICBlbHNlCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgcyA9IHB0ZV9iaXRzW2ldLmNsZWFyOwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHNwcmludGYocywgIiVzIiwgcHRlX2JpdHNbaV0uY2xlYXIpOwo+Cj4gLSAg
ICAgICAgICAgICAgIGlmIChzKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHB0X2R1bXBfc2Vx
X3ByaW50ZihzdC0+c2VxLCAiICVzIiwgcyk7Cj4gKyAgICAgICAgICAgICAgIHB0X2R1bXBfc2Vx
X3ByaW50ZihzdC0+c2VxLCAiICVzIiwgcyk7Cj4gICAgICAgICB9Cj4gIH0KPgo+IC0tCj4gMi4z
NC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
