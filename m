Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 729D2C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 15:50:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 433972085B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 15:50:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fHSTQegP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="beok7L5s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 433972085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kD9pDKcakpat4Z52Z0a2wac3kILoxJL5wj0CsCWnDp0=; b=fHSTQegPvQr8Xo
	kUomKsDm87gUYEicgtoIM3ek+Bq+BxsfcjsngMEe7R8YkpBO4/yE3Geb12egOXnGXqg3l7pdEQQno
	v5hc0sLkw83SGiOPsQ3V7GwZAEKo7UomiQtmGzfW71iGv5j8MzuXY3MjNJ8E67ImtKkDBAdXqDobY
	PczLXpzNiWxGZ93rG3FDWkdRYk6c2RlAt6niCwW8Oc4/TXC5Lf7ktsZ9JOh/GpU1hejT1K8WhCJaH
	Elnc94YtjXdl/Lf7K7N4auUE0+gLCeiv691FmQwkIxibuX9u8a3KjXUVlapVILgXIrBWEYHfaufz6
	Kh4ugZnK3/JMvr4Tm39Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gK3cX-00086E-HE; Tue, 06 Nov 2018 15:50:25 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK3cV-000863-5B
 for linux-riscv@bombadil.infradead.org; Tue, 06 Nov 2018 15:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TIHv4oOpbxcg+V0HD5+A3nWiiEzRKZrot2sUpf7IQCE=; b=beok7L5sgv7yEPdseg7ueem8Wc
 APSvj+jm8QGVWboNTvNuwGUK4FeIL2Udc+RC8NPxF8Hb2mk6kiuEMkqixdqB7InFYCM577TeEHwMQ
 N65AxxH4VZXGjeuYx89sugYuSxzcS4FqvO2mC99Ek1LfjWmeiooRx7rs3euXj4p2FVtvZH2qxFuQf
 r1+oyOjfEbUYptgyYkdM4zaSMOev6uKfjAGRuMdkhzzyW5td5zix7x0EvD1hUx5nXcbDcYQh0aqvt
 kWFXmpVebYiDKk2fK2zRxrAt4i+uymn3wK2qZDceWhomuE7EFGxMatDTVuNrmVexJ9yo3xk+oTxBY
 tRwBKgNg==;
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK3cR-0008Dk-Qn
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 15:50:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3987BEBD;
 Tue,  6 Nov 2018 07:50:08 -0800 (PST)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D61D73F5CF;
 Tue,  6 Nov 2018 07:50:05 -0800 (PST)
Date: Tue, 6 Nov 2018 15:50:00 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [RFC 0/2] Add RISC-V cpu topology
Message-ID: <20181106155000.GA25372@e107155-lin>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
 <20181106141331.GA28458@e107155-lin>
 <969fc2a5198984e0dfe8c3f585dc65f9@mailhost.ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <969fc2a5198984e0dfe8c3f585dc65f9@mailhost.ics.forth.gr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_105020_034624_B550B1C6 
