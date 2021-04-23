Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4664C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:38:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CEBE60724
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CEBE60724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6YnqTQvkTAsfgqqZKnKfNCRcxLBDQR4atEVbOQCuQMM=; b=b6svZD6U6kEUG2cDg0nYO27dE
	HhJeixmDQD7GLdZM8vXlLX54M3yKMj8wR8WTVly1m781GrXLAY1A+YLPrIUn1tZPjWrnmhRd/u8aq
	IelT04Zf/XNckMtzZ/1PbdiU0Y4X7bRXBeaoo6RfBVfqgiDHUXeh0fnT/mZ1UFAPyDbgYxY4AgIaf
	hHn8htwNxPGRi2pgT7bgFMJI4XIboJd0DS9L/06XK87hfgEt4DUVoJ9cg5ZJ+CI45iQma64wGeXNl
	8ZMENj8NWjtjj6qrCGj/4QJAabO/HPax90XP2Bb+1jhp8dGb2VCeqofjcjEEPLft5s+TR1ilSzLC7
	hKs8U3xXg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmeE-000Us1-NX; Fri, 23 Apr 2021 03:38:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmd6-000UXL-Hl
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 03:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=W8wCk14EWWBMhlecOpj/7+cvs9TcMMzLkbT/XEs9FLQ=; b=se2VUHbf+/S9icqd86uk0Tk1OV
 aYKInNjGbu5ShVBZjysmQoVQZq49so7dlOI0G3BrpaN10BBhGUWt8NJFnGwGEpFRPwMKQjB0X3bbQ
 ++tqxRHqqAbPQzbwQ4kzJ4Gr8kghhUGvd8FFODeymX1nomnzblStm6Oyy3FDxV4v9QDEa0VqH+QQR
 X7IZluPX4O+8qdin0DXXLeUxwsut6Hug0nKyTj19JPtvb/W1FRgYk2LEDOrsWTeZaGr0FYwh0fFlD
 s0aXKbgCktMBpdOkJtOVrv8fCRry059LZh/Iw/Jwwtqn7mbz/m0ZHxAotcu9iH0oWjOl2zJNzsIs3
 W2NEL/tw==;
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmd1-00E7T4-Os
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 03:37:17 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 13N3b2fF043700
 for <linux-riscv@lists.infradead.org>; Fri, 23 Apr 2021 06:37:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1619149017; x=1621741017;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZbUCIK+vNMXLT6bt5IcYDuPKpMJvQ+n7NbeVwMpT5/0=;
 b=FVpPsRSuS/RsEqijSUV8uTTjOLRi503VnPxsanGaP3fHa3d6xVrnBIGtypFoLBEG
 Loln0W7HGDMFvF3XRc9NWA7h/xVH4aPVwl/rmvBiJWuxGQW2Mm9XD6FQ0jG96E8r
 R4v18WILQ/+xA7POlk79HkmgNr3T874pnH8fTX/hnYFwpFQzwWohfCUNLxJAw8mu
 FulijclffSO5lhweAsb4jIAI5vjL4kM1jO8lppJeFfNd9reUs8o04lFLepFVy0u8
 VyH/fRUCK9YkFsin65HChB0AoynmIlZKTsFq9pVEg4DkaPEMRiL7OcqjYWsxek9l
 wjTgkE/jQVIaTTxUw4M6jA==;
X-AuditID: 8b5b014d-a4c337000000209f-81-608240d9df52
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 1B.8A.08351.9D042806; Fri, 23 Apr 2021 06:36:57 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 23 Apr 2021 06:36:56 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: mick@ics.forth.gr, linux-riscv@lists.infradead.org, Paul Walmsley
 <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] RISC-V: Add kexec/kdump support
