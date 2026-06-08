Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9C7CD8C9D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 11:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AcaDbPYUtqyG0q5osLkc4Ty+dCE+Z7h+jOlEuEUbtdY=; b=fYjfmXOntOJidt
	gpUy3V1xAceWdyagpeXvLnyrllU+DDaD7OaUul60fQ8vK8Q3UboSP6j/SUH+8/oEVB4RVlQhPyUOa
	HK6EV5mKZAB85paSD5s+GfyXCKOfJ34oS63O+EeDuA4mgxNyYAqPA0/QzMXr1Seb/XTuKF4uSqoau
	XNrWWNaRwc1+OetBLLXWbCP+04hzZJOEcehiKbsG32PqVm79dawq2ILv0rUdrGNib4xSebaYTFmxw
	+6I9UeHkCEB3JzmLwsfLjJyRvZsn308jpF2coN46Tjk0VJmF3GVTmX6TIKMvTdr9Fx4MVpZgwbuCm
	31CyYIaCnMU8U1zv/+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXqe-00000003OTn-2Lmd;
	Mon, 08 Jun 2026 11:08:52 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXqb-00000003OTJ-1UAw
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 11:08:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1780916906; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V77ohDi1FU5qxxWvH1DRlpHx1d9WApt+1XamxW/ICSlhNOMRJJN8mlsDRjM7Hb1QScMIugYflwgv+/w4KK2xaJiCpmo8Z0DtBAvBzJCyoV5ALBVxAJKM8LbVXiVvvcLxFhZ1Qhed0ho/Icg5gctGqt9zydRhZ4NCH2dL4kdVsOQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780916906; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/tb7o9YfkkFDiV4LOWCcRHi0hE5qmxAuEKieOm6ZjM4=; 
	b=Zi5G9hxbP9Yi5Me8h0nhyCvq3v0pcxHHCF0KfYJ9GvBunaLDhwzHyIAwzG6dCMgLuYwWl9JbUjASPu5A1O+tfLjZ+vn3VTaVW70NirKcCd+go6Fyf2Hn2vv+fPG5vg1FrnaHsebU3oebSdXVQF1zU24e7DmizBJP+5aAJ6P63ac=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780916906;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=/tb7o9YfkkFDiV4LOWCcRHi0hE5qmxAuEKieOm6ZjM4=;
	b=XUGTWHrn0sgfDLuXq/gh6I9o9DPgvj+iImqlEtKZz50yGBUGuYMoGASst237rYA5
	bwnqdwuGBWCqvuHfXQ/jgTF77oyI5aZMd0QmkRIUq+KYVj2ZH+fWjdUeXZ4qbZ9Eec8
	XK33KVVUfuhepLk+GSg4HxQWeV5OVBtwOLa3+4fQ=
Received: by mx.zohomail.com with SMTPS id 1780916903731652.9798968643184;
	Mon, 8 Jun 2026 04:08:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 0/2] rust: clk: Add ExclusiveClk and use it in
 pwm-th1520
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260605-rate-exclusive-get-th1520-v2-0-695640bf7249@mailbox.org>
Date: Mon, 8 Jun 2026 08:08:04 -0300
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org
Message-Id: <140FE1B3-73CA-45EA-B978-648A1A48B577@collabora.com>
References: <20260605-rate-exclusive-get-th1520-v2-0-695640bf7249@mailbox.org>
To: Maurice Hieronymus <mhi@mailbox.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_040849_460494_5A580C4E 
X-CRM114-Status: UNSURE (   7.17  )
X-CRM114-Notice: Please train this message.
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

SGkgTWF1cmljZSwKClRoZXJlIGlzIHNvbWUgb25nb2luZyB3b3JrIHRvIGNvbnZlcnQgQ2xrcyB0
byBhIHR5cGUgc3RhdGUgcGF0dGVybiBbMF0KCkkgd29uZGVyIGlmIHlvdSB3b3VsZCBiZSB3aWxs
aW5nIHRvIHJlYmFzZSBvbiB0b3Agb2YgdGhhdD8KSSBjYW4gcHVzaCBhIG5ldyB2ZXJzaW9uIGlm
IHNvLgoKSXQgc2VlbXMgbGlrZSB3ZSBhcmUgbW9zdGx5IGluIGFncmVlbWVudCB3aXRoIHRoYXQg
c2VyaWVzLCBhbmQgb25seQphIGZldyBuaXRzIGFyZSBtaXNzaW5nLgoK4oCUIERhbmllbAoKWzBd
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC8yMDI2MDEwNy1jbGstdHlw
ZS1zdGF0ZS12My0wLTc3ZDNlM2VlNTljMkBjb2xsYWJvcmEuY29tLwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
