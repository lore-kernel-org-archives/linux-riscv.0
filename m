Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B98C54EBE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 05:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3opXd4SlMCJ5qy5hmmS9u7Hc3fdYz5Fnp+GWIIHchY=; b=BNgQZptxSNM57V
	ZRPiTCVGpg5Q4xAS64TKZKWu98iw5VJAs6WJBj0ZZs19uDyi+CrNzEV/axtGLfw8EVfjvICKk/ucj
	2BVbC86F27q7uqe6Gp8/xi/t6j3jlpAJK5RAcOR+HRpRtxFV/rFokx303gMMKkT0272Ok1NYrTpXy
	DGUZE0KRVZqIoKEKeuGLQ7bO0bTZVMd+ixJtWPJzfjSCpt5xpbNjjd3jM9dCTuPINTRFHB1u/FRKU
	gj/LYOWpiOaoPDSUIIGPYkpf1pdbsNym3PfH8sD0bFcPt7keKl0C4Sysiniu5KnVQn9UpeHPxh1l7
	RIoOmtmUIJzuBmB/8wMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGCvT-000apV-JZ; Fri, 13 Jan 2023 05:48:27 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGCvM-000agW-Bq
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 05:48:24 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 49E8868D07; Fri, 13 Jan 2023 06:48:07 +0100 (CET)
Date: Fri, 13 Jan 2023 06:48:07 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>, Prabhakar <prabhakar.csengg@gmail.com>,
	"Conor.Dooley" <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	guoren <guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	devicetree@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH v6 1/6] riscv: mm: dma-noncoherent: Switch using
 function pointers for cache management
Message-ID: <20230113054807.GA23179@lst.de>
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230106185526.260163-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <6f7d06ef-d74d-4dfc-9b77-6ae83e0d7816@app.fastmail.com> <CA+V-a8uF1s+dwKC_+apL+CBiHN8w_J0n_G2dqsgiAUZVEibfqg@mail.gmail.com> <9017adf0-acd4-4c43-8aea-3579b214b477@app.fastmail.com> <CA+V-a8u6jvR=EDeE3mAbDr6-06NoBJ7mwmi_Y9qVyHT+aC-9rg@mail.gmail.com> <45d6eb0c-cbe3-4a83-aa12-3483638473ae@app.fastmail.com> <20230110070144.GG10289@lst.de> <02988e70-b099-46fd-b260-2d537c50543a@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02988e70-b099-46fd-b260-2d537c50543a@app.fastmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_214821_363173_011C187A 
X-CRM114-Status: GOOD (  31.38  )
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

