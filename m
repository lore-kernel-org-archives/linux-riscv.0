Return-Path: <SRS0=nHLU=GZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BD7C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jan 2021 07:30:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39583238EE
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jan 2021 07:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39583238EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a7qaDDEoEr60mU7UKYt2N3hYpcZUpFUOfd3KjAXdFWc=; b=eJ+xljqIagZgrmAjWbQ0p9eux
	5R9twupJxjgHvCRPuqC0K2pCCftQd6u350wfJpisdgUN2ZpW6kCN8OeajYVtsee6fLFLeMSVy6S/V
	RHbcWEsMXBB+NYhNsCn1+qSDNB85a1+PIEbQ9OWl9h8Nf+Al6uuInYniAgxveFiszIFsq8psRFlmS
	mTOovmJE4N8AQ3wAgr2Jr0Zzdy/uiDvCv2N09kLa2tcIrIoZn+56DFUlnF8c3hbTHJc9AO7MIvNfi
	iZX4yjWdOY7Y0pgu1jQ+XH5X2+cCny9of3ISF5kmydJoYZNoNPpcHP/uaTvj9Phj36kFwuphRXKB6
	Rsqk+PzVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2qtb-0001Bf-1z; Fri, 22 Jan 2021 07:30:15 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2qtX-00019a-6G; Fri, 22 Jan 2021 07:30:12 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DMW851ssTzl83B;
 Fri, 22 Jan 2021 15:28:21 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Fri, 22 Jan 2021 15:29:44 +0800
Subject: Re: [PATCH v3 0/4] initrd: Use unified initrd reserve function in
 ARM/RISCV
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
References: <20210115054606.124502-1-wangkefeng.wang@huawei.com>
 <48c006a8-a352-488c-4981-768faffbe343@huawei.com>
 <20210117100903.GB1551@shell.armlinux.org.uk>
 <cc47f8cf-8778-43ab-77de-9dd220de7c26@huawei.com>
 <20210118091733.GD1551@shell.armlinux.org.uk>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <d911b1e6-ed0d-4a73-aee4-060b957897f8@huawei.com>
Date: Fri, 22 Jan 2021 15:29:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210118091733.GD1551@shell.armlinux.org.uk>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_023011_518429_F9810057 
X-CRM114-Status: GOOD (  15.86  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: palmerdabbelt@google.com, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, guoren@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjEvMS8xOCAxNzoxNywgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluIHdyb3Rl
Ogo+IE9uIE1vbiwgSmFuIDE4LCAyMDIxIGF0IDA5OjAxOjQwQU0gKzA4MDAsIEtlZmVuZyBXYW5n
IHdyb3RlOgo+PiBPbiAyMDIxLzEvMTcgMTg6MDksIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eCBh
ZG1pbiB3cm90ZToKPj4+IE9uIFN1biwgSmFuIDE3LCAyMDIxIGF0IDEyOjU3OjU1UE0gKzA4MDAs
IEtlZmVuZyBXYW5nIHdyb3RlOgo+Pj4+IENvcnJlY3QgUnVzc2VsbCdzIG1haWwgYWRkcmVzcyAo
ZnJvbSBsaW51eEBhcm1saW51eC5vcmcudWsgdG8KPj4+PiBybWsra2VybmVsQGFybWxpbnV4Lm9y
Zy51aywgc2hvdWxkIHVwZGF0ZSB0aGUgTUFJTlRBSU5FUlMpCj4+PiBOby4gTUFJTlRBSU5FUlMg
aXMgY29ycmVjdC4KPj4gSSBnb3QgZm9sbG93aW5nIG1lc3NhZ2UswqAgc28gSSBjaGVjayBtYWls
IG9mIHlvdXIgcmVjZW50IHBhdGNoZXMsIGFuZCBzZW5kIGEKPj4gbmV3IG9uZS4KPj4KPj4gUGxl
YXNlIGlnbm9yZSBpdCwgdGhlcmUgbWF5IGJlIHNvbWUgb3RoZXIgcHJvYmxlbXMuCj4+Cj4+ICIq
RGVsaXZlcnkgaGFzIGZhaWxlZCB0byB0aGVzZSByZWNpcGllbnRzIG9yIGdyb3VwczoqCj4+Cj4+
IGxpbnV4QGFybWxpbnV4Lm9yZy51ayA8bWFpbHRvOmxpbnV4QGFybWxpbnV4Lm9yZy51az4KPj4g
QSBjb21tdW5pY2F0aW9uIGZhaWx1cmUgb2NjdXJyZWQgZHVyaW5nIHRoZSBkZWxpdmVyeSBvZiB0
aGlzIG1lc3NhZ2UuIFBsZWFzZQo+PiB0byByZXNlbmQgdGhlIG1lc3NhZ2UgbGF0ZXIuIElmIHRo
ZSBwcm9ibGVtIGNvbnRpbnVlcywgY29udGFjdCB5b3VyCj4+IGhlbHBkZXNrLiIKPiBUaGF0IGlz
IGEgbW9zdCB1bmhlbHBmdWwgYm91bmNlIG1lc3NhZ2UgLSBJIHN1cHBvc2UgaXQncyBkZXNpZ25l
ZCBmb3IKPiBub24tdGVjaG5pY2FsIHBlb3BsZSB0byBlbnN1cmUgdGhhdCB0aGUgcHJvYmxlbSBj
YW4ndCBiZSByZXNvbHZlZC4KPgo+ID5Gcm9tIHdoYXQgSSBjYW4gc2VlIGZyb20gbXkgZW5kLCBl
dmVyeSBhdHRlbXB0IGludm9sdmluZyB5b3VyIGVtYWlsCj4gYWRkcmVzcyBsYXN0IHdlZWsgKHdh
bmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tKSBoYXMgYmVlbiBzdWNjZXNzZnVsLCBzbwo+IEkgc3Vz
cGVjdCB0aGUgcHJvYmxlbSBpcyBub3QgYXQgbXkgZW5kLgoKb2vvvIx0aGFuayB5b3UgZm9yIGxl
dHRpbmcgbWUga25vdyB0aGF0IHRoZSBlbWFpbCBoYXMgYmVlbiByZWNlaXZlZCwKCmFueSBjb21t
ZW50IGFib3V0IHRoZSBBUk0gcGFydCBpbiB0aGUgcGF0Y2hzZXTCoCA7KQoKPgo+IEluIGFueSBj
YXNlLCBhbGwgQGFybWxpbnV4Lm9yZy51ayBhZGRyZXNzZXMgaGl0IHRoZSBzYW1lIHNlcnZlciwg
c28KPiBpZiB0aGVyZSdzIGEgImNvbW11bmljYXRpb24gZmFpbHVyZSIgZm9yIHRoZSBkb21haW4s
IGl0IHdvdWxkIGFmZmVjdAo+IGFsbCBsb2NhbC1wYXJ0cyBlcXVhbGx5Lgo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
