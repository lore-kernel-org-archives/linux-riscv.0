Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81538CD6E79
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 01:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNfLJvza8hD1WJInCT/zca49CKe52ks7zXfw4DxovhQ=; b=jp4yoY7t089L/4
	3SMuJif1z3lctL5rELXIU3/aVF0qN+hcWM3tJOIxPsibscVrfovWsrUoSj2z9Q1iy2eOY1JpSqY2P
	IDrQjcI4cb/n7QxqPSiYDENZ+ii4JF5uMlE/a1zQi5JUAQ+pTQfDgryyxk5Pg2YC9iCn19+kKC71S
	xxqxj55yqoz4j1apOtZLMxxVeDXG6qtbGodxL0JODVOQU9MZIRcvJYnyZV4eXLNyYCQcScsm61nYg
	C6Y1NNcBON8PbePnOxJYYevWpXM8ZOy9VwQQVciRlTutt3FKpXKCi/xR2EudIzahUmvSD5twMdmJk
	Cwp96i7YYNHJv/DomgAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWlKr-00000004awz-2yWe;
	Tue, 09 Jun 2026 01:32:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWlKq-00000004aud-1JlL
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 Jun 2026 01:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=RAKmwwhQRi36bLXMT3L71Qr2hQy8TZ9Rjt+61CaC2Gc=; b=jjzJn6s56NnkRzGVub0xdAw+LZ
	WhSezFPabBH+V+6GVoh96JAFXapSQ7jGHZJCQ+gm28G2uyW+14PFZ8vkjRN5tATQl9r/xLGqQL/q1
	oOM5WbnlVv2wDFrws3iGhLAhn9/TcZbxSU3qqdkZYGaUefpVfb9JF/JFWqsKaPcQPYp+PTQ7h1Yfa
	z7TzsvpYBam1/tyLVjNZH74f+vd3b0SFfQypNzbHSEqaqylQeoa9Rl7psbeuTQiocQUjF9eRMM/4+
	c7HLOU+AjPH0AmjATNPbv1phSTYicNVzULZkxpoJ1XP6XnBe8BrbZ6bd2Di+voe+/gzXprhA0q2z6
	qdaaMeiw==;
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWlK2-0000000Ekk0-0ClL
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 01:32:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RAKmwwhQRi36bLXMT3L71Qr2hQy8TZ9Rjt+61CaC2Gc=;
	b=uNZ/lD6xy4gcozLt8EGdm86gc2KXSUYpmpBnbEG/Wj4pAwbQebGa91QS4sON22E0vNLX4o3RZ
	VFAaNbVYp6UHRPV7Lf4J321CGuVPFuXmROsAk5ExmhWBOiCr7mqOwqmdt2MQgVlO0lL2HSSF4bq
	ZNl9ciP7EFyzgHFlsfEocLk=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gZ9ys5pyCz1cyPW;
	Tue,  9 Jun 2026 09:18:29 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 08FBF40562;
	Tue,  9 Jun 2026 09:26:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 9 Jun 2026 09:26:20 +0800
Message-ID: <08bcdf6c-62e1-46d8-af83-4d5e74fff956@huawei.com>
Date: Tue, 9 Jun 2026 09:26:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arch: select HAVE_ARCH_BITREVERSE conditionally on
 BITREVERSE
To: Yury Norov <ynorov@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>, Arnd Bergmann <arnd@arndb.de>, Eric Biggers
	<ebiggers@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Morton
	<akpm@linux-foundation.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev
	<sdf@fomichev.me>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-arch@vger.kernel.org>,
	<netdev@vger.kernel.org>, <bpf@vger.kernel.org>
References: <20260506175207.110893-1-ynorov@nvidia.com>
 <20260506175207.110893-2-ynorov@nvidia.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260506175207.110893-2-ynorov@nvidia.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_023208_110777_FA2F4365 
X-CRM114-Status: GOOD (  13.74  )
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

