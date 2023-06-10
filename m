Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80570C7EE2E
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 23:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mSNgw3SlXFYDqGSxuUWSNtVcfONE0V6xVoGR+q8Y7Rs=; b=KRsLxbQjOdXJH6
	lP79E2yiL+4E1KigcuWfY1lLzhbsOjAN/BRiS0WExaN/guKBLR/pnLFY07FOHuYucFgfspM+zOV9w
	stmvGPKv0fjssPV1NK3K9njm2nsraFkNpij4eKvG0rADERLw53cpmOyJsGCTSpQSjZ6l9DqB1pNAw
	JIvAAl6JOIbqiIAlBlLFIXYylAVRiZN3ifmva3zrvbpHpYbpYin44DewohFma+xTkDDjz/aNpy0yK
	UdrVYe5c1hOEOIS/iZn4F2ssrxIeHFoHjlvcVepfuH6vmJyWQoF/fA1xQMz6ieysigil2mc5Ob6dN
	JDOYrYQZAayZSt13XUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q87zV-00HFxr-38;
	Sat, 10 Jun 2023 23:27:30 +0000
Received: from out162-62-57-137.mail.qq.com ([162.62.57.137])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q87zR-00HFwl-0P
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jun 2023 23:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1686439635;
	bh=Fn02ERRTdshIy31ivri71MFDl08htZpi5ZW/1B1Yklk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fi7ctKGI38Lr+zJl8aCoN8p3HwkUaIjb4aPRpRCZ7ac2sWLRcy5ehPljNvn1YghbY
	 QGAAG5nZO5kcYtc6h1aaDzqq3GwenQpyoTE6xCtvQ2bk2+UFJx2D80LcM349ZAHJn4
	 FT+MP/zQ/Fc9LfqSiCzH7xL1cEo3m5eKg8dhUhJg=
Received: from localhost ([101.224.149.128])
	by newxmesmtplogicsvrszc2-1.qq.com (NewEsmtp) with SMTP
	id 6C88D4B4; Sun, 11 Jun 2023 07:27:08 +0800
X-QQ-mid: xmsmtpt1686439628t5vxva631
Message-ID: <tencent_06282B9141D32F1D19BE2BB41998E1612607@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeie/ax1XRHrhBLZq6mCcLiuvDNt/91BzhUp23FvjncXJ7GelEe3vM
	 9OAGxznL5b2IhQ28j88ewmLPJ3lH3nD/j6FA1YP8aNEjbE0aYxSc602m22PyY5pTGqT17iolSgf+
	 IrqCx4Zi6HmEqVVPMapH0ioVbBJwLiiwVtiv5H4KOxgvH9AM5zb3nR1cHmfn6M7MGjdcodXvggSz
	 gOjRh1qmAXSZDviwLVUP7imhArz3DWJUVDrWFhWbF+muhLKzneucXXx3jmvC+LdPUGC+/D7ZQFLV
	 AUVbzoLaYy95K8y6wrJskoGPruHFjkqe1fSbBH8CDuWjX51RTYucuPkzaVfROFsRQCvO/D2Pb/eO
	 VcNyBBElLm0cC1ia5z0ACkysYN19UqskQ+teQRpSx5TNwnzHrL6+x65ek6j8UkUVCb0OIecbF6+L
	 l80g9Ylm7c6aHQXv0CozzrpJO+Aq7c+NX2lk8poCTzy9y5wVK1rOdRD6OifEVsnwW9h7EB8zVhqQ
	 MJ5kl8gAc2Dk2Akm6Q24MkToF7FIHSj4THhg+9n7/rTP0S/6qYIdOhOeXpNMsMCML5KBek7UUgqf
	 MgeqEeZUFkn2KXLQIkRN000bluhWfugfnziETRgnca2fD9O9PUaKISZWsaaImOB+7gOFwB4k9wPH
	 vmkVNNqTv8Y/KuQFQ6GVcYfYo6Di1bgQyfcQHkafGqtpLCMdma4eNTld0bQNX4vZdewtXL/m08YS
	 QAL0l1gmXF593b5xMriqDT8t/E4BthO2/HrhseEZnzScWyB9QH2hCX6H83R9JHHVE8NbZEjZN9ZD
	 7waUowtBucgKsyWtuM1ioqh07sAjQFSL2fOVfHnjYtAm/6kNluWJnUTJJX4HiJbNA/sxL7CSQyoU
	 pSpN3w7dotYXlUfdHAGFxZxD+yYRxxgPrV8JbvH2lZMhCqNrRORrG2WiqCNf+HWdVi7inHuS8HYa
	 d6MNI1w9TXpiNO/8u6eA==
