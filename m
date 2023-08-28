Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95FDC83F11
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MFn7kaJMfvoRkpkcJKeWGG91lOTEBOJVkVAbCt6mzM=; b=BncEt9B19gdxYO
	G16kze5b4JN+398xiCqTWkWJDjh+oueMTwKG4YbLRP139twTk7pYPhFxT7n7QkkRvozIQaZqnn6TC
	Rw1w7hQpUD18Amq7dVt8b5S7/HOxd9RQzeW0Baxa8lZw1gHq9VBr3d75OxENQcXtHq73WgsWl0HON
	Larxbol2avzyeMAFXBPYiMtI0sljejHqFkDvlgeXQZrPPHK5lMW9pcLuJo41QPx6WJ3L5FXhqn4g1
	kF59tIC1raLEEhcSbWsjEz+L7e4DKuTyitfRMLaA9UmkGeL+yY2r2Vnr9wBbSMgFy6KxRm65TJh6W
	5sqZ1vvkFEHTK8GTrEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qabfC-009afb-2T;
	Mon, 28 Aug 2023 12:48:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qabf9-009afB-1P
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 12:48:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0CD426374B;
	Mon, 28 Aug 2023 12:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA959C433C8;
	Mon, 28 Aug 2023 12:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693226889;
	bh=kDq/niXhUU4fC0NJCwF4054vsgDUGlnT0wfr+SrdKmc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=L5WfgM6kxZ2A5b4o8Jnawow6CY5FXahBc83FH1e+Eq6L0sdo7kRqhH7bUiJTezpdb
	 r/MVVM1t2TgGqfeU1WZxPbdo3LvVCMQhP7SHWQ+CrTk+aSQr+ZfGYJJmDc1zjfppu5
	 45Q3/niUU3ot46QvPmgiFiVKGglmry80DY8QQa/SHg3Zphkaom3sivx5/MVC3dGVI6
	 Bixmk6CRFtQCep/NHp2c34TZ3FvKPxnnxA2nqWf3QX+zEGmCddzexhHATOPO+RPs5a
	 Kywa9QtSWDnLVUOUNOTQVkRZpyGCEOw/5Km8/ogI/tTKQvflvtwSPhurln9ixoquAr
	 XlY07v+RYQgUQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Nam Cao <namcaov@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@kernel.org
Cc: Nam Cao <namcaov@gmail.com>
Subject: Re: [PATCH] riscv: provide riscv-specific is_trap_insn()
In-Reply-To: <20230827205641.46836-1-namcaov@gmail.com>
References: <20230827205641.46836-1-namcaov@gmail.com>
Date: Mon, 28 Aug 2023 14:48:06 +0200
Message-ID: <874jkjl4e1.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_054811_539864_2DC5BE61 
X-CRM114-Status: GOOD (  11.29  )
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

TmFtIENhbyA8bmFtY2FvdkBnbWFpbC5jb20+IHdyaXRlczoKCj4gdXByb2JlcyBleHBlY3RzIGlz
X3RyYXBfaW5zbigpIHRvIHJldHVybiB0cnVlIGZvciBhbnkgdHJhcCBpbnN0cnVjdGlvbnMsCj4g
bm90IGp1c3QgdGhlIG9uZSB1c2VkIGZvciBpbnN0YWxsaW5nIHVwcm9iZS4gVGhlIGN1cnJlbnQg
ZGVmYXVsdAo+IGltcGxlbWVudGF0aW9uIG9ubHkgcmV0dXJucyB0cnVlIGZvciAxNi1iaXQgYy5l
YnJlYWsgaWYgQyBleHRlbnNpb24gaXMKPiBlbmFibGVkLiBUaGlzIGNhbiBjb25mdXNlIHVwcm9i
ZXMgaWYgYSAzMi1iaXQgZWJyZWFrIGdlbmVyYXRlcyBhIHRyYXAKPiBleGNlcHRpb24gZnJvbSB1
c2Vyc3BhY2U6IHVwcm9iZXMgYXNrcyBpc190cmFwX2luc24oKSB3aG8gc2F5cyB0aGVyZSBpcyBu
bwo+IHRyYXAsIHNvIHVwcm9iZXMgYXNzdW1lIGEgcHJvYmUgd2FzIHRoZXJlIGJlZm9yZSBidXQg
aGFzIGJlZW4gcmVtb3ZlZCwgYW5kCj4gcmV0dXJuIHRvIHRoZSB0cmFwIGluc3RydWN0aW9uLiBU
aGlzIGNhdXNlIGFuIGluZmluaXRlIGxvb3Agb2YgZW50ZXJpbmcKPiBhbmQgZXhpdGluZyB0cmFw
IGhhbmRsZXIuCj4KPiBJbnN0ZWFkIG9mIHVzaW5nIHRoZSBkZWZhdWx0IGltcGxlbWVudGF0aW9u
LCBpbXBsZW1lbnQgdGhpcyBmdW5jdGlvbgo+IHNwZWZpY2lhbGx5IGZvciByaXNjdiB3aGljaCBj
aGVja3MgZm9yIGJvdGggZWJyZWFrIGFuZCBjLmVicmVhay4KCkkgdG9vayB0aGlzIGZvciBhIHNw
aW4sIGFuZCBpdCBpbmRlZWQgZml4ZXMgdGhpcyBuZXcgaGFuZyEgTmljZSEKCkhvd2V2ZXIsIHdo
ZW4gSSB0cmllZCBzZXR0aW5nIGFuIHVwcm9iZSBvbiB0aGUgZWJyZWFrIGluc3RydWN0aW9uCihv
ZmZzZXQgMHgxMTgpIGZyb20geW91ciBleGFtcGxlIFsxXSwgdGhlIHByb2JlIGRvZXMgbm90IHNo
b3cgdXAgaW4gdGhlCnRyYWNlIGJ1ZmZlci4KCkFueSBpZGVhcz8KClJlZ2FyZGxlc3MsIHlvdXIg
cGF0Y2ggZml4ZXMgdGhlIGhhbmc6CgpUZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJp
dm9zaW5jLmNvbT4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9aT3Vt
NTBQeThWa2krTmQzQG5hbS1kZWxsLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
