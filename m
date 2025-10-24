Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60270CCF9E0
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 15:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ZcagBA/gYDgqP4CcfbZTGhSAC0yygVkejMDrFcgkM4=; b=XDIcHST0t5oAKr
	QUTdED/rUX0cUPGlAgqb/zno+6e2okjZrdYMPNDrtxxk+xRHy2PO9J0sMsBCKkklDWKCUG7urMDZx
	GR0p27C/QCoF+FtAZ0fddj9OKz+xeHouuyvGrzXOj7+PMHZdWK2VZkPzyJwSbHdze/bypB7nZb7vv
	NdTF2V7TkyrcUDjvjLOnMMVSHnTAqM3K81o4FHRwCnlrU4nM8QphHsxsQ5Hfc3o+8xWHuOq2C9gIT
	h5SO06bDkJZeDJ6YxFLsgD9Nw6gFsDI/75ghWEpjwQvoBOHyslGmEGQpA+6auwlCIE+JsFp4FiReZ
	gKFhQW7pupn8e/nKF2Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCK0M-00000009qUZ-2S97;
	Fri, 24 Oct 2025 15:47:02 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCK0J-00000009qT4-3Jko
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 15:47:01 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-592f7e50da2so2365255e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 08:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761320818; x=1761925618; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qn/+5LSgb4Ivu5qW8rNSwz2BTYP5iSWYVocmoADghq0=;
        b=ZhVFIkG1TwxadO58mc3s8neQEiCMa8K5xZP8AA8nCbwdtJt3f/aKU6HiyVi3uyMqw+
         8zD4ePTXvKwNRfc6omlf8qR/mLDJLLWMsjDUirGOZgC5FdeU4DwqJErf6Rb1w+9749+8
         vDxpAdE6Xd4MKZ0eTKuEQJBMgtYLKJJqRVq7tN7SxCJ2A2dycWe1aKs/Csb4t7l3ZQLV
         nfJcADEn6lesQf12VTXUXnwLsNLyizUzBOhRXSOIZrP5GXxe4TJDmD+xaPNORkHilLWi
         FMLj98+kdIXoQgNKmwTPwdCQ9hZCNSE24WmNp1WcslrG79dCnI9r6SCDQbrdd9FYiyn2
         RKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761320818; x=1761925618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qn/+5LSgb4Ivu5qW8rNSwz2BTYP5iSWYVocmoADghq0=;
        b=jE67EdmftviVZ9lWHP3IQJ4fzwm4PCUeCt/pKUPC0aRY/f9O9NvgCpkDKoiKsC3jxt
         aFHSI7aiGVGB7vE3YXBy6QmZhnb4dAoA54odjdJ8l4YJBVAhoMpuAHZewDjvKk+Zby2S
         hJV+mYYEcm7FFCmM8Lwe/3fpfB7sceQCSaAJF1ehSW8JyvhFryCb0J16ybp/Yfk3o8BC
         QHLNpeqXB/oN+0mjP1+3uSWKHQqd6uNYk2bqln713kesxM6pb6ZsBPSmUE8W529RwkJS
         itIKirO2W6CbpDRhz+4X2iCCY0w/GN4pbRfAAfMBibM8Z/2/NY76yijR2W8ewOZx73fY
         W2FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAHKPDyhu1a9UoAeN9V6h8tvuxAVIFaeWLIg63FDepmrm5tmfzB9iPiue1ktxE/INTyAsHiGIupoqHeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeVbmqJWWfcSPXLRyLWbk149KuF3TRuzj3vwK1IsNM+cT3K57I
	gL3nbx+TJkKOo5m3mnG6ELZ8i13Y0WNuOb71V/zo/tGJsdC2jySDhbRGKXiurGf9dPZ+0rKhiLL
	gjjUgdzxZqbD9IA8yiAypynKLLRklg1edMo4e/Whn+g==
X-Gm-Gg: ASbGncv4k3OghnMOJP3iocotWmeBYRu/kox6q1p9RlNVedOQn/jKWo+dYry7vqbrF+U
	Vnh9RNQ7jKwig1oMIgx3sXejYHYfS4eWzPGJz4xM+900ycrsLNTBhXLSKRvV43mx8rhg3yvhLT3
	twdv2Iet06qxVmHCZZfmbhvC4puW4MbFGloTJNqfnmCOn8zEehcOuvOYR+2TpVGgNBP7pLZP1Ox
	eXYcfAwS/dGP/Hey/FST3q8DX8GC6KP82AFen6iBcGtNrJGU2DqFgEsiw0N+w==
X-Google-Smtp-Source: AGHT+IHdluFO85waETK/KLkbS3VYmEGHof52U3/ULO+x99Eru8BPoeAX0r1u9msXeZkbSU5Z2jh0fCXXs/3AzKJBMNI=
X-Received: by 2002:a05:6512:3b8e:b0:592:ed6f:9a59 with SMTP id
 2adb3069b0e04-592fc0fa4camr1180695e87.2.1761320817702; Fri, 24 Oct 2025
 08:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0h=PuKTG=aWou_8y8qb7kSHS46TLXoXrjrTXN1xv-uQg@mail.gmail.com>