T24gVHVlLCBKYW4gMTAsIDIwMjMgYXQgMDQ6MDM6MDZQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBUbyBjbGFyaWZ5OiBJIHdhcyBsb29raW5nIGF0IGFyY2hfc3luY19kbWFfZm9yX2Rl
dmljZSgpLCB3aGljaAo+IGNoYW5nZWQgZnJvbSAnaW52YWxpZGF0ZScgdG8gJ2NsZWFuJyBsYXN0
IEp1bmUgaW4gY29tbWl0Cj4gYzUwZjExYzYxOTZmICgiYXJtNjQ6IG1tOiBEb24ndCBpbnZhbGlk
YXRlIEZST01fREVWSUNFIGJ1ZmZlcnMKPiBhdCBzdGFydCBvZiBETUEgdHJhbnNmZXIiKS4gSSBk
b24ndCBzZWUgIGEgcmV2ZXJ0IGZvciB0aGF0Lgo+IAo+IFRoZSBvbmUgdGhhdCB3YXMgcmV2ZXJ0
ZWQgcmVjZW50bHkgaXMgYXJjaF9kbWFfcHJlcF9jb2hlcmVudCwgd2hpY2gKPiB3YXMgY2hhbmdl
ZCBhbmQgcmV2ZXJ0ZWQgaW4KPiAKPiBjNDQwOTRlZWUzMiBBdWcgMjMgMjAyMiBmbHVzaC0+Y2xl
YW4KPiBiN2Q5YWFlNDA0OCBEZWMgNiAgMjAyMiBjbGVhbi0+Zmx1c2gKPiAKPiBJJ20gcHJpbWFy
aWx5IGludGVyZXN0ZWQgaW4gdGhlIHN0cmVhbWluZyBtYXBwaW5ncyAoYXJjaF9zeW5jXyopCj4g
YXQgdGhlIG1vbWVudC4KCk9oLCB0cnVlLiAgSSd2ZSBiZWVuIGNvbmZ1c2VkIGFib3V0IHRoZSB0
d28gY2hhbmdlcy4KCj4gQWdyZWVkLCB0aGF0J3Mgd2h5IEkgcGFydGljdWxhcmx5IGRvbid0IGxp
a2UgdGhlIGlkZWEgb2YgZ2l2aW5nIFNvQwo+IHNwZWNpZmljIEwyJCBkcml2ZXJzIHRoZSBvcHRp
b24gb2YgbWFraW5nIGN1c3RvbSBjaG9pY2VzIGhlcmUuCgpZZXMsIG1vdmluZyB0aGlzIGludG8g
aW5kaXZpZHVhbCBkcml2ZXJzIGlzIGFuIGFic29sdXRlIG5vLWdvLiAKCj4gVGhlIGFyY2hfZG1h
X3ByZXBfY29oZXJlbnQoKSBjaGFuZ2UgaXMgYXJndWFibHkgYXJtNjQgc3BlY2lmaWMKPiBiZWNh
dXNlIGl0IGlzIG9ubHkgbmVlZGVkIGZvciBtYWNoaW5lcyBzaGFyaW5nIG1lbW9yeSB3aXRoIEVM
Mwo+IGZpcm13YXJlIHRoYXQgZW5mb3JjZXMgYnVmZmVyIG93bmVyc2hpcCwgYnV0IGV2ZW4gZm9y
IHRoYXQgaXQgd291bGQKPiBiZSBuaWNlIHRvIGhhdmUgYSBjZW50cmFsIGRlZmluaXRpb24gYW5k
IHNvbWUgYXJjaGl0ZWN0dXJlIHNwZWNpZmljCj4gZmxhZyB0aGF0IHBpY2tzIG9uZSBiZWhhdmlv
ciBvciB0aGUgb3RoZXIuIFNhbWUgdGhpbmcgZm9yIHRoZQo+IHNwZWN1bGF0aXZlIGFjY2VzcyBk
aWZmZXJlbmNlLgoKWWVzLgoKPiBJIGxvb2tlZCBhdCBhbGwgdGhlIGltcGxlbWVudGF0aW9ucyBu
b3cgYW5kIHB1dCB0aGVtIGluIGEgdGFibGVbMV0KPiB0byBzZWUgd2hhdCB0aGUgZGlmZmVyZW5j
ZXMgYXJlLiBUaGUgb25seSBiaXQgdGhhdCBJIHRoaW5rIG5lZWRzCj4gZGlzY3Vzc2lvbiBpcyB0
aGUgZG1hX3N5bmNfc2luZ2xlX2Zvcl9kZXZpY2UoRE1BX0ZST01fREVWSUNFKSBvcAo+IHRoYXQg
SSBtZW50aW9uZWQgYWJvdmUuIEkgc2VlIHRoYXQgYXJtNjQsIGNza3ksIHBvd2VycGMsIHJpc2N2
Cj4gYW5kIHBhcmlzYyBhbGwgd3JpdGUgb3V0IGF0IGxlYXN0IHBhcnRpY2FsIGNhY2hlIGxpbmVz
IGZpcnN0IHRvCj4gYXZvaWQgbG9zaW5nIGRpcnR5IGRhdGEgaW4gdGhlIHBhcnQgdGhhdCBpcyBu
b3Qgd3JpdHRlbiBieSB0aGUKPiBkZXZpY2VbMl1bM10sIHdoaWxlIHRoZSBvdGhlciBvbmVzIGRv
bid0WzRdLiAKCkknbSB0ZW1wdGVkIHRvIGRlY2xhcmUgWzRdIGJ1Z2d5IHVudGlsIHByb29mIG9m
IHRoZSBpbnZlcnNlLgoKPiBJIGFsc28gc2VlIHRoYXQgYXQgbGVhc3QgYXJjLCBhcm0sIG1pcHMg
YW5kIHJpc2N2IGFsbCB3YW50Cj4gQ1BVIHNwZWNpZmljIGNhY2hlIG1hbmFnZW1lbnQgb3BlcmF0
aW9ucyB0byBiZSByZWdpc3RlcmVkCj4gYXQgYm9vdCB0aW1lLiBXaGlsZSBSdXNzZWxsIGhhZCBz
b21lIGNvbmNlcm5zIGFib3V0IHlvdXIKPiBzdWdnZXN0aW9uIHRvIGdlbmVyYWxpemUgdGhlIGFy
bSB2ZXJzaW9uLCB3ZSBjb3VsZCBzdGFydAo+IGJ5IG1vdmluZyB0aGUgYWJzdHJhY3RlZCByaXNj
diB2ZXJzaW9uIGludG8KPiBrZXJuZWwvZG1hL2RpcmVjdC5jIGFuZCBtYWtlIHN1cmUgaXQgY2Fu
IGJlIHNoYXJlZCB3aXRoCj4gYXQgbGVhc3QgbWlwcyBhbmQgYXJjLCBwcm92aWRlZCB0aGF0IHdl
IGNhbiBhZ3JlZSBvbiB0aGUKPiBETUFfRlJPTV9ERVZJQ0UgYmVoYXZpb3IuCgpZZXMsIEknZCBy
ZWFsbHkgbGlrZSB0byBzdGFydCBvdXQgd2l0aCBhIGNvbW1vbiB2ZXJzaW9uIGFuZCB0aGVuCm1v
dmUgYml0cyBvdmVyLiAgVGhlcmUncyBhbHNvIHNvbWUgaW50ZXJlc3RpbmcgYml0cyBhYm91dCBo
YW5kbGluZwpoaWdobWVtIGZvciBhcmNoaXRlY3R1cmVzIHRoYXQgbmVlZHMgdmlydHVhbCBhZGRy
ZXNzcyBmb3IgZmx1c2hpbmcKdGhhdCBtaWdodCBiZSB3b3J0aCBzaGFyaW5nLCB0b28uCgpUaNGW
cyBzaG91bGQgYmUgYSBuZXcgZmlsZSBpbiBrZXJuZWwvZG1hLyBhcyBpdCdzIG5vdCBvbmx5IHVz
ZWQgYnkKZG1hLWRpcmVjdCBidXQgYWxzbyBieSBkbWEtaW9tbXUsIGFuZCB0byBrZWVwIHRoZSBj
b2RlIG5pY2VseQpzZXBhcmF0ZWQuCgpDYW4geW91IGdpdmUgaXQgYSBnbz8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
