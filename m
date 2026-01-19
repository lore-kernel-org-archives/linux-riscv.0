Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F87D29C39
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 15:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References:Message-Id
	:Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Un7Iw2umwHxle+B4iYsoefPXvc0NkqAcKUlpHeuH2c8=; b=NhT8nVx090RK5t
	I3ZcM7Zw9EuZe353WJnYEjbdzSNgVKHwT4sMuBnH2odcyVse/qh8FmzA+Y2bCjaQBK/sRoT28mL66
	0MgIxRPNoE36WMeX7VSUW9SdCUezxzFaqT5YL/py912XbuDe67a68av8UGAsGexJlDdbyzNd6KEDT
	MC/6V7RDVwIyq6sKAYHlPZzEpjDr+b5HFd9Tn3Stob32vx8uZSbiLI+oHC3s8UP1/azMLXmQ4ROCG
	6DSG0V/SMOMA3Qbv/GmeFeHbhQf4021xaK2CSLaTKKHo7n4cBWBaWi9/+h0ArM/NS2N1oJ9I+0gDU
	Di8Cgop1LhRvSN7PSRYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrRj-00000002Njz-0fT5;
	Mon, 19 Jan 2026 15:45:39 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrRa-00000002NiC-0utd
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 15:45:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768837515; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eoL4anMNIFCNVXUGpwYCuMW8aapkcG8L+IAN470CthTc1LenglW7Ny9fZxnWHWiKXApg9J1X03jXK198PtsRp7WTLiW5hTKITq/A5+FU5Wpil4gKW19pBLelOvPuWUdMIZ8acK9XASygSL6pvbsOBH3aiVrNKhqCq66dYlHTd7E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768837515; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+rU0eXeKg2yMjigsFoDJa3iuRWBFFdh53RB8m7idKP8=; 
	b=XjETq4XwCFHKZ1llhEHi5oJL4mFU2YLBrair61IXJvP0gj8eNfOkXyF0QMFWqiEHMrtyC5vQWv5Q4Fw6NHicjcrEAaGC52/uslJDU43JBajfwG6/+PksXUnIcm9qNgp20AGfoodKOA5NlFH+tQAG914tKKJW1/+eGUk0KPYZLMg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768837515;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
	bh=+rU0eXeKg2yMjigsFoDJa3iuRWBFFdh53RB8m7idKP8=;
	b=KxW9bP5VDZNbOlWgvCNIH/cGiJvmdNzK4UwcL21DpmkPb7QV6BtrOn0kp1lVkNsY
	STwHPCZUaLRxMtMaeVA2Q3m8lgTJ7jFoJ6Q4+0/Dl4AZ/cgNOeqeGeC4/YtzNf97hzh
	3vgTkqwFsAyy24DslR8sohh6YqiG+mT5kZMXsWRM=
Received: by mx.zohomail.com with SMTPS id 1768837512991874.9478843764485;
	Mon, 19 Jan 2026 07:45:12 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Date: Mon, 19 Jan 2026 12:44:47 -0300
Message-Id: <533CE7C2-A42A-43DF-8D23-B7D6AE346C4E@collabora.com>
References: <DFSMW4IERCOT.1QCQ4CAY8KJFK@garyguo.net>
Cc: Maxime Ripard <mripard@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>,
 Ren Guo <guoren@kernel.org>, Wei Fu <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Gary Guo <gary@garyguo.net>
In-Reply-To: <DFSMW4IERCOT.1QCQ4CAY8KJFK@garyguo.net>
To: Gary Guo <gary@garyguo.net>
X-Mailer: iPhone Mail (23C55)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_074530_742787_62B34FA0 
X-CRM114-Status: GOOD (  12.58  )
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

