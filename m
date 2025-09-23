Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34924CAC5A7
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 06:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKOLco+Fdl+67wI8e+sT5IpA4gXIcJ8mi6w1rxHQDZI=; b=V4mnH6sAx6nRoU
	N6hAY+tNhnPrJqKFB84tJGcAwxTiFTlrxBhVbFsjtxI4hTyF3uoctc8yu7eFgrDjSx7RDy050Hrkq
	woIhdjKbyKwcEJBR6ThpSiS2bpZSCVDy9GqaynUVgrPYPXp8E53pL4fTm6u2ftib+yDK6qed4HNKd
	pWHJ7DmkU+mz5NvqT5L28a5CUd3LoEw3hsdhP64exiowjJ3GDT1Z9VGc53BS/gmqbAy25KuqmzX/m
	MmoVUte3xo6djJJmw7xCHIBj7QaZUBIGMytC7aV7heeloLeMD8hRprk/lKlvrrA61SYk0aa/4jY/9
	TRu2RXPRwl1q3K0F0jZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0waG-0000000CZxe-0XYm;
	Tue, 23 Sep 2025 06:33:04 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0waD-0000000CZua-0cnz
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 06:33:03 +0000
Received: from [192.168.0.102] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowADHaBILP9Jo2ZlyBA--.58809S2;
	Tue, 23 Sep 2025 14:32:44 +0800 (CST)
Message-ID: <54a959f7-a2e6-4622-97fa-18408afa0998@iscas.ac.cn>
Date: Tue, 23 Sep 2025 14:32:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@gentoo.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20250921210237.943370-1-aurelien@aurel32.net>
 <20250921210237.943370-3-aurelien@aurel32.net>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250921210237.943370-3-aurelien@aurel32.net>
X-CM-TRANSID: zQCowADHaBILP9Jo2ZlyBA--.58809S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4xCw4DuFWUAFW7Kw45ZFb_yoW8CFWkpF
	WvkFs5G3yxKr13CrsFvF15WryrJFnYg3W5CrnxCr1UArn8uFy2kr4fK3WDtrZ8Xrs3Zw17
	Jr4ktrWDKFy3taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUqiFxDUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_233301_552674_40AD9D3C 
X-CRM114-Status: GOOD (  18.27  )
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

SGkgQXVyZWxpZW4sCgpPbiA5LzIyLzI1IDA1OjAxLCBBdXJlbGllbiBKYXJubyB3cm90ZToKPiBU
aGUgQlBJLUYzIGNvbnRhaW5zIGEgMjRjMDIgZWVwcm9tLCB0aGF0IGNvbnRhaW5zIGFtb25nIG90
aGVyIHRoaW5ncyB0aGUKPiBNQUMgYWRkcmVzc2VzIG9mIHRoZSB0d28gbmV0d29yayBpbnRlcmZh
Y2VzLiBGb3IgdGhpcyByZWFzb24sIG1hcmsgaXQgYXMKPiByZWFkLW9ubHkuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBBdXJlbGllbiBKYXJubyA8YXVyZWxpZW5AYXVyZWwzMi5uZXQ+Cj4gLS0tCj4gIGFy
Y2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzIHwgMTEgKysrKysr
KysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBp
LWYzLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRz
Cj4gaW5kZXggM2I2ZTRmNTJlOWFhZC4uNTc0ZDEwZmRmOWI4MiAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwo+ICsrKyBiL2FyY2gv
cmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzCj4gQEAgLTExNSw2ICsx
MTUsMTUgQEAgJmkyYzIgewo+ICAJcGluY3RybC0wID0gPCZpMmMyXzBfY2ZnPjsKPiAgCXBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gIAlzdGF0dXMgPSAib2theSI7Cj4gKwo+ICsJZWVwcm9t
QDUwIHsKPiArCQljb21wYXRpYmxlID0gImF0bWVsLDI0YzAyIjsKPiArCQlyZWcgPSA8MHg1MD47
Cj4gKwkJdmNjLXN1cHBseSA9IDwmdmNjMXY4X3N5cz47Cj4gKwkJcGFnZXNpemUgPSA8MTY+Owo+
ICsJCXJlYWQtb25seTsKPiArCQlzaXplID0gPDI1Nj47Cj4gKwl9Owo+ICB9Owo+ICAKCkkgd29u
ZGVyIGlmIGl0IHdvdWxkIHBvc3NpYmx5IG1ha2Ugc2Vuc2UgdG8gc3BlY2lmeSBhIG52bWVtLWxh
eW91dCBoZXJlLgpUaGUgQlBJLUYzIEkgaGF2ZSBoZXJlIGhhcyB0aGlzIGluIHRoZSAyNGMwMjoK
CjAwMDAwMDAwwqAgNTQgNmMgNzYgNDkgNmUgNjYgNmYgMDDCoCAwMSAwMCAyMCAyNCAwNiBmZSBm
ZSBmZcKgIHxUbHZJbmZvLi4uICQuLi4ufAowMDAwMDAxMMKgIFhYIFhYIFhYIDJhIDAyIDAwIDAy
IDIzwqAgMGMgWFggWFggWFggWFggWFggWFggWFjCoCB8Li4uKi4uLiMuWFhYWFhYWHwKMDAwMDAw
MjDCoCBYWCBYWCBYWCBYWCBYWCBmZSAwNCBYWMKgIFhYIFhYIFhYIGZmIGZmIGZmIGZmIGZmwqAg
fFhYWFhYLi5YWFhYLi4uLi58CjAwMDAwMDMwwqAgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmbCoCBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZsKgIHwuLi4uLi4uLi4uLi4uLi4ufAoqCjAwMDAwMTAwCgoo
Li4uIHdpdGggdmFyaWFibGUgcGFydHMgcmVwbGFjZWQgd2l0aCBYKQoKQW5kLCBBRkFJQ1QsIHRo
aXMgaXMgYSAib25pZSx0bHYtbGF5b3V0IiB3aXRoIGZpZWxkczoKCjB4MjQgbWFjLWFkZGRyZXNz
CjB4MmEgbnVtLW1hY3MKMHgyMyBzZXJpYWwtbnVtYmVyCjB4ZmUgY3JjMzIKCkFzIHlvdSBjYW4g
c2VlIHRoZSBtYWMtYWRkcmVzcyBhc3NpZ25tZW50IGxvb2tzIGJvZ3VzIHdpdGggZmU6ZmU6ZmUg
KGl0CmlzIHVzZWQgYnkgdmVuZG9yIGNvZGUgdGhvdWdoLCBzbyBhdCBsZWFzdCBpdCBzZWVtcyB0
byBiZSBpbnRlbmRlZCkuIEl0CmRvZXMgYXBwZWFyIGF0IGxlYXN0IHRvIGhhdmUgdXNlZnVsIGlu
Zm9ybWF0aW9uLgoKQ2FuIHlvdSBjb25maXJtIG9uIHlvdXIgaGFyZHdhcmU/IFdoYXQgZG8geW91
IHRoaW5rIGFib3V0IHRoaXM6IHNob3VsZAp3ZSBhZGQgaXQgbm93IG9yIGFkZCBpdCB3aGVuIHdl
IGhhdmUgdXNlcnM/CgpWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
