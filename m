Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47865EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 09:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AbdPs3LSCcy8ocJR0kOw2L6zNXqgoZdqdZqtP/LFyw=; b=rHdx5JG483mMN+
	xF6emIFP6j1d8BhLEmsqSYDcNR8TXri6uB6ce2mtKLyqgy82Lw7vbnPFDRUKlA2gbUkyZA+g30cQK
	CQpr3hMmr7wAfCDwmkgthUO5/6MQomyvmSz+ohAmjQXu2/lZRj7T0iQzQMLL/beP920hF9P7ayaMz
	F3CakWPeacXpar19/UZAjangEGHSymKAphVVmbg2bAYt0eu11WsEFVmj6jjOpgUC789jRrNGizURo
	AaaPvd+5QX6r+iTro5CuuT5zTNsfZuttBOWXVO9JYuVTB74CbYIXoCY5aKm8FXPjOjErvGxkYUZNY
	uMSXtx2f/TeZC/rrve+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPeO-00ASyg-09;
	Thu, 20 Jul 2023 09:08:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPeL-00ASxd-37
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 09:08:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C0AC6192C;
	Thu, 20 Jul 2023 09:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5704C433C8;
	Thu, 20 Jul 2023 09:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689844120;
	bh=7vwFcJOK2o2ICUdblT8hzETcmg2FeUVLkIn7N0rywqM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DyY8a9Zf8fGL/VPrimuDKR41GKnAtY7C1jKKvU2roErbYtGFI6ilB4gch6VPg3IOk
	 NTxq7dgvKiWSmy/ZHq8UGLzJ12f0aijd9/rYauzgFG7VUxZFs1ju+/J7/Lo/3F69gy
	 yMyhZT8TMHyLz/I/1NkLuViQsY020M99Q6WS0mTwkxg0tdgkVCDtnL2LvImxb4GrJu
	 +TEL5+adOFo+bfNRpPoehSnZkrVd3DCCw6grd457EFuKBESkbu0TdE6WOBsP0BiRrw
	 kjC4VVd2F3FtUwtDO6gCUdYEsEXce8bm0FaI8DU2JY/O2bPnTPXAPapRQ7nIFktGiY
	 xno4ZTNlBVJXQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Celeste Liu <coelacanthushex@gmail.com>, Andreas Schwab <schwab@suse.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@kernel.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Conor Dooley
 <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Felix Yan <felixonmars@archlinux.org>,
 Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Subject: Re: [PATCH v3] riscv: entry: set a0 = -ENOSYS only when syscall != -1
In-Reply-To: <54D8BFF7-C4D2-417E-B18C-62B5DB17B51B@gmail.com>
References: <20230718210037.250665-1-CoelacanthusHex@gmail.com>
 <mvmo7k8cqns.fsf@suse.de> <878rbbkgqo.fsf@all.your.base.are.belong.to.us>
 <54D8BFF7-C4D2-417E-B18C-62B5DB17B51B@gmail.com>
Date: Thu, 20 Jul 2023 11:08:37 +0200
Message-ID: <87wmyvq7ai.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_020842_042776_68C6C64F 
X-CRM114-Status: UNSURE (   8.54  )
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

Q2VsZXN0ZSBMaXUgPGNvZWxhY2FudGh1c2hleEBnbWFpbC5jb20+IHdyaXRlczoKCj4gT24gSnVs
eSAyMCwgMjAyMyAxMjoyODo0NyBBTSBHTVQrMDg6MDAsICJCasO2cm4gVMO2cGVsIiA8Ympvcm5A
a2VybmVsLm9yZz4gd3JvdGU6Cj4+QW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBzdXNlLmRlPiB3cml0
ZXM6Cj4+Cj4+PiBPbiBKdWwgMTkgMjAyMywgQ2VsZXN0ZSBMaXUgd3JvdGU6Cj4+Pgo+Pj4+IEBA
IC0zMDgsNyArMzEyLDcgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9p
ZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+Pj4gIAo+Pj4+ICAJCWlm
IChzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCj4+Pj4gIAkJCXN5c2NhbGxfaGFuZGxlcihyZWdzLCBz
eXNjYWxsKTsKPj4+PiAtCQllbHNlCj4+Pj4gKwkJZWxzZSBpZiAoKGxvbmcpc3lzY2FsbCAhPSAt
MUwpCj4+Pgo+Pj4gWW91IGNhbiBhbHNvIHVzZSBzeXNjYWxsICE9IC0xVUwgb3IgZXZlbiBzeXNj
YWxsICE9IC0xLgo+Pgo+PlRoZSBmb3JtZXIgaXMgaW5kZWVkIGJldHRlciBmb3IgdGhlIGV5ZXMh
IDotKSBUaGUgbGF0dGVyIHdpbGwgZ2V0IGEKPj4tV3NpZ24tY29tcGFyZSB3YXJuaW5nLCBubz8K
Pj4KPj4KPj5CasO2cm4KPgo+IFdlbGwsIHRoYXQncyB0cnVlLiBBbmQgSSBqdXN0IGZvdW5kIG91
dCB0aGF0IGJ5IEMgc3RhbmRhcmRzLCBjb252ZXJ0aW5nCj4gdWxvbmcgdG8gbG9uZyBpcyBpbXBs
ZW1lbnRhdGlvbi1kZWZpbmVkIGJlaGF2aW9yLCB1bmxpa2UgbG9uZyB0byB1bG9uZwo+IHdoaWNo
IGlzIHdlbGwtZGVmaW5lZC4gU28gaXQgaXMgcmVhbGx5IGJldHRlciB0aGFuIChsb25nKXN5c2Nh
bGwgIT0gLTFMLgoKSWYgeW91J3JlIHJlc3Bpbm5pbmcsIEkgc3VnZ2VzdCB5b3UgdXNlIERhdmlk
J3Mgc3VnZ2VzdGlvbjoKICogUmVtb3ZlIHRoZSBjb21tZW50IEkgc3VnZ2VzdCB5b3UgdG8gYWRk
CiAqIFVzZSAoc2lnbmVkKSBsb25nCiAqIEFkZCBzeXNjYWxsID49IDAgJiYKICogZWxzZSBpZiAo
c3lzY2FsbCAhPSAtMSkKCldoaWNoIGlzIHRoZSBsZWFzdCBhbW91bnQgb2Ygc3VycHJpc2VzIElN
Ty4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
