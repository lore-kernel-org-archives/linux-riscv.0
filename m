Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30A6EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 03:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w22V+k4ywwMm0r/e5SNLuUqTnPunIxU3ewxTTxz1pfA=; b=G8IPnQ95b48hp3
	y4pceryuFHDAk5YZ6lZRx0z3Fe09uvyQrZzfalF7lKBGS3d8ca39Z53F1eQNzJeESAABxIiJeq4m8
	4i5lEbY1fK7EUI5QUB15ARQ7U+8hCEhaxW07O56dMZUNsLoI/+Zf9XE4FhbxipvwiDXRkweBnYX5q
	Px2TTBMLbAm5fweJ2DuBNB2XNlOm0l86rkfgBZVw6Q9wMgd70LgTMIGgGRua5S9+221RmawETuxt9
	9JKKSFBtpfg7OsrXeOCKDkaVE6WNxacn8bMttksSHV/0mJQE29YZFIQ/kT6Vmr1ktlyLWsHkggWlg
	zTRK8g8lacPKJDin96uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHFug-000HOG-36;
	Thu, 06 Jul 2023 03:44:14 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHFue-000HMD-0Q
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 03:44:13 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-313f1085ac2so128952f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 20:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688615047; x=1691207047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpdCKCp+dEsXjUfnxgC7qSAJV2eBz4qj2jsssqk1txs=;
        b=iXDH/ghPLGc9raD3qKetKj/KUpmZePX4PNAORCoaQYBdMqKXKCtW+TZPJcAOk1rTdP
         IMbnwpoopc+i6RQjurWxU6VrAHS5NHNETEIVvcpDgwgx6haEvQm3f0TippJsoFEqHGDJ
         U0IZLzlFg0hsymvDvlzb7UPmM4EnnN/bBfCOVyWncse42TgvyXSe75LL0DKn2bB+0WXa
         Bt1mRQJ4UVbaCZpyIQx+FNpuSXh9xFFQmjEPoUzQIjzZR50g+r1hTHedz/ejAr4Znn4U
         8z9HU/kunrrK0MZ+synCMg9CKp0+SMKz5l29beFS2JK6ifjnmeVpDw24dWb7pP++BTdG
         nwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688615047; x=1691207047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpdCKCp+dEsXjUfnxgC7qSAJV2eBz4qj2jsssqk1txs=;
        b=KW9KnAkEcuHyZctlslZmGLmlIucD7axQPxacy2cdDjAV4jra/Ht2DlofFlm2eG79yn
         OX/OpO96htximBRH89Hq+I/Vq+4BgC69F0WmK1LjjnB6HRpsiU2UuoPgweoE/JiHu0b7
         sEQQqddoGqLUCM5C6M5TgmQq/iJokQKk3uYa2883I4Ld5oJE/6F2/iBYlZI1v9CyF6YA
         zhHW6Ks/TbUw2d2DfsqHRgCLr/aCtwe4D5+WwY9PBFOq09THhnUEup1mj5GLFuwN8J9t
         gtx0Hp7an/jnhhNBqfkPEl4+cienTBVnoq7HGhK33PMUd+PsJsHoXCFWzTRu39kkr+wS
         JKHw==
X-Gm-Message-State: ABy/qLZT6NuveHn8V89akotmwSMpglfDH7Hv5gVpi8YvO7tX6T/ue077
	6c6nl/kG3o1/Juqh9PI7iQpcmDYlBCd4uKpojwIZiw==
X-Google-Smtp-Source: APBJJlG8oJJ/0Lw6qO1wtxj2L3BYTTBuF2LIPDKZd3AA7ZMseFgpU0K2z+5nLIryFaJlkLROHdg8KF/EMX8q/u/r47c=
X-Received: by 2002:adf:e34c:0:b0:314:3b17:d7c5 with SMTP id
 n12-20020adfe34c000000b003143b17d7c5mr382795wrj.43.1688615046885; Wed, 05 Jul
 2023 20:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230705114251.661-1-cuiyunhui@bytedance.com> <20230705114251.661-5-cuiyunhui@bytedance.com>
 <20230705-oblivious-unstuffed-8e028a5b243c@spud>
