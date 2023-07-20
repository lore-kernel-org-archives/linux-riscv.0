Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A76EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 18:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nq3lSnvD+NsvHLJWeZE1kunhOB3gIlWJUxzVOUAz9o=; b=e/hxpDSwLqgjox
	Y1c7zIhyUIIw7mAbyEAkuvJCt/jZO83HPZXNgk90+2AsDIwkDU1baZIg0lTtZVNDYPaT+iG9nW18t
	66DUBg18Ij15RHgV8EGjTP4QKB5QaXl74am74vx2M0PEU+7xikUEJr0FQCITeQNjHq5NuRQxfHoLv
	Q4RqF1GN1hHW3heMCaKRmtl2y0d6lYj4oevX3hb8ZpuvwCoeO2BwxzahTId3WqWJE9QkkCPt2joo5
	x6h9pO/sULyXq8RbPiMjYuomdk0oC/cKbMUUZSHczocYGEPOUM69fj/Bl+CYRZyNObGLSWYVGZx6z
	VyvM8EreP0yYRxCeSA8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYc5-00BvRa-1M;
	Thu, 20 Jul 2023 18:42:57 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYc2-00BvQm-22
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 18:42:55 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-577ddda6ab1so17832477b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 11:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689878571; x=1690483371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bq95Q7U+QOIKz0vHUb4d1FI2vT9hkM28X99pRDYL0qE=;
        b=uIUVfXxTgi0P2U/RLVJMCpurhtZ6gDjcode14GccHcTlX3nzGBTmyF3gKAYRe3fN/h
         +MFkDo3sV6KWULrSEsolNQNp5cKlH2HQzmTyiowklcYRdwn4fAruoCuL8RlfqQuKY2Wu
         cOGrdawBqhhImFQbb1mhzxIiHDXMk5EtXQ/xaT1tS9W9u/C49qUTUmsEfy2FFpw98o+1
         C5PHGFfAv+B3kJtULC9JMx/Esox5hL6A1fV4AcODXUAHS38CGVyNmAWc3Ezu91QJC404
         t4mzg7MhslWGAW/gJNcGbgjiKCiciP7OberHA9W+LC44+cxgzkADef56+dfdnknBWXq2
         U3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689878571; x=1690483371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bq95Q7U+QOIKz0vHUb4d1FI2vT9hkM28X99pRDYL0qE=;
        b=Lnm16lsN6bBYEIasfxuV4wjNFO+dsjpmzUsocYs5nM37gp6DubEnSjEUQEGNidiVgm
         q8oKZ5D40lTOsUspNg900MhyY6dUpA5Q40f2ltwXu/08MNrU5+HAeuqQ9g669aTFptlY
         48JuD36YdElpDA23y4w7RYs9JHuZPOQjbTplEFYFzDFdRoIdsl3sBBjpx2B1aMIYETyQ
         gjpj4ossunD04i0O2PXZlJuJ2Bf/1LbMugh34Z0a/y6HCqnTmUpCJSDfoJ/mVoC9+PWo
         +N6wuCNKGP1kUJZ0fkn8RqQ1x0xzVrKHoCv5qxcj2zxq7Q6LNrhIjF16jmdXAUfUuPsP
         qSeQ==
X-Gm-Message-State: ABy/qLZKU+M0nmwU1wbdcE8Hm84zVJCDyhjs1jbeOGisopwifSXA7Y2+
	V99/qfZ87lWhXvVEZSEfSl1asEvTAmj6i9eEfCnvPg==
X-Google-Smtp-Source: APBJJlHh9Zacubk9eW8d7gwMS8CGEipLyQbrEEtuDSDftVQe8IiowHox7x4OmRjdAClXYuJk3ZSgA0znuoBMUQ8r7CE=
X-Received: by 2002:a0d:e64a:0:b0:56c:ffe4:4ca5 with SMTP id
 p71-20020a0de64a000000b0056cffe44ca5mr6641722ywe.10.1689878570912; Thu, 20
 Jul 2023 11:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221124094845.1907443-1-debug@rivosinc.com> <20230720001852.GA572618@google.com>
 <CAKC1njSaR2d-T_UnVJDZYbROT5OLEjBJ+Aps-UHPFTefDc8=6g@mail.gmail.com>
