Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6EB606A338
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 09:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nSBrL//n;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=MQ7/wjZC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KfWvdmWr4C+I+qJdsXumTBWUX6Fg2D7L+d8gqoRfAyc=; b=nSBrL//nVEdH2BWVoTpeegtvog
	upspENLodwYv59VrfcTBksSQeGg60IAvDLD1wu/JwtYVqt4iBDEKMpYu0LVjPkVT32bD+cnHqkh5d
	aEza0wuZ0PugjW9Fs2klOAFR2sEfa3Pt7TWf+khsXycMJPasEab/3Kkq5Djj9suJdeDZOCbV+Qk2Y
	PIbdXg4Ye7hdlELjh0+okuta3iVnJLCdXnnbz+wwj13IJ05a3WnQQGc28y8yc+ynjWTMTtcgMJKNw
	AbEA77TM+sgZ1LKb4+D/k8KLILnc67JMq555Fg9uDe0DeCQEKjkZxR6ciFffeFBj6O1jv3v87Xens
	ALpsYL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAcq-00000001ibq-05UW;
	Tue, 03 Nov 2026 09:16:16 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAch-00000001iZB-2tFf;
	Tue, 03 Nov 2026 09:16:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=48sfBtezaLrmsDLxpZBqDtVgmBMh4esLZj8eSRsa2cM=;
	b=MQ7/wjZCJByib4DUAG1rr8PWbq4ZKNqzIaaZ0Biehny2BBZjAjV3wKEwUZvkviWzcCEbf0g+v
	XU2u1c0FR7BeFFcd2sKiP2M9NRejpiGNFnV1aQNjASXnIdM5gSq78pUOH9pz1/Cnp1FM1nmDrIn
	G/mzrhIC2kG1FA5PLDo4uzc=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jJjbc4bwXz1T4JR;
	Tue,  3 Nov 2026 17:15:40 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D79EB40538;
	Tue,  3 Nov 2026 17:15:58 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 3 Nov
 2026 17:15:57 +0800
Message-ID: <f3f239df-6d94-46b2-aa0d-e890a509cda1@huawei.com>
Date: Tue, 3 Nov 2026 17:15:56 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/15] arm64: kexec_file: Fix CMA page leaks in segment
 placement retry loops
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
 <20261026075201.699550-4-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261026075201.699550-4-ruanjinjie@huawei.com>
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_011608_051365_93512DC8 
X-CRM114-Status: GOOD (  15.87  )
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
IENjOiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+IENjOiBXaWxs
IERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPgo+IENjOiBCcmVubyBMZWl0YW8gPGxlaXRhb0BkZWJp
YW4ub3JnPgo+IENjOiBQcmF0eXVzaCBZYWRhdiA8cHJhdHl1c2hAa2VybmVsLm9yZz4KPiBDYzog
QW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogWWVvcmV1bSBZ
dW4gPHllb3JldW0ueXVuQGFybS5jb20+Cj4gQ2M6IEJhb3F1YW4gSGUgPGJoZUByZWRoYXQuY29t
Pgo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gRml4ZXM6IDA3ZDI0OTAyOTc3ZSAoImtl
eGVjOiBlbmFibGUgQ01BIGJhc2VkIGNvbnRpZ3VvdXMgYWxsb2NhdGlvbiIpCj4gU2lnbmVkLW9m
Zi1ieTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4KPiAtLS0KPiAgYXJjaC9h
cm02NC9rZXJuZWwva2V4ZWNfaW1hZ2UuYyAgICAgICAgfCA4ICsrKysrKysrCj4gIGFyY2gvYXJt
NjQva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jIHwgNSArKysrLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9rZXJuZWwva2V4ZWNfaW1hZ2UuYyBiL2FyY2gvYXJtNjQva2VybmVsL2tleGVjX2lt
YWdlLmMKPiBpbmRleCA3NGQyNGM4YWEyZmEuLjZlZDE5OTFlMzE0MiAxMDA2NDQKPiAtLS0gYS9h
cmNoL2FybTY0L2tlcm5lbC9rZXhlY19pbWFnZS5jCj4gKysrIGIvYXJjaC9hcm02NC9rZXJuZWwv
a2V4ZWNfaW1hZ2UuYwo+IEBAIC0xMTEsNiArMTExLDE0IEBAIHN0YXRpYyB2b2lkICppbWFnZV9s
b2FkKHN0cnVjdCBraW1hZ2UgKmltYWdlLAo+ICAJCSAqIFdlIGNvdWxkbid0IGZpbmQgc3BhY2Ug
Zm9yIHRoZSBvdGhlciBzZWdtZW50czsgZXJhc2UgdGhlCj4gIAkJICoga2VybmVsIHNlZ21lbnQg
YW5kIHRyeSB0aGUgbmV4dCBhdmFpbGFibGUgaG9sZS4KPiAgCQkgKi8KPiArCQkvKgo+ICsJCSAq
IGtleGVjX2FsbG9jX2NvbnRpZygpIGlnbm9yZXMgYnVmX21pbiwgc28gZGlzYWJsZSBDTUEgdG8K
PiArCQkgKiBsZXQgdGhlIHJldHJ5IG1ha2UgcHJvZ3Jlc3MuCj4gKwkJICovCj4gKwkJaWYgKGlt
YWdlLT5zZWdtZW50X2NtYVtrZXJuZWxfc2VnbWVudF9udW1iZXJdKQo+ICsJCQlpbWFnZS0+bm9f
Y21hID0gdHJ1ZTsKPiArCj4gKwkJa2V4ZWNfZnJlZV9zZWdtZW50X2NtYShpbWFnZSwga2VybmVs
X3NlZ21lbnRfbnVtYmVyKTsKPiAgCQlpbWFnZS0+bnJfc2VnbWVudHMgLT0gMTsKPiAgCQlrYnVm
LmJ1Zl9taW4gPSBrZXJuZWxfc2VnbWVudC0+bWVtICsga2VybmVsX3NlZ21lbnQtPm1lbXN6Owo+
ICAJCWtidWYubWVtID0gS0VYRUNfQlVGX01FTV9VTktOT1dOOwo+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYyBiL2FyY2gvYXJtNjQva2VybmVsL21h
Y2hpbmVfa2V4ZWNfZmlsZS5jCj4gaW5kZXggODU0ZDg3MmRmZDBmLi5lNDhmMjkxNjdiMzggMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMKPiArKysg
Yi9hcmNoL2FybTY0L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYwo+IEBAIC0xNzksNyArMTc5
LDEwIEBAIGludCBsb2FkX290aGVyX3NlZ21lbnRzKHN0cnVjdCBraW1hZ2UgKmltYWdlLAo+ICAJ
cmV0dXJuIDA7Cj4gIAo+ICBvdXRfZXJyOgo+IC0JaW1hZ2UtPm5yX3NlZ21lbnRzID0gb3JpZ19z
ZWdtZW50czsKPiArCXdoaWxlIChpbWFnZS0+bnJfc2VnbWVudHMgPiBvcmlnX3NlZ21lbnRzKSB7
Cj4gKwkJa2V4ZWNfZnJlZV9zZWdtZW50X2NtYShpbWFnZSwgaW1hZ2UtPm5yX3NlZ21lbnRzIC0g
MSk7Cj4gKwkJaW1hZ2UtPm5yX3NlZ21lbnRzLS07Cj4gKwl9Cj4gIAlrdmZyZWUoZHRiKTsKPiAg
CXJldHVybiByZXQ7Cj4gIH0KCi0tIApCZXN0IHJlZ2FyZHMsCkppbmppZQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
