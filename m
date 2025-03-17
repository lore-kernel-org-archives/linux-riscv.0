Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3921C282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 16:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8oLMIwQldgKY7yyjExcUAozM6adPnQRviWz62lav8I=; b=X+yoM6MuPHqf7B
	oVZe8QcfG640XrFjgbPvzTw/UUce0TFRCDmLBdVfOW+R7YWFh3T5EzneHOiTRkMq8EXJHie0XHmq5
	pYSRr9LZLlPdM92LJLay9hDT2G9OmYQS/87pQdjJNFreZHw38f/FAPx8z155VeSAHC5zQgIqIlxFC
	Uxs6hOA8XOgfiJSZ3Atpp1ObZAvjXaVdMs5O0/fGoN5pdL7z7o+XIQtGNkHQZ8wachFjZtRrFUCbi
	J/veSnAHybjAqlY9/wZN3FGuxzWGiH+uv3HrAYAR372Uibz/iZ3tkB//IraGlzfjrvF054meW3YmR
	Tn3U4eVIT0LXl+Jus90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuD4t-00000003HrJ-0d7i;
	Mon, 17 Mar 2025 16:12:35 +0000
Received: from [210.118.77.12] (helo=mailout2.w1.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuD4n-00000003Hpk-0pPA
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 16:12:33 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250317161223euoutp02c498be642437ffcac81e5afc2bd81d21~toxWMi-zi2062620626euoutp02x
	for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 16:12:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250317161223euoutp02c498be642437ffcac81e5afc2bd81d21~toxWMi-zi2062620626euoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1742227943;
	bh=10IRgpQMbNFI29XLq0glZJu7GX+CLOY5La5kAdANtP0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=FtHlbCC681XxT1DuUm/nRdaG8JbvNlNQRadmRUUBMk3n6SHvCwGox5BXToo2CcAya
	 2paX1Kof8mvBX/OGLXSllT1UdbjI77U0hp13rfodngtaRjRGwJiMLmZUL+CSd1q5RX
	 r4iAPNPjli5VfbjJxolgGgryLSEjXiaf5Pqw869k=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250317161223eucas1p2a8cc4443496c567f65a5849291747afb~toxWEUBr01643216432eucas1p2-;
	Mon, 17 Mar 2025 16:12:23 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 38.77.20409.7E948D76; Mon, 17
	Mar 2025 16:12:23 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250317161223eucas1p2bdbfa7a0af7ad83b7ef863321a0d032c~toxVx8rCT2939529395eucas1p24;
	Mon, 17 Mar 2025 16:12:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250317161223eusmtrp1969425f9ffeec33b4f1ebe258ff55e7d~toxVxdU7e1163311633eusmtrp1U;
	Mon, 17 Mar 2025 16:12:23 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-6a-67d849e7fcc7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id AF.99.19920.7E948D76; Mon, 17
	Mar 2025 16:12:23 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250317161223eusmtip23dfbeb4f75cc480f1074cc93b7fa760c~toxVimyjl2406624066eusmtip25;
	Mon, 17 Mar 2025 16:12:23 +0000 (GMT)
Message-ID: <a67c8b72-b7dd-4346-a9a1-2cdc17623312@samsung.com>
Date: Mon, 17 Mar 2025 17:12:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] firmware: thead: Add AON firmware protocol driver
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <17a0ccce-060b-4b9d-a3c4-8d5d5823b1c9@stanley.mountain>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRmVeSWpSXmKPExsWy7djPc7rPPW+kG5w4qWLxYV4ru8W2zy1s
	Dkwed67tYfPYvKQ+gCmKyyYlNSezLLVI3y6BK6Pn5ySWgmd8FYuffWVsYGzl6mLk5JAQMJF4
	3vCEtYuRi0NIYAWjxLmTLSwQzhdGid/9E5khnM+MEqenvWOFadm7/gMjRGI5o8ThuceYIJy3
	jBI/Ji5kAaniFbCTeHbuIlA7BweLgKrE5SlGEGFBiZMzn4CViArIS9y/NYMdxBYW8Ja4NLeP
	GcQWEdCR+Pd3MlgNs4CyxLG1vVC2uMStJ/OZQGw2ASOJB8vngx3EKeAiMXPCcWaIGnmJ5q2z
	wa6WEFjIIbFx92N2iKtdJD5PnMACYQtLvDq+BSouI3F6cg9UPF/iwdZPzBB2jcTOnuNQtrXE
	nXO/2EB+YRbQlFi/Sx8i7Cjx7tZ/sLCEAJ/EjbeCECfwSUzaNp0ZIswr0dEmBFGtJjG1pxdu
	6bkV25gmMCrNQgqUWUienIXkmVkIexcwsqxiFE8tLc5NTy02ykst1ytOzC0uzUvXS87P3cQI
	TBin/x3/soNx+auPeocYmTgYDzFKcDArifC6P7meLsSbklhZlVqUH19UmpNafIhRmoNFSZx3
	0f7WdCGB9MSS1OzU1ILUIpgsEwenVAOTl4bNAu9985yKXLnvVkbf9moqeSU/ef9so6krVv47
	7vJ6wUrbJ1+XZnMfnM94IUDbR8N/+XQ+h5NuD7UZYqPfPcvynCB46EZ6wI33Su4y6zsKPvB4
	LnVxWh9e0Jwm6v9cU9x30QeuIumtv2/f/iUuP8eiOL1wYojhzrMLn8UFnKq3DIor3XbsqP/K
	4LO657/3Rikd47RhKz1SeSVrhcn/KW//rblZZCnYMjVlpeqi6ZujUre8lHtywe5E+RRvab1t
	XCrihYZr34jfuix2vUTeMYfjCV/9pdRvTXobt3see7+8ed+2y0ty7lnXKN9buESJ9cojpW0z
	jLRveJy/kVjaN6MzQS2MsfKtnniNf/o5JZbijERDLeai4kQAkCUypocDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjkeLIzCtJLcpLzFFi42I5/e/4Pd3nnjfSDba9ErL4MK+V3WLb5xY2
	ByaPO9f2sHlsXlIfwBSlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OS
	mpNZllqkb5egl9HzcxJLwTO+isXPvjI2MLZydTFyckgImEjsXf+BsYuRi0NIYCmjxMQvPxgh
	EjIS17pfskDYwhJ/rnWxQRS9ZpRo2dLDDpLgFbCTeHbuInMXIwcHi4CqxOUpRhBhQYmTM5+A
	9YoKyEvcvzUDrFxYwFvi0tw+ZhBbREBH4t/fyWA1zALKEsfW9rJAzJ/OKLFsynp2iIS4xK0n
	85lAbDYBI4kHy+ezgticAi4SMyccB9vLLKAusX6eEES5vETz1tnMExiFZiE5YxaSSbMQOmYh
	6VjAyLKKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMEK2Hfu5eQfjvFcf9Q4xMnEwHmKU4GBW
	EuF1f3I9XYg3JbGyKrUoP76oNCe1+BCjKTAkJjJLiSbnA2M0ryTe0MzA1NDEzNLA1NLMWEmc
	1+3y+TQhgfTEktTs1NSC1CKYPiYOTqkGJjufXqlp5dXvtpU++5e9eF7CVMlddnvMz9+/Ntmr
	+cD9m8eC9yrfDg/vZIxncIyW8XwlZ3tGp0lKIWnbQ031216NUdlPF19Z8vn+hPTAzU4Cia/3
	uykHy7wpqhWq9d72+XX484mK6xQaDntsdM0zVjtTO8esep57md1MHhljbs+OpewTf7Jpeh9Z
	fqU5lI9Zfs7951cvn+nfdShNIjgqSlh3fTzrhsVN2qrvXKs+9K/jqO7TOmm2b6PvHN723eYv
	rWdM2acsdaD45oOJVt6NmqxGv856ztu+PD5ehv9zDZ/I0fePT9Z0uG55vOvWshSXUO0v9yZc
	OXTzU1Tcv8uSCQeY9vqKrHjfePDWK06RT0osxRmJhlrMRcWJABivKCQZAwAA
