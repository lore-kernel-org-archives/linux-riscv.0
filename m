Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0664E810CB
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 11:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zTaz+9g3SZ3hAH/2tL5F+/ukpJVU3t0w3MDIzGCFco=; b=oUTv60wryao4ZR
	feEf+yOtCRGiQHunSDnO6oa+3L3e6Z1wX+jzjNH/ZJyaNO8CCmAdOsTw0WOemMi4tAzn8is3LuVPJ
	8yUapqxzIt6VEd9aq4oikSx9LQ1h298khAt3i6wD80ANMH9A7aK9F5Z2w6hvQVWj4uTGHS3M2NxY6
	yKEF5k8bWBxYhZJliqvAagfqNH+pgYfrVAZMOgHLJuKAEakud55zqGWIdlT5PbHlG9o9eqyAFmtyB
	przhFJG9KTu2X3F/oHs1qkLud+Cmg9IQYLsidgusQbcmp5BeSD0DGpNDjrJC65uyyI126SFR/jzO6
	3N65wQBe1qdouoMfRv3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlSK1-000lyd-23;
	Wed, 27 Sep 2023 11:03:13 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlSJz-000lxT-05
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 11:03:12 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-57be7c28423so2179288eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 04:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1695812589; x=1696417389; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOPrKJWAl/9/IN/C/sVh2aNItIVXrI/b8dgIww0vJHY=;
        b=geVpfkpiqEqsMZUO/REdTdObB2zCdItVYbCy4gVcCAVd55n6UxzLlrw3/rjgd/eOQv
         KgiEwXV8OaQq0RwklVVQbjpZMQjFpZuLzIo0+n2BBruiC+b0Pxw9JZ8dDdTwYVcJ9WoT
         a7JyaegrsCNrbpdSBdGktB3vRMI/esD3L77Z/Tfr56tiCktx1zhP3WM67eNIoDPK5QHj
         zj6spSge7tI9OKVfeNMAaWfbdt2qRv7EbPurDQFOixKkPrJjbypv22y2egP/mKLGAmbw
         lrPqqG8KKm4q+aKd9zkN1mqUlgGvsbGdTUR+GgLVd8pDdIYlRjPaoDRv4gyKTOuMn6E8
         33gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695812589; x=1696417389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOPrKJWAl/9/IN/C/sVh2aNItIVXrI/b8dgIww0vJHY=;
        b=SmBR0M7l2Tb5EcJdsUTkRxaRFw5/53VOZmlFSItuSwKylMmLAGGRTjAarFSdj8XTG8
         UGKBPYASwwuPRHXglOrUnfjj/euFdMxEP5nK5vfn1J1o+LBb9FE1NTJQDNuwFROy3yKP
         u7fyAsGV0HSjTZPW4RJb99PLW1qfYYWXfnt/UZuKws4O1S9Y/ehu/hv4E2vJv27lNjOg
         sBqXraAu4EIxG/Aa+TE3IxZDaja6yaROuCv3gHh0PqQdu/yaoyQI3xM2bZFs2jZe5isE
         livsbeAjP25BiN0+ToWjmifQiUBTxpO1hiMwyT0dTmEqJGB7lwOgeebIJU46MTK/njtd
         wOKQ==
X-Gm-Message-State: AOJu0Yz+o2eikaMdsW2GrtvxeEfnJI0POoKYgqJNnoGVF/k/SmkatWwY
	UhTNIu0FMzVjfRdpF6BuQPIMYlU+7Ouu9WVhdDkUlA==
X-Google-Smtp-Source: AGHT+IGdNvwTRHJQglaiviK7YYaztAN7D83/OmQPe0exs6oprKSd5lHX+OCZR4TRSaNrwIIhf9ZOf7kAX6DOkmJV0uo=
X-Received: by 2002:a05:6870:b30e:b0:1ad:2e18:7090 with SMTP id
 a14-20020a056870b30e00b001ad2e187090mr2122393oao.32.1695812589020; Wed, 27
 Sep 2023 04:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230922085701.3164-1-yongxuan.wang@sifive.com>
 <20230922085701.3164-2-yongxuan.wang@sifive.com> <20230927-62fbd3d63f4c6ffada90b7ee@orel>
