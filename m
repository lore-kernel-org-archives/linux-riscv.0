Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6443C28B28
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 19:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VU1nnUkcbev/d5X7ds6kEqq+OZz8U2JX2+Pv6SHu5cc=; b=BLbFzpqHdsTGlS
	pkKHdqsvIqzKLJ7tzlCEPjugZxM8XOtTtwl6hJ1sAzkbuHABGDDJ2L+pTnv4N3OwdsPRpxPx7MSQB
	+y77QF7NSIt9evLcWw1VAxekdh/hTK5ZhFVz4XpHLSn5V+bqyPENjKafGvq5MNUcIndlsa8ysjcVU
	0Jb0qKnJ1ndSaijclW/JpT2NcglcvY7GpSI/+mSZf5v+y+ZnqINGUgmW4irxBweaQma4iKyGCWgL7
	sEdp9a+G6BLKuQ3enRmiWZ3ROR59TjqHS3nx7ZHOOfDp0n1ERNWtvKgsLIGN3s1q5W4DDhIHGiS33
	qMAg3tC1dAT0k4NT0rMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsRrQ-00000009LBO-1Ulx;
	Wed, 12 Mar 2025 19:35:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsRrN-00000009LAr-2KL9
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 19:35:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 993CE5C3E80;
	Wed, 12 Mar 2025 19:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB038C4CEDD;
	Wed, 12 Mar 2025 19:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741808118;
	bh=M7+fyGOccmn1F32HBUZ/rVE79bzT22RXFBotLnZ+pnE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aQJ3+8p6fBwpOXEoh6GvXpk0RJ1mLsxFNRyOfDYvPJVsJfMjjE1qgqFH6yYkH2g1W
	 6HS/MW8DmQtGobiIy6Gn1FzYH4FnIe7XKHd7cTxg7+Ojs4F0tSxMuFP8chjQo3PsWR
	 ah3G8UoaACRNCF3QFNGyxqaONyQXiSxLOyHwu6sj/ya2CIkGIwKSPaOTRqKaVdCksf
	 hbvznQCMx2/39jeQ8sKkEcW0/uPudiwcF1Dd9/ekn6BPqBnn2qiVsQT4RcY4G4xAdR
	 yq/gHuPvuQw0/cg11V55/52mhFcFUBrvQme/KdXF+uBe5zb8ezrX/TzxKaQJHkXKrY
	 N8vUqpBOVkgoA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, "Steven Rostedt
 (Google)" <rostedt@goodmis.org>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH] riscv: fgraph: Fix stack layout to match
 __arch_ftrace_regs argument of ftrace_return_to_handler
