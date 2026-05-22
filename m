Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247E2CD5BAF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 01:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ymeAn7pEro6cCEhOiFsqI5qzQmMPT+ALX6zXgvOeO0=; b=I+m12gpNKuavc1
	NVVsnFBS1STN3MsRDj3iKoNxDtMZWoT/6rSYxwk1AyMgZ65swnC9IwQcNvfWTFZFWZAwelTz8TlGt
	GQGdgO6iCbdPYtN2kShZNRwhrJ9PzihMGytDrB7KAqs4elljkJAfFn4PasrCcAYsiOu6STAAq3HNn
	6lInwsx/f3sX/XsaIuDvwyh+POb+HuQ0uFsCPSJs6UO7rpDJgJT7JSP/xds+R5Sa9AZ5/IA+5sgY1
	U9mRqFxrCbclDGdf/Tcha+8rBZfqNAEpZIyHMbC0HBNoizgZjZaPAtHmKHZm7CA6zyPqMHQQ6nOps
	AtxKzPE06ZmJaSssPicQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQEtm-00000009UmM-0k4l;
	Fri, 22 May 2026 01:42:02 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQEti-00000009Ulf-0pgT
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 01:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=QGmcYiYzYw/IB3qtN9ab6o2F/9In5z7ml
	BZmn+PXyBE=; b=p1R3k6UNNCG2JRd/hpfU2BA+qDE9cm5B0juD619IzIc/sQ5Ab
	dohVg2HMGmO83tBrnw2D11FOvISusxt+Il7KLLNv+xFJhogBb+Tpk0u5lud2Jui/
	ZFRggWcdt+2wISgD3t04sWPWieId8UE7MBQyyIMPYbfuvgBITnd+bUzMc4=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUKAtA9qVxoFAA--.7362S2;
	Fri, 22 May 2026 09:42:24 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH 0/9] riscv: ultrarisc: add DP1000 SoC DT and pinctrl
 support
From: Jia Wang <wangjia@ultrarisc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20260521-trusting-busybody-15315a5955b7@spud>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-brink-dealer-d0610c0dbc7b@wendy>
 <177935715446.943957.13292482270209644157.b4-reply@b4>
 <20260521-trusting-busybody-15315a5955b7@spud>
Date: Fri, 22 May 2026 09:41:43 +0800
Message-Id: <177941410382.4069225.2339477191046049135.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779414104; l=1079;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=2fOLw3/RT45kkS5VtnWa1lOAQl+gFKe0cz2RSJkVzkM=;
 b=CVBitQVmkITShABB+y95MDIv0iaHjf7VkZZYUeoOsknIY9+V2+sm2/0rnli6pmAHyYVNOO19u
 JckEqHwV5s9AulerQsvpcku1J2Z6SgHMYdUWrCOULOT2f/0f6gfwkbq
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwA3cUKAtA9qVxoFAA--.7362S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw4rArWfJw13ArW3JFyUGFg_yoWDCFX_uF
	W2v347Cw4UCwn7ZwsYkr43tFZYya1xJryrKa4DX345Ary8XF4rXrykGry3K3W8uayrGF9I
	kF9avrWrZr1I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-AFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRHUDLUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAOEWoOgUUACgAIs8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_184158_789376_E2609B34 
X-CRM114-Status: GOOD (  12.97  )
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

T24gMjAyNi0wNS0yMSAxMToyMyArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIFRodSwg
TWF5IDIxLCAyMDI2IGF0IDA1OjUyOjM0UE0gKzA4MDAsIEppYSBXYW5nIHdyb3RlOgo+ID4gPiBB
ZGRpdGlvbmFsbHksIHRoZXNlIHBpbmN0cmwgcGF0Y2hlcyBzaG91bGQgYmUgc2VudCBzdGFuZGFs
b25lIHRvIHRoZQo+ID4gPiBwaW5jdHJsIG1haW50YWluZXJzLCB0aGV5J3JlIGxpa2VseSB0byBn
byB0aHJvdWdoIGxvdHMgb2YgcmV2aXNpb25zIGFuZAo+ID4gPiBhIGRpZmZlcmVudCBtYWludGFp
bmVyIGFwcGxpZXMgdGhlbS4KPiA+ID4gCj4gPiAKPiA+IEp1c3QgdG8gY29uZmlybSDigJQgZm9y
IHYyLCBzaG91bGQgSSBjb21wbGV0ZWx5IHJlbW92ZSB0aGUgcGluY3RybAo+ID4gYmluZGluZy9k
cml2ZXIgZnJvbSB0aGlzIHNlcmllcyBhbmQgc2VuZCB0aGVtIGFzIGEgc3RhbmRhbG9uZSBwaW5j
dHJsCj4gPiBzZXJpZXMsIHdoaWxlIGtlZXBpbmcgb25seSB0aGUgcGluY3RybCByZWZlcmVuY2Vz
IGluIHRoZSBEVFM/Cj4gCj4gSU1PIHllcy4gQW5kIGNpdGUgYSBsaW5rIHRvIHRoZSBwaW5jdHJs
IHBhdGNoZXMgaW4geW91ciBjb3ZlciBsZXR0ZXIuCj4gCj4gUHJvYmFibHkgeW91J3JlIGJldHRl
ciBvZmYgc3VibWl0dGluZyB2MiBvZiBwaW5jdHJsIGFzIGEgaGlnaGVyIHByaW9yaXR5Cj4gYW55
d2F5LCBzaW5jZSBhKSB0aGUgYmlnZ2VzdCBjaGFuZ2VzIGFyZSBuZWVkZWQgdGhlcmUgYW5kIGIp
IHRoZSBkdHMKPiBjaGFuZ2VzIGRlcGVuZCBvbiBhIGNsb2NrIGRyaXZlci9iaW5kaW5nIGJlaW5n
IGNyZWF0ZWQuCgpUaGFua3MsIHRoYXQncyBjbGVhci4KCknigJlsbCBwcmlvcml0aXplIHN1Ym1p
dHRpbmcgdGhlIHBpbmN0cmwgZHJpdmVyL2JpbmRpbmcgYW5kIHRoZSBjbG9jawpkcml2ZXIvYmlu
ZGluZyBhcyBzZXBhcmF0ZSBzZXJpZXMgZmlyc3QuIFRoZSBEVFMgdXBkYXRlcyB3aWxsIGZvbGxv
dwpvbmNlIHRob3NlIGFyZSBpbiBwbGFjZS4KClRoYW5rcyBhZ2FpbiBmb3IgdGhlIGd1aWRhbmNl
LgoKQmVzdCBSZWdhcmRzLApKaWEgV2FuZwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
