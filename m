Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC21FC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CyIWqHpWBO8cE+Ab6V4BjpnB0ZKfOyzLBOCTKki4zr4=; b=PAfakyIyblctq7
	3iGU/3bL6C8qCefLoOLvlQeLe1yCG59GUO+40UiP+aOnLfLyvF1/cKAiBazzEn5tYUdYGidBgZ3WU
	tr57jF67O8ONs2afG5yrmNOuPZzL8BGtj2ZBMfRe29A2DQfnVr/eHuHlAhiKFiI/peRdxabccPV3R
	Vc/V7B3rQii0+OhjsNHMAYFADskcEtnShkGPaQ3pBTS+Z9b0DNe/H3ISOqa9EMFii636c42O9aiKa
	uoJcPdHLX1z7dSw2JCwIXuRDjF+97m0Orw8XCPbq3yUzomADNjSLNZDKw3oN/6MGDCANrLwib+C+q
	YHV7qWJlZfG2YMmt8quw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGB3-00DAL5-0E;
	Thu, 07 Dec 2023 15:20:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGAy-00DAFX-1J
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 15:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 08C49CE2477;
	Thu,  7 Dec 2023 15:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB4C6C4339A;
	Thu,  7 Dec 2023 15:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701962426;
	bh=yePXrMcyjaNLPyC0dPVTwrC8yLwFl3TN4nR0VbTsVjc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aq4wll0zFMO6KFcSHA6vSqHwMJwsuVtLQ+Cu8yFxZ6agjgCCFjHmyggE3tggHkyuz
	 RM4teSGZU9FTc3g88epaGGTjT8D1VUqaBQepd5g9eKfmxLTMjKhgBIb3SlqyAagc9g
	 dktPI7Xg1OWlkxI8W24hzc0MV9OciUxL4Yh4XDUgGaCe9GBPRMzkbnMf/zfpzv9aGa
	 D09mmd2crPBJqoU/SBh9Tc3m4fdeGDcgkNjJIaYZdmtEXfvNvGHiy6UJx1MG77DvL3
	 rDZsSWyXX6aN7tZ0O+4CUODC2qKPw7qaAsIDdTdX/6FdkrHdVDaEYOlJ/vo/ZS6dw1
	 Z4fH2ll0hWe2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D47DEC595C4;
	Thu,  7 Dec 2023 15:20:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] riscv: errata: andes: Probe for IOCP only once in boot
 stage
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170196242586.12999.12037381297044836180.git-patchwork-notify@kernel.org>
Date: Thu, 07 Dec 2023 15:20:25 +0000
References: <20231130212647.108746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231130212647.108746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad@ci.codeaurora.org, Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 geert+renesas@glider.be, peterlin@andestech.com, samuel.holland@sifive.com,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_072032_805527_EABF8A48 
X-CRM114-Status: UNSURE (   9.30  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFRodSwgMzAgTm92
IDIwMjMgMjE6MjY6NDcgKzAwMDAgeW91IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFrYXIgPHBy
YWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiAKPiBXZSBuZWVkIHRvIHBy
b2JlIGZvciBJT0NQIG9ubHkgb25jZSBkdXJpbmcgYm9vdCBzdGFnZSwgYXMgd2Ugd2VyZSBwcm9i
aW5nCj4gZm9yIElPQ1AgZm9yIGFsbCB0aGUgc3RhZ2VzIHRoaXMgY2F1c2VkIHRoZSBiZWxvdyBp
c3N1ZSBkdXJpbmcgbW9kdWxlLWluaXQKPiBzdGFnZSwKPiAKPiBbOS4wMTkxMDRdIFVuYWJsZSB0
byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcyBmZmZmZmZm
ZjgxMDBkM2EwCj4gWzkuMDI3MTUzXSBPb3BzIFsjMV0KPiBbOS4wMjk0MjFdIE1vZHVsZXMgbGlu
a2VkIGluOiByY2FyX2NhbmZkIHJlbmVzYXNfdXNiaHMgaTJjX3JpaWMgY2FuX2RldiBzcGlfcnNw
aSBpMmNfY29yZQo+IFs5LjAzNzY4Nl0gQ1BVOiAwIFBJRDogOTAgQ29tbTogdWRldmQgTm90IHRh
aW50ZWQgNi43LjAtcmMxKyAjNTcKPiBbOS4wNDM3NTZdIEhhcmR3YXJlIG5hbWU6IFJlbmVzYXMg
U01BUkMgRVZLIGJhc2VkIG9uIHI5YTA3ZzA0M2YwMSAoRFQpCj4gWzkuMDUwMzM5XSBlcGMgOiBy
aXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQrMHgxMC8weDNlCj4gWzkuMDU1NTU4XSDCoHJhIDog
YW5kZXNfZXJyYXRhX3BhdGNoX2Z1bmMrMHg0YS8weDUyCj4gWzkuMDYwNDE4XSBlcGMgOiBmZmZm
ZmZmZjgwMDBkOGMyIHJhIDogZmZmZmZmZmY4MDAwZDk1YyBzcCA6IGZmZmZmZmM4MDAzYWJiMDAK
PiBbOS4wNjc2MDddIMKgZ3AgOiBmZmZmZmZmZjgxNGUyNWEwIHRwIDogZmZmZmZmZDgwMzYxZTU0
MCB0MCA6IDAwMDAwMDAwMDAwMDAwMDAKPiBbOS4wNzQ3OTVdIMKgdDEgOiAwMDAwMDAwMDA5MDAw
MzFlIHQyIDogMDAwMDAwMDAwMDAwMDAwMSBzMCA6IGZmZmZmZmM4MDAzYWJiMjAKPiBbOS4wODE5
ODRdIMKgczEgOiBmZmZmZmZmZjAxNWI1N2M3IGEwIDogMDAwMDAwMDAwMDAwMDAwMCBhMSA6IDAw
MDAwMDAwMDAwMDAwMDEKPiBbOS4wODkxNzJdIMKgYTIgOiAwMDAwMDAwMDAwMDAwMDAwIGEzIDog
MDAwMDAwMDAwMDAwMDAwMCBhNCA6IGZmZmZmZmZmODEwMGQ4YmUKPiBbOS4wOTYzNjBdIMKgYTUg
OiAwMDAwMDAwMDAwMDAwMDAxIGE2IDogMDAwMDAwMDAwMDAwMDAwMSBhNyA6IDAwMDAwMDAwMDkw
MDAzMWUKPiBbOS4xMDM1NDhdIMKgczIgOiBmZmZmZmZmZjAxNWI1N2Q3IHMzIDogMDAwMDAwMDAw
MDAwMDAwMSBzNCA6IDAwMDAwMDAwMDAwMDAzMWUKPiBbOS4xMTA3MzZdIMKgczUgOiA4MDAwMDAw
MDAwMDA4YTQ1IHM2IDogMDAwMDAwMDAwMDAwMDUwMCBzNyA6IDAwMDAwMDAwMDAwMDAwM2YKPiBb
OS4xMTc5MjRdIMKgczggOiBmZmZmZmZjODAwM2FiZDQ4IHM5IDogZmZmZmZmZmYwMTViMTE0MCBz
MTA6IGZmZmZmZmZmODE1MWExYjAKPiBbOS4xMjUxMTNdIMKgczExOiBmZmZmZmZmZjAxNWIxMDAw
IHQzIDogMDAwMDAwMDAwMDAwMDAwMSB0NCA6IGZlZmVmZWZlZmVmZWZlZmYKPiBbOS4xMzIzMDFd
IMKgdDUgOiBmZmZmZmZmZjAxNWI1N2M3IHQ2IDogZmZmZmZmZDhiNjNhNjAwMAo+IFs5LjEzNzU4
N10gc3RhdHVzOiAwMDAwMDAwMjAwMDAwMTIwIGJhZGFkZHI6IGZmZmZmZmZmODEwMGQzYTAgY2F1
c2U6IDAwMDAwMDAwMDAwMDAwMGYKPiBbOS4xNDU0NjhdIFs8ZmZmZmZmZmY4MDAwZDhjMj5dIHJp
c2N2X25vbmNvaGVyZW50X3N1cHBvcnRlZCsweDEwLzB4M2UKPiBbOS4xNTE5NzJdIFs8ZmZmZmZm
ZmY4MDAwMjdlOD5dIF9hcHBseV9hbHRlcm5hdGl2ZXMrMHg4NC8weDg2Cj4gWzkuMTU3Nzg0XSBb
PGZmZmZmZmZmODAwMDI5YmU+XSBhcHBseV9tb2R1bGVfYWx0ZXJuYXRpdmVzKzB4MTAvMHgxYQo+
IFs5LjE2NDExM10gWzxmZmZmZmZmZjgwMDA4ZmNjPl0gbW9kdWxlX2ZpbmFsaXplKzB4NWUvMHg3
YQo+IFs5LjE2OTU4M10gWzxmZmZmZmZmZjgwMDg1Y2Q2Pl0gbG9hZF9tb2R1bGUrMHhmZDgvMHgx
NzljCj4gWzkuMTc0OTY1XSBbPGZmZmZmZmZmODAwODY2MzA+XSBpbml0X21vZHVsZV9mcm9tX2Zp
bGUrMHg3Ni8weGFhCj4gWzkuMTgwOTQ4XSBbPGZmZmZmZmZmODAwODY3ZjY+XSBfX3Jpc2N2X3N5
c19maW5pdF9tb2R1bGUrMHgxNzYvMHgyYTgKPiBbOS4xODczNjVdIFs8ZmZmZmZmZmY4MDg4OTg2
Mj5dIGRvX3RyYXBfZWNhbGxfdSsweGJlLzB4MTMwCj4gWzkuMTkyOTIyXSBbPGZmZmZmZmZmODA4
OTIwYmM+XSByZXRfZnJvbV9leGNlcHRpb24rMHgwLzB4NjQKPiBbOS4xOTg1NzNdIENvZGU6IDAw
MDkgYjdlOSA2Nzk3IDAxNGQgYTc4MyA4NWE3IGM3OTkgNDc4NSAwNzE3IDAxMDAgKDAxMjMpIGFl
ZjcKPiBbOS4yMDU5OTRdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQo+IAo+
IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbdjNdIHJpc2N2OiBl
cnJhdGE6IGFuZGVzOiBQcm9iZSBmb3IgSU9DUCBvbmx5IG9uY2UgaW4gYm9vdCBzdGFnZQogICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jL2VkNWI3Y2ZkNzgzOQoKWW91IGFyZSBhd2Vz
b21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tv
cmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
