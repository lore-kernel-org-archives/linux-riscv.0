Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3283EC47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 09:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwM1zTL2lhHWX4UmDVPqXL/cVQNrRZGzqK/VJFLkHig=; b=vXvkdnTDyAD3j4
	FQZBLj3B8URjQUNnFpNTFJEQQxqG1+w0bPNXcTgM9ECuJjdQZMpQOow/y/OQrDU8/Gr9+ZIntd6LJ
	9B2BgLZgGvSJ62bbifZ3h+W7aBq4KQ60v0Si4LfOj4Hs6xX/kZDglSoP5mxqf60rPSq44Dtp5r9ft
	4/BjyHgjv6t5H/HSxiuPlszcV1+qCTvQjIJbTLR+Af2MbLxuzTQ9NtC0HkmZxFYqx+Ipgtp5/jM9H
	COyqu5bCvrFhYHcKfWL1HNnh4QFFEKv2CU4pGQ/4QoiAYmoee8Bae+pjSLRwI6e2jZexQPXun0G2Y
	BaSIe51TUjcyxB/EliDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLKS1-00DRTS-2c;
	Thu, 04 Jan 2024 09:55:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLKRy-00DRRp-0F;
	Thu, 04 Jan 2024 09:55:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 04FD9B81799;
	Thu,  4 Jan 2024 09:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1E1C433CD;
	Thu,  4 Jan 2024 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704362139;
	bh=NUKoeng2TtOuvmS1QuUleD7BGl+JqWw7EjY22X+zMeE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OHFkUtqftfj+SZv9SeaQruKnYEQ+cq+CUVLhdhS4ctC5mJde61oZpomnZp+ecLocl
	 edGdjmqnCNVqcSE+r/1BHCS9HtiWkfJlVSxkDAqPGjrXpj3m1RESX+i8Du30XCZhoc
	 Phx4BiVKMLfV6iWckC4A+sp0BbGfUzv2NrDh9iOsqfiDWgJJBXqcmWjicme7o2UqjD
	 OMdDO97BJHjpoD64eKNTbxVRZi2a6R+/ZwjD90Vah4KdwTLgLKFVkFiJMEVPIBQPIC
	 QoCG2KHOziSdqLfOlz01MyVVY2UGekeYO2k3gZN/0V0FQCNOuMwCjTEqTwRZOK3QMU
	 ZsLwm/ZTJ1jcQ==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5555f9061b9so443173a12.0;
        Thu, 04 Jan 2024 01:55:39 -0800 (PST)
X-Gm-Message-State: AOJu0YwP/pRmTsYYGMzYFMuHYqoD+y9q0KQnav8djwvybtU8TPZ+PfGE
	baXqPISsCqyK8iSLyS/nBjcphax3YWhp49SKGc4=
X-Google-Smtp-Source: AGHT+IEKmcnwqgygVH9sZZQyzsnOvSR/gqjMEXN+FYG4pXKZGSTboqY34lxGfMFTo2QI4qDTuxyc5MRzDYiHeKc4cMU=
X-Received: by 2002:a17:906:a94:b0:a28:9633:d599 with SMTP id
 y20-20020a1709060a9400b00a289633d599mr160134ejf.18.1704362137704; Thu, 04 Jan
 2024 01:55:37 -0800 (PST)
MIME-Version: 1.0
References: <20231228014220.3562640-1-samuel.holland@sifive.com> <20231228014220.3562640-8-samuel.holland@sifive.com>
In-Reply-To: <20231228014220.3562640-8-samuel.holland@sifive.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 4 Jan 2024 17:55:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5TJPqRcgS6jywWDSNsCvd-PsVacgxgoiF-fJ00ZnS4uA@mail.gmail.com>
Message-ID: <CAAhV-H5TJPqRcgS6jywWDSNsCvd-PsVacgxgoiF-fJ00ZnS4uA@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org, 
	WANG Xuerui <git@xen0n.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_015542_409338_99AC6EAD 
X-CRM114-Status: GOOD (  18.88  )
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

