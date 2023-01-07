Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9851AC54EBC
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jan 2023 11:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCXDseXOxrGozk5NPP8rChURPn52J7ByhkXvkUkcx4o=; b=GZx9pW1j+cKmLG
	p/cdi2RMGapRd9CV64a7k21Kg6A9UNwBcxP0p6KYXEiUnbRvihtlGg7AF6MT51lZyQtH0qCh05Gj2
	1cJTIj+zr3GTrWNbx5WFramB2USseypPwZSXFF2SaqMMC4+KYFhHiRfIzB/hlpr4XwNuNsK72bU01
	/rq852LWMR+y/rSFZ8jhuX16HZl5Kx8T4NDwnAW15y1WBIkFf1mNkqWsogAOzQ9rjRI8z2BZlpJqu
	RY+IOKCE38zcAVrgFBF8KTQcs/zfiN4/0AnRBqdXJYxvELRwiwu+YyKbEo9e3UfZfJLKQs8gOY5jm
	VLo8HxAdqCAgPN/FIQFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE7hT-004a28-VL; Sat, 07 Jan 2023 11:49:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE7hQ-004a0t-SE
	for linux-riscv@lists.infradead.org; Sat, 07 Jan 2023 11:49:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8B535B81F84
	for <linux-riscv@lists.infradead.org>; Sat,  7 Jan 2023 11:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E2FC433F2
	for <linux-riscv@lists.infradead.org>; Sat,  7 Jan 2023 11:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673092158;
	bh=kTlmPIB5+SKLRyeIWaGd1ToAz+B7IfaNZb/VN9D8Br0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r4tzApx4JoIplSyq0UV2lhEo24AGkMOtN7pg0xmXWMjhBr6QPLcg2dBLvY6yzZcgI
	 SfCFoVG8noNUdqqipcdKQTllXvTPzgzg/NC5iGGxF3O3JAG7PyowEPqPZ0Yx4pPEgB
	 AvLVITSVl+GBs6SL7ma+mi+zOOvxMJS4MuY2nAL3AN/9MfI1Kwi6W9uWpMhT0LMgpM
	 mz454M0fpi57OmawwVYlLd5HLKgqCBZiCuzaX3xGT5Nql0H9qrO7SSZ/5Y52gRsLnU
	 ImZq3hHDGHXmo2W4ATkGvh6fGiTAeXwQYtRful9aqnp/lsFmf2kl0CRci3V+cAC8of
	 aYekkNW2RzU2g==
Received: by mail-ej1-f42.google.com with SMTP id ud5so9042459ejc.4
        for <linux-riscv@lists.infradead.org>; Sat, 07 Jan 2023 03:49:18 -0800 (PST)
X-Gm-Message-State: AFqh2kqeoJQ9DzMIuwxQVqn+pJilAT6NsSv32IFR/HX7MrKW2nWSg4zh
	fGv4FQG98guGVewe8ipFfgqGr5rl6gNtmikfbHE=
X-Google-Smtp-Source: AMrXdXvBg9tr/kB+0KHKNPtvYYtBZn6/eI6f0f8EhL+v5nmOXFae28WlXsLrCphcY/eAy/rfkHOtgqMBNW6KzzGwzoA=
X-Received: by 2002:a17:906:cc87:b0:7c4:ec55:59e with SMTP id
 oq7-20020a170906cc8700b007c4ec55059emr3580124ejb.611.1673092156509; Sat, 07
 Jan 2023 03:49:16 -0800 (PST)
MIME-Version: 1.0
References: <20230103033531.2011112-1-guoren@kernel.org> <20230103033531.2011112-4-guoren@kernel.org>
 <Y7VpN/fFjqGJbxPu@FVFF77S0Q05N>
In-Reply-To: <Y7VpN/fFjqGJbxPu@FVFF77S0Q05N>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 7 Jan 2023 19:49:05 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSYhX1Yh_BZTOxgvOpKeaBSrxfnQ-LfUCh7Qiy58SgJkg@mail.gmail.com>
Message-ID: <CAJF2gTSYhX1Yh_BZTOxgvOpKeaBSrxfnQ-LfUCh7Qiy58SgJkg@mail.gmail.com>
Subject: Re: [PATCH -next V12 3/7] riscv: entry: Add noinstr to prevent
 instrumentation inserted
To: Mark Rutland <mark.rutland@arm.com>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	ben@decadent.org.uk, bjorn@kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_034921_205332_3815AAC1 
X-CRM114-Status: GOOD (  24.88  )
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

