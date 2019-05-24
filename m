Return-Path: <SRS0=JLSQ=TY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E671C072B5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 May 2019 17:40:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E694721773
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 May 2019 17:40:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W4pYqg4J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="qv19RTe1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E694721773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nDcQoAIx4f4FdHD9oQt4oqi3S57WhZZb3eo4J72VzUo=; b=W4pYqg4J1wqD5M4RWkHhhwIGB
	+9myNqYHSrqFGmAUwzkJJqWf8hr2m69tESHkv75AMelvR79IMHBwSc6zjO8QktSUeTyM2xQI6lk4W
	LPL3ZskHhC5eCK7UZiYZE8ZOYzMgd3ccaJgfq8Sjz3FUnwoh0SeqGYHhSeelKKVU29nyzm/HVyuOm
	tywEvaiuEmOCSUWFN5LksWaliE7Wfcc2zvTGGC7V574HZ3k4WTKcIwv4JYZQMqttE8CYmBTSrXHpl
	pvHHQ8Q6Wh4/KN6mdrIIDPNBOiKg4MU/R4wdp2oYZV2Qe0tzEMJtY9Wc5NxQvKVyNkWFLRZzALYA5
	XtCu+zkLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUEAx-0006Tu-OY; Fri, 24 May 2019 17:40:15 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUEAu-0006TY-5X
 for linux-riscv@lists.infradead.org; Fri, 24 May 2019 17:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1558719683; x=1590255683;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0+WAfCZeBdjLc8htSwRnCdsNcQndyxHnxDXFOAnmMRc=;
 b=qv19RTe1zThQyk6eHSiumBsUKtCPi6aQfwM9p0+mlsD1yNS9ZSmZzGCc
 SS/nK55NxT5ZCNQ2gTqbiSYyzVBnB1cUl+sTl4xGW4HWL11LTmiU4z1eG
 4B7tfeYLajCEGJZZmVpgxhb3USr/CCr/J+E3EBahP33wvlN5kp4JMhFH/
 sq9lDz1nRbF2TX04ua1A4Cg06BwAw0rEUtFr2Wa+Lym8asnrYxOfh8OVP
 O6jLUPgbW3aZJs/DJ6rrobyvn+g8fp+je04owj1CpcYQRHedvPyPkE/OY
 l/dbNc1ce25bJpRDUgezMeSFSPgfM5ZSmVFCrelSEXwHj9y6eB+gElPlz w==;
X-IronPort-AV: E=Sophos;i="5.60,507,1549900800"; d="scan'208";a="208554836"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2019 01:41:21 +0800
IronPort-SDR: xPMkS6iM2qgmQqgmrbp9YQg3r679ax/gP+/0jepESQ8yC9AL7tkvpAOdOjwUT9sOxxknbH5JJ6
 GMb1Dl4jprjeXj9i1x5sl2qDeHMi+qgB/aMm8Bn7NpOUEL8WScuFIlMjjBGKXFZ+y7JLhxvwUp
 W/vmX4A8qoVW0bfrkkbjpKqpGiwN2t/2TDaDgbGsTVy98EtM3lsgp0TRaoNeItJ/+nL0Xcui9C
 inwEsVfOvs7u9ZMwCWdHALlOYyOvZpVycp/AYtlT5dX/e1/+agN+5ekhfZaYWlgBgaFEi2dh27
 MvuTAyarjABiwi7bMP/C9QNj
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 24 May 2019 10:17:51 -0700
IronPort-SDR: MKCcocNH4eXcN0L5tj8hOu4NhQISqTT3GhH+7Zkw9p+yqkrL+wUop+A7k70x751NdoQI7E2AHn
 +RGcbkxlAbih1Xmpsb4Fs4ybnCStYy5dUU3WNE6t/QmVBmXWd7pcg4+vAAXJqaAuTBgR+4Ts9g
 PDzKiz3VJvG0mfBnBClrhBWQfoFTbmCMMxnKlYoCG9cADQ5fkPHf6KPFfJRng8be7nvzYowcFd
 VnRT8sR3+gb1/XEgP9EempBqP/kx79FPclxM0G2076YJLcWBCjLwVo0pOAizxyTmP9CarHkT45
 siY=
Received: from unknown (HELO [10.225.100.40]) ([10.225.100.40])
 by uls-op-cesaip01.wdc.com with ESMTP; 24 May 2019 10:40:10 -0700
Subject: Re: 5.2-rc1 boot on Unleashed
To: Troy Benjegerdes <troy.benjegerdes@sifive.com>,
 "Auer, Lukas" <lukas.auer@aisec.fraunhofer.de>
