Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB10C04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 14:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=8vOPU93eN/dnkFj2NS7iEHrM8VauV31MKgEAPoM+naM=; b=jJk3/jWWy1HXz4HLUhmykCEVaJ
	7+HR2zjSZZrcYT1dAQuI67U5Ye1566IYvUiGioSeW1m8PzLPJYbsCnIJYajfx/9HkZDxsOxv3ii9R
	HphsiF4pJ56Vzu2ZYmZm1no63IB8oyK9ovSI8ZJiuqTlxR+f/1svY/ZKdJXWAUkbtdidRl2pPyt5w
	w2cBFaVuhNSQBlYxrYiALBfUQO9Rb0AYQdd2Q2ENad/OjDMhqUA3nlkD4up+2VmNBxLAOGCKn+sV1
	utbjNsltrXMmXBjv3oEoqAwS7yfyuQUPYzKheVaeSEMKTkbyjE305Y3UZWt0j9A6sO4tS1+Wc6oMC
	GHsb1dYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ig9-0000000Fuzt-1fTZ;
	Wed, 08 May 2024 14:53:57 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ig0-0000000FuyK-3V1L
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 14:53:55 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-613a6bb2947so3605338a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 07:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1715180025; x=1715784825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jzxebwdo962PuKC2zPMaZjfMWZ4zNd6nkm5wi7u0wk=;
        b=GTEJDpaG1ioADCYtscvxmE87zES3afSLCcpD9DeVM1qrwomntgzvqjyv1K5h0GDutw
         DASgeMQQFRXe0Gf+XMjAEhgc8uldgMDHcXKzPQvdbdpBahnK4Xrz68a7VHtEHL0anWrh
         SHhPHVjV9scIc4LovFSkKwqKhsIGAYpTYTvzbVtM7nrT8O6+Fkk7DwyTOIHtVik4bAVF
         EchTvBXEawis/+nlCNvxGBjHiIA4XL8YI/RYLHuHJHL+tr6JjqQAZv4y9bZ2HwRGEEgg
         jw7Y83cnozv8IyXRN/oaXrk0oDroc7oI79kenn26kR5UtQqoqt+If81pR658kBzwP/Bq
         pmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715180025; x=1715784825;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jzxebwdo962PuKC2zPMaZjfMWZ4zNd6nkm5wi7u0wk=;
        b=ATs++lIJ79WDx22YVod/lWuIS/UHVEs5AFpRuvY+k07mn0vxgQdzgBp6fAxplMHI6v
         gLUkUgyh22Mwt2lLLqIVljFod5vaRC4tEejuFtnW7lIocehJr6kFajGUAti5bJ3S9fQf
         3gMbhYhtPgOqY7jBPsauAWHbbjVg/ah+UOeDvMAT0LkUbo6q3gES39yo50wWY2ytUEFh
         gecHldgVyYvnt6VsYjLasI7CtWZFIgcclDcXrJUw9j1gBKQ/jXo2M0J/sk8NfQqxcKfN
         dizQVmR7eXc2P7EsA6QviEQvNKwoD59q7IB4JMtYAcsxjF0JhCQGTeZ9Uja/pO3iyZeE
         Llcw==
X-Forwarded-Encrypted: i=1; AJvYcCXBo619f5rur8TON3K65mySZEHjQNuhN0+4C0PYlLbPjgOeTI5Imn6qqcu3e4qQrdb7AhktJek9TjnTaRtbcXr1DHE+YN05BE61kb5eCzTO
X-Gm-Message-State: AOJu0Yw3vy3VMLh+agvHc9H0PSOb+HcFNQAKy2SHiO0rR6ZkFem0fSn0
	oZsV71xeoNOFtsMI4K4VvquNhaa+/UhAkTasEU+p+Ed4bLqJPoRg6XVGvSvnzq8=
X-Google-Smtp-Source: AGHT+IGZA/j1I+rqQTrHxseqHOH3+r+6RDtsDRR7EHaPNdBztPL/ZrhtBo/3+SHYuBPgSM47WmrRSQ==
X-Received: by 2002:a05:6a21:3995:b0:1af:ccd8:c118 with SMTP id adf61e73a8af0-1afccd8c21emr1558953637.22.1715180025014;
        Wed, 08 May 2024 07:53:45 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id p2-20020a1709027ec200b001ed9fed6f61sm8137490plb.268.2024.05.08.07.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 07:53:44 -0700 (PDT)
