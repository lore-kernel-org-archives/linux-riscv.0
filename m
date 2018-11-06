Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEF4C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 14:14:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1C2420685
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 14:14:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NIoCY3fo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iHjbVhdE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1C2420685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AnF7rlLcFXm152O4AG7rgOHv2MlmCsIj7kzMebistVw=; b=NIoCY3forBZFyq
	QasCa7xe5vq9r758Q0aaS7cRwfXNVv6nU9K08imVznvpTYQETbIYwVnQRL5jlaVPYKcuaq0Cs6KNH
	5bAhXdBsQWZ3883rRA0QvwD2OZcwaM40hcNTKbn1RcypICOTIV6CRo5jJZb7lOzNzdxuPh5vz+quR
	NFu5ME1jyZsppMnOjz6R4GAUs2e4Dg63IwpXNMXcqc8AiX2G/dz+vDK+lmYLH4CXFvKdyVsH0u675
	YiFCahrRekgfeqSoQIRnaXLuIj5u8xaleK9YI4/As2mo/JhTKfNluF3UO5XPfORdjm1qclFpCex9r
	T7PamwhzBCnaU5bhJfqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gK27T-00048y-Rq; Tue, 06 Nov 2018 14:14:15 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK27S-00048c-DN
 for linux-riscv@bombadil.infradead.org; Tue, 06 Nov 2018 14:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=smgDTmTANi8FVLv6CezXo/6FBPl8/fAUUf3mLuHu2KQ=; b=iHjbVhdEUp9LD/X6loQEe5edqf
 Vya0XLOQE7vs/ok0Z4CKl4v+vjAqZLmSaY/7z5/3SstkAHPL9BvE8BPsfGXZYWPbyaD8RjRoOvWst
 HTfrVHrbbnlDysYSMpkPKuH3rQWiDSoTKvztOxCErq/JbZQGsI21BYkHdC4QF+SWzxKFOdqFrh0nc
 LDGjxQ/cyMiJcvWl2TA2hGlrZKdJAXy7Cyfbu+VItj3u2C0mgviZd62f0ib1K0oiCWxpLl/Vli0tg
 FCT0isX+ysn9kfEsK9MzYADjUd7Jqv3zlSHvIHT5frx5wj50lTMPC4ItrXC5iNJ/DAuwv1rQ6T+vv
 YEKe0/1g==;
Received: from foss.arm.com ([217.140.101.70])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK27P-00079s-Di
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 14:14:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E018180D;
 Tue,  6 Nov 2018 06:13:57 -0800 (PST)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 649B03F5BD;
 Tue,  6 Nov 2018 06:13:55 -0800 (PST)
Date: Tue, 6 Nov 2018 14:13:49 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [RFC 0/2] Add RISC-V cpu topology
Message-ID: <20181106141331.GA28458@e107155-lin>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_091411_543382_9CBB416E 
X-CRM114-Status: GOOD (  23.27  )
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
 Sudeep Holla <sudeep.holla@arm.com>, linux-riscv@lists.infradead.org,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106141349.ERBh93_k2R35OOIptlKgOOBgdouLZGw4iufq1gt72KA@z>

