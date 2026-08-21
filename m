Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49DBC5DF8C
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 17:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oADMSKewfvOFKDV4/t+HhtbRssevInLwYT0akAChm8w=; b=2OxoAnSVIS81d4
	gQt9sI4E2zCK03ZoaRORapijDWY+VjmBZnSPS3MitesUcGc5uSFzPlSCLQMcDtRTRJKZKFye83MLw
	b4J8oyoigvqaBhaHcSUrQDJsggUhMRXtqnPaNg4PfoPy+xFIga3EQb/ewbF0mPc4k8T1Agfo+eFGW
	Z5kiZzx8o4NxCaqFP7TVzBoPE0uShaKq/Bdn0lE097rfD3ylvI70Stegmw4q1m2YgUjW/9Zynk44i
	1fLVrji3BDoXX/ZoDU/p3NWUqvsBmTXZqcoGqT7X12PiybNbDmqTxoVxhICS4Urra2g/V+mM5v1kB
	Vfteb0f2KDLumJDpmtXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSoi-0000000DtCs-1Ur6;
	Fri, 21 Aug 2026 17:14:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSof-0000000DtCG-1Vhb
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 17:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787332443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zi9iwiB91DU3G3fOh1jtokgzea+BDVppiEtnBmMzEyI=;
	b=htXfgKR7rqAajaLFrqtRvVBNVIU44MQP4XQawvRZxo0Pvzp85uw2NotZHCVF9SzETHcJns
	d8BclD0KRrGDTjSKE52BrUBQ+dlioVNhaYC4CNOhRJT6rOtB0pXdDkDMF5no9IM1TDAsBW
	sOpKMFkI4bW2yxeS/cz53GjLG/JQv9c=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-678-XK9I8aNVOwKtLUhDmZKnYQ-1; Fri,
 21 Aug 2026 13:11:46 -0400
X-MC-Unique: XK9I8aNVOwKtLUhDmZKnYQ-1
X-Mimecast-MFC-AGG-ID: XK9I8aNVOwKtLUhDmZKnYQ_1787332304
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8140F1801331;
	Fri, 21 Aug 2026 17:11:43 +0000 (UTC)
Received: from cmirabil.redhat.com (unknown [10.2.16.118])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 618A318005AA;
	Fri, 21 Aug 2026 17:11:39 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: vschneid@redhat.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	oliver.yang@linux.alibaba.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	tianruidong@linux.alibaba.com,
	vincent.guittot@linaro.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] sched: move stack_canary to the start of the randomizable region
Date: Fri, 21 Aug 2026 13:11:27 -0400
Message-ID: <20260821171127.1061494-1-cmirabil@redhat.com>
In-Reply-To: <xhsmhecjg38no.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
References: <20260509035014.2220372-1-tianruidong@linux.alibaba.com> <xhsmhecjg38no.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: maHIQ_ZcxbV_3V3krAdF5WE9qVqujbMcSdkdVwiN7a8_1787332304
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_101405_476418_9AA91ED3 
X-CRM114-Status: GOOD (  25.33  )
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

