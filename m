Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51C5C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 13:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WZOq1JCzGV0H0l1Oq2gp7DwTHjNNsAKwEgIaCnU6L4=; b=NswJiY3TzOuJoE
	gP/WAsYDFJSBCMvihYJfeit9y0shc11GDEkqeThaxsuDgACk65aCanXKdwZ//bTOVCgwD2RQGHvjD
	y5Ju+/FURca5jm1sTl5SeAKgnsOVi3A7KEThx0hNvD0FhKirL8Aucgct/nsRzB24igV5AGxCX+sqQ
	3pXXQigr9Wuayk9aCERfzJl6kKUkUnvN2kZPT8NYuPB3cn6x/eaNofv4H5OXtOWMSLYrP8zZxS8sz
	4SBjQAvk9mhYAk01GIKBdmQJJBj8W4iMhv8upOwOwsNWoqKGT45pn2lR92pcO4ytOnR+H7FPhXkhZ
	dTrU3YQrueSEqvatzdUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sThvD-0000000AVQQ-3ECX;
	Tue, 16 Jul 2024 13:08:47 +0000
Received: from flow5-smtp.messagingengine.com ([103.168.172.140])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sThus-0000000AVIi-1Fac;
	Tue, 16 Jul 2024 13:08:28 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailflow.nyi.internal (Postfix) with ESMTP id 64DA4201196;
	Tue, 16 Jul 2024 09:08:24 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Tue, 16 Jul 2024 09:08:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1721135304;
	 x=1721142504; bh=zt6qUa/rBAPGttY012K2IM8tuPIkZZ+7qikKmJ20XiQ=; b=
	LLolVvbGAnfV4iXPMW7seBnQ9ucngH1f2xp7EVD2uugxg3VEjVHJlV3vHpdUCRlV
	2Crod5dg4xilCIfTvsTZ3G0tnDSqxiqhIDMAeN6+HEFwoCEsiOOPq8SsQLa0sr/G
	xoG+i1vuZTOZ/7p3S2bp7uGbvMcxmbyusFaykv0mTCQZsmkThpkr9v2U6Zr+crZZ
	kmtszuZc2FnPtn2KugCODrgWHPthZIH5B7IwAoGfLtZRAwh7tq+DE3K11XSzxYk8
	5cprDH9mBZKnOwemRYCHcIIWN9/QaaLvzr+ZwZv/QxnXkafuN22zU1FFkVBylKx6
	A+QxZ0MIkK2YbgL8XuvmWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1721135304; x=
	1721142504; bh=zt6qUa/rBAPGttY012K2IM8tuPIkZZ+7qikKmJ20XiQ=; b=b
	G2YZz3jWm7iHL3gXNLVUTtNcfzTahLzLjR4iyuU0CNuyM89NLOf9oZyD2C3hYAIK
	AfDf20U8qC7CTOkBsWjWvYOHnqiWY3TigtPu5Yde99vlDGBfkJrkykgrj6MZxNRd
	OF0b0J9NpdNZ0L4sxgIiiEOEJlRsdc3+T+nlOeUW0yb0Z8JhW7I8RkOQgEq1DoaG
	WOeM5WdMLmGD4/DXwHMeXVIh/TuGiCjq62Cmau3SRwhwxyMut9KqZw8PI0t559X3
	drs3XIktjiBwP0mYVx52WH2pcoTQ4U95QNutDBRpZXbx67KkVSdfOjgua4ISKpVl
	lzZmmp3ndbV1KXYw8/6vw==
X-ME-Sender: <xms:xXCWZt3tlPtvPdXdpaZocqjicoskk-NG9y-bvebOxJ2yaqSo-ntZSQ>
    <xme:xXCWZkHxzyEYBpjsPnzBU2BkygS49Fm5KQ2wiZODEv68093OCfiRbDkFvgNs4ylIq
    zNg7JKbvF4HsO-agKk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeeggdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:xXCWZt52lvXg2r0FUCr8Pldg21ygP9uQs9__NpHOUsUBsrMqglT6BQ>
    <xmx:xXCWZq18Zx1G13DUCBEKRxrSOCgkx2fk92PAR2EWDjXzJDjnn56Rcg>
    <xmx:xXCWZgFI07CYIk3hv4CGlbyEsesGfT_8oHM0IC0w4mt3-qFdd2Rvsg>
    <xmx:xXCWZr8qedzeakvaan4WKKj-eqO-aC5_umvCGYpV4BkCe0Dn1-_H4A>
    <xmx:yHCWZiNMi5WAbUPy1KvZo5AqIJpXj9vGnZQG9x0mWda-jv_tKouiwZyc>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7559536A0075; Tue, 16 Jul 2024 09:08:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <2a2bb8b6-09ca-40c3-b6a9-d8fac7dd5208@app.fastmail.com>
