Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CFBC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 06:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xB4cQrE4wUbmd/VzZm95a2+EoVUk+V57uDIq3/Zfi10=; b=q60wX3eM7qXB9q
	frEKvy4CjMUcUBaTJ8S5H90w3YS8/4TJXtCPJGFi8RzvMtQeqa0Sl9YZDPKlvRmx6Dh8UinlQf1r8
	mnQNcDl5+zxwVmC1yCvEklU1jLMfbvxuKFX72Exlz8xZfEVd195LIMeZNtGYAboFWK6eExbsMrnUY
	CNhgkQAGmUUmR2mXWGHeRjcqOtVSZs4oqo2iQsE1bUimIl2iss40sMsNeVQ9rtloAESxZkVJgqA1e
	ntoBvlYKY0H28MTyL/PIMKzOz4QoAkpzbMgQH6aJsHgpd2FgTdwVuUUbuVbvVuh2nTAbKgeq039Nw
	OncDS4spP4Ft0rFLa5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oupgv-008GoH-3D; Tue, 15 Nov 2022 06:45:05 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oupgk-008GkD-6B; Tue, 15 Nov 2022 06:44:56 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R271e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=xhao@linux.alibaba.com;NM=1;PH=DS;RN=31;SR=0;TI=SMTPD_---0VUsFbJs_1668494685;
Received: from 30.240.98.93(mailfrom:xhao@linux.alibaba.com fp:SMTPD_---0VUsFbJs_1668494685)
          by smtp.aliyun-inc.com;
          Tue, 15 Nov 2022 14:44:48 +0800
Message-ID: <ffdf1eb1-c188-b161-0e70-cad6f64c6c46@linux.alibaba.com>
Date: Tue, 15 Nov 2022 14:44:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 1/2] mm/tlbbatch: Introduce
 arch_tlbbatch_should_defer()
To: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
 linux-doc@vger.kernel.org
Cc: corbet@lwn.net, peterz@infradead.org, arnd@arndb.de,
 punit.agrawal@bytedance.com, linux-kernel@vger.kernel.org,
 darren@os.amperecomputing.com, yangyicong@hisilicon.com,
 huzhanyuan@oppo.com, lipeifeng@oppo.com, zhangshiming@oppo.com,
 guojian@oppo.com, realmz6@gmail.com, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Barry Song <21cnbao@gmail.com>, wangkefeng.wang@huawei.com,
 prime.zeng@hisilicon.com, Anshuman Khandual <khandual@linux.vnet.ibm.com>,
 Barry Song <baohua@kernel.org>
References: <20221115031425.44640-1-yangyicong@huawei.com>
 <20221115031425.44640-2-yangyicong@huawei.com>
From: haoxin <xhao@linux.alibaba.com>
In-Reply-To: <20221115031425.44640-2-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_224454_420657_B38A6510 
X-CRM114-Status: GOOD (  16.22  )
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

