Return-Path: <SRS0=v9z2=S4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A9FC43218
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 16:37:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E293D20693
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 16:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DB0wEaq7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E293D20693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:Message-ID:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ES5ST1uYR1uofTdGt1XAzNVXXkwZ7jEAwMxT0mipaeg=; b=DB0wEaq7EM2OYk+gpa2sRLGs1
	h69toP2qqzR2bWaOJ2A3s+L/h39pcmwCzP0f+G35ehON7WiydwFkv0sib2vjB+/MgsqXHJGTOBA0V
	FINtewo/QPB+xBLCvAzFMBDgHN1JumV5gj9CYoHiBB0p9fahkFo5oubOv67VpxzNjY8DSWk2snkm9
	NfzymQ3q3BGRjgbNSYZUmPqyL08p3X+UyqSiFkEEWG0f6K4iguVRoBFHgYLG6QHQpJQR0L3rS9tkq
	ucvrvIBTWnQ8CNm6EiynwDEjtrV4fZigoYubHsrqxbV9FrXcleFpY2sTKo7HUviCIff1TjL5iBbBA
	9i3ehk/9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK3qs-0001fN-SE; Fri, 26 Apr 2019 16:37:30 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK3qo-0001aT-SX
 for linux-riscv@lists.infradead.org; Fri, 26 Apr 2019 16:37:29 +0000
Received: from s01061831bf6ec98c.cg.shawcable.net ([68.147.80.180]
 helo=[192.168.6.141])
 by ale.deltatee.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <logang@deltatee.com>)
 id 1hK3qf-000743-KJ; Fri, 26 Apr 2019 10:37:18 -0600
