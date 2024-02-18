Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3CFC4829E
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 06:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmIX8lof1o811eJTZCmP373gvAy4MTew53mODnRmE8c=; b=hm4bSdvXA5Hedt
	CnFTgcHzLKndszTA5jNcoR6NPDexP0iQ2tYXDxk/Fxbnl+8IcUZoEvJsmdVgxmolHvJk4MPzbtp90
	/JBgq+rVXL0HSlvg4Ed2zXtg3lGqUKEHrNS8gQqnnYbMqcsNeiGRytb1VqU9bzqAaTWdc7IKaJwQZ
	oxoH3YRqD2XTWywl1H2ZxDNn+N5VfWCSbT+7xMyQ/EjLUnGSUn6o894r4jc3LtLhGxDupdCLQd9jQ
	VYBBJ0Rk5fJxvbCT/B0XmPUJrH0MPR1iRyOsTQ9S1CeVslAT2agE4+CbpeMxCM/TJyNJjzBJ4Srsd
	7un9cM/zFb9+MXh5nU7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbarW-000000078wd-2ROm;
	Sun, 18 Feb 2024 06:41:18 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbarT-000000078w4-3Mvu;
	Sun, 18 Feb 2024 06:41:17 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2d22fa5c822so7706311fa.2;
        Sat, 17 Feb 2024 22:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708238473; x=1708843273; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0Y6u+5ShCMCnWeHjQjEcItSyrNAyQ4PzYVN7xsknZY=;
        b=ONNUnc5O5d8FVgxyLQXphhHjM8tPUAY8w84/zulq6oTnBQHKckyxHZQrN6CziSIxuk
         CVp2FT05hhI+xFMELHCFzdttDk0bOaI52eTJD9q8UHEZrlSx7FfLia9AfvSaK2vV9UmP
         JCW+pho6JNEhjjapsID63mrwCooaqAjGLetuUrwHjYuzvUw8PEo4GOdPsO2ulO/A7FqA
         zpc+B+dikLWPsjPdBPGMOQYMgBf7A6CdaKEGSEqS+1dfAzJwSLjbhPvNASXzF7Jdx7fP
         ifUQwzATaX0VcTMm1265VODIEClkFj6NWTUJg6UVnkCvLmxzceV9PeldijrT6VmW5NeX
         zIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708238473; x=1708843273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0Y6u+5ShCMCnWeHjQjEcItSyrNAyQ4PzYVN7xsknZY=;
        b=qkM1ZdFuUvuWVcN2wItuax/2AkXmScSuZsAr/Q1UUU8deRPQOpVdzNSnPH5IcrgA3n
         xd02X67NmMq9rRj67U/6rFo56cGfi8MpDlfFyLgq3nYtEKZsMeaszO5i+GD8qcptamXC
         duJ62J5X1NKQsHBZrGBIHYAgWt8kqmnR0lTMiTUI+WKzml67dLMRehIMECEovEws+jRh
         pd7Qf1Ly+cBEPK2cyoWt1DKhRriF0zlhKyAs2be5GbGGX4gO9i6OWhp01e1jxVrFoSoJ
         FmcUGm7YEjWCo6qDz32mpXD1gRVpUFW35bhypih7Tv6rXEyAOXHES2bCfrma/sVCy+KZ
         q0RA==
X-Forwarded-Encrypted: i=1; AJvYcCWjhrq5fosOoj0hpkjanmsMJ1P7qouPFvBbpypVCMb8PNPuS9hgVpkcoB49MPZqq6wfOesUzj7NPuSy2JnsBvR4LgVtdtqmHqckdZIRicpk4XM581Can6g4dfcJDwvouHpAJ1CSaAN9QuVMvzyn7WJI9Yp1LVaNWKacwLNfOoTObsuNQn8hDyLjVG7dpDa/pmn66Nrz
X-Gm-Message-State: AOJu0YwREFjW5WPDEAzI0loUQ25mKfZeyeKPv61SXnM9ZF65uO5knB8s
	lKeLfNKGxAdoqRaEfBl3/PhqEdEZ64NOyKVyLPyBFLk4yH0t0QSh6lZzOrLrGuSHMMaSoUWd4Up
	epSG1Le3eiZRXOUX+Xfvl72rSxfI=
