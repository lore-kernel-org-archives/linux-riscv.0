Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570FCCD3442
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 10:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtEsmlzqeE4AXlecoR0tUwpcLXQZ70MC3HSMrakBex4=; b=pkSgW0Y7g6LYVa
	H6JO0fXgnboeC8VxLC6F/olo8wjcchcNkFhMxGHhK9bJXiXKf//uBP4g5+u0RowhsvnYLY6JKafa7
	T2WgFc9T5iN3aTLKmc93htTZUHi3evEa22iyKWD+v2BVOkmSfDTwYQ/Tk3zckZA4Tv3RlfXOpBjT9
	FYVLIwllM1iN1cIVGXHK+OZlgjDF3ys/0z4lEV0oH3n27uaHL1a7tkCgS7/ozndQjyXJJvYFt9Syv
	EUKkj6VpDSf7L5bWpjrOoEv4zybUw1Cysw8NS5k1CbXBmB1AWJmZSS65FoZJpOfUnHIYUYWvoi0kj
	E1F59sXGjx8DWguvNf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvb5-00000003R81-3srU;
	Thu, 07 May 2026 10:04:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvb3-00000003R78-1iEJ
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 10:04:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71AF943B47
	for <linux-riscv@lists.infradead.org>; Thu,  7 May 2026 10:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E690C2BCF6
	for <linux-riscv@lists.infradead.org>; Thu,  7 May 2026 10:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778148284;
	bh=FSBoQYl9pKVX8kDbLQ9ev59hCVL1FSyoN047oWdFqAM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iQYmZPveOlChILrXBaOikArVjvLHUif2Wm19E7Ugqe8rvhk4mbs4lq7FwrmeqRSwP
	 4z0pT5mkzz3hZinWJ6lpKJRmOSqIyBhF81sj3c5Hin91accm9LpDS5qDXj6c5G7Ist
	 Z5vnHmsX2uwSGG6oWF0aKUMz4H2HDQSoPRYwy7O5pCcmAjNFm1/N5wbERJxfkCwtWP
	 CTWUPSJyoCQJsjDcRFc/k4xNle6oMtnJofQ/5F6riKpVzzTA/sli/n3E3/HnO3Of7m
	 CfPvc1uGajnJGyl9+ce6hmQ6CQWWAUbuw7fcwL9CGPnXT/IaU7XWkm4Xiq9SBVUptv
	 1MokFMB9Y94vg==
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44b052142e1so403121f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 May 2026 03:04:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9cAHRpfX2ro/7vMHqybTWAG3ovmmgjU8HqJdZWOp0/WjJpNoRvKc6ennHod/iqhBt/sZe7JEbDOM3Exw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaaNv4ZODiIMTorCtJAdzVDJ8vWKG30Kww4gWN6M+ECwhv0uHe
	/29py5XaY9ZqmYz/c7pkAf57LwyiUh6e4loEVURVF01IS7eIo4CTEKVtO953TpLGxsn1l2yiAW8
	Gt8qzDm94ba5R6iz69MJlJu7G58HA7Tk=
X-Received: by 2002:a05:6000:61e:b0:43d:7b90:fa23 with SMTP id
 ffacd0b85a97d-4515d4d0fafmr12396020f8f.29.1778148282572; Thu, 07 May 2026
 03:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260425005916.3321811-1-guoren@kernel.org> <20260425005916.3321811-4-guoren@kernel.org>
 <87wlxhwr8v.ffs@tglx>
In-Reply-To: <87wlxhwr8v.ffs@tglx>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 7 May 2026 18:04:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRWpbqmbLcqX-CroOp_XsNGZxinxMEb8FEkBY-qJeniRQ@mail.gmail.com>
X-Gm-Features: AVHnY4Imjt2cNMxiqNS60LFeeQz6aivaWccZakhoucv_O_-tz8wElEbBRk3SQEg
Message-ID: <CAJF2gTRWpbqmbLcqX-CroOp_XsNGZxinxMEb8FEkBY-qJeniRQ@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] irqchip/riscv-imsic: Move nr_guest_files to
 per-HART local config
To: Thomas Gleixner <tglx@kernel.org>
Cc: alex@ghiti.fr, anup@brainfault.org, aou@eecs.berkeley.edu, 
	atish.patra@linux.dev, cp0613@linux.alibaba.com, fangyu.yu@linux.alibaba.com, 
	gaohan@iscas.ac.cn, inochiama@gmail.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, me@ziyao.cc, palmer@dabbelt.com, 
	pjw@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_030445_461382_F399BFCF 
X-CRM114-Status: GOOD (  12.66  )
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

T24gV2VkLCBNYXkgNiwgMjAyNiBhdCA0OjEy4oCvQU0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBBcHIgMjUgMjAyNiBhdCAwMDo1OSwgZ3VvcmVu
QGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRl
bXkpIiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPgo+ID4gV2l0aCB0aGUgcmVjZW50IEtWTSBBSUEg
cGVyLUhBUlQgSEdFSSBjb252ZXJzaW9uLCB0aGUgZ2xvYmFsCj4gPiBucl9ndWVzdF9maWxlcyBp
cyBubyBsb25nZXIgYXBwcm9wcmlhdGUuIERpZmZlcmVudCBIQVJUcyBpbgo+ID4gaGV0ZXJvZ2Vu
ZW91cyBTb0NzIG1heSBoYXZlIGRpZmZlcmVudCBudW1iZXJzIG9mIGd1ZXN0IGludGVycnVwdAo+
ID4gZmlsZXMuCj4gPgo+ID4gTW92ZSBgbnJfZ3Vlc3RfZmlsZXNgIGZyb20gYHN0cnVjdCBpbXNp
Y19nbG9iYWxfY29uZmlnYCB0bwo+ID4gYHN0cnVjdCBpbXNpY19sb2NhbF9jb25maWdgLCBhbmQg
Y29tcHV0ZSBpdCBwZXItQ1BVIGluCj4gPiBpbXNpY19zZXR1cF9zdGF0ZSgpIGJhc2VkIG9uIHRo
ZSBhY3R1YWwgTU1JTyBndWVzdCBmaWxlIHJlZ2lvbiBzaXplLgo+ID4KPiA+IFVwZGF0ZSB0aGUg
cmVsYXRlZCBjb21tZW50IHRvIHJlZmxlY3QgdGhhdCBLVk0gbm93IHVzZXMgdGhlCj4gPiBwZXIt
SEFSVCB2YWx1ZS4KPiA+Cj4gPiBUaGlzIGVsaW1pbmF0ZXMgdGhlIGxhc3QgZ2xvYmFsIGFzc3Vt
cHRpb24gYWJvdXQgZ3Vlc3QgZmlsZXMgYW5kCj4gPiBjb21wbGV0ZXMgdGhlIHBlci1IQVJUIGNv
bnZlcnNpb24gc2VyaWVzIGZvciBSSVNDLVYgQUlBL0lNU0lDLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4K
PiBBc3N1bWluZyB0aGlzIGdvZXMgdGhyb3VnaCB0aGUgcmlzYy12IHRyZWU6Cj4KPiBBY2tlZC1i
eTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtlcm5lbC5vcmc+CgpHb3QgaXQgJiBUaHggVGhvbWFz
LgoKSSB0aGluayBpdCdsbCBnbyB0aHJvdWdoIHRoZSBrdm0tcmlzY3YgdHJlZSBiZWNhdXNlIGl0
J3MgYWxsIGFib3V0IGt2bQppbXByb3ZlbWVudHMuCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
