Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A83606A31E
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 06:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rkg+1aXS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z6YqvImyuq/6k2FXDWQ7GR5XckQ/SyaysJk+CKwSNCA=; b=Rkg+1aXS9ANXtHSvyd+5PVsmNu
	GcvV0KLrAMpewyTa2hwb3IohVuv6JfkZOUt7pJfAep0HutHQDTRiNnH2s3esNPBOobZNqVUkALT2+
	730+4XD1wIQdAEu78QAwpKusoIRDyyz5mkjU+aviojwbwn1TPPLzX/zYU93Nb0gCS9DdUkB+zb9VQ
	+pIWNS1r9Go4MPfhM6K/vNeLP/AtLFncdu53dvPB0sFAY725X2yF3OikYcDhKOoggeWoa9csQwc17
	ovbJbmK9Vkn8b04W/bRxiAYWvEHigEGXh+4CgMunLR3anMQWGhdYYoUacwFUQCFeqWKdUk8QTqv76
	klKIl29w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCL0-00000000Qyt-3dzk;
	Sat, 28 Nov 2026 06:55:10 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCKt-00000000QyD-1sj2
	for linux-riscv@lists.infradead.org;
	Sat, 28 Nov 2026 06:55:09 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.207])
	by APP-05 (Coremail) with SMTP id zQCowAC3TrTDegprlgwlAg--.40017S2;
	Sat, 28 Nov 2026 14:54:59 +0800 (CST)
Message-ID: <75bc19099b4f2c7384891621a86206c31071ebf5.camel@iscas.ac.cn>
Subject: Re: [PATCH] MAINTAINERS: matches th1520 in filenames for RISC-V
 THEAD SoC
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 28 Nov 2026 14:54:59 +0800
In-Reply-To: <awpKGGPVJawHTK5E@thelio>
References: <20261126-th1520-maintainers-n-clause-v1-1-c1315e68e5be@iscas.ac.cn>
	 <awpKGGPVJawHTK5E@thelio>
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAC3TrTDegprlgwlAg--.40017S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4Utw4rtryrZF4rtFW5ZFb_yoWfWrbEkF
	WDGrn7Z34UAF40yw45KFn5XrZxJF43XFyUXry8Xa1qvFW5Cr98Xa10k3ySq3W5Jry8AFZr
	CFn5XrWrGr1YvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2kYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8XJ55UUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_225505_347682_EC459D87 
X-CRM114-Status: GOOD (  10.44  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMTEtMjfkupTnmoQgMTk6MjcgLTA4MDDvvIxEcmV3IEZ1c3RpbmnlhpnpgZPvvJoK
PiBPbiBUaHUsIE5vdiAyNiwgMjAyNiBhdCAwNTo1MzozMlBNICswODAwLCBJY2Vub3d5IFpoZW5n
IHdyb3RlOgo+ID4gQXMgbW9yZSBhbmQgbW9yZSBkZXZpY2UgYmluZGluZyAvIGRyaXZlcnMgYXJl
IGNvbWluZyBmb3IgVEgxNTIwLAo+ID4gaW5kaXZ1ZGFsIGZpbGVuYW1lcyBub3cgYmxvYXRzIHRo
aXMgTUFJTlRBSU5FUlMgZW50cnkuCj4gPiAKPiA+IFVzZSBOOiB0byBtYXRjaCB0aDE1MjAgaW4g
ZmlsZW5hbWVzIGluc3RlYWQgb2YgbGlzdGluZyB0aGVtLgo+IAo+IEdvb2QgaWRlYSwgbm90aGlu
ZyBkcm9wcyBvdXQsIGFuZCB0aGVhZCx0aDE1MjAtZHctaGRtaS55YW1sIGlzIG5vdwo+IGNvdmVy
ZWQsIHRvby4KPiAKPiBbLi5dCj4gPiAtRjoJZHJpdmVycy9jbGsvdGhlYWQvY2xrLXRoMTUyMC1h
cC5jCj4gCj4gZm9yIGNsayBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBsaXN0IHRoZSBk
aXJlY3RvcnkgbGlrZSB0aGUgZW50cnkgYWxyZWFkeSBkb2VzIGZvciBwbWRvbWFpbjoKPiAKPiAg
ICBGOglkcml2ZXJzL2Nsay90aGVhZC8KCkkgYWdyZWUgd2l0aCB0aGlzLgoKVGhhbmtzLApJY2Vu
b3d5Cgo+IAo+IEkgY2FuIGRvIHRob3NlIGZpeHVwcyB3aGVuIGFwcGx5aW5nIGlmIHlvdSBhZ3Jl
ZS4KPiAKPiBUaGFua3MsCj4gRHJldwo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
