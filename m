Return-Path: <SRS0=ZHC4=QE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B484C282C8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 11:18:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0EDC214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 11:18:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AGxLtdzI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Y5dYVm3B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0EDC214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3dTjiqhbvQByR24RvS7CpfSQsQMxlbHTN/tpE0OvOH4=; b=AGxLtdzIT5xfUWMMvmHp1Iu0y
	lA/8ILkyjEsldutZxH9WJ+AHyeEs2Lq4HvToCW7WsFeyZXPUW/2h5eLCtYDAKt372/hp30A/dXFDb
	itnh3V1uY0fKXs7qS6sDughHEOhwRP2KrgRNIkmagDB8jLfroZHYg1d9wfcg2l67B8bPjPTCZO3ia
	ZLVmv4bdAYIDJxGeeNe/yEG1baAhIBQ180KifzZpOTPK6CnGB3eOR2AzUc+uTRu/PQOtKs39VyLIR
	Nm6RqusUfzmqmKsF+0cI4LgzT9AltxVh6jPTqb4VsTHbepAmOYJ4PM51Wv+s3HrSFqYIW12pgQLBT
	bmIc/fDLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go4vp-0001e9-45; Mon, 28 Jan 2019 11:18:25 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go4vj-0001Ws-Qu
 for linux-riscv@bombadil.infradead.org; Mon, 28 Jan 2019 11:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gtXxugxU2MeOpju1edzx+A3LNvnhnWBLQgPpxbEgKgI=; b=Y5dYVm3BR7ygV5ytjFERZfEuUe
 qfiZGsvFlpmFM02lxkMJFTBk0l2g9IOXhZUcPxbaM8f+AI7EHwixI3PTVoRqtZ4LVygOGGAWuex0s
 5eGSK8nlxrmPLItDEwpRhehPC9riGC1nX9+I4375W6eY23iy3L7jwaJdgyr5aCVgCsV/2SnnSuKPt
 Z6ffPxqaKUCmtvab8pyIRCcyHvqs3SCQK+HL8iWrTjMZJfI8eFmtqS+zZXM5S6cLGHGkfv0pvrzQ6
 hLG0/Gmfo/bHImQIxNNJ2S1HzK6vhBQjuW+smGohkAz5AcVmB0CforE84OWB8lufj6+i5a5okKZ5J
 Ee0bgS1w==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go4vg-0006dw-JW
 for linux-riscv@lists.infradead.org; Mon, 28 Jan 2019 11:18:17 +0000
