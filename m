Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FFCC30653
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 17:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVdDjkRsNhcjg+Pp9OaflGXSS2413wtMM9zxSuaLK70=; b=BIP1f8LZuLMin0
	qofjn3Zs9y63hH2X7DiMcFpk0ZsjR5Cf4CW5mNGVzQyt0ITcTcDoRIb0ZZfiWhFhKypyEmT2fkz4h
	N6Si0A35ybMBjSZGVlpAyaAPLsjtxXcRNLEJylfCi04tWu/9k4Rze7mo5gS7YjzgVeViZiNr4dM67
	72udme8TX91FUTeZ4Z6cyuejZwQU5X0gS4iIQ/K+hOhjmqYfQjXMQNnuLtWgpTY+cgouJUwDKHz3w
	pz3NNpv7a5Arvd4wUgaWsFzCFtQS+4t66PF7CLaWz8SGvFjTup9C/SE5JSSG+Ie/r6PbyCq+apYT4
	gXl6ZhM/kbPyn+D4BTJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtGy-0000000BIOP-1F5E;
	Thu, 27 Jun 2024 17:51:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtGr-0000000BIIH-2bEm
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 17:51:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D15C061F6D;
	Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C44CC4AF07;
	Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719510656;
	bh=FhBU8A5+Q8J0OeOT+PjkesYLZH9n5p6zVNLOC80zmBw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CYAi0p2ZyCgc3Y/ccqYLug+F9ztYsbxWr9w6tr695saFcQn6YidUwXIq9K0ak9EJs
	 sk1lKUr5cTZvu27kL+fNxzb5Qy9/QclYZW3qiXhDFBS3YEgSgzOrPnXlnxeBrofhP2
	 at+jqHsN682VCLNaiPv3cQvb2ugk6DRlkH/0ceAOjETSb85P5DKXJUP3cGqpMTYXir
	 +ETVxwIBD5O16Ve54x/LvN5tBB6xToPZyGosRt4nz+/Wah2fD5Fl1L8I1/ZQTEnEKe
	 HzMCD9GQzDfNOZvkt3T+TosAQEGCbpNsFvr5eTd/7xXGx2wtLrXz7Vtt//bb+Zjefh
	 CJRGBd1/xNnbw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3DE1FC433A2;
	Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/11] riscv: Memory Hot(Un)Plug support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171951065622.6762.1200021343450740838.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 17:50:56 +0000
References: <20240605114100.315918-1-bjorn@kernel.org>
In-Reply-To: <20240605114100.315918-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, alexghiti@rivosinc.com,
 aou@eecs.berkeley.edu, david@redhat.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, osalvador@suse.de, lstoakes@gmail.com,
 Chethan.Seshadri@catalinasystems.io, linux-kernel@vger.kernel.org,
 abrestic@rivosinc.com, bjorn@rivosinc.com, santosh.mamila@catalinasystems.io,
 linux-mm@kvack.org, siva.munnangi@catalinasystems.io,
 virtualization@lists.linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_105057_764602_5BB23593 
X-CRM114-Status: UNSURE (   8.51  )
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byByaXNjdi9saW51eC5naXQgKGZvci1u
ZXh0KQpieSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT46CgpPbiBXZWQsICA1
IEp1biAyMDI0IDEzOjQwOjQzICswMjAwIHlvdSB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2cGVs
IDxiam9ybkByaXZvc2luYy5jb20+Cj4gCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+IE1lbW9yeSBIb3QoVW4pUGx1ZyBz
dXBwb3J0IChhbmQgWk9ORV9ERVZJQ0UpIGZvciB0aGUgUklTQy1WIHBvcnQKPiA9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4g
Cj4gKEZvciB0aGUgcmVzdGxlc3MgZm9sa3M6IGNoYW5nZSBsb2cgaW4gdGhlIGJvdHRvbSEpCj4g
Cj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAtIFt2NCwwMS8xMV0g
cmlzY3Y6IG1tOiBQcm9wZXJseSBmb3J3YXJkIHZtZW1tYXBfcG9wdWxhdGUoKSBhbHRtYXAgcGFy
YW1ldGVyCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvZTNlY2YyZmRjOGYzCiAg
LSBbdjQsMDIvMTFdIHJpc2N2OiBtbTogUHJlLWFsbG9jYXRlIHZtZW1tYXAvZGlyZWN0IG1hcC9r
YXNhbiBQR0QgZW50cmllcwogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzY2Njcz
MDk5ZjczNAogIC0gW3Y0LDAzLzExXSByaXNjdjogbW06IENoYW5nZSBhdHRyaWJ1dGUgZnJvbSBf
X2luaXQgdG8gX19tZW1pbml0IGZvciBwYWdlIGZ1bmN0aW9ucwogICAgaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9yaXNjdi9jL2ZlMTIyYjg5ZGE2NwogIC0gW3Y0LDA0LzExXSByaXNjdjogbW06IFJl
ZmFjdG9yIGNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5nZSgpIGZvciBtZW1vcnkgaG90IGFkZAog
ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzAwNzQ4MGZlODRhOQogIC0gW3Y0LDA1
LzExXSByaXNjdjogbW06IEFkZCBwZm5fdG9fa2FkZHIoKSBpbXBsZW1lbnRhdGlvbgogICAgaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzZlNmM1ZTIxYjhjYgogIC0gW3Y0LDA2LzExXSBy
aXNjdjogbW06IEFkZCBtZW1vcnkgaG90cGx1Z2dpbmcgc3VwcG9ydAogICAgaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9yaXNjdi9jL2M3NWE3NGY0YmExOQogIC0gW3Y0LDA3LzExXSByaXNjdjogbW06
IFRha2UgbWVtb3J5IGhvdHBsdWcgcmVhZC1sb2NrIGR1cmluZyBrZXJuZWwgcGFnZSB0YWJsZSBk
dW1wCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvMzc5OTJiN2YxMDk3CiAgLSBb
djQsMDgvMTFdIHJpc2N2OiBFbmFibGUgbWVtb3J5IGhvdHBsdWdnaW5nIGZvciBSSVNDLVYKICAg
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy9mOGMyYTI0MDU1NmUKICAtIFt2NCwwOS8x
MV0gdmlydGlvLW1lbTogRW5hYmxlIHZpcnRpby1tZW0gZm9yIFJJU0MtVgogICAgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9yaXNjdi9jLzA1NDZkNzA0M2U1NQogIC0gW3Y0LDEwLzExXSByaXNjdjog
bW06IEFkZCBzdXBwb3J0IGZvciBaT05FX0RFVklDRQogICAgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9yaXNjdi9jLzIxNmUwNGJmMWU0ZAogIC0gW3Y0LDExLzExXSByaXNjdjogRW5hYmxlIERBWCBW
TUVNTUFQIG9wdGltaXphdGlvbgogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzQ3
MDVjMTU3MWFkMwoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90
LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2Jv
dC5odG1sCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