Date: Wed, 08 May 2024 07:53:44 -0700 (PDT)
X-Google-Original-Date: Wed, 08 May 2024 07:53:41 PDT (-0700)
Subject: Re: [External] Re: [PATCH v4 2/3] riscv: cacheinfo: initialize cacheinfo's level and type from ACPI PPTT
In-Reply-To: <CAEEQ3wnthxGbrJ_qLnZUQ9w3E_1UWgMign5P=+rNP2p5xGm4Bg@mail.gmail.com>
CC: Conor Dooley <conor@kernel.org>, rafael@kernel.org, lenb@kernel.org,
  linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, bhelgaas@google.com, james.morse@arm.com,
  jhugo@codeaurora.org, jeremy.linton@arm.com, john.garry@huawei.com, Jonathan.Cameron@huawei.com,
  pierre.gondois@arm.com, sudeep.holla@arm.com, tiantao6@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cuiyunhui@bytedance.com, Sunil V L <sunilvl@ventanamicro.com>
Message-ID: <mhng-c1256305-0281-42c3-8469-29e3a5ee397d@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_075348_961834_ABB2CD98 
X-CRM114-Status: GOOD (  18.17  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAwOCBNYXkgMjAyNCAwNDoxOTowMSBQRFQgKC0wNzAwKSwgY3VpeXVuaHVpQGJ5dGVk
YW5jZS5jb20gd3JvdGU6Cj4gSGkgUGFsbWVyLAo+Cj4gR2VudGxlIHBpbmcuLi4KCitTdW5pbCwg
YXMgaGUncyB0aGUgQUNQSS9SSVNDLVYgbWFpbnRhaW5lciBhbmQgSSBnZW5lcmFsbHkgd2FpdCBm
b3IgaGlzIApyZXZpZXcgb24gdGhpcyBzdHVmZi4KCj4KPiBPbiBGcmksIE1heSAzLCAyMDI0IGF0
IDEyOjM34oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4g
T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMTE6NDM6MjlBTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90
ZToKPj4gPiBCZWZvcmUgY2FjaGVpbmZvIGNhbiBiZSBidWlsdCBjb3JyZWN0bHksIHdlIG5lZWQg
dG8gaW5pdGlhbGl6ZSBsZXZlbAo+PiA+IGFuZCB0eXBlLiBTaW5jZSBSU0lDLVYgY3VycmVudGx5
IGRvZXMgbm90IGhhdmUgYSByZWdpc3RlciBncm91cCB0aGF0Cj4+ID4gZGVzY3JpYmVzIGNhY2hl
LXJlbGF0ZWQgYXR0cmlidXRlcyBsaWtlIEFSTTY0LCB3ZSBjYW5ub3Qgb2J0YWluIHRoZW0KPj4g
PiBkaXJlY3RseSwgc28gbm93IHdlIG9idGFpbiBjYWNoZSBsZWF2ZXMgZnJvbSB0aGUgQUNQSSBQ
UFRUIHRhYmxlCj4+ID4gKGFjcGlfZ2V0X2NhY2hlX2luZm8oKSkgYW5kIHNldCB0aGUgY2FjaGUg
dHlwZSB0aHJvdWdoIHNwbGl0X2xldmVscy4KPj4gPgo+PiA+IFN1Z2dlc3RlZC1ieTogSmVyZW15
IExpbnRvbiA8amVyZW15LmxpbnRvbkBhcm0uY29tPgo+PiA+IFN1Z2dlc3RlZC1ieTogU3VkZWVw
IEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4KPj4gOiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkg
Q3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPj4KPj4gSSdtIG5vdCBhbiBBQ1BJIGhlYWQs
IHNvIHdoZXRoZXIgb3Igbm90IHRoZSB0YWJsZSBpcyB2YWxpZCBvbiBSSVNDLVYgb3IKPj4gdy9l
IEkgZG8gbm90IGtub3csIGJ1dCB0aGUgY29kZSBoZXJlIGxvb2tzIHNhbmUgdG8gbWUsIHNvCj4K
Pj4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+
Cj4+Cj4+IENoZWVycywKPj4gQ29ub3IuCj4KPiBUaGFua3MsCj4gWXVuaHVpCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