T24gRnJpLCBOb3YgMDIsIDIwMTggYXQgMDg6NTg6MzlQTSArMDIwMCwgTmljayBLb3NzaWZpZGlz
IHdyb3RlOgo+IEhlbGxvIEFsbCwKPiAKPiDOo8+EzrnPgiAyMDE4LTExLTAyIDAxOjA0LCBBdGlz
aCBQYXRyYSDOrc6zz4HOsc+IzrU6Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHRoZSBjcHUg
dG9wb2xvZ3kgZm9yIFJJU0MtVi4gSXQgY29udGFpbnMKPiA+IGJvdGggdGhlIERUIGJpbmRpbmcg
YW5kIGFjdHVhbCBzb3VyY2UgY29kZS4gSXQgaGFzIGJlZW4gdGVzdGVkIG9uCj4gPiBRRU1VICYg
VW5sZWFzaGVkIGJvYXJkLgo+ID4gCj4gPiBUaGUgaWRlYSBpcyBiYXNlZCBvbiBjcHUtbWFwIGlu
IEFSTSB3aXRoIGNoYW5nZXMgcmVsYXRlZCB0byBob3cKPiA+IHdlIGRlZmluZSBTTVQgc3lzdGVt
cy4gVGhlIHJlYXNvbiBmb3IgYWRvcHRpbmcgYSBzaW1pbGFyIGFwcHJvYWNoCj4gPiB0byBBUk0g
YXMgSSBmZWVsIGl0IHByb3ZpZGVzIGEgdmVyeSBjbGVhciB3YXkgb2YgZGVmaW5pbmcgdGhlCj4g
PiB0b3BvbG9neSBjb21wYXJlZCB0byBwYXJzaW5nIGNhY2hlIG5vZGVzIHRvIGZpZ3VyZSBvdXQg
d2hpY2ggY3B1cwo+ID4gc2hhcmUgdGhlIHNhbWUgcGFja2FnZSBvciBjb3JlLiAgSSBhbSBvcGVu
IHRvIGFueSBvdGhlciBpZGVhIHRvCj4gPiBpbXBsZW1lbnQgY3B1LXRvcG9sb2d5IGFzIHdlbGwu
Cj4gPiAKPiAKPiBJIHdhcyBhbHNvIGFib3V0IHRvIHN0YXJ0IGEgZGlzY3Vzc2lvbiBhYm91dCBD
UFUgdG9wb2xvZ3kgb24gUklTQy1WCj4gYWZ0ZXIgdGhlIGxhc3Qgc3d0b29scyBncm91cCBtZWV0
aW5nLiBUaGUgZ29hbCBpcyB0byBwcm92aWRlIHRoZQo+IHNjaGVkdWxlciB3aXRoIGhpbnRzIG9u
IGhvdyB0byBkaXN0cmlidXRlIHRhc2tzIG1vcmUgZWZmaWNpZW50bHkKPiBiZXR3ZWVuIGhhcnRz
LCBieSBwb3B1bGF0aW5nIHRoZSBzY2hlZHVsaW5nIGRvbWFpbiB0b3BvbG9neSBsZXZlbHMKPiAo
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjQuMTkvaWRlbnQvc2NoZWRfZG9tYWlu
X3RvcG9sb2d5X2xldmVsKS4KPiBXaGF0IHdlIHdhbnQgdG8gZG8gaXMgZGVmaW5lIGNwdSBncm91
cHMgYW5kIGFzc2lnbiB0aGVtIHRvCj4gc2NoZWR1bGluZyBkb21haW5zIHdpdGggdGhlIGFwcHJv
cHJpYXRlIFNEXyBmbGFncwo+IChodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxv
Yi9tYXN0ZXIvaW5jbHVkZS9saW51eC9zY2hlZC90b3BvbG9neS5oI0wxNikuCj4KCk9LIGFyZSB3
ZSBkZWZpbmluZyBhIENQVSB0b3BvbG9neSBiaW5kaW5nIGZvciBMaW51eCBzY2hlZHVsZXIgPwpO
QUNLIGZvciBhbGwgdGhlIGFwcHJvYWNoZXMgdGhhdCBhc3N1bWVzIGFueSBrbm93bGVkZ2Ugb2Yg
T1Mgc2NoZWR1bGVyLgoKPiBTbyB0aGUgY29yZXMgdGhhdCBiZWxvbmcgdG8gYSBzY2hlZHVsaW5n
IGRvbWFpbiBtYXkgc2hhcmU6Cj4gQ1BVIGNhcGFjaXR5IChTRF9TSEFSRV9DUFVDQVBBQ0lUWSAv
IFNEX0FTWU1fQ1BVQ0FQQUNJVFkpCj4gUGFja2FnZSByZXNvdXJjZXMgLWUuZy4gY2FjaGVzLCB1
bml0cyBldGMtIChTRF9TSEFSRV9QS0dfUkVTT1VSQ0VTKQo+IFBvd2VyIGRvbWFpbiAoU0RfU0hB
UkVfUE9XRVJET01BSU4pCj4gCgpUb28gTGludXgga2VybmVsL3NjaGVkdWxlciBzcGVjaWZpYyB0
byBiZSBwYXJ0IG9mICRzdWJqZWN0Cgo+IEluIHRoaXMgY29udGV4dCBJIGJlbGlldmUgdXNpbmcg
d29yZHMgbGlrZSAiY29yZSIsICJwYWNrYWdlIiwKPiAic29ja2V0IiBldGMgY2FuIGJlIG1pc2xl
YWRpbmcuIEZvciBleGFtcGxlIHRoZSBzYW1wbGUgdG9wb2xvZ3kgeW91Cj4gdXNlIG9uIHRoZSBk
b2N1bWVudGF0aW9uIHNheXMgdGhhdCB0aGVyZSBhcmUgNCBjb3JlcyB0aGF0IGFyZSBwYXJ0Cj4g
b2YgYSBwYWNrYWdlLCBob3dldmVyICJwYWNrYWdlIiBoYXMgYSBkaWZmZXJlbnQgbWVhbmluZyB0
byB0aGUKPiBzY2hlZHVsZXIuIEFsc28gd2UgZG9uJ3Qgc2F5IGFueXRoaW5nIGluIGNhc2UgdGhl
eSBzaGFyZSBhIHBvd2VyCj4gZG9tYWluIG9yIGlmIHRoZXkgaGF2ZSB0aGUgc2FtZSBjYXBhY2l0
eSBvciBub3QuIFRoaXMgbWFwcGluZyBkZWFscwo+IG9ubHkgd2l0aCBjYWNoZSBoaWVyYXJjaHkg
b3Igb3RoZXIgc2hhcmVkIHJlc291cmNlcy4KPgoKe1VuLH1mb3J0dW5hdGVseSB0aG9zZSBhcmUg
dGVybXMgdXNlZCBieSBoYXJkd2FyZSBwZW9wbGUuCgo+IEhvdyBhYm91dCBkZWZpbmluZyBhIGR0
IHNjaGVtZSB0byBkZXNjcmliZSB0aGUgc2NoZWR1bGVyIGRvbWFpbgo+IHRvcG9sb2d5IGxldmVs
cyBpbnN0ZWFkID8gZS5nOgo+CgpOQUNLIGFzIGFscmVhZHkgbWVudGlvbmVkIGFib3ZlLgoKLS0K
UmVnYXJkcywKU3VkZWVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
