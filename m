Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8E8CD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 10:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j37SgC0QNrwCiFc+GB31691dgjUh0qDyRGWCXPRETMc=; b=3rawynMwPHUhIi
	qYElyVoCtAnpUGor5GWTJsVKcGzg6Hp+nbke9vuRRahrmF2v39qArQ1L7ZhNCzrb2ynJ1H+WtOoZj
	fmq6k1SKmGo5eX9mciPMVK781ATrfqO6KvNiX8y3ZoiDD9STcbIKg4c/mgRCqwiBS2sLVAeuQ1I2h
	gBW5Ak2zNkHcOp8v/zDlCIHq74N8/cjuZ9QsAm/2XpPCSxq9YguWIR8rM0Z5kX+7IfO0/fq64sR9g
	AAQVmYGz2QORse7UAyaGrKGCM8P8uLDXvbziIQBdaJ6e/U/5VbupiGorRwXygZ5bj2ESimYMMoUyS
	E8EhZHfr4Q2oqAAkM1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9ZP-000000012TS-13tc;
	Thu, 18 Jun 2026 10:01:59 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9ZL-000000012Sp-37yx
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 10:01:57 +0000
Received: from [192.168.0.107] (unknown [123.118.218.239])
	by APP-01 (Coremail) with SMTP id qwCowAC3WtMHwjNqx7MxAg--.8767S2;
	Thu, 18 Jun 2026 18:01:43 +0800 (CST)
Message-ID: <ce3c80ae-fca0-4728-a93c-778dcbab32f2@iscas.ac.cn>
Date: Thu, 18 Jun 2026 18:01:43 +0800
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
 <7c490aeb-a3d9-4fe9-81de-f9662577851d@iscas.ac.cn>
 <CAJF2gTQ+-gpvUDtOh99aKP2-iDJy3MYOWti9k2Ntd0-J0MXqxQ@mail.gmail.com>
 <e051d822-d0be-4a88-ba86-ec9b5905fd1e@iscas.ac.cn>
 <CAJF2gTRH6x78A3J5HJ5kUM47aDv8R0yFr8LRP+7jiLX4GL3ssg@mail.gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <CAJF2gTRH6x78A3J5HJ5kUM47aDv8R0yFr8LRP+7jiLX4GL3ssg@mail.gmail.com>
X-CM-TRANSID: qwCowAC3WtMHwjNqx7MxAg--.8767S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1UKry8tw1UGFyxZF17trb_yoW8ur47pF
	4DWFnFgF4DJr1IvwnFvw47ZFWfCaySkrZ8CryUK34kurn5uFy8tr47tay5Ww1kGw4kCw1r
	KF42g343Ca1vkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU8IJPtUUUUU==
X-Originating-IP: [123.118.218.239]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_030156_165085_C123DB6D 
X-CRM114-Status: GOOD (  12.09  )
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

