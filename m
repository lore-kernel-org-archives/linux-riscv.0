Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318E5C001DB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nuc7ZD6Ne4IYd5m6Hzk9m8gPAHtWl84H0/mNPKfR/Ek=; b=wEZEjz0ixWIxLF
	5UnAUIXMs5J9arakMqlqnGxNqSdIbMpGTcRe3nRZYxkDOv/IVWrD5pvpwxxfo8tB3XrtpuzL8f9Vq
	ypJ/U7spzirS0FY/IpskyaYDzUgytWQCzwB4qF4APTBolkM8YFL+uw9bogXydHBBtnJlzf4yWGbe4
	WjO03PdLsNb7di0uW/Bpit8Ii32SpltY0NByNf4XdxJKL/zpDSnnBllfA0sTUKCl29O+QGIE5YzTY
	xIrlSI+kD+4+prpQwtUGayqIMEI30AVanYSQTK6/EKg89xVZoFXiSDdJ33l7Ptqqm6R7m9tO8Nks8
	HvbszAbUi0SwUZNlyCUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVWgE-00H3Dr-1Y;
	Mon, 14 Aug 2023 12:28:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVWgB-00H3DY-1U
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 12:28:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EE48662676;
	Mon, 14 Aug 2023 12:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14691C433C8;
	Mon, 14 Aug 2023 12:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692016094;
	bh=Qa+koGcZ/5SfZLsg97XT6OX2/jmgLU9/dkCdhrh7P3c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Yud9//x9voDwzwPvp9WpQ0koSWHLxbu0jxT0nux7+AWWP3yfK15S+XzhDbDMMLW+A
	 JhDOt5Bz6V42v/04OwbD2Qp54rkClUnuvBxkxd22w8GeHrz105yJLIjMACqf3/nMSw
	 8bggOSJuG8+5KOyw5dG/FiBOkmxZA226YHAsdz0QkViIDfFtK81l5XyBEvxd3yreFC
	 JfoGzS82GhSWxqQR1jziKadK/LsXyGsHwSIplQJ5G84HdPFzpfqVmETdQhnFlga8QQ
	 chBbfUyPtpKXE+asE83OcTNNrw/jLqcBrr1E0WK5HgGDnyCOVPboYasEXW4/tHNq5M
	 z2Y/RzjSLv29A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Nam Cao <namcaov@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Nam Cao <namcaov@gmail.com>
Subject: Re: test code for kprobe
In-Reply-To: <fc71730b9350026427fe1c2bdbce9b993d8bc6f5.1690704360.git.namcaov@gmail.com>
References: <cover.1690704360.git.namcaov@gmail.com>
 <fc71730b9350026427fe1c2bdbce9b993d8bc6f5.1690704360.git.namcaov@gmail.com>
Date: Mon, 14 Aug 2023 14:28:11 +0200
Message-ID: <87il9hg65g.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_052815_562137_06681E80 
X-CRM114-Status: UNSURE (   6.71  )
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

TmFtIENhbyA8bmFtY2FvdkBnbWFpbC5jb20+IHdyaXRlczoKCkEgUklTQy1WIHNwZWNpZmljIGtw
cm9iZXMgdGVzdCAtLSBtdWNoIHdlbGNvbWUhCgpQbGVhc2UgYWRkIGEgcHJvcGVyIGNvbW1pdCBt
ZXNzYWdlIGhlcmUuCgo+IC0tLQo+ICBkcml2ZXJzL3Rlc3Rfa3Byb2JlL01ha2VmaWxlICAgICAg
fCAgIDMgKwo+ICBkcml2ZXJzL3Rlc3Rfa3Byb2JlL3Rlc3Rfa3Byb2JlLmMgfCAyNjUgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjY4IGluc2VydGlv
bnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdGVzdF9rcHJvYmUvTWFrZWZpbGUK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdGVzdF9rcHJvYmUvdGVzdF9rcHJvYmUuYwo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGVzdF9rcHJvYmUvTWFrZWZpbGUgYi9kcml2ZXJzL3Rl
c3Rfa3Byb2JlL01ha2VmaWxlCgpBcmNoaXRlY3R1cmUgc3BlY2lmaWMgdGVzdCBjb2RlIHVzdWFs
bHkgcmVzaWRlIGluICJhcmNoLyRBUkNIIgooYXJjaC9yaXNjdiksIGFuZCBpcyBwYXJ0IG9mIEtj
b25maWcuZGVidWcuCgpIYXZlIGEgbG9vayBhdDoKKiBncmVwIGZvciBBUk1fS1BST0JFU19URVNU
IGluIGFyY2gvYXJtCiogZ3JlcCBmb3IgS1BST0JFU19TQU5JVFlfVEVTVCwgYW5kIGluIGFyY2gv
cG93ZXJwYyBncmVwCiAgdGVzdF9lbXVsYXRlX3N0ZXAKKiBncmVwIFMzOTBfS1BST0JFU19TQU5J
VFlfVEVTVAoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
