Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D21606A31A
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 02:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oLeQDMsb;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=raUpYOFg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q2Fxfj3C4F0TqdwQq2WQQ/SqXazMt1qETvZoFlU8ZQ4=; b=oLeQDMsbl1YEtyM41kUWTUu2tQ
	rs1rha/IF9BB93dNZm3jRHj9NRz2R+FpcRIH/377N0ypUCPuWPg/emGjj9l0KSb0STeP9JdPqRZdV
	aWLbqfCWrTKrfTwwPujy+DK2/bmL7sYlz/266ZQNr62oIKH1CqvVVLPbPF4mtkvnobu8bXAIvATtp
	+K+tzzsq1f9UoZycGUD/MNIAyyZNGRN2sBK+nQc8czAvZHSxzYTR+9veQuDZsc6UkwCNfvq03f++y
	fgNikjtNSuslX/d6UBTnUndDqw5tweVNpH5tvrYcZgrdjBpF5kIL3SadeR6nuDohgYEzTxfQutNZu
	kiS4ilIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMymF-0000000Crp5-2TWc;
	Sat, 31 Oct 2026 02:25:03 +0000
Received: from [113.46.200.217] (helo=canpmsgout02.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMymB-0000000Cro8-34Lq;
	Sat, 31 Oct 2026 02:25:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nB4pM2ZJXpnwRA8pYcn66mc+0T+eg4LR6jSzacwN0sA=;
	b=raUpYOFgQh9voYZCcg/OdijcaqglHGfZZNxTVqJS0LCtBGqRCcsPX7o9pBhQCMBGH31u4wfgw
	Qjfi6WZmlQEhgM12bST5N2B2vkEcfU3HyItBP3p/jVOytsN7ALvwk7SZvmfNA7YywyBpTgjsnuY
	HzdvuTsz24yzs1NokF/AV48=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jGhcR0LV4zcZyQ;
	Sat, 31 Oct 2026 10:24:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id DCCDF40538;
	Sat, 31 Oct 2026 10:24:41 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 31 Oct
 2026 10:24:40 +0800
Message-ID: <04b19a8f-72aa-4342-b5ec-a0bf8417b276@huawei.com>
Date: Sat, 31 Oct 2026 10:24:40 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/19] arm_mpam: resctrl: Leave CDP off when there
 are too few PARTIDs
To: Ben Horgan <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<james.morse@arm.com>, <fenghuay@nvidia.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<zengheng4@huawei.com>, <gshan@redhat.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
 <20261029123611.1108424-2-ruanjinjie@huawei.com>
 <bea9392d-a9d1-4683-ba2c-41139a1dca9d@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <bea9392d-a9d1-4683-ba2c-41139a1dca9d@arm.com>
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_192500_494769_39B81CBE 
X-CRM114-Status: GOOD (  29.34  )
X-Spam-Score: -1.3 (-)
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

