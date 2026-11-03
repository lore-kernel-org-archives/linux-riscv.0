Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85520606A324
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 09:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VSCP+58U;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=4DXGQ09b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PW1+eI9xJrXJOZAEg1VGNJfGhfWsp+tV2zgWZu8j9TU=; b=VSCP+58UV4fLSgMxZpc5/c8bdy
	sotW2VtLA9Xrw329HUoqRpm5EjnEpagkEPvFPGPA86zK9BpRb7zek+b/NDO+fMkhHDGx449crIlZZ
	vz8fPqB+aKPhLmedow1mHxW6VdaO2VbT6fM72tgz2H2DUT+H/B2zjwjk4xG3/MJ3MFEVbovwjXprv
	5v/t3GW4tKADhIV6oKd7z3fp9DzzcTiXnaTz5vpobLsw9ZIAQyf4Jn+FgRJ9OCp6IIruqltcDgbIj
	UvWCwl9xMAnZGQPg0ghxLCutOuy3LBAFCev5C38PkbTkPUsceFuDk2aLH++QAaWO2zswPny9jDRrA
	Iib/8jVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAd4-00000001ihN-2q2L;
	Tue, 03 Nov 2026 09:16:30 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAcz-00000001iew-13pj;
	Tue, 03 Nov 2026 09:16:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c/0hZKufvkH/OYW00aRP0EoGvS2iUIY4dlDmgt6M/Mw=;
	b=4DXGQ09bqE2PEAJtjiuGEIxPkyR4WjwiC7ksDXHrbemdIxEQDHk6VaPRbtJElOvQBITMnTqnY
	srWuVrJKqwgvc1zcbqHERnrW2EJ6xbZjtycFl6KEG6RooII6hHAUnHUHO9DbyxyTM0ByJl5fvpa
	OfjJ7hHwPYGxreXazxTjPfg=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jJjbp6kLMzcZxn;
	Tue,  3 Nov 2026 17:15:50 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CBADA40579;
	Tue,  3 Nov 2026 17:16:15 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 3 Nov
 2026 17:16:13 +0800
Message-ID: <9ef43c59-72b8-4ef8-96cd-0dfd133cde0f@huawei.com>
Date: Tue, 3 Nov 2026 17:16:13 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/15] LoongArch: kexec_file: Fix CMA page leaks in
 segment placement retry loops
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <rppt@kernel.org>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <thuth@redhat.com>, <leitao@debian.org>,
	<yeoreum.yun@arm.com>, <robh@kernel.org>, <sourabhjain@linux.ibm.com>,
	<kees@kernel.org>, <coiby.xu@gmail.com>, <Yeking@Red54.com>,
	<tangyouling@kylinos.cn>, <maqianga@uniontech.com>,
	<zhangtianyang@loongson.cn>, <guodongtai@kylinos.cn>, <blum@kernel.org>,
	<adityag@linux.ibm.com>, <hui.wang@canonical.com>, <sohammetha01@gmail.com>,
	<guoren@kernel.org>, <gaohan@iscas.ac.cn>, <kai.huang@intel.com>,
	<kas@kernel.org>, <vishal.l.verma@intel.com>, <piliu@redhat.com>,
	<jbouron@amazon.com>, <mclapinski@google.com>, <me@linux.beauty>,
	<graf@amazon.com>, <bgwin@google.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
