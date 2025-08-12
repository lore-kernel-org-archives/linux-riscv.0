Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA77C87FCB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 16:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3211BOJpfhNuC+ryyQazdsyv18Epxe5Yu2qEP/m7qmQ=; b=crnLOihGyhjh98
	RQ0NfPUZ3lA2Pt2ibv8U+rx9QC/zsLfFn0VfCYsLJXtYDcW8w5tWGZ5rLMjFF0fjbO4VYfcUD9rvL
	F+NmMoWBOZR2Isio8IaKNA5qLANU+MNVAYsxbsDTW6tfV1xdaZDgYfegF9nXEXPzVLgi5KbQJ1Yqn
	0rNGNEGe90UvPuNYC6iEOMvAurE5Y3Hc8YwCWQWEBLt9NMUG0E6rSfRlURjdSXSEpCHycG4wT1TS9
	5IoHdi01Q1txQz4Ozv/XRynuQTNhZmT7JT4LPIlCy2de/5GLeZkdwB0nr+1EnhZ0uKmOSN5VTaA2b
	zcgrffdvRLBd9vgUYcrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsLb-0000000BUZc-3cq6;
	Tue, 12 Aug 2025 16:59:39 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulpGt-0000000AxPo-3HzI
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 13:42:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755006152; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ob2a/f0eaZdCkypYg4XmY5b8LnjcS5jzNQY8Wclo5TdSrhceyUMocmxn0bkcW5f65So9ut1pn/JU5WWc3W7WiMG3RUbHu/joNlg9JqadynXkD6k91ql301mUqzLY99f2b+fZs203uDCSZ918kYc08zgIqJzUdy7pmnCgS3iktfo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755006152; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VA/IhSA+wElgw/TQpAmNJns2NWQ8O3CCkvUy+PyqOsQ=; 
	b=gd328Pg5XKwKeKvMXDpmob07Vb0f7nFIFU/c2nV1mNLzQbBUwgMTcmWepbg52MqvfF8lD4o2nFvPScY5DGbGxcUyiPxyhDP2ZgCLB+893DAhY6QSncBN5YEEJjUIb6+xWpQRftwCN+b2/JC7Ab/bba1OPKHYIlP/VfV6lHiV+6I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755006152;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=VA/IhSA+wElgw/TQpAmNJns2NWQ8O3CCkvUy+PyqOsQ=;
	b=lvUjqhfh0BPdd0ewTbefpOQPYoD9rafGuCkqLGNeaojQjm7bQwnGfagG/yDm7wFh
	hLIocF23EIbk23cW+rhqo0QzNQ9M/R4JYAGKi/SY0qvceCZFIJUtHxXuTe6R1gVQPH6
	sDM9v3oEMe3RoUXJIHrTaUTAGrAurbov4orvNqaziPkhpaJEzTJa9i47mMSaWHuC6HE
	BgWrZ37mp3xgQCa4vNmWUSg7OIMSdn+coL1DF+fk2Ko25yODGRFMGF+EbWvqe3BTAH6
	tt6bN9nPUmdrJd20Qs8ASA3fUtEPmiu9ytH9x7TQ3uobdvI0bqlGb/4z50UZwf+whj+
	W7j84GJwhA==
Received: by mx.zohomail.com with SMTPS id 1755006149202627.0494069115554;
	Tue, 12 Aug 2025 06:42:29 -0700 (PDT)
Message-ID: <50a61990b5009217dcc0ed74142c4ffeba137f73.camel@icenowy.me>
Subject: Re: [PATCH 0/4] clk: thead: Misc changes to TH1520 clock driver
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 12 Aug 2025 21:42:23 +0800
In-Reply-To: <20250812054258.1968351-1-uwu@icenowy.me>
References: <20250812054258.1968351-1-uwu@icenowy.me>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_064235_881369_723B2AB7 
X-CRM114-Status: GOOD (  12.53  )
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