X-Google-Smtp-Source: AGHT+IEU/ZiwgqWrDWfItsbjFQF1nhRZH5qrkBorAITC5xFGNJCVzU/oI+JZS45+PPkqBNqvb8/D/bZalu0eAbcSmoY=
X-Received: by 2002:a2e:8684:0:b0:2d2:3913:5c4 with SMTP id
 l4-20020a2e8684000000b002d2391305c4mr54562lji.37.1708238472941; Sat, 17 Feb
 2024 22:41:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1705916069.git.haibo1.xu@intel.com> <CAAhSdy2wFzk0h5MiM5y9Fij0HyWake=7vNuV1MExUxkEtMWShw@mail.gmail.com>
In-Reply-To: <CAAhSdy2wFzk0h5MiM5y9Fij0HyWake=7vNuV1MExUxkEtMWShw@mail.gmail.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Sun, 18 Feb 2024 14:41:00 +0800
Message-ID: <CAJve8okkfvdRtvh8onQYL7_bmv9ntrViP54u805fQMq3apWFcQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] RISCV: Add kvm Sstc timer selftests
To: Anup Patel <anup@brainfault.org>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atishp@atishpatra.org>, 
	Guo Ren <guoren@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, wchen <waylingii@gmail.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Minda Chen <minda.chen@starfivetech.com>, 
	Sean Christopherson <seanjc@google.com>, Peter Xu <peterx@redhat.com>, Like Xu <likexu@tencent.com>, 
	Vipin Sharma <vipinsh@google.com>, Thomas Huth <thuth@redhat.com>, 
	Aaron Lewis <aaronlewis@google.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_224115_887754_3B07A42A 
X-CRM114-Status: GOOD (  18.33  )
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

