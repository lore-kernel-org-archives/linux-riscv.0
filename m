Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0943DC55179
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbQUP1sLdsPlJZ8zqKk6szDliW1N1YRNktdFb4jb5fA=; b=1Pln9W2KaT/4pm
	+X2roTCvepFjKEkAN6yYyMpGmjuCUPYfiRBbNZGye3vs/NOWpKTe6CFwwKTtjaBYNZ2pmNkigIMzT
	aZDA/km9SdSHFYBRwG1uvFzkO2gmCXxeICfpv+I5OCs64lK6CLMBx1V2QhT8FbTuy8vukXjYgtGad
	2glInWumsGz3KYzZQCpoSrfa00lAiRQ+u09ZnWnsJcx+g5vP2zYJuJqy6gkKF6vArD+vaNYa7iVjF
	F0MdPg9+IPKc1dv0tiPoMWdm7+UHdVOYKX37KbFB7x4J9/1xVvD83q4qBlGf1LflyGlVNS/LYwM8v
	zvc+njuZzS0iWwL30cxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsfK-0000000H9jd-2nrJ;
	Mon, 03 Aug 2026 13:25:14 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsfH-0000000H9j9-34Ic
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 13:25:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785763466; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iQda+jXa4ObWd1OpAuOfe8pVvgRFkZcFAhHlQVrSgVPc49t25B1clVVSA2q8yt1BMqT1ETiDUJKcEk6JFPydngJtZTsRQ+mJTDYMDiraUs5nah1xlEwQSLgaC3gvzl/bim1jYqDLI5Y2Fqpiskdei4r+H5HuoO9rqzq3vCP22W8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785763466; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lQ7W80MyLGC4g6TQVRHVS4jqxiCOFRgPhA4MHHto2h4=; 
	b=DQO+XsfpR4SuneJRvJMVC1mIiH+N/OrSB7YkVAKjfdxuP0X3shK7JVCGRTrHB1b5J8oyBWsg4Sy/KUXbK0zRQto5y/Kc7iQgkawU2WSYTi4JrLpJfmyXoAZ21EvXmwqYkFszWPRIh/uMwSfvz87Q+EcQLhyt74KWmMddIDxqef4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785763466;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=lQ7W80MyLGC4g6TQVRHVS4jqxiCOFRgPhA4MHHto2h4=;
	b=C2BVDXKK+fe1ExBLpGmi9cFtGO/+HeSpprIrmumVp09xPwoaNmpviVgltTRkd+8f
	9/rwc0v3QEmaWg15gQzCjpdVCq2sL+g4WGiy4yANNvkx70g2YbDmvvuW5bM5f9PIldB
	smcOO220uadEIoYOO+35eQt2Qzrxg24+3mCkTzwo=
Received: by mx.zohomail.com with SMTPS id 1785763465078767.4008380254238;
	Mon, 3 Aug 2026 06:24:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 0/4] Clk improvements
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <anCSTCxDpFtKmOgj@redhat.com>
Date: Mon, 3 Aug 2026 10:24:02 -0300
Cc: Maurice Hieronymus <mhi@mailbox.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Boqun Feng <boqun@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Message-Id: <B6441EFC-C2E4-437A-9FDF-F18E2CAD36C3@collabora.com>
References: <20260706-clk-type-state-v5-0-67c5f326a16c@collabora.com>
 <20260731183735.15036-1-mhi@mailbox.org>
 <E20E4FD3-F4DA-4029-99F7-DB4F93AA2994@collabora.com>
 <anCSTCxDpFtKmOgj@redhat.com>
To: Brian Masney <bmasney@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_062511_821285_6271336A 
X-CRM114-Status: GOOD (  10.50  )
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

SGkgQnJpYW4sCgo+IEkgY2FuIGFsc28gcHJvdmlkZSBhbiBBY2tlZC1ieSBoZXJlIGZvciBjbGsu
IEknbGwgYWRtaXQgdGhhdCBJJ20gbm90IGEKPiBydXN0IHByb2dyYW1tZXIgeWV0IChwbGFubmlu
ZyB0byBsZWFybiB0aGlzIGNvbWluZyBXaW50ZXIpLCBob3dldmVyIGlmIHRoZQo+IHJ1c3QgbWFp
bnRhaW5lcnMgYXJlIGhhcHB5IHdpdGggdGhpcywgdGhlbiBJJ20gZ29vZC4KPiAKPiBJdCBsb29r
cyBsaWtlIHRoZXJlIG1heSBiZSBzb21lIG91dHN0YW5kaW5nIGNvbW1lbnRzIG9uIHRoaXMgc2Vy
aWVzIGp1c3QKPiBza2ltbWluZyB0aGUgY29tbWVudHMuIEknbGwgd2FpdCBmb3IgdGhlIG5leHQg
dmVyc2lvbiB0byBsZWF2ZSBhbgo+IEFja2VkLWJ5Lgo+IAo+IEJyaWFuCj4gCgpZZWFoLCBtb3Jl
IHBlb3BsZSBjaGltZWQgaW4gOikKCkNvb2wsIEkgd2lsbCBwaW5nIHlvdSBhZ2FpbiB3aGVuIEkg
c2VuZCBhIG5ldyB2ZXJzaW9uLgoK4oCUIERhbmllbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
