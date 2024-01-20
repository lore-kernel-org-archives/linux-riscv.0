Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173A0C47DAF
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 22:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nifl/3fxEyW/jVqRKV8y2zqkJ9DceciTbeWGwN/I5CA=; b=QsaOIRKE1anXsE
	NPZs8k5nMn6spTZv6NujhlTPeaE+ffghYyU0AKx1TF413aTEcPszy9S073uaB39E+yWADLK+ASzUZ
	zMy+y7/9EfJneSPawWOHp29Fv5ORNqvpNjbpfE0O666EcoBkBwpF49n3pVhiq3BToMtdJ75XUUnWo
	qLvGrI7SdDYXpqX0MnDkL3jInXhDlMHv5Wf4aAwtP6Y0nMjKVCPc+glZwwZm5n7h6Lh/czn0k1f8M
	Nw8WmNkugUFNLips9pNKhlGxI0amJpd0e1gt/bXOi0MREVa5bUvKmCJiW53KD/0yoD2DWnXesqN34
	4hM1IqI69GwclONfeqKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJdt-008VIV-0k;
	Sat, 20 Jan 2024 22:16:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbD-008OC2-2t
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:09:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8F0BCB80908;
	Sat, 20 Jan 2024 21:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E99D1C433F1;
	Sat, 20 Jan 2024 21:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784994;
	bh=kk7385kyA89gDCaUa5qTgEWS2EMtvZOz94x65C7D7dI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hCV1Pi8Hn6xiWKXLnP0V27FJFaQtUKw6fR3Fyl4Qfp0tNieG6dpDNqgVT4z6fteJb
	 LNetZnccnIspVUdafDdAmiqXVwxzaoIcdNYBlsb1r4elQJyctHa58FuEDa4FYQX1wE
	 EoohajfIVNKNtCk+OwgwJFzE+oYzBa3birQNrtFCIEuM2qKMtEFqUYJCBMnrNEuoHN
	 ILE2EnKHXXAjvzxt5XMC5MVC9lHtnvlhmmqRsooA7DHh65IOltewmFSahVJCnY5C24
	 rIlyggfFM1xt75h65g5zTgdmg/0wLqYSG8g38vPxLDJGhu3xnW5JSwfDlCv79x9m9v
	 Qg9OC+ZSUshEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D7C91D8C96C;
	Sat, 20 Jan 2024 21:09:53 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v12 for-next 0/4] riscv: ftrace: Miscellaneous ftrace
 improvements
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499387.24348.15355889386163139110.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:53 +0000
References: <20231130121531.1178502-1-bjorn@kernel.org>
In-Reply-To: <20231130121531.1178502-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org, mhiramat@kernel.org,
 mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, suagrfillet@gmail.com, guoren@kernel.org,
 bjorn@rivosinc.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, songshuaishuai@tinylab.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_130956_074927_D3755B6B 
X-CRM114-Status: UNSURE (   8.07  )
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
KQpieSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT46CgpPbiBUaHUsIDMwIE5v
diAyMDIzIDEzOjE1OjI3ICswMTAwIHlvdSB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxi
am9ybkByaXZvc2luYy5jb20+Cj4gCj4gTkIhIFNvbmcgdG9sZCBtZSB0aGF0IGhlIHdvdWxkIG5v
dCBoYXZlIHRoZSB0aW1lIHdvcmsgb24gdGhpcyBzZXJpZXMsCj4gc28gSSBwaWNrZWQgaXQgdXAu
Cj4gCj4gVGhpcyBzZXJpZXMgaW5jbHVkZXMgYSB0aHJlZSBmdHJhY2UgaW1wcm92ZW1lbnRzIGZv
ciBSSVNDLVY6Cj4gCj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAt
IFt2MTIsZm9yLW5leHQsMS80XSByaXNjdjogc2VsZWN0IEZUUkFDRV9NQ09VTlRfVVNFX1BBVENI
QUJMRV9GVU5DVElPTl9FTlRSWQogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jL2I1
NDZkNjM2M2FmNAogIC0gW3YxMixmb3ItbmV4dCwyLzRdIHJpc2N2OiBmdHJhY2U6IE1ha2UgZnVu
Y3Rpb24gZ3JhcGggdXNlIGZ0cmFjZSBkaXJlY3RseQogICAgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9yaXNjdi9jLzM1ZTYxZTg4MjdlZQogIC0gW3YxMixmb3ItbmV4dCwzLzRdIHJpc2N2OiBmdHJh
Y2U6IEFkZCBEWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUyBzdXBwb3J0CiAgICBodHRw
czovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvMTk2Yzc5ZjE5YTkyCiAgLSBbdjEyLGZvci1uZXh0
LDQvNF0gc2FtcGxlczogZnRyYWNlOiBBZGQgUklTQy1WIHN1cHBvcnQgZm9yIFNBTVBMRV9GVFJB
Q0VfRElSRUNUW19NVUxUSV0KICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy82Mjky
OTFkZDg0OTkKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290LWRvdCwg
SSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3Qu
aHRtbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
