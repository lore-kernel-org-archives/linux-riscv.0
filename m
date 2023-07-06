Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352F6EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 02:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upSOzjyv+tIMFLttW71uz67GQ0shE2AO7Y5nwO+RUCs=; b=VxfA+AIAJt6uZZ
	/5+rW+zC88PRUIWYBFrVWIp7sHbjIyaAgnr9fO6GoktRQZqdcOS878kxm5pDEzMjQ23kyEe24jBm5
	lL7EdD/fy/KDf/B4NJ0NPlDCnJ0X/soIM27vJcFCoERSibw2EMOnAwgdyy+k9ZIXYezCfWzMYD57M
	/5DSNiB0dPm+x8vFOgd3XlOmYoquye8v8mjydY4Tr8quhaLM3KophTMNclL+24f5/zwvMy61Ri5dm
	NMSwbHRnmXvG3w8Uv4Y+jdCAdXL2TMnd5sLQe72EXW36JtfKTRJSMb/QBIhjgZEsT7x3ALWh50c+h
	l1J72zLfeLoXrHfpMoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHEMe-0004M2-02;
	Thu, 06 Jul 2023 02:05:00 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHEMb-0004Jj-23
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 02:04:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so1650455e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 19:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688609094; x=1691201094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34TMPqSfA3ijY4f7A0JqszQChtIKUD8qol2PfiviNwU=;
        b=bGZqZCL+3J4+L6h0jDV/c/XvS76akDDG0dWPaFBu6Iy9pMRr9L+P9G4avL1KjaiU0W
         5d2xQyg/ETXI5BaPrkg5hG+A1dEcsSLmN5vNEPxUhV6nh/1VDkC+bGCVavozwWhHbCPe
         BaVYvVLApuxCQgzzlEIGYa1IA2kVs726O4w37oIkoxB+pTpZWZ09keajJEbGkek9IxIj
         hrtY3WwVi0FE0pCIbscS2XxxE9nCon7p8kQsrZyXE73T7+hmRVcUUevymj2wA7Ggc29h
         +GUlSzaGhanvbPvSTMZnk+eAL0IsCxQgcMi4HGrsc7WGdM2Fz9A4TcXuxWVQV3jm1QpZ
         IZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688609094; x=1691201094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34TMPqSfA3ijY4f7A0JqszQChtIKUD8qol2PfiviNwU=;
        b=UVaMpoeLtyOAe/7JZzXsCoJSy2UZtub6okvjRWtuAp8/UxBodXW2wxB7O5xMp0oyGB
         LV1/FsPJB7nf2xJ3nfc4PpvqGGtbRA0HSuvBKZ7+SnRKtwzSab1ojY2e/gyX1Pg/3T+y
         PaMb/gBxuD+WcWl/Fnu4oocN03wMhasPS4qNWR/b2iuyNR+VLlPAmDv7B7rK/Zag27hb
         kybne7hd+2iRRGDI6V9LghnHevZCSmYjwgaaxBCcgJCzkgfA6m2H/w+DVYbyJ6hW8vTm
         MMdfoaqpw2CB8koMwvn2Cz21gkCebEZRuuyld3JVEz2iI8/P3F51iioTzchvU6aXNtV3
         92nA==
X-Gm-Message-State: ABy/qLYmeYAxG3KNB7PIVtWv6lQ7SziuQklj+EkUDTcdYDxassrOC2/X
	a2N/9LNvziqu3fWPN0WOTohJifdZIof5sNB1or2Lcg==
X-Google-Smtp-Source: APBJJlGVWzsd0V/3ij0Kz1pL53DsIqaMBF+Y/tKLbg5iO0mVv5HLtAihtyPm3joxaTQl/6r7rNhAZetiICw9F07vfaU=
X-Received: by 2002:a05:600c:2058:b0:3fb:c417:5e6 with SMTP id
 p24-20020a05600c205800b003fbc41705e6mr200410wmg.23.1688609093887; Wed, 05 Jul
 2023 19:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230705114251.661-1-cuiyunhui@bytedance.com> <mhng-48837062-b9f6-4968-be9e-9d3b352be117@palmer-ri-x1c9>