In-Reply-To: <20240716111346.3676969-4-rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-4-rppt@kernel.org>
Date: Tue, 16 Jul 2024 21:07:59 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Mike Rapoport" <rppt@kernel.org>, linux-kernel@vger.kernel.org
Cc: "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Borislav Petkov" <bp@alien8.de>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Dan Williams" <dan.j.williams@intel.com>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "David Hildenbrand" <david@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Huacai Chen" <chenhuacai@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Jonathan Cameron" <jonathan.cameron@huawei.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Vasily Gorbik" <gor@linux.ibm.com>, "Will Deacon" <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 03/17] MIPS: loongson64: rename __node_data to node_data
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_060826_581768_BBC777D4 
X-CRM114-Status: GOOD (  14.21  )
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

CgrlnKgyMDI05bm0N+aciDE25pel5LiD5pyIIOS4i+WNiDc6MTPvvIxNaWtlIFJhcG9wb3J05YaZ
6YGT77yaCj4gRnJvbTogIk1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkiIDxycHB0QGtlcm5lbC5v
cmc+Cj4KPiBNYWtlIGRlZmluaXRpb24gb2Ygbm9kZV9kYXRhIG1hdGNoIG90aGVyIGFyY2hpdGVj
dHVyZXMuCj4gVGhpcyB3aWxsIGFsbG93IHB1bGxpbmcgZGVjbGFyYXRpb24gb2Ygbm9kZV9kYXRh
IHRvIHRoZSBnZW5lcmljIG1tIGNvZGUgaW4KPiB0aGUgZm9sbG93aW5nIGNvbW1pdC4KPgo+IFNp
Z25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkgPHJwcHRAa2VybmVsLm9yZz4K
ClJldmlld2VkLWJ5OiBKaWF4dW4gWWFuZyA8amlheHVuLnlhbmdAZmx5Z29hdC5jb20+CgpNSVBT
IHNob3VsZCBnbyBhcmNoX251bWEgYXQgc29tZSBwb2ludCBhcyB3ZWxsLgoKVGhhbmtzCi0gSmlh
eHVuCgo+IC0tLQo+ICBhcmNoL21pcHMvaW5jbHVkZS9hc20vbWFjaC1sb29uZ3NvbjY0L21tem9u
ZS5oIHwgNCArKy0tCj4gIGFyY2gvbWlwcy9sb29uZ3NvbjY0L251bWEuYyAgICAgICAgICAgICAg
ICAgICAgfCA4ICsrKystLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9tYWNo
LWxvb25nc29uNjQvbW16b25lLmggCj4gYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vbWFjaC1sb29u
Z3NvbjY0L21tem9uZS5oCj4gaW5kZXggYTNkNjVkMzdiOGI1Li4yZWZmZDVmOGVkNjIgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL21hY2gtbG9vbmdzb242NC9tbXpvbmUuaAo+
ICsrKyBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9tYWNoLWxvb25nc29uNjQvbW16b25lLmgKPiBA
QCAtMTQsOSArMTQsOSBAQAo+ICAjZGVmaW5lIHBhX3RvX25pZChhZGRyKSAgKCgoYWRkcikgJiAw
eGYwMDAwMDAwMDAwMCkgPj4gCj4gTk9ERV9BRERSU1BBQ0VfU0hJRlQpCj4gICNkZWZpbmUgbmlk
X3RvX2FkZHJiYXNlKG5pZCkgKCh1bnNpZ25lZCBsb25nKShuaWQpIDw8IAo+IE5PREVfQUREUlNQ
QUNFX1NISUZUKQo+IAo+IC1leHRlcm4gc3RydWN0IHBnbGlzdF9kYXRhICpfX25vZGVfZGF0YVtd
Owo+ICtleHRlcm4gc3RydWN0IHBnbGlzdF9kYXRhICpub2RlX2RhdGFbXTsKPiAKPiAtI2RlZmlu
ZSBOT0RFX0RBVEEobikJCShfX25vZGVfZGF0YVtuXSkKPiArI2RlZmluZSBOT0RFX0RBVEEobikJ
CShub2RlX2RhdGFbbl0pCj4gCj4gIGV4dGVybiB2b2lkIF9faW5pdCBwcm9tX2luaXRfbnVtYV9t
ZW1vcnkodm9pZCk7Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9sb29uZ3NvbjY0L251bWEu
YyBiL2FyY2gvbWlwcy9sb29uZ3NvbjY0L251bWEuYwo+IGluZGV4IDY4ZGFmZDZkM2UyNS4uYjUw
Y2UyOGQyNzQxIDEwMDY0NAo+IC0tLSBhL2FyY2gvbWlwcy9sb29uZ3NvbjY0L251bWEuYwo+ICsr
KyBiL2FyY2gvbWlwcy9sb29uZ3NvbjY0L251bWEuYwo+IEBAIC0yOSw4ICsyOSw4IEBACj4gCj4g
IHVuc2lnbmVkIGNoYXIgX19ub2RlX2Rpc3RhbmNlc1tNQVhfTlVNTk9ERVNdW01BWF9OVU1OT0RF
U107Cj4gIEVYUE9SVF9TWU1CT0woX19ub2RlX2Rpc3RhbmNlcyk7Cj4gLXN0cnVjdCBwZ2xpc3Rf
ZGF0YSAqX19ub2RlX2RhdGFbTUFYX05VTU5PREVTXTsKPiAtRVhQT1JUX1NZTUJPTChfX25vZGVf
ZGF0YSk7Cj4gK3N0cnVjdCBwZ2xpc3RfZGF0YSAqbm9kZV9kYXRhW01BWF9OVU1OT0RFU107Cj4g
K0VYUE9SVF9TWU1CT0wobm9kZV9kYXRhKTsKPiAKPiAgY3B1bWFza190IF9fbm9kZV9jcHVtYXNr
W01BWF9OVU1OT0RFU107Cj4gIEVYUE9SVF9TWU1CT0woX19ub2RlX2NwdW1hc2spOwo+IEBAIC0x
MDcsNyArMTA3LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IG5vZGVfbWVtX2luaXQodW5zaWduZWQg
aW50IG5vZGUpCj4gIAl0bmlkID0gZWFybHlfcGZuX3RvX25pZChuZF9wYSA+PiBQQUdFX1NISUZU
KTsKPiAgCWlmICh0bmlkICE9IG5vZGUpCj4gIAkJcHJfaW5mbygiTk9ERV9EQVRBKCVkKSBvbiBu
b2RlICVkXG4iLCBub2RlLCB0bmlkKTsKPiAtCV9fbm9kZV9kYXRhW25vZGVdID0gbmQ7Cj4gKwlu
b2RlX2RhdGFbbm9kZV0gPSBuZDsKPiAgCU5PREVfREFUQShub2RlKS0+bm9kZV9zdGFydF9wZm4g
PSBzdGFydF9wZm47Cj4gIAlOT0RFX0RBVEEobm9kZSktPm5vZGVfc3Bhbm5lZF9wYWdlcyA9IGVu
ZF9wZm4gLSBzdGFydF9wZm47Cj4gCj4gQEAgLTIwNiw1ICsyMDYsNSBAQCBwZ19kYXRhX3QgKiBf
X2luaXQgYXJjaF9hbGxvY19ub2RlZGF0YShpbnQgbmlkKQo+IAo+ICB2b2lkIGFyY2hfcmVmcmVz
aF9ub2RlZGF0YShpbnQgbmlkLCBwZ19kYXRhX3QgKnBnZGF0KQo+ICB7Cj4gLQlfX25vZGVfZGF0
YVtuaWRdID0gcGdkYXQ7Cj4gKwlub2RlX2RhdGFbbmlkXSA9IHBnZGF0Owo+ICB9Cj4gLS0gCj4g
Mi40My4wCgotLSAKLSBKaWF4dW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
