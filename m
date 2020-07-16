Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615E0C433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 15:32:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31FEE2065F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 15:32:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k+dvIUbo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31FEE2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+n9f7y9uv+7QhBknCKSmcWDZkP/9okKZAobDHdALSyI=; b=k+dvIUboUa2HQfiBa7sszNmT/
	URpX9VACUhpSaodLEyHu9V7mRp7kJIZMr58oNTThV1CIDSjl7bIEacN9cLezEWIp35Ahz0yli20hu
	eoEUToenMHb65pHS158xfeT6VV29oyZbazqWzBu1m1+v2MT+SpJ1oNnKBDK7LWwcBX0Btef0yvRkg
	JyGlTWRRq1fgWFO68ENuWPmst2GFbcjvRfhcwuMvrUR0IQeObmc0gWsbnXbgFumnDOHzWNmZ2nyfy
	kMLLxDhuTGC9H3Yea7sSTTdrhAQx5iYSEPFuTL7cinTeShQ5BAUhMKKwa2yixa9yF756JFl5X8Q7m
	agwWmlxkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw5rk-0000lW-QW; Thu, 16 Jul 2020 15:32:08 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw5ri-0000kE-7z
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 15:32:07 +0000
Received: from av3.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 06GFVctl016546; Thu, 16 Jul 2020 15:31:40 GMT
X-AuditID: 8b5b014d-257ff700000045c5-29-5f1072da7031
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 86.5E.17861.AD2701F5; Thu, 16 Jul 2020 18:31:38 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 16 Jul 2020 18:31:29 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 2/3] RISC-V: Add kdump support
Organization: FORTH
In-Reply-To: <mhng-8b167c99-bbdf-420c-95a4-40ad9d706d45@palmerdabbelt-glaptop1>
References: <mhng-8b167c99-bbdf-420c-95a4-40ad9d706d45@palmerdabbelt-glaptop1>
Message-ID: <3e3af982459083a8467662ca1114007c@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.9
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsXSHT1dWfdWkUC8QUODgUXLh3esFotWfGex
 2HL4EbPFts8tbBbN786xW7y83MNs0TaL36LpxXVmiw93Z7M5cHpM/X2GxaPrxwxWjzcvX7J4
 PNx0iclj85J6j0vN19k92g90MwWwR3HZpKTmZJalFunbJXBlHFlykKnglkTF/ustbA2M+4W7
 GDk5JARMJJ5vXsTaxcjFISRwlFHixu2pLBAJU4nZezsZQWxeAUGJkzOfgMWZBSwkpl7Zzwhh
 y0s0b53NDGKzCKhKrGhcAFbDJqApMf/SQTBbREBd4sDrO8wgC5gF2pkkzk05CdYgDLSg8egO
 dhCbX0BY4tPdi6wgNqeAv8Szhv1MILaQgJ/EpKOPoY5wkbj35DHUcSoSH34/AOsVFVCWuHn4
 OfsERsFZSG6dheTWWUhuXcDIvIpRILHMWC8zuVgvLb+oJEMvvWgTIzg2GH13MN7e/FbvECMT
 B+MhRgkOZiURXh4u3ngh3pTEyqrUovz4otKc1OJDjNIcLErivHncy2OFBNITS1KzU1MLUotg
 skwcnFINTIemXO//nZGyQTGlX++SToDY08p/XLsm3b23ekXkrplMM3+3637/8+13VL71lkXP
 r/3bLHdB+aLR/3kl9ffy1yS/mxmcp61X2CUrkces/vjq1+P1Zr3nShczdoo29lbYsjOKKLGL
 yHt/V+1TzKhsPTeT72XRY0ZmO5+wzGWS0cUrxGxqBP+/u68hI5m1LmSnrdlygatG3RV+1c5x
 Uzk3cH7k9496Ga2yKy1+JbNXbZa59SlTr/nC+/kPL1Fec9Rk06LZ8me+KW4zMTP24gw8zsio
 FPuL9bXAwnvchTMWdc63i7Te8+6aWFLqmlali8IVh0WNFSZ9YQzb4epvePJE7tWZyjPWXNqm
 Eeaq9jlTiaU4I9FQi7moOBEAZvicyPwCAAA=
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Thu, 16 Jul 2020 15:31:40 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av3.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Thu, 16 Jul 2020 15:31:40 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_113206_579823_7C42B28F 
X-CRM114-Status: GOOD (  24.02  )
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
Cc: david.abdurachmanov@sifive.com, anup@brainfault.org,
 Atish Patra <Atish.Patra@wdc.com>, yibin_liu@c-sky.com, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, mick@ics.forth.gr,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAyMC0wNy0xMSAwNjo1OSwgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IE9uIFR1ZSwgMjMgSnVuIDIwMjAgMDg6MDU6MTEgUERUICgtMDcwMCksIG1pY2tAaWNzLmZvcnRo