In-Reply-To: <mhng-48837062-b9f6-4968-be9e-9d3b352be117@palmer-ri-x1c9>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Thu, 6 Jul 2023 10:04:42 +0800
Message-ID: <CAEEQ3wmRZGHNMB+CyfmAAGmapvFeQMVsgtQJh5nE01KG_3UBiw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 0/4] Obtain SMBIOS and ACPI entry from FFI
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_190457_677886_C2A8520D 
X-CRM114-Status: GOOD (  22.43  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, jdelvare@suse.com, aou@eecs.berkeley.edu, weidong.wd@bytedance.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, geshijian@bytedance.com, lpieralisi@kernel.org, yc.hung@mediatek.com, pierre-louis.bossart@linux.intel.com, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, rminnich@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, tinghan.shen@mediatek.com, linux-riscv@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-acpi@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFsbWVyLAoKT24gV2VkLCBKdWwgNSwgMjAyMyBhdCAxMDoxN+KAr1BNIFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCAwNSBKdWwgMjAyMyAw
NDo0Mjo0NyBQRFQgKC0wNzAwKSwgY3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20gd3JvdGU6Cj4gPiBI
ZXJlJ3MgdmVyc2lvbiAzIG9mIHBhdGNoIHNlcmllcy4KPiA+Cj4gPiBWMTogVGhlIEZGSSAoRkRU
IEZJUk1XQVJFIElOVEVSRkFDRSkgc2NoZW1lIGhhcyByZWFjaGVkIGEKPiA+IGNvbnNlbnN1cyB3
aXRoIHRoZSBNYWludGFpbmVycy4KPiA+IFBsZWFzZSByZWZlciB0bzoKPiA+IGh0dHBzOi8vcGF0
Y2hlcy5saW5hcm8ub3JnL3Byb2plY3QvbGludXgtYWNwaS9wYXRjaC8yMDIzMDQyNjAzNDAwMS4x
Ni0xLWN1aXl1bmh1aUBieXRlZGFuY2UuY29tLwo+Cj4gRnJvbSBsb29raW5nIGF0IHRoYXQgdGhy
ZWFkIGl0IHNlZW1zIHRoYXQgdGhlIGNvbnNlbnN1cyBpcyB0aGlzIGlzIGEgYmFkCj4gaWRlYT8g
IFNvcnJ5IGlmIEknbSBqdXN0IG1pc3Npbmcgc29tZXRoaW5nLi4uCj4KCkZpcnN0IG9mIGFsbCwg
Q29yZWJvb3QgZG9lcyBub3Qgc3VwcG9ydCBFRkksIFJvbiBoYXMgZXhwcmVzc2VkLCBhcyBmb2xs
b3dzOgoiSSBhbSB3b25kZXJpbmcgaWYgd2UgY2FuIGZvY3VzIG9uIHJpc2MtdiBoZXJlLCBhbmQg
bm90IGRyYWcgaW4gQVJNLApiL2MgdGhlIEFSTSBBQ1BJK1VFRkkgc2hpcCBoYXMgc2FpbGVkLiBJ
IGhhZCB0aGF0IGRpc2N1c3Npb24gaW4gMjAxMwo7LSkgYW5kIGl0J3MgY2xlYXIgd2UgZG9uJ3Qg
d2FudCB0byByZWRvIGl0LgpJbiBnZW5lcmFsLCBpbiBteSB3b3JsZCwgYmVjYXVzZSBvZiB0aGUg
bWFueSBwcm9ibGVtcyB0aGF0IGNvbWUgd2l0aApVRUZJIChzZWN1cml0eSwgY29kZSBxdWFsaXR5
LCBwZXJmb3JtYW5jZSksIHdlJ2QgbGlrZSB0byBhdm9pZApyZXF1aXJpbmcgYSBkZXBlbmRlbmN5
IG9uIFVFRkkganVzdCB0byBnZXQgQUNQSSBvbiBSSVNDLVYuIEl0IGFsc28Kc2VlbXMsIGZyb20g
b3RoZXIgZGlzY3Vzc2lvbnMgSSdtIGhhdmluZywgdGhhdCB0aGVyZSBpcyBzb21lIGJlbGllZgp0
aGF0IEFDUEkgd2lsbCBiZSB3YW50ZWQgb24gUklTQy1WLiBJdCB3b3VsZCBiZSBuaWNlIHRvIHNl
cGFyYXRlIHRob3NlCnBpZWNlcyBvbiBSSVNDLVY7IGNlcnRhaW5seSB0aGV5IHdlcmUgc2VwYXJh
dGUgZm9yIGEgdmVyeSBsb25nIHRpbWUgaW4KdGhlIHg4NiB3b3JsZCAod2UgaGFkIEFDUEkrU01N
IG9uIGNvcmVib290IGxhcHRvcHMgd2l0aG91dCBVRUZJIGZvcgpleGFtcGxlKS4iCgpUaGVuLCBh
IGNvbnNlbnN1cyB3YXMgcmVhY2hlZCB3aXRoIEFyZCwgdGhhdCBGRkkgY2FuIGJlIGFwcGxpZWQg
dG8gUklTQy1WLgoKUGxlYXNlIGxvb2sgYXQgdGhpcyBwYXRjaCBhZ2FpbjogW1BBVENIIHYzIDEv
NF0gcmlzY3Y6IG9idGFpbiBBQ1BJClJTRFAgZnJvbSBkZXZpY2V0cmVlCldoeSBkbyB5b3UgdGhp
bmsgaXQgaXMgYSBiYWQgaWRlYT8KCgo+ID4gQ2hhbmdlcyB2MS0+djI6Cj4gPiBBZGp1c3RlZCB0
aGUgY29kZSBzdHJ1Y3R1cmUsIHB1dCB0aGUgQUNQSSBwYXJ0IHVuZGVyIHRoZSBSSVNDLVYgYXJj
aGl0ZWN0dXJlLAo+ID4gYW5kIHB1dCB0aGUgZ2VuZXJhbCBwYXJ0IG9mIG9idGFpbmluZyBTTUJJ
T1MgZW50cnkgdGhyb3VnaCBGRkkKPiA+IHVuZGVyIGRyaXZlci9maXJtd2FyZS8uCj4gPiBQbGVh
c2UgcmVmZXIgdG86Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMwNzAzLTcx
ZjY3ZWI2NmEwMzdmNWMwZmI4MjVjNkBvcmVsL1QvCj4gPgo+ID4gQ2hhbmdlcyB2Mi0+djM6Cj4g
PiBBY2NvcmRpbmcgdG8gdGhlIHN1Z2dlc3Rpb25zIG9mIG1haW50YWluZXJzLCB0aGUgY29kZSBo
YXMgYmVlbiBtb2RpZmllZCBhcyBmb2xsb3dzOgo+ID4gMS4gTW9kaWZpZWQgdGhlIGNvbW1pdCBs
b2cuCj4gPiAyLiBBZGRlZCBkZXNjcmlwdGlvbiBvZiAiZmZpdGJsIiBzdWJub2QgaW4gZHQtYmlu
ZGluZ3MuCj4gPiAzLiBBZGQgc3R1YiBmdW5jdGlvbiB0byB0aGUgZnVuY3Rpb24KPiA+IDQuIGFy
Y2gvcmlzY3YvIGFuZCBkcml2ZXIvZmlybXdhcmUvIHVzZSBDT05GSUdfRkRUX0ZXX0lOVEVSRkFD
RSB0byBjb250cm9sCj4gPiA1LiBNb2RpZmllZCB0aGUgZmZpX3NtYmlvc19yb290X3BvaW50ZXIo
KSBmdW5jdGlvbiBsb2dpYyBhbmQgcHJpbnRpbmcKPiA+IGV0Yy4KPiA+Cj4gPiBZdW5odWkgQ3Vp
ICg0KToKPiA+ICAgcmlzY3Y6IG9idGFpbiBBQ1BJIFJTRFAgZnJvbSBkZXZpY2V0cmVlCj4gPiAg
IGZpcm13YXJlOiBpbnRyb2R1Y2UgRkZJIGZvciBTTUJJT1MgZW50cnkKPiA+ICAgcmlzY3Y6IG9i
dGFpbiBTTUJJT1MgZW50cnkgZnJvbSBGRkkKPiA+ICAgZHQtYmluZGluZ3M6IGZpcm13YXJlOiBE
b2N1bWVudCBmZml0YmwgYmluZGluZwo+ID4KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9m
aXJtd2FyZS9mZml0YmwudHh0ICAgfCAyNyArKysrKysKPiA+ICBNQUlOVEFJTkVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMyArKysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2FjcGkuaCAgICAgICAgICAgICAgICAgfCAgOSArKwo+ID4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vZmZpLmggICAgICAgICAgICAgICAgICB8IDE0ICsrKwo+ID4gIGFyY2gvcmlzY3Yv
a2VybmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9mZmkuYyAgICAgICAgICAgICAgICAgICAgICAgfCA0MCArKysrKysrKwo+ID4gIGFy
Y2gvcmlzY3Yva2VybmVsL3NldHVwLmMgICAgICAgICAgICAgICAgICAgICB8ICAyICsKPiA+ICBk
cml2ZXJzL2Zpcm13YXJlL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAxMSArKysKPiA+
ICBkcml2ZXJzL2Zpcm13YXJlL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4g
PiAgZHJpdmVycy9maXJtd2FyZS9kbWlfc2Nhbi5jICAgICAgICAgICAgICAgICAgIHwgOTcgKysr
KysrKysrKystLS0tLS0tLQo+ID4gIGRyaXZlcnMvZmlybXdhcmUvZmZpLmMgICAgICAgICAgICAg
ICAgICAgICAgICB8IDQyICsrKysrKysrCj4gPiAgaW5jbHVkZS9saW51eC9mZmkuaCAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMjkgKysrKysrCj4gPiAgMTIgZmlsZXMgY2hhbmdlZCwgMjQ2
IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvZmZpdGJsLnR4dAo+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2ZmaS5oCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2ZmaS5jCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUvZmZpLmMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9saW51eC9mZmkuaAoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