T24gTW9uLCBGZWIgMTIsIDIwMjQgYXQgODoyNOKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMzoxNeKAr1BNIEhh
aWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGUgUklTQy1WIGFy
Y2hfdGltZXIgc2VsZnRlc3RzIGlzIHVzZWQgdG8gdmFsaWRhdGUgU3N0YyB0aW1lcgo+ID4gZnVu
Y3Rpb25hbGl0eSBpbiBhIGd1ZXN0LCB3aGljaCBzZXRzIHVwIHBlcmlvZGljIHRpbWVyIGludGVy
cnVwdHMKPiA+IGFuZCBjaGVjayB0aGUgYmFzaWMgaW50ZXJydXB0IHN0YXR1cyB1cG9uIGl0cyBy
ZWNlaXB0Lgo+ID4KPiA+IFRoaXMgS1ZNIHNlbGZ0ZXN0cyB3YXMgcG9ydGVkIGZyb20gYWFyY2g2
NCBhcmNoX3RpbWVyIGFuZCB0ZXN0ZWQKPiA+IHdpdGggTGludXggdjYuNy1yYzggb24gYSBRZW11
IHJpc2N2NjQgdmlydCBtYWNoaW5lLgo+ID4KPiA+IC0tLQo+ID4gQ2hhbmdlZCBzaW5jZSB2NDoK
PiA+ICAgKiBSZWJhc2VkIHRvIExpbnV4IDYuNy1yYzgKPiA+ICAgKiBBZGRlZCBuZXcgcGF0Y2go
Mi8xMikgdG8gY2xlYW4gdXAgdGhlIGRhdGEgdHlwZSBpbiBzdHJ1Y3QgdGVzdF9hcmdzCj4gPiAg
ICogUmUtb3JkZXJlZCBwYXRjaCgxMS8xMSkgaW4gdjQgdG8gcGF0Y2goMy8xMikKPiA+ICAgKiBD
aGFuZ2VkIHRoZSB0aW1lcl9lcnJfbWFyZ2luX3VzIHR5cGUgZnJvbSBpbnQgdG8gdWludDMyX3QK
PiA+Cj4gPiBIYWlibyBYdSAoMTEpOgo+ID4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IERhdGEg
dHlwZSBjbGVhbnVwIGZvciBhcmNoX3RpbWVyIHRlc3QKPiA+ICAgS1ZNOiBhcm02NDogc2VsZnRl
c3RzOiBFbmFibGUgdHVuaW5nIG9mIGVycm9yIG1hcmdpbiBpbiBhcmNoX3RpbWVyCj4gPiAgICAg
dGVzdAo+ID4gICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IFNwbGl0IGFyY2hfdGltZXIgdGVzdCBj
b2RlCj4gPiAgIEtWTTogc2VsZnRlc3RzOiBBZGQgQ09ORklHXzY0QklUIGRlZmluaXRpb24gZm9y
IHRoZSBidWlsZAo+ID4gICB0b29sczogcmlzY3Y6IEFkZCBoZWFkZXIgZmlsZSBjc3IuaAo+ID4g
ICB0b29sczogcmlzY3Y6IEFkZCBoZWFkZXIgZmlsZSB2ZHNvL3Byb2Nlc3Nvci5oCj4gPiAgIEtW
TTogcmlzY3Y6IHNlbGZ0ZXN0czogU3dpdGNoIHRvIHVzZSBtYWNybyBmcm9tIGNzci5oCj4gPiAg
IEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIGV4Y2VwdGlvbiBoYW5kbGluZyBzdXBwb3J0Cj4g
PiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIGd1ZXN0IGhlbHBlciB0byBnZXQgdmNwdSBp
ZAo+ID4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IENoYW5nZSB2Y3B1X2hhc19leHQgdG8gYSBj
b21tb24gZnVuY3Rpb24KPiA+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgc3N0YyB0aW1l
ciB0ZXN0Cj4gPgo+ID4gUGFvbG8gQm9uemluaSAoMSk6Cj4gPiAgIHNlbGZ0ZXN0cy9rdm06IEZp
eCBpc3N1ZXMgd2l0aCAkKFNQTElUX1RFU1RTKQo+Cj4gUmViYXNlZCBvbiBMaW51eC02LjgtcmM0
IGFuZCBxdWV1ZWQgdGhpcyBzZXJpZXMgZm9yIExpbnV4LTYuOQo+CgpUaGFua3MhCgo+IFRoYW5r
cywKPiBBbnVwCj4KPiA+Cj4gPiAgdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCAg
ICAgICAgICAgIHwgNTQxICsrKysrKysrKysrKysrKysrKwo+ID4gIHRvb2xzL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaCB8ICAzMiArKwo+ID4gIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9NYWtlZmlsZSAgICAgICAgICB8ICAyNyArLQo+ID4gIC4uLi9zZWxmdGVz
dHMva3ZtL2FhcmNoNjQvYXJjaF90aW1lci5jICAgICAgICB8IDI5NSArLS0tLS0tLS0tCj4gPiAg
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2FyY2hfdGltZXIuYyAgICAgIHwgMjU5ICsrKysr
KysrKwo+ID4gIC4uLi9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvYWFyY2g2NC9wcm9jZXNzb3IuaCB8
ICAgNCAtCj4gPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9rdm1fdXRpbF9iYXNlLmggICAg
IHwgICA5ICsKPiA+ICAuLi4vc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L2FyY2hfdGltZXIu
aCAgfCAgNzEgKysrCj4gPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNz
b3IuaCAgIHwgIDY1ICsrLQo+ID4gIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS90
ZXN0X3V0aWwuaCB8ICAgMiArCj4gPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS90aW1lcl90
ZXN0LmggICAgICAgIHwgIDQ1ICsrCj4gPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L2hh
bmRsZXJzLlMgICAgICAgIHwgMTAxICsrKysKPiA+ICAuLi4vc2VsZnRlc3RzL2t2bS9saWIvcmlz
Y3YvcHJvY2Vzc29yLmMgICAgICAgfCAgODcgKysrCj4gPiAgLi4uL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9yaXNjdi9hcmNoX3RpbWVyLmMgIHwgMTExICsrKysKPiA+ICAuLi4vc2VsZnRlc3RzL2t2
bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgICAgICAgfCAgMTEgKy0KPiA+ICAxNSBmaWxlcyBjaGFu
Z2VkLCAxMzUzIGluc2VydGlvbnMoKyksIDMwNyBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCB0b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgK
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2FyY2hf
dGltZXIuYwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0vaW5jbHVkZS9yaXNjdi9hcmNoX3RpbWVyLmgKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvdGltZXJfdGVzdC5oCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvaGFuZGxl
cnMuUwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0v
cmlzY3YvYXJjaF90aW1lci5jCj4gPgo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
