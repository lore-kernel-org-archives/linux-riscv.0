Return-Path: <SRS0=yqZG=DL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC2CC4363C
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2020 21:16:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE992206DD
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2020 21:16:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1fcyi4U2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTK+erHh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE992206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6zccT2jyBM4ODHaMHnbWAk0++QIow+MgLhoVAAWGDSo=; b=1fcyi4U2lf8IL2upVU1+N5s6D
	MiUkJGIh7RSJjUtXQwgeuyAuIoBvl2G5pCiJZlm1kokmHoiQpIcxy2IwFtJqU5JqiT3AQh9BmC9Dy
	xYdD5+wHg2TcNtDiCWb+gEf1CA0zmp4RY8wdZXuIaHluA+gBdXn2JK3d++1xrSQ8OsrIy4xlVkO4G
	zQyW5raqjkL+/150hQVW0GP/zJJ8lUgQqKTJ3QZ7LFhwvUq3Xw758OsBfOjwFSQfIaOhKQox6EGoT
	RkJyy8caYtAn0k2b1Y/fO3mz1MZksn5UzLmDoWBJUrjmN+Y8alcObl6hanXgTZHhon5j5GyCx1/OZ
	c63HNgBnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPBMn-0001g2-MJ; Sun, 04 Oct 2020 21:16:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPBMl-0001f8-EA
 for linux-riscv@lists.infradead.org; Sun, 04 Oct 2020 21:16:24 +0000
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CAC4020797
 for <linux-riscv@lists.infradead.org>; Sun,  4 Oct 2020 21:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601846181;
 bh=1/fg8uWl3pmlAi0Q2vkVcGSaTYg3h3TSf7CL3PVW6XU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uTK+erHhSMum0+TGO/vLDyFgcw5IsFcym9B07ZCSVM+GDdZqJE2PVTasSn/qc8Q2c
 ZByi2Iws3yyNhmEdaX8jj+6pPdrEanjwSMN5AiIpwAcOEGugcLz7CdEPW2oJE7cnlA
 b76kJyaa7ebB7QmvBqy/R8HwAMoO1gyJ9bad5ieY=
Received: by mail-oo1-f42.google.com with SMTP id b12so1763005oop.13
 for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2020 14:16:21 -0700 (PDT)
X-Gm-Message-State: AOAM5323uYhF3ODanoIOReoqjq74PDIXNqRyoa/wvQgMPbFijdKRUWJG
 HMYJiZIHfXf2n47SCN2QuK7wyi/9DCbvz2V/6Wg=
X-Google-Smtp-Source: ABdhPJzbSIfSBAxeJ/fBJn3YGgIvi4EOvZt7/umB0jBhBQeEQ8eh0nOR6qLVF9wMfUk6r7mTDuaJvIKYlt8QX7pK2KQ=
X-Received: by 2002:a4a:c3ca:: with SMTP id e10mr3026860ooq.41.1601846181147; 
 Sun, 04 Oct 2020 14:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200930065617.934638-1-palmerdabbelt@google.com>
 <20201002064905.GA27115@infradead.org>
 <5692716.lOV4Wx5bFT@positron.chronox.de>
In-Reply-To: <5692716.lOV4Wx5bFT@positron.chronox.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 4 Oct 2020 23:16:10 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEnOh4MBiVVgkhd4P81eRPCVi3+y6JcD58jL45-eh324A@mail.gmail.com>
Message-ID: <CAMj1kXEnOh4MBiVVgkhd4P81eRPCVi3+y6JcD58jL45-eh324A@mail.gmail.com>
Subject: Re: [PATCH] crypto: jitterentropy - bind statically into kernel
To: =?UTF-8?Q?Stephan_M=C3=BCller?= <smueller@chronox.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_171623_619634_1EB31A9E 
X-CRM114-Status: GOOD (  20.05  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: kernel test robot <lkp@intel.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCA0IE9jdCAyMDIwIGF0IDIwOjQ4LCBTdGVwaGFuIE3DvGxsZXIgPHNtdWVsbGVyQGNo
cm9ub3guZGU+IHdyb3RlOgo+Cj4gVGhlIFJJU0MtViBhcmNoaXRlY3R1cmUgaXMgYWJvdXQgdG8g
aW1wbGVtZW50IHRoZSBjYWxsYmFjawo+IHJhbmRvbV9nZXRfZW50cm9weSB3aXRoIGEgZnVuY3Rp
b24gdGhhdCBpcyBub3QgZXhwb3J0ZWQgdG8gbW9kdWxlcy4KCldoeSBpcyB0aGF0PyBXb3VsZG4n
dCBpdCBiZSBiZXR0ZXIgdG8gZXhwb3J0IHRoZSBzeW1ib2wgaW5zdGVhZD8KCj4gVGh1cywgdGhl
IEppdHRlciBSTkcgaXMgY2hhbmdlZCB0byBiZSBvbmx5IGJvdW5kIHN0YXRpY2FsbHkgaW50byB0
aGUKPiBrZXJuZWwgcmVtb3ZpbmcgdGhlIG9wdGlvbiB0byBjb21waWxlIGl0IGFzIG1vZHVsZS4K
Pgo+IFJlcG9ydGVkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+Cj4g
U2lnbmVkLW9mZi1ieTogU3RlcGhhbiBNdWVsbGVyIDxzbXVlbGxlckBjaHJvbm94LmRlPgo+IC0t
LQo+ICBjcnlwdG8vS2NvbmZpZyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvY3J5cHRvL0tjb25maWcgYi9jcnlw
dG8vS2NvbmZpZwo+IGluZGV4IDA5NGVmNTZhYjdiNC4uNWIyMDA4N2IxMTdmIDEwMDY0NAo+IC0t
LSBhL2NyeXB0by9LY29uZmlnCj4gKysrIGIvY3J5cHRvL0tjb25maWcKPiBAQCAtMTg1Myw3ICsx
ODUzLDcgQEAgY29uZmlnIENSWVBUT19EUkJHCj4gIGVuZGlmICAjIGlmIENSWVBUT19EUkJHX01F
TlUKPgo+ICBjb25maWcgQ1JZUFRPX0pJVFRFUkVOVFJPUFkKPiAtICAgICAgIHRyaXN0YXRlICJK
aXR0ZXJlbnRyb3B5IE5vbi1EZXRlcm1pbmlzdGljIFJhbmRvbSBOdW1iZXIgR2VuZXJhdG9yIgo+
ICsgICAgICAgYm9vbCAiSml0dGVyZW50cm9weSBOb24tRGV0ZXJtaW5pc3RpYyBSYW5kb20gTnVt
YmVyIEdlbmVyYXRvciIKPiAgICAgICAgIHNlbGVjdCBDUllQVE9fUk5HCj4gICAgICAgICBoZWxw
Cj4gICAgICAgICAgIFRoZSBKaXR0ZXJlbnRyb3B5IFJORyBpcyBhIG5vaXNlIHRoYXQgaXMgaW50
ZW5kZWQKPiAtLQo+IDIuMjYuMgo+Cj4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
