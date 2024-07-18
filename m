Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2B8C3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 01:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IzmyVKIegZ8EY+aMzE8mu0BAhlDG+vMXQP4DWKguTSE=; b=DJZeaXlpI8wCGK
	ahrwQg2gOhw/uOkMKVAoHaCiOMI6jxc93PqiA9c+x++rYoY1Rt5X+cInGQVlyN/0TjCY964BEijs0
	8nS6e3xf82+ncV5QK4m0j7M+i+PowXIT/rCyZpz/Ackk5DlmFr7kV//tUC44sERKtKmjt8sopl5OY
	eWs+vCWGC8f+9rzvoIpFGfnJ2S16ImY9kqeK4J5o62IH0pRg2DpfdcOyQvR0bGmmye+GrRGlPUZjW
	2MTF1lfwXNTRPMXUIEnXINE2z0hZijeKAIXaqRq2/LehhaL5heplkatPogQThpihBI9NKcpi6amai
	JMwaC4Q1ofKVD9r8plmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUG2U-0000000FR3m-1uGS;
	Thu, 18 Jul 2024 01:34:34 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUG2S-0000000FR2i-0CNS
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 01:34:33 +0000
Received: from [198.18.0.1] (unknown [180.110.112.93])
	by APP-05 (Coremail) with SMTP id zQCowACHj+cfcZhm7IrnAw--.9704S2;
	Thu, 18 Jul 2024 09:34:24 +0800 (CST)
Message-ID: <70bd489b-2a9f-4be3-86db-0a131abee8ab@iscas.ac.cn>
Date: Thu, 18 Jul 2024 09:34:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: add tracepoints for page fault
To: Matthew Wilcox <willy@infradead.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240715101400.39103-1-zhuhengbo@iscas.ac.cn>
 <20240717082728.84401-1-zhuhengbo@iscas.ac.cn>
 <ZpfbVzwT5flLqatZ@casper.infradead.org>
From: Zhu Hengbo <zhuhengbo@iscas.ac.cn>
In-Reply-To: <ZpfbVzwT5flLqatZ@casper.infradead.org>
X-CM-TRANSID: zQCowACHj+cfcZhm7IrnAw--.9704S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWkAF47Zw13XF48JrW3GFg_yoW3KFg_A3
	WxK348C3Wjqw4jgr45tws8Kr9xZ3yav3s5X3Z3Xr9rCFZ3XryxGFn7KwsrJa47XwsrGF97
	u3ZFg340yFWa9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbckYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jbrc-UUUUU=
X-Originating-IP: [180.110.112.93]
X-CM-SenderInfo: x2kxxvpqje0q5lvft2wodfhubq/1tbiCRACDGaYT59iaQABsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_183432_468506_D21BF209 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
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

Ck9uIDIwMjQvNy8xNyAyMjo1NSwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4gT24gV2VkLCBKdWwg
MTcsIDIwMjQgYXQgMDg6Mjc6MTlBTSArMDAwMCwgWmh1IEhlbmdibyB3cm90ZToKPj4gKwlUUF9T
VFJVQ1RfX2VudHJ5KAo+PiArCQlfX2ZpZWxkKHVuc2lnbmVkIGxvbmcsIGFkZHJlc3MpCj4+ICsJ
CV9fZmllbGQodW5zaWduZWQgbG9uZywgZXBjKQo+PiArCQlfX2ZpZWxkKHVuc2lnbmVkIGxvbmcs
IGNhdXNlKQo+PiArCSksCj4+ICsKPj4gKwlUUF9mYXN0X2Fzc2lnbigKPj4gKwkJX19lbnRyeS0+
YWRkcmVzcwk9IHJlZ3MtPmJhZGFkZHI7Cj4+ICsJCV9fZW50cnktPmVwYwkJPSByZWdzLT5lcGM7
Cj4+ICsJCV9fZW50cnktPmNhdXNlCQk9IHJlZ3MtPmNhdXNlOwo+PiArCSksCj4+ICsKPj4gKwlU
UF9wcmludGsoInVzZXIgcGFnZSBmYXVsdCwgYWRkcmVzcz0lcHMgZXBjPSVwcyBjYXVzZT0weCVs
eCIsCj4+ICsJCQkodm9pZCAqKV9fZW50cnktPmFkZHJlc3MsICh2b2lkICopX19lbnRyeS0+ZXBj
LAo+PiArCQkJX19lbnRyeS0+Y2F1c2UpCj4gV2hhdCBpcyAiZXBjIj8gIFlvdSd2ZSBtYWRlIHRo
aXMgZ3JhdHVpdG91c2x5IGRpZmZlcmVudCBmcm9tIHg4Ni4KPiBOZXZlciBkbyB0aGF0LiAgQWx3
YXlzIGNvcHkgd2hhdCBzb21lYm9keSBlbHNlIGhhcyBkb25lIHVubGVzcyB5b3UgaGF2ZQo+IGEg
Z29vZCByZWFzb24gdG8gYmUgZGlmZmVyZW50LgpZZXMsIEkgaGF2ZSByZWZlcnJlZCB0byB0aGUg
aW1wbGVtZW50YXRpb24gaW4geDg2LCBidXQgdGhlIGZpZWxkcyBpbiDigJxzdHJ1Y3QgcHRfcmVn
c+KAnSBhcmUgcXVpdGUgZGlmZmVyZW50IGJldHdlZW4gUklTQy1WIGFuZCB4ODYKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