References: <20261026075201.699550-1-ruanjinjie@huawei.com>
 <20261026075201.699550-6-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261026075201.699550-6-ruanjinjie@huawei.com>
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_011626_360614_3E958BEA 
X-CRM114-Status: GOOD (  15.84  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

V2lsbCBmaXggc2FzaGlrbyByZXZpZXcgaXNzdWUgaW4gdjguCgrlnKggMjAyNi8xMC8yNiAxNTo1
MSwgSmluamllIFJ1YW4g5YaZ6YGTOgo+IFRoZSByZXRyeSBsb29wIGRyb3BzIG5yX3NlZ21lbnRz
LCBsZWFraW5nIHRoZSBDTUEgcGFnZXMgb2YgdGhlIGZhaWxlZAo+IHNlZ21lbnRzLiAgUmVsZWFz
ZSB0aGVtIGZpcnN0LCBhbmQgZGlzYWJsZSBDTUEgZm9yIHRoZSByZXRyeTogaXQKPiBpZ25vcmVz
IGJ1Zl9taW4gYW5kIHdvdWxkIGhhbmQgb3V0IHRoZSBzYW1lIHJlZ2lvbiBmb3JldmVyLgo+IAo+
IENjOiBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBrZXJuZWwub3JnPgo+IENjOiBXQU5HIFh1ZXJ1
aSA8a2VybmVsQHhlbjBuLm5hbWU+Cj4gQ2M6IFlvdWxpbmcgVGFuZyA8dGFuZ3lvdWxpbmdAa3ls
aW5vcy5jbj4KPiBDYzogTWlrZSBSYXBvcG9ydCAoTWljcm9zb2Z0KSA8cnBwdEBrZXJuZWwub3Jn
Pgo+IENjOiBTb3VyYWJoIEphaW4gPHNvdXJhYmhqYWluQGxpbnV4LmlibS5jb20+Cj4gQ2M6IEtl
ZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPgo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4g
TGluazogaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzI5MDMxMjM1LjI4NDAy
NTUtMS1ydWFuamluamllJTQwaHVhd2VpLmNvbQo+IEZpeGVzOiA1NWQ5OTBmMDA4NGMgKCJMb29u
Z0FyY2g6IEFkZCBFRkkgYmluYXJ5IHN1cHBvcnQgZm9yIGtleGVjX2ZpbGUiKQo+IFNpZ25lZC1v
ZmYtYnk6IEppbmppZSBSdWFuIDxydWFuamluamllQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGFyY2gv
bG9vbmdhcmNoL2tlcm5lbC9rZXhlY19lZmkuYyAgICAgICAgICB8IDggKysrKysrKysKPiAgYXJj
aC9sb29uZ2FyY2gva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jIHwgNiArKysrKy0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC9rZXhlY19lZmkuYyBiL2FyY2gvbG9vbmdhcmNo
L2tlcm5lbC9rZXhlY19lZmkuYwo+IGluZGV4IDVlZTc4ZWJiMTU0Ni4uZDQyNzExYjg5NWEyIDEw
MDY0NAo+IC0tLSBhL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC9rZXhlY19lZmkuYwo+ICsrKyBiL2Fy
Y2gvbG9vbmdhcmNoL2tlcm5lbC9rZXhlY19lZmkuYwo+IEBAIC04Niw2ICs4NiwxNCBAQCBzdGF0
aWMgdm9pZCAqZWZpX2tleGVjX2xvYWQoc3RydWN0IGtpbWFnZSAqaW1hZ2UsCj4gIAkJICogV2Ug
Y291bGRuJ3QgZmluZCBzcGFjZSBmb3IgdGhlIG90aGVyIHNlZ21lbnRzOyBlcmFzZSB0aGUKPiAg
CQkgKiBrZXJuZWwgc2VnbWVudCBhbmQgdHJ5IHRoZSBuZXh0IGF2YWlsYWJsZSBob2xlLgo+ICAJ
CSAqLwo+ICsJCS8qCj4gKwkJICoga2V4ZWNfYWxsb2NfY29udGlnKCkgaWdub3JlcyBidWZfbWlu
LCBzbyBkaXNhYmxlIENNQSB0bwo+ICsJCSAqIGxldCB0aGUgcmV0cnkgbWFrZSBwcm9ncmVzcy4K
PiArCQkgKi8KPiArCQlpZiAoaW1hZ2UtPnNlZ21lbnRfY21hW2tlcm5lbF9zZWdtZW50X251bWJl
cl0pCj4gKwkJCWltYWdlLT5ub19jbWEgPSB0cnVlOwo+ICsKPiArCQlrZXhlY19mcmVlX3NlZ21l
bnRfY21hKGltYWdlLCBrZXJuZWxfc2VnbWVudF9udW1iZXIpOwo+ICAJCWltYWdlLT5ucl9zZWdt
ZW50cyAtPSAxOwo+ICAJCWtidWYuYnVmX21pbiA9IGtlcm5lbF9zZWdtZW50LT5tZW0gKyBrZXJu
ZWxfc2VnbWVudC0+bWVtc3o7Cj4gIAkJa2J1Zi5tZW0gPSBLRVhFQ19CVUZfTUVNX1VOS05PV047
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUu
YyBiL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYwo+IGluZGV4IDU0
MTJhYTlmMzU2OC4uNjJhNWJlMTAyMDY1IDEwMDY0NAo+IC0tLSBhL2FyY2gvbG9vbmdhcmNoL2tl
cm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYwo+ICsrKyBiL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC9t
YWNoaW5lX2tleGVjX2ZpbGUuYwo+IEBAIC0yMTcsNyArMjE3LDExIEBAIGludCBsb2FkX290aGVy
X3NlZ21lbnRzKHN0cnVjdCBraW1hZ2UgKmltYWdlLAo+ICAJcmV0dXJuIDA7Cj4gIAo+ICBvdXRf
ZXJyOgo+IC0JaW1hZ2UtPm5yX3NlZ21lbnRzID0gb3JpZ19zZWdtZW50czsKPiArCXdoaWxlIChp
bWFnZS0+bnJfc2VnbWVudHMgPiBvcmlnX3NlZ21lbnRzKSB7Cj4gKwkJa2V4ZWNfZnJlZV9zZWdt
ZW50X2NtYShpbWFnZSwgaW1hZ2UtPm5yX3NlZ21lbnRzIC0gMSk7Cj4gKwkJaW1hZ2UtPm5yX3Nl
Z21lbnRzLS07Cj4gKwl9Cj4gKwo+ICAJa2ZyZWUobW9kaWZpZWRfY21kbGluZSk7Cj4gIAlyZXR1
cm4gcmV0Owo+ICB9CgotLSAKQmVzdCByZWdhcmRzLApKaW5qaWUKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
