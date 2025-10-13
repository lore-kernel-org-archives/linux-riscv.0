Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E086CCA476
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 07:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeThHG+MvvfrUiQnOhMpikq0WRtAE7kUoEY/W+ussQ8=; b=QDdDTSnUcbsKR9brlAB6rSnZYW
	5hABcSqa7uuR6/vDnOaNwfSwk/u/my6s2c8jRONqh27uQeyBce5QSgyBmNVqPxji2d5psbAh8p8lL
	/GioYDnuEVYULxpDDBz7oSdT3uLRRVrQeLHjFBBnx3fCmyRQ0zD+EOJboJ0ruweJMm0FY36v1ISav
	oTqcO1We11QAWL+0MbgPFemldlrS+zG+LsV5mTmmCQSshMtY0y0VcQj8KZv84yrSW5qp52xD5XP7h
	ZAHCVza84wzXBPuulOzDSXl/e+4Njyi/sTJif/SRjRpB7EIKu2EE2r+hp2iDkd5awXA3pHc/i+gh9
	3zH5/L4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8D5I-0000000CVUf-05IF;
	Mon, 13 Oct 2025 07:35:08 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8D5F-0000000CVQr-0KRK;
	Mon, 13 Oct 2025 07:35:06 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxH9Ogq+xozn0VAA--.46226S3;
	Mon, 13 Oct 2025 15:34:57 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxE+Sdq+xoJ1PdAA--.31982S3;
	Mon, 13 Oct 2025 15:34:55 +0800 (CST)
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250928085506.4471-1-yangtiezhu@loongson.cn>
 <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
 <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn>
 <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
 <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn>
 <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
 <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
 <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn>
 <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
 <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
 <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <3695be6e-bc75-1ee4-1222-95aafa44abdb@loongson.cn>
Date: Mon, 13 Oct 2025 15:34:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
Content-Language: en-US
X-CM-TRANSID: qMiowJAxE+Sdq+xoJ1PdAA--.31982S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGrWfuw43urW8Ar4kCw45urX_yoW5XF4Upa
	y7GrWUKrs5JFZ7J34xJr15u3yUAwsIya45KF9I9ryrZw1UuF90qryjvrWjvFWDXrW8uFy2
	yF4ftrZIyFWqywcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zyIUUUUU
	U==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_003505_495789_4A0B68F5 
X-CRM114-Status: GOOD (  23.52  )
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

