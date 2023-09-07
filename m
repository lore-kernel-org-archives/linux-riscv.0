Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175A1EE14DE
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 10:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n05B428iC+ESRQNaF46Jh1wnuN6zSAOA+LivHnAfnaU=; b=j7EcBD2E7pHZUF
	j/MptRCXZ8c6jqC4KnQXact5lFKv8M44tozI+wmqZ3PSMu+p4QRGip7FCBU/eCFMAW17tT1HPLylI
	fDrJt53vaI6xvLExzN+w+V4uKvwT4fK32I4LG/dS5MkzR9Cbph6PKYNKmp8XAyg7lQklCN1fwpDWi
	2DLl7dExPBn6MIIbl0C6TsC00X3Z95t/dtylC4nDwV8PSpQGIZOQUrkGvDAz5u32R0EncDwQ07aS/
	vKiqd5v4oQzplG24tG7ifc8ZqAcggmT/wdJNfzASbznbJOKTh+Euw0s9DCCQk1eFAqTha74LwoL5f
	dgXoLsSGuIk/Gg3/fXNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCAS-00BlrP-2e;
	Thu, 07 Sep 2023 10:23:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCAO-00Blpb-1w
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 10:23:18 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c0efe0c4acso1179485ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 03:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694082193; x=1694686993; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RCgeZHNY/DlNrnLkKkluN6xg5KeAlPieZsIE6jFbPVc=;
        b=BWcLY9r5yY2cuvxwmRcKUpnqt2KIiRWixycKvHQwll8pp7KHXE0sr7SrD87/Ejc3QA
         zoI6IG15MiSgDjLKe2hBPR4l4HemI/Rnkq6QslsfuLl//DnlIbo60qwDdAP4JHXZSG2C
         WzkO8cw8wPNLpura01I/yiRp1Ax1sK8wQ3pQPpJPljj1IF+tqhtDK2YT6DiSmrDguPlC
         y241vqu3U3/3tyNkvTtEYU3F3HOpt5hzpNUNlvYhhnV9HgZGf0DxHHbssDps7J4I5jdF
         /lZHDLay959l7AK0fNpT1ZamfuBGdPfMLmK1WfWRJw7BwOdkhCrnFc4vC9tpWtLglBmu
         eWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694082193; x=1694686993;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCgeZHNY/DlNrnLkKkluN6xg5KeAlPieZsIE6jFbPVc=;
        b=PfqY5B1C9USOxsu7yGJ4wCLJesY5Nxc7d2iVVeHdJgIlS5UxzkOQpqAonLH0smWfgn
         98Pz0GICN/ekkaX9PkR2kYt3M0tYqnb/XsbTfWLraZq4UnDirDPW3Z4EP0VYIk3dUbm4
         DCO1d2wYjljDHfUZsCjW0zdrm9YfAYUMOWeBxQq+PtM/iwaDVKWL9NxtpD2F64bMVt76
         /pcXgg72Kyj6MeykpVq8BJbYzpbdGh1b39pZbiwrbDOZe2HSG41LgJRP2B0au95oIEaG
         nPm9pZy4MRu++4R8Xy6ixKT3VMbwMYxHKZMPmUAf8bGm6De+NiiWAYkspLkaA7fySSrf
         XARg==
X-Gm-Message-State: AOJu0Yyr+QpNmVmOjVaquE5faNl5avD7Oyoo5Z0YBJknE00Tnvgj24mh
	brp+G+8iY4jzwhaUSQEslkSlog==
X-Google-Smtp-Source: AGHT+IFZ8rAMkndFAe9nk36Eotx+d5nxbthNhzZ4DS5IlxlT8T8Od24Sm3zFo4dnTgB8luNvNyYScg==
X-Received: by 2002:a17:902:d48f:b0:1c0:cbaf:6939 with SMTP id c15-20020a170902d48f00b001c0cbaf6939mr21706846plg.3.1694082193128;
        Thu, 07 Sep 2023 03:23:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:ef65:d0f:73cf:bc3c? ([2a01:e0a:999:a3a0:ef65:d0f:73cf:bc3c])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902ed1300b001b9de39905asm12485964pld.59.2023.09.07.03.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 03:23:12 -0700 (PDT)
Message-ID: <ff6302ae-a114-4ef0-be87-a5fa34c3aab5@rivosinc.com>
Date: Thu, 7 Sep 2023 12:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] irqchip/riscv-intc: Support large non-standard
 hwirq number
Content-Language: en-US
To: Yu Chien Peter Lin <peterlin@andestech.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 conor.dooley@microchip.com, atishp@atishpatra.org, anup@brainfault.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: ajones@ventanamicro.com, heiko@sntech.de, samuel@sholland.org,
 geert+renesas@glider.be, n.shubin@yadro.com, dminus@andestech.com,
 ycliang@andestech.com, tim609@andestech.com, locus84@andestech.com,
 dylan@andestech.com