SGksIFNhbXVlbCwKCk9uIFRodSwgRGVjIDI4LCAyMDIzIGF0IDk6NDLigK9BTSBTYW11ZWwgSG9s
bGFuZAo8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBMb29uZ0FyY2ggYWxy
ZWFkeSBwcm92aWRlcyBrZXJuZWxfZnB1X2JlZ2luKCkgYW5kIGtlcm5lbF9mcHVfZW5kKCkgaW4K
PiBhc20vZnB1LmgsIHNvIGl0IG9ubHkgbmVlZHMgdG8gYWRkIGtlcm5lbF9mcHVfYXZhaWxhYmxl
KCkgYW5kIGV4cG9ydAo+IHRoZSBDRkxBR1MgYWRqdXN0bWVudHMuCj4KPiBBY2tlZC1ieTogV0FO
RyBYdWVydWkgPGdpdEB4ZW4wbi5uYW1lPgo+IFJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdp
ZyA8aGNoQGxzdC5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhv
bGxhbmRAc2lmaXZlLmNvbT4KPiAtLS0KPgo+IChubyBjaGFuZ2VzIHNpbmNlIHYxKQo+Cj4gIGFy
Y2gvbG9vbmdhcmNoL0tjb25maWcgICAgICAgICAgIHwgMSArCj4gIGFyY2gvbG9vbmdhcmNoL01h
a2VmaWxlICAgICAgICAgIHwgNSArKysrLQo+ICBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9m
cHUuaCB8IDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL0tjb25maWcgYi9hcmNoL2xvb25n
YXJjaC9LY29uZmlnCj4gaW5kZXggZWUxMjM4MjBhNDc2Li42NWQ0NDc1NTY1YjggMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9sb29uZ2FyY2gvS2NvbmZpZwo+ICsrKyBiL2FyY2gvbG9vbmdhcmNoL0tjb25m
aWcKPiBAQCAtMTUsNiArMTUsNyBAQCBjb25maWcgTE9PTkdBUkNICj4gICAgICAgICBzZWxlY3Qg
QVJDSF9IQVNfQ1BVX0ZJTkFMSVpFX0lOSVQKPiAgICAgICAgIHNlbGVjdCBBUkNIX0hBU19GT1JU
SUZZX1NPVVJDRQo+ICAgICAgICAgc2VsZWN0IEFSQ0hfSEFTX0tDT1YKPiArICAgICAgIHNlbGVj
dCBBUkNIX0hBU19LRVJORUxfRlBVX1NVUFBPUlQgaWYgQ1BVX0hBU19GUFUKPiAgICAgICAgIHNl
bGVjdCBBUkNIX0hBU19OTUlfU0FGRV9USElTX0NQVV9PUFMKPiAgICAgICAgIHNlbGVjdCBBUkNI
X0hBU19OT05fT1ZFUkxBUFBJTkdfQUREUkVTU19TUEFDRQo+ICAgICAgICAgc2VsZWN0IEFSQ0hf
SEFTX1BURV9TUEVDSUFMCj4gZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL01ha2VmaWxlIGIv
YXJjaC9sb29uZ2FyY2gvTWFrZWZpbGUKPiBpbmRleCA0YmE4ZDY3ZGRiMDkuLjFhZmUyOGZlYWJh
NSAxMDA2NDQKPiAtLS0gYS9hcmNoL2xvb25nYXJjaC9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvbG9v
bmdhcmNoL01ha2VmaWxlCj4gQEAgLTI1LDYgKzI1LDkgQEAgZW5kaWYKPiAgMzJiaXQtZW11bCAg
ICAgICAgICAgICA9IGVsZjMybG9vbmdhcmNoCj4gIDY0Yml0LWVtdWwgICAgICAgICAgICAgPSBl
bGY2NGxvb25nYXJjaAo+Cj4gK0NDX0ZMQUdTX0ZQVSAgICAgICAgICAgOj0gLW1mcHU9NjQKPiAr
Q0NfRkxBR1NfTk9fRlBVICAgICAgICAgICAgICAgIDo9IC1tc29mdC1mbG9hdApXZSB3aWxsIGFk
ZCBMb29uZ0FyY2gzMiBzdXBwb3J0IGxhdGVyLCBtYXliZSBpdCBzaG91bGQgYmUgLW1mcHU9MzIg
aW4KdGhhdCBjYXNlLCBhbmQgZG8gb3RoZXIgYXJjaHMgaGF2ZSB0aGUgY2FzZSB0aGF0IG9ubHkg
c3VwcG9ydCBGUDMyPwoKSHVhY2FpCgo+ICsKPiAgaWZkZWYgQ09ORklHX0RZTkFNSUNfRlRSQUNF
Cj4gIEtCVUlMRF9DUFBGTEFHUyArPSAtRENDX1VTSU5HX1BBVENIQUJMRV9GVU5DVElPTl9FTlRS
WQo+ICBDQ19GTEFHU19GVFJBQ0UgOj0gLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50cnk9Mgo+IEBA
IC00Niw3ICs0OSw3IEBAIGxkLWVtdWwgICAgICAgICAgICAgICAgICAgICAgID0gJCg2NGJpdC1l
bXVsKQo+ICBjZmxhZ3MteSAgICAgICAgICAgICAgICs9IC1tYWJpPWxwNjRzCj4gIGVuZGlmCj4K
PiAtY2ZsYWdzLXkgICAgICAgICAgICAgICAgICAgICAgICs9IC1waXBlIC1tc29mdC1mbG9hdAo+
ICtjZmxhZ3MteSAgICAgICAgICAgICAgICAgICAgICAgKz0gLXBpcGUgJChDQ19GTEFHU19OT19G
UFUpCj4gIExERkxBR1Nfdm1saW51eCAgICAgICAgICAgICAgICAgICAgICAgICs9IC1zdGF0aWMg
LW4gLW5vc3RkbGliCj4KPiAgIyBXaGVuIHRoZSBhc3NlbWJsZXIgc3VwcG9ydHMgZXhwbGljaXQg
cmVsb2NhdGlvbiBoaW50LCB3ZSBtdXN0IHVzZSBpdC4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29u
Z2FyY2gvaW5jbHVkZS9hc20vZnB1LmggYi9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9mcHUu
aAo+IGluZGV4IGMyZDg5NjJmZGEwMC4uMzE3NzY3NDIyOGY4IDEwMDY0NAo+IC0tLSBhL2FyY2gv
bG9vbmdhcmNoL2luY2x1ZGUvYXNtL2ZwdS5oCj4gKysrIGIvYXJjaC9sb29uZ2FyY2gvaW5jbHVk
ZS9hc20vZnB1LmgKPiBAQCAtMjEsNiArMjEsNyBAQAo+Cj4gIHN0cnVjdCBzaWdjb250ZXh0Owo+
Cj4gKyNkZWZpbmUga2VybmVsX2ZwdV9hdmFpbGFibGUoKSBjcHVfaGFzX2ZwdQo+ICBleHRlcm4g
dm9pZCBrZXJuZWxfZnB1X2JlZ2luKHZvaWQpOwo+ICBleHRlcm4gdm9pZCBrZXJuZWxfZnB1X2Vu
ZCh2b2lkKTsKPgo+IC0tCj4gMi40Mi4wCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
