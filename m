Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E748C44520
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 12:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juRz5ioM5DK7uEaWGNbBPtKOW2EwvNwvJiJx6V6n08Y=; b=uuwjtBhE/NKGTy
	ItM/V1BMmyyKdDzW8Lj4qaN6zfHx0lhwIFHG7txfzqWg1eD3w3INQEYX/ZPFTP+caNl0j6kysHkMW
	dZKuLh6bffS34eBFnu4heWj/AbzwCukM0PRiYSDMuLTpkflvsAfIaN7CPITeKAW/kZdViJhDsFLIA
	Xb54CU7pomLZhzqLzGzeamOG6wosrAp+cN5SvRo1eY1Us9gm9H33dISpxdxRHFQPUyFSfOG+R2+J0
	Btjx1v1ISWblM2cnOD5Ub9typ37msc9SCsym5KKAE4tmXo12vnoB3Ed3LV35WSvluwET7UTHS8FBq
	RVzXIJSVcLpArYHBM8aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhqZ-00000002JJl-3OsF;
	Fri, 17 Jul 2026 12:39:19 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhqW-00000002JIZ-0qZ0
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 12:39:18 +0000
Received: from [192.168.0.104] (unknown [123.116.46.73])
	by APP-05 (Coremail) with SMTP id zQCowAA3aEJdIlpqSVQHAA--.9369S2;
	Fri, 17 Jul 2026 20:38:53 +0800 (CST)
Message-ID: <0e65ddab-f066-4d9a-b032-d1e55e76fe47@iscas.ac.cn>
Date: Fri, 17 Jul 2026 20:38:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] riscv: compat_vdso: Build with zacas if available
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <cover.1784274927.git.namcao@linutronix.de>
 <704e0bbacee5f23d1351a686f3a783e31699fb3b.1784274927.git.namcao@linutronix.de>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <704e0bbacee5f23d1351a686f3a783e31699fb3b.1784274927.git.namcao@linutronix.de>
X-CM-TRANSID: zQCowAA3aEJdIlpqSVQHAA--.9369S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF17WF4UKr4fZw4rArW5Wrg_yoW8ur47pF
	4DCrsYgFWDXrWkKrn7Jr4Fq345t3ZYga4agFyjqrWUZ3y5tFy2kwn5t39rWF9rZr1kC3yS
	vF1I9F1Fkr1DAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07betCcUUUUU=
X-Originating-IP: [123.116.46.73]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_053916_618704_95AD6CE2 
X-CRM114-Status: GOOD (  15.36  )
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

