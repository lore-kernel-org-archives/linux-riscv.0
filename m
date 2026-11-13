Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863E2606A331
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dXYKg5lC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhnsFX9I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yaRckLIBV2airiheRsP97JDO9eAJhudRg5cPKjAsr+k=; b=dXYKg5lCKzzki6JLGNPtShd6+H
	H2OF9h3n3fuoQBE7QaXN/fkPSukqTHCHGTeH75rJikptDRpeHcv7GrnogElqf1NOIt+cufmOG6kkG
	VuN+1nvMCitUac5M/McGFvxBZZBXdnBumoaZmFSPzQL0MHMIFRAD/Ry9plJS3Zhb5YBJW9EENnoC3
	EX0+JGapyemvvAsvOlgpkWJkjLt8ma9ObLUm9NTgeM8iJwt0GANk5NcBBwTuJfHv9whVPEmzzsL++
	71UiqnfFaCliHnnhqDknYB+T5S3MP/isMmBIJrQAhJgApu456UvErZ+SHaMDQwkkQiJK78cugId1t
	rNk6BbUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRm6L-0000000Bx7u-1IMD;
	Fri, 13 Nov 2026 07:53:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRm6K-0000000Bx7c-14Tf
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:53:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A1B4C4557B
	for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 07:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F3F1F000C9
	for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 07:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794556415;
	bh=Pbc+EvL/kolpX1ANyxGTDhTo76dtFAMfqxanhYSvQ5w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FhnsFX9IqOEqzm1fK0sNBHyJwBPNMf7/T2Q844/+KOgoLeRNe8Uvwfk9UXjYEh/YU
	 0kFmgr6oVnS1TSt8tFJ59Sjxc6VvtbE63GPPevSOCeMjYSxs43SOTb7iewSByFZ+mv
	 DGBmS55zCFniI0Ijg8MJ77/SzpPDL9UMtQ1XtJLIRf/jvOvF6C8KxR6OK2lXMktE6y
	 op/KKva/v0i1zEkZ+ynGkafR39WtxXETbErAR/lbr1w/XSzlhHTzigeWj7MDfoJleZ
	 mArTbVKENievzAd9bOUpgyIq/HDeNZ/yPdD3KcVxOl9GiTuFBfGcGTUeL/fXt5EgmS
	 Xp2Mqnwcwhtxg==
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so874892f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 23:53:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEp4BWL2mJA2gpy15v+9bumuAZFLMhN7Q505zSXyHU7nC8lRnyU/D90AfgLY/J3wQc7WZZav/Mv8TYc3Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z9ahG/6zHR5ZDxpnPJgmQPWjDFvzD2I23LS5oDJXgDarnCp4tZv
	zmIAN35u4vCpSNZru4YI8nmwr4xbqLnMk2zr/QAkqy43k31nV9/vxgOz7kMlUDzTm90yKO/ltNM
	D1fvbpOmcC96PcIaC/aMPRlqQ7uP1DnY=
X-Received: by 2002:a5d:5d07:0:b0:48f:e879:5890 with SMTP id
 ffacd0b85a97d-49c727d1ea8mr4317788f8f.32.1794556413956; Thu, 12 Nov 2026
 23:53:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-probes-in-lrsc-v3-0-a95089852a17@mobileye.com> <20261112-probes-in-lrsc-v3-1-a95089852a17@mobileye.com>
In-Reply-To: <20261112-probes-in-lrsc-v3-1-a95089852a17@mobileye.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 13 Nov 2026 15:53:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ9hBeHV_gwTgRpJTYLm4G_dNgdD3Qy6W7eJjpox=YUEw@mail.gmail.com>
X-Gm-Features: AclHuK8fCN6hKllkO0ilkI7l-Lsw-a941NZB2lA8LguINRyjsCRWTEqXNvF9Gng
Message-ID: <CAJF2gTQ9hBeHV_gwTgRpJTYLm4G_dNgdD3Qy6W7eJjpox=YUEw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: kprobes: fix out-of-bounds read in riscv_probe_decode_insn
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Pekka Enberg <penberg@kernel.org>, 
	=?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Palmer Dabbelt <palmerdabbelt@google.com>, 
	Sashiko <sashiko-bot@kernel.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMTIsIDIwMjYgYXQgNjowMuKAr1BNIFZsYWRpbWlyIEtvbmRyYXRpZXYKPHZs
