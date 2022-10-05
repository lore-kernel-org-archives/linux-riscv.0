Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031D3C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 14:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVgeGm5tWspN3NMy2HxSvCpBgWwXoo2M+Y8aD7OUlpI=; b=nQ6Ph2CaZw8alD
	pDThVBrI8IJ7iDhe8GejKdbDmeZpcbhYwdVJXjCyEKAEDa3lnlP+fAb70GV7wpWD58IpNQvycrGfq
	TQgq92pI89Z0geKPvq78tpxazDv1fCwsbWpjgHPSNUXZHsC0bvx9/OV3w46p9YtzG4sSgjdKORyC3
	PqFiGkOzzokF9OhLSpAvDPMRKzZTLLOPqQbsgJCF0NtwPdqJ6rgk7e6tDuyn+4WHedV2wUOcvFmcs
	d/06sKlh5EAn8R/y4gMxe+15FGwLQbuI5ECw2OCVjic1nPOq4DIHAAUSZ3FZyjRkT74t365az1j1c
	NrZ0WHCNI+mP09xSBFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og59U-00ESU7-Ob; Wed, 05 Oct 2022 14:13:36 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og59S-00ESTj-Dj
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 14:13:35 +0000
Received: by mail-wm1-x32b.google.com with SMTP id n35-20020a05600c502300b003b4924c6868so1940671wmr.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 07:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=iTil0lsFJBbajnS0HckB1NLqPw5j3/u7FBEnTBeNuP4=;
        b=YaurSgMUPF+oS+WkvCUxM+z+bnxbzy3n9QY10q9IxleLE2S2uuxg+9b8almIevcltB
         MPeTWUwxdoBQrAC57P+z1Pt62AhfKmv/EMBY3mOiyADzAgjqH2oMKAdcaWLAXjal+UaF
         kaFrKHj82ikhsKBt5w3LJOiaNR3h74W4hJjUEkQdusH+Xcfbdowz2mUsnxGqzhZLBYHw
         dtmN1n7nw0058+nFSRWLve4Zbo/sfNcg08e3xigHmEU8S9bx0gtZ79ZLspbX3qJt27bN
         FoN0IuaZy77gOUkzG+ZXGZeAScNjHDM0a0HOj7wijRn5ZTtdrDJVm0Y3PAPSdwvDphy3
         ovSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=iTil0lsFJBbajnS0HckB1NLqPw5j3/u7FBEnTBeNuP4=;
        b=Ufgm9n6PRNW7TDr6HsHiY4roE+qxSVCIlPCz4d/h/c6GxJ9E5CDn7rx5poFx+G68Oa
         Ryayno6OJKFZaBf8q/W+dGVdUQCJ/Jrdos+lfQrI9me3Vyipg7I2dlhg6soYyUSjUyap
         iX5Qb4KLjO7TYbnIGvl3TIrPJsnR4epUKPNnnsuakFNkx3CSHKbFyUOYbei0F2iu+t0q
         xMmC+aBiR0dkjxLaWkrrJhOEkYV9m8lWyH+UJryuRbspp3CwNnqhI6ro9WyLdyDlZW7W
         7DtfRrUVhSBUOX7y/PEoB7TB+an8N+fEC1oRHh7wc49l0bcHDYCUoeg8xd9rY2EGgUiV
         F5lQ==
X-Gm-Message-State: ACrzQf35i09eW5mW11vvbldDj3ILH7IgWYYrjWaFYVDAy1HwCb76qb9w
	THxJL+mCx0uR9MXeTg7Oe52iVA==
X-Google-Smtp-Source: AMsMyM7Xx5nYShPZnXC0WbvtOB8CmRaTazKcBoOpgl+1iLPHDaTodrPizD5csr98RYaSHlwFb8wNNQ==
X-Received: by 2002:a05:600c:3515:b0:3b4:a0fa:c4e1 with SMTP id h21-20020a05600c351500b003b4a0fac4e1mr3506244wmq.191.1664979210789;
        Wed, 05 Oct 2022 07:13:30 -0700 (PDT)