Ck9uIDYvMTgvMjYgMTc6NTEsIEd1byBSZW4gd3JvdGU6Cj4gSGkgVml2aWFuLAo+Cj4gQXMgbm90
ZWQgaW4gdGhlIFJJU0MtViBJT01NVSBTcGVjaWZpY2F0aW9uLCBDaGFwdGVyIDY6Cj4+IFdoZXRo
ZXIgYW4gOC1ieXRlIGFjY2VzcyB0byBhbiBJT01NVSByZWdpc3RlciBpcyBzaW5nbGUtY29weSBh
dG9taWMgaXMgVU5TUEVDSUZJRUQsIGFuZCBzdWNoIGFuIGFjY2VzcyBtYXkgYXBwZWFyLCBpbnRl
cm5hbGx5IHRvIHRoZSBJT01NVSwgYXMgaWYgdHdvIHNlcGFyYXRlIDQtYnl0ZSBhY2Nlc3NlcyDi
gJQgZmlyc3QgdG8gdGhlIGhpZ2ggaGFsZiBhbmQgc2Vjb25kIHRvIHRoZSBsb3cgaGFsZiDigJQg
d2VyZSBwZXJmb3JtZWQuCj4gVGhlcmVmb3JlLCB0aGUgYXRvbWljaXR5IG9mIDY0LWJpdCBNTUlP
IGFjY2Vzc2VzIGlzIFVOU1BFQ0lGSUVEIGFuZAo+IG5vdCBjbGVhcmx5IGRlZmluZWQgaW4gdGhl
IGN1cnJlbnQgcmF0aWZpZWQgUklTQy1WIElPTU1VCj4gc3BlY2lmaWNhdGlvbi4gVG8gaGFuZGxl
IHRoaXMgY29ycmVjdGx5LCB0aGUgTGludXggUklTQy1WIElPTU1VIGRyaXZlcgo+IHNob3VsZCBm
YWxsIGJhY2sgdG8gMzItYml0IE1NSU8gYWNjZXNzZXMgd2hlbiByZWFkaW5nIDY0LWJpdCByZWdp
c3RlcnMKPiAoZS5nLiwgcGVyZm9ybWFuY2UgY291bnRlcnMpLiBUaGUgYmVoYXZpb3Igb2YgMzIt
Yml0IE1NSU8gYWNjZXNzZXMgaXMKPiBtb3JlIHByZWNpc2VseSBkZWZpbmVkIGluIHRoZSBSSVND
LVYgSU9NTVUgc3BlY2lmaWNhdGlvbi4KPgo+IFRodXMsIG1hbnkgaGFyZHdhcmUgdmVuZG9ycyBp
bXBsZW1lbnQgMzItYml0IE1NSU8gKHJhdGhlciB0aGFuIDY0LWJpdAo+IE1NSU8pIGJhc2VkIG9u
IHRoZSBjdXJyZW50IHJhdGlmaWVkIFJJU0MtViBJT01NVSBzcGVjaWZpY2F0aW9uLCBhbmQKPiB0
aGlzIGRyaXZlciBkb2VzIG5vdCBhcHBlYXIgdG8gYmVuZWZpdCBmcm9tIDY0LWJpdCBNTUlPIGFj
Y2VzcyBlaXRoZXIuCj4gUGVyZm9ybWFuY2UgaXMgZnVuZGFtZW50YWxseSBjb25zdHJhaW5lZCBi
eSBidXMgbGF0ZW5jeTsgYXNzdW1pbmcgdGhhdAo+IHNpbXBseSByZWR1Y2luZyB0aGUgbnVtYmVy
IG9mIGFjY2Vzc2VzIHdpbGwgaW1wcm92ZSBwZXJmb3JtYW5jZSBpcyBhbgo+IG92ZXJzaW1wbGlm
aWNhdGlvbiB0aGF0IGlnbm9yZXMgdGhlIHVuZGVybHlpbmcgaGFyZHdhcmUKPiBjaGFyYWN0ZXJp
c3RpY3MuCgpKdXN0IGFzIGEgY2xhcmlmaWNhdGlvbiwgSSBoYWQgbmV2ZXIgc2FpZCB0aGF0IHRo
ZSBkcml2ZXIgKnNob3VsZCogdXNlCjY0LWJpdCBhY2Nlc3Nlcy4gSW4gZmFjdCwgSSBzYWlkOgoK
ICAgIEkgYWdyZWUgdGhhdCB0aGUgZHJpdmVyIHNob3VsZCBiZSBidWlsZCB3aXRoIDMyLWJpdCBh
Y2Nlc3NlcyB0byBzdXBwb3J0CiAgICB0aGVzZSBoYXJkd2FyZS4KClBlcmhhcHMgSSB3YXNuJ3Qg
Y2xlYXIgZW5vdWdoLiBJIG1lYW50IHRoYXQgSSBhZ3JlZSB0aGF0IHRoZSBSSVNDLVYKSU9NTVUg
ZHJpdmVyIHNob3VsZCB1c2UgMzItYml0IGFjY2Vzc2VzLiBBdCAqbm8qIHBvaW50IGhhZCBJIGNs
YWltZWQKdGhhdCA2NC1iaXQgYWNjZXNzZXMgYXJlIGJldHRlci4KCj4gSGkgWmhhbmcsCj4KPiBU
aGUgaGFyZHdhcmUgdGFyZ2V0ZWQgYnkgdGhlIDMyLWJpdCBNTUlPIGFjY2VzcyBpbiB5b3VyIHBh
dGNoIGlzCj4gcHJlY2lzZWx5IHRoZSBraW5kIHRoYXQgZGVzZXJ2ZXMgdGhlIG9mZmljaWFsIEFD
UEkgSElEIFJTQ1YwMDA0IGFuZAo+IERldmljZXRyZWUgY29tcGF0aWJsZSBzdHJpbmcgKHJpc2N2
LGlvbW11KS4gSXQgaXMgcmF0aGVyIHRoZSBoYXJkd2FyZQo+IHRoYXQgc3VwcG9ydHMgb25seSA2
NC1iaXQgTU1JTyBhY2Nlc3Mg4oCUIHdob3NlIGF0b21pY2l0eSBpcyBleHBsaWNpdGx5Cj4gWy4u
Ll0KCklPTU1VIEhhcmR3YXJlIHRoYXQgc3VwcG9ydHMgb25seSA2NC1iaXQgTU1JTyBhY2Nlc3Mg
Zm9yIDgtYnl0ZQpyZWdpc3RlcnMgaGFzIG5ldmVyIGNvbWUgdXAgaW4gdGhpcyBkaXNjdXNzaW9u
LiBJZiB0aGV5IGV2ZXIgc2hvdyB1cAp3ZSdsbCB0YWxrIGFib3V0IHRoZW0gdGhlbi4KClZpdmlh
biAiZHJhbWZvcmV2ZXIiIFdhbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
