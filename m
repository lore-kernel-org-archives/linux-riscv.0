Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A12ECD98E4
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 03:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qdRdid+C8GnSSYXQdO5rNJjZGlkQsJBJ7lJi2ZTCoM=; b=TqndK6YuWCZhAB
	TcMEg+MHki+DKVEZlX7AuuyWdN/Ax6W2YnTh91glpcHpkfCoBl+dI4I73f/v0DeteMfyy/S2xth0t
	bDy1KXss6aHTUvVhhyOrmUj9lckAB8tcVjpV8DyzKQvrU3ZNUeYh5zC+O51++oXlCBrJS3Al14rQb
	GwxAz6DFBghBUPcqvxfBhbMtyh0rwN7P7iHNq95kVJcJti4a9qlCjYmTvGsYPAFvU8BWvM/E9zoVN
	aRghvvk9WS//wVJm4flqcPbIKwdEihVFmH5hEFIFIjjORN9//uMepzl5Ndsjk0ML5QbfCBSQJExW0
	QfpL8tYk8LsIi6VOY3WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3Iq-00000000Z0Y-2kdp;
	Thu, 18 Jun 2026 03:20:28 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3In-00000000Yzz-2dTm
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 03:20:27 +0000
Received: from [192.168.0.107] (unknown [123.118.218.239])
	by APP-01 (Coremail) with SMTP id qwCowABX_NTnYzNqAuclAg--.5980S2;
	Thu, 18 Jun 2026 11:20:07 +0800 (CST)
Message-ID: <7c490aeb-a3d9-4fe9-81de-f9662577851d@iscas.ac.cn>
Date: Thu, 18 Jun 2026 11:20:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
To: Guo Ren <guoren@kernel.org>, zhangzhanpeng.jasper@bytedance.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, cuiyunhui@bytedance.com,
 iommu@lists.linux.dev, joro@8bytes.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, luxu.kernel@bytedance.com,
 palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
 tjeznach@rivosinc.com, will@kernel.org, yuanzhu@bytedance.com
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260615123821.373248-1-guoren@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260615123821.373248-1-guoren@kernel.org>
X-CM-TRANSID: qwCowABX_NTnYzNqAuclAg--.5980S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4kuw1UZF4kXw4rJryxXwb_yoW8ur4rpa
	n8Ww4UKF4ktF18Kw1qva1xZFW5G34vkayUCr4rKr9FvwnxZ3W3twnIgrW5u3WDJwn8uw1F
	qFW2qw1xuFWDuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU56yI5UUUUU==
X-Originating-IP: [123.118.218.239]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_202026_065878_862B24B4 
X-CRM114-Status: GOOD (  11.34  )
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

