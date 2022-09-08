Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAEEECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 01:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6ZtCAs9H62lZerldExQ8ar+NVu9+66GT2j2QE8GaGg=; b=Hn1b/CwlU/h0rn
	8hRRCF0Cq8ITZh8Wdc9mM1L/iAIXEq8KOKeHI/erS/KrY/tg39D2QHFltdzGhj/gGucxXOJlFhC/b
	h9Ny+ByMrKTG0CM1+IQ8CCkH84xNNEqH8rBv9h0JRxhWdhfeZ8ul45u3ff/dqDR+KlIRTxkqHyIJe
	UW6qRE9Yw2adSgpyaHXTq04V0cKgX1Eh2PQqtwJdDWpCIGLmzSqzc8Ols5yeQsUs0BKoxd13YH8X/
	daNlcl06/qZzfQOAoQEHi8zuD5JusXFhwlHfgVxQGbgF0fXw/QKSX6t9kgjPVT5v2ddGKOUfQx0uw
	6SXv3JkLYYwY0p74nKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW6a8-00EOza-9y; Thu, 08 Sep 2022 01:43:52 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW6a5-00EOuP-2W
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 01:43:50 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MNMKN13w4znV42;
	Thu,  8 Sep 2022 09:41:12 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 8 Sep 2022 09:43:46 +0800
Message-ID: <a00328a1-47ee-3700-8cd8-1a9f4e0d7a2b@huawei.com>
Date: Thu, 8 Sep 2022 09:43:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] riscv/kprobe: Optimize the performance of patching
 instruction slot
To: Jisheng Zhang <jszhang@kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<mhiramat@kernel.org>, <rostedt@goodmis.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220907023327.85630-1-liaochang1@huawei.com>
 <YxjTF2FlIJbbKq0p@xhacker>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <YxjTF2FlIJbbKq0p@xhacker>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_184349_312708_514E8711 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhhbmtzIGZvciBjb21tZW50LgoK5ZyoIDIwMjIvOS84IDE6MjEsIEppc2hlbmcgWmhhbmcg5YaZ
6YGTOgo+IE9uIFdlZCwgU2VwIDA3LCAyMDIyIGF0IDEwOjMzOjI3QU0gKzA4MDAsIExpYW8gQ2hh
bmcgd3JvdGU6Cj4+IFNpbmNlIG5vIHJhY2UgY29uZGl0aW9uIG9jY3VycyBvbiBlYWNoIGluc3Ry
dWN0aW9uIHNsb3QsIGhlbmNlIGl0IGlzCj4+IHNhZmUgdG8gcGF0Y2ggaW5zdHJ1Y3Rpb24gc2xv
dCB3aXRob3V0IHN0b3BwaW5nIG1hY2hpbmUuCj4gCj4gaG1tLCBJTUhPIHRoZXJlJ3MgcmFjZSB3
aGVuIGFybWluZyBrcHJvYmUgdW5kZXIgU01QLCBzbyBzdG9wcGluZwo+IG1hY2hpbmUgaXMgbmVj
ZXNzYXJ5IGhlcmUuIE1heWJlIEkgbWlzdW5kZXJ0YW5kIHNvbWV0aGluZy4KPiAKCkl0IGlzIGlu
ZGVlZCBuZWNlc3NhcnkgdG8gc3RvcCBtYWNoaW5lIHdoZW4gYXJtIGtwcm9iZSB1bmRlciBTTVAs
CmJ1dCBpIGRvbid0IHRoaW5rIGl0IG5lZWQgdG8gc3RvcCBtYWNoaW5lIHdoZW4gcHJlcGFyZSBp
bnN0cnVjdGlvbiBzbG90LAp0d28gcmVhc29uczoKCjEuIEluc3RydWN0aW9uIHNsb3QgaXMgZHlu
YW1pY2FsbHkgYWxsb2NhdGVkIGRhdGEuCjIuIEtlcm5lbCB3b3VsZCBub3QgZXhlY3V0ZSBpbnN0
cnVjdGlvbiBzbG90IHVudGlsIG9yaWdpbmFsIGluc3RydWN0aW9uCiAgIGlzIHJlcGxhY2VkIGJ5
IGJyZWFrcG9pbnQuCgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBMaWFvIENoYW5nIDxsaWFvY2hhbmcx
QGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMu
YyB8IDggKysrKystLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3By
b2Jlcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+PiBpbmRleCBlNmU5
NTBiN2NmMzIuLmVmZjdkN2ZhYjUzNSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
cHJvYmVzL2twcm9iZXMuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jl
cy5jCj4+IEBAIC0yNCwxMiArMjQsMTQgQEAgcG9zdF9rcHJvYmVfaGFuZGxlcihzdHJ1Y3Qga3By
b2JlICosIHN0cnVjdCBrcHJvYmVfY3RsYmxrICosIHN0cnVjdCBwdF9yZWdzICopOwo+PiAgc3Rh
dGljIHZvaWQgX19rcHJvYmVzIGFyY2hfcHJlcGFyZV9zc19zbG90KHN0cnVjdCBrcHJvYmUgKnAp
Cj4+ICB7Cj4+ICAJdW5zaWduZWQgbG9uZyBvZmZzZXQgPSBHRVRfSU5TTl9MRU5HVEgocC0+b3Bj
b2RlKTsKPj4gKwljb25zdCBrcHJvYmVfb3Bjb2RlX3QgYnJrX2luc24gPSBfX0JVR19JTlNOXzMy
Owo+PiArCWtwcm9iZV9vcGNvZGVfdCBzbG90W01BWF9JTlNOX1NJWkVdOwo+PiAgCj4+ICAJcC0+
YWluc24uYXBpLnJlc3RvcmUgPSAodW5zaWduZWQgbG9uZylwLT5hZGRyICsgb2Zmc2V0Owo+PiAg
Cj4+IC0JcGF0Y2hfdGV4dChwLT5haW5zbi5hcGkuaW5zbiwgcC0+b3Bjb2RlKTsKPj4gLQlwYXRj
aF90ZXh0KCh2b2lkICopKCh1bnNpZ25lZCBsb25nKShwLT5haW5zbi5hcGkuaW5zbikgKyBvZmZz
ZXQpLAo+PiAtCQkgICBfX0JVR19JTlNOXzMyKTsKPj4gKwltZW1jcHkoc2xvdCwgJnAtPm9wY29k
ZSwgb2Zmc2V0KTsKPj4gKwltZW1jcHkoKHZvaWQgKikoKHVuc2lnbmVkIGxvbmcpc2xvdCArIG9m
ZnNldCksICZicmtfaW5zbiwgNCk7Cj4+ICsJcGF0Y2hfdGV4dF9ub3N5bmMocC0+YWluc24uYXBp
Lmluc24sIHNsb3QsIG9mZnNldCArIDQpOwo+PiAgfQo+PiAgCj4+ICBzdGF0aWMgdm9pZCBfX2tw
cm9iZXMgYXJjaF9wcmVwYXJlX3NpbXVsYXRlKHN0cnVjdCBrcHJvYmUgKnApCj4+IC0tIAo+PiAy
LjE3LjEKPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo+IC4KCi0tIApCUiwKTGlhbywgQ2hhbmcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