Received: from [192.168.0.17] (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net. [86.15.83.122])
        by smtp.gmail.com with ESMTPSA id o30-20020adf8b9e000000b0022da3977ec5sm15027913wra.113.2022.10.05.07.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 07:13:30 -0700 (PDT)
Message-ID: <7ef87fe1-e6da-eaac-087e-ef232c176665@sifive.com>
Date: Wed, 5 Oct 2022 15:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] riscv/vdso: fix missing vdso_data declaration
Content-Language: en-GB
To: Conor.Dooley@microchip.com, palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, sudip.mukherjee@sifive.com,
 jude.onyenegecha@sifive.com
References: <mhng-192f7819-dbb8-4cd0-af6c-ef89d5579a14@palmer-ri-x1c9>
 <71ddab3b-a38e-7957-d3cb-65d6ba64c4ef@microchip.com>
 <76b2b200-d013-1504-b265-fffa9e713c67@microchip.com>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <76b2b200-d013-1504-b265-fffa9e713c67@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_071334_532760_E85715C9 
X-CRM114-Status: GOOD (  22.90  )
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

T24gMTUvMDkvMjAyMiAxOTo1MSwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4g
T24gMTkvMDgvMjAyMiAwODowNywgQ29ub3IgRG9vbGV5IHdyb3RlOgo+PiBPbiAxOS8wOC8yMDIy
IDAwOjAxLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZQo+Pj4KPj4+IE9uIFN1biwgMTQgQXVnIDIwMjIgMDk6MTA6NDggUERUICgtMDcw
MCksIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOgo+Pj4+IE9uIDExLzA4LzIwMjIg
MjI6MjYsIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOgo+Pj4+PiBPbiAxMS8wOC8y
MDIyIDIyOjA2LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4+Pj4+IEVYVEVSTkFMIEVNQUlMOiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZQo+Pj4+Pj4KPj4+Pj4+IE9uIFdlZCwgMTMgSnVsIDIwMjIgMjM6MzQ6
MzYgUERUICgtMDcwMCksIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOgo+Pj4+Pj4+
IE9uIDEzLzA3LzIwMjIgMjM6MDYsIEJlbiBEb29rcyB3cm90ZToKPj4+Pj4+Pj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoZSB2ZHNvX2RhdGEg
aXMgZGVmaW5lZCBieSBoYXMgbm8gZGVjbGFyYXRpb24gYXMgdGhlCj4+Pj4+Pj4+IGFyY2gvcmlz
Y3Yva2VybmVsL3Zkc28uYyBkb2VzIG5vdCBpbmNsdWRlIGFzbS92ZHNvL3ZzeXNjYWxsLmgKPj4+
Pj4+Pj4gZm9yIHRoZSBkZWZpbml0aW9uLiBGaXggdGhlIGZvbGxvd2luZyBzcGFyc2Ugd2Fybmlu
ZyBieQo+Pj4+Pj4+PiBhZGRpbmcgaW4gdGhlIGFzbS92ZHNvL3ZzeXNjYWxsLmgKPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jOjQyOjE4OiB3YXJuaW5nOiBzeW1ib2wg
J3Zkc29fZGF0YScgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPj4+Pj4+
Pj4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAc2lmaXZlLmNv
bT4KPj4+Pj4+Pgo+Pj4+Pj4+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgo+Pj4+Pj4KPj4+Pj4+IFRoaXMgb25lIGdpdmVzIG1lIGEgYnVuY2gg
b2YgYnVpbGQgZXJyb3JzLCB0aGluZ3MgbGlrZQo+Pj4+Pgo+Pj4+PiBIbW0sIHdoYXQncyB5b3Vy
IGRlZmNvbmZpZyBmb3IgdGhpcz8KPj4+Pj4gSSB0ZXN0ZWQgd2l0aCBteSBkZXYgZGVmY29uZmln
IGFuZCByaXNjdidzIGRlZmF1bHQgb25lIGF0IHRoZSB0aW1lIGJ1dAo+Pj4+PiBzYXcgbm90aGlu
Zy4gVHJpZWQgYm90aCBhZ2FpbiBub3cgJiBubyBlcnJvcnMuCj4+Pj4KPj4+PiBSZXByb2R1Y2Vk
IGl0IHdpdGggcmlzY3Ytc3lzdGVtcy1jaS4KPj4+PiBMb29rcyBsaWtlIGl0IGlzIGhhcHBlbmlu
ZyBvbiBvbmUgb2YgeW91ciAzMiBiaXQgZGVmY29uZmlncyB3aGVyZQo+Pj4+IENPTkZJR19HRU5F
UklDX1RJTUVfVlNZU0NBTEwgaXMgbm90IHNldC4gSW4gdmRzby5jLCB0aGUgaW5jbHVkZSBvZgo+
Pj4+IHZkc28vZGF0YXBhZ2UuaCBpcyBndWFyZGVkIGJ5IENPTkZJR19HRU5FUklDX1RJTUVfVlNZ
U0NBTEwgYnV0IHRoZQo+Pj4+IG9uZSBpbiBhc20vdmRzby92c3lzY2FsbC5oIGlzIG5vdC4KPj4+
Pgo+Pj4+IEFkZGluZyB0aGUgc2FtZSBndWFyZCBhcm91bmQgdGhlIGluY2x1ZGUgdGhlcmUgZml4
ZXMgdGhlIGJ1aWxkIC9zaHJ1Zwo+Pj4KPj4+IERvIHlvdSBtaW5kIGp1c3Qgc2VuZGluZyBhIHYy
P8KgIEl0J3MgYSB0b3VjaCBlYXNpZXIgdGhhbiB0cnlpbmcgdG8KPj4+IHNxdWFzaCBzdHVmZiBp
bi4KPj4+Cj4+Cj4+IEJlbiBzZW50IHRoZSBwYXRjaCBzbyBJIGRpZG4ndCgvZG9uJ3QpIHdhbnQg
dG8gZW5jcm9hY2ggYnkgc2VuZGluZwo+PiBhIHYyLgo+Pgo+PiBCZW4sIEZXSVcgd2hhdCBJIGRp
ZCB3YXM6Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vdnN5c2Nh
bGwuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oCj4+IGluZGV4IDgy
ZmQ1ZDgzYmQ2MC4uZTgyY2U5N2QyN2QyIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zk
c28vdnN5c2NhbGwuaAo+PiBAQCAtNSw3ICs1LDEwIEBACj4+ICDCoCNpZm5kZWYgX19BU1NFTUJM
WV9fCj4+ICAgCj4+ICDCoCNpbmNsdWRlIDxsaW51eC90aW1la2VlcGVyX2ludGVybmFsLmg+Cj4+
ICsKPj4gKyNpZmRlZiBDT05GSUdfR0VORVJJQ19USU1FX1ZTWVNDQUxMCj4+ICDCoCNpbmNsdWRl
IDx2ZHNvL2RhdGFwYWdlLmg+Cj4+ICsjZW5kaWYKPj4gICAKPj4gIMKgZXh0ZXJuIHN0cnVjdCB2
ZHNvX2RhdGEgKnZkc29fZGF0YTsKPj4gICAKPj4gQnV0IEkgbm93IEkgYW0gbm90IHN1cmUgaWYg
dGhhdCBpcyB0aGUgY29ycmVjdCBhcHByb2FjaC4KPj4gVGhlcmUncyBhbiBBUkNIX0hBU19WRFNP
X0RBVEEgaW4gdmRzby9kYXRhcGFnZS5oOgo+Pgo+PiAjaWZkZWYgQ09ORklHX0FSQ0hfSEFTX1ZE
U09fREFUQQo+PiAjaW5jbHVkZSA8YXNtL3Zkc28vZGF0YS5oPgo+PiAjZWxzZQo+PiBzdHJ1Y3Qg
YXJjaF92ZHNvX2RhdGEge307Cj4+ICNlbmRpZgo+Pgo+PiBJIGRpZCBhIGxpdHRsZSBtb3JlIGRp
Z2dpbmcgc2luY2Ugd2hhdCB3ZSBhcmUgY3VycmVudGx5IGRvaW5nIGlzIHRoZQo+PiBleGFjdCBz
YW1lIGFzIHdoYXQgYXJtNjQgZG9lcy4uIEkgc3BvdHRlZCB0aGF0IGluIG91ciBLY29uZmlnIHdl
Ogo+PiBzZWxlY3QgR0VORVJJQ19USU1FX1ZTWVNDQUxMIGlmIE1NVSAmJiA2NEJJVAo+Pgo+PiBX
aHkgZG9lcyB0aGF0IGRlcGVuZCBvbiA2NEJJVD8gU2hvdWxkIHRoYXQgaGF2ZSBiZWVuIHVwZGF0
ZWQgd2hlbiB3ZQo+PiBhZGRlZCB0aGUgY29tcGF0IHN0dWZmPyBJZiB0aGF0IGlzIHR1cm5lZCBv
biwgSSBjYW4gdHJpZ2dlciB0aGUgYnVpbGQKPj4gZXJyb3Igd2l0aG91dCBhcHBseWluZyBCZW4n
cyBwYXRjaC4KPj4KPj4gYXJtNjQgYWxzbyBoYXMgYSBjb21wYXQgc3lzY2FsbCBmb3IgX19OUl9n
ZXR0aW1lb2ZkYXkuIEkgZG9uJ3Qga25vdwo+PiBhbnl0aGluZyBhYm91dCBjb21wYXQsIHNvIEkg
Y2FudCBjb250cmlidXRlIGFueSByZWFzb25zIGFzIHRvIHdoeSB3ZQo+PiBkb24ndCBoYXZlIG9u
ZSwgYnV0IHRvIHRoZSB1bnRyYWluZWQgZXllIGl0IHNlZW1zIGxpa2UgQmVuJ3MgcGF0Y2ggaXMK
Pj4gZXhwb3NpbmcgYSBkZWZpY2llbmN5IGluIG91ciBjb21wYXQgc3VwcG9ydCB0aGF0IG1heSBu
b3QgaGF2ZSBiZWVuCj4+IG5vdGljZWQgYmVjYXVzZSB3ZSBoYWQgR0VORVJJQ19USU1FX1NZU0NB
TEwgZGlzYWJsZWQgZm9yIDMyQklULgo+Pgo+PiBFaXRoZXIgd2F5LCBJIGRvbid0IGtub3cgZW5v
dWdoIGFib3V0IHdoYXQncyBnb2luZyBvbiBoZXJlIHRvIHNlbmQgYW4KPj4gYWN0dWFsIHBhdGNo
LCBqdXN0IGVub3VnaCB0byBtYWtlIHNvbWUgb2JzZXJ2YXRpb25zLgo+IAo+IEhleSBCZW4sCj4g
RGlkIHlvdSBldmVyIGdldCBhcm91bmQgdG8gbG9va2luZyBhdCB0aGlzIGFnYWluPwo+IFRoYW5r
cywKPiBDb25vci4KPiAKCkkgdGhpbmsgdGhpcyBnb3QgbG9zdCBpbiB0aGUgZ2VuZXJhbCBsaXN0
IG5vaXNlLCBpZiBpdCBzdGlsbCBhbiBpc3N1ZQpJJ2xsIGdvIGhhdmUgYSBsb29rIHRoaXMgd2Vl
ay4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
