Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6988DC5475B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 11:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4wiNaJRYbtRafQH+VXPz+LlT4FsZ2oQb2YGCJPGUXI=; b=YfPmcKtGBuBt/n
	AxwFOlOevDkbybPIE7F35OOCtBx1g7Xo+sgrV87BOhet7T9bzJ8MNgPtlP/Q5i8SXeBkYDKVCLBHn
	sB9AWAUcDHV2ENZ3DH+xRiar6TwU8+gX8AwYKOO/11ALDIaKcl7QIHRx1hBdc7t9jeGhguaIKpGG8
	MN6X3hG14toYfHTGG9SDAOnW5uzBlxTmZ/rvQ+Tsu1YLVEXCMPXKiJ5PoC9XXvWUxkKzTKP3b15Y9
	8Bgw54foiVQzYUAkRocuo9lzp8zSDjBGPJk4hQoV2zaHJr0CNhBiAIKnQZYwjz2n1kKtDOYT5sTIt
	b7ZobbZyEyghNwlgnDkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkirf-0000000E0Gr-3qaJ;
	Thu, 14 Mar 2024 11:03:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkirc-0000000E0El-1JFh
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 11:03:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 75C24CE1D8E;
	Thu, 14 Mar 2024 11:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4CAC433F1;
	Thu, 14 Mar 2024 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710414185;
	bh=14cs9JGv315TFKb+LyO1yXIizCV7+YGDm31vt15rNuo=;
	h=From:List-Id:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qVGKLNRyciPjo8P3mQXh1uH0RcCmlS+bI+YS1aTMWECP3iKUyu32Z1/xgG56VogXF
	 lx1l1J/k1IHdH74U04aZNYf5XbkSNPOJ5orrZASIH7r5qCGiQ2ClYibyf3AL93mUVh
	 PBa6Po0t6hIwPFepLg0nxwmPLIXlI6JKRrk/B2ume6ocuL+NhARgcGlZNYHekZfzUZ
	 EVPZb8XIpbhdkx0gjNpe1nO02+lLuyp0BFG/OI8ggFx78XMCPGcyeEp/fHtiu1QtlY
	 NJv8mjHXLlqv1rJQ54dx5zszrCZWVKUCqGvrVH0wz9Jdjq6Vg1B7ZcbJNVfZGk73fu
	 /lBP46Pcm0Crw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>, soc@kernel.org
Cc: "conor@kernel.org >> Conor Dooley" <conor@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, linux-riscv@lists.infradead.org, Inochi Amaoto
 <inochiama@outlook.com>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>,
 haijiao.liu@sophgo.com, Chao Wei <chao.wei@sophgo.com>, Liu Gui
 <kenneth.liu@sophgo.com>, unicorn_wang@outlook.com
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.9
In-Reply-To: <MA0P287MB2822E853325154E87EAD3DEEFE582@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
References: <MA0P287MB2822E853325154E87EAD3DEEFE582@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 14 Mar 2024 12:02:31 +0100
Message-ID: <87cyrxt6t4.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_040309_079556_F4807D84 
X-CRM114-Status: UNSURE (   9.62  )
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

Q2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+IHdyaXRlczoKCj4gSGV5IEFybmQs
Cj4KPiBQbGVhc2UgcHVsbCBkdCBjaGFuZ2VzIGZvciBSSVNDLVYvU29waGdvLgo+Cj4gQ2hlZXJz
LAo+IENoZW4uCj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDQxYmNjYzk4
ZmI3OTMxZDYzZDAzZjMyNmE3NDZhYzRkNDI5YzFkZDM6Cj4KPiAgICBMaW51eCA2LjgtcmMyICgy
MDI0LTAxLTI4IDE3OjAxOjEyIC0wODAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJl
cG9zaXRvcnkgYXQ6Cj4KPiAgICBodHRwczovL2dpdGh1Yi5jb206c29waGdvL2xpbnV4LmdpdCBy
aXNjdi1zb3BoZ28tZHQtZm9yLXY2LjkKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byAwZjQ2ZTEzMzllZjExM2YwZGVkZjdhZDM3NjQ1MmNjNzIyZGJjZmU2Ogo+Cj4gICAgTUFJTlRB
SU5FUlM6IFNldHVwIHByb3BlciBpbmZvIGZvciBTT1BIR08gdmVuZG9yIHN1cHBvcnQgKDIwMjQt
MDItMjMgMTQ6MjE6MDQgKzA4MDApCj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gUklTQy1WIERldmljZXRyZWVzIGZv
ciB2Ni45Cj4KPiBTb3BoZ286Cj4gQWRkZWQgcmVzZXQgc3VwcG9ydCBmb3IgU0cyMDQyLgo+IEFs
c28gdXBkYXRlZCBtYWludGFpbmVyIGluZm9ybWF0aW9uIGZvciBTT1BIR08gdmVuZG9yIHN1cHBv
cnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNv
bT4KPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiBDaGVuIFdhbmcgKDIpOgo+ICAgICAgICByaXNjdjogZHRzOiBhZGQg
cmVzZXQgZ2VuZXJhdG9yIGZvciBTb3BoZ28gU0cyMDQyIFNvQwo+ICAgICAgICByaXNjdjogZHRz
OiBhZGQgcmVzZXRzIHByb3BlcnR5IGZvciB1YXJ0IG5vZGUKPgo+IElub2NoaSBBbWFvdG8gKDEp
Ogo+ICAgICAgICBNQUlOVEFJTkVSUzogU2V0dXAgcHJvcGVyIGluZm8gZm9yIFNPUEhHTyB2ZW5k
b3Igc3VwcG9ydAo+Cj4gICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDEwICsrKysrKy0tLS0KPiAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi5kdHNp
IHwgIDkgKysrKysrKysrCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpTZWVtcyBsaWtlIG9uZSBvZiB0aGUgY29tbWl0cyBhcmUgbWlzc2luZyBb
MV0gZnJvbSB0aGUgUFIuIFJWIGRlZmNvbmZpZwpkb2Vzbid0IGJ1aWxkIExpbnVzJyBtYXN0ZXIg
YXMgYSByZXN1bHQuCgoKQmrDtnJuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvMzVjMzQ4NDM3YjZlMTg5NzJjY2FmOTBkOWMzODA0MGNhY2NkMWYxMS4xNzA2NTc3NDUw
LmdpdC51bmljb3JuX3dhbmdAb3V0bG9vay5jb20vCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
