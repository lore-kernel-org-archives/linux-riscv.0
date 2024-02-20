Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CECEC48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 22:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/QJ0sAMvdYgPa/8MwAMUOo1pgEufKMCxEdgSZaCc/M=; b=EB8YH9k2Z6Z5xp
	adL1YXU2LBPHgRzPJ+D1zdJwBlCJ/8HTfvl9CiDk8bOly2Go5DmyCIkKgIXdv+BrE/MuD/zHQspqv
	c/naVE4fYpvhdO7e8Nn5nhZGljbesNgm2AD8+JzA6SBLO9vsyZDYVg5UuuHXgNl80Cs+qZZBAMNG7
	ZkFXgBOQRQ/Gu/z27gFhEmhxSPvq/5EhBYWXhp3a0bxNTz6O4dhnZGxswcgY+W48qIjCK0zvTgVK4
	CFevLtdbl9IwZ7gLCwLTRYNejIhfmk/LnGqUCreBCgZQ8gdEw2/8DG3eFO4mxp2SkM3U8WqVvV3/5
	wE2Gz9YHXa4lt1RImRpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcYLY-0000000GKCe-3q0t;
	Tue, 20 Feb 2024 22:12:16 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcYLV-0000000GKBx-1hmF
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 22:12:14 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-512b84bdaf1so3221617e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 14:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708467130; x=1709071930; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRo/+/dQVV/a/ImMPl3aMRQaGyZPvODzniivdVj3xis=;
        b=j/rPD4YxQ1+hMa9Aylqd2J9zoAZ6X8D7BU6CQjIIuuz9CseHQnpq2JMqYS+V+F2dXn
         2/X6Di9716lFzuFIleaIvDKdrs+Xx+/NY8RP8FP0PKdG2mNeMvasxPk1Um3edHzMM1j/
         4d/bQBIwDAJysJxO5s2gdHGHlgJI0HJBITH4R1hR62X/PzEczKY6rLE7aFkmn30FnU8m
         DsDXbe7hz4RydgMjWXtdtn9rosmS9wauUF5rFIcJ8irw8IznZe6bK1jQVizWmJe4mr/q
         seqhVSU0KVD5MBSmgZ49enfrd+ixwMeZAOAhvdVRo6Pmo3Ql9tXLP7vafV9z8qE74Ev3
         pyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708467130; x=1709071930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LRo/+/dQVV/a/ImMPl3aMRQaGyZPvODzniivdVj3xis=;
        b=qY0yWSNx68Yrhi2Ukpv9ffhSFaQ+lndzUoEDJWg8XZbIMmgq7uABuwCWL+RYkJ4D3q
         qCvHBWhS+T8e7rpzLYf4Y6CxFefxKjmGB0zJdrLwctfyu8G1SrYKfYuXWFqakr/8Yo4T
         rPXUv9SmkxSJrhesXkZSlIC6kkuPG9I+XBEyVRlVGRaFMj+BAyscJ4VF61nzv9l/Wuyk
         GCG7motXozgQB5LpUNSlLlIMKggWzUFHWcGmNIImhbMvrjGN6qOMVjcTNhppYEr1dC31
         u1Qd3YDieacAZTSb3unBgDwjFdKUK1irq3AluYYzURxT33u4BBPgZEe8KE4xhdE2mfiN
         NuSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIK8eSyCRkmM4prHiRCg8tacAgFSMWIAQO+ad2REAkyzjPe5MwhaAvMhClNT6TZU2Ug2YiTnzMzaHuXiPqYoAtF5b5zM/fel6Xz93ln1jN
X-Gm-Message-State: AOJu0Yyxkx5HaAuhxKMrySbKkQvgN8nKSAY9ODhg+WTpO+HkmmCv+bLm
	gjK+CEn1GaebaUt/jVWC/3n1UXDaDU14pZolBGCADJ1PoXWMrCVz7KPBNE9M0njACOHu5RaVJsQ
	UhQtYyXdzpFWHX8SiLWKX+squlsIVqt0pYvubAw==
X-Google-Smtp-Source: AGHT+IF41cHVf8ZA8jWjXcqW2BbWtC3Rb1Ku6snBa4xpJmFc8WxJcGwU0ffhbradvu2yDnKUnM01mRzJI37t9np6kYY=
X-Received: by 2002:a05:6512:159c:b0:512:ca2f:4b2 with SMTP id
 bp28-20020a056512159c00b00512ca2f04b2mr2540948lfb.44.1708467130344; Tue, 20
 Feb 2024 14:12:10 -0800 (PST)
MIME-Version: 1.0
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
 <ZctnfZWWO3HCiXe5@andrea> <87msrwfxpa.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87msrwfxpa.fsf@all.your.base.are.belong.to.us>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 20 Feb 2024 23:11:54 +0100
Message-ID: <CAHVXubjdpFER1v54dAD-Bg=Ya4NkDxn=v+9bug0Xng2Ta=Nz8Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] riscv: Various text patching improvements
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jason Baron <jbaron@akamai.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, bpf@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_141213_470645_F8C18E2A 
X-CRM114-Status: GOOD (  17.62  )
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