SGkgUnVpZG9uZywgVmFsZW50aW4sICgrIGNvcHlpbmcgaW4gUklTQy1WIGxpc3QvbWFpbnRhaW5l
cnMp4oCUCgpPbiBUdWUsIE1heSAxMiwgMjAyNiBhdCAwNjoxNjo0M1BNICswMjAwLCBWYWxlbnRp
biBTY2huZWlkZXIgd3JvdGU6Cj4gT24gMDkvMDUvMjYgMTE6NTAsIFJ1aWRvbmcgVGlhbiB3cm90
ZToKPiA+IHRhc2tfc3RydWN0IGtlZXBzIGdyb3dpbmcgb3ZlciB0aW1lLiAgT24gYXJjaGl0ZWN0
dXJlcyB0aGF0IGNvbXB1dGUgdGhlCj4gPiBwZXItdGFzayBzdGFjayBjYW5hcnkgb2Zmc2V0IGZy
b20gYXNtLW9mZnNldHMuaCBhbmQgcGFzcyBpdCB0byB0aGUKPiA+IGNvbXBpbGVyIHZpYSAtbXN0
YWNrLXByb3RlY3Rvci1ndWFyZC1vZmZzZXQ9LCB0aGlzIGdyb3d0aCBldmVudHVhbGx5Cj4gPiBw
dXNoZXMgc3RhY2tfY2FuYXJ5IGJleW9uZCB3aGF0IHRoZSB0YXJnZXQgSVNBIGNhbiBlbmNvZGUu
Cj4gPgo+ID4gT24gUklTQy1WLCBjYW5hcnkgbG9hZHMgYXJlIGVtaXR0ZWQgYXMKPiA+Cj4gPiAg
ICAgbGQJdDAsIFRTS19TVEFDS19DQU5BUlkodHApCj4gPgo+ID4gd2hlcmUgVFNLX1NUQUNLX0NB
TkFSWSBtdXN0IGZpdCBpbnRvIGEgMTItYml0IHNpZ25lZCBpbW1lZGlhdGUsIGkuZS4KPiA+IFst
MjA0OCwgMjA0N10uICBPbmNlIHN0YWNrX2NhbmFyeSBzaXRzIHBhc3QgYnl0ZSAyMDQ3IG9mIHRh
c2tfc3RydWN0LAo+ID4gdGhlIGJ1aWxkIGZhaWxzIHdpdGgKPiA+Cj4gPiAgICAgY2MxOiBlcnJv
cjogJzxOPicgaXMgbm90IGEgdmFsaWQgb2Zmc2V0IGluCj4gPiAgICAgICAgICctbXN0YWNrLXBy
b3RlY3Rvci1ndWFyZC1vZmZzZXQ9JwoKVGhhbmtzIGZvciB0aGlzIHBhdGNoLiBXZSBqdXN0IHJh
biBpbnRvIHRoaXMgZXhhY3QgaXNzdWUgZHVyaW5nIGEgQ0tJIGJ1aWxkCmh0dHBzOi8vZGF0YXdh
cmVob3VzZS5ja2ktcHJvamVjdC5vcmcva2NpZGIvYnVpbGRzLzE2Mzk3ODIgYW5kIHRoaXMgc2Vl
bXMKbGlrZSBleGFjdGx5IHRoZSBmaXggd2UgbmVlZC4KCj4gPgo+ID4gICAqIE9uIFJJU0MtViwg
Q09ORklHX1NUQUNLUFJPVEVDVE9SX1BFUl9UQVNLIGRlcGVuZHMgb24gIVJBTkRTVFJVQ1QsCj4g
PiAgICAgc28gcmFuZG9taXplZF9zdHJ1Y3RfZmllbGRzX3N0YXJ0L2VuZCBhbHdheXMgZXhwYW5k
IHRvIG5vdGhpbmcgYW5kCj4gPiAgICAgc3RhY2tfY2FuYXJ5IGxhbmRzIGF0IGEgc21hbGwsIHN0
YWJsZSBvZmZzZXQgd2VsbCB3aXRoaW4gdGhlCj4gPiAgICAgMTItYml0IHNpZ25lZCBpbW1lZGlh
dGUgcmFuZ2UuICBUaGUgYnVpbGQgZXJyb3IgZ29lcyBhd2F5Lgo+ID4KPiA+ICAgKiBPbiBhcmNo
aXRlY3R1cmVzIHRoYXQgZW5hYmxlIFJBTkRTVFJVQ1QgZm9yIGhhcmRlbmluZywgc3RhY2tfY2Fu
YXJ5Cj4gPiAgICAgc3RheXMgaW5zaWRlIHRoZSByYW5kb21pemVkIHJlZ2lvbiBhbmQgaXMgc3Rp
bGwgc2h1ZmZsZWQgdG9nZXRoZXIKPiA+ICAgICB3aXRoIHRoZSBvdGhlciBmaWVsZHMgYnkgdGhl
IGxheW91dCByYW5kb21pemF0aW9uLCBzbyBpdHMgaGFyZGVuaW5nCj4gPiAgICAgY292ZXJhZ2Ug
aXMgcHJlc2VydmVkLiAgYXNtLW9mZnNldHMtYmFzZWQgYXJjaGl0ZWN0dXJlcyByZWFkIHRoZQo+
ID4gICAgIHNodWZmbGVkIG9mZnNldCBhdCBidWlsZCB0aW1lLCBzbyB0aGUgZ2VuZXJhdGVkIGNh
bmFyeSBhY2Nlc3Nlcwo+ID4gICAgIHJlbWFpbiBjb3JyZWN0Lgo+ID4KPiA+IHBhaG9sZSBvbiBh
IHR5cGljYWwgNjQtYml0IGNvbmZpZyBzaG93cyB0aGF0IHRoZSBhcmVhIGFyb3VuZCB0aGUKPiA+
IHdha2VlXyogZmllbGRzIGFscmVhZHkgY29udGFpbnMgYSB1c2FibGUgaG9sZToKPiA+Cj4gPiAg
ICAgc3RydWN0IF9fY2FsbF9zaW5nbGVfbm9kZSAgd2FrZV9lbnRyeTsgICAgICAgICAgIC8qICAg
IDU2ICAgIDE2ICovCj4gPiAgICAgLyogLS0tIGNhY2hlbGluZSAxIGJvdW5kYXJ5ICg2NCBieXRl
cykgLS0tICAgICAgICovCj4gPiAgICAgdW5zaWduZWQgaW50ICAgICAgICAgICAgICAgd2FrZWVf
ZmxpcHM7ICAgICAgICAgIC8qICAgIDcyICAgICA0ICovCj4gPiAgICAgLyogWFhYIDQgYnl0ZXMg
aG9sZSwgdHJ5IHRvIHBhY2sgKi8KPiA+ICAgICB1bnNpZ25lZCBsb25nIGludCAgICAgICAgICB3
YWtlZV9mbGlwX2RlY2F5X3RzOyAgLyogICAgODAgICAgIDggKi8KPiA+ICAgICBzdHJ1Y3QgdGFz
a19zdHJ1Y3QgKiAgICAgICBsYXN0X3dha2VlOyAgICAgICAgICAgLyogICAgODggICAgIDggKi8K
PiA+Cj4gPiBNb3ZlIHdha2VlX2ZsaXBzIHRvIHNpdCBhZnRlciBsYXN0X3dha2VlLiAgVGhhdCBv
cGVucyB1cCBhIGNsZWFuCj4gPiA4LWJ5dGUgc2xvdCBhdCBvZmZzZXQgNzIgaW50byB3aGljaCBz
dGFja19jYW5hcnkgZml0cyBleGFjdGx5Ogo+ID4KPiA+ICAgICBzdHJ1Y3QgX19jYWxsX3Npbmds
ZV9ub2RlICB3YWtlX2VudHJ5OyAgICAgICAgICAgLyogICAgNTYgICAgMTYgKi8KPiA+ICAgICAv
KiAtLS0gY2FjaGVsaW5lIDEgYm91bmRhcnkgKDY0IGJ5dGVzKSAtLS0gICAgICAgKi8KPiA+ICAg
ICB1bnNpZ25lZCBsb25nICAgICAgICAgICAgICBzdGFja19jYW5hcnk7ICAgICAgICAgLyogICAg
NzIgICAgIDggKi8KPiA+ICAgICB1bnNpZ25lZCBsb25nIGludCAgICAgICAgICB3YWtlZV9mbGlw
X2RlY2F5X3RzOyAgLyogICAgODAgICAgIDggKi8KPiA+ICAgICBzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KiAgICAgICBsYXN0X3dha2VlOyAgICAgICAgICAgLyogICAgODggICAgIDggKi8KPiA+ICAgICB1
bnNpZ25lZCBpbnQgICAgICAgICAgICAgICB3YWtlZV9mbGlwczsgICAgICAgICAgLyogICAgOTYg
ICAgIDQgKi8KPiA+Cj4gPiBTdWdnZXN0ZWQtYnk6IEsgUHJhdGVlayBOYXlhayA8a3ByYXRlZWsu
bmF5YWtAYW1kLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFJ1aWRvbmcgVGlhbiA8dGlhbnJ1aWRv
bmdAbGludXguYWxpYmFiYS5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFZhbGVudGluIFNjaG5laWRl
ciA8dnNjaG5laWRAcmVkaGF0LmNvbT4KPiAKClRoYW5rcyBmb3IgdGhlIHJldmlldywgaXMgdGhl
cmUgYW55IGhvcGUgb2YgdGhpcyBwYXRjaCBnb2luZyBpbiBkdXJpbmcKdGhlIDcuMyBtZXJnZSB3
aW5kb3c/CgpJIGhhdmUgYWxzbyBjb3BpZWQgdGhlIFJJU0MtViBsaXN0IGFzIHdlbGwsIG1heWJl
IGlmIGl0IGlzIG9rIHdpdGggdGhlCnNjaGVkIGZvbGtzLCB0aGUgUklTQy1WIG1haW50YWluZXJz
IGNvdWxkIHRha2UgaXQgdGhyb3VnaCB0aGVpciB0cmVlIGFzCmEgUklTQy1WIHNwZWNpZmljIHVy
Z2VudCBmaXg/CgpCZXN04oCUQ2hhcmxpZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
