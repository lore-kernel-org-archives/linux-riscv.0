Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794C1C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 12:21:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A8C964F4D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 12:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A8C964F4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4qXU/OIv23reAO+OtUeAIdIM1BUjBR1zxLrlC0liUjI=; b=bEThFqWWBltQ624OWDwpB8f+i
	jABUit6fklJMyON4Ba+cCt5x1fX4VL7tHiybqy52SGfdF8YsooR9/REpi343kDUWWWzm9QP50LnC3
	PBxkbEEkdYNoOy8qGZnWpbySF5gzirwcEeooAWsZo8sfaU0w2+TFzcXs9Y2YSm1MdgMEDDwlfrO1a
	r5G452SO2aOFnBcl0myxiunEOpyZLmBYt2Wv4FmhizrlzwAICc+ddZdsPWJ1A/PtsrVuRm0goYlic
	UbPetflSYZdIbwaf4Hlqnb4aLGhKnqaTRrJCtYsXDUuuhBNdeisliQTLVp0f5nOra56PYeZaSaeNb
	qi3yREmkw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMrei-005BRS-Bt; Thu, 18 Mar 2021 12:21:36 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMreb-005BQg-NW
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 12:21:33 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F1R0z5n77zkYmq;
 Thu, 18 Mar 2021 20:19:47 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Thu, 18 Mar 2021 20:21:15 +0800
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in riscv_intc_irq
To: Dmitry Vyukov <dvyukov@google.com>, syzbot
 <syzbot+005654dd9b8f26bd4c07@syzkaller.appspotmail.com>
CC: Albert Ou <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
 Thomas Gleixner <tglx@linutronix.de>
References: <00000000000056b18b05bd7c6511@google.com>
 <CACT4Y+brvecfGUk7H7-mcJ82NxbEuETv+js0nRxpV7zc1AZH5w@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <c82390e5-33f6-75f6-6b93-c618537413e5@huawei.com>
Date: Thu, 18 Mar 2021 20:21:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CACT4Y+brvecfGUk7H7-mcJ82NxbEuETv+js0nRxpV7zc1AZH5w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_122130_474711_FB65AEFF 
X-CRM114-Status: GOOD (  20.57  )
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