CgpPbiA1LzcvMjAyNiAxOjUyIEFNLCBZdXJ5IE5vcm92IHdyb3RlOgo+IEFyY2hpdGVjdHVyZXMg
bWF5IGhhdmUgYml0IHJldmVyc2FsIGluc3RydWN0aW9ucywgYnV0IGlmIHRoZSBBUEkgbm90Cj4g
bmVlZGVkLCB0aGUgY29ycmVzcG9uZGluZyBvcHRpb24gc2hvdWxkIG5vdCBiZSBzZWxlY3RlZCBi
ZWNhdXNlIGl0IG1heQo+IGxlYWQgdG8gZ2VuZXJhdGluZyB0aGUgdW5uZWVkZWQgY29kZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBZdXJ5IE5vcm92IDx5bm9yb3ZAbnZpZGlhLmNvbT4KPiAtLS0KPiAg
YXJjaC9hcm0vS2NvbmZpZyAgICAgICB8IDIgKy0KPiAgYXJjaC9hcm02NC9LY29uZmlnICAgICB8
IDIgKy0KPiAgYXJjaC9sb29uZ2FyY2gvS2NvbmZpZyB8IDIgKy0KPiAgYXJjaC9taXBzL0tjb25m
aWcgICAgICB8IDIgKy0KPiAgbGliL0tjb25maWcgICAgICAgICAgICB8IDEgKwo+ICA1IGZpbGVz
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vS2NvbmZpZyBiL2FyY2gvYXJtL0tjb25maWcKPiBpbmRleCA3MWZjNWRkNDEy
M2YuLjBlOTYzZTU0ZmUwNiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9LY29uZmlnCj4gKysrIGIv
YXJjaC9hcm0vS2NvbmZpZwo+IEBAIC04Myw3ICs4Myw3IEBAIGNvbmZpZyBBUk0KPiAgCXNlbGVj
dCBIQVJESVJRU19TV19SRVNFTkQKPiAgCXNlbGVjdCBIQVNfSU9QT1JUCj4gIAlzZWxlY3QgSEFW
RV9BUkNIX0FVRElUU1lTQ0FMTCBpZiBBRUFCSSAmJiAhT0FCSV9DT01QQVQKPiAtCXNlbGVjdCBI
QVZFX0FSQ0hfQklUUkVWRVJTRSBpZiAoQ1BVXzMydjdNIHx8IENQVV8zMnY3KSAmJiAhQ1BVXzMy
djYKPiArCXNlbGVjdCBIQVZFX0FSQ0hfQklUUkVWRVJTRSBpZiAoQ1BVXzMydjdNIHx8IENQVV8z
MnY3KSAmJiAhQ1BVXzMydjYgJiYgQklUUkVWRVJTRQoKSSB0aGluayB0aGVyZSBpcyBhIHNlbWFu
dGljIGNvbmZ1c2lvbjoKCkhBVkVfQVJDSF9CSVRSRVZFUlNFIGluZGljYXRlcyB0aGF0IHRoZSBh
cmNoaXRlY3R1cmUgaXRzZWxmIGhhcyBhbgplZmZpY2llbnQgYml04oCRcmV2ZXJzZSBpbXBsZW1l
bnRhdGlvbiAoZS5nLiwgdGhlIFJCSVQgaW5zdHJ1Y3Rpb24gb24KQVJNdjcpLiBJdCBpcyBhIGhh
cmR3YXJlIGNhcGFiaWxpdHkgZGVjbGFyYXRpb24gYW5kIHNob3VsZCBub3QgZGVwZW5kIG9uCmEg
aGlnaGVy4oCRbGV2ZWwgZmVhdHVyZSBvcHRpb24gbGlrZSBCSVRSRVZFUlNFLgoKPiAgCXNlbGVj
dCBIQVZFX0FSQ0hfSlVNUF9MQUJFTCBpZiAhWElQX0tFUk5FTCAmJiAhQ1BVX0VORElBTl9CRTMy
ICYmIE1NVSAmJiAoIVBSRUVNUFRfUlQgfHwgIVNNUCkKPiAgCXNlbGVjdCBIQVZFX0FSQ0hfS0ZF
TkNFIGlmIE1NVSAmJiAhWElQX0tFUk5FTAo+ICAJc2VsZWN0IEhBVkVfQVJDSF9LR0RCIGlmICFD
UFVfRU5ESUFOX0JFMzIgJiYgTU1VCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvS2NvbmZpZyBi
L2FyY2gvYXJtNjQvS2NvbmZpZwo+IGluZGV4IGZlNjA3MzhlNTk0My4uZjViYjYyYzJiYTljIDEw
MDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvS2NvbmZpZwo+ICsrKyBiL2FyY2gvYXJtNjQvS2NvbmZp
Zwo+IEBAIC0xNTAsNyArMTUwLDcgQEAgY29uZmlnIEFSTTY0Cj4gIAlzZWxlY3QgSEFWRV9BQ1BJ
X0FQRUkgaWYgKEFDUEkgJiYgRUZJKQo+ICAJc2VsZWN0IEhBVkVfQUxJR05FRF9TVFJVQ1RfUEFH
RQo+ICAJc2VsZWN0IEhBVkVfQVJDSF9BVURJVFNZU0NBTEwKPiAtCXNlbGVjdCBIQVZFX0FSQ0hf
QklUUkVWRVJTRQo+ICsJc2VsZWN0IEhBVkVfQVJDSF9CSVRSRVZFUlNFIGlmIEJJVFJFVkVSU0UK
ClsuLl0KCj4gIAlib29sCj4gIAlkZWZhdWx0IG4KPiArCWRlcGVuZHMgb24gQklUUkVWRVJTRQo+
ICAJaGVscAo+ICAJICBUaGlzIG9wdGlvbiBlbmFibGVzIHRoZSB1c2Ugb2YgaGFyZHdhcmUgYml0
LXJldmVyc2FsIGluc3RydWN0aW9ucyBvbgo+ICAJICBhcmNoaXRlY3R1cmVzIHdoaWNoIHN1cHBv
cnQgc3VjaCBvcGVyYXRpb25zLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
