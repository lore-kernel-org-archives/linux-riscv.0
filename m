Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391FBC43334
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 10:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3RnMIThsYcn0HQHPFpnC3a21T5+9+VqvjV9QrQBkFk=; b=mo+w8FBicgVVY3
	TDOnwzbqTUoQcJk7c23c+D0Qtet6jNGWD6CxdvGDR40CYKd3fnqZPqqfoC/gTcJxUQBNxKJ2AkaI9
	5izkGEDjDF+RWPaxp6XTyfboWJJyW1KO6N8DJsGrtb7FBZP2ZbmHY/wxwMeHX80VNkiMySdpkT2uU
	wt+QGf+QLHkCqRD2oRpGenfmPf91j0eZ1YtaJO8B+fjfrZr3w8N6rJ3gpMda2qd2FDPEtNdkBso7K
	QvmXsZ++JICOeMd5owLdmqw+xCGz9T7NYEo+BZRRtntv9R1N3r78Z92skZp+j1Gz/kSbJ9dlHNszv
	P99hog4E7q7BOF2jJq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nysVB-00CZ1D-B3; Wed, 08 Jun 2022 10:01:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nysUY-00CYh1-MW; Wed, 08 Jun 2022 10:00:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60F83143D;
	Wed,  8 Jun 2022 03:00:42 -0700 (PDT)