References: <20230907021635.1002738-1-peterlin@andestech.com>
 <20230907021635.1002738-3-peterlin@andestech.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20230907021635.1002738-3-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_032316_882279_A4392E44 
X-CRM114-Status: GOOD (  22.00  )
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

CgpPbiAwNy8wOS8yMDIzIDA0OjE2LCBZdSBDaGllbiBQZXRlciBMaW4gd3JvdGU6Cj4gQ3VycmVu
dGx5LCB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhlIFJJU0MtViBJTlRDIGRyaXZlciB1c2VzIHRo
ZQo+IGludGVycnVwdCBjYXVzZSBhcyBod2lycSBhbmQgaGFzIGEgbGltaXRhdGlvbiBvZiBzdXBw
b3J0aW5nIGEKPiBtYXhpbXVtIG9mIDY0IGh3aXJxcy4gSG93ZXZlciwgYWNjb3JkaW5nIHRvIHRo
ZSBwcml2aWxlZ2VkIHNwZWMsCj4gaW50ZXJydXB0IGNhdXNlID49IDE2IGFyZSBkZWZpbmVkIGZv
ciBwbGF0Zm9ybSB1c2UuCj4gCj4gVGhpcyBsaW1pdGF0aW9uIHByZXZlbnRzIHVzIGZyb20gZnVs
bHkgdXRpbGl6aW5nIHRoZSBhdmFpbGFibGUKPiBsb2NhbCBpbnRlcnJ1cHQgc291cmNlcy4gQWRk
aXRpb25hbGx5LCB0aGUgaHdpcnFzIHVzZWQgb24gUklTQy1WCj4gYXJlIHNwYXJzZSwgd2l0aCBv
bmx5IGludGVycnVwdCBudW1iZXJzIDEsIDUgYW5kIDkgKHBsdXMgU3Njb2ZwbWYKPiBvciBULUhl
YWQncyBQTVUgaXJxKSBiZWluZyBjdXJyZW50bHkgdXNlZCBmb3Igc3VwZXJ2aXNvciBtb2RlLgo+
IAo+IFRoZSBwYXRjaCBzd2l0Y2hlcyB0byB1c2luZyBpcnFfZG9tYWluX2NyZWF0ZV90cmVlKCkg
d2hpY2gKPiBjcmVhdGVzIHRoZSByYWRpeCB0cmVlIG1hcCwgYWxsb3dpbmcgdXMgdG8gaGFuZGxl
IGEgbGFyZ2VyCj4gbnVtYmVyIG9mIGh3aXJxcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZdSBDaGll
biBQZXRlciBMaW4gPHBldGVybGluQGFuZGVzdGVjaC5jb20+Cj4gUmV2aWV3ZWQtYnk6IENoYXJs
ZXMgQ2ktSnl1biBXdSA8ZG1pbnVzQGFuZGVzdGVjaC5jb20+Cj4gUmV2aWV3ZWQtYnk6IExlbyBZ
dS1DaGkgTGlhbmcgPHljbGlhbmdAYW5kZXN0ZWNoLmNvbT4KPiAKPiAtLS0KPiBUaGVyZSBhcmUg
MyBod2lycXMgb2YgbG9jYWwgaW50ZXJydXB0IHNvdXJjZSBleGNlZWQgNjQgZGVmaW5lZCBpbgo+
IEFYNDVNUCBkYXRhc2hlZXQgWzFdIFRhYmxlIDU2OiBBWDQ1TVAtMUMgc2NhdXNlIFZhbHVlIEFm
dGVyIFRyYXA6Cj4gLSAyNTYrMTYgU2xhdmUgcG9ydCBFQ0MgZXJyb3IgaW50ZXJydXB0IChTLW1v
ZGUpCj4gLSAyNTYrMTcgQnVzIHdyaXRlIHRyYW5zYWN0aW9uIGVycm9yIGludGVycnVwdCAoUy1t
b2RlKQo+IC0gMjU2KzE4IFBlcmZvcm1hbmNlIG1vbml0b3Igb3ZlcmZsb3cgaW50ZXJydXB0KFMt
bW9kZSkKPiAKPiBbMV0gaHR0cDovL3d3dy5hbmRlc3RlY2guY29tL3dwLWNvbnRlbnQvdXBsb2Fk
cy9BWDQ1TVAtMUMtUmV2Li01LjAuMC1EYXRhc2hlZXQucGRmCj4gLS0tCj4gIGRyaXZlcnMvaXJx
Y2hpcC9pcnEtcmlzY3YtaW50Yy5jIHwgMTAgKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2lycWNoaXAvaXJxLXJpc2N2LWludGMuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50
Yy5jCj4gaW5kZXggNGFkZWVlMWJjMzkxLi43NmUxMjI5YzQ1ZGUgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWludGMuYwo+IEBAIC0yNCw4ICsyNCw4IEBAIHN0YXRpYyBhc21saW5rYWdlIHZvaWQg
cmlzY3ZfaW50Y19pcnEoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIHsKPiAgCXVuc2lnbmVkIGxv
bmcgY2F1c2UgPSByZWdzLT5jYXVzZSAmIH5DQVVTRV9JUlFfRkxBRzsKPiAgCj4gLQlpZiAodW5s
aWtlbHkoY2F1c2UgPj0gQklUU19QRVJfTE9ORykpCj4gLQkJcGFuaWMoInVuZXhwZWN0ZWQgaW50
ZXJydXB0IGNhdXNlIik7Cj4gKwlpZiAoIWlycV9maW5kX21hcHBpbmcoaW50Y19kb21haW4sIGNh
dXNlKSkKPiArCQlwYW5pYygidW5leHBlY3RlZCBpbnRlcnJ1cHQgY2F1c2U6ICVsZCIsIGNhdXNl
KTsKCkhpIFl1LAoKSXQgc2VlbXMgbGlrZSBnZW5lcmljX2hhbmRsZV9kb21haW5faXJxKCkgcmV0
dXJucyAtRUlOVkFMIGlmIHByb3ZpZGVkCndpdGggTlVMTCAod2hpY2ggd2lsbCBoYXBwZW4gaWYg
dGhlIGludGVycnVwdCBkb2VzIG5vdCBoYXZlIGEgbWFwcGluZwpkdWUgdG8gX19pcnFfcmVzb2x2
ZV9tYXBwaW5nIHJldHVybmluZyBOVUxMKSBzbyBtYXliZSBpdCBpcyBwb3NzaWJsZSB0bwpyZW1v
dmUgdGhpcyBjaGVjayAoc2luY2UgX19pcnFfcmVzb2x2ZV9tYXBwaW5nKCkgaXMgYWxzbyBjYWxs
ZWQgYnkKZ2VuZXJpY19oYW5kbGVfZG9tYWluX2lycSgpKSBhbmQgcGFuaWMgaWYgZ2VuZXJpY19o
YW5kbGVfZG9tYWluX2lycSgpCnJldHVybnMgLUVJTlZBTCA/IFRoYXQgd291bGQgYXZvaWQgY2Fs
bGluZyBfX2lycV9yZXNvbHZlX21hcHBpbmcoKSB0d2ljZQpmb3IgcmVhbGx5IHJhcmUgY2FzZXMu
CgpDbMOpbWVudAoKPiAgCj4gIAlnZW5lcmljX2hhbmRsZV9kb21haW5faXJxKGludGNfZG9tYWlu
LCBjYXVzZSk7Cj4gIH0KPiBAQCAtMTE3LDggKzExNyw4IEBAIHN0YXRpYyBpbnQgX19pbml0IHJp
c2N2X2ludGNfaW5pdF9jb21tb24oc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZuKQo+ICB7Cj4gIAlp
bnQgcmM7Cj4gIAo+IC0JaW50Y19kb21haW4gPSBpcnFfZG9tYWluX2NyZWF0ZV9saW5lYXIoZm4s
IEJJVFNfUEVSX0xPTkcsCj4gLQkJCQkJICAgICAgICZyaXNjdl9pbnRjX2RvbWFpbl9vcHMsIE5V
TEwpOwo+ICsJaW50Y19kb21haW4gPSBpcnFfZG9tYWluX2NyZWF0ZV90cmVlKGZuLCAmcmlzY3Zf
aW50Y19kb21haW5fb3BzLAo+ICsJCQkJCSAgICAgTlVMTCk7Cj4gIAlpZiAoIWludGNfZG9tYWlu
KSB7Cj4gIAkJcHJfZXJyKCJ1bmFibGUgdG8gYWRkIElSUSBkb21haW5cbiIpOwo+ICAJCXJldHVy
biAtRU5YSU87Cj4gQEAgLTEzMiw4ICsxMzIsNiBAQCBzdGF0aWMgaW50IF9faW5pdCByaXNjdl9p
bnRjX2luaXRfY29tbW9uKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmbikKPiAgCj4gIAlyaXNjdl9z
ZXRfaW50Y19od25vZGVfZm4ocmlzY3ZfaW50Y19od25vZGUpOwo+ICAKPiAtCXByX2luZm8oIiVk
IGxvY2FsIGludGVycnVwdHMgbWFwcGVkXG4iLCBCSVRTX1BFUl9MT05HKTsKPiAtCj4gIAlyZXR1
cm4gMDsKPiAgfQo+ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
