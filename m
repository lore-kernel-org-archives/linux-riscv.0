Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6C2C6379F
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zc8aLxMtLXeveEcTqFIlEYvDDL3gR/HTQ8LLwkS25VQ=; b=O7+/IHEVgHCnxk
	lkDggZ2OC2UbopUwvF9YLTKCXvzVsCwv3Ap195AldowNFj58NQ+A6feuI9wHc3Es4bHViJO1wbnVP
	k9NJ6NG07GlL6yJYldD9xjPZE6CSdLLTDeu/m2upTcQQ8eKHWiy/usyidSosmMLEPnuFPrjm2HsFa
	C32Un5vluGoom6J7N3dWfjegs4A8zWu4FyWb03dV07gPovNC1VXbu6FzF0MP8eHJ2xafDa4J8ipcY
	muxqN+jKWnLg4GECWFVVi3ZU0jRv175myPpc4uSTYV0tETYJL/KcrQdlBt0VsYuAXbllw38rOFeUm
	061EIisHbTsrVniF3sAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT2AC-00Eewg-OX; Fri, 17 Feb 2023 14:56:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT29O-00EeOZ-Kc
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 14:55:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F151E61C0C;
	Fri, 17 Feb 2023 14:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6C4C4339E;
	Fri, 17 Feb 2023 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676645749;
	bh=oBBS7zR/ngaH2wd6CRyl7EabRqWFBiQfaWOFffYmUc8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=vDnmzDRwGg1Y7r6T+vj7LV3ZNvbmsbJ/x9QV+2r2wdY10XvTG8Ant9vGbspp4AVNV
	 3R+sF4jaFbPV/p6kTDCy0aasGD5lnVdty1dYd5iYgkReORuEpGp00fjCM6YEjrvxyI
	 FRCfQKkzaGMw+SuDpP0bMF847gJxyRQtdJaASHJPN+4mieXMa9Wk55HD1yerLeXUK/
	 eHM1At6dQi0Uzf87CFZrR+fVq4dDQyes49uSxWATDB55O8xHs/Zrn7ctCvg8D9y3F2
	 pBcmjVEWAPDOz1/Rxx17945EAJM4/CzEDi9y7+gVGbvMOVKUC66Nqf5K/e7pjIk16P
	 VX1cWeWRMgPDg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Andrey Konovalov
 <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 5/6] riscv: Fix ptdump when KASAN is enabled
In-Reply-To: <20230203075232.274282-6-alexghiti@rivosinc.com>
References: <20230203075232.274282-1-alexghiti@rivosinc.com>
 <20230203075232.274282-6-alexghiti@rivosinc.com>
Date: Fri, 17 Feb 2023 15:55:46 +0100
Message-ID: <87fsb4mjd9.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_065550_750503_D7A54DE6 
X-CRM114-Status: UNSURE (   8.48  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IFRoZSBL
QVNBTiBzaGFkb3cgcmVnaW9uIHdhcyBtb3ZlZCBuZXh0IHRvIHRoZSBrZXJuZWwgbWFwcGluZyBi
dXQgdGhlCj4gcHRkdW1wIGNvZGUgd2FzIG5vdCB1cGRhdGVkIGFuZCBpdCBhcHBlYXJzIHRvIGJy
ZWFrIHRoZSBkdW1wIG9mIHRoZSBrZXJuZWwKPiBwYWdlIHRhYmxlLCBzbyBmaXggdGhpcyBieSBt
b3ZpbmcgdGhlIEtBU0FOIHNoYWRvdyByZWdpb24gaW4gcHRkdW1wLgo+Cj4gRml4ZXM6IGY3YWUw
MjMzM2QxMyAoInJpc2N2OiBNb3ZlIEtBU0FOIG1hcHBpbmcgbmV4dCB0byB0aGUga2VybmVsIG1h
cHBpbmciKQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9z
aW5jLmNvbT4KClRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgpS
ZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
