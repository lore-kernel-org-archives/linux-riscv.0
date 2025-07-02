Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCC5C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 20:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6TRfXdzBS8OiN4nNw1aZiiBENVXOMR7M34Ei11t/oA=; b=fG4aFl0uy5bDlZ
	DmvOTiV//BBw4raUyAovUlERLg3WlasOhFjiob9vOZB8gym4pOcSOnyZ8n8dOmXgeV6bdSXSKLR2B
	u+/zQPmOgr+SVVy9CQuwuw3DKdrJzxWsRWIuz+qPRRELlx7qwfjsM3VN80Bq8OjCXL+5akmyIaToW
	HU05nZUKtPsoz0TVE6AwacVfkw7LEiiKbQL867zO/sF5v2hLGtNgYwCjWyraZvA/bFCIlIvrYS5m7
	YhFngujYc+E7TBsBSalawEMEnJ7qbpfoq/TAaQXZjXHztdqx/vKzBmQTrSlJEupz/EIF2E9JLbvcI
	klj+GmO9+gPcJHBdiGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX4ER-00000009WhW-2VKr;
	Wed, 02 Jul 2025 20:39:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX4DY-00000009Was-1TEo
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 20:38:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FD0EA53424;
	Wed,  2 Jul 2025 20:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF21EC4CEE7;
	Wed,  2 Jul 2025 20:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751488687;
	bh=dDCS6QVJ7nXRWlnC2SiSC9vvqcF5+4EB5/e+hxz2kYg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vPRpVWdnh+OJAAA7arYY7PnTcK2jpNELhtnvDh4laCUI4hYVphhNSPs460L2IVWTr
	 1jpr5XgjEgv88LJM91FV1cNYfzB7YLuH9t4SdJC4DNuy9RqwgcjL+99vF3iuJ1SctZ
	 ARHOTjY1hY8ZUrKMa/jH/4mi5bmpe0EB6KOC/Y7QKXXjfTaQTMI7TcjZlR4uOWwzpO
	 npAM2tFfXbRoGuWi1e2mt8hxCh3uiDlhHKU8fHBgR5DetbenJmcGQl54fPFsVTQ3Oh
	 ieCiVM47209l1++MMj/p6W+sbLAwaZixwCFKlfFnwbk9kM15X/w6gTj592919C4Z9u
	 PBAsrRUs6476w==
Message-ID: <43f19fbc-838b-431e-9d02-ecacf5f43731@kernel.org>
Date: Wed, 2 Jul 2025 22:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT K1
 PDMA support
To: Guodong Xu <guodong@riscstar.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
 <20250701-working_dma_0701_v2-v2-1-ab6ee9171d26@riscstar.com>
 <de965773-bab1-4c50-b111-19896465e53e@kernel.org>
 <CAH1PCMbKGeXL9Te6M28ZdX8VBvaToKcK7f+JmN6JsCfttG_Mtg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAH1PCMbKGeXL9Te6M28ZdX8VBvaToKcK7f+JmN6JsCfttG_Mtg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_133808_523227_15DA0BB7 
X-CRM114-Status: GOOD (  16.43  )
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