CuWcqCAyMDIyLzExLzE1IOS4iuWNiDExOjE0LCBZaWNvbmcgWWFuZyDlhpnpgZM6Cj4gRnJvbTog
QW5zaHVtYW4gS2hhbmR1YWwgPGtoYW5kdWFsQGxpbnV4LnZuZXQuaWJtLmNvbT4KPgo+IFRoZSBl
bnRpcmUgc2NoZW1lIG9mIGRlZmVycmVkIFRMQiBmbHVzaCBpbiByZWNsYWltIHBhdGggcmVzdHMg
b24gdGhlCj4gZmFjdCB0aGF0IHRoZSBjb3N0IHRvIHJlZmlsbCBUTEIgZW50cmllcyBpcyBsZXNz
IHRoYW4gZmx1c2hpbmcgb3V0Cj4gaW5kaXZpZHVhbCBlbnRyaWVzIGJ5IHNlbmRpbmcgSVBJIHRv
IHJlbW90ZSBDUFVzLiBCdXQgYXJjaGl0ZWN0dXJlCj4gY2FuIGhhdmUgZGlmZmVyZW50IHdheXMg
dG8gZXZhbHVhdGUgdGhhdC4gSGVuY2UgYXBhcnQgZnJvbSBjaGVja2luZwo+IFRUVV9CQVRDSF9G
TFVTSCBpbiB0aGUgVFRVIGZsYWdzLCByZXN0IG9mIHRoZSBkZWNpc2lvbiBzaG91bGQgYmUKPiBh
cmNoaXRlY3R1cmUgc3BlY2lmaWMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBLaGFuZHVh
bCA8a2hhbmR1YWxAbGludXgudm5ldC5pYm0uY29tPgo+IFtodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eHBwYy1kZXYvMjAxNzExMDExMDE3MzUuMjMxOC0yLWtoYW5kdWFsQGxpbnV4LnZuZXQu
aWJtLmNvbS9dCj4gU2lnbmVkLW9mZi1ieTogWWljb25nIFlhbmcgPHlhbmd5aWNvbmdAaGlzaWxp
Y29uLmNvbT4KPiBbUmViYXNlIGFuZCBmaXggaW5jb3JyZWN0IHJldHVybiB2YWx1ZSB0eXBlXQo+
IFJldmlld2VkLWJ5OiBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+Cj4g
UmV2aWV3ZWQtYnk6IEFuc2h1bWFuIEtoYW5kdWFsIDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29t
Pgo+IFJldmlld2VkLWJ5OiBCYXJyeSBTb25nIDxiYW9odWFAa2VybmVsLm9yZz4KPiBUZXN0ZWQt
Ynk6IFB1bml0IEFncmF3YWwgPHB1bml0LmFncmF3YWxAYnl0ZWRhbmNlLmNvbT4KPiAtLS0KPiAg
IGFyY2gveDg2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggfCAxMiArKysrKysrKysrKysKPiAgIG1t
L3JtYXAuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgOSArLS0tLS0tLS0KPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20v
dGxiZmx1c2guaAo+IGluZGV4IGNkYTMxMThmM2IyNy4uOGE0OTdkOTAyYzE2IDEwMDY0NAo+IC0t
LSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiArKysgYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS90bGJmbHVzaC5oCj4gQEAgLTI0MCw2ICsyNDAsMTggQEAgc3RhdGljIGlubGluZSB2
b2lkIGZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBs
b25nIGEpCj4gICAJZmx1c2hfdGxiX21tX3JhbmdlKHZtYS0+dm1fbW0sIGEsIGEgKyBQQUdFX1NJ
WkUsIFBBR0VfU0hJRlQsIGZhbHNlKTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW5saW5lIGJvb2wg
YXJjaF90bGJiYXRjaF9zaG91bGRfZGVmZXIoc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gK3sKPiAr
CWJvb2wgc2hvdWxkX2RlZmVyID0gZmFsc2U7Cj4gKwo+ICsJLyogSWYgcmVtb3RlIENQVXMgbmVl
ZCB0byBiZSBmbHVzaGVkIHRoZW4gZGVmZXIgYmF0Y2ggdGhlIGZsdXNoICovCj4gKwlpZiAoY3B1
bWFza19hbnlfYnV0KG1tX2NwdW1hc2sobW0pLCBnZXRfY3B1KCkpIDwgbnJfY3B1X2lkcykKPiAr
CQlzaG91bGRfZGVmZXIgPSB0cnVlOwo+ICsJcHV0X2NwdSgpOwo+ICsKPiArCXJldHVybiBzaG91
bGRfZGVmZXI7Cj4gK30KPiArCj4gICBzdGF0aWMgaW5saW5lIHU2NCBpbmNfbW1fdGxiX2dlbihz
dHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAgIHsKPiAgIAkvKgo+IGRpZmYgLS1naXQgYS9tbS9ybWFw
LmMgYi9tbS9ybWFwLmMKPiBpbmRleCAyZWM5MjVlNWZhNmEuLmE5YWIxMGJjMDE0NCAxMDA2NDQK
PiAtLS0gYS9tbS9ybWFwLmMKPiArKysgYi9tbS9ybWFwLmMKPiBAQCAtNjg1LDE3ICs2ODUsMTAg
QEAgc3RhdGljIHZvaWQgc2V0X3RsYl91YmNfZmx1c2hfcGVuZGluZyhzdHJ1Y3QgbW1fc3RydWN0
ICptbSwgYm9vbCB3cml0YWJsZSkKPiAgICAqLwo+ICAgc3RhdGljIGJvb2wgc2hvdWxkX2RlZmVy
X2ZsdXNoKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBlbnVtIHR0dV9mbGFncyBmbGFncykKPiAgIHsK
PiAtCWJvb2wgc2hvdWxkX2RlZmVyID0gZmFsc2U7Cj4gLQo+ICAgCWlmICghKGZsYWdzICYgVFRV
X0JBVENIX0ZMVVNIKSkKPiAgIAkJcmV0dXJuIGZhbHNlOwo+ICAgCj4gLQkvKiBJZiByZW1vdGUg
Q1BVcyBuZWVkIHRvIGJlIGZsdXNoZWQgdGhlbiBkZWZlciBiYXRjaCB0aGUgZmx1c2ggKi8KPiAt
CWlmIChjcHVtYXNrX2FueV9idXQobW1fY3B1bWFzayhtbSksIGdldF9jcHUoKSkgPCBucl9jcHVf
aWRzKQo+IC0JCXNob3VsZF9kZWZlciA9IHRydWU7Cj4gLQlwdXRfY3B1KCk7Cj4gLQo+IC0JcmV0
dXJuIHNob3VsZF9kZWZlcjsKPiArCXJldHVybiBhcmNoX3RsYmJhdGNoX3Nob3VsZF9kZWZlciht
bSk7Cj4gICB9Cj4gICAKTEdUTSwgdGhhbmtzCgpSZXZpZXdlZC1ieTogWGluIEhhbyA8eGhhb0Bs
aW51eC5hbGliYWJhLmNvbT4KPiAgIC8qCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
