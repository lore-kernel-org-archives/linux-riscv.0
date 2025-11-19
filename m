Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D0ACF31B7
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 12:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSIHgzHdIvU/3q1C7U3F7oVMnlgxSnOeG4PwAT+Mh78=; b=g3URvL0U8VUBUz
	dAckYsOWy0bYGFzis1fbcqDwHRGiViybmUCY/pD9F/T5HEQebcTG85xpPaHBcfNSL4XwFSARuA++A
	fJ0GNwlumpPK9VAWm9x/Lj0SIEcx49JHP20j+oU23O+ylyXqXO0gB1DRI9PriEtjdk7FSdpGMyAmk
	ILXc/DO+R/fY2BWQtjdX8/T9iT5rt9nJ4nkoKzgd+Z6uue1YZa2gpZjolhW47EJ9Zu0Nl/Tlg1Yo2
	4coC2xoJUv5/DgYrNIXqdun7R5YmxVi9G9qiZneVD6IWU6ClYUW2TTy3DNPbGcAOWowl15b2XnIdU
	LT8dNnQ7TudgUlJy10bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhKl-00000003A65-0loN;
	Wed, 19 Nov 2025 12:30:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhKj-00000003A5q-3uf5
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 12:30:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0AD47605D3;
	Wed, 19 Nov 2025 12:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5F5C2BC87;
	Wed, 19 Nov 2025 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763555448;
	bh=iq0aV4T0WOF/GPJMcgiZ3VSc1pc95Da3JcgV1XIC52s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cTR4tjqKmovQNZkhiVH1FAAPSplCdmELsgvip0m3tByybYUT+MQuKC46su0r+Ha6C
	 MJBaX5Ee/m3MTJw/rsKlbOTYJvkWV5icGJGMgVWujVgLORwBO9t2M8iLzByyE/YK/N
	 u9aKcYvrByLMeGaDmBeuCxwbbD6KDsxGj2xjCpdF4UgSv9IM+waZFVeALsVbXX3K88
	 MVJ8FcaEDVlxJEWZax49/gBUF5QYxUYD9J5sLoZb+3Y/x0BgjwqxVSp/B4BfkJRroB
	 e2eYirnwVYleh93YD9j6xB6haWoaGfntyNsJmva+9nTBKgUAxkuoF/ubocq2RXA0GX
	 v+0HfL+MhWODQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE35380AA40;
	Wed, 19 Nov 2025 12:30:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] Optimize the allocation of vector regset
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176355541326.758643.4317027962321955415.git-patchwork-notify@kernel.org>
Date: Wed, 19 Nov 2025 12:30:13 +0000
References: <20251013091318.467864-1-yongxuan.wang@sifive.com>
In-Reply-To: <20251013091318.467864-1-yongxuan.wang@sifive.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, greentime.hu@sifive.com,
 vincent.chen@sifive.com, andybnac@gmail.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byByaXNjdi9saW51eC5naXQgKGZvci1u
ZXh0KQpieSBQYXVsIFdhbG1zbGV5IDxwandAa2VybmVsLm9yZz46CgpPbiBNb24sIDEzIE9jdCAy
MDI1IDE3OjEyOjMwICswODAwIHlvdSB3cm90ZToKPiBUaGUgdmVjdG9yIHJlZ3NldCB1c2VzIHRo
ZSBtYXhpbXVtIHBvc3NpYmxlIHZsZW5iIDgxOTIgdG8gYWxsb2NhdGUgYQo+IDJeMTggYnl0ZXMg
YnVmZmVyIHRvIGNvcHkgdGhlIHZlY3RvciByZWdpc3Rlci4gQnV0IG1vc3QgcGxhdGZvcm1zCj4g
ZG9u4oCZdCBzdXBwb3J0IHRoZSBsYXJnZXN0IHZsZW5iLgo+IAo+IFRoZSByZWdzZXQgaGFzIDIg
dXNlcnMsIHB0cmFjZSBzeXNjYWxsIGFuZCBjb3JlZHVtcC4gV2hlbiBoYW5kbGluZyB0aGUKPiBQ
VFJBQ0VfR0VUUkVHU0VUIHJlcXVlc3RzIGZyb20gcHRyYWNlIHN5c2NhbGwsIExpbnV4IHdpbGwg
cHJlcGFyZSBhCj4ga2VybmVsIGJ1ZmZlciB3aGljaCBzaXplIGlzIG1pbih1c2VyIGJ1ZmZlciBz
aXplLCBsaW1pdCkuIEEgbWFsaWNpb3VzCj4gdXNlciBwcm9jZXNzIG1pZ2h0IG92ZXJ3aGVsbSBh
IG1lbW9yeS1jb25zdHJhaW50ZWQgc3lzdGVtIHdoZW4gdGhlCj4gYnVmZmVyIGxpbWl0IGlzIHZl
cnkgbGFyZ2UuIFRoZSBjb3JlZHVtcCB1c2VzIHJlZ3NldF9nZXRfYWxsb2MoKSB0bwo+IGdldCB0
aGUgY29udGV4dCBvZiB2ZWN0b3IgcmVnaXN0ZXIuIEJ1dCB0aGlzIEFQSSBhbGxvY2F0ZXMgYnVm
ZmVyCj4gYmVmb3JlIGNoZWNraW5nIHdoZXRoZXIgdGhlIHRhcmdldCBwcm9jZXNzIHVzZXMgdmVj
dG9yIGV4dGVuc2lvbiwgdGhpcwo+IHdhc3RlcyB0aW1lIHRvIHByZXBhcmUgYSBsYXJnZSBtZW1v
cnkgYnVmZmVyLgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAg
LSBbdjIsMS8yXSByaXNjdjogcHRyYWNlOiBPcHRpbWl6ZSB0aGUgYWxsb2NhdGlvbiBvZiB2ZWN0
b3IgcmVnc2V0CiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvZjhlMjU3ZTRkNTQ5
CiAgLSBbdjIsMi8yXSBzZWxmdGVzdHM6IHJpc2N2OiBBZGQgdGVzdCBmb3IgdGhlIFZlY3RvciBw
dHJhY2UgaW50ZXJmYWNlCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvOTI2Nzhj
NDAwMzhiCgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQtZG9vdC1kb3QsIEkg
YW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0
bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
