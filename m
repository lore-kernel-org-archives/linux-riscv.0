Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8520C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 13:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcpOqagxc4YTVQh//48rC4Ezuk0abLpkMt3SxOIfgUg=; b=4KUu4Jwr2b5opa
	TNSzGoUAh2L/IYSCIBCD/Lo3f8RN7IrMsTPhwa8Q2fn9F9XMDAzNVnz2lipyMYde+D6VOTqNBqOZY
	rcAre0hBBU8iBa7KcNmgS/yS9VsXQjshA1e0n8lpJPazzluKkkxxZTzFdpvFXyFj3veU8OqXw+Jil
	bJcpkmgxqCDhdQPCS9B4wGDG2T/VbGv4ydCWfDm0iFrgfis3LhUhV4yavnD43XepupacbiMopTPBo
	RL1tB3agNamnbX4zqENBOj24AG4OxgT7bCNTx2DBGBU++P4K3PlUlgzcZbzbnGbykXGUFgt9aCvo0
	tLqTCOkKFslzI1OGpmhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAUo0-00000008xIT-2UqU;
	Fri, 24 May 2024 13:17:56 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAUnx-00000008xHI-3gzw;
	Fri, 24 May 2024 13:17:55 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6f8edddf756so735572b3a.3;
        Fri, 24 May 2024 06:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716556671; x=1717161471; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlXCQc3o/MB52ttkYbUWNblq+v3TZ5Rf15VGTVZLLpk=;
        b=AxglQWnTI5B3DpZCiCatqek6exAavOEr7gPOurhiUY8iw5WJmAKPKmXc1PTYXfPLhM
         Cpi8R31J1dZFdRe6xsOlbMmOJKZQBdmYrLg3Cg6B22Zphji9Iin6bMhpb2LWsOuWAvGm
         2UzKjrftHF2eLmL5G4h3UovdgiN55uMblHsaouXqdipbOpDTaTTzq3vsA6++DGtciOR5
         Ll9a7DeHePhBakbBmePmoBY2DFPucjn0EqVWnnwwRVytfagl2OaaY4PHO2hE3fJwKaTZ
         xc8h9QegGMbCB1zDde9crHIPec7b2nTlf4kNpPFM/IIgfGzVEbUMOaEmxucWHafKdMCZ
         UiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716556671; x=1717161471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlXCQc3o/MB52ttkYbUWNblq+v3TZ5Rf15VGTVZLLpk=;
        b=s/ycax8yENhIRjgEqBiCfCzm1OIeXH+t9g3uYM1sqNcyVmox4z+hxYTg47JTq3yR8o
         Hvyv+xfCwDJCPDDSffZuddJuIJojGb9QegXw/mKAp3R49XLGJBD9BWx+BhIA0mqMGfu0
         2j2c4ySybFYNCJHO7D/3XPnMrOfVfaipTSjy+Hqma0pkM4hug315Ra783boopFtTBjGU
         /q0otAml4KqGbSAFNBHq/jw3SP8v6LXUmNjHnprJYVcfgDXCxGvqnNDNwdg+ZL9Vs+ee
         HbMT3dnQ/uOGSBVm5q1mopAS/4ydCFdpd62LoGJ/s+G/KDSxEGfptXFVY1nimL3i9OjH
         FZBw==
X-Forwarded-Encrypted: i=1; AJvYcCUa340ZrOgI0wQlyR+YD2cIKM5XwGvAI8TrqzzFcYQZEoxcKfn6RbXcRTqBjp1FEAt4TsZ2+2KF2WRFmSdqQFw2SVDnu5p9REWGmbjkDBZ9N3DqMgjmnG4/SpacrvCiGa/2dqSQEpcfBBOaKcgCT1fDnuEups4=
X-Gm-Message-State: AOJu0YzNBBLQkHUFO7Wq0kKP0aV+PDWgVS7gKOF6ta1w3WsndQaElf8S
	uFxNtVgxQiBHGp4AlY0A9d9W1fMkA0wkvsSED/jbrK6FbCWEvMmIqEMWatgevcyP0ZnMHUyQl97
	kC6/frc16VoMI2VIFBas1gkFvawU=