In-Reply-To: <20230927-62fbd3d63f4c6ffada90b7ee@orel>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed, 27 Sep 2023 19:02:58 +0800
Message-ID: <CAMWQL2jUPNag5v7hiHqMnemAu6eStd2L9Fh9dCfS9gqi6xK1cw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] RISC-V: Detect and Enable Svadu Extension Support
To: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_040311_066078_70FA555B 
X-CRM114-Status: GOOD (  19.82  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, Kemeng Shi <shikemeng@huaweicloud.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, linux-riscv@lists.infradead.org, alex@ghiti.fr, David Hildenbrand <david@redhat.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, tjytimi@163.com, greentime.hu@sifive.com, wchen <waylingii@gmail.com>, Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, vincent.chen@sifive.com, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgZHJldywKCk9uIFdlZCwgU2VwIDI3LCAyMDIzIGF0IDM6MDPigK9QTSBBbmRyZXcgSm9uZXMg
PGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgU2VwIDIyLCAyMDIz
IGF0IDA4OjU2OjQ3QU0gKzAwMDAsIFlvbmctWHVhbiBXYW5nIHdyb3RlOgo+ID4gV2UgZGV0ZWN0
IFN2YWR1IGV4dGVuc2lvbiBzdXBwb3J0IGZyb20gRFRCIGFuZCBhZGQgYXJjaF9oYXNfaHdfcHRl
X3lvdW5nKCkKPiA+IHRvIGVuYWJsZSBvcHRpbWl6YXRpb24gaW4gTUdMUlUgYW5kIF9fd3BfcGFn
ZV9jb3B5X3VzZXIoKSBpZiBTdmFkdQo+ID4gZXh0ZW5zaW9uIGlzIGF2YWlsYWJsZS4KPiA+Cj4g
PiBDby1kZXZlbG9wZWQtYnk6IEppbnl1IFRhbmcgPHRqeXRpbWlAMTYzLmNvbT4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEppbnl1IFRhbmcgPHRqeXRpbWlAMTYzLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6
IFlvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oICAgICB8IDEgKwo+ID4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaCAgIHwgMSArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmggfCA2ICsrKysrKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgIHwg
MSArCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY3NyLmgKPiA+IGluZGV4IDc3N2NiODI5OTU1MS4uMTA2NDhiMzcyYTJhIDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jc3IuaAo+ID4gQEAgLTE5NCw2ICsxOTQsNyBAQAo+ID4gIC8qIHhFTlZDRkcg
ZmxhZ3MgKi8KPiA+ICAjZGVmaW5lIEVOVkNGR19TVENFICAgICAgICAgICAgICAgICAgKF9BQygx
LCBVTEwpIDw8IDYzKQo+ID4gICNkZWZpbmUgRU5WQ0ZHX1BCTVRFICAgICAgICAgICAgICAgICAo
X0FDKDEsIFVMTCkgPDwgNjIpCj4gPiArI2RlZmluZSBFTlZDRkdfSEFERSAgICAgICAgICAgICAg
ICAgIChfQUMoMSwgVUxMKSA8PCA2MSkKPgo+IFRoaXMgYml0IGlzIG5hbWVkICdBRFVFJyBpbiB0
aGUgc3BlYy4gV2h5IGFyZSB3ZSBjYWxsaW5nIGl0IEhBREU/CgpUaGlzIGJpdCB3YXMgY2FsbGVk
IEhBREUgaW4gdjAuMSBzcGVjLiBJIHdpbGwgdXBkYXRlIGl0IHRvIEFEVUUgaW4KcGF0Y2ggdjMu
IFRoYW5rIHlvdSEKClJlZ2FyZHMsCllvbmctWHVhbgoKCj4KPiA+ICAjZGVmaW5lIEVOVkNGR19D
QlpFICAgICAgICAgICAgICAgICAgKF9BQygxLCBVTCkgPDwgNykKPiA+ICAjZGVmaW5lIEVOVkNG
R19DQkNGRSAgICAgICAgICAgICAgICAgKF9BQygxLCBVTCkgPDwgNikKPiA+ICAjZGVmaW5lIEVO
VkNGR19DQklFX1NISUZUICAgICAgICAgICAgNAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ID4g
aW5kZXggYjdiNTgyNThmNmM3Li4xMDEzNjYxZDY1MTYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
aHdjYXAuaAo+ID4gQEAgLTU4LDYgKzU4LDcgQEAKPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRf
WklDU1IgICAgICAgICAgNDAKPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklGRU5DRUkgICAg
ICAgICAgICAgICA0MQo+ID4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUhQTSAgICAgICAgICA0
Mgo+ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TVkFEVSAgICAgICAgICA0Mwo+ID4KPiA+ICAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFYICAgICAgICAgICAgNjQKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BndGFibGUuaAo+ID4gaW5kZXggYjJiYTNmNzljZmU5Li4wMjhiNzAwY2QyN2IgMTAwNjQ0
Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+IEBAIC02MjksNiArNjI5LDEyIEBAIHN0
YXRpYyBpbmxpbmUgcGdwcm90X3QgcGdwcm90X3dyaXRlY29tYmluZShwZ3Byb3RfdCBfcHJvdCkK
PiA+ICAgICAgIHJldHVybiBfX3BncHJvdChwcm90KTsKPiA+ICB9Cj4gPgo+ID4gKyNkZWZpbmUg
YXJjaF9oYXNfaHdfcHRlX3lvdW5nIGFyY2hfaGFzX2h3X3B0ZV95b3VuZwo+ID4gK3N0YXRpYyBp
bmxpbmUgYm9vbCBhcmNoX2hhc19od19wdGVfeW91bmcodm9pZCkKPiA+ICt7Cj4gPiArICAgICBy
ZXR1cm4gcmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1NWQURVKTsK
PiA+ICt9Cj4gPiArCj4gPiAgLyoKPiA+ICAgKiBUSFAgZnVuY3Rpb25zCj4gPiAgICovCj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiBpbmRleCAxY2ZiYmE2NWQxMWEuLmVhZDM3OGMwNDk5MSAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiBAQCAtMTc4LDYgKzE3OCw3IEBAIGNv
bnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewo+ID4gICAg
ICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3NhaWEsIFJJU0NWX0lTQV9FWFRfU1NBSUEpLAo+ID4g
ICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Njb2ZwbWYsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQ
TUYpLAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3N0YywgUklTQ1ZfSVNBX0VYVF9T
U1RDKSwKPiA+ICsgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHN2YWR1LCBSSVNDVl9JU0FfRVhU
X1NWQURVKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHN2aW52YWwsIFJJU0NWX0lT
QV9FWFRfU1ZJTlZBTCksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzdm5hcG90LCBS
SVNDVl9JU0FfRVhUX1NWTkFQT1QpLAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Zw
Ym10LCBSSVNDVl9JU0FfRVhUX1NWUEJNVCksCj4gPiAtLQo+ID4gMi4xNy4xCj4gPgo+Cj4gVGhh
bmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