References: <5c1ffb76-b18a-dbae-d3ad-f3d2cd41ee44@wdc.com>
 <alpine.DEB.2.21.9999.1905220942040.20842@viisi.sifive.com>
 <db248e63-c0bc-7fd8-cf2d-d13c8f140036@wdc.com>
 <alpine.DEB.2.21.9999.1905221334460.23235@viisi.sifive.com>
 <8F4FB234-FD5B-4AD6-99BD-57A40A79A024@sifive.com>
 <aac8c9b2-1b8d-e87d-88a5-f13222004a88@wdc.com>
 <2818D3E3-3BDB-442B-822D-0FD221BCCA05@sifive.com>
 <b59c5bba240ef42f90ec26f8588a444391df02c2.camel@aisec.fraunhofer.de>
 <CC10BC34-0799-45D8-980F-804170CF818B@sifive.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <1b70dc1f-c45f-dc04-f3af-f4a2b463d216@wdc.com>
Date: Fri, 24 May 2019 10:40:09 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CC10BC34-0799-45D8-980F-804170CF818B@sifive.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_104012_268883_0712D19E 
X-CRM114-Status: GOOD (  26.54  )
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
Cc: "palmer@sifive.com" <palmer@sifive.com>,
 "bjorn.topel@gmail.com" <bjorn.topel@gmail.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 Jim Jacobsen <jamez@wit.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Jeffery Carr <jcarr@wit.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNS8yNC8xOSA5OjAxIEFNLCBUcm95IEJlbmplZ2VyZGVzIHdyb3RlOgo+IAo+IAo+PiBPbiBN