Ck9uIDIwMjEvMy8xNCAxODo0NywgRG1pdHJ5IFZ5dWtvdiB3cm90ZToKPiBPbiBTdW4sIE1hciAx
NCwgMjAyMSBhdCAxMToxNCBBTSBzeXpib3QKPiA8c3l6Ym90KzAwNTY1NGRkOWI4ZjI2YmQ0YzA3
QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20+IHdyb3RlOgo+PiBIZWxsbywKPj4KPj4gc3l6Ym90
IGZvdW5kIHRoZSBmb2xsb3dpbmcgaXNzdWUgb246Cj4+Cj4+IEhFQUQgY29tbWl0OiAgICAwZDc1
ODhhYiByaXNjdjogcHJvY2VzczogRml4IG5vIHByb3RvdHlwZSBmb3IgYXJjaF9kdXBfdGFzLi4K
Pj4gZ2l0IHRyZWU6ICAgICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9yaXNjdi9saW51eC5naXQgZml4ZXMKPj4gY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8v
c3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTE1YTM1NzU2ZDAwMDAwCj4+IGtlcm5l
bCBjb25maWc6ICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94Ly5jb25maWc/eD04MWMw
YjcwOGIzMTYyNmNjCj4+IGRhc2hib2FyZCBsaW5rOiBodHRwczovL3N5emthbGxlci5hcHBzcG90
LmNvbS9idWc/ZXh0aWQ9MDA1NjU0ZGQ5YjhmMjZiZDRjMDcKPj4gdXNlcnNwYWNlIGFyY2g6IHJp
c2N2NjQKPj4KPj4gVW5mb3J0dW5hdGVseSwgSSBkb24ndCBoYXZlIGFueSByZXByb2R1Y2VyIGZv
ciB0aGlzIGlzc3VlIHlldC4KPj4KPj4gSU1QT1JUQU5UOiBpZiB5b3UgZml4IHRoZSBpc3N1ZSwg
cGxlYXNlIGFkZCB0aGUgZm9sbG93aW5nIHRhZyB0byB0aGUgY29tbWl0Ogo+PiBSZXBvcnRlZC1i
eTogc3l6Ym90KzAwNTY1NGRkOWI4ZjI2YmQ0YzA3QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20K
Pj4KPj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09Cj4+IEJVRzogS0FTQU46IHNsYWItb3V0LW9mLWJvdW5kcyBpbiByaXNj
dl9pbnRjX2lycSsweDI0LzB4Y2MgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmM6MjQK
Pj4gUmVhZCBvZiBzaXplIDggYXQgYWRkciBmZmZmZmZlMDBjOTYzYmQwIGJ5IHRhc2sga3dvcmtl
ci8xOjEvNDM4OAo+Pgo+PiBDUFU6IDEgUElEOiA0Mzg4IENvbW06IGt3b3JrZXIvMToxIE5vdCB0
YWludGVkIDUuMTIuMC1yYzItc3l6a2FsbGVyLTAwNDY3LWcwZDc1ODhhYjllZjkgIzAKPj4gSGFy
ZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQo+PiBXb3JrcXVldWU6IGV2ZW50cyBu
c2ltX2Rldl90cmFwX3JlcG9ydF93b3JrCj4+IENhbGwgVHJhY2U6Cj4+IFs8ZmZmZmZmZTAwMDAw
OTZjMD5dIHdhbGtfc3RhY2tmcmFtZSsweDAvMHgyM2MgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
YzoyMDEKPj4KPj4gQWxsb2NhdGVkIGJ5IHRhc2sgNzYzNDcwNTY6Cj4+IChzdGFjayBpcyBub3Qg
YXZhaWxhYmxlKQo+Pgo+PiBMYXN0IHBvdGVudGlhbGx5IHJlbGF0ZWQgd29yayBjcmVhdGlvbjoK
PiBUaGVyZSBzZWVtcyB0byBiZSBzb21lIGlzc3VlIHdpdGggcmlzY3Ygc3RhY2sgdW53aW5kZXIu
Cj4gVGhpcyBkb2VzIG5vdCBoYXZlIHN0YWNrcy4KCkhpLCBjb3VsZCB5b3UgdGVzdCB3aXRoIHRo
ZSBmb2xsb3dpbmfCoCBwYXRjaCBhYm91dCB0aGUgbm8gc3RhY2sgCmlzc3VlKGZyb20gdjUuMTEt
cmM0KSwgSSBtYWRlIGEgbWlzdGFrZSB3aGVuIGRvIHNvbWUgY2xlYW51cC4uLgoKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvY2U1YjM1MzMtYjc1ZC1jMzFjLTQzMTktOWQyOTc2
OWJiYmQ1QGh1YXdlaS5jb20vVC8jdAoKPiAiQlVHOiB1bmFibGUgdG8gaGFuZGxlIGtlcm5lbCBh
Y2Nlc3MgdG8gdXNlciBtZW1vcnkgaW4gc2NoZWR1bGVfdGFpbCIKPiBkb2VzIG5vdCBoYXZlIHBy
b3BlciBzdGFja3M6Cj4gaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2lkPTlkZThj
MjRkMjQwMDRmZDVlNDgyNTU1ZjVhZDgzMTRkYTJmYjFjZWUKPgo+IEkgYWxzbyBmb3VuZCAyIHJp
c2N2IHJlcG9ydHMgaW4gIktBU0FOOiB1c2UtYWZ0ZXItZnJlZSBSZWFkIGluCj4gaWRyX2Zvcl9l
YWNoICgyKSI6Cj4gaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2lkPTdmODRkZmMz
OTAyODc4YmVmYzIyZTUyZWI1YzcyOThkMGFkNzBjZjMKPgo+IGJvdGggZG9uJ3QgaGF2ZSBhbnkg
c3RhY2tzOgo+Cj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09Cj4gQlVHOiBLQVNBTjogdXNlLWFmdGVyLWZyZWUgaW4gcmFk
aXhfdHJlZV9uZXh0X3Nsb3QKPiBpbmNsdWRlL2xpbnV4L3JhZGl4LXRyZWUuaDo0MjIgW2lubGlu
ZV0KPiBCVUc6IEtBU0FOOiB1c2UtYWZ0ZXItZnJlZSBpbiBpZHJfZm9yX2VhY2grMHhmNC8weDE2
MCBsaWIvaWRyLmM6MjAyCj4gUmVhZCBvZiBzaXplIDggYXQgYWRkciBmZmZmZmZlMDEwYzAwODc4
IGJ5IHRhc2sgc3l6LWV4ZWN1dG9yLjEvNDgyOAo+Cj4gQ1BVOiAwIFBJRDogNDgyOCBDb21tOiBz
eXotZXhlY3V0b3IuMSBOb3QgdGFpbnRlZAo+IDUuMTIuMC1yYzItc3l6a2FsbGVyLTAwNDY3LWcw
ZDc1ODhhYjllZjkgIzAKPiBIYXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4g
Q2FsbCBUcmFjZToKPiBbPGZmZmZmZmUwMDAwMDk2YzA+XSB3YWxrX3N0YWNrZnJhbWUrMHgwLzB4
MjNjIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmM6MjAxCj4KPiBBbGxvY2F0ZWQgYnkgdGFzayA0
ODI4Ogo+IChzdGFjayBpcyBub3QgYXZhaWxhYmxlKQo+Cj4gRnJlZWQgYnkgdGFzayA0NDczOgo+
IChzdGFjayBpcyBub3QgYXZhaWxhYmxlKQo+Cj4KPj4gLS0tCj4+IFRoaXMgcmVwb3J0IGlzIGdl
bmVyYXRlZCBieSBhIGJvdC4gSXQgbWF5IGNvbnRhaW4gZXJyb3JzLgo+PiBTZWUgaHR0cHM6Ly9n
b28uZ2wvdHBzbUVKIGZvciBtb3JlIGluZm9ybWF0aW9uIGFib3V0IHN5emJvdC4KPj4gc3l6Ym90
IGVuZ2luZWVycyBjYW4gYmUgcmVhY2hlZCBhdCBzeXprYWxsZXJAZ29vZ2xlZ3JvdXBzLmNvbS4K
Pj4KPj4gc3l6Ym90IHdpbGwga2VlcCB0cmFjayBvZiB0aGlzIGlzc3VlLiBTZWU6Cj4+IGh0dHBz
Oi8vZ29vLmdsL3Rwc21FSiNzdGF0dXMgZm9yIGhvdyB0byBjb21tdW5pY2F0ZSB3aXRoIHN5emJv
dC4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cj4gLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
