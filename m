Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24B1C27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 02:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNDHGqBovN6LeI5t3fr8wl0PZeKFGm4Olc6K7HLj3aM=; b=0DZmDNxSnzRBZJ
	PWOSk6NKEMJL9q0hLYpNz89eoCXiTHeaJm1Wyo/EXkNeQn/bcxF4fk/Zs5U4X5aBXTZnBTOy+wiAJ
	8tGHdeCLMi8m0VfTfg2EmgAirayVN0x0hdd9kvNat9wHjChG4xW3+8TDFtZ7aZKo7agmseDxIJKA5
	RoZi9y+uxl4E/AMJ5wW0546L4MESZKzuDJPQ8xnQZ+rKctdb5ZwKOazyajIzUODi/odrekqKr/i4O
	RcnGiwcZ9DkdX9XK77GIb0mmAJgNm4bYzg03nYhyE8ApljtfBubuCRLEWRu7bUfa8tIFcvmdzaatt
	nSjyOUJlqsWeRaG/TYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1r6-00000008oY2-3sE8;
	Mon, 17 Jun 2024 02:12:24 +0000
Received: from out203-205-221-245.mail.qq.com ([203.205.221.245])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1r2-00000008oWE-3v3J
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 02:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718590337; bh=wYPINtl6Cq1OWFhozKYqXsEZounQyWRAl4uSdZTPhs0=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=ohDQuxsipFvb8uHI7XpRGrtFb/oKvy905Bp5owG4zvfxc64UW782UqYu48Eo2XogH
	 RcD/y3wrsCuNPDk/K6fXgxC4HJCmIx+R0NQZmr40IBqQGE5QWGWSCTJjLRJFGoMe7E
	 aUke28uiQ7jpZmdnTxxe5LZBGw3oA0lPHf9AZCq4=
Received: from smtpclient.apple ([2409:8929:843:88d1:dc81:b668:28ec:a360])
	by newxmesmtplogicsvrszb9-1.qq.com (NewEsmtp) with SMTP
	id 30E2CC18; Mon, 17 Jun 2024 10:12:14 +0800
X-QQ-mid: xmsmtpt1718590334tj3cjhxrz
Message-ID: <tencent_EC71217B8D3E7CC0826EDA6F8E9CB83F3108@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85No7r52JV2vD3MVDcSHlznYLGhiW8RzPidqXTeotJ2IFBz5csnQxA
	 0uleeF7s5bZX8WMib3AriTuIMD0dV3AQSADndULeSTG9REAnjhIuDAE+iiDtS1EKYHZ+dK08w/8f
	 9wUqJqDXUnn61dVR0G1jIW4N+iyfNtQfavVlRqAy3dABZvhXKTNwwUYUEtyNv7Xxi9CZfVP3aPr4
	 GgmRANQ1iFDuPQ6s2AutI+SKoW6xorsZd6+SfstODAGd8cbBBKr4SYXdEmjp+nrB4BotiDQpslJS
	 9DJTMho9T160x3w/t6SDEbRN5WUFfagnct3HIN0D0dn6NjdE7Khi27DvoAy+rux7WMmv25/qM4rk
	 lHeg3nG1DxyYqAnAED7125rTZ/S/g1Rag2k81/0joC4FCbuVTs/EYCJH1R3wwdBn3YtwhBOaZKtn
	 8RrpJ03GMN7T2NI0VkneqpM4ml19U2xiObRiwxntn2E3XXfHr0M7T1PsKffXbBxjPulNJYVjno19
	 AnGXb/pDT79b1fRHO53A7LkbimTrCjh0tRQ2qHC8/uEUDiymDAfpQxG6npYTcP/zpfomMh66mt9v
	 hUwWNby+01i5VEfLul0e5+3ZjmvDToOM0RmBd7EiJr1MJarO1qMXw12L2z3CeXxD6n/rCfYlUeNG
	 5mP96qU9Aa8v0XXFinWmERXi+k58m1y5dCbAGtZ7v+mXG/XHf6DSX6ipNBOWeWeISZ/EFMn6ZNh9
	 ow1UUXZEb9tHWjI3Gyb9sF4Hfzyt5Qoj03Ce03VAGwxt9Wh3LcTrN2E+nhy9Dss0qA7mvZ8Ra6ax
	 sdKbjOHf8FFur8KB7je75MmNGs+ueG5jAoeyUgr/QnRppOAOvaVCs0/YuhLTaEO1+4YKT2ApWILz
	 KYLoET9Ocfeiyr+tbirAGkfdbVK5seJoDhqFHqv0F3WA+fTXTKGEAEV/EEbS3lXWbv4iwiLKd6Hb
	 bViK2kZFpVwjJcVK1bQcaFo2MXDpD0YeEDXrjs5Wp9u7MtAnw/19Bn2iLbtTg2Nsqa9EtVHsNhpa
	 hJfOU2wrlfytQglni7021vz+/5/iY=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v1 6/9] riscv: add SpacemiT SOC family Kconfig support
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240616230633.GB3988639@ofsar>
Date: Mon, 17 Jun 2024 10:12:04 +0800
Cc: linux-riscv@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Anup Patel <anup.patel@wdc.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-OQ-MSGID: <36EE528B-4CAE-40BC-9710-54ABE0D96B7D@cyyself.name>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_D935633C42BE1A7BF8C80553B5571C737009@qq.com>
 <20240616230633.GB3988639@ofsar>
