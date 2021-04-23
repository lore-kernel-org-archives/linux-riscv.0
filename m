Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D9CC433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:54:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3539961208
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3539961208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l31Xfvt6PBaeAWE67ItRBgViPe7rjyxkPiNQdzxT1RA=; b=DHzX+WJEo9bdrRJOGIo9Wrbc1
	EwxOARy1aXX3WHWPRk50gW3ZypReLitrmuYft65IcxaQlM4sSBTJ40FgCE22vDdWggK3ic0LM1xIL
	F3bubasYcbasjX19eMYNQdn/Lhrwhahh97kxtw2/4arXBRdBE+D54Y4VlkuZ6ECIUU29fWL9/Z0WG
	RkiIywqsnrf5q+5BfYe2rnb3W0XjKhd5qNXCbW+CoFxKq+xVHHQl8QYW7OM+0vFLKfFNtlxtV6nXk
	MFbVvVoEe6LEHr9oO4t3JbS+pmi2q/vA0jr+tWuIAPA8BrOQ3mzAe8ASg76PCF0veDxu9dQfYJp6J
	J3NqZAo0Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmt7-000XCg-IE; Fri, 23 Apr 2021 03:53:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmt5-000XBl-Cz
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 03:53:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=pC1wSYW8P3MRsUCvYmZ9NtuM6XIpOq/mWW07MtGAhmE=; b=RQ6/Mxo1jB/IVV8LFp5h1mNDB0
 i8w8PJAhX3CENRglP/hqKDXVRVXbLKS0Di1SDQWxEfBJwNkeKoqoxsJfbTQyYWPj+IPToq4FxJCcF
 39mt8sEIqaAghDvA3nD98zZjEHyBnbZ6HIjYi0Xjymu0WbJq2ze/pNRb70Tdnl6LHjqZbZzMmANmi
 rReifNttqWBzPQS05YnDfRvyrcG1Ze9bgbCC5yueNHkAcfhZ/99Pl0zZLoGG/BfIJrU6ubWHg9U5T
 VcWiBVA8lGHjnKvdOVZMUMruRG89tS/h5KRzSpKKrRTLDbFf26ScJHaIgNE29RGCFD1mlSN99P2yv
 HgSeE2Zw==;
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmt1-00E7ue-TZ
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 03:53:49 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 13N3rkgU043862
 for <linux-riscv@lists.infradead.org>; Fri, 23 Apr 2021 06:53:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1619150021; x=1621742021;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6JC6V3yB3c17P/ozmgZ9a/Qnmb/kmR5GANxG8psx14o=;
 b=VSTJkNpQANQuiJxvooVcX6x/cLTK+ymcbf49Lii8BdzNNn5oJaqhlt7CyKIBmAZn
 83PjQD8yGw9tQJRhrJnMuoQyC6rvq0xTl3x36NELQwhm7HWbR7Vy/K1TN5iNtKf6
 8OhG5W6leEGVJnlxPtJ7BL62NyQd+GmtosFAJsYeBA09UfIXKm4E4IIXkxXxVxQW
 sJAhrMYthh2NghVWApDQe6flM3YLCnM60+4PsgHBGSn744qe85ZE4ACV05ud5fns
 kCM1ZmriUmYLYg9W/sPmYESJMg9QdxzrIa7Igbdins3IvJFFonLbFeOQwaClAQc1
 SPDF1NToX8UNuCf7TAKDIg==;
X-AuditID: 8b5b014d-a70347000000209f-f6-608244c4ff26
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 F1.9A.08351.4C442806; Fri, 23 Apr 2021 06:53:41 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 23 Apr 2021 06:53:40 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: mick@ics.forth.gr, linux-riscv@lists.infradead.org, Paul Walmsley
 <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] RISC-V: Add kexec/kdump support
