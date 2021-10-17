Return-Path: <SRS0=VDpU=PF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C6FC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Oct 2021 07:55:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A2AF61050
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Oct 2021 07:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A2AF61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=126.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVcjQ26QaOyAQAulou1l8NYMWq56icAhCVYiZClSAeA=; b=IJ4YwbOB2JmIXq
	ixAKxbs9ghJx09lAMrqEyovIwUho+l1FLEacm6QDJlIgizJC4SWzs1lcFNqj9qyXmJjpFgI5cZkCv
	ONSmdPOwAfT9zWuTul8IjCQMkCBLRrXGNOBy6XiHt6o4wvrjAwBRqSz7Yip/GWbHSlOFLJa5LXU/L
	1W5wq3p+W8QEngTLORBm4FbLn5uj/ak/KNSEe1zzZP+oZyyKAkjtqimXLM5LUqRGvZRhtjp/0+n5N
	JLn/j0Ha1MTw8+WJdyZf0DfWbVD0Jh1XvAGbHkgdGvJpOzfYwRo26m9n7A0HvehjwyqCRGQuQy0Qp
	6rxc6io4owTsJzrkGSLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mc114-00BvX5-ID; Sun, 17 Oct 2021 07:55:34 +0000
Received: from mail-m963.mail.126.com ([123.126.96.3])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mc110-00BvWR-Ar; Sun, 17 Oct 2021 07:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Message-ID:Subject:From:Date:MIME-Version; bh=kfvAx
 b6atL/vWwpV/RLDdStnL8qUxjQfmKzvVV1svv0=; b=a6WZOqw4G5xuXe+lnsjqw
 1tv72V3TVFYyiXayQp40lpcELhhLTFG69o+Hn+J2zk+Hvz2D0XtBhEwcpIXF+Lo+
 ZOdnVZ98mxj+Z/v+oomb5gG69+Qi3HjIdmKktDxJ6hc0QWdO6KsEOGnG8TJbUHRg
 020vdYf0T1kAst/lKAGaxM=
Received: from [127.0.0.1] (unknown [153.99.123.184])
 by smtp8 (Coremail) with SMTP id NORpCgBnbrK+1mthlSZQAQ--.27969S2;
 Sun, 17 Oct 2021 15:54:40 +0800 (CST)
Message-ID: <2cca0c29a56fd8be0dc9b25f68f5c308484d093b.camel@126.com>
Subject: Re: [PATCH 1/1] dt-bindings: reg-io-width for SiFive CLINT
From: Xiang W <wxjstz@126.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Guo Ren <guoren@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Atish Patra <atish.patra@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, opensbi@lists.infradead.org
Date: Sun, 17 Oct 2021 15:54:38 +0800
In-Reply-To: <20211015100941.17621-1-heinrich.schuchardt@canonical.com>
References: <20211015100941.17621-1-heinrich.schuchardt@canonical.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-CM-TRANSID: NORpCgBnbrK+1mthlSZQAQ--.27969S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFyDGr15Ar18Wr4ftFWUJwb_yoW8CrW7pa
 yxCFnFga1Iga4xWayxXa1kCrW5XrWkJw4293WDt347Gr4DWa4FqayagrnrX3W7A3Wv9FZF
 qa409r15Ga12vr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4yIbUUUUU=
X-Originating-IP: [153.99.123.184]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiIQAvOlpECkDIvgAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_005531_034025_654D3B46 
X-CRM114-Status: GOOD (  16.06  )
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