Cj4+IFllcywgdGhhdCB3b3VsZCBiZSBncmVhdC4gSSBkbyB3b25kZXIgdGhvdWdoIGlmIGl0IHdv
dWxkbid0IG1ha2Ugc2Vuc2UKPj4gdG8gdHVybiBpdCB0aGUgb3RoZXIgd2F5IGFyb3VuZC4gSXQg
Y3JlYXRlcyBhIGZhaXIgc2hhcmUgb2YgYm9pbGVycGxhdGUKPj4gZm9yIGEgbnVtYmVyIG9mIGRy
aXZlcnMuIENhbid0IHdlIGtlZXAgQ2xrIHRoZSB3YXkgaXQgaXMgYXMgYQo+PiBsb3dlci1sZXZl
bCB0eXBlLCBhbmQgY3JhdGUgYSBNYW5hZ2VkQ2xrIChvciB3aGF0ZXZlciBuYW1lIHlvdSBwcmVm
ZXIpCj4+IHRoYXQgZHJpdmVycyBjYW4gdXNlLCBhbmQgd291bGQgYmUgcmV0dXJuZWQgYnkgaGln
aGVyLWxldmVsIGhlbHBlcnMsIGlmCj4+IHRoZXkgc28gY2hvb3NlPwo+PiAKPj4gVGhhdCB3YXks
IHdlIGRvIGhhdmUgdGhlIHR5cGVzdGF0ZSBBUEkgZm9yIHdob2V2ZXIgd2FudHMgdG8sIHdpdGhv
dXQKPj4gY3JlYXRpbmcgdG9vIG11Y2ggYm9pbGVycGxhdGUgZm9yIGV2ZXJ5Ym9keSBlbHNlLgo+
IAo+IE9uZSBzb2x1dGlvbiBpcyB0byBoYXZlIGEgbmV3IHR5cGVzdGF0ZSBgRHluYW1pY2Agd2hp
Y2ggb3B0cyB0byB0cmFjayB0aGluZ3MKPiB1c2luZyB2YXJpYWJsZXMuCj4gCj4gc3RydWN0IER5
bmFtaWMgewo+ICAgIGVuYWJsZWQ6IGJvb2wsCj4gICAgcHJlcGFyZWQ6IGJvb2wsCj4gfQo+IAo+
IHRyYWl0IENsa1N0YXRlIHsKPiAgICAvLyBDaGFuZ2UgdG8gbWV0aG9kcwo+ICAgIGZuIGRpc2Fi
bGVfb25fZHJvcCgmc2VsZikgLT4gYm9vbDsKPiB9Cj4gCj4gc3RydWN0IENsazxTdGF0ZT4gewo+
ICAgIC4uLgo+ICAgIC8vIEtlZXAgYW4gaW5zdGFuY2UsIHdoaWNoIGlzIHplcm8tc2l6ZWQgZm9y
IGV2ZXJ5dGhpbmcgZXhjZXB0IGBEeW5hbWljYAo+ICAgIHN0YXRlOiBTdGF0ZSwKPiB9Cj4gCj4g
dGhpcyB3YXkgd2UgY2FuIGhhdmUgcnVudGltZS1jaGVja2VkIHN0YXRlIGNvbnZlcnNpb25zLgo+
IAo+IEJlc3QsCj4gR2FyeQoKVGhlcmUgdXNlZCB0byBiZSBhIER5bmFtaWMgc3RhdGUgaW4gdGhl
IHBhc3QgaW4gYSBzaW1pbGFyIHNldHRpbmcuIFRoYXQgd2FzIHJlbW92ZWQgYWZ0ZXIgc29tZSB0
aG9yb3VnaCBkaXNjdXNzaW9uLiBJ4oCZZCBzYXkgd2Ugc2hvdWxkIHJlZnJhaW4gZnJvbSBnb2lu
ZyBiYWNrIHRvIHRoaXMuIFNwZWNpYWxseSBjb25zaWRlcmluZyB0aGF0IHRoZSBjdXJyZW50IGRl
c2lnbiB3b3JrcyBmaW5lLgoKIEkgY2FuIHJlbW92ZSB0aGUgdHVyYm9maXNoIGlmIHlvdSB3YW50
LCBldmVuIHRob3VnaCBJIHRoaW5rIHRoZXnigJlyZSB1c2VmdWwgc28gdGhhdCB3ZSBoYXZlIHRo
ZSBzYW1lIEFQSSBmb3IgYWxsIHN0YXRlcy4KCuKAlCBEYW5pZWwKCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
