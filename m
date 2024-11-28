Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F24D69112
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHvMUeOyRenREPp4uByGDoy41XAHCkEY7avh0oOLeLM=; b=bvwvCh3qShSkbA
	F3t62BTsdUOqA/yjsM5jtaUYGco8nrPez23pxssp94sVqdMqjovglke76xC/Z4FrsaHhCZtwStxjn
	Ro5sSItByMovQjmU0t0hdO61Hb5AvaPVSvJit8ormF+BWWxvs6y0DYRVmuaQ0Z7Ff4B3EsW5yUmdp
	bTNdT1llLgMPpyfDe+qSrIdHdlhGATnFhRq+JFrQtJMdjbLDXmtcHaG1rMcBo4rDPEN9U6ja8InAn
	PlUojQqbBrHB1STRtVhI2TSWQtYr842MgL4ppoXrXqGGj4u4g0uKA3sWD5KVkvfknKg1dMN/W7Y6I
	fgx8NRre7t6+VQ9du+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfRe-0000000Fl1f-3qBk;
	Thu, 28 Nov 2024 14:24:38 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfRb-0000000Fkzc-4C2m
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 14:24:38 +0000
Received: from [192.168.2.4] (unknown [60.17.0.221])
	by APP-01 (Coremail) with SMTP id qwCowABnbHwbfUhnAxRVBg--.13292S2;
	Thu, 28 Nov 2024 22:24:28 +0800 (CST)
Message-ID: <c5971ce3de4e5f59e8013b1c6a5bf4158c69e6b8.camel@iscas.ac.cn>
Subject: Re: [PATCH v2] riscv: module: use a plain variable for list_head
 instead of a pointer
From: laokz <zhangkai@iscas.ac.cn>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, Paul Walmsley
	 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 28 Nov 2024 22:24:27 +0800
In-Reply-To: <20241128-0e953467c518d79d12dbf202@orel>
References: <20241127142519.3038691-1-cleger@rivosinc.com>
	 <980b98978ab4ee912b37cb101ad43bce20b56dcb.camel@iscas.ac.cn>
	 <20241128-0e953467c518d79d12dbf202@orel>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CM-TRANSID: qwCowABnbHwbfUhnAxRVBg--.13292S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw48XFWfWFy5tr1fJFyrJFb_yoWfurgE9F
	yxZ34kWw1qgF17AanrKrs2vr93tr45Jr1UXryYqrsxZa4fWa95Zr18Ar95Zwn5JFsIy34a
	vFs8XryxtF97ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb28YjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k2
	0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
	8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
	IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bYYLPUUUUU=
X-Originating-IP: [60.17.0.221]
X-CM-SenderInfo: x2kd0wxndlqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_062436_400178_8CE793CD 
X-CRM114-Status: GOOD (  16.32  )
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

T24gVGh1LCAyMDI0LTExLTI4IGF0IDA5OjMyICswMTAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4g
T24gVGh1LCBOb3YgMjgsIDIwMjQgYXQgMDk6MDE6NTJBTSArMDgwMCwgbGFva3ogd3JvdGU6Cj4g
PiBPbiBXZWQsIDIwMjQtMTEtMjcgYXQgMTU6MjUgKzAxMDAsIENsw6ltZW50IEzDqWdlciB3cm90
ZToKPiA+ID4gcmVsX2hlYWQncyBsaXN0X2hlYWQgbWVtYmVyLCByZWxfZW50cnksIGRvZXNuJ3Qg
bmVlZCB0byBiZQo+ID4gPiBhbGxvY2F0ZWQsCj4gPiA+IGl0cyBzdG9yYWdlIGNhbiBqdXN0IGJl
IHBhcnQgb2YgdGhlIGFsbG9jYXRlZCByZWxfaGVhZC4gUmVtb3ZlCj4gPiA+IHRoZQo+ID4gCj4g
PiBPaCBteSBwb29yIEVuZ2xpc2guIE9LLCBpdCdzIG1vcmUgYmV0dGVyIHRoYW4ganVzdCBhZGQg
dGhlIGxvc3QKPiA+IGtmcmVlLgo+ID4gCj4gCj4gSXQgd2Fzbid0IHRoZSBFbmdsaXNoIEkgd2Fz
IGNvcnJlY3RpbmcuIFRoYXQgd2FzIGZpbmUsIGJ1dCBqdXN0Cj4gc2F5aW5nCj4gdGhlIG9iamVj
dCBjb3VsZCBiZSAiYSBwbGFpbiB2YXJpYWJsZSIgd2Fzbid0IGdpdmluZyBhbnkKPiBqdXN0aWZp
Y2F0aW9uCj4gZm9yIHRoZSBjaGFuZ2UgYW5kLCB0byBtZSwgZXZlbiBpbXBsaWVkIHRoYXQgcmVs
X2VudHJ5IHdhcyBsb2NhbGx5Cj4gc2NvcGVkLiBTbywgd2hlbiBJIGZpcnN0IHNraW1tZWQgdGhl
IHBhdGNoIGFuZCBzYXcgdGhhdCBpdCB3YXMKPiBnZXR0aW5nCj4gYXBwZW5kZWQgdG8gYSBsaXN0
LCBJIGFsbW9zdCBzdGF0ZWQgdGhlIHBhdGNoIHdhcyB3cm9uZy4gSXQgd2FzIGNsZWFyCj4gYWZ0
ZXIgbG9va2luZyBjbG9zZXIsIGJ1dCBpdCBjb3VsZCBoYXZlIGJlZW4gY2xlYXIgdGhlIGZpcnN0
IHRpbWUKPiB0aHJvdWdoIGlmIHRoZSBjb21taXQgbWVzc2FnZSBoYWQgYmV0dGVyIGd1aWRlZCBt
ZS4KClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLgpsYW9regoKPiBUaGFua3MsCj4gZHJldwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