To: Yixun Lan <dlan@gentoo.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_191221_330745_53EB1E62 
X-CRM114-Status: GOOD (  11.07  )
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

Cgo+IE9uIEp1biAxNywgMjAyNCwgYXQgMDc6MDYsIFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3Jn
PiB3cm90ZToKPiAKPiBPbiAwMToyMCBNb24gMTcgSnVuICAgICAsIFlhbmd5dSBDaGVuIHdyb3Rl
Ogo+IAo+PiBUaGUgZmlyc3QgU29DIGluIHRoZSBTcGFjZW1pVCBzZXJpZXMgaXMgSzEsIHdoaWNo
IGNvbnRhaW5zIDggUklTQy1WCj4+IGNvcmVzIHdpdGggUklTQy1WIFZlY3RvciB2MS4wIHN1cHBv
cnQuCj4+IAo+PiBMaW5rOiBodHRwczovL3d3dy5zcGFjZW1pdC5jb20vZW4vc3BhY2VtaXQta2V5
LXN0b25lLTIvCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5neXUgQ2hlbiA8Y3l5QGN5eXNlbGYu
bmFtZT4KPj4gLS0tCj4+IGFyY2gvcmlzY3YvS2NvbmZpZy5zb2NzIHwgNSArKysrKwo+PiAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9LY29uZmlnLnNvY3MgYi9hcmNoL3Jpc2N2L0tjb25maWcuc29jcwo+PiBpbmRleCBmNTFiYjI0
YmM4NGMuLjhhNTc3NTU4Njg0NSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnLnNv
Y3MKPj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MKPj4gQEAgLTI0LDYgKzI0LDExIEBA
IGNvbmZpZyBBUkNIX1NPUEhHTwo+PiBoZWxwCj4+ICBUaGlzIGVuYWJsZXMgc3VwcG9ydCBmb3Ig
U29waGdvIFNvQyBwbGF0Zm9ybSBoYXJkd2FyZS4KPj4gCj4+ICtjb25maWcgQVJDSF9TUEFDRU1J
VAo+IAo+IHNob3VsZCB0aGlzIGJlIFNPQ19TUEFDRU1JVD8gYXMgaXQgY29udHJhZGljdCB3aXRo
IHBhdGNoIFs5LzldCgpPaC4gSXTigJlzIG15IGZhdWx0LiBJdCBzaG91bGQgYmUgQVJDSF9TUEFD
RU1JVCBvbiBwYXRjaCBbOS85XS4KCj4+ICsgYm9vbCAiU29waGdvIFNvQ3MiCj4+ICsgaGVscAo+
PiArICBUaGlzIGVuYWJsZXMgc3VwcG9ydCBmb3IgU3BhY2VtaVQgU29DIHBsYXRmb3JtIGhhcmR3
YXJlLgo+PiArCj4+IGNvbmZpZyBBUkNIX1NUQVJGSVZFCj4+IGRlZl9ib29sIFNPQ19TVEFSRklW
RQo+PiAKPj4gLS0gCj4+IDIuNDUuMQo+PiAKPiAKPiAtLSAKPiBZaXh1biBMYW4gKGRsYW4pCj4g
R2VudG9vIExpbnV4IERldmVsb3Blcgo+IEdQRyBLZXkgSUQgQUFCRUZENTUKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