X-CRM114-Status: GOOD (  41.74  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 alankao@andestech.com, hch@infradead.org, anup@brainfault.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, zong@andestech.com,
 Atish Patra <atish.patra@wdc.com>, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106155000.edWDkHXf_bQanRTAE4v_aF_--vUyVV1ihBTbYrOIs_Y@z>

T24gVHVlLCBOb3YgMDYsIDIwMTggYXQgMDU6MjY6MDFQTSArMDIwMCwgTmljayBLb3NzaWZpZGlz
IHdyb3RlOgo+IM6jz4TOuc+CIDIwMTgtMTEtMDYgMTY6MTMsIFN1ZGVlcCBIb2xsYSDOrc6zz4HO
sc+IzrU6Cj4gPiBPbiBGcmksIE5vdiAwMiwgMjAxOCBhdCAwODo1ODozOVBNICswMjAwLCBOaWNr
IEtvc3NpZmlkaXMgd3JvdGU6Cj4gPiA+IEhlbGxvIEFsbCwKPiA+ID4KPiA+ID4gzqPPhM65z4Ig
MjAxOC0xMS0wMiAwMTowNCwgQXRpc2ggUGF0cmEgzq3Os8+BzrHPiM61Ogo+ID4gPiA+IFRoaXMg
cGF0Y2ggc2VyaWVzIGFkZHMgdGhlIGNwdSB0b3BvbG9neSBmb3IgUklTQy1WLiBJdCBjb250YWlu
cwo+ID4gPiA+IGJvdGggdGhlIERUIGJpbmRpbmcgYW5kIGFjdHVhbCBzb3VyY2UgY29kZS4gSXQg
aGFzIGJlZW4gdGVzdGVkIG9uCj4gPiA+ID4gUUVNVSAmIFVubGVhc2hlZCBib2FyZC4KPiA+ID4g
Pgo+ID4gPiA+IFRoZSBpZGVhIGlzIGJhc2VkIG9uIGNwdS1tYXAgaW4gQVJNIHdpdGggY2hhbmdl
cyByZWxhdGVkIHRvIGhvdwo+ID4gPiA+IHdlIGRlZmluZSBTTVQgc3lzdGVtcy4gVGhlIHJlYXNv
biBmb3IgYWRvcHRpbmcgYSBzaW1pbGFyIGFwcHJvYWNoCj4gPiA+ID4gdG8gQVJNIGFzIEkgZmVl
bCBpdCBwcm92aWRlcyBhIHZlcnkgY2xlYXIgd2F5IG9mIGRlZmluaW5nIHRoZQo+ID4gPiA+IHRv
cG9sb2d5IGNvbXBhcmVkIHRvIHBhcnNpbmcgY2FjaGUgbm9kZXMgdG8gZmlndXJlIG91dCB3aGlj
aCBjcHVzCj4gPiA+ID4gc2hhcmUgdGhlIHNhbWUgcGFja2FnZSBvciBjb3JlLiAgSSBhbSBvcGVu
IHRvIGFueSBvdGhlciBpZGVhIHRvCj4gPiA+ID4gaW1wbGVtZW50IGNwdS10b3BvbG9neSBhcyB3
ZWxsLgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IEkgd2FzIGFsc28gYWJvdXQgdG8gc3RhcnQgYSBkaXNj
dXNzaW9uIGFib3V0IENQVSB0b3BvbG9neSBvbiBSSVNDLVYKPiA+ID4gYWZ0ZXIgdGhlIGxhc3Qg
c3d0b29scyBncm91cCBtZWV0aW5nLiBUaGUgZ29hbCBpcyB0byBwcm92aWRlIHRoZQo+ID4gPiBz
Y2hlZHVsZXIgd2l0aCBoaW50cyBvbiBob3cgdG8gZGlzdHJpYnV0ZSB0YXNrcyBtb3JlIGVmZmlj
aWVudGx5Cj4gPiA+IGJldHdlZW4gaGFydHMsIGJ5IHBvcHVsYXRpbmcgdGhlIHNjaGVkdWxpbmcg
ZG9tYWluIHRvcG9sb2d5IGxldmVscwo+ID4gPiAoaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjQuMTkvaWRlbnQvc2NoZWRfZG9tYWluX3RvcG9sb2d5X2xldmVsKS4KPiA+ID4gV2hh
dCB3ZSB3YW50IHRvIGRvIGlzIGRlZmluZSBjcHUgZ3JvdXBzIGFuZCBhc3NpZ24gdGhlbSB0bwo+
ID4gPiBzY2hlZHVsaW5nIGRvbWFpbnMgd2l0aCB0aGUgYXBwcm9wcmlhdGUgU0RfIGZsYWdzCj4g
PiA+IChodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvaW5jbHVk
ZS9saW51eC9zY2hlZC90b3BvbG9neS5oI0wxNikuCj4gPiA+Cj4gPgo+ID4gT0sgYXJlIHdlIGRl
ZmluaW5nIGEgQ1BVIHRvcG9sb2d5IGJpbmRpbmcgZm9yIExpbnV4IHNjaGVkdWxlciA/Cj4gPiBO
QUNLIGZvciBhbGwgdGhlIGFwcHJvYWNoZXMgdGhhdCBhc3N1bWVzIGFueSBrbm93bGVkZ2Ugb2Yg
T1Mgc2NoZWR1bGVyLgo+ID4KPgo+IElzIHRoZXJlIGFueSBzdGFuZGFyZCByZWdhcmRpbmcgQ1BV
IHRvcG9sb2d5IG9uIHRoZSBkZXZpY2UgdHJlZSBzcGVjID8gQXMKPiBmYXIgYXMgSSBrbm93IHRo
ZXJlIGlzIG5vbmUuIFdlIGFyZSB0YWxraW5nIGFib3V0IGEgTGludXgtc3BlY2lmaWMgRGV2aWNl
Cj4gVHJlZSBiaW5kaW5nIHNvIEkgZG9uJ3Qgc2VlIHdoeSBkZWZpbmluZyBhIGJpbmRpbmcgZm9y
IHRoZSBMaW51eCBzY2hlZHVsZXIKPiBpcyBvdXQgb2Ygc2NvcGUuCgpUaGVyZSBtYXkgbm90IGJl
IG11Y2ggb24gQ1BVIHRvcG9sb2d5IGluIGRldmljZSB0cmVlIHNwZWMsIGJ1dCB0aGF0CmRvZXNu
J3QgbWVhbiB3ZSBhcmUgZGVmaW5pbmcgc29tZXRoaW5nIExpbnV4IHNwZWNpZmljIGhlcmUganVz
dCBiZWNhdXNlCnRoZXJlJ3MgYnVuY2ggb2YgTEtNTCBhcmUgY2MtZWQuIFdlIGRvIGhhdmUgZGVk
aWNhdGVkIGRldmljZSB0cmVlIE1MIGZvcgphIHJlYXNvbi4KCj4gRG8geW91IGhhdmUgY3B1LW1h
cCBvbiBvdGhlciBPU2VzIGFzIHdlbGwgPwo+CgpOb3RoaW5nIHByZXZlbnRzIHRoZW0gbm90IHRv
LiBJIGhhdmUgc2VlbiBpbmNyZWFzZSBpbiB0aGUgcHJvamVjdHMKcmVseWluZyBvbiBEVCB0aGVz
ZSBkYXlzLgoKPiA+ID4gU28gdGhlIGNvcmVzIHRoYXQgYmVsb25nIHRvIGEgc2NoZWR1bGluZyBk
b21haW4gbWF5IHNoYXJlOgo+ID4gPiBDUFUgY2FwYWNpdHkgKFNEX1NIQVJFX0NQVUNBUEFDSVRZ
IC8gU0RfQVNZTV9DUFVDQVBBQ0lUWSkKPiA+ID4gUGFja2FnZSByZXNvdXJjZXMgLWUuZy4gY2Fj
aGVzLCB1bml0cyBldGMtIChTRF9TSEFSRV9QS0dfUkVTT1VSQ0VTKQo+ID4gPiBQb3dlciBkb21h
aW4gKFNEX1NIQVJFX1BPV0VSRE9NQUlOKQo+ID4gPgo+ID4KPiA+IFRvbyBMaW51eCBrZXJuZWwv
c2NoZWR1bGVyIHNwZWNpZmljIHRvIGJlIHBhcnQgb2YgJHN1YmplY3QKPiA+Cj4KPiBBbGwgbGlz
dHMgb24gdGhlIGNjIGxpc3QgYXJlIExpbnV4IHNwZWNpZmljLCBhZ2FpbiBJIGRvbid0IHNlZSB5
b3VyIHBvaW50Cj4gaGVyZSBhcmUgd2UgdGFsa2luZyBhYm91dCBkZWZpbmluZyBhIHN0YW5kYXJk
IENQVSB0b3BvbG9neSBzY2hlbWUgZm9yIHRoZQo+IGRldmljZSB0cmVlIHNwZWMgb3IgYSBMaW51
eC1zcGVjaWZpYyBDUFUgdG9wb2xvZ3kgYmluZGluZyBzdWNoIGFzIGNwdS1tYXAgPwo+CgpTZWUg
YWJvdmUuCgo+IEV2ZW4gb24gdGhpcyBjYXNlIHlvdXIgcG9pbnQgaXMgbm90IHZhbGlkLCB0aGUg
aW5mb3JtYXRpb24gb2YgdHdvIGhhcnRzCj4gc2hhcmluZyBhIGNvbW1vbiBwb3dlciBkb21haW4g
b3IgaGF2aW5nIHRoZSBzYW1lIG9yIG5vdCBjYXBhY2l0eS9tYXgKPiBmcmVxdWVuY3kgKG9yIG1h
eWJlIGNhcGFiaWxpdGllcy9leHRlbnNpb25zIGluIHRoZSBmdXR1cmUpLCBpcyBub3QgTGludXgK
PiBzcGVjaWZpYy4gSSBqdXN0IHVzZWQgdGhlIExpbnV4IHNwZWNpZmljIG1hY3JvcyB1c2VkIGJ5
IHRoZSBMaW51eCBzY2hlZHVsZXIKPiB0byBwb2ludCBvdXQgdGhlIGNvZGUgcGF0aC4KClRoZSBD
UFUgdG9wb2xvZ3kgY2FuIGJlIGRpZmZlcmVudCBmcm9tIHRoZSBmcmVxdWVuY3kgb3IgdGhlIHBv
d2VyIGRvbWFpbnMKYW5kIHdlIGRvIGhhdmUgc3BlY2lmaWMgYmluZGluZ3MgdG8gcHJvdmlkZSB0
aG9zZSBpbmZvcm1hdGlvbi4gU28gbGV0J3MKdHJ5IHRvIGtlZXAgdGhhdCBvdXQgb2YgdGhpcyBk
aXNjdXNzaW9uLgoKPiBFdmVuIG9uIG90aGVyIE9TZXMgd2Ugc3RpbGwgbmVlZCBhIHdheSB0byBp
bmNsdWRlIHRoaXMgaW5mb3JtYXRpb24gb24gdGhlCj4gQ1BVIHRvcG9sb2d5LCBhbmQgY3VycmVu
dGx5IGNwdS1tYXAgZG9lc24ndC4gQWxzbyB0aGUgTGludXggaW1wbGVtZW50YXRpb24KPiBvZiBj
cHUtbWFwIGlnbm9yZXMgbXVsdGlwbGUgbGV2ZWxzIG9mIHNoYXJlZCByZXNvdXJjZXMsIHdlIG9u
bHkgZ2V0IG9uZQo+IGxldmVsIGZvciBTTVQgYW5kIG9uZSBsZXZlbCBmb3IgTUMgbGFzdCB0aW1l
IEkgY2hlY2tlZC4KPgoKQnV0IHRoYXQgZG9lc24ndCBtYWtlIGl0IGFueSBlYXN5IGlmIHlvdSBp
bmZsdWVuY2UgdGhlIGJpbmRpbmdzIGJhc2VkIG9uCkxpbnV4IHNjaGVkdWxlci4gU28ganVzdCBk
ZWZpbmUgaG93IGhhcmR3YXJlIGlzIGFuZCBhbGxvdyBlYWNoIE9TIHRvCmNob29zZSBpdCdzIG93
biB3YXkgdG8gdXRpbGlzZSB0aGF0IGluZm9ybWF0aW9uLiBUaGF0J3MgaG93IG1vc3Qgb2YgdGhl
CmdlbmVyaWMgRFQgYmluZGluZ3MgYXJlIGRlZmluZWQuCgo+ID4gPiBJbiB0aGlzIGNvbnRleHQg
SSBiZWxpZXZlIHVzaW5nIHdvcmRzIGxpa2UgImNvcmUiLCAicGFja2FnZSIsCj4gPiA+ICJzb2Nr
ZXQiIGV0YyBjYW4gYmUgbWlzbGVhZGluZy4gRm9yIGV4YW1wbGUgdGhlIHNhbXBsZSB0b3BvbG9n
eSB5b3UKPiA+ID4gdXNlIG9uIHRoZSBkb2N1bWVudGF0aW9uIHNheXMgdGhhdCB0aGVyZSBhcmUg
NCBjb3JlcyB0aGF0IGFyZSBwYXJ0Cj4gPiA+IG9mIGEgcGFja2FnZSwgaG93ZXZlciAicGFja2Fn
ZSIgaGFzIGEgZGlmZmVyZW50IG1lYW5pbmcgdG8gdGhlCj4gPiA+IHNjaGVkdWxlci4gQWxzbyB3
ZSBkb24ndCBzYXkgYW55dGhpbmcgaW4gY2FzZSB0aGV5IHNoYXJlIGEgcG93ZXIKPiA+ID4gZG9t
YWluIG9yIGlmIHRoZXkgaGF2ZSB0aGUgc2FtZSBjYXBhY2l0eSBvciBub3QuIFRoaXMgbWFwcGlu
ZyBkZWFscwo+ID4gPiBvbmx5IHdpdGggY2FjaGUgaGllcmFyY2h5IG9yIG90aGVyIHNoYXJlZCBy
ZXNvdXJjZXMuCj4gPiA+Cj4gPgo+ID4ge1VuLH1mb3J0dW5hdGVseSB0aG9zZSBhcmUgdGVybXMg
dXNlZCBieSBoYXJkd2FyZSBwZW9wbGUuCj4gPgo+Cj4gQW5kIHRoZXkgYXJlIHdyb25nLCBob3cg
dGhlIGhhcnRzIGFyZSBwaHlzaWNhbGx5IHBhY2tlZCBkb2Vzbid0IGltcGx5Cj4gdGhlaXIgYWN0
dWFsIHRvcG9sb2d5LiBJbiBnZW5lcmFsIHRoZSAidHJhbnNsYXRpb24iIGlzIG5vdCBhbHdheXMg
c3RyYWlnaHQKPiBmb3J3YXJkLCB0aGVyZSBhcmUgYXNzdW1wdGlvbnMgaW4gcGxhY2UuIFdlIGNv
dWxkIHVzZSAiY2x1c3RlciIgb2YgaGFydHMgb3IKPiAiZ3JvdXAiIG9mIGhhcnRzIGluc3RlYWQs
IHRoZXkgYXJlIG1vcmUgYWJzdHJhY3QuCj4KCkluZGVlZC4gSSBhZ3JlZSB0aG9zZSB0ZXJtaW5v
bG9naWVzIG1heSBub3QgYmUgYmVzdCwgYnV0IHRoZXkgYXJlIGFscmVhZHkKdXNlZCBvbmUuIFdl
IG5lZWQgdG8gbWFwIG9uIHRvIHRob3NlIGdlbmVyaWMgb25lcywgdGhvdWdoIHRoZSB0cmFuc2xh
dGlvbnMKbWF5IG5vdCBiZSBzaW1wbGUuIFdlIGRvIGhhdmUgdGhlIHNhbWUgaXNzdWVzIG9uIEFS
TS4gSWYgd2UgdHJ5IHRvIGJ1aWxkCmluIHN1Y2ggaW5mb3JtYXRpb24gaW50byBEVCwgdGhlbiBp
dCBiZWNvbWVzIG1vcmUgY29uZmlndXJhdGlvbiBmaWxlIGZvcgpPUyB0aGFuIHBsYXRmb3JtIGRl
c2NyaXB0aW9uIElNTy4KCi0tClJlZ2FyZHMsClN1ZGVlcAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