Organization: FORTH
In-Reply-To: <mhng-c073ca02-d152-4ef5-86c5-4bcf58154afc@palmerdabbelt-glaptop>
References: <mhng-c073ca02-d152-4ef5-86c5-4bcf58154afc@palmerdabbelt-glaptop>
Message-ID: <d3e45b902a28ec95c25cfa1f34d07d0d@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJLMWRmVeSWpSXmKPExsXSHT1dWfeoS1OCwaljTBaXd81hs9j2uYXN
 ovndOXaLl5d7mC3aZvE7sHq8efmSxePhpktMHpuX1Htcar7O7vF5k1wAaxSXTUpqTmZZapG+
 XQJXxsHmiewFPyUqts5rZmpgfCvcxcjJISFgIrHt6X7WLkYuDiGBo4wS77u3M0IkTCVm7+0E
 s3kFBCVOznzCAmIzC1hITL2ynxHClpdo3jqbGcRmEVCVmL/rNFgNm4CmxPxLB8FsEQF1iQOv
 7zCDLGAWmMQo0XLoJVhCWMBa4uPaQ2A2v4CwxKe7F1lBbE4BP4lr3TPAbCEBX4mFH5+zQBzh
 ItHyeA8LxHEqEh9+P2DvYuTgEAWyN89VmsAoOAvJqbOQnDoLyakLGJlXMQoklhnrZSYX66Xl
 F5Vk6KUXbWIEhzaj7w7G25vf6h1iZOJgPMQowcGsJMLrdbQxQYg3JbGyKrUoP76oNCe1+BCj
 NAeLkjgvr96EeCGB9MSS1OzU1ILUIpgsEwenVANT6+7tE44d3faM55mRsKXksYzE5x9D9c0E
 rpl2/1rzU+k348ZX2UejGf7Vfudq/vhHPOtSdE3NqZkF9x8K715vz5KUetKqd29bnp5itNXK
 z4vljfxsY3s2n9ANylvvvJLBbp+3C2eDhVz12rdXNf4cs9CbVfTF9ehFiYYj3Vkb9ssx9reE
 Km66Prm/teYDb9P3OFXHyfmTLHZ+zT7uwPxt9bS7B8yP9BsyRSx//z7O/0LfpcDjIg1bZ55g
 j9rcI374dNMc6ccq7P8nvrnw3mzfKwXdC77iJSEi0gnuX2+rCiz9xHA8ssuAU3Ld7sTa1t8z
 9iqdKIwL49hw89Gs/IJF2VHJMxNuGnYrnVm4O7BQiaU4I9FQi7moOBEAGqNUStwCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_205348_341638_38590FD8 
X-CRM114-Status: GOOD (  15.68  )
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

