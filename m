Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B0EEB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 02:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kwhw9B4xB4aBueZDCdverO61hvLQhGkx1m56Svmfv2E=; b=KV3yhujZh9pwHFXKHszKtsVRYq
	AZ7I+e1ZCv5bJcPTgFwhEyOScQfYrS45Xoa3GdV5RqmcC2vCPz7In8XwqXpGfl47mfa2YzQYeAEHI
	S3ZGrHEhV4BGd6Fs89673ncDH5jWM4vgAA0PV4KFciNRpzrRxqDDLnUQQTaFuOVNgMGTHJWtUvQPi
	crjnIuvzLcxGEwFXy/7apFxTOHa5Dk1pLxgWJ/TjfJ0NvjxgPoII7SzGS+BjwI2+pMXyhUZUAGf5N
	B2xS7FDvETkEAanMtbbwEkW9OL2xqmDp6X8pi1s0SAMcIc8GyqiysO7FkgjH2aBDVGIbshoZ1q0Au
	pz2NyDow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDFaP-0072Vb-1T;
	Sun, 25 Jun 2023 02:34:45 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDFaL-0072Tp-2F
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 02:34:43 +0000
X-QQ-mid: bizesmtp71t1687660461t4hq4z3o
Received: from [192.168.1.114] ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 25 Jun 2023 10:34:19 +0800 (CST)
X-QQ-SSF: 00200000000000B0B000000A0000000
X-QQ-FEAT: 3Jh+sxPGtVmluKPKd5EUFDmRpnFkoh2ELXvzLjAxRXXaPj8SVbvXWVCCTaHze
	v0SK3Wfa5mGPnjWlH+2ZUJpX+Qj+SHOJ+jhbbZ3BPKh3j7kBykWtYKDj59Obz4iOgi0kfzN
	Hy+hS9pnPE5sEY0TWplX2piMdCNBDW+2wvJGsK3yoXAuYqmWGwY32LWOq3ws/986c5qLbp9
	/huydVpiaEDyDs/8WH26qbOaCPJETst29tstzmwhRM+IspIT7X50lLOVw9YJ6Cfm3Yi864Q
	rCuDEjTGPO8I4/o6CWkBt+x8TckBAGEeUisqHdvvrQ9eStxbEpb8NZ6TR17eduEtlgwOd5q
	MmZCUzltkUIVBMW2aq4fW1WnhCEDpClaiy+Zt7u5hLyY20eh5U=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10716706576352357094
Message-ID: <F2A85F463CC9E2BC+a141a56b-4685-8fb1-4eb7-aa5dcf18f9f2@tinylab.org>
Date: Sun, 25 Jun 2023 10:34:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/3] Documentation: arm: Add bootargs to the table of
 added DT parameters
To: Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20230623095547.51881-1-alexghiti@rivosinc.com>
From: Song Shuai <songshuaishuai@tinylab.org>
In-Reply-To: <20230623095547.51881-1-alexghiti@rivosinc.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_193442_040152_F82ACCB0 
X-CRM114-Status: GOOD (  13.87  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMy82LzIzIDE3OjU1LCBBbGV4YW5kcmUgR2hpdGkg5YaZ6YGTOgo+IFRoZSBib290
YXJncyBub2RlIGlzIGFsc28gYWRkZWQgYnkgdGhlIEVGSSBzdHViIGluIHRoZSBmdW5jdGlvbgo+
IHVwZGF0ZV9mZHQoKSwgc28gYWRkIGl0IHRvIHRoZSB0YWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gLS0tCj4gICBEb2N1
bWVudGF0aW9uL2FybS91ZWZpLnJzdCB8IDQgKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2FybS91ZWZpLnJzdCBiL0RvY3VtZW50YXRpb24vYXJtL3VlZmkucnN0Cj4gaW5kZXggYmFlYmU2
ODhhMDA2Li4yYjdhZDliZDdjZDIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hcm0vdWVm
aS5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL2FybS91ZWZpLnJzdAo+IEBAIC01MCw3ICs1MCw3
IEBAIFRoZSBzdHViIHBvcHVsYXRlcyB0aGUgRkRUIC9jaG9zZW4gbm9kZSB3aXRoIChhbmQgdGhl
IGtlcm5lbCBzY2FucyBmb3IpIHRoZQo+ICAgZm9sbG93aW5nIHBhcmFtZXRlcnM6Cj4gICAKPiAg
ID09PT09PT09PT09PT09PT09PT09PT09PT09ICA9PT09PT0gICA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09Cj4gLU5hbWUgICAgICAgICAgICAgICAgICAgICAgICBT
aXplICAgICBEZXNjcmlwdGlvbgo+ICtOYW1lICAgICAgICAgICAgICAgICAgICAgICAgVHlwZSAg
ICAgRGVzY3JpcHRpb24KPiAgID09PT09PT09PT09PT09PT09PT09PT09PT09ICA9PT09PT0gICA9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gICBsaW51eCx1ZWZp
LXN5c3RlbS10YWJsZSAgICAgNjQtYml0ICAgUGh5c2ljYWwgYWRkcmVzcyBvZiB0aGUgVUVGSSBT
eXN0ZW0gVGFibGUuCj4gICAKPiBAQCAtNjcsNCArNjcsNiBAQCBsaW51eCx1ZWZpLW1tYXAtZGVz
Yy12ZXIgICAgMzItYml0ICAgVmVyc2lvbiBvZiB0aGUgbW1hcCBkZXNjcmlwdG9yIGZvcm1hdC4K
PiAgIAo+ICAga2FzbHItc2VlZCAgICAgICAgICAgICAgICAgIDY0LWJpdCAgIEVudHJvcHkgdXNl
ZCB0byByYW5kb21pemUgdGhlIGtlcm5lbCBpbWFnZQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJhc2UgYWRkcmVzcyBsb2NhdGlvbi4KPiArCj4gK2Jvb3RhcmdzICAg
ICAgICAgICAgICAgICAgICBTdHJpbmcgICBLZXJuZWwgY29tbWFuZCBsaW5lCj4gICA9PT09PT09
PT09PT09PT09PT09PT09PT09PSAgPT09PT09ICAgPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQoKUmV2aWV3ZWQtYnk6IFNvbmcgU2h1YWkgPHNvbmdzaHVhaXNodWFp
QHRpbnlsYWIub3JnPgotLSAKVGhhbmtzClNvbmcgU2h1YWkKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
