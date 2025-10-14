Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B73CCD187
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 09:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0cf5iHsL+f0vvSAIDoWgm9i5i5D86iFBxUAN2bRfb3I=; b=n9f/K7N7fxI5uv
	dMWLwIul1pWvnkFhwRdYqTgIWpZULEab530mV2GopeHTTf+jWFBTa/EXuIaYSa1tGUrfOK6CS0LJ7
	1ELkTxisQiCGAb/bpXrQblonWemnpd1bOKwKBE4YyYNtmzZBTbtQxevvKzcU+aBT/kIOhFyH4rk5d
	YS6b66FDAsuu/JnPOSYqj2hOwQg6cN36R/GZl31av9DclS/8gik+izisibvfyhn5r2FueKZi9qPKb
	6bUlJlJCi6O7VQPgEnjc5oCHCDzJsc8nYWbb531NKc5hwvcAHi8ns/Mr/2FTQrMUihdE0uBXsJRwQ
	BaCJIVPG3JYeydWSH3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8b7T-0000000FimY-3H9D;
	Tue, 14 Oct 2025 09:14:59 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8b7P-0000000Fiip-3G0M
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 09:14:58 +0000
Received: from [192.168.0.100] (unknown [114.241.81.247])
	by APP-01 (Coremail) with SMTP id qwCowACX76FpFO5oM4pjDg--.33359S2;
	Tue, 14 Oct 2025 17:14:17 +0800 (CST)
Message-ID: <6b7c3c90-d3bd-4d75-9cc0-74d3945fbdfd@iscas.ac.cn>
Date: Tue, 14 Oct 2025 17:14:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] irqchip/plic: add support for UltraRISC DP1000
 PLIC
To: Conor Dooley <conor@kernel.org>, Lucas Zampieri <lzampier@redhat.com>
Cc: linux-kernel@vger.kernel.org, Charles Mirabile <cmirabil@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <dramforever@live.com>,
 linux-riscv@lists.infradead.org, Zhang Xincheng <zhangxincheng@ultrarisc.com>
References: <20251013111539.2206477-1-lzampier@redhat.com>
 <20251013111539.2206477-4-lzampier@redhat.com>
 <20251013-trimness-stainless-48343053f204@spud>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20251013-trimness-stainless-48343053f204@spud>
X-CM-TRANSID: qwCowACX76FpFO5oM4pjDg--.33359S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4UGrWDur4xtw4xtw4xJFb_yoW8AFWxpF
	WDKa4vyF4kKFyIvw4Igay0yFyfCr4xtayYkr95Ww40k345ZF1xXrWxKa45ZF9I9r1kX3W2
	kr4Fk3srua47ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07j0fOwUUUUU=
X-Originating-IP: [114.241.81.247]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_021456_178348_963EA04B 
X-CRM114-Status: GOOD (  18.58  )
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

