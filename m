Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E89C6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 10:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dU4dPYEhbM5xdpV4nsPB7IqmX5sYha1D6IJ25j7mjwM=; b=kid5m9fE40lWAt
	OPMBA9act3STsNvlKd6ekhgbgDDWPQ7kW40JNyqh7X0tCgdW1N4iy9DqRDUbeQdqadtqUHmcwzo/B
	f+tmTOaa2nylI9iC9KKzh3dcjdzOogpDe9VVpVYKC8CH1Q1kbtJZuD8utoVse9rLzPIoIpa1hxr7J
	41MoK0dfz/Ti5xey0gOhBl23ZqsT9oP1c2IZ1TtV7MLtuIFR4tDeQ3YbD65WVUpQdou93ObpDf6X2
	nEWh8/m8OEsTu11/0KxrjjkSD3E9kPQeaLkJyxcySu4z7BWWlzodO3w1sajTFI9y1C9iGB0vpbv8H
	ch/3p9qBq7pyHLYLozgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfI6k-001Z4g-0Z;
	Thu, 23 Mar 2023 10:23:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfI6g-001Z3a-1u;
	Thu, 23 Mar 2023 10:23:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B685625B6;
	Thu, 23 Mar 2023 10:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19965C4339B;
	Thu, 23 Mar 2023 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679567021;
	bh=+pnutHbgPZ/gsCS7OxYK0FsgMPJ0cSQbPnMM0pRkjSk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Yk6QASA9PUP1MTPJaXTYUMe5W+wOgsu370892y+k0ZgVc9h6CvOxLdz3nMR/hkwnU
	 D/3lF/ZZKJPiVxtCKXr5MGUvVESG8IMHSQ4Lc2GC9zTPn0mTO+ucGBDA/dVtbbXVwP
	 QF4/IiyygNzAhSM4JEweGU1tB7cPSccz2CLRktTLkPsoVtRHTJj/nxhYzmlE+9ifff
	 xJB9KlbN5PfCCeyg6/clK582c/nB8w2ylXcbgVzuCBFZ1m7qAc+BY6hYruYHbzT/ts
	 VlZ69Sv44rUOKlxjRWe5o10Gm7ULkj+3R3O2OUpa3xAfdCyIHDYHBTSy94WFz5Yc+S
	 DzkdFU1+oyVJg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com,
 Jisheng Zhang <jszhang@kernel.org>, Nick Knight <nick.knight@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, vineetg@rivosinc.com, "Eric W.
 Biederman" <ebiederm@xmission.com>, Vincent Chen
 <vincent.chen@sifive.com>, Conor Dooley <conor.dooley@microchip.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Ruinland
 Tsai <ruinland.tsai@sifive.com>, Andy Chiu <andy.chiu@sifive.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Dmitry
 Vyukov <dvyukov@google.com>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH -next v15 09/19] riscv: Add task switch support for vector
In-Reply-To: <20230317113538.10878-10-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-10-andy.chiu@sifive.com>
Date: Thu, 23 Mar 2023 11:23:39 +0100
Message-ID: <87355vwytw.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_032342_733718_99E35C1E 
X-CRM114-Status: UNSURE (   7.15  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBGcm9tOiBHcmVlbnRp
bWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+Cj4gVGhpcyBwYXRjaCBhZGRzIHRhc2sg
c3dpdGNoIHN1cHBvcnQgZm9yIHZlY3Rvci4gSXQgYWxzbyBzdXBwb3J0cyBhbGwKPiBsZW5ndGhz
IG9mIHZsZW4uCj4KPiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBXYXRlcm1hbiA8YW5kcmV3QHNpZml2
ZS5jb20+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBOaWNrIEtuaWdodCA8bmljay5rbmlnaHRAc2lmaXZl
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEtuaWdodCA8bmljay5rbmlnaHRAc2lmaXZlLmNv
bT4KPiBDby1kZXZlbG9wZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gQ28t
ZGV2ZWxvcGVkLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+Cj4gQ28t
ZGV2ZWxvcGVkLWJ5OiBSdWlubGFuZCBUc2FpIDxydWlubGFuZC50c2FpQHNpZml2ZS5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogUnVpbmxhbmQgVHNhaSA8cnVpbmxhbmQudHNhaUBzaWZpdmUuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogVmluZWV0IEd1cHRhIDx2aW5lZXRnQHJpdm9zaW5jLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgoKUmV2aWV3ZWQtYnk6
IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
