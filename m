Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16E4CCD193
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 06:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CgRq3ViaOt/U9tCeHDGBbzQg6nrYMYhFP7hTgffdA9s=; b=OCOLfg8PQpImfq
	Ny3+yy6T+YQJ8ykFBPYotAoy99c1nbifZZ5DQZ8i51HrQ/DtpSOVLihvFhwL/RNl5HzZ6cIy3Yw0c
	Bv7/TeJJmlnNdz8aA9Pi6v6Jb+LMzvl+X6SjQyBaRAyV6KEXEpYiNNK/0Q4HlMmWEQXDaZzcWlG8i
	jWAeqnnBSN7cNr2ktiV6an33koDqCp8PDVGVpFZUHtdHKWlEGFMTQHEDECSCtAjI6C652+bqgIN9k
	4tsgMH3P/jEPM+J/qXD8UAXHQhgtonh3aSHhlQsGpsVOviNpKCcePup9yBUt/KP/t/UV0sOzn5fgi
	xNpKqy7PBBRMF75S7Qsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBoWg-00000005BQ1-2Jmz;
	Thu, 23 Oct 2025 06:10:18 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBoWc-00000005BMm-0o25
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 06:10:16 +0000
Date: Thu, 23 Oct 2025 14:09:53 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761199799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mdbOLl9vdTIDWqXeZ0i3gbMYXcGKvHlrusgaQrtWbKA=;
	b=to7GDf1OuioFYgokMgmfhvX7VUvVvYZX49E4S+efpMptcgW4zJDje9jI5GIDYPfCuk7onp
	KwNTu0YRhI5F4PNxx/sU3J8qEUur8XO5gpKxdp0Qny1HnPJ+x2OAYuoeQKf+2V+yPG8Udq
	TGbX940trv8rB3O38B0N5brzkPE1mDA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
To: Thomas Gleixner <tglx@linutronix.de>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] irqchip/sifive-plic: use hartid as context_id in OF to
 fix AMP conflicts
Message-ID: <aPnGsbufM1OwiNpg@kernel.org>
References: <20251020-fix-plic-amp-v1-1-defe2a99ab80@linux.dev>
 <87bjm1zcvc.ffs@tglx>
 <aPbeb1SEZr7CG2eN@kernel.org>
 <87y0p4xge9.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y0p4xge9.ffs@tglx>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_231014_368230_D8E7D1BC 
X-CRM114-Status: GOOD (  20.94  )
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