YWRpbWlyLmtvbmRyYXRpZXZAbW9iaWxleWUuY29tPiB3cm90ZToKPgo+IHJpc2N2X3Byb2JlX2Rl
Y29kZV9pbnNuKCkgY2FuIHRyaWdnZXIgYW4gb3V0LW9mLWJvdW5kcyBwYWdlIGZhdWx0Cj4gd2hl
biBwcm9iaW5nIGEgMTYtYml0IGNvbXByZXNzZWQgaW5zdHJ1Y3Rpb24gYXQgdGhlIGVuZCBvZiBh
IHBhZ2UuCj4KPiBhcmNoX3ByZXBhcmVfa3Byb2JlKCkgc2FmZWx5IHJlYWRzIDE2LWJpdCBwYXJj
ZWxzIGludG8gcC0+b3Bjb2RlLCBidXQgdGhlbgo+IHBhc3NlcyBwLT5hZGRyIHRvIHJpc2N2X3By
b2JlX2RlY29kZV9pbnNuKCksIHdoaWNoIHVuY29uZGl0aW9uYWxseQo+IGRlcmVmZXJlbmNlcyAq
YWRkciBhcyBhIDMyLWJpdCBwcm9iZV9vcGNvZGVfdAo+Cj4gSWYgYSAxNi1iaXQgaW5zdHJ1Y3Rp
b24gc2l0cyBpbiB0aGUgbGFzdCB0d28gYnl0ZXMgb2YgYSBtYXBwZWQgcGFnZSBuZXh0Cj4gdG8g
YW4gdW5tYXBwZWQgcGFnZSwgdGhlIDMyLWJpdCByZWFkIG9mICphZGRyIGNyb3NzZXMgdGhlIHBh
Z2UgYm91bmRhcnkKPiBhbmQgZmF1bHRzLgo+Cj4gUGFzc2luZyAmcC0+b3Bjb2RlIGluc3RlYWQg
b2YgcC0+YWRkciB0byByaXNjdl9wcm9iZV9kZWNvZGVfaW5zbigpCj4gKGFzIGFyY2hfdXByb2Jl
X2FuYWx5emVfaW5zbigpIGFscmVhZHkgZG9lcykgYXZvaWQgcmVhZGluZyBwYXN0IHRoZQo+IGlu
c3RydWN0aW9uLgo+Cj4gUmVwb3J0ZWQtYnk6IFNhc2hpa28gPHNhc2hpa28tYm90QGtlcm5lbC5v
cmc+Cj4gQ2xvc2VzOiBodHRwczovL3Nhc2hpa28uZGV2LyMvYnVnL2xpbnV4LTgxMmFmMDkxLTIw
ZDEtNDkxNS05N2E2LTc0MWY1MWUwNzAyMgo+IEZpeGVzOiBjMjJiMGJjYjFkZDAgKCJyaXNjdjog
QWRkIGtwcm9iZXMgc3VwcG9ydGVkIikKPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBLb25kcmF0
aWV2IDx2bGFkaW1pci5rb25kcmF0aWV2QG1vYmlsZXllLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNj
di9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvcHJvYmVzL2twcm9iZXMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMK
PiBpbmRleCA5ZTJhZmFiZjk0ZTguLjYzZWU1MDY2ZGVmNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJv
YmVzL2twcm9iZXMuYwo+IEBAIC04NSw3ICs4NSw3IEBAIGludCBfX2twcm9iZXMgYXJjaF9wcmVw
YXJlX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwKQo+ICAgICAgICAgICAgICAgICBwLT5vcGNvZGUg
fD0gKGtwcm9iZV9vcGNvZGVfdCkoKmluc24pIDw8IDE2Owo+Cj4gICAgICAgICAvKiBkZWNvZGUg
aW5zdHJ1Y3Rpb24gKi8KPiAtICAgICAgIHN3aXRjaCAocmlzY3ZfcHJvYmVfZGVjb2RlX2luc24o
cC0+YWRkciwgJnAtPmFpbnNuLmFwaSkpIHsKPiArICAgICAgIHN3aXRjaCAocmlzY3ZfcHJvYmVf
ZGVjb2RlX2luc24oJnAtPm9wY29kZSwgJnAtPmFpbnNuLmFwaSkpIHsKWWVzLCB1c2luZyAmcC0+
b3Bjb2RlIGlzIGNvcnJlY3QuCgpSZXZpZXdlZC1ieTogR1VPIFJlbiAoWHVhblRpZSkgPGd1b3Jl
bkBrZXJuZWwub3JnPgoKLS0gCkJlc3QgUmVnYXJkcwogR1VPIFJlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