In-Reply-To: <20250311132243.2178271-1-pulehui@huaweicloud.com>
References: <20250311132243.2178271-1-pulehui@huaweicloud.com>
Date: Wed, 12 Mar 2025 20:35:14 +0100
Message-ID: <87wmcucaa5.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_123521_678886_9B729B83 
X-CRM114-Status: GOOD (  10.28  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBOYXJlc2ggS2FtYm9qdSByZXBvcnRlZCBhICJC
YWQgZnJhbWUgcG9pbnRlciIga2VybmVsIHdhcm5pbmcgd2hpbGUKPiBydW5uaW5nIExUUCB0cmFj
ZSBmdHJhY2Vfc3RyZXNzX3Rlc3Quc2ggaW4gcmlzY3YuIFdlIGNhbiByZXByb2R1Y2UgdGhlCj4g
c2FtZSBpc3N1ZSB3aXRoIHRoZSBmb2xsb3dpbmcgY29tbWFuZDoKPgo+IGBgYAo+ICQgY2QgL3N5
cy9rZXJuZWwvZGVidWcvdHJhY2luZwo+ICQgZWNobyAnZjpteXByb2JlIGRvX25hbm9zbGVlcCVy
ZXR1cm4gYXJnczE9JHJldHZhbCcgPiBkeW5hbWljX2V2ZW50cwo+ICQgZWNobyAxID4gZXZlbnRz
L2Zwcm9iZXMvZW5hYmxlCj4gJCBlY2hvIDEgPiB0cmFjaW5nX29uCj4gJCBzbGVlcCAxCj4gYGBg
Cj4KPiBBbmQgd2UgY2FuIGdldCB0aGUgZm9sbG93aW5nIGtlcm5lbCB3YXJuaW5nOgo+Cj4gWyAg
MTI3LjY5Mjg4OF0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gWyAgMTI3
LjY5Mzc1NV0gQmFkIGZyYW1lIHBvaW50ZXI6IGV4cGVjdGVkIGZmMjAwMDAwMDA2NWJlNTAsIHJl
Y2VpdmVkIGJhMzRjMTQxZTk1OTQwMDAKPiBbICAxMjcuNjkzNzU1XSAgIGZyb20gZnVuYyBkb19u
YW5vc2xlZXAgcmV0dXJuIHRvIGZmZmZmZmZmODAwY2NiMTYKPiBbICAxMjcuNjk4Njk5XSBXQVJO
SU5HOiBDUFU6IDEgUElEOiAxMjkgYXQga2VybmVsL3RyYWNlL2ZncmFwaC5jOjc1NSBmdHJhY2Vf
cmV0dXJuX3RvX2hhbmRsZXIrMHgxYjIvMHgxYmUKPiBbICAxMjcuNjk5ODk0XSBNb2R1bGVzIGxp
bmtlZCBpbjoKPiBbICAxMjcuNzAwOTA4XSBDUFU6IDEgVUlEOiAwIFBJRDogMTI5IENvbW06IHNs
ZWVwIE5vdCB0YWludGVkIDYuMTQuMC1yYzMtZzBhYjE5MWM3NDY0MiAjMzIKPiBbICAxMjcuNzAx
NDUzXSBIYXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4gWyAgMTI3LjcwMTg1
OV0gZXBjIDogZnRyYWNlX3JldHVybl90b19oYW5kbGVyKzB4MWIyLzB4MWJlCj4gWyAgMTI3Ljcw
MjAzMl0gIHJhIDogZnRyYWNlX3JldHVybl90b19oYW5kbGVyKzB4MWIyLzB4MWJlCj4gWyAgMTI3
LjcwMjE1MV0gZXBjIDogZmZmZmZmZmY4MDEzYjVlMCByYSA6IGZmZmZmZmZmODAxM2I1ZTAgc3Ag
OiBmZjIwMDAwMDAwNjViZDEwCj4gWyAgMTI3LjcwMjIyMV0gIGdwIDogZmZmZmZmZmY4MTljMTJm
OCB0cCA6IGZmNjAwMDAwODA4NTMxMDAgdDAgOiA2ZTAwMDAwMDAwMDAwMDAwCj4gWyAgMTI3Ljcw
MjI4NF0gIHQxIDogMDAwMDAwMDAwMDAwMDAyMCB0MiA6IDZlNzU2NjIwNmQ2ZjcyNjYgczAgOiBm
ZjIwMDAwMDAwNjViZDgwCj4gWyAgMTI3LjcwMjM0Nl0gIHMxIDogZmY2MDAwMDA4MTI2MjAwMCBh
MCA6IDAwMDAwMDAwMDAwMDAwN2IgYTEgOiBmZmZmZmZmZjgxODk0ZjIwCj4gWyAgMTI3LjcwMjQw
OF0gIGEyIDogMDAwMDAwMDAwMDAwMDAxMCBhMyA6IGZmZmZmZmZmZmZmZmZmZmUgYTQgOiAwMDAw
MDAwMDAwMDAwMDAwCj4gWyAgMTI3LjcwMjQ3MF0gIGE1IDogMDAwMDAwMDAwMDAwMDAwMCBhNiA6
IDAwMDAwMDAwMDAwMDAwMDggYTcgOiAwMDAwMDAwMDAwMDAwMDM4Cj4gWyAgMTI3LjcwMjUzMF0g
IHMyIDogYmEzNGMxNDFlOTU5NDAwMCBzMyA6IDAwMDAwMDAwMDAwMDAwMDAgczQgOiBmZjIwMDAw
MDAwNjViZGQwCj4gWyAgMTI3LjcwMjU5MV0gIHM1IDogMDAwMDdmZmY4YWRjZjQwMCBzNiA6IDAw
MDA1NTU1NmRjMWQ4YzAgczcgOiAwMDAwMDAwMDAwMDAwMDY4Cj4gWyAgMTI3LjcwMjY1MV0gIHM4
IDogMDAwMDdmZmY4YWRmNWQxMCBzOSA6IDAwMDAwMDAwMDAwMDAwNmQgczEwOiAwMDAwMDAwMDAw
MDAwMDAxCj4gWyAgMTI3LjcwMjcxMF0gIHMxMTogMDAwMDU1NTU3MzczNzdjOCB0MyA6IGZmZmZm
ZmZmODE5ZDg5OWUgdDQgOiBmZmZmZmZmZjgxOWQ4OTllCj4gWyAgMTI3LjcwMjc2OV0gIHQ1IDog
ZmZmZmZmZmY4MTlkODlhMCB0NiA6IGZmMjAwMDAwMDA2NWJiMTgKPiBbICAxMjcuNzAyODI2XSBz
dGF0dXM6IDAwMDAwMDAyMDAwMDAxMjAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwMCBjYXVzZTog
MDAwMDAwMDAwMDAwMDAwMwo+IFsgIDEyNy43MDMyOTJdIFs8ZmZmZmZmZmY4MDEzYjVlMD5dIGZ0
cmFjZV9yZXR1cm5fdG9faGFuZGxlcisweDFiMi8weDFiZQo+IFsgIDEyNy43MDM3NjBdIFs8ZmZm
ZmZmZmY4MDAxN2JjZT5dIHJldHVybl90b19oYW5kbGVyKzB4MTYvMHgyNgo+IFsgIDEyNy43MDQw
MDldIFs8ZmZmZmZmZmY4MDAxN2JiOD5dIHJldHVybl90b19oYW5kbGVyKzB4MC8weDI2Cj4gWyAg
MTI3LjcwNDA1N10gWzxmZmZmZmZmZjgwMGQzMzUyPl0gY29tbW9uX25zbGVlcCsweDQyLzB4NTQK
PiBbICAxMjcuNzA0MTE3XSBbPGZmZmZmZmZmODAwZDQ0YTI+XSBfX3Jpc2N2X3N5c19jbG9ja19u
YW5vc2xlZXArMHhiYS8weDEwYQo+IFsgIDEyNy43MDQxNzZdIFs8ZmZmZmZmZmY4MDkwMWM1Nj5d
IGRvX3RyYXBfZWNhbGxfdSsweDE4OC8weDIxOAo+IFsgIDEyNy43MDQyOTVdIFs8ZmZmZmZmZmY4
MDkwY2MzZT5dIGhhbmRsZV9leGNlcHRpb24rMHgxNGEvMHgxNTYKPiBbICAxMjcuNzA1NDM2XSAt
LS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KPgo+IFRoZSByZWFzb24gaXMgdGhh
dCB0aGUgc3RhY2sgbGF5b3V0IGZvciBjb25zdHJ1Y3RpbmcgYXJndW1lbnQgZm9yIHRoZQo+IGZ0
cmFjZV9yZXR1cm5fdG9faGFuZGxlciBpbiB0aGUgcmV0dXJuX3RvX2hhbmRsZXIgZG9lcyBub3Qg
bWF0Y2ggdGhlCj4gX19hcmNoX2Z0cmFjZV9yZWdzIHN0cnVjdHVyZSBvZiByaXNjdiwgbGVhZGlu
ZyB0byB1bmV4cGVjdGVkIHJlc3VsdHMuCj4KPiBGaXhlczogYTNlZDQxNTdiN2Q4ICgiZmdyYXBo
OiBSZXBsYWNlIGZncmFwaF9yZXRfcmVncyB3aXRoIGZ0cmFjZV9yZWdzIikKPiBSZXBvcnRlZC1i
eTogTGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtmdEBsaW5hcm8ub3JnPgo+IENs
b3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBK0c5Zll2cF9vQXhlREZqODhUazJy
ZkVaN2p0WUtBS1N3ZllTNjY9NTdEYjlUQmR5QUBtYWlsLmdtYWlsLmNvbQo+IFNpZ25lZC1vZmYt
Ynk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+CgpXaXRoIHRoaXMgcGF0Y2gsIEkgZ2V0
IChmcm9tIGZ0cmFjZSBzdGFydHVwIHRlc3RzKToKICBUZXN0aW5nIHRyYWNlciBmdW5jdGlvbl9n
cmFwaDogUEFTU0VECmluc3RlYWQgb2YgdGhlIHNwbGF0IGFib3ZlISBUaGFua3MhCgpUZXN0ZWQt
Ynk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
