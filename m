Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F884C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 10:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4qnfmX0Bbgl/S26GLrCILa2M7fDaILnrOs7WzsNzKo=; b=3jjo5BtS8BzaGx
	lfCFqIHeWu9dH71A6EsxPuJbGuLo/wH0EWMeFjSPIv7unsPN53dAXtyJdXhSROwSXu5+yYibmKWQl
	PQpOinUWji5SDMHv7zWS+VLeL6rhaoKfkjoHVg5Km6fBR60eYVsrG9Pdl6h61Y4Mo6aPBx8H+9R3Y
	2syq+zarUXZ+LMvYZE4iqcZY4fkS91wmDVeS0NGKbGCBe1I6oeIvBTbt5mDsYJJcbWZrsVM2EtzB7
	zH77TITErC5zTqGPLb9nOS1vvqSEztGDKsk+GAZ7lBEvkFr8zYKZjHftd/mLC1bln+HX9l+tmrlcM
	8CLepgOrJQiSGXiPSMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Ivy-0000000CAMN-48R8;
	Fri, 26 Apr 2024 10:36:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Ivx-0000000CALj-09Ka
	for linux-riscv@bombadil.infradead.org;
	Fri, 26 Apr 2024 10:36:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=jjkaR6jLA+/8nCnDNADluM1+Kz8u3y5w0SvwINmy3CY=; b=tG5/aKjDp60UV8cY0vD1661zsf
	XOpwHD/KKkI/4fZoVkEcShou9mSnM+dNDIVdFjt6fNharyk9on86oRpr8M5eE3nCBmYLhaRSs0Udy
	lpeqC70pCECMeYWl4qbpCOzI4OCTYBuZ9521dnLNXqBoytQ4KuCTXc5hQYJw3PD3REoG+CVIMQyWu
	SJIc0VVqdO4vuOWB64dEL7DVxRE5xd0RnxX9lEezbaMvAV45lMPA9imowUvKuNtn53iA62XZuP76E
	1H8yxp+chAiC5cq+Y3YtM8ozfQlSGGLFPfLUUdWjY/fLdwR+O2nLKCuGCpf9XZ/lAiX7xel10PHvy
	fTg6X3zg==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Ivs-000000051hd-2ECj
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 10:35:59 +0000
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8BxN+mCgytmIGsDAA--.1892S3;
	Fri, 26 Apr 2024 18:35:46 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxlFZ_gytm0zMGAA--.3023S3;
	Fri, 26 Apr 2024 18:35:45 +0800 (CST)
Message-ID: <9cae4c4a-55a6-4c6c-9780-866f796a52c0@loongson.cn>
Date: Fri, 26 Apr 2024 18:35:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to
 6.9-rc4
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, corbet@lwn.net, alex.gaynor@gmail.com,
 wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com,
 morbo@google.com, justinstitt@google.com, alexs@kernel.org,
 dzm91@hust.edu.cn, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org
References: <cover.1714113680.git.siyanteng@loongson.cn>
 <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
Content-Language: en-US
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
X-CM-TRANSID: AQAAf8BxlFZ_gytm0zMGAA--.3023S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GF1kCr18AFWfKFyrtr1fuFX_yoWkXrb_Aa
	sYyay7tw1kJF4kCFWfJr43uFs7X3y8Cw1DJr1Iqw17Xr95AFZ7uFZxK34S9F4Iqw4rCr1D
	Kr10gayS9343uosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
	JF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUc7PEDUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_113557_188805_8DCF60DA 
X-CRM114-Status: GOOD (  10.46  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CuWcqCAyMDI0LzQvMjYgMTU6MzcsIE1pZ3VlbCBPamVkYSDlhpnpgZM6Cj4+IHYyOgo+PiAqIEFz
IE1pZ3VlbCdzIGNvbW1lbnRzLCB0cmFuc2xhdGUgY29tbWl0IDAxODQ4ZWVlMjBjNgo+PiAgICBp
bnRvIENoaW5lc2UsIGFzIHdlbGwgYXMgY29tbWl0IDgxODg5ZTg1MjNlNi4gQnkgdGhlIHdheSwK
Pj4gICAgdGhlc2UgdHdvIHBhdGNoZXMgaGF2ZW4ndCBhcHBlYXJlZCBpbiB0aGUgZG9jIGRldmVs
b3BtZW50Cj4+ICAgIHRyZWUgeWV0LCBtYXliZSB3ZSBjb3VsZCBjb25zaWRlciBtZXJnaW5nIHRo
ZW0gaW50byB0aGUKPj4gICAgcnVzdCB0cmVlPwo+IFRoZSBmb3JtZXIgaXMgaW4gYHJ1c3QtZml4
ZXNgLCB3aGljaCB3aWxsIGJlIHNlbnQgdG8gTGludXMgZm9yIHRoaXMKPiBjeWNsZS4gU28gdGhl
IEVuZ2xpc2ggZG9jcyB3aWxsIGJlIHVwZGF0ZWQgc29vbmVyIHRoYW4gdGhlc2UgdXBkYXRlcywK
PiBpZiB0aGF0IGlzIHdoYXQgeW91IGFyZSBhc2tpbmcuCgpXZWxsLCBpdCBzZWVtcyB0aGF0IHdl
IHdpbGwgaGF2ZSB0byB3YWl0IGZvciB0aGUgZG9jIHRyZWUsIGJlY2F1c2UgdGhlIApDaGluZXNl
Cgp0cmFuc2xhdGlvbiBpcyBub3cgY2FycmllZCBvdXQgdW5kZXIgdGhlIGRvYyB0cmVlLgoKPgo+
IEZvciB0aGUgb3RoZXIgb25lLCBpdCBpcyBpbiB0aGUgUklTQy1WIHRyZWUgYW5kIEkgYXNzdW1l
IGl0IHdpbGwgYmUKPiBzZW50IGludG8gdGhlIG5leHQgbWVyZ2Ugd2luZG93LiBJIGRvbid0IGtu
b3cgaG93IHlvdSBub3JtYWxseSBoYW5kbGUKPiB0aGF0IChpLmUuIHRyYW5zbGF0aW9ucyBiZWlu
ZyB1cGRhdGVkIGF0IHRoZSBzYW1lIHRpbWUgb3IgYWZ0ZXIgYQo+IGN5Y2xlKSwgYnV0IGVpdGhl
ciB3YXksIEkgYW0gbm90IHN1cmUgd2h5IHlvdSB3b3VsZCB3YW50IHRoZW0gdG8gYmUKPiBtZXJn
ZWQgaW50byB0aGUgUnVzdCB0cmVlPwoKSSdtIHRoaW5raW5nIHRoYXQgSSdtIHR3byBjb21taXRz
IGFoZWFkIG9mIHRoZSBkb2MgdHJlZSwgaXQgZG9lc24ndCBzZWVtIAp0byBmaXQKCm1lcmdlIGlu
dG8gdGhlIGRvYyB0cmVlIGluIHRoaXMgd2luZG93LCBhbmQgdGhlcmUgbWlnaHQgYmUgY29uZmxp
Y3RzIG9uCgpsaW51eC1uZXh0IGlmIEkgc3BsaXRlIHRoZSBwYXRjaCBvdXQgbW9yZS4KCgpUaGFu
a3MsCgpZYW50ZW5nCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