Organization: FORTH
In-Reply-To: <mhng-4f2d27cc-6dc2-4d3d-ae61-5681b15372b7@palmerdabbelt-glaptop>
References: <mhng-4f2d27cc-6dc2-4d3d-ae61-5681b15372b7@palmerdabbelt-glaptop>
Message-ID: <0ce30336b7dfaaf14a20e72e990d70f5@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJLMWRmVeSWpSXmKPExsXSHT1dWfemQ1OCwYHz/BaXd81hs9j2uYXN
 ovndOXaLl5d7mC3aZvE7sHq8efmSxePhpktMHpuX1Htcar7O7vF5k1wAaxSXTUpqTmZZapG+
 XQJXxr85/1gL9gpV/G2fw97AuIevi5GTQ0LARKJ16kzWLkYuDiGBo4wS29ceY4VImErM3tvJ
 CGLzCghKnJz5hAXEZhawkJh6ZT8jhC0v0bx1NjOIzSKgKvH22RqwXjYBTYn5lw6C1YsIqEsc
 eH2HGWQBs8AkRomWQy/BEsIC1hIf1x4Cs/kFhCU+3b0I1swp4Cdxamc/O4gtJOAr8efSDyaI
 I1wk2k91s0EcpyLx4fcDoBoODlEge/NcpQmMgrOQnDoLyamzkJy6gJF5FaNAYpmxXmZysV5a
 flFJhl560SZGcGgz+u5gvL35rd4hRiYOxkOMEhzMSiK8XkcbE4R4UxIrq1KL8uOLSnNSiw8x
 SnOwKInz8upNiBcSSE8sSc1OTS1ILYLJMnFwSjUwNUVuPHPp9Z6EdgnpHsGESxMY7Z4t/Tll
 8i+tonC/rRfavvbPfxtsYxPH/HTLwxlhErclJk584L9u0xaHF87Wrt+v9F86+Xmh0I2Px9Yn
 yYhsmHnRJ7x9am/x/sNZ/6ZlzcidFP9xfYAK/7aoJZctzojPnvI7Z8Ft3SdHFgu9OZfUdbM8
 QaP98SrOBFvuVUus3ZcxFR9rmSfms63t8cxCh8l3/M4L7Tac86E9oro6rfQts8/GOYqBfdZX
 Kp+umHN29kW2Bw9NFyr17y81yOsWX5h3bcKRZ0zBbKKpLNqHmardXnGlfL89rcza0/bR7sr5
 k59+XbyyOrzvINO9rviTicGeU/LF7j5TZFu5M2e16gclluKMREMt5qLiRADFU4G93AIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_203716_191692_ECAD8566 
X-CRM114-Status: GOOD (  14.30  )
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

