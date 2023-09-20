Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BDFCE79AB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 09:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kR/JOhFAeREb7f6RTzK/2sAxIRaBNNrQli/UB0rZNK0=; b=tvhuEG32ihxjar
	AfFFSKuiNzQ/HUft5QztR4knuV+7u6AaeRDd6UEwAGpgmSFzsEc56LXtvtF722YIlJna6MxGP3LSs
	YJE7BIwUIwM868edDfujptKE3ktKc6H8GO5gn4M85ckv68Cr2pbhKltQyOZQLCkC8OBrPajC/7CUi
	pZWo1GDCfRSKiFNCoPIXM2BTnCQ7thC6nNVdUYL0X+osTnFLTrM9n2/VpJi333IcMwGdxAuhW4kJC
	8FMpVOlhr0Ib+6EBlwmzHgLIhQtF08VgujJA5+rN8hxzzVMumJ9Y3BgKWn2yODkVEOaDAauuwMFv7
	Jnyn/RUfOroLMSovaoQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qitIE-002QxD-2H;
	Wed, 20 Sep 2023 09:14:46 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qitIB-002QwJ-0E
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 09:14:44 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-45289a987ddso703911137.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 02:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695201281; x=1695806081; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mF6CeWKLwBn15UINCBFcbVA7YfC1Xb7XUsRVvGCQiA=;
        b=HD4rTFL+e8sPIW75SsQ3Sza4zkcClE11wShbPtzqHEqp3RiPdfRWbaYcSWpSjQkJEi
         qDwz4M6XEM+573Huo+N8o9a6GbTfGiJeHeHa37oOZ0nRDaf3h35+n2fp3OIo5ESL2vzp
         yCtHQPen1JLcLMkBVE6/Sq3IHgrCyG5uCzGjksd/U184WXNfFNbxr/rX3cTl8M5fT+4n
         oJ1CFlnVgAE0vVkfr15WDtS6LVAhIrzjXVewsh9tXV1tRqrDQYNDDgq54IOBsvdW3QGf
         Hdr5rXnc4m7QozgvjBQZN042MAdTA/atzOHaMs0ojWxZy+VLI6Ks9fnQ5oKa2MmMJhXZ
         DYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695201281; x=1695806081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mF6CeWKLwBn15UINCBFcbVA7YfC1Xb7XUsRVvGCQiA=;
        b=JLROz9jZE1IAr4t9lGCTDN2ziGea2xZWBPjHUFKnjHi24xS8YVAeVo8LQHdfS2mn//
         Om8/LVnWFtomvs5VphRVWh8r3qPrCop4GVuzTVz9yNKMGZM5ryrF9Cs3R5tf30gBHaql
         g5fbYj6SqYZTzEBaxsfGNuDqp0sE4kiY5Cee6UR8Giz6/uRJv+QhVFH952js8SGZXDKV
         YtoXnP3mP51PO3ORx0E1YtVpFBqrGAWNugWKcAO405v1nT5yehDqYD9hUq2iHPdouGrB
         qSlWOMuLNv+YvG0Jm/FcDT5s6hiuy0y8GvlUd74aGdZ2QtN/1A0Om0YOIJd6ObeVoSgr
         n7Eg==
X-Gm-Message-State: AOJu0YyU714/E2muQlwgjY3Sdb1WqPj816uxIuHAauojP4mKhnwdbeLF
	zfQtF4CV73VMcJJwDcMAsRoP90soVbWc2arpGaI=
X-Google-Smtp-Source: AGHT+IGxzQADeWT6kYJOJKC8HUxl0HRk5ruso9MvtCd8ytX6mRPXAwEeqntPJQ9v3bijs8zJu0D+of8PjYf6VROe+40=
X-Received: by 2002:a67:ebc1:0:b0:452:6fc1:a3e5 with SMTP id
 y1-20020a67ebc1000000b004526fc1a3e5mr1782743vso.1.1695201280888; Wed, 20 Sep
 2023 02:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <dbd7d823a73d8a9484efcd55f6616f5392daf608.1695189879.git.wangchen20@iscas.ac.cn>
 <20230920-unable-impish-373fd26b7d16@wendy>
In-Reply-To: <20230920-unable-impish-373fd26b7d16@wendy>
From: Chen Wang <unicornxw@gmail.com>
Date: Wed, 20 Sep 2023 17:14:29 +0800
Message-ID: <CAHAQgRAj74HJ2j_Rt+hGxps9T3E1z9c+s61aa-dneWgPmnD2cw@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: vendor-prefixes: add milkv/sophgo
To: Conor Dooley <conor.dooley@microchip.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	guoren@kernel.org, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_021443_106057_95C77CC9 
X-CRM114-Status: GOOD (  14.61  )
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

