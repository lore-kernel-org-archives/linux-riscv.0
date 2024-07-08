Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919DBC3DA41
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 18:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NoIEKvr1PEvE2KDUSqjXz32PmbdyaiPjJTVlCpisUDo=; b=f4BaMKt/Niq3/v
	/HTlR4A6MhOdOoWyXCktw05CAuSn6d42RzzTKJTjIlCeZ2q9XPFHDNrDXt4OebeutwSLpnjf7cyQA
	WSGiEIJOcjZoQflzs9O1bPrJKbJuGIVhwx34uPw5O50DwjkQQGRt0DLr3c3dQgXeAjNcbE/9aQp03
	wMT8N5knobdYYlXPP3tIjBHwoHnv8k/W9w3FClrWZPoVr0qZFkMnyiS7FNMaFUQ5AioHciUd5yjV6
	xKgB/K/jldSeZVUA4HFrr84tRe2WsU2aH4XVmvy0EyJfzm7meM/Q29PrwSbBGHcwgOCDJypLAN53x
	1fA3JPPXGsAP51r3XnIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQtXV-00000004l7g-0Jth;
	Mon, 08 Jul 2024 18:56:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQtXS-00000004l6a-2w3I
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 18:56:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EC07ACE0E08;
	Mon,  8 Jul 2024 18:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF69C116B1;
	Mon,  8 Jul 2024 18:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720464996;
	bh=auiFw9awF6KFKSRYHtSJbuHVjTlY6sK/YO7BzeVw8ZA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=q2+KXTCFUIzUl2gz3qHDLvrScrBgQdRYrcNG8RKW9FzFqLqNV9+sYr3V91YziR5Fn
	 DZF4YzexK47fgJLS/rrg8gPdoz7VNImWmCtOYbuuZzon41O4LfMpI9KOOlp2XoP4vo
	 7bK8bhuzkaUgX9B7OhFQYbN6WnejqW2E7BNzxTysfx/wJWSY8mKABrw5EOuJNZoGwW
	 3JcsHGNHCtMG5Rc381cXatEfKs75MQ8sGJfEUY9w2rNyxvZiLIFjDbLkeQAYzEqmQR
	 tRcSW9C/5d0jM+4mmWpIMD3j2T87F8RlJ7qbJFzsgC15wsrXr2QE/zyki8UEYCNHQO
	 KLeGIjKGm6tRA==
Message-ID: <b8dbdde2412d974baa24611b16cda5f7.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
References: <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Subject: Re: [GIT PULL] RISC-V Sophgo SG2042 clock drivers for v6.11
From: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, Inochi Amaoto <inochiama@outlook.com>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com, Chao Wei <chao.wei@sophgo.com>, unicorn_wang@outlook.com
To: Chen Wang <unicorn_wang@outlook.com>, linux-clk@vger.kernel.org
Date: Mon, 08 Jul 2024 11:56:33 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_115638_943677_EF5DE873 
X-CRM114-Status: UNSURE (   9.40  )
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

UXVvdGluZyBDaGVuIFdhbmcgKDIwMjQtMDYtMTQgMDA6Mjg6MjIpCj4gSGV5LCBTdGVwaGVuLAo+
IAo+IFBsZWFzZSBwdWxsIGNsb2NrIGNoYW5nZXMgZm9yIFJJU0MtVi9Tb3BoZ28vU0cyMDQyLgo+
IAo+IEZvciBkdHMgcGFydCwgSSB3aWxsIGhhbmRsZSBpdCBhdCBteSBzaWRlLgo+IAo+IEkgc2Vu
ZCB0aGlzIFBSIGp1c3Qgd2FudCB0byBleHBlZGl0ZSBwYXRjaGVzIGZvciB0aGlzIGNsb2NrIGRy
aXZlci4gVGhlIAo+IHBhdGNoZXMgaGF2ZSBnb25lIHRocm91Z2ggMTYgcm91bmRzIG9mIHJldmll
dyBbMV0sIGFuZCBJIGhhdmUgY2FyZWZ1bGx5IAo+IGNoZWNrZWQgYW5kIHJldmlzZWQgYWxsIG9m
IHRoZW0gYmFzZWQgb24gZXZlcnlvbmUncyBjb21tZW50cy4KPiAKPiBMaW5rOiAKPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9jb3Zlci4xNzE3NjYxNzk4LmdpdC51bmljb3Ju
X3dhbmdAb3V0bG9vay5jb20vIAo+IFsxXQo+IAo+IFRoYW5rcywKPiBDaGVuLgo+IAo+IFRoZSBm
b2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMTYxM2U2MDRkZjBjZDM1OWNmMmE3ZmJkOWJl
N2EwYmNmYWNmYWJkMDoKPiAKPiAgwqAgTGludXggNi4xMC1yYzEgKDIwMjQtMDUtMjYgMTU6MjA6
MTIgLTA3MDApCj4gCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4g
Cj4gIMKgIGh0dHBzOi8vZ2l0aHViLmNvbS9zb3BoZ28vbGludXguZ2l0IHRhZ3MvcmlzY3Ytc2cy
MDQyLWNsay1mb3ItdjYuMTEKPiAKPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNDhj
ZjdlMDEzODZlN2UzNWVhMTIyNTViYzQwMWJkZDQ4NGMzNGU3ZDoKPiAKPiAgwqAgY2xrOiBzb3Bo
Z286IEFkZCBTRzIwNDIgY2xvY2sgZHJpdmVyICgyMDI0LTA2LTE0IDE0OjQ5OjQwICswODAwKQo+
IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KClRoYW5rcy4gUHVsbGVkIGludG8gY2xrLW5leHQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