T24gMDEvMDcvMjAyNSAxMTo1MiwgR3VvZG9uZyBYdSB3cm90ZToKPiBIaSwgS3J6eXN6dG9mCj4g
Cj4gT24gVHVlLCBKdWwgMSwgMjAyNSBhdCAzOjM14oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gT24gMDEvMDcvMjAyNSAwNzozNiwgR3VvZG9u
ZyBYdSB3cm90ZToKPj4+IEFkZCAic3BhY2VtaXQsazEtcGRtYSIgY29tcGF0aWJsZSBzdHJpbmcg
dG8gc3VwcG9ydCBTcGFjZW1pVCBLMSBQRE1BCj4+PiBjb250cm9sbGVyLiBUaGlzIHZhcmlhbnQg
cmVxdWlyZXM6Cj4+Cj4+IFdoeSBpcyB0aGlzIG1hcnZlbGw/IFRoaXMgc2hvdWxkIGJlIGV4cGxh
aW5lZCBoZXJlLCBpdCdzIHJlYWxseSB1bmV4cGVjdGVkLgo+Pgo+IAo+IFNwYWNlbWlUIEsxIFNv
QyB1c2VzIHRoZSBzYW1lIERNQSBjb250cm9sbGVyIGFzIE1hcnZlbGwgTU1QLiBUaGV5IHNoYXJl
IG1vc3QKPiBvZiB0aGUgcmVnaXN0ZXJzIChhbmQgYWRkcmVzcyBvZmZzZXRzKSBhbmQgb25seSBl
bmhhbmNlZCBpbiBhZGRyZXNzaW5nIHNwYWNlCj4gY2FwYWJpbGl0eSAoZnJvbSAzMmJpdCB0byA2
NGJpdCkuCgpJIGhvcGUgeW91IGdvdCB0aGUgbGFzdCBjb21tZW50Li4uCgo+IAo+IEFsc28sIHNw
YWNlbWl0LGsxLXBkbWEgYW5kIG1hcnZlbGwscGRtYS0xLjAgdXNlIHRoZSBzYW1lIGRyaXZlciAo
bW1wX3BkbWEuYyksCj4gdGhhdCdzIHRoZSByZWFzb24gd2h5IEkgY2hvc2Uga2VlcGluZyB0aGVt
IGluIHRoZSBzYW1lIGJpbmRpbmcgZmlsZS4KClRoYXQncyBtb2RlcmF0ZSByZWFzb24uIEkgZXhw
bGFpbmVkIGhlcmUgZnVydGhlciAtIGRvbid0IGdyb3cgb2xkCmJpbmRpbmdzIHdpdGggY29tcGxl
dGVseSBuZXcgZGV2aWNlcywgYmVjYXVzZSB5b3Uga2VlcCBncm93aW5nIG9sZCwKcG9vcmVyIHBh
dHRlcm5zLiBZb3UgaGF2ZSBhIG5ldyBkZXZpY2UsIHlvdSBjYW4gbWFrZSBpdCByaWdodC4KCgou
Li4KCj4+PiArICAgICAgcHJvcGVydGllczoKPj4+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4+PiAr
ICAgICAgICAgIGNvbnRhaW5zOgo+Pj4gKyAgICAgICAgICAgIGNvbnN0OiBzcGFjZW1pdCxrMS1w
ZG1hCj4+PiArICAgIHRoZW46Cj4+PiArICAgICAgcmVxdWlyZWQ6Cj4+PiArICAgICAgICAtIGNs
b2Nrcwo+Pj4gKyAgICAgICAgLSByZXNldHMKPj4+ICsgICAgZWxzZToKPj4+ICsgICAgICBwcm9w
ZXJ0aWVzOgo+Pj4gKyAgICAgICAgY2xvY2tzOiBmYWxzZQo+Pj4gKyAgICAgICAgcmVzZXRzOiBm
YWxzZQo+Pj4gKyAgLSBpZjoKPj4+ICsgICAgICBwcm9wZXJ0aWVzOgo+Pj4gKyAgICAgICAgY29t
cGF0aWJsZToKPj4+ICsgICAgICAgICAgY29udGFpbnM6Cj4+PiArICAgICAgICAgICAgZW51bToK
Pj4+ICsgICAgICAgICAgICAgIC0gbWFydmVsbCxwZG1hLTEuMAo+Pj4gKyAgICAgICAgICAgICAg
LSBzcGFjZW1pdCxrMS1wZG1hCj4+PiArICAgIHRoZW46Cj4+PiArICAgICAgcHJvcGVydGllczoK
Pj4+ICsgICAgICAgICcjZG1hLWNlbGxzJzoKPj4+ICsgICAgICAgICAgY29uc3Q6IDIKPj4+ICsg
ICAgICAgICAgZGVzY3JpcHRpb246Cj4+PiArICAgICAgICAgICAgVGhlIGZpcnN0IGNlbGwgY29u
dGFpbnMgdGhlIERNQSByZXF1ZXN0IG51bWJlciBmb3IgdGhlIHBlcmlwaGVyYWwKPj4+ICsgICAg
ICAgICAgICBkZXZpY2UuIFRoZSBzZWNvbmQgY2VsbCBpcyBjdXJyZW50bHkgdW51c2VkIGJ1dCBt
dXN0IGJlIHByZXNlbnQgZm9yCj4+PiArICAgICAgICAgICAgYmFja3dhcmQgY29tcGF0aWJpbGl0
eS4KPj4+ICsgICAgZWxzZToKPj4+ICsgICAgICBwcm9wZXJ0aWVzOgo+Pj4gKyAgICAgICAgJyNk
bWEtY2VsbHMnOgo+Pj4gKyAgICAgICAgICBjb25zdDogMQo+Pj4gKyAgICAgICAgICBkZXNjcmlw
dGlvbjoKPj4+ICsgICAgICAgICAgICBUaGUgY2VsbCBjb250YWlucyB0aGUgRE1BIHJlcXVlc3Qg
bnVtYmVyIGZvciB0aGUgcGVyaXBoZXJhbCBkZXZpY2UuCj4+Cj4+Cj4+IEl0J3MgZ2V0dGluZyBj
b21wbGljYXRlZC4gSSBzdWdnZXN0IHRvIG1ha2UgeW91ciBvd24gc2NoZW1hLiBUaGVuIHlvdQo+
PiB3b3VsZCBhbHNvIHN3aXRjaCB0byBwcmVmZXJyZWQgJ3NyYW0nIHByb3BlcnR5IGluc3RlYWQg
b2YgdGhhdCBsZWdhY3kKPj4gJ2FzcmFtJy4KPj4KPj4gUmVhbGx5LCBhbmNpZW50IHNjaGVtYXMg
c2hvdWxkIG5vdCBiZSBncm93biBmb3IgbmV3LCBjb21wbGV0ZWx5Cj4gCj4gVGhlIHJlYXNvbiB0
aGF0IHRoZXkgc2hhcmUgdGhlIHNhbWUgZGV2aWNlIGRyaXZlciBtYXkgbm90IGJlIHN0cm9uZyBl
bm91Z2gKPiBjb21wYXJlZCB0byB3aGF0IHlvdSBzYWlkIGhlcmUuCgpJZiBETUEgbWFpbnRhaW5l
cihzKSByZWplY3QgY29tcGxleGl0eSBpbiBkcml2ZXIsIHRoZW4gaXQgaXMgZmluZS4gQnV0CnRp
bGwgdGhhdCBoYXBwZW5zLCB5b3Ugc2hvdWxkIHJhdGhlciBjb21lIHdpdGggYSBjbGVhbiBuZXcg
YmluZGluZyBhbmQKZG9uJ3QgZ3JvdyBsZWdhY3kuCgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