In-Reply-To: <CAAhSdy0h=PuKTG=aWou_8y8qb7kSHS46TLXoXrjrTXN1xv-uQg@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 24 Oct 2025 21:16:45 +0530
X-Gm-Features: AS18NWAZshTymUeon3-SNkimUIgzYNwnvkiP5JITg3o0ZerB1osHRyFXcW_yBwI
Message-ID: <CAK9=C2VXQRGFChGB2xzkRCzf_GbH2VexjAjO2d83e_tSwhddcw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.18 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_084659_855654_766C1933 
X-CRM114-Status: GOOD (  15.39  )
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

SGkgUGFvbG8sCgpPbiBGcmksIE9jdCAyNCwgMjAyNSBhdCA0OjM54oCvUE0gQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4KPiBIaSBQYW9sbywKPgo+IFdlIGhhdmUgdGhy
ZWUgZml4ZXMgZm9yIHRoZSA2LjE4IGtlcm5lbC4gVHdvIG9mIHRoZXNlCj4gYXJlIHJlbGF0ZWQg
dG8gY2hlY2tpbmcgcGVuZGluZyBpbnRlcnJ1cHRzIHdoZXJlYXMKPiB0aGUgdGhpcmQgb25lIHJl
bW92ZXMgYXV0b21hdGljIEkvTyBtYXBwaW5nIGZyb20KPiBrdm1fYXJjaF9wcmVwYXJlX21lbW9y
eV9yZWdpb24oKS4KPgo+IFBsZWFzZSBwdWxsLgoKUGxlYXNlIGRpc3JlZ2FyZCB0aGlzIFBSLiBJ
IHdpbGwgc2VuZCB2MiBQUiB3aXRoIGEgYnVpbGQgd2FybmluZyBmaXguCgpBcG9sb2dpZXMgZm9y
IHRoZSBub2lzZS4KClJlZ2FyZHMsCkFudXAKCj4KPiBSZWdhcmRzLAo+IEFudXAKPgo+IFRoZSBm
b2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgM2E4NjYwODc4ODM5ZmFhZGI0ZjFhNmRkNzJj
MzE3OWMxZGY1Njc4NzoKPgo+ICAgTGludXggNi4xOC1yYzEgKDIwMjUtMTAtMTIgMTM6NDI6MzYg
LTA3MDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAg
aHR0cHM6Ly9naXRodWIuY29tL2t2bS1yaXNjdi9saW51eC5naXQgdGFncy9rdm0tcmlzY3YtZml4
ZXMtNi4xOC0xCj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYmUwMWQ0ZDVjMzAx
MTRlOWRmMzdmY2E5ZWZiYjJjNWNiMGFkMzZmNjoKPgo+ICAgUklTQy1WOiBLVk06IFJlbW92ZSBh
dXRvbWF0aWMgSS9PIG1hcHBpbmcgZm9yIFZNX1BGTk1BUCAoMjAyNS0xMC0yNAo+IDExOjAwOjQ4
ICswNTMwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+IEtWTS9yaXNjdiBmaXhlcyBmb3IgNi4xOCwgdGFrZSAjMQo+
Cj4gLSBGaXggY2hlY2sgZm9yIGxvY2FsIGludGVycnVwdHMgb24gcmlzY3YzMgo+IC0gUmVhZCBI
R0VJUCBDU1Igb24gdGhlIGNvcnJlY3QgY3B1IHdoZW4gY2hlY2tpbmcgZm9yIElNU0lDIGludGVy
cnVwdHMKPiAtIFJlbW92ZSBhdXRvbWF0aWMgSS9PIG1hcHBpbmcgZnJvbSBrdm1fYXJjaF9wcmVw
YXJlX21lbW9yeV9yZWdpb24oKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEZhbmd5dSBZdSAoMik6Cj4gICAgICAg
UklTQy1WOiBLVk06IFJlYWQgSEdFSVAgQ1NSIG9uIHRoZSBjb3JyZWN0IGNwdQo+ICAgICAgIFJJ
U0MtVjogS1ZNOiBSZW1vdmUgYXV0b21hdGljIEkvTyBtYXBwaW5nIGZvciBWTV9QRk5NQVAKPgo+
IFNhbXVlbCBIb2xsYW5kICgxKToKPiAgICAgICBSSVNDLVY6IEtWTTogRml4IGNoZWNrIGZvciBs
b2NhbCBpbnRlcnJ1cHRzIG9uIHJpc2N2MzIKPgo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMu
YyB8IDE2ICsrKysrKysrKysrKysrLS0KPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgICAgICAgfCAy
MCArLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICB8ICAy
ICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0p
Cj4KPiAtLQo+IGt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKPiBrdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
