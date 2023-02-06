Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB00C636D3
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PdkJLkQ7Zvm9e22lBCJq37Q/Vv3ljCNHxfVV7Ng0zA=; b=x9FiKJCHvhpDAB
	I9xzCNdPKPYE7jf4Gh7oqy7ekmRTnsJoe6pwBoHtINoV5KY/F6zxc1VvFAkYzwwTKBDzclY4F0MV6
	7yx0y726/pDDjMs44TKIDzJYewSu/3ex8rQxXGOalUrckAm5iXgyvHN5yKZ/ufgNXCm6Yd5i+4pNo
	Q8z8PcKNfN7oVntoCHRLurG6lhClcUlbD5lVXRqX+RatNkit3hK2rJThHQvKmCevcwkB52apGEIE4
	prLNV1WQpFTssY+R+FxYAdxrNEpW2B63fd8nDL2DAEIHxllOjxiT30pJSVbbsohSKkXtY5JWeYMoq
	Wd3iEUvEQrhpPWt/iT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOx4q-007jeY-FI; Mon, 06 Feb 2023 08:42:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOx4n-007jdH-6Z
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 08:42:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 238B9CE149C
	for <linux-riscv@lists.infradead.org>; Mon,  6 Feb 2023 08:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74329C4339B
	for <linux-riscv@lists.infradead.org>; Mon,  6 Feb 2023 08:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675672929;
	bh=DEKotWFdDjMJl1AQmajkQzcVYCD7RzArGC/wErXefB8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gnV5sVpP0c5G0rvJwBTcY9QA7PYuQxPfFp+hxeUDwLjY63SgdkNqxl0RGUa0Fl3To
	 0ZFNTcae/9suPn3OfgM9YPfSuETDG32wiCpIG0Tpw1Z1FDHPsTfGMMB2grf7INKCLw
	 cUm1xmoB0pgulXne5tMLLJ3WO/X6WwxvrvrHsCXaKZ3B+KpAvY7vBOnaRmZid9RJX4
	 j5C2YORH45rbVeG5QxcGfQ0y3OvWJK0LxbXjzT47sGvWNzLtT2ZGO5hqHYyLNHUL2Q
	 ub3Ub0CNOT7zg9XRjrrTMB5FnRNhdiMPb5Y3sut98MMJzxlbEb0vdPqzoCBA1mepJE
	 2xl9rTPVoAJzg==
Received: by mail-ej1-f45.google.com with SMTP id mc11so31954635ejb.10
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 00:42:09 -0800 (PST)
X-Gm-Message-State: AO0yUKUcUg85Pj3X3AtRt9QAW6VRBdltgPNVeeG8XyL3wFGGEhgVAjIB
	9ykHI4X5sg1R2U2rY5C7+BywMulGOxwTSkBaXRs=
X-Google-Smtp-Source: AK7set9MLFBrWeKfTIdupI+sJ0InMdzYtl2Rcf2xfXBUkJ/7RoG+Hxnm0kgiCsT7FgZJzXE7/ZsmHjHeOeTUTGY9oZo=
X-Received: by 2002:a17:906:8419:b0:884:c19c:7c6 with SMTP id
 n25-20020a170906841900b00884c19c07c6mr4912650ejx.120.1675672927685; Mon, 06
 Feb 2023 00:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20230126170607.1489141-1-guoren@kernel.org> <20230126170607.1489141-2-guoren@kernel.org>
 <87357sjkv8.fsf@all.your.base.are.belong.to.us> <CAJF2gTS3s6EANWGSeykAGes=+MFbCAFxy5d0NFS+ynwRoQcCRA@mail.gmail.com>
 <87pmangqpt.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87pmangqpt.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 6 Feb 2023 16:41:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQij_0oZUa7cfdPCmK_L40e7WuC6-f2YeuOjBkqXHk4DQ@mail.gmail.com>
Message-ID: <CAJF2gTQij_0oZUa7cfdPCmK_L40e7WuC6-f2YeuOjBkqXHk4DQ@mail.gmail.com>
Subject: Re: [PATCH -next V3 1/2] riscv: jump_label: Fixup unaligned
 arch_static_branch function
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_004213_457755_8BB95E36 
X-CRM114-Status: GOOD (  18.01  )
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

T24gTW9uLCBGZWIgNiwgMjAyMyBhdCA0OjA5IFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gVHJpbW1pbmcgQ2MuCj4KPiBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JpdGVzOgo+Cj4gPj4gQEd1byBJIGRvbid0IHNlZSB0aGUgcG9pbnQgb2YgZG9pbmcg
YSBzZXJpZXMgZm9yIHRoaXMsIGFuZCBhc2tpbmcgdGhlCj4gPj4gbWFpbnRhaW5lcnMgdG8gInBp
Y2sgdGhpcyBwYXRjaCB0byBzdGFibGUsIGFuZCB0aGUgb3RoZXIgZm9yCj4gPj4gbmV4dCIuIElz
bid0IHRoYXQganVzdCBtb3JlIHdvcmsgZm9yIHRoZSBtYWludGFpbmVycy9yZXZpZXdlcnM/Cj4g
PiBJZiB0aGVzZSB0d28gcGF0Y2hlcyBhcmUgc2VwYXJhdGVkLCB0aGV5IGFyZSBhbGwgZml4dXAg
dGhhdCBpc3N1ZSBhbmQKPiA+IGNvbXBldGVkIHdpdGggZWFjaCBvdGhlci4gTWFraW5nIG15IHBh
dGNoIGFuIG9wdGltaXphdGlvbiBwYXRjaCBtdXN0Cj4gPiBkZXBlbmQgb24gaXQuIFRoYXQncyB3
aHkgSSBwdXQgdGhlbSBpbiBvbmUgc2VyaWVzLgo+Cj4gVGhleSBhcmUgbm90IGRlcGVkZW50IGF0
IGFsbCwgYW5kIG5vdCAiZml4dXAiLiBUaGUgZmlyc3QgaXMgYSBmaXgsIGFuZAo+IHNob3VsZCBn
byBpbnRvIC1maXhlcyBBU0FQLiBUaGUgb3RoZXIgcGF0Y2ggaXMgY29tcGxldGVseSBzdGFuZC1h
bG9uZSwKPiBhbmQgYW4gb3B0aW1pemF0aW9uIChtYXliZSkuIElmIHRoYXQgZ28gaW4sIGl0J3Mg
Zm9yIC1uZXh0Lgo+Cj4gSGF2aW5nIHRoZW0gYXMgc2VwYXJhdGUgcGF0Y2hlcywgbWFrZXMgaXQg
ZWFzaWVyIGZvcgo+IHJldmlld2Vycy9tYWludGFpbmVycy4gTm93LCB3aXRoIHlvdXIgYXBwcm9h
Y2ggdGhlcmUncyBtb3JlIHdvcmsKPiAoY29nbml0aXZlLCBhbmQgbWFudWFsKSBmb3Igb3RoZXJz
LgpPa2F5LCBJIHdvdWxkIHNlcGFyYXRlIHRoZW0uCgo+Cj4KPiBCasO2cm4KCgoKLS0gCkJlc3Qg
UmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