Date: Sun, 11 Jun 2023 07:27:08 +0800
From: Woody Zhang <woodylab@foxmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: reserve DTB before possible memblock allocation
X-OQ-MSGID: <ZIUGzGfoEivEICkQ@dev>
References: <tencent_B15C0F1F3105597D0DCE7DADC96C5EB5CF0A@qq.com>
 <20230607-jogging-grudging-70dede86bc53@spud>
 <CAHVXubggydGfNu3OzcxWXREJbB+G9dmr9sFD7vXhVxbG-N58Pg@mail.gmail.com>
 <20230610-ability-mockup-f6aa71bad6a1@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230610-ability-mockup-f6aa71bad6a1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_162726_139148_76EC22DE 
X-CRM114-Status: GOOD (  22.16  )
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

T24gU2F0LCBKdW4gMTAsIDIwMjMgYXQgMDQ6NDE6MTdQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+T24gVGh1LCBKdW4gMDgsIDIwMjMgYXQgMDk6NDk6NDRBTSArMDIwMCwgQWxleGFuZHJl
IEdoaXRpIHdyb3RlOgo+PiBPbiBXZWQsIEp1biA3LCAyMDIzIGF0IDg6MTfigK9QTSBDb25vciBE
b29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+Cj4+ID4gK0NDIEFsZXgsIHlvdSBz
aG91bGQgdGFrZSBhIGxvb2sgYXQgdGhpcyBwYXRjaC4KPj4gPgo+PiA+IE9uIFdlZCwgSnVuIDA3
LCAyMDIzIGF0IDA5OjM1OjE5UE0gKzA4MDAsIFdvb2R5IFpoYW5nIHdyb3RlOgo+PiA+ID4gSXQn
cyBwb3NzaWJsZSB0aGF0IGVhcmx5X2luaXRfZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtKCkgYWxsb2Nh
dGVzIG1lbW9yeQo+PiA+ID4gZnJvbSBtZW1ibG9jayBmb3IgZHluYW1pYyByZXNlcnZlZCBtZW1v
cnkgaW4gYC9yZXNlcnZlZC1tZW1vcnlgIG5vZGUuCj4+ID4gPiBBbnkgZml4ZWQgcmVzZXJ2YXRp
b24gbXVzdCBiZSBkb25lIGJlZm9yZSB0aGF0IHRvIGF2b2lkIHBvdGVudGlhbAo+PiA+ID4gY29u
ZmxpY3RzLgo+PiA+ID4KPj4gPiA+IFJlc2VydmUgdGhlIERUQiBpbiBtZW1ibG9jayBqdXN0IGFm
dGVyIGVhcmx5IHNjYW5uaW5nIGl0Lgo+PiA+Cj4+ID4gVGhlIHJhdGlvbmFsZSBtYWtlcyBzZW5z
ZSB0byBtZSwgSSBhbSBqdXN0IHdvbmRlcmluZyB3aGF0IGNvbXBlbGxpbmcKPj4gPiByZWFzb24g
dGhlcmUgaXMgdG8gbW92ZSBpdCBhd2F5IGZyb20gdGhlIG1lbWJsb2NrX3Jlc2VydmUoKXMgZm9y
IHRoZQo+PiA+IGluaXRkIGFuZCB2bWxpbnV4PyBNb3ZpbmcgaXQgYWJvdmUgZWFybHlfaW5pdF9m
ZHRfc2Nhbl9yZXNlcnZlZF9tZW0oKQo+PiA+IHNob3VsZCBiZSB0aGUgc3VmZmljaWVudCBtaW5p
bXVtICYgd291bGQga2VlcCB0aGluZ3MgdG9nZXRoZXIuCj4KPj4gVGhhbmtzIENvbm9yLgo+PiAK
Pj4gU28gdGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuCj4+IAo+PiBCdXQgSSBmaW5kIHRoaXMg
ZnJhZ2lsZToKPj4gCj4+IC0gd2UgZG8gbm90IGNoZWNrIG1lbWJsb2NrX3Jlc2VydmUoKSByZXR1
cm4gdmFsdWUgdG8gbWFrZSBzdXJlIHRoZQo+PiByZXNlcnZhdGlvbiByZWFsbHkgaGFwcGVuZWQg
KGFuZCBxdWlja2x5IGxvb2tpbmcgYXQgdGhlIGNvZGUsIEknbSBub3QKPj4gZXZlbiBzdXJlIGl0
IHJldHVybnMgYW4gZXJyb3IgaWYgdGhlIHJlZ2lvbiB3YXMgYWxyZWFkeSBhbGxvY2F0ZWQpLgo+
PiAtIHdlIGhhdmUgdG8gbWFrZSBzdXJlIG5vIG1lbWJsb2NrIGFsbG9jYXRpb24gaGFwcGVucyBi
ZWZvcmUgc2V0dXBfYm9vdG1lbSgpLgo+PiAtIHdlIGFsc28gaGF2ZSB0byBjaGVjayB0aGF0IG5v
IGZpeGVkIG1lbWJsb2NrX3Jlc2VydmUoKSBoYXBwZW5zIGFmdGVyLgo+PiAKPj4gVGhlIGxhc3Qg
MiBwb2ludHMgbWF5IHNvdW5kIG5hdHVyYWwsIGJ1dCB3ZSdsbCBoYXZlIHRvIHRha2UgZ3JlYXQg
Y2FyZQo+PiB3aGVuIGFkZGluZyBzb21lIGNvZGUgYXJvdW5kIGhlcmUuIEknbSB3b3JraW5nIG9u
IGFuICJlYXJseSBib290Cj4+IGRvY3VtZW50IiBhbmQgSSdsbCBhZGQgc29tZXRoaW5nIGFib3V0
IHRoYXQsIGJ1dCBhIHJ1bnRpbWUgdGhpbmcgd291bGQKPj4gYmUgd2F5IGJldHRlciBJTU8uCj4+
IAo+PiBZb3UgY2FuIGFkZDoKPj4gCj4+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFs
ZXhnaGl0aUByaXZvc2luYy5jb20+Cj4KPmJ0dyBBbGV4L1dvb2R5LCB3aGF0IGlzIHRoZSBhcHBy
b3ByaWF0ZSBGaXhlcyB0YWcgaGVyZT8KCkluIGVmNjlkMjU1OWZlOSAoInJpc2N2OiBNb3ZlIGVh
cmx5IGR0YiBtYXBwaW5nIGludG8gdGhlIGZpeG1hcCByZWdpb24iKSwKQWxleCBtb3ZlIGVhcmx5
X2luaXRfZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtIHRvIHNldHVwX2Jvb3RtZW0oKSB0byBwcmV2ZW50
Cm1lbW9yeSBhbGxvY2F0aW9ucyBiZWZvcmUgb2YgcmVzZXJ2YXRpb25zLiBCdXQgaXQgc2hvdWxk
IG5vdCBiZSBwdXQgYmVmb3JlCkRUQiByZXNlcnZhdGlvbi4KCgpXb29keQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
