Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE20C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 12:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wYx3wWf+vMp9COYwPB7JfL3alvg74shXefn1dVmUVBA=; b=lM/ffLrDj2Fbnl
	F6WUvlBd+Wtxm3CirjImZDiNvctVIZWIzPN4qgCpeOwAnibWRHDsPFBzGHap/sm1bPtOB9oLJLVMM
	Wb8fbyPvhsnF7dE9+efqsOn2F5xSQqhNbr9+nKCy7d/SMulhAu9AmusS9evEdnjJFCDWZBKrITTvP
	dt6d5j7jKQJEsHlnFgjGy+ZuLadtG6k8sZl9k19aFZtzAj6m/GByNmQUuQ2G5lVbssywxyMyu1z0K
	O6326aDeKl88YdcrdHj46HLm0cu+8hPfLLYfrsspmeuCa3wNO2kYKfE81dv7fA12KimQ9iavKypie
	ZwUukP92S/XU1Hf4liTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seDZg-000000071DK-3jKk;
	Wed, 14 Aug 2024 12:58:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seDZd-000000071Az-48QR
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 12:57:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F20961A2F;
	Wed, 14 Aug 2024 12:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E4EC4AF09;
	Wed, 14 Aug 2024 12:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723640276;
	bh=62rmftprAKZAo0HKLAGpaiq0jqQ0eGkDk+lNEURWyY0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DZxuK9t1AiQBhXl71gUtYTmcXow0xAl9+Rtwq2PwcSVrMolUPtYBeEoJv8pW5Kwbp
	 uB/5OqxAUlVK38MMgNwZBIv1CS1l03zP4UQBxaXc00xejgvL3fLz/ZdGuHdLwl1z32
	 zH4UdzD7lFCkUJU6+xUPXZik7DoXWyisqLSHF/2jhkmqqhhUyQ6TXEH+KFb6xZ2OMM
	 gxsnB1/JxsmZZX1tqmY+csHgi0PCKiiDDylJ7r7sAFbSpYa7cscLQli7dvO5QsdLrK
	 /jtrLd9jUgUw/5K5UWkgtCHEw7AGcH3ua1vKHMd/RedQKBENpeuNN4Vdnl8XJqYhXy
	 T+KP/xwhfzr3Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li
 <zong.li@sifive.com>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH v2 3/6] riscv: ftrace: prepare ftrace for atomic code
 patching
In-Reply-To: <87wmkk8toq.fsf@all.your.base.are.belong.to.us>
References: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
 <20240628-dev-andyc-dyn-ftrace-v4-v2-3-1e5f4cb1f049@sifive.com>
 <87wmkk8toq.fsf@all.your.base.are.belong.to.us>
