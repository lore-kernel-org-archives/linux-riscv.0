Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2C1EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 19:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGVvujTJgkR7xKOmHnk+LThkybotESsHHojs5AA9vUw=; b=EZvEAVIKxDj5gm
	IJYLFgQ/zSf6VQ43Te4iVOAJXLlAq+b0h5rE2canOpEAH83Nu+RFY75HNoppgbGB0bgCPhBISbAr0
	BUiUoLN0XM/WbT7k/lxeAbpwbi3/TVH9awG05/SNpmyBFSZ4z8rYAqi3yc5o1u+kN1skjSRFtvwiw
	pahxcgZ6UAy8Z7g8K/WoUn1I9AumdBJK0PCzPQ/R0th37PsQiNMNl3XNJh0NgxOLrZrKhP8Sqy8Jm
	0rNpNTBZkUEEeatBW9oE1TwUcsbOEs37oU5wliZ/8EQmLf/KndGtc1o0Ubl8/mjNAHkgEY/jedUS8
	kx+9OYlTpYE0raUvM/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFQ7-001gg5-2J;
	Fri, 16 Jun 2023 19:47:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFQ5-001gfm-1G
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 19:47:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE9B76111F;
	Fri, 16 Jun 2023 19:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCBEC433C0;
	Fri, 16 Jun 2023 19:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686944860;
	bh=je9k+dviWZVOaiw8pfRZ49pnWXcKpJzFjqBYQETC2bE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o7k8R1tavqwwA4fpB1EtZwuC4qTqhOHNB8Lxk/rvt1+4ZlV8CprwTzThtmWKpB6Xm
	 +K8TCa6ECWDuFNvVZrXBEv7mjdyWbbK0Xugo3kbiYyBB+Tdfg32Fz5o7jsm5yVpXTJ
	 WsF1hwqdSf+rZA5eMQJvMlCwfAJXvrHPkz1orKb/XWy9SQ8INeZmCbKyNkGlyxBmIZ
	 wWRKgViyCHeyis0ypfnkS8W0PZxSSjv+wojj9WLUrkiK5Ldz36Ryor8XhAi3yEv2ui
	 em9rf6SDcIej4TFTQ2YifyB4AXz42drLUEwkGDyhDDJ+F+dB/XIMEoRUFpgvKGqfwC
	 fHKauglrnrCiw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: =?utf-8?Q?R=C3=A9mi?= Denis-Courmont <remi@remlab.net>,
 linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
In-Reply-To: <2357195.3bzvq7fpCv@basile.remlab.net>
References: <20230614163534.18668-1-palmer@rivosinc.com>
 <2357195.3bzvq7fpCv@basile.remlab.net>
Date: Fri, 16 Jun 2023 21:47:36 +0200
Message-ID: <87cz1vmbon.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_124741_498525_A2994D06 
X-CRM114-Status: UNSURE (   7.90  )
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

UsOpbWkgRGVuaXMtQ291cm1vbnQgPHJlbWlAcmVtbGFiLm5ldD4gd3JpdGVzOgoKPiBMZSBrZXNr
aXZpaWtrb25hIDE0LiBrZXPDpGt1dXRhIDIwMjMsIDE5LjM1LjM0IEVFU1QgUGFsbWVyIERhYmJl
bHQgYSDDqWNyaXQgOgo+PiBUaGUgViByZWdpc3RlcnMgYXJlIGNsb2JiZXJlZCBieSBzdGFuZGFy
ZCBBQkkgZnVuY3Rpb25zLCBzbyB1c2Vyc3BhY2UKPj4gcHJvYmFibHkgZG9lc24ndCBoYXZlIGFu
eXRoaW5nIHVzZWZ1bCBpbiB0aGVtIGJ5IHRoZSB0aW1lIHdlIGdldCB0byB0aGUKPj4ga2VybmVs
Lgo+Cj4gSW5kZWVkLCBmb3IgeW91ciB0eXBpY2FsIHN5c3RlbSBjYWxsLCB3cmFwcGVkIGJ5IHR3
byBvciBtb3JlIGxheWVycyBvZiAKPiBmdW5jdGlvbiBjYWxscyBpbnNpZGUgbGliYywgdXNlcnNw
YWNlIHdpbGwgdHJlYXQgdGhlIHJlZ2lzdGVycyBhcyBjbG9iYmVyZWQgCj4gYW55aG93Lgo+Cj4g
QnV0IEFGQUlVLCBvdGhlciBhcmNoaXRlY3R1cmVzIGRvbid0IGdyYXR1aXRpb3VzbHkgY2xvYmJl
ciBTSU1EIG9yIHZlY3RvciAKPiByZWdpc3RlcnMsIGV2ZW4gdGhvc2UgdGhhdCBhcmUgY2FsbGVl
LWNsb2JiZXJlZCBieSB0aGVpciByZXNwZWN0aXZlIGZ1bmN0aW9uIAo+IGNhbGxpbmcgY29udmVu
dGlvbiwgb3IgZG8gdGhleT8gRldJVywgQXJtIGlzIGdvaW5nIHRoZSBvcHBvc2l0ZSBkaXJlY3Rp
b24gd2l0aCAKPiB0aGVpciBoaWdoZXIgcHJpdmlsZWdlIGNhbGxzIChuZXdlciB2ZXJzaW9ucyBv
ZiBTTUNDQyBkZWZpbmUgaG93IHRvIHByZXNlcnZlIAo+IFNWRSB2ZWN0b3JzKS4KCkFjdHVhbGx5
LCBpdCdzIGZyb20gdGhlIFYgc3BlYzoKICAgIHJpc2N2LXYtc3BlYy0xLjAtNC5wZGY6CiAgICAg
IEV4ZWN1dGluZyBhIHN5c3RlbSBjYWxsIGNhdXNlcyBhbGwgY2FsbGVyLXNhdmVkIHZlY3RvciBy
ZWdpc3RlcnMKICAgICAgKHYwLXYzMSwgdmwsIHZ0eXBlKSBhbmQgdnN0YXJ0IHRvIGJlY29tZSB1
bnNwZWNpZmllZC4KCkFGQUlVIEFybSdzIFNWRS9TTUUgaGFzIHRoYXQgYXMgd2VsbC4KCgpCasO2
cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
