Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC01CEB364A
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 02:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHnQiCAao6tnRLhgV3/I7i2/Ez3LQEQRP31pT8/RAaI=; b=yVNpQEtoCQZoSE
	X4EnrIfLeB2xOLiBzgQKFirz9GQu2gtvaC0Ou4MCOHXutpMzasVIv14ubGSxYgmIP5dGr8WH+Rpr1
	6/R3ziaYFnHTvbZKtv9BrzodSWGRKdm2ISxbSdBiXh9FyAQsCZAekYCuV+PtNsUGakjupEAcei2BU
	9RKKj9XOAGMkSIOvL+pZDEt4gDx+LvVIcNXfv6USjJKp0XOKpmlO9Kr2fNIfOi+cTOd+m5RKydl0E
	Yp981oqDqp6HOl7iZ6VUpZDwFnaeI6lteA/XTjHzVEZT8B/yHvGIBY7ib8o+cGap2EHA+S0l8fPTd
	OWz9/+i4XRe2jg0/lmUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxFEZ-0000000ENuq-1owe;
	Tue, 03 Mar 2026 02:11:39 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxFEX-0000000ENuN-0hM5
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 02:11:38 +0000
Received: from [10.213.20.192] (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowADXbBBMQ6ZpW2KNCQ--.3697S2;
	Tue, 03 Mar 2026 10:11:24 +0800 (CST)
Message-ID: <a4799df1-73d9-4653-b64c-7dd833ca0397@iscas.ac.cn>
Date: Tue, 3 Mar 2026 10:11:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] riscv: mm: Rename new_vmalloc into new_valid_map_cpus
To: Alexander Potapenko <glider@google.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, Palmer Dabbelt <palmer@rivosinc.com>
References: <20260302-handle-kfence-protect-spurious-fault-v1-0-25c82c879d9c@iscas.ac.cn>
 <20260302-handle-kfence-protect-spurious-fault-v1-1-25c82c879d9c@iscas.ac.cn>
 <CAG_fn=UQj+bdY2YojmfVf=qRQgCttD=PqE0h=vm4pAbtNRP-uw@mail.gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <CAG_fn=UQj+bdY2YojmfVf=qRQgCttD=PqE0h=vm4pAbtNRP-uw@mail.gmail.com>
X-CM-TRANSID: zQCowADXbBBMQ6ZpW2KNCQ--.3697S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw47XF1fZryruFW3WF1xZrb_yoW8Xw1fpF
	Z3CFn5KFy5Cryfuw1avrsFgr1rtwnYg3Way398K34vvw4qyFy7tr1DKr1xuryUXFW8Jr40
	kFW3ua4rCw1jyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxU2yxRUUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_181137_582720_0DCD7C5C 
X-CRM114-Status: GOOD (  11.43  )
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

T24gMy8yLzI2IDIzOjQxLCBBbGV4YW5kZXIgUG90YXBlbmtvIHdyb3RlOgo+IE9uIE1vbiwgTWFy
IDIsIDIwMjYgYXQgMzoyMeKAr0FNIFZpdmlhbiBXYW5nIDx3YW5ncnVpa2FuZ0Bpc2Nhcy5hYy5j
bj4gd3JvdGU6Cj4+IEluIHByZXBhcmF0aW9uIG9mIGEgZnV0dXJlIHBhdGNoIHVzaW5nIHRoaXMg
bWVjaGFuaXNtIGZvciBub24tdm1hbGxvYwo+PiBtYXBwaW5ncywgcmVuYW1lIG5ld192bWFsbG9j
IGludG8gbmV3X3ZhbGlkX21hcF9jcHVzIHRvIGF2b2lkIG1pc2xlYWRpbmcKPj4gcmVhZGVycy4K
Pj4KPj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFZpdmlhbiBXYW5nIDx3YW5ncnVpa2FuZ0Bpc2Nhcy5hYy5jbj4KPj4gLS0tCj4+ICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCB8ICA2ICsrKy0tLQo+PiAgYXJjaC9yaXNjdi9r
ZXJuZWwvZW50cnkuUyAgICAgICAgICAgfCAzOCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tCj4+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAgICAgICAgICAgICB8ICAyICst
Cj4+ICAzIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+PiBpbmRleCAwMDkyNTEzYzMzNzYu
LmI2ZDFhNWViNzU2NCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNo
ZWZsdXNoLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPj4g
QEAgLTQxLDcgKzQxLDcgQEAgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+PiAgfSB3aGlsZSAoMCkKPj4KPj4gICNpZmRlZiBDT05GSUdfNjRC
SVQKPj4gLWV4dGVybiB1NjQgbmV3X3ZtYWxsb2NbTlJfQ1BVUyAvIHNpemVvZih1NjQpICsgMV07
Cj4+ICtleHRlcm4gdTY0IG5ld192YWxpZF9tYXBfY3B1c1tOUl9DUFVTIC8gc2l6ZW9mKHU2NCkg
KyAxXTsKPiBuZXdfdmFsaWRfbWFwX2NwdXMgaXMgYSBiaXRtYXAsIHJpZ2h0PyBJZiBzbywgeW91
IGFyZSBhbGxvY2F0aW5nIDh4Cj4gbW9yZSBtZW1vcnkgdGhhbiBuZWVkZWQuCj4gQ2FuIHdlIHVz
ZSBERUNMQVJFX0JJVE1BUCBpbnN0ZWFkPwoKSSBoYWRuJ3QgY29uc2lkZXJlZCBjaGFuZ2luZyBz
aW5jZSB0aGlzIHNlcmllcyBpcyBzdXBwb3NlZCB0byBiZSBqdXN0IGEKZml4LCBidXQgdGhhdCBp
cyBhIGdvb2QgcG9pbnQuCgpJJ2xsIHJlb3JnYW5pemUgdGhpcyBpbiB2MiB0byBpbmNsdWRlIGEg
Zml4IHRvIHVzZSBERUNMQVJFX0JJVE1BUCwgYW5kCmFsc28gdXNlIGJpdG1hcCBvcGVyYXRpb25z
IGZvciB0aGUgbWFya2luZyBvcGVyYXRpb24uIEJ1dCBJJ2xsIGxlYXZlCnRoYXQgb3V0IG9mIGNv
bnNpZGVyYXRpb24gZm9yIHN0YWJsZSBiYWNrcG9ydCwgbWF5YmUgYWxvbmcgd2l0aCB0aGUKcmVu
YW1pbmcuCgpUaGFua3MsClZpdmlhbiAiZHJhbWZvcmV2ZXIiIFdhbmcKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