YXkgMjQsIDIwMTksIGF0IDEwOjM1IEFNLCBBdWVyLCBMdWthcyA8bHVrYXMuYXVlckBhaXNlYy5m
cmF1bmhvZmVyLmRlPiB3cm90ZToKPj4KPj4gT24gRnJpLCAyMDE5LTA1LTI0IGF0IDA5OjQ2IC0w
NTAwLCBUcm95IEJlbmplZ2VyZGVzIHdyb3RlOgo+Pj4+IE9uIE1heSAyMywgMjAxOSwgYXQgMTA6
NTkgUE0sIEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPiB3cm90ZToKPj4+Pgo+Pj4+
IE9uIDUvMjMvMTkgNToyMyBQTSwgVHJveSBCZW5qZWdlcmRlcyB3cm90ZToKPj4+Pj4+IE9uIE1h
eSAyMiwgMjAxOSwgYXQgMzo0MyBQTSwgUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZp
dmUuY29tPiB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiArIEFudXAsIFRyb3kKPj4+Pj4+Cj4+Pj4+PiBP
biBXZWQsIDIyIE1heSAyMDE5LCBBdGlzaCBQYXRyYSB3cm90ZToKPj4+Pj4+Cj4+Pj4+Pj4gT24g
NS8yMi8xOSA5OjQyIEFNLCBQYXVsIFdhbG1zbGV5IHdyb3RlOgo+Pj4+Pj4+PiBBbSBjaGVja2lu
ZyBvbiB0aGlzIG5vdyBhbmQgaG9wZSB0byBoYXZlIHNvbWUgY29uY2x1c2lvbiBvbiBpdCB0aGlz
IHdlZWsuCj4+Pj4+Pj4KPj4+Pj4+PiBUaGFua3MuIEFueSBjaGFuY2UgeW91IGNhbiB0YWtlIGEg
bG9vayBhdCB0aGUgVS1Cb290IGNsb2NrIGRyaXZlciB0byBwYXRjaCBpdAo+Pj4+Pj4+IGFzIHBl
ciB0aGUgRFQgY2hhbmdlcyA/Cj4+Pj4+Pgo+Pj4+Pj4gSSBwcm9iYWJseSB3b24ndCBoYXZlIHRo
ZSBjaGFuY2UgdG8gZ2V0IHRvIGl0IGZvciBhIHdoaWxlLiAgTG9va3MgbGlrZQo+Pj4+Pj4gQW51
cCB3YXMgdGhlIG9uZSB3aG8gcG9zdGVkIHRoZSBjbG9jayBkcml2ZXIgdG8gVS1Cb290IC0gY2Fu
IGhlIHRha2UgYQo+Pj4+Pj4gbG9vayBhdCBpdD8KPj4+Pj4+Cj4+Pj4+PiBXZSd2ZSBhbHNvIGFz
a2VkIFRyb3kgdG8gbG9vayBhdCB1cHN0cmVhbSBVLWJvb3QgcmVsYXRlZCBpc3N1ZXMsIGJ1dAo+
Pj4+Pj4gSSdtIHVuc3VyZSB3aGVuIHBhdGNoZXMgd2lsbCBzdGFydCBmbG93aW5nIHVwc3RyZWFt
Lgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiAtIFBhdWwKPj4+Pj4gSeKAmWQgcHJlZmVyIHRvIGhvbGQg
b2ZmIG9uIGFueSBjaGFuZ2VzIHRvIFUtYm9vdCB1bnRpbCB3ZSBoYXZlIGEgbW9yZSBjb21wbGV0
ZSBwYXRjaCBzZXQuIEdQSU8gYW5kIGV0aGVybmV0IGVudHJpZXMgYXJlIG1pc3NpbmcgZnJvbSB0
aG9zZSBkZXZpY2UgdHJlZXMsIGFuZCB3ZSBoYXZlIGEgd29ya2luZyBVLWJvb3QgZGV2aWNlIHRy
ZWUgbm93LiBJZiB0aGUga2VybmVsIG5lZWRzIHNvbWV0aGluZyBkaWZmZXJlbnQgd2UgY2FuIGxv
YWQgdGhlIGRldmljZSB0cmVlIHRoZSBrZXJuZWwgbmVlZHMgZm9yIGF3aGlsZS4KPj4+Pgo+Pj4+
IEkgZG9uJ3QgdGhpbmsgdGhhdCdzIGEgZ29vZCBpZGVhLiBJdCB3aWxsIHVubmVjZXNzYXJpbHkg
YmxvY2sgZXZlcnlib2R5J3Mgc2V0dXAgdGhhdCBpcyBzdXBwb3NlZCB0byB3b3JrIHdpdGggVS1C
b290LiBJIHByZWZlciBpZiB3ZSBjYW4gcGF0Y2ggVS1Cb290IGFuZCB1bmJsb2NrIGV2ZXJ5Ym9k
eSBzb29uZXIgdGhhbiBsYXRlci4KPj4+Pgo+Pj4+PiBUaGUgVS1ib290IGRldmljZSB0cmVlIGlz
IGdvaW5nIHRvIGhhdmUgc29tZSB0aGluZ3MgaW4gaXQgdGhlIGtlcm5lbCBkb2VzbuKAmXQgY2Fy
ZSBhYm91dCBhbnl3YXksIHNvIHdl4oCZdmUgYWxyZWFkeSBnb3QgZGl2ZXJnZW5jZSBiZXR3ZWVu
IHRoZSB0d28uIElkZWFsbHkgdGhlIFUtYm9vdCB2ZXJzaW9uIGlzIGEgc3VwZXJzZXQgb2YgdGhl
IGtlcm5lbCB2ZXJzaW9uLiBXZSBhbHJlYWR5IGhhZCBvbmUgZGlzcnVwdGl2ZSBjaGFuZ2Ugd2l0
aCB0aGUgY2xvY2sgZHJpdmVyLCBzbyB3aGF0IGlzIHRvIHByZXZlbnQgdGhlcmUgdG8gYmUgbW9y
ZSBkaXNydXB0aXZlIGNoYW5nZXMgaW4gdGhlIGV0aGVybmV0L0dQSU8gZGV2aWNlIHRyZWUgZW50
cmllcyB0aGF0IGdvIGluIHRoZSBrZXJuZWwgdW5sZXNzIHdlIGhhdmUgYSBkcmFmdCBvZiB3aGF0
IHRob3NlIGVudHJpZXMgc2hvdWxkIGxvb2sgbGlrZSB0aGF0IGlzIGFjY2VwdGFibGU/Cj4+Pj4g
SUlSQywgY3VycmVudCBVLUJvb3QgUyBtb2RlIHBvcnQgZG9lc24ndCBuZWVkIGEgR1BJTyBkcml2
ZXIgYW5kIGV0aGVybmV0IGRyaXZlciBpcyBwcm92aWRlZCBieSB0aGUgY29tbW9uIG1hY2IgZHJp
dmVyLiBJZiB0aGVyZSBhcmUgYW55IERUIGNoYW5nZXMgc3VnZ2VzdGVkIGJ5IGtlcm5lbCwgd2Ug
Y2FuIGFsd2F5cyBwYXRjaCBVLUJvb3QuCj4+Pgo+Pj4gVGhlIE0tbW9kZSBwb3J0IHdpbGwgbmVl
ZCBhIEdQSU8gZHJpdmVyLCBhcyB0aGUgbWFjYiBkcml2ZXIgbmVlZHMgcHJvcGVyIGEgcHJvcGVy
IEdQSU8gZHJpdmVyIHRvIHJlc2V0IHRoZSBwaHkuCj4+Pgo+Pj4gSSBoYXZlIG5vIGlzc3VlcyB1
cGRhdGluZyB0aGUgUFJDSSBkcml2ZXIgRFQgZm9ybWF0IGlmIHdlIGFsc28gaGF2ZSB0aGUgcmVz
dCBvZiB0aGUgRFQgZW50cmllcyBuZWVkZWQgdG8gYm9vdCBhIHdvcmtpbmcgc3lzdGVtLCBJIGp1
c3QgaGF2ZSBub3Qgc2VlbiBhbiBleGFtcGxlIG9mIHRoYXQgb3RoZXIgdGhhbiB3aGF0IEkgaGF2
ZSBhdCBodHRwczovL2dpdGh1Yi5jb20vc2lmaXZlL0hpRml2ZV9VLUJvb3QvYmxvYi9yZWdyZXNz
aW9uL2FyY2gvcmlzY3YvZHRzL2hpZml2ZV91NTQwLmR0cwo+Pgo+PiBNeSBwbGFuIHdhcyB0byBh
ZGQgdGhlIFNpRml2ZSBIaUZpdmUgVW5sZWFzaGVkIGRldmljZSB0cmVlIHRvIFUtQm9vdCwKPj4g
b25jZSB0aGUgcmVsZXZhbnQga2VybmVsIHBhdGNoZXMgd2l0aCB0aGUgZGV2aWNlIHRyZWUgZ2V0
IG1lcmdlZC4gSQo+PiB3b3VsZCBrZWVwIGJvdGggaWRlbnRpY2FsIHRvIG1ha2UgaXQgZWFzaWVy
IHRvIHN5bmMgY2hhbmdlcyBmcm9tIHRoZQo+PiBrZXJuZWwgd2l0aCBVLUJvb3QuCj4+CgpUaGF0
IG1ha2VzIHNlbnNlLgoKPj4gVGhhbmtzLAo+PiBMdWthcwo+IAo+IFdlIG5lZWQgdG8gc3VwcG9y
dCBVYm9vdCBpbiBNLW1vZGUgYXMgdGhlIGZpcnN0LXN0YWdlIGJvb3Rsb2FkZXIsIAoKR3JlYXQu
IFdlIHdpbGwgaGF2ZSBmb2xsb3dpbmcgYm9vdCBmbG93IGluIHRoYXQgY2FzZS4KClUtQm9vdCAo
TS1Nb2RlKS0+T3BlblNCSS9CQkwtPlUtQm9vdChTLU1vZGUpLT5MaW51eC4KCkkgYW0gbW9yZSBj
b25jZXJuZWQgYWJvdXQgYnJlYWthZ2UgYW5kIHBhdGNoaW5nIG9mIFUtQm9vdCBTIG1vZGUgYXQg
dGhpcyAKcG9pbnQuCgphbmQgdGhpcyB3aWxsIHJlcXVpcmUgRERSIGluaXQgY29kZS4gVGhlIGJl
c3Qgd2F5IHRvIGRvIHRoYXQgc2VlbXMgdG8gYmUgCmZvbGxvdyB0aGUgZXhhbXBsZSB0aGF0IHdh
cyB1c2VkIGZvciBhIFJvY2tjaGlwIHBhcnQgd2l0aCBhIHNpbWlsaWFyIEREUiAKY29udHJvbGxl
ciBJUC4gVGhlIEREUiBpbml0IGNvZGUgdXNlcyBib2FyZC1zcGVjaWZpYyBkYXRhIGZyb20gdGhl
IApkZXZpY2UgdHJlZSB0byBwcm9ncmFtIHRoZSBjb250cm9sbGVyLCBzbyB0aGUgTS1tb2RlIFVi
b290IHdpbGwgbmVlZCB0byAKaGF2ZSBlbnRyaWVzIHRoZSBrZXJuZWwgZG9lc27igJl0IGNhcmUg
YWJvdXQuCj4gCj4gSWYgd2UgYXJlIGdvaW5nIHRvIGtlZXAgYm90aCBVLWJvb3QgYW5kIEtlcm5l
bCBkZXZpY2UgdHJlZXMgaWRlbnRpY2FsIHRoZW4gd2UgbmVlZCBzb21lIGJ1eS1pbiBhbmQgYWdy
ZWVtZW50IGZyb20ga2VybmVsIGRldmVsb3BlcnMgb24gaG93IHRoYXQgZGF0YSBnb2VzIGluIHRo
ZSBrZXJuZWwuCj4gCj4gSXQgc2VlbXMgYSBsb3QgZWFzaWVyIGlmIHdlIHVzZSBpbmNsdWRlIGZp
bGVzIGFuZCB0aGUgVS1ib290IGRldmljZSB0cmVlIGhhcyBhIGZldyBleHRyYSBpbmNsdWRlcyBm
b3IgRERSIGluaXQgYW5kIG90aGVyIHRoaW5ncyB0aGF0IGFyZSBub3QgcmVsZXZhbnQgdG8gdGhl
IGtlcm5lbC4KPiAKCgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