T24gMjAyNS8xMC8xMSDkuIvljYgxMTo1OCwgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4gT24gU2F0
LCAxMSBPY3QgMjAyNSBhdCAwODowMSwgSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAa2VybmVsLm9y
Zz4gd3JvdGU6Li4uPj4gSG1tbSwgSSB3YW50IHRvIGtub3cgd2hldGhlciB0aGlzIHByb2JsZW0g
aXMgYW4gb2JqdG9vbCBpc3N1ZSBvciBhbgo+PiBlZmlzdHViIGlzc3VlIGluIGVzc2VuY2UuIElm
IGl0IGlzIGFuIG9ianRvb2wgaXNzdWUsIHdlIHNob3VsZCBmaXgKPj4gb2JqdG9vbCBhbmQgZG9u
J3QgdG91Y2ggZWZpc3R1Yi4gSWYgaXQgaXMgYW4gZWZpc3R1YiBpc3N1ZSwgdGhlbiB3ZQo+PiBz
aG91bGQgbW9kaWZ5IGVmaXN0dWIgKGJ1dCBub3Qgc3BlY2lmaWMgdG8gTG9vbmdBcmNoLCB3aGVu
IFJJU0MtViBhbmQKPj4gQVJNNjQgYWRkIG9ianRvb2wgdGhleSB3aWxsIG1lZXQgdGhlIHNhbWUg
aXNzdWUpLgo+Pgo+IAo+IEl0IGlzIGFuIG9ianRvb2wgaXNzdWUgaW4gZXNzZW5jZS4KPiAKPiBU
aGUgZ2VuZXJhdGVkIGNvZGUgbG9va3MgbGlrZSB0aGlzCj4gCj4gOTAwMDAwMDAwMTc0MzA4MDog
ZmYgYjcgZmUgNTcgICBibCAgICAgIC0zMzIgPF9fZWZpc3R1Yl9rZXJuZWxfZW50cnlfYWRkcmVz
cz4KPiA5MDAwMDAwMDAxNzQzMDg0OiAyNiAwMyBjMCAyOCAgIGxkLmQgICAgJGEyLCAkczIsIDAK
PiA5MDAwMDAwMDAxNzQzMDg4OiA4NyAwMCAxNSAwMCAgIG1vdmUgICAgJGEzLCAkYTAKPiA5MDAw
MDAwMDAxNzQzMDhjOiAwNCAwNCA4MCAwMyAgIG9yaSAgICAgJGEwLCAkemVybywgMQo+IDkwMDAw
MDAwMDE3NDMwOTA6IGM1IDAyIDE1IDAwICAgbW92ZSAgICAkYTEsICRmcAo+IDkwMDAwMDAwMDE3
NDMwOTQ6IGUxIDAwIDAwIDRjICAgamlybCAgICAkcmEsICRhMywgMAo+IAo+IDkwMDAwMDAwMDE3
NDMwOTggPF9fZWZpc3R1Yl9leGl0X2Jvb3RfZnVuYz46Cj4gOTAwMDAwMDAwMTc0MzA5ODogNjMg
YzAgZmYgMDIgICBhZGRpLmQgICRzcCwgJHNwLCAtMTYKPiAKPiBUaGVyZSBpcyBub3RoaW5nIHdy
b25nIHdpdGggdGhpcyBjb2RlLCBnaXZlbiB0aGF0IHRoZSBpbmRpcmVjdCBjYWxsIGlzCj4gdG8g
YSBfX25vcmV0dXJuIGZ1bmN0aW9uLCBhbmQgc28gdGhlIGZhY3QgdGhhdCBpdCBmYWxscyB0aHJv
dWdoIGludG8KPiBfX2VmaXN0dWJfZXhpdF9ib290X2Z1bmMoKSBpcyBub3QgYSBwcm9ibGVtLgo+
IAo+IEV2ZW4gdGhvdWdoIHRoZSBjb21waWxlciBkb2VzIG5vdGhpbmcgd3JvbmcgaGVyZSwgaXQg
d291bGQgYmUgbmljZSBpZgo+IGl0IHdvdWxkIGVtaXQgc29tZSBraW5kIG9mIFVEIG9yIEJSSyBp
bnN0cnVjdGlvbiBhZnRlciBzdWNoIGEgY2FsbCwgaWYKPiBvbmx5IHRvIG1ha2UgdGhlIGJhY2t0
cmFjZSBtb3JlIHJlbGlhYmxlLiBCdXQgdGhlIGNvZGUgaXMgZmluZSwgYW5kCj4gb2JqdG9vbCBz
aW1wbHkgZG9lcyBub3QgaGF2ZSB0aGUgaW5mb3JtYXRpb24gaXQgbmVlZHMgdG8gZGV0ZXJtaW5l
Cj4gdGhhdCB0aGUgaW5kaXJlY3QgY2FsbCBpcyBvZiBhIHZhcmlldHkgdGhhdCBuZXZlciByZXR1
cm5zLgo+IAo+IFNvIEkgZG9uJ3QgbWluZCBmaXhpbmcgaXQgaW4gdGhlIGNvZGUsIGJ1dCBvbmx5
IGZvciBMb29uZ0FyY2gsIGdpdmVuCj4gdGhhdCB0aGUgcHJvYmxlbSBkb2VzIG5vdCBleGlzdCBv
biBhcm02NCBvciBSSVNDLVYuCgpJIGFzc3VtZSB0aGlzIGlzIHRoZSBmaW5hbCBjb25jbHVzaW9u
LCBpZiB0aGVyZSBpcyBubyBvYmplY3Rpb24sCkkgd2lsbCBzZW5kIHBhdGNoIGFjY29yZGluZyB0
byBBcmQncyBzdWdnZXN0aW9uIGFuZCB1cGRhdGUgdGhlCmNvbW1pdCBtZXNzYWdlIGluIHRoZSBu
ZXh0IHdlZWssIHRoZSBjb2RlIGxvb2tzIGxpa2UgdGhpczoKCi0tLS0tODwtLS0tLQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9sb29uZ2FyY2guYyAKYi9kcml2ZXJz
L2Zpcm13YXJlL2VmaS9saWJzdHViL2xvb25nYXJjaC5jCmluZGV4IDM3ODJkMGExODdkMS4uZTU5
OTFhYTlmODA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL2xvb25n
YXJjaC5jCisrKyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvbG9vbmdhcmNoLmMKQEAg
LTEwLDggKzEwLDggQEAKICAjaW5jbHVkZSAiZWZpc3R1Yi5oIgogICNpbmNsdWRlICJsb29uZ2Fy
Y2gtc3R1Yi5oIgoKLXR5cGVkZWYgdm9pZCBfX25vcmV0dXJuICgqa2VybmVsX2VudHJ5X3QpKGJv
b2wgZWZpLCB1bnNpZ25lZCBsb25nIGNtZGxpbmUsCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc3lzdGFiKTsKK3R5cGVkZWYgdm9pZCAoKmtl
cm5lbF9lbnRyeV90KShib29sIGVmaSwgdW5zaWduZWQgbG9uZyBjbWRsaW5lLAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzeXN0YWIpOwoKICBlZmlfc3RhdHVz
X3QgY2hlY2tfcGxhdGZvcm1fZmVhdHVyZXModm9pZCkKICB7CkBAIC04MSw0ICs4MSw3IEBAIGVm
aV9zdGF0dXNfdCBlZmlfYm9vdF9rZXJuZWwodm9pZCAqaGFuZGxlLCAKZWZpX2xvYWRlZF9pbWFn
ZV90ICppbWFnZSwKCiAgICAgICAgIHJlYWxfa2VybmVsX2VudHJ5KHRydWUsICh1bnNpZ25lZCBs
b25nKWNtZGxpbmVfcHRyLAogICAgICAgICAgICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9u
ZyllZmlfc3lzdGVtX3RhYmxlKTsKKworICAgICAgIC8qIFdlIHNob3VsZCBuZXZlciBnZXQgaGVy
ZSwgb25seSB0byBmaXggdGhlIG9ianRvb2wgd2FybmluZyAqLworICAgICAgIHJldHVybiBFRklf
TE9BRF9FUlJPUjsKICB9Ci0tLS0tODwtLS0tLQoKVGhhbmtzLApUaWV6aHUKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
