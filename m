Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1342C02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 19:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eDcUZu8KXtzdP/LU3EZ6D7LE/bgbd7LSV02KYhdY9Sk=; b=dgFtsL2G2lMtKY
	bpvRJXepnqKHnmzwq6CST3DlHt/3nM8I6/JAC55FLwsz1T+/M0Zc9RVZOd5xHFDv9uhxtFRE99D5Y
	p0tUKL8Q73xkAOjd9W/bnysx0TIaMtLQQClv5OCRMDmbHM2CSclF0afBT0J7qT5CF0AavRc8depS6
	TAKFCVad3p1D73KIni4q6LYoAjAcl3GmsXtRaFTXFO1t1icfUUL0m4DtMibVFUt2tNcSTu9sybd4m
	nEaLVBeCZWxQIJc1/YIzuUBkwGgiRxbF58RCXSM+PID++zH28IUTOlk7wDr/ZtU3aUbhrbo+lCJ3D
	EZSaJ3fHbNZtxwktIJpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1ya-0000000GRQA-0qeL;
	Mon, 03 Feb 2025 19:19:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1uk-0000000GQBd-0gW9
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B7D055C6896;
	Mon,  3 Feb 2025 19:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513E5C4CEE6;
	Mon,  3 Feb 2025 19:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610121;
	bh=WCkfjIwqrL/vZTemkLUHoj349eCNsHtsoy14HaLr43w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JjVatSnAqwEZKnjH5gXnbCrtiH0i2lhdUz8zmvgLp7wqnjihF0v0qwDRr0oSisVeH
	 QnYeoiUDwsQP1VnXR1hU/eeLw+uvdCuYcePrQn3kCGMKMBlxYuzdgF6s0t1vI9gYTi
	 lsXDNszpS/S7b8oeMIkgUW4r251fDFxzh3guAc6BoGZ7he3m22VH7vA5wnz78TH8Wr
	 CqwIfb+cgH6Yj/3R2Tk4nZiJPwHCmsajIyHvx5KKf63Of0jkZaCFPciPubr4h2EHcC
	 KyREtOaCu4b5uqJtwLbKLrgxpv6wF1IVpa0FK68d7PtYDXrDacqWhYeuJaN2BcPlbv
	 oDPARFDpSyL/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7118C380AA67;
	Mon,  3 Feb 2025 19:15:49 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] selftests/nolibc: wire up riscv32
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861014802.3409359.16765792882817041253.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:48 +0000
References: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
In-Reply-To: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Clinux=40weissschuh=2Enet=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, w@1wt.eu, shuah@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 falcon@tinylab.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111522_244199_ADE6C50F 
X-CRM114-Status: UNSURE (   9.95  )
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byByaXNjdi9saW51eC5naXQgKGZpeGVz
KQpieSBUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+OgoKT24gU2F0LCAy
MSBEZWMgMjAyNCAxNTo0NDoyNyArMDEwMCB5b3Ugd3JvdGU6Cj4gTm9saWJjIGhhcyBzdXBwb3J0
IGZvciByaXNjdjMyLiBCdXQgdGhlIHRlc3RzdWl0ZSBkaWQgbm90IGFsbG93IHRvIHRlc3QKPiBp
dCBzbyBmYXIuIEFkZCBhIHRlc3QgY29uZmlndXJhdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+Cj4gLS0tCj4gVGhvbWFzIFdl
acOfc2NodWggKDYpOgo+ICAgICAgIHRvb2xzL25vbGliYzogYWRkIHN1cHBvcnQgZm9yIHdhaXRp
ZCgpCj4gICAgICAgc2VsZnRlc3RzL25vbGliYzogdXNlIHdhaXRpZCgpIG92ZXIgd2FpdHBpZCgp
Cj4gICAgICAgc2VsZnRlc3RzL25vbGliYzogdXNlIGEgcGlwZSB0byBpbiB2ZnByaW50ZiB0ZXN0
cwo+ICAgICAgIHNlbGZ0ZXN0cy9ub2xpYmM6IHNraXAgdGVzdHMgZm9yIHVuaW1wbGVtZW50ZWQg
c3lzY2FsbHMKPiAgICAgICBzZWxmdGVzdHMvbm9saWJjOiByZW5hbWUgcmlzY3YgdG8gcmlzY3Y2
NAo+ICAgICAgIHNlbGZ0ZXN0cy9ub2xpYmM6IGFkZCBjb25maWd1cmF0aW9ucyBmb3IgcmlzY3Yz
Mgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbMS82XSB0
b29scy9ub2xpYmM6IGFkZCBzdXBwb3J0IGZvciB3YWl0aWQoKQogICAgaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9yaXNjdi9jLzdmODliYzUxMTAxYwogIC0gWzIvNl0gc2VsZnRlc3RzL25vbGliYzog
dXNlIHdhaXRpZCgpIG92ZXIgd2FpdHBpZCgpCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jp
c2N2L2MvYTBiYzg5NDdhYzczCiAgLSBbMy82XSBzZWxmdGVzdHMvbm9saWJjOiB1c2UgYSBwaXBl
IHRvIGluIHZmcHJpbnRmIHRlc3RzCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2Mv
NGM3ZjA5YWI3OWIxCiAgLSBbNC82XSBzZWxmdGVzdHMvbm9saWJjOiBza2lwIHRlc3RzIGZvciB1
bmltcGxlbWVudGVkIHN5c2NhbGxzCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2Mv
MzQ5YWZjOGE1MmY4CiAgLSBbNS82XSBzZWxmdGVzdHMvbm9saWJjOiByZW5hbWUgcmlzY3YgdG8g
cmlzY3Y2NAogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jL2E0N2I0YjlmYmFhMQog
IC0gWzYvNl0gc2VsZnRlc3RzL25vbGliYzogYWRkIGNvbmZpZ3VyYXRpb25zIGZvciByaXNjdjMy
CiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvNjBmZTE4MjM3ZjcyCgpZb3UgYXJl
IGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBz
Oi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0bWwKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