To: Palmer Dabbelt <palmer@sifive.com>
References: <mhng-8e27a4f1-db30-46cf-b987-51bba8cd96c7@palmer-si-x1e>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <479792a3-d049-9d93-8bd7-465156ce813d@deltatee.com>
Date: Fri, 26 Apr 2019 10:37:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <mhng-8e27a4f1-db30-46cf-b987-51bba8cd96c7@palmer-si-x1e>
Content-Language: en-US
X-SA-Exim-Connect-IP: 68.147.80.180
X-SA-Exim-Rcpt-To: aou@eecs.berkeley.edu, hch@lst.de, sbates@raithlin.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmer@sifive.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 0/7] RISC-V: Sparsmem, Memory Hotplug and pte_devmap for
 P2P
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_093727_248923_2897A86B 
X-CRM114-Status: GOOD (  18.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
 sbates@raithlin.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDE5LTA0LTI0IDU6MjMgcC5tLiwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gV2Vk
LCAyNyBNYXIgMjAxOSAxNDozNjozNiBQRFQgKC0wNzAwKSwgbG9nYW5nQGRlbHRhdGVlLmNvbSB3
cm90ZToKPj4gSGksCj4+Cj4+IFRoaXMgcGF0Y2hzZXQgZW5hYmxlcyBQMlAgb24gdGhlIFJJU0Mt
ViBhcmNoaXRlY3R1cmUuIFRvIGRvIHRoaXMgb24gdGhlCj4+IGN1cnJlbnQga2VybmVsLCB3ZSBv
bmx5IG5lZWQgdG8gYmUgYWJsZSB0byBiYWNrIElPIG1lbW9yeSB3aXRoIHN0cnVjdAo+PiBwYWdl
cyB1c2luZyBkZXZtX21lbXJlbWFwX3BhZ2VzKCkuIFRoaXMgcmVxdWlyZXMgQVJDSF9IQVNfWk9O
RV9ERVZJQ0UsCj4+IEFSQ0hfRU5BQkxFX01FTU9SWV9IT1RQTFVHLCBhbmQgQVJDSF9FTkFCTEVf
TUVNT1JZX0hPVFJFTU9WRTsgd2hpY2ggaW4KPj4gdHVybiByZXF1aXJlcyBBUkNIX1NQQVJTRU1F
TV9FTkFCTEUuIFdlIGFsc28gbmVlZCB0byBlbnN1cmUgdGhhdCB0aGUKPj4gSU8gbWVtb3J5IHJl
Z2lvbnMgaW4gaGFyZHdhcmUgY2FuIGJlIGNvdmVyZWQgYnkgdGhlIGxpbmVhciByZWdpb24KPj4g
c28gdGhhdCB0aGVyZSBpcyBhIGxpbmVhciByZWxhdGlvbiBzaGlwIGJldHdlZW4gdGhlIHZpcnR1
YWwgYWRkcmVzcyBhbmQKPj4gdGhlIHN0cnVjdCBwYWdlIGFkZHJlc3MgaW4gdGhlIHZtZW1tYXAg
cmVnaW9uLgo+Pgo+PiBXaGlsZSBvdXIgcmVhc29uIHRvIGRvIHRoaXMgd29yayBpcyBmb3IgUDJQ
LCB0aGVzZSBmZWF0dXJlcyBhcmUgYWxsCj4+IHVzZWZ1bCwgbW9yZSBnZW5lcmFsbHksIGFuZCBh
bHNvIGVuYWJsZSBvdGhlciBrZXJuZWwgZmVhdHVyZXMuCj4+Cj4+IFRoZSBmaXJzdCBwYXRjaCBp
biB0aGUgc2VyaWVzIGltcGxlbWVudHMgc3BhcnNlIG1lbS4gSXQgd2FzIGFscmVhZHkKPj4gc3Vi
bWl0dGVkIGFuZCByZXZpZXdlZCBsYXN0IGN5Y2xlLCBvbmx5IGZvcmdvdHRlbi4gSXQgaGFzIGJl
ZW4gcmViYXNlZAo+PiBvbnRvIHY1LjEtcmMyLgo+Pgo+PiBQYXRjaGVzIDIgdGhyb3VnaCA0IHJl
d29yayB0aGUgYXJjaGl0ZWN0dXJlJ3MgdmlydHVhbCBhZGRyZXNzIHNwYWNlCj4+IG1hcHBpbmcg
dHJ5aW5nIHRvIGdldCBhcyBtdWNoIG9mIHRoZSBJTyByZWdpb25zIGNvdmVyZWQgYnkgdGhlIGxp
bmVhcgo+PiBtYXBwaW5nLiBXaXRoIFN2MzksIHdlIGRvIG5vdCBoYXZlIGVub3VnaCBhZGRyZXNz
IHNwYWNlIHRvIGNvdmVyIGFsbCB0aGUKPj4gdHlwaWNhbCBoYXJkd2FyZSByZWdpb25zIGJ1dCB3
ZSBjYW4gZ2V0IHRoZSBtYWpvcml0eSBvZiBpdC4KPj4KPj4gUGF0Y2ggNSBhbmQgNiBpbXBsZW1l
bnQgbWVtb3J5IGhvdHBsdWcgYW5kIHJlbW92ZS4gVGhlc2UgYXJlIHJlbGF0aXZlbHkKPj4gc3Ry
YWlnaHQgZm9yd2FyZCBhZGRpdGlvbnMgc2ltaWxhciB0byBvdGhlciBhcmNoZXMuCj4+Cj4+IFBh
dGNoIDcgaW1wbGVtZW50cyBwdGVfZGV2bWFwIHdoaWNoIGFsbG93cyB1cyB0byBzZXQKPj4gQVJD
SF9IQVNfWk9ORV9ERVZJQ0UuCj4+Cj4+IFRoZSBwYXRjaHNldCB3YXMgdGVzdGVkIGluIFFFTVUg
YW5kIG9uIGEgSGlGaXZlIFVubGVhc2hlZCBib2FyZC4KPj4gSG93ZXZlciwgd2Ugd2VyZSB1bmFi
bGUgdG8gYWN0dWFsbHkgdGVzdCBQMlAgdHJhbnNhY3Rpb25zIHdpdGggdGhpcwo+PiBleGFjdCBz
ZXQgYmVjYXVzZSB3ZSBoYXZlIGJlZW4gdW5hYmxlIHRvIGdldCBQQ0kgd29ya2luZyB3aXRoIHY1
LjEtcmMyLgo+PiBXZSB3ZXJlIGFibGUgdG8gZ2V0IGl0IHJ1bm5pbmcgb24gYSA0LjE5IGVyYSBr
ZXJuZWwgKHdpdGggYSBidW5jaCBvZgo+PiBvdXQtb2YtdHJlZSBwYXRjaGVzIGZvciBQQ0kgb24g
YSBNaWNyb3NlbWkgUG9sYXJGaXJlIGJvYXJkKS4KPj4KPj4gVGhpcyBzZXJpZXMgaXMgYmFzZWQg
b24gdjUuMS1yYzIgYW5kIGEgZ2l0IHRyZWUgaXMgYXZhaWxhYmxlIGhlcmU6Cj4+Cj4+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9zYmF0ZXMxMzAyNzIvbGludXgtcDJwbWVtIHJpc2N2LXAycC12MQo+IAo+
IExvb2tzIGxpa2UgdGhlc2UgZG9uJ3QgYnVpbGQgb24gcnYzMiB3aGVuIGFwcGxpZWQgb24gdG9w
IG9mIDUuMS1yYzYuwqAgV2UgCj4gbm93Cj4gaGF2ZSBydjMyX2RlZmNvbmZpZywgd2hpY2ggc2hv
dWxkIG1ha2UgaXQgZWFzaWVyIHRvIHRlc3RzIHRoZXNlIHNvcnRzIG9mCj4gdGhpbmdzLgoKVGhh
bmtzIGZvciB0aGUgbm90ZS4gSSd2ZSBxdWV1ZWQgdXAgdGhlIGZpeGVzIGZvciB0aGlzLiBIb3dl
dmVyLCBJJ20gCnN0aWxsIGEgYml0IHN0dWNrIG9uIHRoZSBtZW1vcnkgaG90IHJlbW92ZSBzdHVm
Zi4gSSdtIHdhaXRpbmcgZm9yIHRoZSAKc2ltaWxhciB3b3JrIGluIGFybTY0IHRvIGJlIGRvbmUg
c28gSSBjYW4gcmV1c2Ugc29tZSBvZiBpdFsxXS4KClRoZSBmaXJzdCBwYXRjaCBvZiB0aGlzIHNl
cmllcyB0aGF0IGltcGxlbWVudHMgc3BhcnNlbWVtIGJ1aWxkcyBvbiBydjMyIAphbmQgd2FzIGdl
bmVyYWxseSBhY2NlcHRlZCBpbiBwcmV2aW91cyBjeWNsZXM7IHNvIEknZCBhcHByZWNpYXRlIGlm
IHlvdSAKY2FuIHBpY2sgdGhhdCBvbmUgdXAgZm9yIHY1LjIuCgpUaGFua3MuCgpMb2dhbgoKClsx
XSAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8xNTU1MjIxNTUzLTE4ODQ1LTEtZ2l0LXNl
bmQtZW1haWwtYW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbS9ULyN1CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
