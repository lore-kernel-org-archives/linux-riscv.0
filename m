Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2071EC67871
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 01:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKCWL3YcmzzAsFoo/8OFWaqEXlQq6Tsdf8/F+Vq8iIs=; b=SFf9r5jyQAxvs5
	6cXZo9ZBtKgh7IupVQtycDbFcaHZfrtg+pu/HVEEnTlaZn4RRHE/JAXdXvepgeISPgKPb5us+gKUh
	lkH23PvQbjTlSQB3TpRVIL9lhx6JqxdBGER7qJHf+s2jDhypL8peCkMmRCgy3xNpkMXmmX58Y98Vu
	40y8LaGGZqfEU/rARvJZcvKvLKnSXJlJT/WMgnhyTjrWjosD8SOw31XjeF/fiSN2oQG2KO5VT7Pey
	EBbkS7f3AfSi2vJNsSLDRF4VPXUJlsGfubYOZaMfUo9kCh3lvt9z9ljjEQ31mkvZVRA7ADsTmgNxX
	LIjK1wKJ1Hscd74++hsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on8cN-003WV2-Lm; Tue, 25 Oct 2022 01:20:35 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on8cJ-003WTG-TV
	for linux-riscv@lists.infradead.org; Tue, 25 Oct 2022 01:20:34 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MxDZR6vvJzJn1m;
	Tue, 25 Oct 2022 09:17:35 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 25 Oct 2022 09:20:20 +0800
Message-ID: <f0785930-8f2a-9d09-4dbf-545d11994cbe@huawei.com>
Date: Tue, 25 Oct 2022 09:20:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH V6 01/11] riscv: elf_kexec: Fixup compile warning
To: <guoren@kernel.org>, <arnd@arndb.de>, <palmer@rivosinc.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<conor.dooley@microchip.com>, <heiko@sntech.de>, <jszhang@kernel.org>,
	<lazyparser@gmail.com>, <falcon@tinylab.org>, <chenhuacai@kernel.org>,
	<apatel@ventanamicro.com>, <atishp@atishpatra.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <mark.rutland@arm.com>, <zouyipeng@huawei.com>,
	<bigeasy@linutronix.de>, <David.Laight@aculab.com>, <chenzhongjin@huawei.com>
CC: <linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Guo Ren <guoren@linux.alibaba.com>, kernel
 test robot <lkp@intel.com>
References: <20221002012451.2351127-1-guoren@kernel.org>
 <20221002012451.2351127-2-guoren@kernel.org>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <20221002012451.2351127-2-guoren@kernel.org>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_182032_157298_342BEDE9 
X-CRM114-Status: GOOD (  11.51  )
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

CgrlnKggMjAyMi8xMC8yIDk6MjQsIGd1b3JlbkBrZXJuZWwub3JnIOWGmemBkzoKPiBGcm9tOiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gCj4gSWYgQ1JZVFBPIG9yIENSWVBU
T19TSEEyNTYgb3IgS0VYRV9GSUxFIGlzIG5vdCBlbmFibGVkLCB0aGVuOgo+IAo+IENPTVBJTEVS
X0lOU1RBTExfUEFUSD0kSE9NRS8wZGF5IENPTVBJTEVSPWdjYy0xMi4xLjAgbWFrZS5jcm9zcyBX
PTEKPiBPPWJ1aWxkX2RpciBBUkNIPXJpc2N2IFNIRUxMPS9iaW4vYmFzaCBhcmNoL3Jpc2N2Lwo+
IAo+IC4uL2FyY2gvcmlzY3Yva2VybmVsL2VsZl9rZXhlYy5jOiBJbiBmdW5jdGlvbiAnZWxmX2tl
eGVjX2xvYWQnOgo+IC4uL2FyY2gvcmlzY3Yva2VybmVsL2VsZl9rZXhlYy5jOjE4NToyMzogd2Fy
bmluZzogdmFyaWFibGUKPiAna2VybmVsX3N0YXJ0JyBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNl
ZC1idXQtc2V0LXZhcmlhYmxlXQo+ICAgMTg1IHwgICAgICAgICB1bnNpZ25lZCBsb25nIGtlcm5l
bF9zdGFydDsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn4KPiAK
PiBGaXhlczogODM4YjNlMjg0ODhmICgiUklTQy1WOiBMb2FkIHB1cmdhdG9yeSBpbiBrZXhlY19m
aWxlIikKPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gUmV2aWV3ZWQt
Ynk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gUmVwb3J0ZWQt
Ynk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9lbGZfa2V4ZWMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2Vs
Zl9rZXhlYy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvZWxmX2tleGVjLmMKPiBpbmRleCAwY2I5NDk5
MmMxNWIuLjRiOTI2NDM0MGI3OCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbGZf
a2V4ZWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2VsZl9rZXhlYy5jCj4gQEAgLTE5OCw3
ICsxOTgsNyBAQCBzdGF0aWMgdm9pZCAqZWxmX2tleGVjX2xvYWQoc3RydWN0IGtpbWFnZSAqaW1h
Z2UsIGNoYXIgKmtlcm5lbF9idWYsCj4gIAlpZiAocmV0KQo+ICAJCWdvdG8gb3V0Owo+ICAJa2Vy
bmVsX3N0YXJ0ID0gaW1hZ2UtPnN0YXJ0Owo+IC0JcHJfbm90aWNlKCJUaGUgZW50cnkgcG9pbnQg
b2Yga2VybmVsIGF0IDB4JWx4XG4iLCBpbWFnZS0+c3RhcnQpOwo+ICsJcHJfbm90aWNlKCJUaGUg
ZW50cnkgcG9pbnQgb2Yga2VybmVsIGF0IDB4JWx4XG4iLCBrZXJuZWxfc3RhcnQpOwo+ICAKPiAg
CS8qIEFkZCB0aGUga2VybmVsIGJpbmFyeSB0byB0aGUgaW1hZ2UgKi8KPiAgCXJldCA9IHJpc2N2
X2tleGVjX2VsZl9sb2FkKGltYWdlLCAmZWhkciwgJmVsZl9pbmZvLAoKTEdUTQoKUmV2aWV3ZWQt
Ynk6IExpYW8gQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KCi0tIApCUiwKTGlhbywgQ2hh
bmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