X-CMS-MailID: 20250317161223eucas1p2bdbfa7a0af7ad83b7ef863321a0d032c
X-Msg-Generator: CA
X-RootMTR: 20250315095420eucas1p2826e528bf27f1e8a5f7a9122f79bbce0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250315095420eucas1p2826e528bf27f1e8a5f7a9122f79bbce0
References: <CGME20250315095420eucas1p2826e528bf27f1e8a5f7a9122f79bbce0@eucas1p2.samsung.com>
	<17a0ccce-060b-4b9d-a3c4-8d5d5823b1c9@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_091229_856913_81E2970B 
X-CRM114-Status: UNSURE (   8.90  )
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

CgpPbiAzLzE1LzI1IDEwOjU0LCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+IEhlbGxvIE1pY2hhbCBX
aWxjenluc2tpLAo+IAo+IENvbW1pdCBlNGIzY2JkODQwZTUgKCJmaXJtd2FyZTogdGhlYWQ6IEFk
ZCBBT04gZmlybXdhcmUgcHJvdG9jb2wKPiBkcml2ZXIiKSBmcm9tIE1hciAxMSwgMjAyNSAobGlu
dXgtbmV4dCksIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcKPiBTbWF0Y2ggc3RhdGljIGNoZWNrZXIg
d2FybmluZzoKPiAKPiAJZHJpdmVycy9maXJtd2FyZS90aGVhZCx0aDE1MjAtYW9uLmM6MTc0IHRo
MTUyMF9hb25fcG93ZXJfdXBkYXRlKCkKPiAJZXJyb3I6IGJ1ZmZlciBvdmVyZmxvdyAnZGF0YScg
MiA8PSAzCj4gCj4gZHJpdmVycy9maXJtd2FyZS90aGVhZCx0aDE1MjAtYW9uLmMKPiAgICAgMTY0
IHsKPiAgICAgMTY1ICAgICAgICAgc3RydWN0IHRoMTUyMF9hb25fbXNnX3JlcV9zZXRfcmVzb3Vy
Y2VfcG93ZXJfbW9kZSBtc2cgPSB7fTsKPiAgICAgMTY2ICAgICAgICAgc3RydWN0IHRoMTUyMF9h
b25fcnBjX21zZ19oZHIgKmhkciA9ICZtc2cuaGRyOwo+ICAgICAxNjcgICAgICAgICBpbnQgcmV0
Owo+ICAgICAxNjggCj4gICAgIDE2OSAgICAgICAgIGhkci0+c3ZjID0gVEgxNTIwX0FPTl9SUENf
U1ZDX1BNOwo+ICAgICAxNzAgICAgICAgICBoZHItPmZ1bmMgPSBUSDE1MjBfQU9OX1BNX0ZVTkNf
U0VUX1JFU09VUkNFX1BPV0VSX01PREU7Cj4gICAgIDE3MSAgICAgICAgIGhkci0+c2l6ZSA9IFRI
MTUyMF9BT05fUlBDX01TR19OVU07Cj4gICAgIDE3MiAKPiAgICAgMTczICAgICAgICAgUlBDX1NF
VF9CRTE2KCZtc2cucmVzb3VyY2UsIDAsIHJzcmMpOwo+IC0tPiAxNzQgICAgICAgICBSUENfU0VU
X0JFMTYoJm1zZy5yZXNvdXJjZSwgMiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF4KPiAmbXNnLnJlc291cmNlIGlzIGEgMiBieXRlIGFycmF5LiAgVGhpcyBz
ZXRzIHRoZSAzcmQgYW5kIDR0aCBieXRlcy4KPiBJdCdzIGludGVudGlvbmFsIGJ1dCB1Z2x5LiAg
VXNlICZtc2cubW9kZSBpbnN0ZWFkLgo+IEFsc28gdXNlIHByb3BlciBlbmRpYW4gY29udmVyc2lv
biBtYWNyb3Mgd2hpY2ggZG9uJ3QgYXNzdW1lIHRoYXQKPiB3ZSdyZSBvbiBhIGxpdHRsZSBlbmRp
YW4gc3lzdGVtLiAgKEFsdGhvdWdoIEludGVsIGRyaXZlcnMgYXNzdW1lIHRoZXkKPiBhcmUgb24g
bGl0dGxlIGVuZGlhbiBzeXN0ZW1zLiAgU28gdGhlcmUgaXMgcHJlY2VkZW5jZS4gIEkgc3VwcG9z
ZWQuKQoKVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciByZXBvcnQuIFdpbGwgZm9sbG93IHVw
IHdpdGggdGhlIGZpeCBwYXRjaC4KClJlZ2FyZHMsCk1pY2hhxYIKCj4gCj4gICAgIDE3NSAgICAg
ICAgICAgICAgICAgICAgICAocG93ZXJfb24gPyBUSDE1MjBfQU9OX1BNX1BXX01PREVfT04gOgo+
ICAgICAxNzYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVEgxNTIwX0FPTl9QTV9Q
V19NT0RFX09GRikpOwo+ICAgICAxNzcgCj4gICAgIDE3OCAgICAgICAgIHJldCA9IHRoMTUyMF9h
b25fY2FsbF9ycGMoYW9uX2NoYW4sICZtc2cpOwo+ICAgICAxNzkgICAgICAgICBpZiAocmV0KQo+
ICAgICAxODAgICAgICAgICAgICAgICAgIGRldl9lcnIoYW9uX2NoYW4tPmNsLmRldiwgImZhaWxl
ZCB0byBwb3dlciAlcyByZXNvdXJjZSAlZCByZXQgJWRcbiIsCj4gICAgIDE4MSAgICAgICAgICAg
ICAgICAgICAgICAgICBwb3dlcl9vbiA/ICJ1cCIgOiAib2ZmIiwgcnNyYywgcmV0KTsKPiAgICAg
MTgyIAo+ICAgICAxODMgICAgICAgICByZXR1cm4gcmV0Owo+ICAgICAxODQgfQo+IAo+IHJlZ2Fy
ZHMsCj4gZGFuIGNhcnBlbnRlcgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
