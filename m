Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69CDCD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 19:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Db84503NO70kF85OVVsD75AdyY+5WL6hjlVjzX8CCZQ=; b=2Ef4sPpx5loaQj
	WofCWWReFqO9BjJtbe58j2YyHMXsN4XR/1AXWxSbJVIRG/SRU1ahv3aqGQVUssBP3Wilg9v+TcXlC
	UOG++8JN3wTPeECsbsQdseZIjW0d5EP3HYPuar3iYWWn0AfZZSj49bLx9S4BXNtps2lNtgxUc7wGJ
	eJw4Btd8A36gWSCBNo7ElpDmfBRMxcwJqV52I7MciiFMuVJ0zn0Ux5Ff0TonxCQk50BLqpFOAKYqr
	4nwpSvodV2UQ1kspdpcp/9gCU3dShJqamiD0KjNMNNIwmMKnlD16kyjwIIbdyWT5dijJm6hkPSMMM
	64PoB2Vpyqr4tscr53fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJdC-00G8nM-2j;
	Mon, 18 Sep 2023 19:10:02 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJd8-00G8kl-17
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 19:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1695064190;
	bh=gc/WMgSdjYxe2NiZy+i680FnIrB6GCa5tYJPeqSm6OU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e08bKLe+haQBydEioK8s+5TdOsl1X4PQSy0OheurwbYpWzlHBBMwto7DIMtfqEAL6
	 D+sS5LoYv6kEw7OW9eniiosRJ2gXWwYxb5LCO7LypnThjHqQs4suqMpzvnd2I1/9P1
	 AHV2ZFS+sw5Cvc5Zj5hE/JSNv6qDBOGhp5vRS8Hk=
Date: Mon, 18 Sep 2023 21:09:50 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/4] tools/nolibc: avoid unused parameter warnings for
 ENOSYS fallbacks
Message-ID: <7da10f44-f18a-420c-a906-69ba43478aa0@t-8ch.de>
References: <20230917-nolibc-syscall-nr-v2-0-03863d509b9a@weissschuh.net>
 <20230917-nolibc-syscall-nr-v2-2-03863d509b9a@weissschuh.net>
 <ZQh4gwcxvqgn/9Nh@1wt.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQh4gwcxvqgn/9Nh@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_120958_559366_ADEB567F 
X-CRM114-Status: UNSURE (   9.83  )
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

T24gMjAyMy0wOS0xOCAxODoxOToxNSswMjAwLCBXaWxseSBUYXJyZWF1IHdyb3RlOgo+IEhpIFRo
b21hcywKPiAKPiBPbiBTdW4sIFNlcCAxNywgMjAyMyBhdCAwNTozNjoxN1BNICswMjAwLCBUaG9t
YXMgV2Vpw59zY2h1aCB3cm90ZToKPiA+IFRoZSBFTk9TWVMgZmFsbGJhY2sgY29kZSBkb2VzIG5v
dCB1c2UgaXRzIGZ1bmN0aW9ucyBwYXJhbWV0ZXJzLgo+ID4gVGhpcyBjYW4gbGVhZCB0byBjb21w
aWxlciB3YXJuaW5ncyBhYm91dCB1bnVzZWQgcGFyYW1ldGVycy4KPiA+IAo+ID4gRXhwbGljaXRs
eSBhdm9pZCB0aGVzZSB3YXJuaW5ncy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdl
acOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0PgoKPiBbLi5dCgo+IEl0J3MgbXVjaCBjbGVh
bmVyIGxpa2UgdGhpcy4KPiAKPiBBY2tlZC1ieTogV2lsbHkgVGFycmVhdSA8d0Axd3QuZXU+Cj4g
Cj4gRmVlbCBmcmVlIHRvIHB1c2ggdGhlIHdob2xlIHNlcmllcyB0byB0aGUgbmV4dCBicmFuY2gu
CgpJIHB1c2hlZCBhbGwgdGhyZWUgcmVjZW50IHNlcmllcycgdG8gdGhlIG5leHQgYnJhbmNoLgoK
VGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
