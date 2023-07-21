Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A1FEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 19:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NWDcjfWrdRVBqMXu9PcYKxTxkpxcSC9UKoDp1yEMxjE=; b=if9X+cX0TfSsDl
	5pg67fh+MN0KgUYzs7hQBX4QPKefK5OkSizE1+gBeMhUUDeWZrJJxpGfTFeqCnnppdo04XfVtqKQ/
	MKAkFT5HfJDvOeGO8Gt3rSVH2a7uo5LBXZN8W9Yh3hp9GmRcGqtt3b87ywOmRZU0mYx3Ry87ZKzeb
	VdWtGvLt2wrqDL3zMPjt4LuoGrZGxfSytrSnEYPnsWr5dmgm3WTZCTzUHUHCE3+P4WVB9Kj1pJmL1
	Onk0aQqly7YbL+K1VUuErZyX4IYJ5yEP66q8Whhj5v9idd6qq0BNU1VpzCgo/9gWcDQVNjiUdG2au
	qohBNglXm9MUeiTmDoWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMvvJ-00EyCL-1M;
	Fri, 21 Jul 2023 19:36:21 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qMvvD-00EyBM-2T;
	Fri, 21 Jul 2023 19:36:15 +0000
Date: Fri, 21 Jul 2023 12:36:15 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, wangkefeng.wang@huawei.com,
	nathan@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] modpost, kallsyms: Treat add '$'-prefixed symbols as
 mapping symbols
Message-ID: <ZLreL/9W28qSbhB3@bombadil.infradead.org>
References: <20230721150147.11720-2-palmer@rivosinc.com>
 <CAK7LNATF9pxJc0nU3NPnX_PFJr7gF6Baras548ULkO8XE98_VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNATF9pxJc0nU3NPnX_PFJr7gF6Baras548ULkO8XE98_VQ@mail.gmail.com>
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

T24gU2F0LCBKdWwgMjIsIDIwMjMgYXQgMDI6MDI6NTZBTSArMDkwMCwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOgo+IE9uIFNhdCwgSnVsIDIyLCAyMDIzIGF0IDEyOjIw4oCvQU0gUGFsbWVyIERhYmJl
bHQgPHBhbG1lckByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IFRyeWluZyB0byByZXN0cmlj
dCB0aGUgJyQnLXByZWZpeCBjaGFuZ2UgdG8gUklTQy1WIGNhdXNlZCBzb21lIGZhbGxvdXQsCj4g
PiBzbyBsZXQncyBqdXN0IHRyZWF0IGFsbCB0aG9zZSBzeW1ib2xzIGFzIHNwZWNpYWwuCj4gPgo+
ID4gRml4ZXM6IGMwNTc4MGVmM2MxICgibW9kdWxlOiBJZ25vcmUgUklTQy1WIG1hcHBpbmcgc3lt
Ym9scyB0b28iKQo+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNzEy
MDE1NzQ3Ljc3MjYzLTEtd2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20vCj4gPiBTaWduZWQtb2Zm
LWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiAKPiAKPiBSZXZpZXdl
ZC1ieTogTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4KClBhdGNoIGFwcGxp
ZWQgYW5kIHB1c2hlZCwgdGhhbmtzIQoKICBMdWlzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