In-Reply-To: <CAKC1njSaR2d-T_UnVJDZYbROT5OLEjBJ+Aps-UHPFTefDc8=6g@mail.gmail.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 20 Jul 2023 11:42:38 -0700
Message-ID: <CAKC1njTb4=mnvNzvwU-afQvXbr+i-BzJBtp-tO91cEFh2QN6Vw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: VMAP_STACK overflow detection thread-safe
To: Sami Tolvanen <samitolvanen@google.com>
Cc: palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_114254_665466_D1F50DCE 
X-CRM114-Status: GOOD (  19.32  )
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

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgMTE6MzjigK9BTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAxOSwgMjAyMyBhdCA1OjE44oCvUE0g
U2FtaSBUb2x2YW5lbiA8c2FtaXRvbHZhbmVuQGdvb2dsZS5jb20+IHdyb3RlOgo+Pgo+PiBIaSBE
ZWVwYWssCj4+Cj4+IE9uIFRodSwgTm92IDI0LCAyMDIyIGF0IDAxOjQ4OjQ1QU0gLTA4MDAsIERl
ZXBhayBHdXB0YSB3cm90ZToKPj4gPiBjb21taXQgMzFkYTk0YzI1YWVhICgicmlzY3Y6IGFkZCBW
TUFQX1NUQUNLIG92ZXJmbG93IGRldGVjdGlvbiIpIGFkZGVkCj4+ID4gc3VwcG9ydCBmb3IgQ09O
RklHX1ZNQVBfU1RBQ0suIElmIG92ZXJmbG93IGlzIGRldGVjdGVkLCBDUFUgc3dpdGNoZXMgdG8K
Pj4gPiBgc2hhZG93X3N0YWNrYCB0ZW1wb3JhcmlseSBiZWZvcmUgc3dpdGNoaW5nIGZpbmFsbHkg
dG8gcGVyLWNwdQo+PiA+IGBvdmVyZmxvd19zdGFja2AuCj4+ID4KPj4gPiBJZiB0d28gQ1BVcy9o
YXJ0cyBhcmUgcmFjaW5nIGFuZCBlbmQgdXAgaW4gb3ZlciBmbG93aW5nIGtlcm5lbCBzdGFjaywg
b25lCj4+ID4gb3IgYm90aCB3aWxsIGVuZCB1cCBjb3JydXB0aW5nIGVhY2ggb3RoZXIgc3RhdGUg
YmVjYXVzZSBgc2hhZG93X3N0YWNrYCBpcwo+PiA+IG5vdCBwZXItY3B1LiBUaGlzIHBhdGNoIG9w
dGltaXplcyBwZXItY3B1IG92ZXJmbG93IHN0YWNrIHN3aXRjaCBieQo+PiA+IGRpcmVjdGx5IHBp
Y2tpbmcgcGVyLWNwdSBgb3ZlcmZsb3dfc3RhY2tgIGFuZCBnZXRzIHJpZCBvZiBgc2hhZG93X3N0
YWNrYC4KPj4KPj4gQXJlIHlvdSBwbGFubmluZyBvbiByZXNlbmRpbmcgdGhpcyBwYXRjaD8gSSBz
ZWUgaXQgZGlkbid0IGdhaW4gbXVjaAo+PiB0cmFjdGlvbiBsYXN0IHRpbWUsIGJ1dCB0aGlzIGxv
b2tzIGxpa2UgYSBtdWNoIGNsZWFuZXIgc29sdXRpb24gZm9yCj4+IHNlbGVjdGluZyB0aGUgb3Zl
cmZsb3cgc3RhY2sgdGhhbiBoYXZpbmcgYSBgc2hhZG93X3N0YWNrYCBhbmQgY2FsbGluZwo+PiB0
byBDIHRvIGNvbXB1dGUgdGhlIHBlci1DUFUgb2Zmc2V0LiBUaGUgYXNtX3Blcl9jcHUgbWFjcm8g
YWxzbyB3b3VsZAo+PiBjb21lIGluIGhhbmR5IHdoZW4gaW1wbGVtZW50aW5nIENPTkZJR19TSEFE
T1dfQ0FMTF9TVEFDSywgd2hpY2ggd2UnZAo+PiBsaWtlIHRvIGhhdmUgb24gUklTQy1WIHRvby4K
Pgo+Cj4gSSBwZXJzb25hbGx5IGxpa2UgdGhlIGFwcHJvYWNoIG9mIHVzaW5nIHBlcmNwdSBiZWNh
dXNlIEkgZm91bmQgaXQgY2xlYW5lciBhbmQgZWFzeSB0byBtYWludGFpbi4KPgo+IFRoZXJlIHdh
c24ndCBhbnkgd2lsbGluZ25lc3MgdG8gYWNjZXB0IHRoYXQgcGF0Y2ggYmVjYXVzZSBsaXN0IG1l
bWJlcnMgLyBtYWludGFpbmVycyB0aG91Z2h0IHRoZSBiZXN0IHdheSB0byBmaXggYW4gZXJyb3Ig
cHJvbmUgbWVjaGFuaXNtIGlzCj4gdG8gaW50cm9kdWNlIGFub3RoZXIgY2x1bmt5IG1lY2hhbmlz
bSB3aGljaCBpcyBkaWZmaWN1bHQgdG8gbWFpbnRhaW4uIFNvIG5vIHBsYW4gb24gcmVzZW5kaW5n
IHRoYXQgcGF0Y2guCj4KPiBJZiB0aGVyZSBpcyBtb3RpdmF0aW9uIHRvIHVzZSB0aGUgYXNtX3Bl
cl9jcHUgbWFjcm8gZm9yIG90aGVyIHN0dWZmLCBwbGVhc2UgZmVlbCBmcmVlIHRvIHVzZSBpdCBm
cm9tIG15IHBhdGNoLgo+IEkgYmVsaWV2ZSBpdCB3aWxsIGJlIGhhbmR5Lgo+Cj4gSWYgdGhlcmUg
aXMgbW90aXZhdGlvbiB0byBhY2NlcHQgdGhpcyBwYXRjaCBvbiB0aGUgbGlzdCBvciBwcm92aWRl
IHN1Z2dlc3Rpb25zIG9uIHRoaXMgcGF0Y2gsIEkgY2FuIHJlc2VuZCBpdC4KClNvcnJ5IGZvciB0
aGUgbGFzdCBodG1sIGZvcm1hdHRlZCBlbWFpbC4KU29tZWhvdyBzZXR0aW5ncyBpbiBteSBnbWFp
bCBnb3QgcmVzZXQgYW5kIHBsYWludGV4dCBtb2RlIHdhcyBzZXQgdG8gaHRtbCBhZ2Fpbi4KCj4K
PiAtRGVlcGFrCj4KPgo+Cj4+Cj4+Cj4+IFNhbWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