5ZyoIDIwMjEtMTAtMTXmmJ/mnJ/kupTnmoQgMTI6MDkgKzAyMDDvvIxIZWlucmljaCBTY2h1Y2hh
cmR05YaZ6YGT77yaCj4gVGhlIENMSU5UIGluIHRoZSBULUhFQUQgOXh4IHByb2Nlc3NvcnMgZG8g
bm90IHN1cHBvcnQgNjRiaXQgbW1pbwo+IGFjY2VzcyB0bwo+IHRoZSBNVElNRVIgZGV2aWNlLiBU
aGUgY3VycmVudCBzY2hlbWEgZG9lcyBub3QgYWxsb3cgdG8gc3BlY2lmeSB0aGlzLgo+IAo+IE9w
ZW5TQkkgY3VycmVudGx5IHVzZXMgYSBwcm9wZXJ0eSAnY2xpbnQsaGFzLW5vLTY0Yml0LW1taW8n
IHRvCj4gaW5kaWNhdGUgdGhlCj4gcmVzdHJpY3Rpb24uIFNhbXVhZWwgSG9sbGFuZCBzdWdnZXN0
ZWQgaW4KPiBsaWI6IHV0aWxzL3RpbWVyOiBVc2Ugc3RhbmRhcmQgcHJvcGVydHkgdG8gc3BlY2lm
eSAzMi1iaXQgSS9PCj4gaHR0cHM6Ly9naXRodWIuY29tL3NtYWV1bC9vcGVuc2JpL2NvbW1pdC9i
OTVlOWNmN2NmOTNiMGFmMTZmYzg5MjA0Mzc4YmM1OWZmMzAwMDhlCj4gdG8gdXNlICJyZWctaW8t
d2lkdGggPSA8ND47IiBhcyB0aGUgcmVnLWlvLXdpZHRoIHByb3BlcnR5IGlzCj4gZ2VuZXJhbGx5
IHVzZWQKPiBpbiB0aGUgZGV2aWNldHJlZSBzY2hlbWEgZm9yIHN1Y2ggYSBjb25kaXRpb24uCj4g
Cj4gQSByZWxlYXNlIGNhbmRpZGF0ZSBvZiB0aGUgQUNMSU5UIHNwZWNpZmljYXRpb24gaXMgYXZh
aWxhYmxlIGF0Cj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWFjbGludC9yZWxlYXNl
cwo+IAo+IEFkZCByZWctaW8td2lkdGggYXMgb3B0aW9uYWwgcHJvcGVydHkgdG8gdGhlIFNpRml2
ZSBDb3JlIExvY2FsCj4gSW50ZXJydXB0b3IuCj4gCj4gU2lnbmVkLW9mZi1ieTogSGVpbnJpY2gg
U2NodWNoYXJkdAo+IDxoZWlucmljaC5zY2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+Cj4gLS0tCj4g
wqBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50Lnlh
bWwgfCA3Cj4gKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQKPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9z
aWZpdmUsY2xpbnQueWFtbAo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Rp
bWVyL3NpZml2ZSxjbGludC55YW1sCj4gaW5kZXggYTM1OTUyZjQ4NzQyLi4yNjYwMTJkODg3YjUg
MTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3Np
Zml2ZSxjbGludC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4gQEAgLTQxLDYgKzQxLDEzIEBAIHByb3BlcnRpZXM6
Cj4gwqDCoCByZWc6Cj4gwqDCoMKgwqAgbWF4SXRlbXM6IDEKPiDCoAo+ICvCoCByZWctaW8td2lk
dGg6Cj4gK8KgwqDCoCBkZXNjcmlwdGlvbjogfAo+ICvCoMKgwqDCoMKgIFNvbWUgQ0xJTlQgaW1w
bGVtZW50YXRpb25zLCBlLmcuIG9uIHRoZSBULUhFQUQgOXh4LCBvbmx5Cj4gc3VwcG9ydAo+ICvC
oMKgwqDCoMKgIDMyYml0IGFjY2VzcyBmb3IgTVRJTUVSLgo+ICvCoMKgwqAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gK8KgwqDCoCBjb25zdDogNAo+ICsK
PiDCoMKgIGludGVycnVwdHMtZXh0ZW5kZWQ6Cj4gwqDCoMKgwqAgbWluSXRlbXM6IDEKPiDCoApJ
IHRoaW5rIHdlIGNhbiBtb3ZlIGhhc182NGJpdF9tbWlvIHRvIGZkdF9tYXRjaC0+ZGF0YS5UaGlz
IHdheSB3ZSBubwpsb25nZXIgcmVseSBvbiAnY2xpbnQsIGhhcy1uby02NGJpdC1tbWlvJyBvciAn
cmVnLWlvLXdpZHRoJwoKUmVnYXJkcywKWGlhbmcgVwoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