LmdyIHdyb3RlOgo+PiAKPj4gKwo+PiArCS8qIFN3aXRjaCB0byBwaHlzaWNhbCBhZGRyZXNzaW5n
ICovCj4+ICsJY3NydwlzcHRiciwgemVybwo+IAo+IEkgZ3Vlc3MgSSdtIG1pc3Npbmcgc29tZXRo
aW5nLCBidXQgSSdkIGFzc3VtZSB0aGF0IHdlIHdvdWxkIG5lZWQgc29tZSAKPiBzb3J0IG9mCj4g
dHZlYyBqdWdnbGluZyBoZXJlIGxpa2Ugd2UgdXN1YWxseSBkbyB3aGVuIGp1bXBpbmcgYmV0d2Vl
biB2aXJ0dWFsIGFuZCAKPiBwaHlzaWNhbAo+IHNwYWNlcy4gIEkgZ2V0IHRoYXQgd2UncmUgbm90
IHJlbG9jYXRpbmcgdGhlIGtlcm5lbCB0aGF0IHdlJ3JlIGp1bXBpbmcgCj4gdG8sIGJ1dAo+IEkg
ZG9uJ3QgdW5kZXJzdGFuZCBob3cgUEFHRV9PRkZTRVQgd29ya3MuCj4gCgpXZSBvbmx5IGNsZWFu
IHVwIHJlZ2lzdGVycyBhZnRlciB0aGlzLCBpbnRlcnJ1cHRzIGFyZSBkaXNhYmxlZCwgYW5kIGph
bHIgCndpbGwgYmUgY2FsbGVkIHdpdGggYW4gYWJzb2x1dGUgcGh5c2ljYWwgYWRkcmVzcyBhZnRl
ciBzYXRwIGlzIHplcm8uIEkgCmRvbid0IHNlZSBob3cgd2UgY2FuIGVuZCB1cCB3aXRoIGEgdHJh
cCBidXQgSSBjYW4gYWRkIGExIHRvIHN0dmVjIGp1c3QgCmluIGNhc2UgaWYgeW91IHdhbnQuCgo+
PiArCj4+ICsJLyogUGFzcyB0aGUgYXJndW1lbnRzIHRvIHRoZSBuZXh0IGtlcm5lbCAgLyBDbGVh
bnVwKi8KPiAKPiBNaXNzaW5nIHNwYWNlIGluIHRoYXQgY29tbWVudC4KPiAKCkFDSwoKPj4gKwkv
KiBBZGQgL21lbW9yeSByZWdpb25zIHRvIHRoZSByZXNvdXJjZSB0cmVlICovCj4+ICsJZm9yX2Vh
Y2hfbWVtYmxvY2sobWVtb3J5LCByZWdpb24pIHsKPj4gKwkJcmVzID0gbWVtYmxvY2tfYWxsb2Mo
c2l6ZW9mKHN0cnVjdCByZXNvdXJjZSksIFNNUF9DQUNIRV9CWVRFUyk7Cj4+ICsJCWlmICghcmVz
KQo+PiArCQkJcGFuaWMoIiVzOiBGYWlsZWQgdG8gYWxsb2NhdGUgJXp1IGJ5dGVzXG4iLCBfX2Z1
bmNfXywKPj4gKwkJCSAgICAgIHNpemVvZihzdHJ1Y3QgcmVzb3VyY2UpKTsKPj4gKwo+PiArCQlp
ZiAodW5saWtlbHkobWVtYmxvY2tfaXNfbm9tYXAocmVnaW9uKSkpIHsKPj4gKwkJCXJlcy0+bmFt
ZSA9ICJSZXNlcnZlZCI7Cj4+ICsJCQlyZXMtPmZsYWdzID0gSU9SRVNPVVJDRV9NRU0gfCBJT1JF
U09VUkNFX0JVU1k7Cj4gCj4gVGhpcyBkaWZmZXJzIGZyb20gd2hhdCBJIGVuZGVkIHVwIHdpdGgg
aW4gdGhhdCBJIGRvbid0IGhhdmUgCj4gSU9SRVNPVVJDRV9CVVNZLiAgSQo+IGp1c3QgY29waWVk
IHRoaXMgYmxpbmRseSBmcm9tIGFybTY0IHNvIEkgZG9uJ3QgYWN0dWFsbHkga25vdyB3aGF0IHRo
ZQo+IGRpZmZlcmVuY2UgaXMuCj4gCgpGb3Igbm93IHNpbmNlIHdlIGRvbid0IG1hcmsgYW55IC9t
ZW1vcnkgcmVnaW9ucyB3aXRoIHRoZSBOT01BUCBmbGFnIChBUk0gCmZvciBleGFtcGxlIGRvZXMg
dGhpcyBmb3IgdGhlIGtlcm5lbCBpbWFnZSByZWdpb24pIHRoaXMgY29kZSB3b24ndCBiZSAKZXhl
Y3V0ZWQsIEkgcHV0IGl0IHRoZXJlIGZvciBjb21wbGV0ZW5lc3MgaW4gY2FzZSB3ZSBkbyBzbyBp
biB0aGUgCmZ1dHVyZS4gSW4gYW55IGNhc2UgdGhlIGlkZWEgaXMgdG8gcHJldmVudCBhIHJlZ2lv
biBtYXJrZWQgd2l0aCBOT01BUCB0byAKYmUgYWNjZXNzaWJsZSB0aHJvdWdoIC9kZXYvbWVtIHdo
ZW4gU1RSSUNUX0RFVk1FTSAmIElPX1NUUklDVF9ERVZNRU0gaXMgCmVuYWJsZWQuIE9uIGRldm1l
bV9pc19hbGxvd2VkKCksIHRoZSBkZWZhdWx0IHBhZ2VfaXNfcmFtKCkgd2lsbCBjaGVjayAKZm9y
IElPUkVTT1VSQ0VfU1lTVEVNX1JBTSBmbGFnIHNvIGl0IHdpbGwgbm90IHByZXZlbnQgdGhpcyBy
ZWdpb24gZnJvbSAKYmVpbmcgbWFwcGVkIHRocm91Z2ggL2Rldi9tZW0gc2luY2UgaXQncyBmbGFn
ZWQgd2l0aCBJT1JFU09VUkNFX01FTSAKaW5zdGVhZC4gVGhlIGlkZWEgaXMgdG8gcmVseSBvbiBp
b21lbV9pc19leGNsdXNpdmUoKSB0byBkbyB0aGUgd29yaywgYW5kIApmb3IgdGhhdCB3ZSBuZWVk
IHRoZSByZWdpb24gdG8gYmUgbWFya2VkIGFzIGJ1c3kgCihodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92NS44LXJjNC9zb3VyY2Uva2VybmVsL3Jlc291cmNlLmMjTDE2MTQpLgoKSSB3
YW50ZWQgdG8gZG8gc29tZXRoaW5nIHRvIGFsc28gaG9ub3IgdGhlIG5vX21hcCBmbGFnIG9uIHRo
ZSAKL3Jlc2VydmVkLW1lbW9yeSByZWdpb25zIHRoYXQgYWNjb3JkaW5nIHRvIHRoZSBkZXZpY2Ug
dHJlZSBzcGVjLCAKc2hvdWxkbid0IGJlIGF2YWlsYWJsZSB0byBhbnkgb3RoZXIgdGhhbiB0aGUg
ZHJpdmVyIChzbyB3ZSBzaG91bGQgYWxzbyAKcHJldmVudCB0aGVtIGZyb20gYmVpbmcgYWNjZXNz
aWJsZSB0aHJvdWdoIC9kZXYvbWVtKSwgYW5kIEkgbm90aWNlZCB0aGF0IApvdGhlciBhcmNocyBk
b24ndCBkZWFsIHdpdGggdGhpcy4gSG93ZXZlciB0aGlzIHdhcyBhIGJpdCBvZmYtdG9waWMgc2lu
Y2UgCml0IGhhZCBub3RoaW5nIHRvIGRvIHdpdGgga2V4ZWMva2R1bXAuCgo+IAo+IElmIHlvdSBz
cGxpdCBvdXQgaW5pdF9yZXNvdXJjZSgpIHRoZW4gSSBjYW4gdGFrZSBpdCBiZWZvcmUgdGhlIHJl
c3Qgb2YgCj4gdGhlCj4ga2V4ZWMgc3R1ZmYuCgpJJ2xsIHNlbmQgYSBwYXRjaCBmb3IgcG9wdWxh
dGluZyBpb3Jlc291cmNlcyBhbmQgYWxzbyBhZGQgdGhlIGV4dHJhIApzYXVjZSBmb3IgaGFuZGxp
bmcgbm9fbWFwIGZvciAvcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMuIFRoZW4gSSdsbCBzZW5kIApr
ZHVtcCAvIGNyYXNoa2VybmVsIG9uIHRvcC4gSXMgaXQgT0sgaWYgSSByZW1vdmUgdGhlIGV4aXN0
aW5nIGNvZGUgZnJvbSAKbW0vaW5pdC5jIGFuZCBhZGQgdGhlIG5ldyBvbmUgb24ga2VybmVsL3Nl
dHVwLmMgPyBBZnRlciBhbGwgaXQncyBub3QgCnJlbGF0ZWQgdG8gbW0sIGlvcmVzb3VyY2VzIGlz
IGEgZGlmZmVyZW50IHRoaW5nIGFuZCBvdGhlciBhcmNocyBhbHNvIApoYW5kbGUgdGhpcyBvbiBz
ZXR1cC5jLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
