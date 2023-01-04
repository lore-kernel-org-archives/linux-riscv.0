Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78B3C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2F4j+BLa1xyhLU6SzJcyytZkfgTZygiOscKlbMpRwY=; b=qEvzw1/jubl7h+
	R0c2HVzDz8pEzYDYZL+9GkNBsAu8imf3xeLxW2uWoZeyMCOyyo+kp5KOn0AF/AOAc14wQ3iUVUGKv
	IwNsLo/l17brl6B1qZdM+csO4rW/N7yAUrIZInBsVZ5+E2RLLaul5SuFAnXylQI3zF7nZyXEPtVE/
	AFCj5lo/d/RV05t5fiQ8a0mITOkH8BhCaz/UGp8XznxFrn9xNojm4OuAmIC1t7UWGjQrJSJjUKFGd
	QDXkgQ1f3ITWrytjlgb1bmJCoLv4S3TYFCDeqOVptCrcrjeWuSp5LsfJz35hMbjGIdPW+GoNS1nat
	m8oLjhH2Z7OLFPaayglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5QA-009yn6-2P; Wed, 04 Jan 2023 15:11:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD1KU-008XDx-KG
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 10:49:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F5B21FB;
	Wed,  4 Jan 2023 02:49:46 -0800 (PST)
Received: from bogus (unknown [10.163.75.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED2553F587;
	Wed,  4 Jan 2023 02:49:00 -0800 (PST)
Date: Wed, 4 Jan 2023 10:49:00 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor Dooley <conor@kernel.org>
Cc: Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ley Foon Tan <lftan.linux@gmail.com>
Subject: Re: [PATCH] riscv: Move call to init_cpu_topology() to later
 initialization stage
Message-ID: <20230104104900.aohsn6zemfllub7r@bogus>
References: <20230103035316.3841303-1-leyfoon.tan@starfivetech.com>
 <20230103065411.2l7k6r57v4phrnos@orel>
 <efed8f35ae8c4901ba01702bcc07b511@EXMBX161.cuchost.com>
 <Y7Rg28suWh1RUbkU@spud>
 <672440143ab04d3dbcc6de0a16bab3e1@EXMBX161.cuchost.com>
 <F86CD957-8B7C-46B9-A14B-AAE67E43CD71@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F86CD957-8B7C-46B9-A14B-AAE67E43CD71@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_024907_095078_70191286 
X-CRM114-Status: GOOD (  23.31  )
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

T24gV2VkLCBKYW4gMDQsIDIwMjMgYXQgMDk6NDk6NDhBTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgoKWy4uLl0KCj4gPj4gVWhoLCBzbyB3aGVyZSBkaWQgdGhpcyAiY2FwYWNpdHktZG1pcHMt
bWh6IiBwcm9wZXJ0eSBhY3R1YWxseSBjb21lIGZyb20/Cj4gPj4gSSBoYWQgYSBxdWljayBjaGVj
ayBvZiBxZW11IHdpdGggZ3JlcCAmIEkgZG9uJ3Qgc2VlIGFueXRoaW5nIHRoZXJlIHRoYXQKPiA+
PiB3b3VsZCBhZGQgdGhpcyBwcm9wZXJ0eS4KPiA+PiBUaGlzIHByb3BlcnR5IHNob3VsZCBub3Qg
YmUgdmFsaWQgb24gYW55dGhpbmcgb3RoZXIgdGhhbiBhcm0gQUZBSUNULgo+ID4KPiA+VGhpcyBE
VCBwYXJhbWV0ZXIgaXMgbm90IGluIGRlZmF1bHQgUWVtdS4gSSd2ZSBhZGRlZCBpdCBmb3IgdGVz
dGluZyAoc2VlIHRlc3Qgc3RlcHMgaW4gYmVsb3cpLiAKPiA+VGhpcyBpcyBwcmVwYXJhdGlvbiB0
byBzdXBwb3J0IGFzeW1tZXRyaWMgQ1BVIHRvcG9sb2d5IGZvciBSSVNDLVYuCj4gCj4gVGhlIHBy
b3BlcnR5IGlzIG9ubHkgdmFsaWQgb24gYXJtLCBzbyBob3cgZG9lcyBhcm02NCBkZWFsIHdpdGgg
c3VjaAo+IGFzeW1tZXRyaWMgdG9wb2xvZ2llcyB3aXRob3V0IGl0PwoKSSBkb24ndCB0aGluayB3
ZSBjYW4gZGVhbCB3aXRoIGFzeW1tZXRyaWMgdG9wb2xvZ2llcyB3aXRob3V0IHRoaXMuClllcyB3
ZSBjYW4gZGV0ZWN0IHRoZSBkaWZmZXJlbmNlIGluIHRoZSBDUFUgdHlwZXMgYnV0IHdlIGNhbiBv
bmx5IGFzc3VtZQp0aGVyZSBhcmUgc3ltbWV0cmljIGluIHRlcm1zIG9mIHBlcmZvcm1hbmNlIGlu
IGFic2VuY2Ugb2YgdGhpcyBwcm9wZXJ0eS4KCj4gV2h5IHNob3VsZCB3ZSAiZml4IiBzb21ldGhp
bmcgdGhhdCBtYXkgbmV2ZXIgYmUgYSB2YWxpZCBkdHM/Cj4KCkkgd291bGQgbm90IHNheSBpbnZh
bGlkLiBCdXQgc3VyZWx5IGFic2VuY2Ugb2YgaXQgbXVzdCBiZSBoYW5kbGVkIGFuZAp3ZSBkbyB0
aGF0IGZvciBzdXJlLiBJSVJDLCBoZXJlIHRoZSBwcmVzZW5jZSBvZiBpdCBpcyBjYXVzaW5nIHRo
ZSBpc3N1ZS4KQW5kIGlmIGl0IGlzIHByZXNlbnQgbWVhbnMgc29tZW9uZSBpcyB0cnlpbmcgdG8g
YnVpbGQgaXQoSSBkbyB1bmRlcnN0YW5kCnRoaXMgaXMgUWVtdSBidXQgaXMgcXVpdGUgY29tbW9u
IHRoZXNlIGRheXMgZm9yIHBvd2VyIGFuZCBwZXJmb3JtYW5jZQpiYWxhbmNlIGluIG1hbnkgU29D
KQoKClsuLi5dCgo+ID4+IAo+ID4+IEkga25vdyBhcm02NCBkb2VzIHRoaXMsIGJ1dCB0aGVyZSBp
cyBhbnkgcmVhbCByZWFzb24gZm9yIHVzIHRvIGRvIHNvPwo+ID4+IEBTdWRlZXAsIGRvIHlvdSBr
bm93IHdoeSBhcm02NCBjYWxscyB0aGF0IGVhY2ggdGltZT8KPiAKPiBJIGdvdCBteXNlbGYgbWl4
ZWQgdXAgYmV0d2VlbiBwbGFjZXMgSSBmaWRkbGVkIHdpdGggc3RvcmluZyB0aGUgdG9wb2xvZ3ks
IHNvIHlvdSBjYW4gaWdub3JlIHRoYXQgcXVlc3Rpb24gU3VkZWVwLgo+IENsZWFybHkgaXQncyB0
aGUgb25lIGluIHNtcF9jYWxsaW4oKSB0aGF0IGdldHMgY2FsbGVkIGZvciBlYWNoIENQVS4KPiBX
b29wcy4KPiAKCkhtbSBJIHNob3VsZCBoYXZlIHJlYWQgYWxsIHRoZSBtZXNzYWdlcyBpbiB0aGUg
dGhyZWFkLiBEb2luZyBieSBkYXRlL3RpbWUKZGlkbid0IHdvcmsgd2VsbCBmb3IgbWUg8J+YhC4K
Cj4gPj4gT3IgaWYgaXQgaXMgd29ydGggInNhdmluZyIgdGhhdCBjYWxsIG9uIHJpc2N2LCBzaW5j
ZSBhcm02NCBpcyBjbGVhcmx5IGhhcHBpbHkgY2FsbGluZwo+ID4+IGl0IGZvciBtYW55IHllYXJz
ICYgY2FsbGluZyBpdCBsYXRlciB3b3VsZCBsaWtlbHkgaGVhZCBvZmYgYSBnb29kIGZldyBhbGxv
Y2F0aW9uCj4gPj4gaXNzdWVzIChsaWtlIHRoZSBvbmUgd2Ugc2F3IHdpdGggdGhlIHRvcG9sb2d5
IHJld29ya2luZyBhIGZldyBtb250aHMgYWdvKS4KPiAKPiAuLi5idXQgaXMgaXQgc3RpbGwgd29y
dGggbW92aW5nIHRoZSBmdW5jdGlvbiBjYWxsIGxhdGVyIHRvIGhlYWQgb2ZmIGFueSBhbGxvY2F0
aW9uIGZhaWx1cmVzIGlmIGNvcmUgdG9wb2xvZ3kgY29kZSBjaGFuZ2VzPwo+CgpBZ3JlZWQsIGdp
dmVuIGhvdyB3ZSBmYWNlZCBzaW1pbGFyIGlzc3VlcyB3aXRoIGNhY2hlaW5mbyBvbiBmZXcgUklT
Qy1WCnBsYXRmb3Jtcy4KCgotLSAKUmVnYXJkcywKU3VkZWVwCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