T24gVHVlLCBPY3QgMjEsIDIwMjUgYXQgMDg6MjM6NThQTSArMDIwMCwgVGhvbWFzIEdsZWl4bmVy
IHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDIxIDIwMjUgYXQgMDk6MTQsIFRyb3kgTWl0Y2hlbGwgd3Jv
dGU6Cj4gPiBPbiBNb24sIE9jdCAyMCwgMjAyNSBhdCAwNzo0NDo1NVBNICswMjAwLCBUaG9tYXMg
R2xlaXhuZXIgd3JvdGU6Cj4gPj4gT24gTW9uLCBPY3QgMjAgMjAyNSBhdCAxMTo0OSwgVHJveSBN
aXRjaGVsbCB3cm90ZToKPiA+PiA+IEluIGFzeW1tZXRyaWMgbXVsdGktcHJvY2Vzc2luZyAoQU1Q
KSBzY2VuYXJpb3MsIHRoZSBvcmlnaW5hbCBQTElDCj4gPj4gPiBkcml2ZXIgdXNlZCB0aGUgY29u
dGV4dCBsb29wIGluZGV4ICdpJyBhcyBjb250ZXh0X2lkIGZvciBPRiAoZGV2aWNlCj4gPj4gCj4g
Pj4gV2hpY2ggb3JpZ2luYWwgZHJpdmVyIGFuZCB3aGVuIGRpZCBpdCBzdG9wIHRvIHVzZSB0aGUg
Y29udGV4dCBsb29wIGluZGV4Pwo+ID4+IAo+ID4+ID4gdHJlZSkgcGxhdGZvcm1zLiBUaGlzIGNh
dXNlZCBtdWx0aXBsZSBjb250ZXh0cyBmcm9tIGRpZmZlcmVudCBoYXJ0cwo+ID4+ID4gKGUuZy4s
IGNvcmUwIGFuZCBjb3JlNCkgdG8gc2hhcmUgdGhlIHNhbWUgZW5hYmxlX2Jhc2UsIGxlYWRpbmcg
dG8KPiA+PiA+IGNvbmZsaWN0cyB3aGVuIGluaXRpYWxpemluZyB0aGUgUExJQy4KPiA+PiAKPiA+
PiBXaGVuIGRpZCBpdCBzdG9wIHRvIGNhdXNlIHRoZSBpc3N1ZXM/IEFuZCBpZiB0aGUgaXNzdWVz
IGhhdmUgYmVlbgo+ID4+IGFscmVhZHkgcmVzb2x2ZWQsIHdoYXQgaXMgdGhpcyBwYXRjaCBhYm91
dD8KPiA+IFRoZSBpc3N1ZSBzdGlsbCBleGlzdHMgaW4gdGhlIGN1cnJlbnQgZHJpdmVyLgo+ID4g
VGhlIFBMSUMgZHJpdmVyIGZvciBPRi1iYXNlZCBwbGF0Zm9ybXMgYXNzaWducyBjb250ZXh0X2lk
ID0gaSBpbnNpZGUKPiA+IHRoZSBjb250ZXh0IGxvb3AsIHdoaWNoIGFzc3VtZXMgdGhhdCBhbGwg
aGFydHMgYXJlIG51bWJlcmVkIGNvbnRpZ3VvdXNseQo+ID4gc3RhcnRpbmcgZnJvbSAwLgo+ID4K
PiA+IEluIEFNUCBzeXN0ZW1zIChlLmcuLCB3aGVuIExpbnV4IGJvb3RzIGZyb20gaGFydDQgd2hp
bGUgaGFydDAgcnVucyBhbm90aGVyIE9TKSwKPiA+IHRoaXMgYXNzdW1wdGlvbiBicmVha3Mg4oCU
IG11bHRpcGxlIGNvbnRleHRzIGZyb20gZGlmZmVyZW50IGNsdXN0ZXJzIHNoYXJlIHRoZSBzYW1l
Cj4gPiBlbmFibGVfYmFzZShlLmcuLCBjb3JlNCdzIGVuYWJsZV9iYXNlID0gY29yZTAncyBlbmFi
bGVfYmFzZSksIGNhdXNpbmcgY29uZmxpY3RzLgo+ID4KPiA+IFRoaXMgcGF0Y2ggZml4ZXMgdGhl
IHByb2JsZW0gYnkgYXNzaWduaW5nIGNvbnRleHRfaWQgYmFzZWQgb24gdGhlIGFjdHVhbCBoYXJ0
aWQsCj4gPiBlbnN1cmluZyB0aGF0IGVhY2ggaGFydCBjb250ZXh0IG1hcHMgdG8gYSB1bmlxdWUg
ZW5hYmxlIHJlZ2lvbiwKPiA+IHdoaWxlIHByZXNlcnZpbmcgYmVoYXZpb3Igb24gU01QIGFuZCBV
UCBzeXN0ZW1zLgo+ID4KPiA+IERvZXMgaXQgbWFrZSBzZW5zZT8gSSdsbCB1cGRhdGUgbXkgY29t
bWl0IG1lc3NhZ2UgaW4gdGhlIG5leHQgdmVyc2lvbi4KPiAKPiBZZXMuIFRob3VnaCB0aGlzIHN0
aWxsIGFwcGxpZXM6ClRoYW5rIHlvdSBmb3IgeW91ciByZW1pbmRlciBhZ2Fpbi4KCiAgICAgICAg
ICAgICAgICAtIFRyb3kKPiAgCj4gPj4gIyBnaXQgZ3JlcCAnVGhpcyBwYXRjaCcgRG9jdW1lbnRh
dGlvbi9wcm9jZXNzLwo+IAo+IFRoYW5rcywKPiAKPiAgICAgICAgIHRnbHgKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