CgrlnKggMjAyNi8xMC8zMSAwOjM4LCBCZW4gSG9yZ2FuIOWGmemBkzoKPiBIaSBKaW5qaWUsCj4g
Cj4gVGhhbmtzIGZvciB0aGlzIGZpeCEKPiAKPiBPbiAyOS8xMC8yMDI2IDEyOjM1LCBKaW5qaWUg
UnVhbiB3cm90ZToKPj4gRW5hYmxpbmcgQ0RQIG5lZWRzIGEgc2Vjb25kIFBBUlRJRCBmb3IgdGhl
IHJlc2VydmVkIGNsb3NpZC4KPiAKPiBJJ20gbm90IHN1cmUgd2hhdCBhICdyZXNlcnZlZCBjbG9z
aWQnIGlzIGhlcmUgYnV0IHlvdSBjb3VsZCBqdXN0IHNheToKCkhpIEJlbiwKCgpUaGlzIG1lYW5z
IHRoZXJlIGFyZSB0d28gY29waWVzOiBvbmUgZm9yIGRhdGEgYW5kIG9uZSBmb3IgY29kZS4KCj4g
Cj4gRW5hYmxpbmcgQ0RQIHJlcXVpcmVzIGF0IGxlYXN0IDIgUEFSVElEcy4KCk9LLgoKPiAKPj4g
SWYgZmlybXdhcmUKPj4gcmVwb3J0cyB0b28gZmV3IFBBUlRJRHMsIHJlc2N0cmxfYXJjaF9zZXRf
Y2RwX2VuYWJsZWQoKSByZXR1cm5zIC1FSU5WQUwsCj4gCj4gTm90IGFsbCBzeXN0ZW1zIGFyZSBm
aXJtd2FyZSBiYWNrZWQuIFRoaXMgY2FuIGJlOgo+IAo+IElmIHRoZXJlIGFyZSB0b28gZmV3IFBB
UlRJRHMsIC4uLiAuCgpUaGFuayB5b3UhIEkgd2lsbCBmaXggaXQuCgo+IAo+PiBidXQgb25seSBh
ZnRlciBpdCBoYXMgcmVjb3JkZWQgQ0RQIGFzIGVuYWJsZWQsIGhhbHZlZCB0aGUgbW9uaXRvciBj
b3VudAo+PiBhbmQgdHVybmVkIG9mZiB0aGUgbWJ3X21heCBNQkEgY29udHJvbC4gCj4gCj4gCj4+
IHJlc2N0cmwgdGhlbiByZXBvcnRzIGFuIGVycm9yCj4+IGFuZCBiZWxpZXZlcyBDRFAgaXMgb2Zm
LCB3aGljaCBsZWF2ZXMgdGhlIHR3byBzaWRlcyBvdXQgb2Ygc3RlcCBhbmQgdGhlCj4+IGhhbHZl
ZCBtb25pdG9yIGNvdW50IGFuZCB0aGUgbWlzc2luZyBNQkEgY29udHJvbCBhcmUgbm90IHVuZG9u
ZS4KPiAKPiBJIHRoaW5rIHRoZSAncmVwb3J0cyBhbiBlcnJvciBwYXJ0JyBjYW4gYmUgZHJvcHBl
ZCBsZWF2aW5nICdyZXNjdHJsIHRoZW4gYmVsaWV2ZXMgQ0RQIGlzIG9mZi4uLicgYXMKPiBleGFj
dGx5IHdoYXQgcmVzY3RybCBkb2VzIGlzIG5vdCBpbXBvcnRhbnQgaGVyZS4KCldpbGwgdXBkYXRl
IGl0LgoKPiAKPj4KPj4gQ2hlY2sgdGhlIFBBUlRJRCBsaW1pdCwgYW5kIHdvcmsgb3V0IHRoZSBD
RFAgUEFSVElEcywgYmVmb3JlIGFueXRoaW5nIGlzCj4gCj4gV2h5IHdvcmsgb3V0IHRoZSBDRFAg
UEFSVElEcyBzbyBlYXJseSBpZiB0aGV5IGFyZW4ndCBnb2luZyB0byBiZSB1c2VkPwoKTW9kaWZp
ZWQgdGhlbSB0b2dldGhlciBhcyBhIHdob2xlLgoKPiAKPj4gY2hhbmdlZCBzbyBhIGZhaWxlZCBl
bmFibGUgaGFzIG5vIGVmZmVjdC4KPj4KPj4gRml4ZXM6IDY3ODlmYjk5MjgyYyAoImFybV9tcGFt
OiByZXNjdHJsOiBBZGQgQ0RQIGVtdWxhdGlvbiIpCj4+IFNpZ25lZC1vZmYtYnk6IEppbmppZSBS
dWFuIDxydWFuamluamllQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9yZXNjdHJsL21w
YW1fcmVzY3RybC5jIHwgMjAgKysrKysrKysrKysrLS0tLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9yZXNjdHJsL21wYW1fcmVzY3RybC5jIGIvZHJpdmVycy9yZXNjdHJsL21wYW1fcmVzY3Ry
bC5jCj4+IGluZGV4IDU0NjgzNjc3NzZlMi4uODg2ZjA1OTVkMzY0IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL3Jlc2N0cmwvbXBhbV9yZXNjdHJsLmMKPj4gKysrIGIvZHJpdmVycy9yZXNjdHJsL21w
YW1fcmVzY3RybC5jCj4+IEBAIC0yMTAsNiArMjEwLDE4IEBAIGludCByZXNjdHJsX2FyY2hfc2V0
X2NkcF9lbmFibGVkKGVudW0gcmVzY3RybF9yZXNfbGV2ZWwgcmlkLCBib29sIGVuYWJsZSkKPj4g
IAlpZiAoZW5hYmxlKQo+PiAgCQlwcl93YXJuKCJDRFAgaXMgYW4gZXhwZXJ0IGZlYXR1cmUgYW5k
IG1heSBjYXVzZSBNUEFNIHRvIG1hbGZ1bmN0aW9uLlxuIik7Cj4+ICAKPj4gKwkvKgo+PiArCSAq
IENoZWNrIHRoaXMgYmVmb3JlIGNoYW5naW5nIGFueSBzdGF0ZTogaWYgQ0RQIGNhbid0IGJlIGVu
YWJsZWQgdGhlCj4+ICsJICogY2FsbGVyIG11c3Qgc2VlIENEUCBsZWZ0IG9mZi4KPj4gKwkgKi8K
PiAKPiBJIGRvbid0IHRoaW5rIHRoaXMgY29tbWVudCBpcyBuZWVkZWQuIEZhaWxpbmcgZWFybHkg
cmF0aGVyIHRoYW4gZmFpbGluZyBsYXRlIGFmdGVyIHNvbWUgc2lkZSBlZmZlY3RzCj4gaGF2ZSBo
YXBwZW5lZCBpcyBjbGVhcmx5IGJldHRlci4KCldpbGwgZGVsZXRlIGl0LgoKPiAKPj4gKwlpZiAo
ZW5hYmxlKSB7Cj4+ICsJCWlmIChtcGFtX3BhcnRpZF9tYXggPCAxKQo+PiArCQkJcmV0dXJuIC1F
SU5WQUw7Cj4+ICsKPj4gKwkJcGFydGlkX2QgPSByZXNjdHJsX2dldF9jb25maWdfaW5kZXgoUkVT
Q1RSTF9SRVNFUlZFRF9DTE9TSUQsIENEUF9EQVRBKTsKPj4gKwkJcGFydGlkX2kgPSByZXNjdHJs
X2dldF9jb25maWdfaW5kZXgoUkVTQ1RSTF9SRVNFUlZFRF9DTE9TSUQsIENEUF9DT0RFKTsKPiAK
PiBUaGUgcGFydGlkX2QvcGFydGlkX2kgZGV0ZXJtaW5hdGlvbiBjYW4gc3RheSBiZWxvdyBzbyBp
dCdzIGNsb3NlIHRvIHRoZSB1c2VyLgoKV2lsbCBwdXQgaXQgYmFjayBpbiBpdHMgb3JpZ2luYWwg
cGxhY2UuCgo+IAo+IEkgdGhpbmsgd2UgY2FuIGp1c3QgaGF2ZSB0aGUgY2hlY2sgaGVyZToKPiAK
PiBpZiAoZW5hYmxlICYmIG1wYW1fcGFydGlkX21heCA8IDEpCj4gICAJcmV0dXJuIC1FSU5WQUw7
CgpUaGF0IGlzIGZpbmUuCgo+IAo+IFRoYW5rcywKPiAKPiBCZW4KPiAKPj4gKwl9Cj4+ICsKPj4g
IAkvKgo+PiAgCSAqIHJlc2N0cmxfYXJjaF9zZXRfY2RwX2VuYWJsZWQoKSBpcyBvbmx5IGNhbGxl
ZCB3aXRoIGVuYWJsZSBzZXQgdG8KPj4gIAkgKiBmYWxzZSBvbiBlcnJvciBhbmQgdW5tb3VudC4K
Pj4gQEAgLTIzOCwxNCArMjUwLDYgQEAgaW50IHJlc2N0cmxfYXJjaF9zZXRfY2RwX2VuYWJsZWQo
ZW51bSByZXNjdHJsX3Jlc19sZXZlbCByaWQsIGJvb2wgZW5hYmxlKQo+PiAgCWlmICghY2RwX2Vu
YWJsZWQgJiYgbXBhbV9yZXNjdHJsX2NvbnRyb2xzW1JEVF9SRVNPVVJDRV9NQkFdLmNsYXNzKQo+
PiAgCQltcGFtX3Jlc2N0cmxfY29udHJvbHNbUkRUX1JFU09VUkNFX01CQV0ucmVzY3RybF9yZXMu
YWxsb2NfY2FwYWJsZSA9IHRydWU7Cj4+ICAKPj4gLQlpZiAoZW5hYmxlKSB7Cj4+IC0JCWlmICht
cGFtX3BhcnRpZF9tYXggPCAxKQo+PiAtCQkJcmV0dXJuIC1FSU5WQUw7Cj4+IC0KPj4gLQkJcGFy
dGlkX2QgPSByZXNjdHJsX2dldF9jb25maWdfaW5kZXgoUkVTQ1RSTF9SRVNFUlZFRF9DTE9TSUQs
IENEUF9EQVRBKTsKPj4gLQkJcGFydGlkX2kgPSByZXNjdHJsX2dldF9jb25maWdfaW5kZXgoUkVT
Q1RSTF9SRVNFUlZFRF9DTE9TSUQsIENEUF9DT0RFKTsKPj4gLQl9Cj4+IC0KPj4gIAltcGFtX3Nl
dF90YXNrX3BhcnRpZF9wbWcoY3VycmVudCwgcGFydGlkX2QsIHBhcnRpZF9pLCAwLCAwKTsKPj4g
IAlXUklURV9PTkNFKGFybTY0X21wYW1fZ2xvYmFsX2RlZmF1bHQsIG1wYW1fZ2V0X3JlZ3ZhbChj
dXJyZW50KSk7Cj4+ICAKPiAKCi0tIApCZXN0IHJlZ2FyZHMsCkppbmppZQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