5ZyoIDIwMjUtMDgtMTLmmJ/mnJ/kuoznmoQgMTM6NDIgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ
6YGT77yaCj4gVGhpcyBwYXRjaHNldCBpcyBteSBjaGFuZ2VzIHRvIHRoZSBUSDE1MjAgY2xvY2sg
ZHJpdmVyLCBtYWlubHkgZm9yCj4gc3VwcG9ydGluZyB0aGUgZGlzcGxheSBjb250cm9sbGVyICh0
aGUgZmlyc3QgMykuCj4gCj4gVGhlIGZpcnN0IHR3byBhcmUgZnVuY3Rpb25hbGl0eSBhZGRpdGlv
bnMsIHdpdGggdGhlIGZpcnN0IG9uZSBhZGRpbmcKPiBzdXBwb3J0IGZvciBlbmFibGluZy9kaXNh
YmxpbmcgUExMcyAoZm9yIERQVSBQTEwpIGFuZCB0aGUgc2Vjb25kIG9uZQo+IGFkZGluZyBzdXBw
b3J0IGZvciBjaGFuZ2luZyBEUFUgZGl2aWRlcnMuCj4gCj4gVGhlIDNyZCBvbmUgaXMgdG8gYWRk
cmVzcyBoYW5nIGlzc3VlcyBtZXQgd2hlbiB0ZXN0aW5nIHRoZSBEUFUgZHJpdmVyCj4gdy9vIGNs
a19pZ25vcmVfdW51c2VkIGNvbW1hbmQgbGluZSBvcHRpb24uCj4gCj4gVGhlIDR0aCBvbmUgaGFz
IG5vIHJlbGF0aW9uc2hpcCB0byBkaXNwbGF5LCBhbmQgb25seSBleGlzdHMgZm9yIG15Cj4gbmVl
ZAo+IHRvIGNoYW5nZSBhbiBhcmJpdHJhcnkgR1BJTyAod2VsbCwgR1BJTzNfMywgdGhlIG9uZSBj
b250cm9sbGluZyB0aGUKPiBmYW4KPiBvbiBMaWNoZWUgUGkgNEEpIHdpdGggZ3Bpb3NldC4KPiAK
PiBUaGlzIHBhdGNoc2V0IGhhcyBhIGRlcGVuZGVuY3kgKGEgMHRoIG9uZSkgWzFdLgo+IAo+IFsx
XQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwODA5LWZpeF9jbG9j
a3NfdGhlYWRfYXVnXzktdjEtMS0yOTljMzNkN2E1OTNAc2Ftc3VuZy5jb20vCj4gCgpPb3BzLCBs
b29rcyBsaWtlIHRoaXMgcGF0Y2hzZXQgZGVzZXJ2ZXMgYSBuZXcgcmV2aXNpb24gbm93Li4uCgpQ
QVRDSCAyLzQgaGFzIGEgcm91bmRfcmF0ZSgpIGltcGxlbWVudGF0aW9uLCB3aGljaCBpcyBjb25z
aWRlcmVkIG91dC0Kb2YtZGF0ZSBhbmQgZGV0ZXJtaW5lX3JhdGUoKSB3aWxsIHJlcGxhY2UgaXQu
CgpQQVRDSCAzLzQgd2FzIGJyb2tlbiBkdXJpbmcgcmViYXNpbmcuCgpQQVRDSCA0LzQgaXMgZm91
bmQgdG8gYmUgbm90IHdvcmtpbmcgKGFuZCBldmVuIG1ha2VzIHBhZGN0cmwwIGFuIG9ycGhhbgpj
bG9jaykuIFlhbyBaaSB0b2xkIG1lIHRoYXQgSSBuZWVkIHRvIGZpcnN0IGRvIHNvbWUgY2hhbmdl
cyB0byBjY3VfZ2F0ZQpjb2RlLgoKPiBJY2Vub3d5IFpoZW5nICg0KToKPiDCoCBjbGs6IHRoZWFk
OiBhZGQgc3VwcG9ydCBmb3IgZW5hYmxpbmcvZGlzYWJsaW5nIFBMTHMKPiDCoCBjbGs6IHRoZWFk
OiBzdXBwb3J0IGNoYW5naW5nIERQVSBwaXhlbCBjbG9jayByYXRlCj4gwqAgY2xrOiB0aGVhZDog
dGgxNTIwLWFwOiBzZXQgYWxsIEFYSSBjbG9ja3MgdG8gQ0xLX0lTX0NSSVRJQ0FMCj4gwqAgY2xr
OiB0aGVhZDogdGgxNTIwLWFwOiBmaXggcGFyZW50IG9mIHBhZGN0cmwwIGNsb2NrCj4gCj4gwqBk
cml2ZXJzL2Nsay90aGVhZC9jbGstdGgxNTIwLWFwLmMgfCAxNzQgKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLQo+IC0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTQzIGluc2VydGlvbnMoKyksIDMx
IGRlbGV0aW9ucygtKQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