zqPPhM65z4IgMjAyMS0wNC0yMyAwNjo0OCwgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IE9uIFRodSwgMjIgQXByIDIwMjEgMjA6MzY6NTYgUERUICgtMDcwMCksIG1pY2tAaWNzLmZvcnRo
LmdyIHdyb3RlOgo+PiDOo8+EzrnPgiAyMDIxLTA0LTIzIDA2OjMwLCBQYWxtZXIgRGFiYmVsdCDO
rc6zz4HOsc+IzrU6Cj4+PiBPbiBNb24sIDA1IEFwciAyMDIxIDAxOjU3OjA3IFBEVCAoLTA3MDAp
LCBtaWNrQGljcy5mb3J0aC5nciB3cm90ZToKPj4+PiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIGtl
eGVjL2tkdW1wIGFuZCBjcmFzaCBrZXJuZWwKPj4+PiBzdXBwb3J0IG9uIFJJU0MtVi4gRm9yIHRl
c3RpbmcgdGhlIHBhdGNoZXMgYSBwYXRjaGVkCj4+Pj4gdmVyc2lvbiBvZiBrZXhlYy10b29scyBp
cyBuZWVkZWQgKHN0aWxsIGEgd29yayBpbgo+Pj4+IHByb2dyZXNzKSB3aGljaCBjYW4gYmUgZm91
bmQgYXQ6Cj4+Pj4gCj4+Pj4gaHR0cHM6Ly9yaXNjdi5pY3MuZm9ydGguZ3Iva2V4ZWMtdG9vbHMt
cGF0Y2hlZC50YXIueHoKPj4+PiAKPj4+PiB2MzoKPj4+PiAgKiBSZWJhc2Ugb24gbmV3ZXIga2Vy
bmVsIHRyZWUKPj4+PiAgKiBNaW5vciBjbGVhbnVwcwo+Pj4+ICAqIFNwbGl0IFVBUEkgY2hhbmdl
cyB0byBhIHNlcGFyYXRlIHBhdGNoCj4+Pj4gICogSW1wcm92ZSAvIGNsZWFudXAgaW5pdF9yZXNv
dXJjZXMKPj4+PiAgKiBSZXNvbHZlIFBhbG1lcidzIGNvbW1lbnRzCj4+Pj4gCj4+Pj4gdjI6Cj4+
Pj4gICogUmViYXNlIG9uIG5ld2VyIGtlcm5lbCB0cmVlCj4+Pj4gICogTWlub3IgY2xlYW51cHMK
Pj4+PiAgKiBQcm9wZXJseSBwb3B1bGF0ZSB0aGUgaW9yZXNvdXJjZXMgdHJlLCBzbyB0aGF0IGl0
Cj4+Pj4gICAgY2FuIGJlIHVzZWQgbGF0ZXIgb24gZm9yIGltcGxlbWVudGluZyBzdHJpY3QgL2Rl
di9tZW0KPj4+PiAgKiBVc2UgbGludXgsdXNhYmxlLW1lbW9yeSBvbiAvbWVtb3J5IGluc3RlYWQg
b2YgYSBuZXcgYmluZGluZwo+Pj4+ICAqIFVTZSBhIHJlc2VydmVkLW1lbW9yeSBub2RlIGZvciBF
TEYgY29yZSBoZWFkZXIKPj4+PiAKPj4+PiBOaWNrIEtvc3NpZmlkaXMgKDUpOgo+Pj4+ICAgUklT
Qy1WOiBBZGQgRU1fUklTQ1YgdG8ga2V4ZWMgVUFQSSBoZWFkZXIKPj4+PiAgIFJJU0MtVjogQWRk
IGtleGVjIHN1cHBvcnQKPj4+PiAgIFJJU0MtVjogSW1wcm92ZSBpbml0X3Jlc291cmNlcwo+Pj4+
ICAgUklTQy1WOiBBZGQga2R1bXAgc3VwcG9ydAo+Pj4+ICAgUklTQy1WOiBBZGQgY3Jhc2gga2Vy
bmVsIHN1cHBvcnQKPj4+PiAKPj4+PiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAg
ICAgfCAgMjUgKysrKwo+Pj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5oICAgICAgICB8
ICAgNiArCj4+Pj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va2V4ZWMuaCAgICAgIHwgIDU0ICsr
KysrKysKPj4+PiAgYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgICAgICAgfCAgIDYgKwo+
Pj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcmFzaF9kdW1wLmMgICAgICB8ICA0NiArKysrKysKPj4+
PiAgYXJjaC9yaXNjdi9rZXJuZWwvY3Jhc2hfc2F2ZV9yZWdzLlMgfCAgNTYgKysrKysrKwo+Pj4+
ICBhcmNoL3Jpc2N2L2tlcm5lbC9rZXhlY19yZWxvY2F0ZS5TICB8IDIyMgo+Pj4+ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPj4+PiAgYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhl
Yy5jICAgfCAxOTMgKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gIGFyY2gvcmlzY3Yva2Vy
bmVsL3NldHVwLmMgICAgICAgICAgIHwgMTEzICsrKysrKysrLS0tLS0tCj4+Pj4gIGFyY2gvcmlz
Y3YvbW0vaW5pdC5jICAgICAgICAgICAgICAgIHwgMTEwICsrKysrKysrKysrKysrCj4+Pj4gIGlu
Y2x1ZGUvdWFwaS9saW51eC9rZXhlYy5oICAgICAgICAgIHwgICAxICsKPj4+PiAgMTEgZmlsZXMg
Y2hhbmdlZCwgNzg3IGluc2VydGlvbnMoKyksIDQ1IGRlbGV0aW9ucygtKQo+Pj4+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZXhlYy5oCj4+Pj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9jcmFzaF9kdW1wLmMKPj4+PiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2NyYXNoX3NhdmVfcmVncy5TCj4+Pj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9rZXhlY19yZWxvY2F0ZS5TCj4+Pj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjLmMKPj4+IAo+
Pj4gVGhhbmtzLiAgVGhlcmUgd2VyZSBzb21lIG1pbm9yIGlzc3VlcyBhbmQgc29tZSBtZXJnZSBj
b25mbGljdHMsIEkgcHV0Cj4+PiB0aGlzIG9uIGZvci1uZXh0IHdpdGggc29tZSBmaXh1cHMuCj4+
IAo+PiBJJ3ZlIHNlbnQgYSB2NCB0aGF0IHNob3VsZG4ndCBoYXZlIG1lcmdlIGNvbmZsaWN0cywg
YWRkcmVzc2luZyBzb21lCj4+IGNvbW1lbnRzIGZyb20gQWxleCBhcyB3ZWxsLCBjb3VsZCB5b3Ug
dXNlIHRoYXQgaW5zdGVhZCBvciBpcyBpdCB0b28gCj4+IGxhdGUKPj4gPwo+IAo+IFRoYW5rcywg
Zm9yIHNvbWUgcmVhc29uIEkgZGlkbid0IHNlZSBpdCB3aGVuIHBva2luZyBhcm91bmQuICBUaGVy
ZSB3YXMKPiBzdGlsbCB0aGF0IG9uZSBpbml0X3Jlc291cmNlcygpIG1lcmdlIGNvbmZsaWN0IGFu
ZCBJIGZpeGVkIHVwIHNvbWUgb2YKPiB0aGUgY29tbWl0IHRleHRzLCBpdCdzIG5vdyBvbiBmb3It
bmV4dCBhcwo+IAo+IGI5NDM5NDExOTgwNCAoSEVBRCAtPiBmb3ItbmV4dCwgcmlzY3YvZm9yLW5l
eHQpIFJJU0MtVjogQWRkIGNyYXNoIAo+IGtlcm5lbCBzdXBwb3J0Cj4gNmU4NDUxNzgyYzkwIFJJ
U0MtVjogQWRkIGtkdW1wIHN1cHBvcnQKPiAwYTA2NTI0MjliZGIgUklTQy1WOiBJbXByb3ZlIGlu
aXRfcmVzb3VyY2VzKCkKPiBkOWE4ODk3ZDZiNWQgUklTQy1WOiBBZGQga2V4ZWMgc3VwcG9ydAo+
IGY1OTkzODA5NWI5NCBSSVNDLVY6IEFkZCBFTV9SSVNDViB0byBrZXhlYyBVQVBJIGhlYWRlcgoK
VGhhbmtzIGEgbG90ICEgSSdsbCBrZWVwIG9uIHdvcmtpbmcgb24gdGhlIHVzZXItc3BhY2UgcGFy
dCBhbmQgc3VibWl0IGl0IApvbiBrZXhlYy10b29scyBsYXRlciBvbi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