SGkgTmFtLAoKT24gNy8xNy8yNiAxNjowNiwgTmFtIENhbyB3cm90ZToKCj4gVGhlIGNvbXBhdCB2
ZHNvIE1ha2VmaWxlIGRvZXMgbm90IGVuYWJsZSB6YWNhcywgZGlzYWxsb3dpbmcgc291cmNlCj4g
ZmlsZXMgZnJvbSB1c2luZyB6YWNhcyBpbnN0cnVjdGlvbnMuIFRoaXMgaXMgYW4gb2JzdGFjbGUg
dG8gYWRkaW5nCj4gcm9idXN0IF9fdmRzb19mdXRleF9yb2J1c3RfbGlzdDMyX3RyeV91bmxvY2so
KSBpbiBhIGZvbGxvdy11cCBjb21taXQuCj4KPiBCdWlsZCB3aXRoIHphY2FzLCBpZiBjb21waWxl
ciBzdXBwb3J0cyBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IE5hbSBDYW8gPG5hbWNhb0BsaW51dHJv
bml4LmRlPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jb21wYXRfdmRzby9NYWtlZmlsZSB8
IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvY29tcGF0X3Zkc28vTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9jb21wYXRfdmRzby9NYWtlZmlsZQo+IGluZGV4IDYzNTgwYjMzZTNjZS4uZmZiZjg0YWVi
MDgxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NvbXBhdF92ZHNvL01ha2VmaWxl
Cj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY29tcGF0X3Zkc28vTWFrZWZpbGUKPiBAQCAtMTgs
NiArMTgsMTAgQEAgZWxzZQo+ICAJQ09NUEFUX01BUkNIIDo9IHJ2MzJpbWFmZAo+ICBlbmRpZgo+
ICAKPiAraWZuZXEgKCQoY2FsbCBjYy1vcHRpb24sLW1hYmk9aWxwMzIgLW1hcmNoPXJ2MzJpbWFf
emFjYXMpLCkKPiArQ09NUEFUX01BUkNIIDo9ICQoQ09NUEFUX01BUkNIKV96YWNhcwo+ICtlbmRp
Zgo+ICsKCkknbSB3b25kZXJpbmcgaWYgeW91IHdvdWxkIGJlIGludGVyZXN0ZWQgaW4gdXNpbmcg
Lm9wdGlvbiBhcmNoLCAremFjYXMKZm9yIHRoaXMsIGluc3RlYWQgb2YgZW5hYmxpbmcgaXQgZm9y
IGV2ZXJ5dGhpbmcuwqAKCkkgcmVjZW50bHkgZm91bmQgb3V0IHRoYXQgd2UgYWRkIGFuZCAqb25s
eSogYWRkIFphY2FzIGFuZCBaYWJoYSB0byB0aGUKZ2xvYmFsIC1tYXJjaCBmb3Iga2VybmVsIGNv
ZGUsIGp1c3QgZm9yIHVzZSBpbiBhc3NlbWJseSBjb2RlIGluCmFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY21weGNoZy5oLgoKU28gdGhpcyBpcyAqcHJvYmFibHkqIG5vdCBhIGNvcnJlY3RuZXNzIHBy
b2JsZW0sIHNpbmNlIGNvbXBpbGVycwpwcm9iYWJseSBkb24ndCBkbyBhdG9taWNzIG9uIHRoZWly
IG93biBhY2NvcmQuIEhvd2V2ZXIsIEkgcGVyc29uYWxseQp0aGluayBpdCB3b3VsZCBiZSBhIGdv
b2QgaWRlYSB0byBtYWtlIGV2ZXJ5dGhpbmcgY29uc2lzdGVudGx5IHVzZQoub3B0aW9uIGFyY2gu
IFRoaXMgbWFrZXMgaXQgc28gdGhlcmUncyBubyBxdWVzdGlvbiBvbiB3aGF0IHRvIGRvIHRvIGdl
dApleHRlbnNpb24gaW5zdHJ1Y3Rpb25zIGluIGFzc2VtYmx5IGNvZGUgLSB5b3UgYWx3YXlzIGRv
LiBJIGhhdmUgYSBwYXRjaApXSVAgdGhhdCB3b3VsZCBtYWtlIGNtcHhjaGcuaCB1c2UgLm9wdGlv
biBhcmNoIGFzIHdlbGwgdGhhdCBJIHdpbGwgc2VuZApzaG9ydGx5LgoKWW91IHdvdWxkIG5lZWQg
dG8gd3JpdGUgc29tZSBtb3JlIGJvaWxlcnBsYXRlOgoKLm9wdGlvbiBwdXNoCi5vcHRpb24gYXJj
aCwgK3phY2FzCmFtb2Nhcy53LnJsIC4uLgoub3B0aW9uIHBvcAoKQ29tcGlsYXRpb24gb2YgdGhp
cyBjb2RlIG5lZWRzIHRvIGJlIGd1YXJkZWQgYmVoaW5kIHNvbWV0aGluZyBsaWtlIGlmCihJU19F
TkFCTEVEKENPTkZJR19SSVNDVl9JU0FfWkFCSEEpKSwgd2hpY2ggQUZBSUNUIHlvdXIgY29kZSBk
b2VzLgoKQnV0IGluIGV4Y2hhbmdlIGZvciB0aGlzIGJvaWxlcnBsYXRlLCBpdCB3b3VsZCBiZSBj
b25zaXN0ZW50IHdpdGggc3R1ZmYKbGlrZSBaYmIsIGFuZCB0aGVyZSB3b3VsZCBiZSBubyBtb3Jl
IG5lZWQgdG8gYmUgcGx1bWJpbmcgLW1hcmNoIGFyb3VuZAppbiBNYWtlZmlsZXMuCgpXaGF0IGRv
IHlvdSB0aGluaz8KClZpdmlhbiAiZHJhbWZvcmV2ZXIiIFdhbmcKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