T24gTW9uLCBGZWIgMTksIDIwMjQgYXQgMToyNeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW5kcmVhIFBhcnJpIDxwYXJyaS5hbmRyZWFAZ21haWwuY29t
PiB3cml0ZXM6Cj4KPiA+IEhpIFNhbXVlbCwKPiA+Cj4gPiBPbiBTdW4sIEZlYiAxMSwgMjAyNCBh
dCAwNjo1NToxMVBNIC0wODAwLCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPiA+PiBIZXJlIGFyZSBh
IGZldyBjaGFuZ2VzIHRvIG1pbmltaXplIGNhbGxzIHRvIHN0b3BfbWFjaGluZSgpIGFuZAo+ID4+
IGZsdXNoX2ljYWNoZV8qKCkgaW4gdGhlIHZhcmlvdXMgdGV4dCBwYXRjaGluZyBmdW5jdGlvbnMs
IGFzIHdlbGwgYXMKPiA+PiB0byBzaW1wbGlmeSB0aGUgY29kZS4KPiA+Pgo+ID4+Cj4gPj4gU2Ft
dWVsIEhvbGxhbmQgKDcpOgo+ID4+ICAgcmlzY3Y6IGp1bXBfbGFiZWw6IEJhdGNoIGljYWNoZSBt
YWludGVuYW5jZQo+ID4+ICAgcmlzY3Y6IGp1bXBfbGFiZWw6IFNpbXBsaWZ5IGFzc2VtYmx5IHN5
bnRheAo+ID4+ICAgcmlzY3Y6IGtwcm9iZXM6IFVzZSBwYXRjaF90ZXh0X25vc3luYygpIGZvciBp
bnNuIHNsb3RzCj4gPj4gICByaXNjdjogU2ltcGxpZnkgdGV4dCBwYXRjaGluZyBsb29wcwo+ID4+
ICAgcmlzY3Y6IFBhc3MgcGF0Y2hfdGV4dCgpIHRoZSBsZW5ndGggaW4gYnl0ZXMKPiA+PiAgIHJp
c2N2OiBVc2Ugb2Zmc2V0X2luX3BhZ2UoKSBpbiB0ZXh0IHBhdGNoaW5nIGZ1bmN0aW9ucwo+ID4+
ICAgcmlzY3Y6IFJlbW92ZSBleHRyYSB2YXJpYWJsZSBpbiBwYXRjaF90ZXh0X25vc3luYygpCj4g
Pgo+ID4gVGhpcyBkb2VzIGxvb2sgbGlrZSBhIG5pY2UgY2xlYW4tdXAuICBKdXN0IGN1cmlvdXMg
KGEgInRlYWNoIG1lIi1saWtlIHF1ZXN0aW9uKSwKPiA+IGhvdyBkaWQgeW91IHRlc3QgdGhlc2Ug
Y2hhbmdlcz8ga3NlbGZ0ZXN0cywgbWljcm8tYmVuY2htYXJrcywgb3RoZXI/Cj4gPgo+ID4gQlRX
LCBJIHJlY2FsbCBhIHBhcmFsbGVsIHdvcmsgZnJvbSBBbGV4IGFuZCBCam9ybiBbMV0gdGhhdCBt
aWdodCBoYXZlIHNvbWUgbWlub3IKPiA+IGNvbmZsaWN0IHdpdGggdGhlc2UgY2hhbmdlczsgKyBi
b3RoIG9mIHRoZW0gdG8gQ2M6IGZvciBmdXJ0aGVyIHN5bmMuCj4KPiBJbmRlZWQhIEkgdGhpbmsg
QWxleCBpcyBzdGlsbCB3b3JraW5nIG9uIHRoZSB2Mi4KCkFjdHVhbGx5IEkgd2FzIGJsb2NrZWQg
YnkgQW5kcmVhJ3MgY29tbWVudCBhYm91dCBwYXRjaF9tYXAoKSwgYnV0IGl0J3MKbm90IHJlbGF0
ZWQgc28gSSBjYW4gc3BpbiBhbm90aGVyIHZlcnNpb24gc29vbi4gSSdkIHNheSBtaW5lIHNob3Vs
ZApsYW5kIGZpcnN0IGJlY2F1c2UgQUlBIHN1cHBvcnQgbWF5IGdldCBpbnRvIDYuOSAoPykgYW5k
IHRoZW4gdGhpcwpwYXRjaCB3b3VsZCBiZSBuZWVkZWQuIEluIGNhc2UgeW91IHJlLXNwaW4gYW5v
dGhlciB2ZXJzaW9uLCBjYW4geW91CnJlYmFzZSBvbiB0b3Agb2YgaXQ/IFVubGVzcyB5b3UgaGF2
ZSBhbm90aGVyIHNvbHV0aW9uIG9mIGNvdXJzZS4KClRoYW5rcywKCkFsZXgKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
