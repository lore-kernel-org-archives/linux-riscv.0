Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C43D2A52F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 16:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOy32TDIUnHGqlvxvPH5rxlW5C6QuQPXkYbVc5HocWs=; b=dwYEjHSDmsdI4r
	skery9ZwN/wduHfhuKvMkin5D6A1zNj8qXVSYTUGEFWc/0Ri3c1+Whm4Y5/+XMxy56VTsb+2Bxk/G
	Nz453JKZakshMEI29I3cFoDbhQnva5t4Qt99nDsyBTcmPEHIm88CGnu73SYqHVCUlZ0nr9BCKARUx
	pJsTIIO8+qZfEzupz+VbI0h/ZxwHiCqODtSR2ZubYINOHJgHb5hUPy/peE2Xee4WQnJh9FlQd1Raa
	fgkwkFl/KG6K98XzrHXttIWbYCKRGzKbkIdwSvO+9Z2UOsibPjIrV7FxZ40g1aOlr9dw8+tbF4Ovo
	Vh0psMC3T+wEghcg7A4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t17KA-0000000CUbt-3MY2;
	Wed, 16 Oct 2024 16:56:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t17K7-0000000CUbT-2isY
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 16:56:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 26C49A40BE9;
	Wed, 16 Oct 2024 16:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C121CC4CEC5;
	Wed, 16 Oct 2024 16:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729097793;
	bh=J4gS1FGlplHm9RrwafcRcFsITwBOWiS3jUhhKd+VZj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uSDtNnvj5YAUyrcN6vQghIBxe8+gzxGwwq+3C6x+L1EJIeGsKx395jdikje2uB7bN
	 C5U96insHJRbw5mmMuAb6Xs2tB66GswiHcE4mZCX1iw+WdYoHTsJ/ynw4tG3L7epud
	 VAx9HjT9yP4j+u8d3JhDIx6wNYZIRzFaoiFT+V9KwzG1N1LcywQUhMw7b7Ux/c6rtN
	 sGnDEC0FrUibAIYd0b5cpgD86azQZRWBnazmaSJyvvt7jessi64HmF2a4Fv88RdaSl
	 jUI4P6Naq6g4graXkHbu9VF/ip1kAfWEDloWFNfRe9FVUiWQAcLnxSm7mbRB11dJJr
	 zNyHrnpVOcqUg==
Date: Wed, 16 Oct 2024 09:56:30 -0700
From: Kees Cook <kees@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Jessica Clarke <jrtc27@jrtc27.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jason Montleon <jmontleo@redhat.com>, stable@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Do not use fortify in early code
Message-ID: <202410160951.E825F7A5@keescook>
References: <20241009072749.45006-1-alexghiti@rivosinc.com>
 <1CA19FB3-C1E3-4C2F-A4FB-05B69EC66D2F@jrtc27.com>
 <3fe1e610-c863-4fbf-85cb-6e83ba7684af@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3fe1e610-c863-4fbf-85cb-6e83ba7684af@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_095635_774625_5C9C2689 
X-CRM114-Status: GOOD (  18.56  )
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

T24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMDE6MjY6MjRQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IE9uIDE2LzEwLzIwMjQgMDA6MDQsIEplc3NpY2EgQ2xhcmtlIHdyb3RlOgo+ID4g
SXMgdGhlIHByb2JsZW0gaW4gWzFdIG5vdCBqdXN0IHRoYXQgdGhlIGVhcmx5IGJvb3QgcGF0aCB1
c2VzIG1lbWNweSBvbgo+ID4gdGhlIHJlc3VsdCBvZiBBTFRfT0xEX1BUUiwgd2hpY2ggaXMgYSB3
aWxkbHkgb3V0LW9mLWJvdW5kcyBwb2ludGVyIGZyb20KPiA+IHRoZSBjb21waWxlcuKAmXMgcGVy
c3BlY3RpdmU/IElmIHNvLCBpdCB3b3VsZCBzZWVtIGJldHRlciB0byB1c2UKPiA+IHVuc2FmZV9t
ZW1jcHkgZm9yIHRoYXQgb25lIGNhbGwgc2l0ZSByYXRoZXIgdGhhbiB1c2UgdGhlIGJpZwo+ID4g
X19OT19GT1JUSUZZIGhhbW1lciwgc3VyZWx5Pwo+IAo+IE5vdCBzdXJlIHdoeSBmb3J0aWZ5IGNv
bXBsYWlucyBoZXJlLCBhbmQgSSBoYXZlIGp1c3Qgc2VlbiB0aGF0IEkgZm9yZ290IHRvCj4gY2Mg
S2VlcyAoZG9uZSBub3cpLgoKSSBoYXZlbid0IGhhZCB0aW1lIHRvIGludmVzdGlnYXRlIHRoaXMg
LS0gc29tZXRoaW5nIGlzIGNvbmZ1c2luZyB0aGUKY29tcGlsZXIgYWJvdXQgdGhlIG9iamVjdCBz
aXplLiBJdCdzIGxpa2VseSB0aGF0IGl0IGhhcyBkZWNpZGVkIHRoYXQKImNoYXIgKiIgaXMgbGl0
ZXJhbGx5IHBvaW50aW5nIHRvIGEgc2luZ2xlIGJ5dGUuIChJbnN0ZWFkIG9mIGJlaW5nCnVuYWJs
ZSB0byBkZXRlcm1pbmUgdGhlIG9yaWdpbiBvZiB0aGUgcG9pbnRlciBhbmQgYmVpbmcgZm9yY2Vk
IHRvIHJldHVybgpTSVpFX01BWCBmb3IgdGhlIG9iamVjdCBzaXplIC0tICJ1bmtub3duIiBzaXpl
LikgSW4gb3RoZXIgY2FzZXMsIHdlJ3ZlCmJlZW4gYWJsZSB0byBjb252ZXJ0ICJjaGFyICpwdHIi
IHRvICJjaGFyIHB0cltdIiBhbmQgdGhhdCB0ZWxscyB0aGUKY29tcGlsZXIgaXQncyBhbiBhcnJh
eSBvZiB1bmtub3duIHNpemUuIFRoYXQgZGlkbid0IGxvb2sgdmVyeSBwb3NzaWJsZQpoZXJlLgoK
PiBbLi4uXQo+IEFuZCBJIGJlbGlldmUgdGhhdCBlbmFibGluZyBmb3J0aWZ5IGFuZCB1c2luZyB0
aGUgdW5zYWZlXyooKSB2YXJpYW50cyBpcwo+IGVycm9yLXByb25lIHNpbmNlIHdlJ2QgaGF2ZSB0
byBtYWtlIHN1cmUgdGhhdCBhbGwgdGhlICJmb3J0aWZpZWQiIGZ1bmN0aW9ucwo+IHVzZWQgaW4g
dGhhdCBjb2RlIHVzZSB0aGUgdW5zYWZlXyooKSB2YXJpYW50cy4KPiAKPiBTbyB0byBtZSwgaXQn
cyB3YXkgZWFzaWVyIGluIHRlcm1zIG9mIG1haW50ZW5hbmNlIHRvIGp1c3QgZGlzYWJsaW5nIGZv
cnRpZnkuCgpJIHdvdWxkIGFncmVlOiB0aGVyZSdzIG5vIHdheSB0byByZXBvcnQgYSBmb3J0aWZ5
IGZhaWx1cmUsIHNvIGJlc3QgdG8KdHVybiBpdCBvZmYgaGVyZS4KCi0tIApLZWVzIENvb2sKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