Received: from [10.30.1.20] (lneuilly-657-1-5-103.w81-250.abo.wanadoo.fr
 [81.250.144.103]) (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id E76CE100005;
 Mon, 28 Jan 2019 11:17:36 +0000 (UTC)
Subject: Re: [PATCH 3/3] riscv: Adjust mmap base address at a third of task
 size
From: Alexandre Ghiti <alex@ghiti.fr>
To: Palmer Dabbelt <palmer@sifive.com>
References: <c45285f7-9b05-9f04-a5a0-5d5dc075bb1b@ghiti.fr>
 <mhng-390e0f09-77a1-4943-99a6-6faba4632383@palmer-si-x1c4>
 <24d86d8d-e1c4-6221-3f5c-84fdaa56e5b4@ghiti.fr>
 <5f0af912-7c79-2aa9-c5c9-89f90a1d8a65@ghiti.fr>
Message-ID: <36aeec34-cab5-5f62-a0c6-ea6d03427830@ghiti.fr>
Date: Mon, 28 Jan 2019 12:17:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <5f0af912-7c79-2aa9-c5c9-89f90a1d8a65@ghiti.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_061816_830960_07B7C429 
X-CRM114-Status: GOOD (  26.48  )
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
Cc: mingo@kernel.org, aou@eecs.berkeley.edu, catalin.marinas@arm.com,
 ndesaulniers@google.com, aghiti@upmem.com,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 akpm@linux-foundation.org, linux-riscv@lists.infradead.org,
 mike.kravetz@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAwMS8yNy8yMDE5IDA1OjU3IFBNLCBBbGV4IEdoaXRpIHdyb3RlOgo+IE9uIDEvMjYvMTkg
NDoyMyBBTSwgQWxleCBHaGl0aSB3cm90ZToKPj4gT24gMS8yNS8xOSAyOjAyIFBNLCBQYWxtZXIg
RGFiYmVsdCB3cm90ZToKPj4+IE9uIFR1ZSwgMTUgSmFuIDIwMTkgMDg6MDI6MDYgUFNUICgtMDgw
MCksIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+Pj4+IE9uIE1vbiwgRGVjIDEwLCAyMDE4IGF0
IDA2OjIxOjQ2QU0gKzAwMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4+Pj4gVGhpcyByYXRp
byBpcyB0aGUgbW9zdCB1c2VkIGFtb25nIGFsbCBvdGhlciBhcmNoaXRlY3R1cmVzIGFuZCBtYWtl
Cj4+Pj4+IGljYWNoZV9oeWdpZW5lIGxpYmh1Z2V0bGJmcyB0ZXN0IHBhc3M6IHRoaXMgdGVzdCBt
bWFwIGxvdHMgb2YKPj4+Pj4gaHVnZXBhZ2VzIHdob3NlIGFkZHJlc3Nlcywgd2l0aG91dCB0aGlz
IHBhdGNoLCByZWFjaCB0aGUgZW5kIG9mCj4+Pj4+IHRoZSBwcm9jZXNzIHVzZXIgYWRkcmVzcyBz
cGFjZS4KPj4+Pgo+Pj4+IFRoaXMgZG9lcyBpbmRlZWQgbG9vayBjb21tb24sIHNvIHRoaXMgbG9v
a3Mgc2Vuc2libGUgdG8gbWUgYW5kIG1pZ2h0Cj4+Pj4gYmUgd29ydGggcGlja2luZyB1cCBBU0FQ
IGV2ZW4gd2l0aG91dCB0aGUgaHVnZXRsYiBzdXBwb3J0Ogo+Pj4+Cj4+Pj4gUmV2aWV3ZWQtYnk6
IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+Pj4KPj4+IE1ha2VzIHNlbnNlIHRvIG1l
LsKgIEknbGwgdGFrZSBpdCBpbiB0byB0aGUgbmV4dCBQUi4KPj4+Cj4+Pj4gSSB3b25kZXIgaWYg
d2Ugc2hvdWxkIHByb3ZpZGUgdGhpcyB2YWx1ZSBhcyBhIGRlZnVhbHQKPj4+PiBUQVNLX1VOTUFQ
UEVEX0JBU0UgaWYgdGhlIGFyY2hpdGVjdHVyZSBkb2Vzbid0IHByb3ZpZGUgb25lLgo+Pj4KPj4+
IExvb2tzIGxpa2UgYXJtNjQgZGl2aWRlcyBieSA0IGluc3RlYWQgb2YgMy7CoCBJdCBhcHBlYXJz
IHRvIGhhdmUgYmVlbiAKPj4+IHRoYXQgd2F5IHNpbmNlIHRoZSBzdGFydDoKPj4+Cj4+PiDCoMKg
IGNvbW1pdCA0ZjA0ZDhmMDA1NDUxMTBhMGU1MjVhZTJmYjYyYWIzOGNiNDE3MjM2Cj4+PiDCoMKg
IEF1dGhvcjogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPj4+IMKg
wqAgRGF0ZTrCoMKgIE1vbiBNYXIgNSAxMTo0OToyNyAyMDEyICswMDAwCj4+PiDCoMKgIMKgwqDC
oMKgwqDCoCBhcm02NDogTU1VIGRlZmluaXRpb25zCj4+PiDCoMKgwqDCoMKgwqAgLi4uCj4+Pgo+
Pj4gc28gbWF5YmUgdGhhdCdzIHRoZSByaWdodCBhbnN3ZXI/Cj4+Cj4+IE1heWJlLCBJIGNhbid0
IGZpbmQgZXhwbGFuYXRpb25zIHJlZ2FyZGluZyB0aGlzIGFyYml0cmFyeSB2YWx1ZS4KPj4KPj4+
Cj4+PiBPbiBUdWUsIDE1IEphbiAyMDE5IDEwOjU0OjI3IFBTVCAoLTA4MDApLCBhbGV4QGdoaXRp
LmZyIHdyb3RlOgo+Pj4+IE9uIDEvMTUvMTkgNDowMiBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3Jv
dGU6Cj4+Pj4+IE9uIE1vbiwgRGVjIDEwLCAyMDE4IGF0IDA2OjIxOjQ2QU0gKzAwMDAsIEFsZXhh
bmRyZSBHaGl0aSB3cm90ZToKPj4+Pj4+IFRoaXMgcmF0aW8gaXMgdGhlIG1vc3QgdXNlZCBhbW9u
ZyBhbGwgb3RoZXIgYXJjaGl0ZWN0dXJlcyBhbmQgbWFrZQo+Pj4+Pj4gaWNhY2hlX2h5Z2llbmUg
bGliaHVnZXRsYmZzIHRlc3QgcGFzczogdGhpcyB0ZXN0IG1tYXAgbG90cyBvZgo+Pj4+Pj4gaHVn
ZXBhZ2VzIHdob3NlIGFkZHJlc3Nlcywgd2l0aG91dCB0aGlzIHBhdGNoLCByZWFjaCB0aGUgZW5k
IG9mCj4+Pj4+PiB0aGUgcHJvY2VzcyB1c2VyIGFkZHJlc3Mgc3BhY2UuCj4+Pj4+IFRoaXMgZG9l
cyBpbmRlZWQgbG9vayBjb21tb24sIHNvIHRoaXMgbG9va3Mgc2Vuc2libGUgdG8gbWUgYW5kIG1p
Z2h0Cj4+Pj4+IGJlIHdvcnRoIHBpY2tpbmcgdXAgQVNBUCBldmVuIHdpdGhvdXQgdGhlIGh1Z2V0
bGIgc3VwcG9ydDoKPj4+Pj4KPj4+Pj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPgo+Pj4+Pgo+Pj4+PiBJIHdvbmRlciBpZiB3ZSBzaG91bGQgcHJvdmlkZSB0aGlz
IHZhbHVlIGFzIGEgZGVmdWFsdAo+Pj4+PiBUQVNLX1VOTUFQUEVEX0JBU0UgaWYgdGhlIGFyY2hp
dGVjdHVyZSBkb2Vzbid0IHByb3ZpZGUgb25lLgo+Pj4+Cj4+Pj4gVGhhbmtzIGZvciB5b3VyIHJl
dmlldy4KPj4+PiBJIHRoaW5rIHlvdSdyZSByaWdodCByZWdhcmRpbmcgaGF2aW5nIGEgZGVmYXVs
dCB2ZXJzaW9uIG9mCj4+Pj4gVEFTS19VTk1BUFBFRF9CQVNFLAo+Pj4+IEkgd2lsbCBwcm9wb3Nl
IHNvbWV0aGluZy4KPj4+Cj4+PiBTb3VuZHMgZ29vZCB0byBtZS7CoCBJIGRvbid0IHNlZSBhbnl0
aGluZywgc28gSSdtIHN0aWxsIGdvaW5nIHRvIHRha2UgCj4+PiB0aGUgcGF0Y2ggLS0gd2UgY2Fu
IGFsd2F5cyBkcm9wIHRoZSByZWR1bmRhbnQgZGVmaW5pdGlvbiBsYXRlci4KPj4KPj4gSSBkaWQg
bm90IHByb3Bvc2UgYW55dGhpbmcgeWV0LCBJIHdpbGwgdGFrZSB0aGUgdGltZSB0byBmaW5kIAo+
PiBzb21ldGhpbmcgbW9yZSBjb25zaXN0ZW50Lgo+Pgo+PiBUaGFua3MgUGFsbWVyLAo+Pgo+Pgo+
Cj4gSGkgUGFsbWVyLAo+Cj4gSSBoYXZlIGp1c3Qgc2VudCBhbm90aGVyIHBhdGNoIHJlZ2FyZGlu
ZyB0aGlzIGlzc3VlLCBJIHRoaW5rIGJvdGggYXJlIAo+IG5lZWRlZCwgSSBkb24ndCBrbm93Cj4g
aG93IHlvdSB3YW50IG1lIHRvIHByb2NlZWQsIHNob3VsZCBJIG1lcmdlIHRoZW0sIHNob3VsZCBJ
IHJlYmFzZSB0aGlzIAo+IG9uZSBvbiB0b3Agb2YgdGhlIG5ldwo+IG9uZSAob3IgdGhlIGNvbnRy
YXJ5KS4uLgo+Cj4gVGhhbmtzLAo+Cj4gQWxleCAKCkkgc2hvdWxkIGhhdmUgdGhvdWdodCBtb3Jl
OiBJIHdpbGwgc2VuZCBhbm90aGVyIHZlcnNpb24Kb2YgbXkgdG9wLWRvd24gcGF0Y2ggcmViYXNl
ZCBhZ2FpbnN0IHRoaXMgb25lLCBiZWNhdXNlIHRoaXMgcGF0Y2gKaXMgcmVxdWlyZWQuCgpJbmRl
ZWQsIHRoZXJlIGFyZSAyIG1tYXAgYWxsb2NhdGlvbiBtb2RlczoKCi0gYm90dG9tLXVwIHdoaWNo
IHN0YXJ0cyBhbGxvY2F0aW9uIHVzaW5nIFRBU0tfVU5NQVBQRURfQkFTRSBhcwogwqAgYmFzZSBh
ZGRyZXNzLAotIHRvcC1kb3duIHdoaWNoIGNhbiBiZSB1c2VkIG9ubHkgaWYgdGhlIHN0YWNrIHNp
emUgaGFzIGEgbGltaXQgYW5kCiDCoCBjdXJyZW50IHBlcnNvbmFsaXR5IGRvZXMgbm90IGhhdmUg
QUREUl9DT01QQVRfTEFZT1VUIHNldC4KClNvLCBpbiBhbnkgY2FzZSwgd2UgbmVlZCB0byBwcm92
aWRlIHRoZSBib3R0b20gdXAgYWxsb2NhdGlvbiBzY2hlbWUKYW5kIHRoZW4gdGhpcyBwYXRjaCBp
cyByZXF1aXJlZC4KClNvcnJ5IGZvciB0aGUgbm9pc2UsCgpBbGV4Cgo+Cj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
