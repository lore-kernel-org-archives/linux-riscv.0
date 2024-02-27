Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FE8C48BF6
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 01:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQecytiYFb6B8qYQJhGiNKBc0UDA5LTccSLewAccMb0=; b=lwAhwfICCOT7YY
	LSgDaB1nGmFZvnQH605R0hwxp4+akRycUx90b32t9R4UXmrzFYqdI0BRYSpHzfdle3oK14fTVm71G
	iAaQjZCQsI4tbybrjs0V/T+/79lMTzpl75Ld8PzhfUjR5UkjABBUKDEzC7Lu6wYA4kb7UiJzBlWkt
	2aKzU0b/EXCZJFV3kw0LY7osCrg5tK9inV+a2KaCfwIjMRs4jcn5fRggK2Ij/gaRrhrPDd3nMcJto
	dnVK6dhs3n6dz1HBocdDM705j2ypvMypNnYR9yZETFjb3XhQhY0TWR1dZVZg92nggl7MBRztuf61q
	eMTNLp5r1Kfp+7xYddYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rem4m-00000003FB7-2Peh;
	Tue, 27 Feb 2024 01:16:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rem4j-00000003FAP-1QkH
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 01:16:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B0E46126D
	for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 01:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1C6C433F1
	for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 01:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708996564;
	bh=kBGrvbSRlRLnVicTFJpreNPon70Basc5aHlUoOOm/Ns=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K2A2XetG+eBGqGxXm7AAVV5Gh/V7TCGONV/LN1UNcPA1DV1TTN01yiNYFNema3KSh
	 Aa0f/aYOEAhN2v/xCRCLFA6tfFTTh3+mht8nWHE0gzozma/gyIS7jjlXcPWntJzDTB
	 Cm7efls2jyzP/7kXrO2ErD4Inya1AG6G8qZTCr0IcvuwIUS+HQLSVJa9k9hIqiEn9R
	 Uy4/q4MrByBKTY0V/u5gKtKNnMfyCrqxsH3MAQLxHZ88T9sBjC0GByXVjULa/2JlLc
	 gcfgdDzw4fMeDnMCKDRY1MP3cPWYgZtkArQxnJgBCm2K5FCeTMn2LyJ87tQaUJzYIX
	 O4Vv+IBP7I7Zw==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5654f700705so4896890a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Feb 2024 17:16:04 -0800 (PST)
X-Gm-Message-State: AOJu0Ywx1ZzLMjf6phNfKWX6Yp6gND3QSmRvRCr0dnXSHq46ErcZjzL5
	f93d6aLithSwB80wZovWcBULz7FWcXhj9lwZPlVVi2j5TP4Xl4TEZP2in2Neu50Jjaa/Bsiu7W4
	xZrJDeZMnXnr6akDM/YFCokj7n6w=
X-Google-Smtp-Source: AGHT+IGpOays5UZ8vBtnwcbyePxBQOQ0iVEMo8+JLIlwy5JlqlTTfpH9lPMbEJnRP1d93zV0NRH743gJXC+xt3vconA=
X-Received: by 2002:a05:6402:3587:b0:565:a5aa:22e4 with SMTP id
 y7-20020a056402358700b00565a5aa22e4mr5591891edc.33.1708996562715; Mon, 26 Feb
 2024 17:16:02 -0800 (PST)
MIME-Version: 1.0
References: <738d3b74-1e10-4eb5-8c0d-1db33feb740a@intel.com>
In-Reply-To: <738d3b74-1e10-4eb5-8c0d-1db33feb740a@intel.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 27 Feb 2024 09:15:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQcdg7LErGec_Omh5V7ewZ9zFnmH_Mt_aLjU+QQw5-4KQ@mail.gmail.com>
Message-ID: <CAJF2gTQcdg7LErGec_Omh5V7ewZ9zFnmH_Mt_aLjU+QQw5-4KQ@mail.gmail.com>
Subject: Re: riscv syscall performance regression
To: "Wu, Fei" <fei2.wu@intel.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_171605_453743_EC0023C5 
X-CRM114-Status: GOOD (  17.23  )
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

