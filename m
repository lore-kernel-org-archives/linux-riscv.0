Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A600C433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 07:53:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C95CE64F8C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 07:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C95CE64F8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wOHd2Yg2ySITiy6M7c+l1Vdf9zjB5wo+Nc1xj7nVK7s=; b=hoaU4ve4kYXxhhS1NGmzVXFc9
	X9iCseaSQL6rZ98t4y3w4CyOvkJwEQcE7kS0YdKmcSrw4qdmTZQGE2WJIRNSS6ToNLfecJ2f2+6Yy
	KqStO7aFqMJf8EG2cBMOTcTcRu1BivAkcuod6z+F4MRIIv8df5o6DX2b/BR5pRC2QrhhH+MODrcMC
	B9MoqWDf5YbK0JTUm5KJ4MTg1YKl4kuUWUUXTHaKZ6QhJGWOenQNKDrdg1OrkkBfIcznmJvOKDxIe
	hx7Bap5IMmJQLYCMQkFSZufWZrJFlqbcLif2gH5fOjQghWGLcNDjUGcEv0o5EEL7ITniywybzng+P
	s0vggcdNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7vw0-00016r-3H; Fri, 05 Feb 2021 07:53:44 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7vvw-00015t-Pc
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 07:53:42 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DX71J0vR6zjGhX;
 Fri,  5 Feb 2021 15:52:20 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 5 Feb 2021 15:53:21 +0800
