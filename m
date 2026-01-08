Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F3BD148AF
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 06:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpqgrfkZ86ZK+DkJ5QevNjVk//5B8x136gdmBUS9x5c=; b=LnH9HwhZJymv5R
	1OdLg8nee3BRlUCz6HZgAAR2iwZnhMVKC9iMM/kG59S9KFExJHt1tloAcZlbRxLAm7pB0QgC7rcCY
	8T1/E1rOdrFnucRqCmVF/dbA0tesxOFXgeQ01rJTaGCzufYh4fK7wCwtZZQKJ75sFWzzQWm1PQ1UY
	tTy2kqudFeplG3i6kH7Ifqa62uHBdTJaOuhi1S2DlVw5qjt2gBBv19kADr47UQZvVqzJ7mz5SCV57
	nTk2kQhlZjvfSxQSNDownctuz+3mJh3uQ4jS5mc6E/4GIjGi/aH6nye5WUegH/4nHdVNpYyRiqWx2
	3lpnUmqlxtnkPNUhSsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjv4-0000000G29b-0xBo;
	Thu, 08 Jan 2026 06:54:54 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjv1-0000000G22W-3dlO
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 06:54:53 +0000
X-UUID: d087ee76ec5e11f0a38c85956e01ac42-20260108
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:331afceb-032b-451e-8e83-fb7ac975119e,IP:0,UR
	L:0,TC:0,Content:3,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:3
X-CID-META: VersionHash:a9d874c,CLOUDID:0360f79b43531e3d0ae7c8a791c447d8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:4|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d087ee76ec5e11f0a38c85956e01ac42-20260108
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 622215496; Thu, 08 Jan 2026 14:54:01 +0800
Message-ID: <b419c6db-0f3f-4666-8f7c-156f7eda2b5b@kylinos.cn>
Date: Thu, 8 Jan 2026 14:53:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] lib/string_kunit: add test case for strnlen
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 kees@kernel.org, andy@kernel.org, ebiggers@kernel.org,
 martin.petersen@oracle.com, Jason@zx2c4.com, conor.dooley@microchip.com,
 samuel.holland@sifive.com, charlie@rivosinc.com, ajones@ventanamicro.com,
 nathan@kernel.org, linus.walleij@linaro.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260107023517.46840-1-jiangfeng@kylinos.cn>
 <20260107023517.46840-3-jiangfeng@kylinos.cn>
 <CAHp75VfxT+K1QRc5ayZGc4joB9vFJrk7kjQ4gAgUHOT1boFbmA@mail.gmail.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <CAHp75VfxT+K1QRc5ayZGc4joB9vFJrk7kjQ4gAgUHOT1boFbmA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_225452_332701_64657B1F 
X-CRM114-Status: UNSURE (   9.04  )
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

T24gMjAyNi8xLzcgMTk6NTYsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiBPbiBXZWQsIEphbiA3
LCAyMDI2IGF0IDQ6MzXigK9BTSBGZW5nIEppYW5nIDxqaWFuZ2ZlbmdAa3lsaW5vcy5jbj4gd3Jv
dGU6Cj4+Cj4+IEFkZCBhIEtVbml0IHRlc3QgZm9yIHN0cm5sZW4oKSB0byB2ZXJpZnkgY29ycmVj
dG5lc3MgYWNyb3NzCj4+IGRpZmZlcmVudCBzdHJpbmcgbGVuZ3RocyBhbmQgbWVtb3J5IGFsaWdu
bWVudHMuCj4gCj4gU2FtZSBjb21tZW50IGFzIHBlciBwYXRjaCAxIChpdCB3b3VsZCBwcm9iYWJs
eSByZXF1aXJlIHRvIGNhbGwgZm9yCj4gYXJjaF9zdHJubGVuKCkgb3Igc29tZXRoaW5nIGxpa2Ug
dGhpcykuCgpUaGFua3MsIG1ha2VzIHNlbnNlLgoKSSdsbCBhZGQgdGhlIHBlcmZvcm1hbmNlIGJl
bmNobWFya2luZyAocmFuZG9tIGZpbGxpbmcgKyB0aW1pbmcpIGluIFYyLgoKU2luY2Ugc3RyaW5n
IGZ1bmN0aW9ucyBhcmUgdHlwaWNhbGx5IGV4cG9ydGVkIGRpcmVjdGx5IGJ5IGVhY2ggYXJjaGl0
ZWN0dXJlCndpdGhvdXQgYW4gYXJjaF8gcHJlZml4LCBJJ2xsIGludHJvZHVjZSBhIGdlbmVyaWNf
c3RybmxlbigpIChiYXNlZCBvbgpsaWIvc3RyaW5nLmMpIHdpdGhpbiB0aGUgdGVzdCBmb3IgY29t
cGFyaXNvbi4KCj4gLi4uCj4gCj4+ICsgICAgICAgZm9yIChvZmZzZXQgPSAwOyBvZmZzZXQgPCAx
Njsgb2Zmc2V0KyspIHsKPj4gKyAgICAgICAgICAgICAgIGZvciAobGVuID0gMDsgbGVuIDw9IDEy
ODsgbGVuKyspIHsKPiAKPiBZb3Ugd2FudCB0byBkZWZpbmUgdGhlc2UgdHdvIGxpbWl0cyB0byBh
dm9pZCB0aGUgcG9zc2libGUgaXNzdWVzIGluCj4gdGhlIGZ1dHVyZSBpZiB0aGUgY29kZSBnZXRz
IGNoYW5nZWQuCgpHb3QgaXQsIHdpbGwgZGVmaW5lIHRoZXNlIGxpbWl0cyBhcyBtYWNyb3MgaW4g
VjIuIFRoYW5rcyEKCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKRmVuZyBKaWFuZwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
