Return-Path: <SRS0=8Mga=OI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380EAC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Sep 2021 14:27:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCA4D61268
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Sep 2021 14:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCA4D61268
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DMGn9hrYnvH6VC1R2DYdmTcbTmM0VUeoCOAqMXB8faI=; b=DGSVsCuLEUAQai
	06XvZJJFR83KpNPdaCIV+SlN6jUQah1DaB10jsz9M94OLpY62xViQsiJCGXUZJvUy6AX7JhaHnHr0
	9or1nsuoLdDN5agRTmT3P4jgyfEKLpJZnEEDE6+GUfz8kRJoziURj331Ll7qc0ny0Hh77wNd2haar
	kSh9MgUiTJsUuHg4rORgEdspVkhCmPoBkgD/EdOjfziXPGiWQGLxbhF7FiF9YOlpqR6AIN2qIjO51
	rdTvb12V/la5hV5oa78WSq+HyWuUtH3mjwZobawuRXtQfsAdRQNVhsOR82LtU6U2qN89IxW92KWSm
	ANk/nBMKzNTTnJoEjtZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRbJJ-00FzaH-AQ; Sat, 18 Sep 2021 14:27:21 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRbJF-00FzZv-Vm
 for linux-riscv@lists.infradead.org; Sat, 18 Sep 2021 14:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=O9s+v97slSlEz4dFwABDF3CxD3H1mOPozU
 ZugZDF7mg=; b=MnsCHbPaLklBGJv0fY0mPqCjiqjWrvbuZD6gmpahlKyR3EiM9u
 xxdBvv2zTsa78u3trd5x+B63qoLMvnZOuEaLZLJR3sT24y6gFDernEiEVaedliiW
 1OeXpoThnmE2qBe5DtctJiOfMh5r/dSSX74KSS0mDND4ipWG/F6bpV+K8=
Received: from xhacker (unknown [101.86.20.138])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBXX7tE90VhngEZAA--.6928S2; 
 Sat, 18 Sep 2021 22:27:16 +0800 (CST)
Date: Sat, 18 Sep 2021 22:20:48 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [Request for help] issue when add relative extable support to
 riscv64
Message-ID: <20210918222048.1e90488e@xhacker>
In-Reply-To: <7908d27b-1042-61f5-fc8e-f5b00f623b89@huawei.com>
References: <20210917235733.6240d6d3@xhacker> <20210918002603.58c5a030@xhacker>
 <7908d27b-1042-61f5-fc8e-f5b00f623b89@huawei.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBXX7tE90VhngEZAA--.6928S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyxtFyrtF1DCFWxZF18Zrb_yoW8ury8pr
 y8JF1UJryUJr18Jr1Utr1UJryUJr1UJw1UGr4UJF1UJr1UJr1jqr1UXr1jgryUJr48Jw1U
 Jr1UXr1UZr1UArUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
 Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
 W3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
 JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8olk3UUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210918_072718_502998_E3275DE4 
X-CRM114-Status: GOOD (  15.65  )
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