T24gRnJpLCBGZWIgMjMsIDIwMjQgYXQgMToyOeKAr1BNIFd1LCBGZWkgPGZlaTIud3VAaW50ZWwu
Y29tPiB3cm90ZToKPgo+IEhpIEFsbCwKPgo+IEkgYW0gZG9pbmcgc29tZSBwZXJmb3JtYW5jZSBy
ZWdyZXNzaW9uIHRlc3Rpbmcgb24gYSBzb3BoZ28gbWFjaGluZSwgdGhlCj4gdW5peGJlbmNoIHN5
c2NhbGwgYmVuY2htYXJrIGRyb3BzIDE0JSBmcm9tIDYuMSB0byA2LjYuIFRoaXMgY2hhbmdlCj4g
c2hvdWxkIGJlIGR1ZSB0byBjb21taXQgZjBiZGRmNTAgcmlzY3Y6IGVudHJ5OiBDb252ZXJ0IHRv
IGdlbmVyaWMgZW50cnkuCj4gSSBrbm93IGl0J3MgYSB0cmFkZW9mZiwganVzdCBjaGVja2luZyBp
ZiBpdCdzIGJlZW4gZGlzY3Vzc2VkIGFscmVhZHkgYW5kCj4gYW55IGltcHJvdmVtZW50IGNhbiBi
ZSBkb25lLgo+Cj4gVGhlIHVuaXhiZW5jaCBiZW5jaG1hcmsgSSB1c2VkIGlzOgo+ICAgICAgICAg
JCAuL3N5c2NhbGwgMTAgZ2V0cGlkCj4KPiBUaGUgZHluYW1pYyBpbnN0cnVjdGlvbiBjb3VudCBw
ZXIgc3lzY2FsbCBpcyBpbmNyZWFzZWQgZnJvbSB+MjAwIHRvCj4gfjI1MCwgdGhpcyBzaG91bGQg
YmUgdGhlIGtleSBmYWN0b3Igc28gSSBzd2l0Y2ggdG8gdGVzdCBpdCBvbiBzeXN0ZW0KPiBRRU1V
IHRvIGF2b2lkIHBvcnRpbmcgZGlmZmVyZW50IHZlcnNpb25zIG9uIHNvcGhnbywgYW5kIHVzZSBw
bHVnaW4KPiBsaWJpbnNuLnNvIHRvIGNvdW50IHRoZSBpbnN0cnVjdGlvbnMuIFRoZXJlIGFyZSBh
IGZldyBiYWNrZ3JvdW5kIG5vaXNlcwo+IGR1cmluZyB0ZXN0IGJ1dCB0aGUgaW1wYWN0IHNob3Vs
ZCBiZSBsaW1pdGVkLiBUaGlzIGlzIGR5bmluc3QgY291bnQgcGVyCj4gc3lzY2FsbCBJIGdvdDoK
Pgo+ICogY29tbWl0IGQwZGIwMmM2IChyaWdodCBiZWZvcmUgdGhlIGNoYW5nZSk6IH4yMDAKPiAq
IGNvbW1pdCBmMGJkZGY1MCAodGhlIGNoYW5nZSk6IH4yNTAKPiAqIGNvbW1pdCBmZmQyY2I2YiAo
bGF0ZXN0IHVwc3RyZWFtKTogfjI1MAo+Cj4gQW55IGNvbW1lbnQ/CjEuIEkgdGhpbmsgdGhpcyBp
cyBhYm91dCBnZW5lcmljIGVudHJ5IHBlcmZvcm1hbmNlLCBhbGwgYXJjaGl0ZWN0dXJlcwpzaG91
bGQgbW92ZSB0byB0aGF0IGZyYW1ld29yayBhbmQgaW1wcm92ZSB0aGUgZ2VuZXJpYyBlbnRyeQpw
ZXJmb3JtYW5jZSB0b2dldGhlci4KCjIuIEFub3RoZXIgcG9pbnQgaXMgdGhlcmUgYXJlIGFkZGVk
IHNjaGVkIGZ1bmN0aW9ucyBpbiB0aGUgZ2VuZXJpYwplbnRyeSBjb2RlLCBzbyB1c2luZyBhIHNp
bXBsZSBlbXB0eSBzeXNjYWxsIGNhbid0IHNob3cgdGhlIGJlbmVmaXQgb2YKZ2VuZXJpYyBlbnRy
eS4KCjMuIENvdWxkIHdlIHVzZSB2ZHNvIHRvIGltcHJvdmUgZ2V0cGlkPwoKUFM6Ck5vdywgdGhl
IHN5c2NhbGwgYXJndW1lbnRzIGFyZSB1c2luZyBwdF9yZWdzIGluc3RlYWQgb2YKc3lzY2FsbF93
cmFwcGVyLCB3aGljaCBicm9rZSB0aGUgcnYzMiBzeXNjYWxsLCByZWY6Cmh0dHBzOi8vZ2l0aHVi
LmNvbS9ULWhlYWQtU2VtaS9saW51eC9wdWxsLzUKCj4KPiBUaGFua3MsCj4gRmVpLgoKCgotLSAK
QmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
