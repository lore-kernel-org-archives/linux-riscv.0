Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF48C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/wC+qva5UacagTxSI/nhhwqORmSnWn19dWvepvmPW4=; b=Pib5cjeNLid3st
	gIS7MwXq51s+vPu96HP0+vM1oV78oSQfngFQWp1771pEeO4h5TuVGXGcHPmgRvXnO1M1Uh/FXfsT5
	e0mlQyZHWONBnS3ZsdE5FJBFU4sPfl6L9MY9UEBQX5bM7bjbY4i7rNWyNj+cT2DnSOfKN2weEI55a
	XKacHGfj1h6SPeofLuahqvDKn2Ql0BC1r0tBvvLy2S5RhsXz5apY37RZYTLVorVHkKtxSc75Czhjj
	NoIhmSPA6y23RD5cBOC2VvocprrgPWQY7j8hR8K1umasNprJgENWa5HP0ibjiqBFU4HI2cY/sWYa1
	gJWV6jpYMrJZ0gznjqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSvnm-007UZ5-1n;
	Thu, 25 Jan 2024 09:13:38 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSvni-007UWh-0C
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 09:13:36 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=zhiwei_liu@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0W.JuljN_1706174004;
Received: from 30.198.0.95(mailfrom:zhiwei_liu@linux.alibaba.com fp:SMTPD_---0W.JuljN_1706174004)
          by smtp.aliyun-inc.com;
          Thu, 25 Jan 2024 17:13:24 +0800
Message-ID: <546f0981-bcab-429b-b3a6-35308c872ff9@linux.alibaba.com>
Date: Thu, 25 Jan 2024 17:13:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qemu riscv, thead c906, Linux boot regression
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 qemu-devel@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Cc: linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <874jf2rj4g.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <874jf2rj4g.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_011334_244708_636A453B 
X-CRM114-Status: GOOD (  13.25  )
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

Ck9uIDIwMjQvMS8yNCAyMDo0OSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBIaSEKPgo+IEkgYnVt
cGVkIHRoZSBSSVNDLVYgTGludXgga2VybmVsIENJIHRvIHVzZSBxZW11IDguMi4wLCBhbmQgcmVh
bGl6ZWQgdGhhdAo+IHRoZWFkIGM5MDYgZGlkbid0IGJvb3QgYW55bW9yZS4gQmlzZWN0aW9uIHBv
aW50cyB0byBjb21taXQgZDZhNDI3ZTJjMGIyCj4gKCJ0YXJnZXQvcmlzY3YvY3B1LmM6IHJlc3Ry
aWN0ICdtYXJjaGlkJyB2YWx1ZSIpCj4KPiBSZXZlcnRpbmcgdGhhdCBjb21taXQsIG9yIHRoZSBo
YWNrIGJlbG93IHNvbHZlcyB0aGUgYm9vdCBpc3N1ZToKPgo+IC0tODwtLQo+IGRpZmYgLS1naXQg
YS90YXJnZXQvcmlzY3YvY3B1LmMgYi90YXJnZXQvcmlzY3YvY3B1LmMKPiBpbmRleCA4Y2JmYzdl
NzgxYWQuLmUxODU5NmM4YTU1YSAxMDA2NDQKPiAtLS0gYS90YXJnZXQvcmlzY3YvY3B1LmMKPiAr
KysgYi90YXJnZXQvcmlzY3YvY3B1LmMKPiBAQCAtNTA1LDYgKzUwNSw5IEBAIHN0YXRpYyB2b2lk
IHJ2NjRfdGhlYWRfYzkwNl9jcHVfaW5pdChPYmplY3QgKm9iaikKPiAgICAgICBjcHUtPmNmZy5l
eHRfeHRoZWFkc3luYyA9IHRydWU7Cj4gICAKPiAgICAgICBjcHUtPmNmZy5tdmVuZG9yaWQgPSBU
SEVBRF9WRU5ET1JfSUQ7Cj4gKyAgICBjcHUtPmNmZy5tYXJjaGlkID0gKChRRU1VX1ZFUlNJT05f
TUFKT1IgPDwgMTYpIHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgKFFFTVVfVkVSU0lPTl9N
SU5PUiA8PCA4KSAgfAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAoUUVNVV9WRVJTSU9OX01J
Q1JPKSk7Cj4gICAjaWZuZGVmIENPTkZJR19VU0VSX09OTFkKPiAgICAgICBzZXRfc2F0cF9tb2Rl
X21heF9zdXBwb3J0ZWQoY3B1LCBWTV8xXzEwX1NWMzkpOwo+ICAgI2VuZGlmCj4gLS04PC0tCj4K
PiBJJ20gdW5zdXJlIHdoYXQgdGhlIGNvcnJlY3QgcWVtdSB3YXkgb2YgYWRkaW5nIGEgZGVmYXVs
dCB2YWx1ZSBpcywKPiBvciBpZiBjOTA2IHNob3VsZCBoYXZlIGEgcHJvcGVyIG1hcmNoaWQuCj4K
PiBNYXliZSBDaHJpc3RvcGggb3IgWmhpd2VpIGNhbiBhbnN3ZXI/Cj4KPiBxZW11IGNvbW1hbmQt
bGluZToKPiBxZW11LXN5c3RlbS1yaXNjdjY0IC1ub2RlZmF1bHRzIC1ub2dyYXBoaWMgLW1hY2hp
bmUgdmlydCxhY3BpPW9mZiBcCj4gICAgIC1jcHUgdGhlYWQtYzkwNiAuLi4KCkhpwqAgQmrDtnJu
LAoKSSB0aGluayBpdCBpcyBjYXVzZWQgYnkgYW4gbW11IGV4dGVuc2lvbihuYW1lZCBYVGhlYWRN
YWVlKSBub3QgCmltcGxlbWVudGVkIG9uIFFFTVUgd2hpY2ggaXMgY29uZmxpY3RzIHdpdGggU3Zw
Ym10LCB3aGljaCBpcyB0aGUgcmVhc29uIApmb3IgZXJyb3ItdGEgaW4gTGludXguCgpJIHdpbGwg
dHJ5IHRvIGZpeCB0aGlzIG9uIFFFTVUgYW5kIGF0IHRoZSBzYW1lIHRpbWUgZ2l2ZSBhIHdheSB0
byAKaW1wbGVtZW50IHZlbmRvciBjdXN0b20gQ1NSKFhUaGVhZE1hZWUgaXMgY29udHJvbGxlZCBi
eSBhbiBDU1IgbmFtZWQgCm1leHN0YXR1cynCoCBvbiBRRU1VLgoKVGhhbmtzLApaaGl3ZWkKCj4K
PiBUaGFua3MsCj4gQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