Received: from [10.162.41.25] (unknown [10.162.41.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EA093F73B;
	Wed,  8 Jun 2022 03:00:29 -0700 (PDT)
Message-ID: <1f2a76d5-7c4e-46bc-ce66-20a962eac73c@arm.com>
Date: Wed, 8 Jun 2022 15:30:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 4/6] mm: Demote warning message in vmemmap_verify() to
 debug level
Content-Language: en-US
To: mawupeng <mawupeng1@huawei.com>, david@redhat.com, corbet@lwn.net,
 will@kernel.org, ardb@kernel.org, catalin.marinas@arm.com
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 dvhart@infradead.org, andy@infradead.org, rppt@kernel.org,
 akpm@linux-foundation.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paulmck@kernel.org, keescook@chromium.org,
 songmuchun@bytedance.com, rdunlap@infradead.org,
 damien.lemoal@opensource.wdc.com, swboyd@chromium.org, wei.liu@kernel.org,
 robin.murphy@arm.com, thunder.leizhen@huawei.com,
 wangkefeng.wang@huawei.com, gpiccoli@igalia.com, chenhuacai@kernel.org,
 geert@linux-m68k.org, vijayb@linux.microsoft.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-5-mawupeng1@huawei.com>
 <b1975f44-2552-a03c-bb6f-1452f1fd99c0@redhat.com>
 <a820f287-e879-6183-a917-6a577b6160ab@huawei.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <a820f287-e879-6183-a917-6a577b6160ab@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_030046_846641_5D3812D7 
X-CRM114-Status: GOOD (  12.70  )
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

CgpPbiA2LzgvMjIgMDY6NTYsIG1hd3VwZW5nIHdyb3RlOgo+IAo+IAo+IOWcqCAyMDIyLzYvNyAy
MDoyNSwgRGF2aWQgSGlsZGVuYnJhbmQg5YaZ6YGTOgo+PiBPbiAwNy4wNi4yMiAxMTozOCwgV3Vw
ZW5nIE1hIHdyb3RlOgo+Pj4gRnJvbTogTWEgV3VwZW5nIDxtYXd1cGVuZzFAaHVhd2VpLmNvbT4K
Pj4+Cj4+PiBGb3IgYSBzeXN0ZW0gb25seSBoYXZlIGxpbWl0ZWQgbWlycm9yZWQgbWVtb3J5IG9y
IHNvbWUgbnVtYSBub2RlIHdpdGhvdXQKPj4+IG1pcnJvcmVkIG1lbW9yeSwgdGhlIHBlciBub2Rl
IHZtZW1tYXAgcGFnZV9zdHJ1Y3RzIHByZWZlciB0byBhbGxvY2F0ZQo+Pj4gbWVtb3J5IGZyb20g
bWlycm9yZWQgcmVnaW9uLCB3aGljaCB3aWxsIGxlYWQgdG8gdm1lbW1hcF92ZXJpZnkoKSBpbgo+
Pj4gdm1lbW1hcF9wb3B1bGF0ZV9iYXNlcGFnZXMoKSByZXBvcnQgbG90cyBvZiB3YXJuaW5nIG1l
c3NhZ2UuCj4+Pgo+Pj4gVGhpcyBwYXRjaCBkZW1vdGUgdGhlICJwb3RlbnRpYWwgb2Zmbm9kZSBw
YWdlX3N0cnVjdHMiIHdhcm5pbmcgbWVzc2FnZXMKPj4+IHRvIGRlYnVnIGxldmVsIHRvIGF2b2lk
IGEgdmVyeSBsb25nIHByaW50IGR1cmluZyBib290dXAuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
TWEgV3VwZW5nIDxtYXd1cGVuZzFAaHVhd2VpLmNvbT4KPj4+IC0tLQo+Pj4gwqAgbW0vc3BhcnNl
LXZtZW1tYXAuYyB8IDIgKy0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9tbS9zcGFyc2Utdm1lbW1hcC5jIGIv
bW0vc3BhcnNlLXZtZW1tYXAuYwo+Pj4gaW5kZXggZjRmYTYxZGJiZWUzLi43OGRlYmRiODllYjEg
MTAwNjQ0Cj4+PiAtLS0gYS9tbS9zcGFyc2Utdm1lbW1hcC5jCj4+PiArKysgYi9tbS9zcGFyc2Ut
dm1lbW1hcC5jCj4+PiBAQCAtNTI4LDcgKzUyOCw3IEBAIHZvaWQgX19tZW1pbml0IHZtZW1tYXBf
dmVyaWZ5KHB0ZV90ICpwdGUsIGludCBub2RlLAo+Pj4gwqDCoMKgwqDCoCBpbnQgYWN0dWFsX25v
ZGUgPSBlYXJseV9wZm5fdG9fbmlkKHBmbik7Cj4+PiDCoCDCoMKgwqDCoMKgIGlmIChub2RlX2Rp
c3RhbmNlKGFjdHVhbF9ub2RlLCBub2RlKSA+IExPQ0FMX0RJU1RBTkNFKQo+Pj4gLcKgwqDCoMKg
wqDCoMKgIHByX3dhcm4oIlslbHgtJWx4XSBwb3RlbnRpYWwgb2Zmbm9kZSBwYWdlX3N0cnVjdHNc
biIsCj4+PiArwqDCoMKgwqDCoMKgwqAgcHJfZGVidWcoIlslbHgtJWx4XSBwb3RlbnRpYWwgb2Zm
bm9kZSBwYWdlX3N0cnVjdHNcbiIsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGFy
dCwgZW5kIC0gMSk7Cj4+PiDCoCB9Cj4+PiDCoCAKPj4KPj4gVGhpcyB3aWxsIHBvc3NpYmx5IGhp
ZGUgaXQgaW4gZW52aXJvbm1lbnRzIHdoZXJlIHRoaXMgbWlnaHQgaW5kZWVkCj4+IGluZGljYXRl
IHBlcmZvcm1hbmNlIGlzc3Vlcy4KPj4KPj4gV2hhdCBhYm91dCBhIHByX3dhcm5fb25jZSgpPwo+
Pgo+IAo+IFN1cmUuCj4gCj4gVGhpcyB3aWxsIHdvcmtzLiBXZSBjYW4gY2VydGFpbmx5IHVzZSBh
IHByX3dhcm5fb25jZSgpLgoKV2h5IG5vdCBwcl93YXJuX3JhdGVsaW1pdGVkKCkgbGlrZSBpbiB0
aGUgcHJldmlvdXMgcGF0Y2ggPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