T24gNi8xNS8yNiAyMDozOCwgR3VvIFJlbiB3cm90ZToKPiBIaSBaaGFucGVuZyBaaGFuZywKPgo+
IEkgbm90aWNlZCB5b3UgcG9zdGVkIGEgc2ltaWxhciBmaXggcmVjZW50bHkuIEhvd2V2ZXIsIEkg
aGFkIGFscmVhZHkKPiBzdWJtaXR0ZWQgYSBzaW1pbGFyIHNvbHV0aW9uIGJhY2sgaW4gU2VwdGVt
YmVyIDIwMjUgWzFdLiBJdCB3b3VsZCBiZQo+IGdyZWF0IGlmIHlvdSBjb3VsZCByZXZpZXcgaXQu
IEEgZmV3IGNvbmNlcm5zIHdpdGggdGhlIGN1cnJlbnQgcGF0Y2g6Cj4KPiAxLiBVc2luZyBzcGlu
X2xvY2tfaXJxc2F2ZSBpbiBzdWNoIGEgc21hbGwgc2VtYW50aWMgc3RydWN0dXJlIGlzCj4gdW5u
ZWNlc3NhcnkuIElSUSBwcm90ZWN0aW9uIHNob3VsZCBiZSBwcm92aWRlZCBieSB0aGUgaGlnaGVy
LWxldmVsCj4gSU9NTVUgZHJpdmVyIGludGVyZmFjZXMuIE1hbnkgZXhpc3RpbmcgY2FsbCBzaXRl
cyBhbHJlYWR5IGhhbmRsZSBJUlEKPiBkaXNhYmxpbmcsIHNvIGFkZGluZyBpdCBoZXJlIGZlZWxz
IHJlZHVuZGFudCBhbmQgYWRkcyBhdm9pZGFibGUKPiBvdmVyaGVhZC4KPgo+IDIuIE1vcmUgY3Jp
dGljYWxseSwgdGhlIFJJU0NWX0lPTU1VXzMyQklUX0FDQ0VTUyBLY29uZmlnIG9wdGlvbiBpcwo+
IHByb2JsZW1hdGljLiBBY2NvcmRpbmcgdG8gdGhlIFJJU0MtViBJT01NVSBzcGVjaWZpY2F0aW9u
IChTb2Z0d2FyZQo+IEd1aWRlbGluZXMsIOKAnFJlYWRpbmcgYW5kIHdyaXRpbmcgSU9NTVUgcmVn
aXN0ZXJz4oCdKToKPgo+PiBSZWdpc3RlcnMgdGhhdCBhcmUgNjQtYml0IHdpZGUgbWF5IGJlIGFj
Y2Vzc2VkIHVzaW5nIGVpdGhlciBhIDMyLWJpdAo+PiBvciBhIDY0LWJpdCBhY2Nlc3MuCj4gVGhp
cyBjbGVhcmx5IHJlcXVpcmVzIHRoYXQgYW55IGhhcmR3YXJlIHN1cHBvcnRpbmcgNjQtYml0IE1N
SU8gYWNjZXNzCj4gbXVzdCBhbHNvIHN1cHBvcnQgMzItYml0IE1NSU8gYWNjZXNzLiBUaGVyZWZv
cmUsIHRoZSBJT01NVSBkcml2ZXIgc2hvdWxkCj4gYmUgYnVpbHQgb24gYSAzMi1iaXQgYWNjZXNz
IGJhc2UgZm9yIG1heGltdW0gaGFyZHdhcmUgY29tcGF0aWJpbGl0eS4KCkkgYWdyZWUgdGhhdCB0
aGUgZHJpdmVyIHNob3VsZCBiZSBidWlsZCB3aXRoIDMyLWJpdCBhY2Nlc3NlcyB0byBzdXBwb3J0
CnRoZXNlIGhhcmR3YXJlLiBIb3dldmVyIHRoZXJlJ3Mgb25lIG1pbm9yIHRoaW5nIHRoYXQgSSB3
YW50IHRvIHByb3Bvc2UKcmVnYXJkaW5nIHRoaXMsIGZvciB0aGUgc2FrZSBvZiBjbGFyaXR5OgoK
UklTQy1WIElPTU1VIGltcGxlbWVudGF0aW9ucyB0aGF0IGRvIG5vdCBzdXBwb3J0IDY0LWJpdCBh
Y2Nlc3NlcyBhcmUgbm90CmZ1bGx5IGNvbXBsaWFudCB3aXRoIHRoZSBSSVNDLVYgSU9NTVUgc3Bl
Y2lmaWNhdGlvbiBhbmQgc2hvdWxkIG5vdCB1c2UKdGhlIHN0YW5kYXJkIFJJU0MtViBpZGVudGlm
aWVycywgbmFtZWx5OgoKLSBEZXZpY2V0cmVlIGNvbXBhdGlibGUgcmlzY3YsaW9tbXUKLSBBQ1BJ
IEhJRCBSU0NWMDAwNAoKVGhpcywgaW4gbXkgb3BpbmlvbiwgaXMgbm90IG9ubHkgdGhlIHJpZ2h0
IHRoaW5nIHRvIGRvIChub3QgY2xhaW1pbmcgdG8KYmUgc3RhbmRhcmQgaGFyZHdhcmUgd2l0aG91
dCBhY3R1YWxseSBiZWluZyBzdGFuZGFyZCBoYXJkd2FyZSksIGJ1dCBhbHNvCnNhdmVzIGEgbG90
IG9mIHRyb3VibGUgZm9yIG9wZXJhdGluZyBzeXN0ZW0gZGV2ZWxvcGVycyAoeWVzLCB0aGVyZSBh
cmUKUklTQy1WIG9wZXJhdGluZyBzeXN0ZW1zIG90aGVyIHRoYW4gTGludXggb3V0IHRoZXJlKSwg
c2luY2UgaW52YWxpZCBJTwphY2Nlc3NlcyB1c3VhbGx5IG1hbmlmZXN0IGFzIG15c3RlcmlvdXMg
YWNjZXNzIGZhdWx0cyAodGhhdCB3b3VsZAp1c3VhbGx5IHN1Z2dlc3QgYW4gaW5jb3JyZWN0IElP
TU1VIGFkZHJlc3MpLCBvciB3b3JzZSwgc3lzdGVtIGhhbmdzLgoKSSB3b3VsZCBhcHByZWNpYXRl
IGlmIHRoZSBoYXJkd2FyZSB2ZW5kb3JzIHNoaXBwaW5nIDMyLWJpdC1hY2Nlc3Mtb25seQpJT01N
VXMgd291bGQgY29uc2lkZXIgdGhpcy4KClZpdmlhbiAiZHJhbWZvcmV2ZXIiIFdhbmcKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