T24gV2VkLCBKYW4gNCwgMjAyMyBhdCA3OjU1IFBNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5k
QGFybS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKYW4gMDIsIDIwMjMgYXQgMTA6MzU6MjdQTSAt
MDUwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5A
bGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gV2l0aG91dCBub2luc3RyIHRoZSBjb21waWxlciBp
cyBmcmVlIHRvIGluc2VydCBpbnN0cnVtZW50YXRpb24gKHRoaW5rCj4gPiBhbGwgdGhlIGsqU0FO
LCBLQ292LCBHQ292LCBmdHJhY2UgZXRjLi4pIHdoaWNoIGNhbiBjYWxsIGNvZGUgd2UncmUgbm90
Cj4gPiB5ZXQgcmVhZHkgdG8gcnVuIHRoaXMgZWFybHkgaW4gdGhlIGVudHJ5IHBhdGgsIGZvciBp
bnN0YW5jZSBpdCBjb3VsZAo+ID4gcmVseSBvbiBSQ1Ugd2hpY2ggaXNuJ3Qgb24geWV0LCBvciBl
eHBlY3QgbG9ja2RlcCBzdGF0ZS4gKGJ5IHBldGVyeikKPgo+IFRoYXQncyBnZW5lcmFsbHkgdHJ1
ZSwgYW5kIG1ha2VzIHNlbnNlIHRvIG1lLCBidXQgLi4uLgo+Cj4gPiBMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9ZeGNRNk5vUGYzQUgwRVhlQGhpcmV6LnByb2dyYW1t
aW5nLmtpY2tzLWFzcy5uZXQvCj4gPiBSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5A
cml2b3NpbmMuY29tPgo+ID4gU3VnZ2VzdGVkLWJ5OiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+Cj4gPiBUZXN0ZWQtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVs
Lm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gLS0t
Cj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDQgKystLQo+ID4gIGFyY2gvcmlzY3Yv
bW0vZmF1bHQuYyAgICAgfCAyICstCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiBpbmRleCA1NDliZGU1Yzk3
MGEuLjk2ZWM3NmM1NGZmMiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+IEBAIC05NSw5ICs5NSw5
IEBAIHN0YXRpYyB2b2lkIGRvX3RyYXBfZXJyb3Ioc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGludCBz
aWdubywgaW50IGNvZGUsCj4gPiAgfQo+ID4KPiA+ICAjaWYgZGVmaW5lZChDT05GSUdfWElQX0tF
Uk5FTCkgJiYgZGVmaW5lZChDT05GSUdfUklTQ1ZfQUxURVJOQVRJVkUpCj4gPiAtI2RlZmluZSBf
X3RyYXBfc2VjdGlvbiAgICAgICAgICAgICAgIF9fc2VjdGlvbigiLnhpcC50cmFwcyIpCj4gPiAr
I2RlZmluZSBfX3RyYXBfc2VjdGlvbiBfX25vaW5zdHJfc2VjdGlvbigiLnhpcC50cmFwcyIpCj4g
PiAgI2Vsc2UKPiA+IC0jZGVmaW5lIF9fdHJhcF9zZWN0aW9uCj4gPiArI2RlZmluZSBfX3RyYXBf
c2VjdGlvbiBub2luc3RyCj4gPiAgI2VuZGlmCj4gPiAgI2RlZmluZSBET19FUlJPUl9JTkZPKG5h
bWUsIHNpZ25vLCBjb2RlLCBzdHIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
PiAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBuYW1lKHN0cnVjdCBw
dF9yZWdzICpyZWdzKSAgXAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYyBi
L2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+ID4gaW5kZXggZDg2ZjdjZWJkNGE3Li5iMjZmNjhlYWM2
MWMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPiA+ICsrKyBiL2FyY2gv
cmlzY3YvbW0vZmF1bHQuYwo+ID4gQEAgLTIwNCw3ICsyMDQsNyBAQCBzdGF0aWMgaW5saW5lIGJv
b2wgYWNjZXNzX2Vycm9yKHVuc2lnbmVkIGxvbmcgY2F1c2UsIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hKQo+ID4gICAqIFRoaXMgcm91dGluZSBoYW5kbGVzIHBhZ2UgZmF1bHRzLiAgSXQgZGV0
ZXJtaW5lcyB0aGUgYWRkcmVzcyBhbmQgdGhlCj4gPiAgICogcHJvYmxlbSwgYW5kIHRoZW4gcGFz
c2VzIGl0IG9mZiB0byBvbmUgb2YgdGhlIGFwcHJvcHJpYXRlIHJvdXRpbmVzLgo+ID4gICAqLwo+
ID4gLWFzbWxpbmthZ2Ugdm9pZCBkb19wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+
ID4gK2FzbWxpbmthZ2Ugdm9pZCBub2luc3RyIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpCj4KPiAuLi4gd2h5IGRvIHlvdSBuZWVkIHRoYXQgZm9yIGRvX3BhZ2VfZmF1bHQ/IFRo
YXQgZG9lc24ndCAoY3VycmVudGx5KSBkbyBhbnkKPiBlbnRyeS9leGl0IGxvZ2ljLCBzbyB0aGlz
IHNlZW1zIHVubmVjZXNzYXJ5IHBlciB0aGUgY29tbWl0IGRlc2NyaXB0aW9uLgpZZXMsIHRoZSBh
Ym92ZSBpcyB1bm5lY2Vzc2FyeTsgSSd2ZSBmaXhlZCBpdCBpbiB2MTMuCgo+Cj4gVGhhbmtzLAo+
IE1hcmsuCj4KPiA+ICB7Cj4gPiAgICAgICBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzazsKPiA+ICAg
ICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwo+ID4gLS0KPiA+IDIuMzYuMQo+ID4KCgoK
LS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