X-Google-Smtp-Source: AGHT+IEwoe8jd0oZgn4cZUVcBCDA8tK4CYreDWY9kJHQp57IWOrilIahqDCBhTgwJSyB8G7rI/D9MAOMBfFiB7nWxpM=
X-Received: by 2002:a17:90b:1888:b0:2ac:5d2d:12ac with SMTP id
 98e67ed59e1d1-2bf5e84abfdmr2678646a91.5.1716556671509; Fri, 24 May 2024
 06:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com> <eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net>
In-Reply-To: <eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 May 2024 09:17:40 -0400
Message-ID: <CADnq5_NmKyTBbE6=V+XdEKStnjcyYSHyHqdkgBen4UhPnVKimQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Guenter Roeck <linux@roeck-us.net>
Cc: Samuel Holland <samuel.holland@sifive.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, amd-gfx@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_061753_943429_D0B79094 
X-CRM114-Status: GOOD (  17.45  )
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

T24gRnJpLCBNYXkgMjQsIDIwMjQgYXQgNToxNuKAr0FNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJv
ZWNrLXVzLm5ldD4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIEZyaSwgTWFyIDI5LCAyMDI0IGF0IDEy
OjE4OjI4QU0gLTA3MDAsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+ID4gTm93IHRoYXQgYWxsIHBy
ZXZpb3VzbHktc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMgc2VsZWN0Cj4gPiBBUkNIX0hBU19LRVJO
RUxfRlBVX1NVUFBPUlQsIHRoaXMgY29kZSBjYW4gZGVwZW5kIG9uIHRoYXQgc3ltYm9sIGluc3Rl
YWQKPiA+IG9mIHRoZSBleGlzdGluZyBsaXN0IG9mIGFyY2hpdGVjdHVyZXMuIEl0IGNhbiBhbHNv
IHRha2UgYWR2YW50YWdlIG9mIHRoZQo+ID4gY29tbW9uIGtlcm5lbC1tb2RlIEZQVSBBUEkgYW5k
IG1ldGhvZCBvZiBhZGp1c3RpbmcgQ0ZMQUdTLgo+ID4KPiA+IEFja2VkLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQ2hyaXN0b3Bo
IEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8
c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPgo+IFdpdGggdGhpcyBwYXRjaCBpbiB0aGUgbWFp
bmxpbmUga2VybmVsLCBJIGdldCB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yCj4gd2hlbiB0cnlp
bmcgdG8gYnVpbGQgcG93ZXJwYzpwcGMzMl9hbGxtb2Rjb25maWcuCj4KPiBwb3dlcnBjNjQtbGlu
dXgtbGQ6IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZG1sL2Rpc3Bs
YXlfbW9kZV9saWIubyB1c2VzIGhhcmQgZmxvYXQsIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLm8gdXNlcyBzb2Z0IGZsb2F0
Cj4gcG93ZXJwYzY0LWxpbnV4LWxkOiBmYWlsZWQgdG8gbWVyZ2UgdGFyZ2V0IHNwZWNpZmljIGRh
dGEgb2YgZmlsZSBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RtbC9k
aXNwbGF5X21vZGVfbGliLm8KPgo+IFsgcmVwZWF0ZWQgbWFueSB0aW1lcyBdCj4KPiBUaGUgcHJv
YmxlbSBpcyBubyBsb25nZXIgc2VlbiBhZnRlciByZXZlcnRpbmcgdGhpcyBwYXRjaC4KClNob3Vs
ZCBiZSBmaXhlZCB3aXRoIHRoaXMgcGF0Y2g6Cmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9hZ2Q1Zi9saW51eC8tL2NvbW1pdC81ZjU2YmUzM2YzM2RkMWQ1MGI5NDMzZjg0MmM4NzlhMjBk
YzAwZjViCldpbGwgcHVsbCBpdCBpbnRvIG15IC1maXhlcyBicmFuY2guCgpBbGV4Cgo+Cj4gR3Vl
bnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