zqPPhM65z4IgMjAyMS0wNC0yMyAwNjozMCwgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IE9uIE1vbiwgMDUgQXByIDIwMjEgMDE6NTc6MDcgUERUICgtMDcwMCksIG1pY2tAaWNzLmZvcnRo
LmdyIHdyb3RlOgo+PiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIGtleGVjL2tkdW1wIGFuZCBjcmFz
aCBrZXJuZWwKPj4gc3VwcG9ydCBvbiBSSVNDLVYuIEZvciB0ZXN0aW5nIHRoZSBwYXRjaGVzIGEg
cGF0Y2hlZAo+PiB2ZXJzaW9uIG9mIGtleGVjLXRvb2xzIGlzIG5lZWRlZCAoc3RpbGwgYSB3b3Jr
IGluCj4+IHByb2dyZXNzKSB3aGljaCBjYW4gYmUgZm91bmQgYXQ6Cj4+IAo+PiBodHRwczovL3Jp
c2N2Lmljcy5mb3J0aC5nci9rZXhlYy10b29scy1wYXRjaGVkLnRhci54ego+PiAKPj4gdjM6Cj4+
ICAqIFJlYmFzZSBvbiBuZXdlciBrZXJuZWwgdHJlZQo+PiAgKiBNaW5vciBjbGVhbnVwcwo+PiAg
KiBTcGxpdCBVQVBJIGNoYW5nZXMgdG8gYSBzZXBhcmF0ZSBwYXRjaAo+PiAgKiBJbXByb3ZlIC8g
Y2xlYW51cCBpbml0X3Jlc291cmNlcwo+PiAgKiBSZXNvbHZlIFBhbG1lcidzIGNvbW1lbnRzCj4+
IAo+PiB2MjoKPj4gICogUmViYXNlIG9uIG5ld2VyIGtlcm5lbCB0cmVlCj4+ICAqIE1pbm9yIGNs
ZWFudXBzCj4+ICAqIFByb3Blcmx5IHBvcHVsYXRlIHRoZSBpb3Jlc291cmNlcyB0cmUsIHNvIHRo
YXQgaXQKPj4gICAgY2FuIGJlIHVzZWQgbGF0ZXIgb24gZm9yIGltcGxlbWVudGluZyBzdHJpY3Qg
L2Rldi9tZW0KPj4gICogVXNlIGxpbnV4LHVzYWJsZS1tZW1vcnkgb24gL21lbW9yeSBpbnN0ZWFk
IG9mIGEgbmV3IGJpbmRpbmcKPj4gICogVVNlIGEgcmVzZXJ2ZWQtbWVtb3J5IG5vZGUgZm9yIEVM
RiBjb3JlIGhlYWRlcgo+PiAKPj4gTmljayBLb3NzaWZpZGlzICg1KToKPj4gICBSSVNDLVY6IEFk
ZCBFTV9SSVNDViB0byBrZXhlYyBVQVBJIGhlYWRlcgo+PiAgIFJJU0MtVjogQWRkIGtleGVjIHN1
cHBvcnQKPj4gICBSSVNDLVY6IEltcHJvdmUgaW5pdF9yZXNvdXJjZXMKPj4gICBSSVNDLVY6IEFk
ZCBrZHVtcCBzdXBwb3J0Cj4+ICAgUklTQy1WOiBBZGQgY3Jhc2gga2VybmVsIHN1cHBvcnQKPj4g
Cj4+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAyNSArKysrCj4+ICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5oICAgICAgICB8ICAgNiArCj4+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2tleGVjLmggICAgICB8ICA1NCArKysrKysrCj4+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9NYWtlZmlsZSAgICAgICAgICB8ICAgNiArCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcmFz
aF9kdW1wLmMgICAgICB8ICA0NiArKysrKysKPj4gIGFyY2gvcmlzY3Yva2VybmVsL2NyYXNoX3Nh
dmVfcmVncy5TIHwgIDU2ICsrKysrKysKPj4gIGFyY2gvcmlzY3Yva2VybmVsL2tleGVjX3JlbG9j
YXRlLlMgIHwgMjIyIAo+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICBhcmNoL3Jp
c2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjLmMgICB8IDE5MyArKysrKysrKysrKysrKysrKysrKysr
KysKPj4gIGFyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgICAgICAgICAgIHwgMTEzICsrKysrKysr
LS0tLS0tCj4+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAgICAgICAgICAgICB8IDExMCArKysr
KysrKysrKysrKwo+PiAgaW5jbHVkZS91YXBpL2xpbnV4L2tleGVjLmggICAgICAgICAgfCAgIDEg
Kwo+PiAgMTEgZmlsZXMgY2hhbmdlZCwgNzg3IGluc2VydGlvbnMoKyksIDQ1IGRlbGV0aW9ucygt
KQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va2V4ZWMuaAo+
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2NyYXNoX2R1bXAuYwo+PiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2NyYXNoX3NhdmVfcmVncy5TCj4+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwva2V4ZWNfcmVsb2NhdGUuUwo+
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYwo+
IAo+IFRoYW5rcy4gIFRoZXJlIHdlcmUgc29tZSBtaW5vciBpc3N1ZXMgYW5kIHNvbWUgbWVyZ2Ug
Y29uZmxpY3RzLCBJIHB1dAo+IHRoaXMgb24gZm9yLW5leHQgd2l0aCBzb21lIGZpeHVwcy4KCkkn
dmUgc2VudCBhIHY0IHRoYXQgc2hvdWxkbid0IGhhdmUgbWVyZ2UgY29uZmxpY3RzLCBhZGRyZXNz
aW5nIHNvbWUgCmNvbW1lbnRzIGZyb20gQWxleCBhcyB3ZWxsLCBjb3VsZCB5b3UgdXNlIHRoYXQg
aW5zdGVhZCBvciBpcyBpdCB0b28gbGF0ZSAKPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
