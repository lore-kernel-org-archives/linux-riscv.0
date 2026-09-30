Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396D0CA5FC5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYV4j7MZiWFZ4lX07dW9GXFm/zfiMsOOjnKL+DBS4tg=; b=HE6dv83x1qI/vo
	Ix0yHHWwprFWE9k5zKJXL2gTtBqztpKi5j5RYoVSBy9hGi6Hp7FSeRdMS+cLCV3+JfdtrOoCu11Tf
	24z6H2nVZG/t+raPbusO4EseFxttCpotBogaZy3bR/vA2xs9ncejvacyYz+q1Z0fFAB2ZiMkahi+w
	OcIa4uqYHT0CizDYDxZZhPuaD3EbNeitdSdsRQOipSM7Yq31fVyCdciOMpTUNNwzFmj49BaiKudYF
	LtVNWP+lVyrp1w3mwG6+sLFqLFexawKqhusU3+hNFVLvNBuCKxvptlTIFc5hL5oc4uyIs0j+IfL8J
	5ErA88hK+xIJF5Qe3PGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBw3J-00000006SxJ-2VNy;
	Wed, 30 Sep 2026 15:17:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBw3E-00000006SvC-3sKf
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 15:16:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 61F4B602A8
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 15:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7991F0089B
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 15:16:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=VSBgtaZx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1790781410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YhJg/Vg0kUrlQnIKq6WPQNTQH9OtFetyfT9AbDxDuA=;
	b=VSBgtaZxqHMvQemMbERwIMImoQiw+XGTniMSpEIp9jyzZ+lyen28t9n9o12RZkfR3ygEa4
	i35AlgCrztdC9d1cufC4PJ3mOauRZXKMBWyJqbB231YE5pdI/KcZSV1C2JaPaidCSZ/TNU
	EQ31GTC+EVsK8enmLh5CSvFTSpDbBug=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 0acd25bc (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-riscv@lists.infradead.org>;
	Wed, 30 Sep 2026 15:16:50 +0000 (UTC)
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e27d11f43so35405866b.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 08:16:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw9Uq+sEhwlgoCI7rPvUaV82skFuBiBophUGiYuO5vY3wmxXmj240tPsxmvMl3IvmhesfRSy1Af3anbyA==@lists.infradead.org
X-Gm-Message-State: AFuF++m5B/a8wAcd0WtmSMqAiQKyV1WZID32cOjH5GaQhqXXKNtgbFWK
	nw0DSS63fYqnuqHrgXMSD+ugXe/BTWkz92Lxr4qTYckLCOqRke7F2N/ylmt3PmijqFtbDy8SMeY
	Ak1tvQUDf/urHP3hT94zsTyllXjhc534=
X-Received: by 2002:a17:907:6095:b0:c29:c575:de84 with SMTP id
 a640c23a62f3a-c2e240ee3f5mr135965366b.8.1790781405942; Wed, 30 Sep 2026
 08:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
 <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
 <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
 <areYMjNcaqe86ds4@zx2c4.com> <9d1c338b-368f-4ea2-a12e-c28d49adff5e@kernel.org>
 <are6s5e6On3hpD3M@zx2c4.com> <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
 <20260930133813.GA3142230@ax162> <ar0a4b9CjL2YHCkY@zx2c4.com>
 <ar0gTS71qxnx9AkW@zx2c4.com> <20260930151337.GD3142230@ax162>
In-Reply-To: <20260930151337.GD3142230@ax162>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 30 Sep 2026 17:16:34 +0200
X-Gmail-Original-Message-ID: <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
X-Gm-Features: AclHuK-3j-Oh9f_5JCjhD5NbddIhsNHXCyGk_sGVp-iO-7Ny0UWZ0eR4ti5Aiu0
Message-ID: <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev
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

T24gV2VkLCBTZXAgMzAsIDIwMjYgYXQgNToxM+KAr1BNIE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRo
YW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAzMCwgMjAyNiBhdCAwNDo0NDoy
OVBNICswMjAwLCBKYXNvbiBBLiBEb25lbmZlbGQgd3JvdGU6Cj4gPiBOYXRoYW4sIHdvdWxkIHRo
aXMgYmUgb2theSB3aXRoIHlvdT8KPiA+IGh0dHBzOi8vZ2l0Lnp4MmM0LmNvbS9saW51eC1ybmcv
Y29tbWl0Lz9pZD1kMjE2NzAxNzI0YjdkODIwOWZmNDIxNTA2NThhZDVjNzEyYmRiNTAzCj4KPiBD
YW4geW91IHN0aWNrCj4KPiAgIENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgdjYuMTIrCj4g
ICBDbG9zZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVz
LzIxODMKPgo+IG9uIHRoYXQ/IE90aGVyd2lzZSwgbG9va3MgZ29vZCB0byBtZSwgdGhhdCdzIGJh
c2ljYWxseSB3aGF0IEkgaGFkIGZvciBteQo+IHYzIGxvY2FsbHkuCgpTdXJlLCBkb25lLiBBbHNv
IHJlbW92ZWQgdGhlIG5vdy11bnVzZWQgYXJyYXlfc2l6ZS5oIGluY2x1ZGUuCgpKYXNvbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