Subject: Re: [PATCH -next] RISCV: Add some depends for NUMA
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-3a9465c0-42bb-42de-ad66-855dc2e3c56f@palmerdabbelt-glaptop>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <ed095f07-8c91-903b-2859-203ca9b429fa@huawei.com>
Date: Fri, 5 Feb 2021 15:53:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <mhng-3a9465c0-42bb-42de-ad66-855dc2e3c56f@palmerdabbelt-glaptop>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_025341_087094_00590BB1 
X-CRM114-Status: GOOD (  21.33  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjEvMi81IDE0OjU4LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBXZWQsIDAzIEZl
YiAyMDIxIDA2OjIzOjQzIFBTVCAoLTA4MDApLCB3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbSAK
PiB3cm90ZToKPj4gVGhlIG51bWEgZmVhdHVyZSBpcyB1c2VsZXNzIGZvciByaXNjdjMyIHBsYXRm
b3JtKE1BWFBIWVNNRU1fMUdCIGlmIAo+PiAzMmJpdCksCj4KPiBJJ20gbm90IGNvbnZpbmNlZCBv
ZiB0aGF0LsKgIFRoZXJlJ3Mgbm8gcmVhc29uIE5VTUEgc2hvdWxkbid0IHdvcmsgb24gCj4gMzIt
Yml0LCBpdAo+IGRvZXNuJ3QgZGVwZW5kIG9uIGhhdmluZyBhIGxhcmdlIGFtb3VudCBvZiBtZW1v
cnkganVzdCBoYXZpbmcgbm9uLXVuaWZvcm0KPiBtZW1vcnkuwqAgSSBjb3VsZCBidXkgdGhlIGFy
Z3VtZW50IHRoYXQgYnVpbGQgYSAzMi1iaXQgTlVNQSBzeXN0ZW0gCj4gd291bGQgYmUKPiB3YWNr
eSwgYnV0IElJVUMgaXQgd29ya3Mgbm93IGFuZCBJIGRvbid0IHNlZSBhbnkgcmVhc29uIHRvIHRo
cm93IHRoYXQgCj4gYXdheS4KCkkgdGhpbmsgdGhlIFJWMzIgd29uJ3QgYmVuZWZpdCBmcm9tIE5V
TUEsIHRoZXJlJ3Mgbm8gdG9vIG11Y2ggbWVtb3J5IApzdXBwb3J0IG9uIFJWMzIsCgphbmQgaXQg
bWF5IGluY3JlYXNlIHRoZSBJbWFnZSBzaXplLMKgIHNvIEkgZGVjaWRlZCB0byBkcm9wIHN1cHBv
cnQgZm9yIFJWMzIuCgo+Cj4+IGFuZCBpdCBzaG91bGQgZGVwZW5kcyBvbiBTTVAgZmVhdHVyZSwg
dGhpcyBhbHNvIGZpeCB0aGUgYnVpbGQgZXJyb3IsCj4KPiBJIGNhbiBidXkgdGhhdCBDT05GSUdf
TlVNQSBkb2Vzbid0IHJlYWxseSBtYWtlIHNlbnNlIHdpdGhvdXQgCj4gQ09ORklHX1NNUCwgYXMK
PiB0aGVyZSdzIG5vdCBhIHdob2xlIGxvdCB0byBkbywgYnV0IEkgYWxzbyBkb24ndCBzZWUgYW55
IHJlYXNvbiBmcm9tIAo+IGRpc2FsbG93aW5nCj4gdXNlcnMgZnJvbSBwaWNraW5nIGl0LsKgIGFy
bTY0IGFsbG93cyAhU01QICYmIE5VTUEsIGFuZCBJIGRvbid0IHNlZSBhbnkgCj4gcmVhc29uCj4g
aXQgd291bGRuJ3Qgd29yayBqdXN0IGFzIHdlbGwgZm9yIHVzLgoKQVJNNjQgd29uJyBzdXBwb3J0
ICFTTVAgYWZ0ZXIgZm9sbG93aW5nIHBhdGNoLCBhbmQgZm9yIG1vc3QgCmFyY2hpdGVjdHVyZSzC
oCB0aGUgTlVNQSBmZWF0dXJlCgpkZXBlbmRzIG9yIHNlbGVjdCBTTVAgZmVhdHVyZS4KCgpjb21t
aXQgNGIzZGM5Njc5Y2Y3NzkzMzlkOTA0OTgwMDgwM2RmYzNjODM0MzNkMQpBdXRob3I6IFdpbGwg
RGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+CkRhdGU6wqDCoCBGcmkgTWF5IDI5IDE4OjI4OjQ0IDIw
MTUgKzAxMDAKCiDCoMKgwqAgYXJtNjQ6IGZvcmNlIENPTkZJR19TTVA9eSBhbmQgcmVtb3ZlIHJl
ZHVuZGFudCAjaWZkZWZzCgoKCj4KPj4gwqAgcmlzY3Y2NC1idWlsZHJvb3QtbGludXgtZ251LWxk
OiBtbS9wYWdlX2FsbG9jLm86IGluIGZ1bmN0aW9uIGAuTDAgJzoKPj4gwqAgcGFnZV9hbGxvYy5j
OigudGV4dCsweDQ4MDgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIAo+PiBgbm9kZV9yZWNsYWlt
X2Rpc3RhbmNlJwo+Cj4gVGhlIG9ubHkgaW5zdGFuY2Ugb2Ygbm9kZV9yZWNsYWltX2Rpc3RhbmNl
IEkgc2VlIGluIG1tL3BhZ2VfYWxsb2MuYyBpcyAKPiBhbHJlYWR5Cj4gZ3VhcmRlZCB3aXRoIENP
TkZJR19OVU1BLCBidXQgdGhlIGRlZmluaXRpb24gb2Ygbm9kZV9yZWNsYWltX2Rpc3RhbmNlIAo+
IGlzbid0Lgo+IEknbGwgc2VuZCBvdXQgc29tZSBwYXRjaGVzIHRvIGFkZCB0aGUgZ3VhcmQgd2hp
Y2ggbWlnaHQgbWFrZSBzb3J0aW5nIAo+IHRoaXMgb3V0Cj4gZWFybGllciwgYnV0IEkgZG9uJ3Qg
c2VlIGl0IGZpeGluZyBhbnkgZmFpbHVyZXMuCj4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