SGkgQ29ub3IsCgpPbiAxMC8xNC8yNSAwMjozMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIE1v
biwgT2N0IDEzLCAyMDI1IGF0IDEyOjE1OjM4UE0gKzAxMDAsIEx1Y2FzIFphbXBpZXJpIHdyb3Rl
Ogo+PiBGcm9tOiBDaGFybGVzIE1pcmFiaWxlIDxjbWlyYWJpbEByZWRoYXQuY29tPgo+Pgo+PiBB
ZGQgYSBuZXcgY29tcGF0aWJsZSBmb3IgdGhlIHBsaWMgZm91bmQgaW4gVWx0cmFSSVNDIERQMTAw
MCB3aXRoIGEgcXVpcmsgdG8KPj4gd29yayBhcm91bmQgYSBrbm93biBoYXJkd2FyZSBidWcgd2l0
aCBJUlEgY2xhaW1pbmcuCj4+Cj4+IFdoZW4gY2xhaW1pbmcgYW4gaW50ZXJydXB0IG9uIHRoZSBE
UDEwMDAgUExJQyBhbGwgb3RoZXIgaW50ZXJydXB0cyBtdXN0IGJlCj4+IGRpc2FibGVkIGJlZm9y
ZSB0aGUgY2xhaW0gcmVnaXN0ZXIgaXMgYWNjZXNzZWQgdG8gcHJldmVudCBpbmNvcnJlY3QKPj4g
aGFuZGxpbmcgb2YgdGhlIGludGVycnVwdC4KPj4KPj4gV2hlbiB0aGUgUExJQ19RVUlSS19DTEFJ
TV9SRUdJU1RFUiBpcyBwcmVzZW50LCBkdXJpbmcgcGxpY19oYW5kbGVfaXJxCj4+IHRoZSBlbmFi
bGUgc3RhdGUgb2YgYWxsIGludGVycnVwdHMgaXMgc2F2ZWQgYW5kIHRoZW4gYWxsIGludGVycnVw
dHMKPj4gZXhjZXB0IGZvciB0aGUgZmlyc3QgcGVuZGluZyBvbmUgYXJlIGRpc2FibGVkIGJlZm9y
ZSByZWFkaW5nIHRoZSBjbGFpbQo+PiByZWdpc3Rlci4gVGhlIGludGVycnVwdHMgYXJlIHRoZW4g
cmVzdG9yZWQgYmVmb3JlIGZ1cnRoZXIgcHJvY2Vzc2luZyBvZgo+PiB0aGUgY2xhaW1lZCBpbnRl
cnJ1cHQgY29udGludWVzLgo+Pgo+PiBUaGUgZHJpdmVyIG1hdGNoZXMgb24gInVsdHJhcmlzYyxj
cDEwMC1wbGljIiB0byBhcHBseSB0aGUgcXVpcmsgdG8gYWxsCj4+IFNvQ3MgdXNpbmcgVVItQ1Ax
MDAgY29yZXMsIHJlZ2FyZGxlc3Mgb2YgdGhlIHNwZWNpZmljIFNvQyBpbXBsZW1lbnRhdGlvbi4K
PiBXaHkgaXMgdGhhdD8gSSBleHBlY3QgdGhhdCB5b3UncmUgZG9pbmcgdGhhdCBpbnRlbnRpb25h
bGx5IGdpdmVuIHRoZQo+IHVsdHJhcmlzYyBlbXBsb3llZSBsaXN0ZWQgYXMgYSBjby1kZXZlbG9w
ZXIsIGJ1dCB3aXRoIG9ubHkgb25lIFNvQyB1c2luZwo+IHRoaXMgSVAgY29yZSBpdCBzZWVtcyBw
b3NzaWJsZSB0aGF0IHRoaXMgYnVnIGluIHRoZSBoYXJkd2FyZSBjb3VsZCBiZQo+IGZpeGVkIGZv
ciBvdGhlciBTb0NzIHRoYXQgYXJlIGJ1aWx0IHVzaW5nIHRoaXMgSVAgY29yZS4KPiBJcyB0aGVy
ZSBhIHBsYW4gdG8sIGZvciBleGFtcGxlLCBjaGFuZ2UgdGhlIGNvcmUgdmVyc2lvbiB0byBVUi1D
UDEwMQo+IHdoZW4gdGhlIGJ1ZyBpcyBmaXhlZD8KCkkgb3JpZ2luYWxseSBwcm9wb3NlZCB0byBt
YXRjaCBvbiB1bHRyYXJpc2MsY3AxMDAtcGxpYyB1bmRlciB0aGUKYXNzdW1wdGlvbiB0aGF0IGl0
IHdvdWxkIGJlIHRoZSBjYXNlLgoKRnVydGhlcm1vcmUsIGl0IGlzIG15IHVuZGVyc3RhbmRpbmcg
dGhhdCBpZiB0aGUgYnVnIGlzIGZpeGVkIGluLCBzYXksClVSLURQMTAwMSwgdGhlbiB0aGUgUExJ
QyBub2RlIGNhbiBzaW1wbHkgYmUKCsKgIMKgIGNvbXBhdGlibGUgPSAidWx0cmFyaXNjLGRwMTAw
MS1wbGljIiwgInNpZml2ZSxwbGljLTEuMC4wIjsKCkkgbWVhbnQgbXkgcmVwbHkgdGhhdCBJIGhh
ZCBhc3N1bWVkIHRoaXMgYnVnIHdhcyBhc3NvY2lhdGVkIHdpdGggdGhlClVSLUNQMTAwIGNvcmUs
IGJ1dCBJIHNob3VsZCBoYXZlIHN0YXRlZCBzbyBtb3JlIGNsZWFybHkuwqAKClZpdmlhbiAiZHJh
bWZvcmV2ZXIiIFdhbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