T24gU2F0LCAxOCBTZXAgMjAyMSAwOToyMzo0OCArMDgwMApLZWZlbmcgV2FuZyA8d2FuZ2tlZmVu
Zy53YW5nQGh1YXdlaS5jb20+IHdyb3RlOgoKPiBPbiAyMDIxLzkvMTggMDoyNiwgSmlzaGVuZyBa
aGFuZyB3cm90ZToKPiA+IE9uIEZyaSwgMTcgU2VwIDIwMjEgMjM6NTc6MzMgKzA4MDAgSmlzaGVu
ZyBaaGFuZyB3cm90ZToKPiA+ICAKPiA+PiBIaSwKPiA+Pgo+ID4+IE5vdyB0aGUgZXh0YWJsZSBl
bnRyeSBjb250YWlucyAxNmJ5dGVzIGZvciByaXNjdjY0IC0tIDhieXRlcyBmb3IgdGhlIGluc24g
YW5kCj4gPj4gYW5vdGhlciA4Ynl0ZXMgZm9yIHRoZSBmaXh1cC4gVGhpcyB3YXN0ZXMgbWVtIGEg
Yml0LiBJIHRoaW5rIHdlIGNhbiBhZGQKPiA+PiB0aGUgcmVsYXRpdmUgZXh0YWJsZSBzdXBwb3J0
LiBBIGRyYWZ0IHBhdGNoIHB1dCBhdCB0aGUgZW5kIG9mIHRoaXMgbWFpbC4gQnV0Cj4gPj4gSSBt
ZXQgYWJub3JtYWwgYnVpbGQgZXJyb3JzOgo+ID4+Cj4gPj4gRkFUQUw6IG1vZHBvc3Q6IFRoZSBy
ZWxvY2F0aW9uIGF0IF9fZXhfdGFibGUrMHgwIHJlZmVyZW5jZXMKPiA+PiBzZWN0aW9uICJfX2V4
X3RhYmxlIiB3aGljaCBpcyBub3QgZXhlY3V0YWJsZSwgSU9XCj4gPj4gaXQgaXMgbm90IHBvc3Np
YmxlIGZvciB0aGUga2VybmVsIHRvIGZhdWx0Cj4gPj4gYXQgdGhhdCBhZGRyZXNzLiAgU29tZXRo
aW5nIGlzIHNlcmlvdXNseSB3cm9uZwo+ID4+IGFuZCBzaG91bGQgYmUgZml4ZWQuICAKPiAKPiBJ
IHRyeSB0aGlzIGJlZm9yZSwgYW5kIG1lZXQgdGhlIHNhbWUgaXNzdWUswqAgYW5kIGFkZCBub3Jl
bGF4IHRvIHRoZSBsYWJlbCwKPiAKPiBidXQgaXQgd29uJ3QgZml4IHRoZSBlcnJvci4gc2VlbXMg
dGhhdCB3ZSBjb24ndCBmaW5kIHRoZSBsYWJsZSBmcm9tIHRoZSAKPiB0ZXh0PwoKSSBhbHNvIHRy
aWVkIGFkZGluZyAtLW5vLXJlbGF4IHRvIExERkxBR1MgYW5kIC1tbm8tcmVsYXggdG8gQUZMQUdT
IGFuZCBDRkxBR1MKYnV0IHN0aWxsIG1ldCB0aGUgZXJyb3IuIFRoaXMgaXMgYW4gaW5zdGVyZXN0
aW5nIGlzc3VlLgoKVGhhbmtzCgo+IAo+IAo+ICDCoDgyIGluZGV4IDFiMDBiYWRiOWY4Ny4uY2Ix
YWNhOGU4YTIzIDEwMDY0NAo+ICDCoDgzIC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnV0
ZXguaAo+ICDCoDg0ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnV0ZXguaAo+ICDCoDg1
IEBAIC0yMywxNyArMjMsMTggQEAKPiAgwqA4NsKgwqDCoMKgwqDCoMKgwqAgdWludHB0cl90IHRt
cDsgXAo+ICDCoDg3wqDCoMKgwqDCoMKgwqDCoCBfX2VuYWJsZV91c2VyX2FjY2VzcygpOyBcCj4g
IMKgODjCoMKgwqDCoMKgwqDCoMKgIF9fYXNtX18gX192b2xhdGlsZV9fICggXAo+ICDCoDg5ICvC
oMKgwqDCoMKgwqAgIsKgwqDCoMKgwqDCoCAub3B0aW9uIHB1c2jCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXG4iIFwKPiAgwqA5MCArwqDCoMKg
wqDCoMKgICLCoMKgwqDCoMKgwqAgLm9wdGlvbiBub3JlbGF4wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFxuIiBcCj4gIMKgOTEgK8KgwqDCoMKgwqDCoCAi
wqDCoMKgwqDCoMKgIC5vcHRpb24gbm9ydmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFxuIiBcCj4gIMKgOTLCoMKgwqDCoMKgwqDCoMKgICIxOsKg
wqDCoMKgICIgaW5zbiAiwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgXG4iIFwKPiAgwqA5MyArwqDCoMKgwqDCoMKgICLCoMKgwqDC
oMKgwqAgLm9wdGlvbiBwb3DCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBcbiIgXAo+ICDCoDk0wqDCoMKgwqDCoMKgwqDCoCAiMjrCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFxuIiBcCj4gCj4gCj4gCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
