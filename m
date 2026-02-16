Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454CDE8383D
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Feb 2026 21:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxpGyQX0ntGGMlInviss/++BNnhgPncJgnnszTScS/8=; b=QuosNcpk7KXQGx
	9UCKU1ZpBZzSjI/ynfNrA2MRhwhSfSU+/nh7GKFwMD/cwSnrtXhQPGhctF171GZFA1wYYe0gGWKmX
	g24AnKRdQMqUTd/73hLRclBAAvXWS4oDqWLFhAe9etKcNoc2TZS0kRDsOkT+Ik8Fn0Os/zb68A89/
	ne27i5vdpc2ZI0nQaeQXceunQD7Xjc0YZJNHkCfsBM4OuUsE9uFKb9H2nRmBUBQIwzhyIMnBo0Lb9
	16W4JWkXLTleTPDXTxw4QDp3xC2f9fJISdhhPK5VJiK18yzANT3bh7FgSRwBsQT8YZYUNGbBpzfJk
	7lz4c8Vn7hi/w4MsCYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs6YN-00000007Jkg-1Mwn;
	Mon, 16 Feb 2026 21:54:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs6YL-00000007JkL-2Sx5
	for linux-riscv@lists.infradead.org;
	Mon, 16 Feb 2026 21:54:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A39B84420E
	for <linux-riscv@lists.infradead.org>; Mon, 16 Feb 2026 21:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B9FC2BCAF
	for <linux-riscv@lists.infradead.org>; Mon, 16 Feb 2026 21:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771278887;
	bh=8i3jq6mf3uEoa3Y4dygongqoqxGtRN8yCfYDFR127JQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lBitJyX8ONoa4Zb64LLohMgUd1OiLq0Md+VnWEttFAan0N3rblKC3gyofEnWyD6xA
	 /UQ0CMQvMD7r+cDsPSG67Gqxp8ZDv5OKkopz/SLsrnCgVxxnmKf8BwrU/7m/CFhUUb
	 qgmfyH81vMYfDx7NXIIuitebUykmKUHHOHYXkqB3ffHSPaDQhaWcdMEiyr2bSErQYU
	 HeR8XJtYULkjSqUkKH3axV0qO3cW44R/H6eAdLOryWlgnu4vZAq5ma/xWdsQmA09C5
	 VJWGuEyD78JPwBZ0ZhcMhL6cfYC6uDPjWsVzVkdK6bYsVwKfa2qzJaPHYmacBeO4G4
	 XRTlm1KTqcdxw==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79427f739b0so32057617b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Feb 2026 13:54:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVojUEwleWi8/eGyFxQoEoWqDnlxviOs554rshcbRJrfHJtMVx/QnRav8Xt6UmHeEB+juurhA7qXrfYrg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Wxb6n4xNQghi9RIgUdahkeWhpji0DCe/XTO06JnymclSJ7/U
	dcFxCemBDibuCfRHZT3t6fRMbz6JeyqcwSKvFsCh1Up+ndOc3cNbMyhQ84mpgFgbcL62iUoYRof
	Dz3xrTsunMWMnNDScCa4wTechO3YoBb0=
X-Received: by 2002:a05:690c:48c5:b0:794:f36a:c97 with SMTP id
 00721157ae682-797a0cf6df3mr96454847b3.55.1771278886741; Mon, 16 Feb 2026
 13:54:46 -0800 (PST)
MIME-Version: 1.0
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
 <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com>
 <2248971d-d69c-65fb-93b4-10f0d7d8bbad@kernel.org> <CAHk-=whhSLGZAx3N5jJpb4GLFDqH_QvS07D+6BnkPWmCEzTAgw@mail.gmail.com>
In-Reply-To: <CAHk-=whhSLGZAx3N5jJpb4GLFDqH_QvS07D+6BnkPWmCEzTAgw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Feb 2026 22:54:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLk4FtPz=ydpSnULCUaQCFZvu56a77w6g=sSfD1NTfAZ_g@mail.gmail.com>
X-Gm-Features: AaiRm52MF_agouti-fMfEseBjC0R4sADTku7ChCVI0xtSN7HI1UXwLEKmTQzhc8
Message-ID: <CAD++jLk4FtPz=ydpSnULCUaQCFZvu56a77w6g=sSfD1NTfAZ_g@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V updates for v7.0
To: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <pjw@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, broonie@kernel.org, debug@rivosinc.com, 
	zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_135449_649813_B15A6C0C 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

T24gU2F0LCBGZWIgMTQsIDIwMjYgYXQgNToxNOKAr0FNIExpbnVzIFRvcnZhbGRzCjx0b3J2YWxk
c0BsaW51eC1mb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cgo+IFdoZW4gaXQncyBjYWxsZWQgImluZGly
X2JyX2xwIiwgaXQncyBqdXN0IGxpbmUgbm9pc2UuIFRoZSBtb3N0Cj4gdW5kZXJzdGFuZGFibGUg
cGFydCBvZiB0aGF0IGxpbmUgbm9pc2UgaXMgImluZGlyIiwgYnV0IHRoYXQncyBhbHNvIHRoZQo+
IGxlYXN0IHJlbGV2YW50IC0gbm9vZHkgZG9lcyB0aGlzIGFsbCBmb3IgZGlyZWN0IGJyYW5jaGVz
IGFueXdheSwgc28KPiB0aGUgImluZGlyIiBwYXJ0IGlzIGFyZ3VhYmx5IHRoZSBsZWFzdCB1c2Vm
dWwgcGFydCBvZiBpdC4KPgo+IFNvIHllYWgsIHNvbWV0aGluZyBsaWtlICJicmFuY2hfbGFuZGlu
Z19wYWQiIGF0IGxlYXN0IHNvdW5kcyBsaWtlIGl0J3MKPiBtZWFudCBmb3IgaHVtYW4gY29uc3Vt
cHRpb24uCgpJIGNsZWFybHkgcmVtZW1iZXIgdGhhdCB0aGUgdGhlIGZpcnN0IHRpbWUgd2Ugd2Vy
ZSBwcmVzZW50ZWQgd2l0aCB0aGUgQlRJCmluc3RydWN0aW9uIChhdCBhIGpvaW50IExpbmFyby9V
YnVudHUgY29uZmVyZW5jZSBpbiBCdWRhcGVzdCkgQXJuZCBCZXJnbWFuCmltbWVkaWF0ZWx5IGV4
Y2xhaW1lZCwgInNvIHlvdSBpbnZlbnRlZCB0aGUgY29tZWZyb20gaW5zdHJ1Y3Rpb24hIgoKVGhl
IHRoaW5nIGlzIGEgam9rZSwgYnV0IGl0J3MgaW1wb3NzaWJsZSB0byBmb3JnZXQgdGhpcyBiZWNh
dXNlIGl0IHNvcnQgb2YKd2lyZXMgeW91IGhlYWQgdG8gdGhlIHVuZGVyc3RhbmRpbmcgb2Ygd2hh
dCB0aGlzIGVzc2VudGlhbGx5IGlzLiBUaGF0Cmpva2UgZXZlbiBoYXMgYSB3aWtpcGVkaWEgcGFn
ZS4KaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvQ09NRUZST00KCllvdXJzLApMaW51cyBX
YWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
