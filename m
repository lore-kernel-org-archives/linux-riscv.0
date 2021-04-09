Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0522C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 12:58:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09EC3610FB
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 12:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09EC3610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Mcrd2UAVoKmug92fn8WdcdPMsYB956p9yEaDOhuduk=; b=SR0mP9JtGjnJ+UqRjU6USssCM
	5S3l0+py5AnXjNrorfFx3qHeCfTwxrIbFtjUEhxOv8j77pwBh3Rv1aItL62/ht2oN4g/gYSkRKlRB
	ooqaAIxQO+a/hRdeoiM2pnESB5ZezV4tbcatnaggbB9LHcrm2MNP7cY7hQbKnTTR2MWg60i1bP13B
	uTfbT6sCU/83HyvMBOLYhmrPwJjM5fV0yLEYuojmBP7gsrZgQ4/ZjqG87SibOqkHCvl5bRseuGor5
	iF60UTEALry9KWd5CHxHCAdzyX/e5jO1KrZkwB1UW9ARZA92kr4li9PDz657gWrq4CPJeOVoCeP2D
	/9MbspYUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUqi2-000mvu-3Z; Fri, 09 Apr 2021 12:58:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUqi0-000mvi-Kk
 for linux-riscv@desiato.infradead.org; Fri, 09 Apr 2021 12:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=6WC+Zk4gM3t/P83qDLENqpX9uzDLRuXEH7cjC5nOt30=; b=QQjr36wL54s9enfuh6JN2PSdIo
 Yk83twsxv7sr2S4m3nEebtaHrnXaUdbcu8S5hMbIYSz8lVijzfsnHdpULEUaRqsU1Xz7MHlb95yxc
 vdveWkoiR/Mp9osG1ydGEA20UVMm23foXBxNprJf7pvMCbakrb4Pkh+gjoyrG8kqUCVEdEjtjPe8Q
 JoZP4oj6QGAH5Ys8Wu9y80J12U4Ih49Xt+QYA4QpBTR0MrE7rZZ+iM8hRKot/93EOjhaTJS/lbUsW
 N2gHxZB1/QG9EVjsdecLzbMutihFatE+I5Sl4vk52d8gtNdgLobYpfk/lIyufXLVyYbQ1vbm3eoCj
 pDbk148A==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUqhx-004X5Z-IT
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 12:57:59 +0000
X-Originating-IP: 82.65.183.113
Received: from [172.16.5.113] (82-65-183-113.subs.proxad.net [82.65.183.113])
 (Authenticated sender: alex@ghiti.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id BB8BBFF803;
 Fri,  9 Apr 2021 12:57:51 +0000 (UTC)
Subject: Re: [PATCH v7] RISC-V: enable XIP
To: David Hildenbrand <david@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
Cc: Vitaly Wool <vitaly.wool@konsulko.com>, Mike Rapoport <rppt@linux.ibm.com>
References: <20210409065115.11054-1-alex@ghiti.fr>
 <3500f3cb-b660-5bbc-ae8d-0c9770e4a573@ghiti.fr>
 <be575094-badf-bac7-1629-36808ca530cc@redhat.com>
 <c4e78916-7e4c-76db-47f6-4dda3f09c871@ghiti.fr>
 <d4d771a8-c731-acaf-b42d-44800c61f2e6@redhat.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <e06f5c63-c897-51a8-8398-ff844a27ff48@ghiti.fr>
Date: Fri, 9 Apr 2021 08:57:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <d4d771a8-c731-acaf-b42d-44800c61f2e6@redhat.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_055757_903202_22C628F1 
X-CRM114-Status: GOOD (  31.63  )
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

TGUgNC85LzIxIMOgIDg6MDcgQU0sIERhdmlkIEhpbGRlbmJyYW5kIGEgw6ljcml0wqA6Cj4gT24g
MDkuMDQuMjEgMTM6MzksIEFsZXggR2hpdGkgd3JvdGU6Cj4+IEhpIERhdmlkLAo+Pgo+PiBMZSA0
LzkvMjEgw6AgNDoyMyBBTSwgRGF2aWQgSGlsZGVuYnJhbmQgYSDDqWNyaXTCoDoKPj4+IE9uIDA5
LjA0LjIxIDA5OjE0LCBBbGV4IEdoaXRpIHdyb3RlOgo+Pj4+IExlIDQvOS8yMSDDoCAyOjUxIEFN
LCBBbGV4YW5kcmUgR2hpdGkgYSDDqWNyaXTCoDoKPj4+Pj4gRnJvbTogVml0YWx5IFdvb2wgPHZp
dGFseS53b29sQGtvbnN1bGtvLmNvbT4KPj4+Pj4KPj4+Pj4gSW50cm9kdWNlIFhJUCAoZVhlY3V0
ZSBJbiBQbGFjZSkgc3VwcG9ydCBmb3IgUklTQy1WIHBsYXRmb3Jtcy4KPj4+Pj4gSXQgYWxsb3dz
IGNvZGUgdG8gYmUgZXhlY3V0ZWQgZGlyZWN0bHkgZnJvbSBub24tdm9sYXRpbGUgc3RvcmFnZQo+
Pj4+PiBkaXJlY3RseSBhZGRyZXNzYWJsZSBieSB0aGUgQ1BVLCBzdWNoIGFzIFFTUEkgTk9SIGZs
YXNoIHdoaWNoIGNhbgo+Pj4+PiBiZSBmb3VuZCBvbiBtYW55IFJJU0MtViBwbGF0Zm9ybXMuIFRo
aXMgbWFrZXMgd2F5IGZvciBzaWduaWZpY2FudAo+Pj4+PiBvcHRpbWl6YXRpb24gb2YgUkFNIGZv
b3RwcmludC4gVGhlIFhJUCBrZXJuZWwgaXMgbm90IGNvbXByZXNzZWQKPj4+Pj4gc2luY2UgaXQg
aGFzIHRvIHJ1biBkaXJlY3RseSBmcm9tIGZsYXNoLCBzbyBpdCB3aWxsIG9jY3VweSBtb3JlCj4+
Pj4+IHNwYWNlIG9uIHRoZSBub24tdm9sYXRpbGUgc3RvcmFnZS4gVGhlIHBoeXNpY2FsIGZsYXNo
IGFkZHJlc3MgdXNlZAo+Pj4+PiB0byBsaW5rIHRoZSBrZXJuZWwgb2JqZWN0IGZpbGVzIGFuZCBm
b3Igc3RvcmluZyBpdCBoYXMgdG8gYmUga25vd24KPj4+Pj4gYXQgY29tcGlsZSB0aW1lIGFuZCBp
cyByZXByZXNlbnRlZCBieSBhIEtjb25maWcgb3B0aW9uLgo+Pj4+Pgo+Pj4+PiBYSVAgb24gUklT
Qy1WIHdpbGwgZm9yIHRoZSB0aW1lIGJlaW5nIG9ubHkgd29yayBvbiBNTVUtZW5hYmxlZAo+Pj4+
PiBrZXJuZWxzLgo+Pj4+Pgo+Pj4+IEkgYWRkZWQgbGludXgtbW0gYW5kIGxpbnV4LWFyY2ggdG8g
Z2V0IGZlZWRiYWNrcyBiZWNhdXNlIEkgbm90aWNlZCB0aGF0Cj4+Pj4gREVCVUdfVk1fUEdUQUJM
RSBmYWlscyBmb3IgU1BBUlNFTUVNIChpdCB3b3JrcyBmb3IgRkxBVE1FTSBidXQgSSB0aGluawo+
Pj4+IGl0IGRvZXMgbm90IGRvIHdoYXQgaXMgZXhwZWN0ZWQpOiB0aGUgZmFjdCB0aGF0IHdlIGRv
bid0IGhhdmUgYW55IAo+Pj4+IHN0cnVjdAo+Pj4+IHBhZ2UgdG8gYmFjayB0aGUgdGV4dCBhbmQg
cm9kYXRhIGluIGZsYXNoIGlzIHRoZSBwcm9ibGVtIGJ1dCB0byB3aGljaAo+Pj4+IGV4dGVudCA/
Cj4+Pgo+Pj4gSnVzdCB3b25kZXJpbmcsIHdoeSBjYW4ndCB3ZSBjcmVhdGUgYSBtZW1tYXAgZm9y
IHRoYXQgbWVtb3J5IC0tIG9yIGlzIGl0Cj4+PiBldmVuIGRlc2lyZWFibGUgdG8gbm90IGRvIHRo
YXQgZXhwbGljaXR5PyBUaGVyZSBtaWdodCBiZSBzb21lIG5hc3R5IHNpZGUKPj4+IGVmZmVjdHMg
d2hlbiBub3QgaGF2aW5nIGEgbWVtbWFwIGZvciB0ZXh0IGFuZCByb2RhdGEuCj4+Cj4+Cj4+IERv
IHlvdSBoYXZlIGV4YW1wbGVzIG9mIHN1Y2ggZWZmZWN0cyA/IEFueSBmZWF0dXJlIHRoYXQgd2ls
bCBub3Qgd29yawo+PiB3aXRob3V0IHRoYXQgPwo+Pgo+IAo+IEF0IGxlYXN0IGlmIGl0J3Mgbm90
IHBhcnQgb2YgL3Byb2MvaW9tZW0gaW4gYW55IHdheSAobWF5YmUgIlN5c3RlbSBSQU0iIAo+IGlz
IG5vdCB3aGF0IHdlIHdhbnQgd2l0aG91dCBhIG1lbW1hcCwgVEJEKSwga2V4ZWMtdG9vbHMgd29u
J3QgYmUgYWJsZSB0byAKPiBoYW5kbGUgaXQgcHJvcGVybHkgZS5nLiwgZm9yIGtkdW1wLiBCdXQg
bm90IHN1cmUgaWYgdGhhdCBpcyByZWFsbHkgCj4gcmVsZXZhbnQgaW4geW91ciBzZXR1cC4KPiAK
PiBSZWdhcmRpbmcgb3RoZXIgZmVhdHVyZXMsIGFueXRoaW5nIHRoYXQgZG9lcyBhIHBmbl92YWxp
ZCgpLCAKPiBwZm5fdG9fcGFnZSgpIG9yIHBmbl90b19vbmxpbmVfcGFnZSgpIHdvdWxkIGJlaGF2
ZSBkaWZmZXJlbnRseSBub3cgLS0gCj4gYXNzdW1pbmcgdGhlIGtlcm5lbCBkb2Vzbid0IGZhbGwg
aW50byBhIHNlY3Rpb24gd2l0aCBvdGhlciBTeXN0ZW0gUkFNIAo+ICh3aGVyZWJ5IHdlIHdvdWxk
IHN0aWxsIGFsbG9jYXRlIHRoZSBtZW1tYXAgZm9yIHRoZSB3aG9sZSBzZWN0aW9uKS4KPiAKPiBJ
IGd1ZXNzIHlvdSBtaWdodCBzdHVtYmxlIG92ZXIgc29tZSBzdXJwcmlzZXMgaW4gc29tZSBjb2Rl
IHBhdGhzLCBidXQgCj4gbm90aGluZyByZWFsbHkgY29tZXMgdG8gbWluZC4gTm90IHN1cmUgaWYg
eW91ciB6ZXJvcGFnZSBpcyBwYXJ0IG9mIHRoZSAKPiBrZXJuZWwgaW1hZ2Ugb24gUklTQy1WIChJ
IHJlbWVtYmVyIHRoYXQgd2Ugc29tZXRpbWVzIG5lZWQgYSBtZW1tYXAgCj4gdGhlcmUsIGJ1dCBJ
IG1pZ2h0IGJlIHdyb25nKT8KCgpJdCBpcyBpbiB0aGUga2VybmVsIGltYWdlIGFuZCBpcyBsb2Nh
dGVkIGluIGJzcyB3aGljaCB3aWxsIGJlIGluIFJBTSBhbmQgCnRoZW4gYmUgYmFja2VkIGJ5IGEg
bWVtbWFwLgoKCj4gCj4gSSBhc3N1bWUgeW91IHN0aWxsIHNvbWVob3cgY3JlYXRlIHRoZSBkaXJl
Y3QgbWFwcGluZyBmb3IgdGhlIGtlcm5lbCwgCj4gcmlnaHQ/IFNvIGl0J3MgcmVhbGx5IHNvbWUg
bWVtb3J5IHJlZ2lvbiB3aXRoIGEgZGlyZWN0IG1hcHBpbmcgYnV0IAo+IHdpdGhvdXQgYSBtZW1t
YXAgKGFuZCByaWdodCBub3csIHdpdGhvdXQgYSByZXNvdXJjZSksIGNvcnJlY3Q/Cj4gCgoKTm8g
SSBkb24ndCBjcmVhdGUgYW55IGRpcmVjdCBtYXBwaW5nIGZvciB0aGUgdGV4dCBhbmQgdGhlIHJv
ZGF0YS4KCgo+IFsuLi5dCj4gCj4+Pgo+Pj4gQWxzbywgd2lsbCB0aGF0IG1lbW9yeSBwcm9wZXJs
eSBiZSBleHBvc2VkIGluIHRoZSByZXNvdXJjZSB0cmVlIGFzCj4+PiBTeXN0ZW0gUkFNIChlLmcu
LCAvcHJvYy9pb21lbSkgPyBPdGhlcndpc2Ugc29tZSB0aGluZ3MgKC9wcm9jL2tjb3JlKQo+Pj4g
d29uJ3Qgd29yayBhcyBleHBlY3RlZCAtIHRoZSBrZXJuZWwgd29uJ3QgYmUgaW5jbHVkZWQgaW4g
YSBkdW1wLgo+Pgo+Pgo+PiBJIGhhdmUganVzdCBjaGVja2VkIGFuZCBpdCBkb2VzIG5vdCBhcHBl
YXIgaW4gL3Byb2MvaW9tZW0uCj4+Cj4+IE9rIHlvdXIgY29uY2x1c2lvbiB3b3VsZCBiZSB0byBo
YXZlIHN0cnVjdCBwYWdlLCBJJ20gZ29pbmcgdG8gaW1wbGVtZW50Cj4+IHRoaXMgdmVyc2lvbiB0
aGVuIHVzaW5nIG1lbWJsb2NrIGFzIHlvdSBkZXNjcmliZWQuCj4gCj4gTGV0J3MgZmlyc3QgZXZh
bHVhdGUgd2hhdCB0aGUgaGFybSBjb3VsZCBiZS4gWW91IGNvdWxkIChhbmQgc2hvdWxkPykgCj4g
Y3JlYXRlIHRoZSBrZXJuZWwgcmVzb3VyY2UgbWFudWFsbHkgLSBJSVJDLCB0aGF0J3MgaW5kZXBl
bmRlbnQgb2YgdGhlIAo+IG1lbW1hcC9tZW1ibG9jayB0aGluZy4KPiAKPiBATWlrZSwgd2hhdCdz
IHlvdXIgdGFrZSBvbiBub3QgaGF2aW5nIGEgbWVtbWFwIGZvciBrZXJuZWwgdGV4dCBhbmQgcm8g
ZGF0YT8KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