UmVnYXJkcywKCnVuaWNvcm54CgpDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAu
Y29tPiDkuo4yMDIz5bm0OeaciDIw5pel5ZGo5LiJIDE2OjIz5YaZ6YGT77yaCj4KPiBZbywKPgo+
IE9uIFdlZCwgU2VwIDIwLCAyMDIzIGF0IDAyOjM3OjI4UE0gKzA4MDAsIENoZW4gV2FuZyB3cm90
ZToKPiA+IEFkZCBuZXcgdmVuZG9yIHN0cmluZ3MgdG8gZHQgYmluZGluZ3MuCj4gPiBUaGVzZSBu
ZXcgdmVuZG9yIHN0cmluZ3MgYXJlIHVzZWQgYnkKPiA+IC0gU29waGdvIFNHMjA0MiBTb0MgWzFd
Cj4gPiAtIE1pbGstViBQaW9uZWVyIGJvYXJkIFsyXSwgd2hpY2ggdXNlcyBTRzIwNDIgY2hpcC4K
PiA+Cj4gPiBbMV06IGh0dHBzOi8vZW4uc29waGdvLmNvbS9wcm9kdWN0L2ludHJvZHVjZS9zZzIw
NDIuaHRtbAo+ID4gWzJdOiBodHRwczovL21pbGt2LmlvL3Bpb25lZXIKPgo+IElmIHlvdSByZXNl
bmQsIG1ha2UgdGhlc2UgbGluayB0YWdzIHBsZWFzZS4gT3RoZXJ3aXNlLAo+IFJldmlld2VkLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ClN1cmUsIEkgd2ls
bCBjb3JyZWN0IHRoZW0gaW4gbmV4dCByZXZpc2lvbi4gVGhhbmtzLgoKPiBUaGFua3MsCj4gQ29u
b3IuCj4KPiA+IEFja2VkLWJ5OiBYaWFvZ3VhbmcgWGluZyA8eGlhb2d1YW5nLnhpbmdAc29waGdv
LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IENoZW4gV2FuZyA8d2FuZ2NoZW4yMEBpc2Nhcy5hYy5j
bj4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3It
cHJlZml4ZXMueWFtbCB8IDQgKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3ZlbmRvci1wcmVmaXhlcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3ZlbmRvci1wcmVmaXhlcy55YW1sCj4gPiBpbmRleCA1NzM1NzhkYjk1MDkuLmZjY2E5ZTA3MGE5
YSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5k
b3ItcHJlZml4ZXMueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCj4gPiBAQCAtODYzLDYgKzg2Myw4IEBAIHBhdHRlcm5Q
cm9wZXJ0aWVzOgo+ID4gICAgICBkZXNjcmlwdGlvbjogTWlrcm9FbGVrdHJvbmlrYSBkLm8uby4K
PiA+ICAgICJebWlrcm90aWssLioiOgo+ID4gICAgICBkZXNjcmlwdGlvbjogTWlrcm9UaWsKPiA+
ICsgICJebWlsa3YsLioiOgo+ID4gKyAgICBkZXNjcmlwdGlvbjogTWlsa1YgVGVjaG5vbG9neSBD
by4sIEx0ZAo+ID4gICAgIl5taW5pYW5kLC4qIjoKPiA+ICAgICAgZGVzY3JpcHRpb246IE1pbmlh
bmQgVGVjaAo+ID4gICAgIl5taW5peCwuKiI6Cj4gPiBAQCAtMTI3Myw2ICsxMjc1LDggQEAgcGF0
dGVyblByb3BlcnRpZXM6Cj4gPiAgICAgIGRlc2NyaXB0aW9uOiBTb2xvbW9uIFN5c3RlY2ggTGlt
aXRlZAo+ID4gICAgIl5zb255LC4qIjoKPiA+ICAgICAgZGVzY3JpcHRpb246IFNvbnkgQ29ycG9y
YXRpb24KPiA+ICsgICJec29waGdvLC4qIjoKPiA+ICsgICAgZGVzY3JpcHRpb246IFNvcGhnbyBU
ZWNobm9sb2d5IEluYy4KPiA+ICAgICJec291cmNlcGFydHMsLioiOgo+ID4gICAgICBkZXNjcmlw
dGlvbjogU291cmNlIFBhcnRzIEluYy4KPiA+ICAgICJec3BhbnNpb24sLioiOgo+ID4gLS0KPiA+
IDIuMjUuMQo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