In-Reply-To: <20230705-oblivious-unstuffed-8e028a5b243c@spud>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Thu, 6 Jul 2023 11:43:55 +0800
Message-ID: <CAEEQ3wmG1OiE3GFqQp9SP+oKUbTfuTPx=rNGd-sjKsW7vv3bew@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 4/4] dt-bindings: firmware: Document
 ffitbl binding
To: Conor Dooley <conor@kernel.org>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_204412_200955_3E6BDA60 
X-CRM114-Status: GOOD (  23.53  )
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
Cc: mark.rutland@arm.com, jdelvare@suse.com, aou@eecs.berkeley.edu, weidong.wd@bytedance.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, geshijian@bytedance.com, lpieralisi@kernel.org, yc.hung@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org, rminnich@gmail.com, palmer@dabbelt.com, paul.walmsley@sifive.com, tinghan.shen@mediatek.com, linux-riscv@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-acpi@vger.kernel.org, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ29ub3IsCgpBZGRlZCBkdHMgTWFpbnRhaW5lcnMsCgpPbiBXZWQsIEp1bCA1LCAyMDIzIGF0
IDExOjA34oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhl
eSwKPgo+IE9uIFdlZCwgSnVsIDA1LCAyMDIzIGF0IDA3OjQyOjUxUE0gKzA4MDAsIFl1bmh1aSBD
dWkgd3JvdGU6Cj4gPiBBZGQgdGhlIGRlc2NyaXB0aW9uIGZvciBmZml0Ymwgc3Vibm9kZS4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4K
PiA+IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL2ZmaXRibC50eHQg
ICB8IDI3ICsrKysrKysrKysrKysrKysrKysKPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNl
cnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9maXJtd2FyZS9mZml0YmwudHh0Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS9mZml0YmwudHh0IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL2ZmaXRibC50eHQKPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmM0MjM2ODYyNjE5OQo+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Zpcm13YXJlL2ZmaXRibC50eHQKPgo+IEZpcnN0bHksIG5ldyBkdC1iaW5kaW5ncyBuZWVkIHRv
IGJlIGRvbmUgaW4geWFtbCwgbm90IGluIHRleHQgZm9ybS4KPiBTZWNvbmRseSwgeW91IGRpZG4n
dCByZS1ydW4gZ2V0X21haW50YWluZXIucGwgYWZ0ZXIgYWRkaW5nIHRoaXMgYmluZGluZywKPiBz
byB5b3UgaGF2ZSBub3QgQ0NlZCBhbnkgb2YgdGhlIG90aGVyIGR0LWJpbmRpbmcgbWFpbnRhaW5l
cnMgbm9yIHRoZQo+IGRldmljZXRyZWUgbWFpbGluZyBsaXN0LgoKUmUtcnVuIGdldF9tYWludGFp
bmVyLnBsIGFuZCBhZGRlZCBtYWludGFpbmVycyBpbnRvIHRoZSBtYWlsbGlzdC4KZW1tLi4gVGhl
cmUgaXMgc29tZSAqdHh0IGluCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJt
d2FyZS8sIGlzbid0IGl0PwoKPgo+ID4gQEAgLTAsMCArMSwyNyBAQAo+Cj4gPiArRkZJKEZEVCBG
SVJNV0FSRSBJTlRFUkZBQ0UpIGRyaXZlcgo+ID4gKwo+ID4gK1JlcXVpcmVkIHByb3BlcnRpZXM6
Cj4gPiArIC0gZW50cnkgICAgICAgICAgICAgOiBhY3BpIG9yIHNtYmlvcyByb290IHBvaW50ZXIs
IHU2NAo+ID4gKyAtIHJlZyAgICAgICAgICAgICAgICAgICAgICAgOiBhY3BpIG9yIHNtYmlvcyB2
ZXJzaW9uLCB1MzIKPgo+IFBsZWFzZSBnbyBsb29rIGF0IGFueSBvdGhlciBkdC1iaW5kaW5nIChv
ciB0aGUgZXhhbXBsZSBzY2hlbWEpIGFzIHRvIGhvdwo+IHRoZXNlIHByb3BlcnRpZXMgc2hvdWxk
IGJlIHVzZWQuIEEgInJlZyIgY2VydGFpbmx5IHNob3VsZCBub3QgYmUgYmVpbmcKPiB1c2VkIHRv
IHN0b3JlIHRoZSByZXZpc2lvbi4uLgoKT2theSwgSWYgc2/vvIxJJ2xsIGFkZCBhIHByb3BlcnR5
ICJ2ZXJzaW9uIiBpbnRvIHRoZSBkdHMgaW5zdGVhZCBvZgoicmVnIiwganVzdCBsaWtlLCBXRFlU
PwpmZml0YmwgewogICAgc21iaW9zIHsKICAgICAgICBlbnRyeSA9ICIiOwogICAgICAgIHZlcnNp
b24gPSA8IDB4MDIgPjsKICAgIH0KICAgYWNwaSB7CiAgICAgICAgIGVudHJ5ID0gIiI7CiAgICAg
ICAgIHZlcnNpb24gPSA8IDB4MDYgPjsKICB9Cn0KCj4KPiBDaGVlcnMsCj4gQ29ub3IuCj4KPiA+
ICsKPiA+ICtTb21lIGJvb3Rsb2FkZXJzLCBzdWNoIGFzIENvcmVib290IGRvIG5vdCBzdXBwb3J0
IEVGSSwKPiA+ICtvbmx5IGRldmljZXRyZWUgYW5kIHNvbWUgYXJjaGVzIGRvIG5vdCBoYXZlIGEg
cmVzZXJ2ZWQKPiA+ICthZGRyZXNzIHNlZ21lbnQuIEFkZCAiZmZpdGJsIiBzdWJub2RlIHRvIG9i
dGFpbiBBQ1BJIFJTRFAKPiA+ICthbmQgU01CSU9TIGVudHJ5Lgo+ID4gK1RoaXMgZmVhdHVyZSBp
cyBrbm93biBhcyBGRFQgRmlybXdhcmUgSW50ZXJmYWNlIChGRkkpLgo+ID4gKwo+ID4gK0V4YW1w
bGU6Cj4gPiArICAgICBmZml0Ymwgewo+ID4gKwo+ID4gKyAgICAgICAgICAgICBzbWJpb3Mgewo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW50cnkgPSAiIjsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwgMHgwMyA+Owo+ID4gKwo+ID4gKyAgICAgICAg
ICAgICB9Cj4gPiArICAgICAgICAgICAgIGFjcGkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZW50cnkgPSAiIjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwgMHgwNiA+Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAgICB9Cj4gPiAr
Cj4gPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+ID4gaW5kZXggOWI4
ODZlZjM2NTg3Li4wMDgyNTdlNTUwNjIgMTAwNjQ0Cj4gPiAtLS0gYS9NQUlOVEFJTkVSUwo+ID4g
KysrIGIvTUFJTlRBSU5FUlMKPiA+IEBAIC03ODc0LDYgKzc4NzQsNyBAQCBGOiAgICAgIGluY2x1
ZGUvbGludXgvZWZpKi5oCj4gPiAgRkRUIEZJUk1XQVJFIElOVEVSRkFDRSAoRkZJKQo+ID4gIE06
ICAgWXVuaHVpIEN1aSBjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbQo+ID4gIFM6ICAgTWFpbnRhaW5l
ZAo+ID4gK0Y6ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL2Zm
aXRibC50eHQKPiA+ICBGOiAgIGRyaXZlcnMvZmlybXdhcmUvZmZpLmMKPiA+ICBGOiAgIGluY2x1
ZGUvbGludXgvZmZpLmgKPiA+Cj4gPiAtLQo+ID4gMi4yMC4xCj4gPgoKVGhhbmtzLApZdW5odWkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