Date: Wed, 14 Aug 2024 14:57:52 +0200
Message-ID: <87sev78dnz.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_055758_126419_2B3D2EEB 
X-CRM114-Status: GOOD (  13.38  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBBbmR5IENoaXUgPGFu
ZHkuY2hpdUBzaWZpdmUuY29tPiB3cml0ZXM6Cj4KPj4gV2UgdXNlIGFuIEFVSVBDK0pBTFIgcGFp
ciB0byBqdW1wIGludG8gYSBmdHJhY2UgdHJhbXBvbGluZS4gU2luY2UKPj4gaW5zdHJ1Y3Rpb24g
ZmV0Y2ggY2FuIGJyZWFrIGRvd24gdG8gNCBieXRlIGF0IGEgdGltZSwgaXQgaXMgaW1wb3NzaWJs
ZQo+PiB0byB1cGRhdGUgdHdvIGluc3RydWN0aW9ucyB3aXRob3V0IGEgcmFjZS4gSW4gb3JkZXIg
dG8gbWl0aWdhdGUgaXQsIHdlCj4+IGluaXRpYWxpemUgdGhlIHBhdGNoYWJsZSBlbnRyeSB0byBB
VUlQQyArIE5PUDQuIFRoZW4sIHRoZSBydW4tdGltZSBjb2RlCj4+IHBhdGNoaW5nIGNhbiBjaGFu
Z2UgTk9QNCB0byBKQUxSIHRvIGVhYmxlL2Rpc2FibGUgZnRyY2FlIGZyb20gYQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW5hYmxlICAgICAgICBmdHJhY2UKPgo+PiBm
dW5jdGlvbi4gVGhpcyBsaW1pdHMgdGhlIHJlYWNoIG9mIGVhY2ggZnRyYWNlIGVudHJ5IHRvICst
MktCIGRpc3BsYWNpbmcKPj4gZnJvbSBmdHJhY2VfY2FsbGVyLgo+Pgo+PiBTdGFydGluZyBmcm9t
IHRoZSB0cmFtcG9saW5lLCB3ZSBhZGQgYSBsZXZlbCBvZiBpbmRpcmVjdGlvbiBmb3IgaXQgdG8K
Pj4gcmVhY2ggZnRyYWNlIGNhbGxlciB0YXJnZXQuIE5vdywgaXQgbG9hZHMgdGhlIHRhcmdldCBh
ZGRyZXNzIGZyb20gYQo+PiBtZW1vcnkgbG9jYXRpb24sIHRoZW4gcGVyZm9ybSB0aGUganVtcC4g
VGhpcyBlbmFibGUgdGhlIGtlcm5lbCB0byB1cGRhdGUKPj4gdGhlIHRhcmdldCBhdG9taWNhbGx5
Lgo+Cj4gVGhlICstMksgbGltaXQgaXMgZm9yIGRpcmVjdCBjYWxscywgcmlnaHQ/Cj4KPiAuLi5h
bmQgdGhpcyBJIHdvdWxkIHNheSBicmVha3MgRElSRUNUX0NBTExTICh3aGljaCBzaG91bGQgYmUg
aW1wbGVtZW50ZWQKPiB1c2luZyBjYWxsX29wcyBsYXRlcik/CgpUaGlua2luZyBhIGJpdCBtb3Jl
LCBhbmQgcmUtcmVhZGluZyB0aGUgc2VyaWVzLgoKVGhpcyBzZXJpZXMgaXMgZ29vZCB3b3JrLCBh
bmQgaXQncyBhIGJpZyBpbXByb3ZlbWVudCBmb3IgRFlOQU1JQ19GVFJBQ0UsCmJ1dAoKK2ludCBm
dHJhY2VfbWFrZV9jYWxsKHN0cnVjdCBkeW5fZnRyYWNlICpyZWMsIHVuc2lnbmVkIGxvbmcgYWRk
cikKK3sKKwl1bnNpZ25lZCBsb25nIGRpc3RhbmNlLCBvcmlnX2FkZHI7CisKKwlvcmlnX2FkZHIg
PSAodW5zaWduZWQgbG9uZykmZnRyYWNlX2NhbGxlcjsKKwlkaXN0YW5jZSA9IGFkZHIgPiBvcmln
X2FkZHIgPyBhZGRyIC0gb3JpZ19hZGRyIDogb3JpZ19hZGRyIC0gYWRkcjsKKwlpZiAoZGlzdGFu
Y2UgPiBKQUxSX1JBTkdFKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCXJldHVybiBfX2Z0cmFjZV9t
b2RpZnlfY2FsbChyZWMtPmlwLCBhZGRyLCBmYWxzZSk7Cit9CisKCmJyZWFrcyBXSVRIX0RJUkVD
VF9DQUxMUy4gVGhlIGRpcmVjdCB0cmFtcG9saW5lIHdpbGwgKm5ldmVyKiBiZSB3aXRoaW4KdGhl
IEpBTFJfUkFOR0UuCgpVbmxlc3Mgd2UncmUgaGFwcHkgd2l0aCBhIGJyZWFrIChJJ20gbm90KSAt
LSBJIHJlYWxseSB0aGluayBQdXJhbmpheSdzCkNBTExfT1BTIHBhdGNoIG5lZWRzIHRvIGJlIGJh
a2VkIGluIGluIHRoZSBzZXJpZXMhCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
