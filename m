Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B4DFCD0BF
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 06:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAb/uHTJywVm6dMwm9+CNu8ZX+jvDCPfDUC7lzTfrCQ=; b=oaORnj6yOyXTBl
	L7bUh6LmomCX4x3knbF1+L3D+Ay0TXPJohdDG27kwF+1zLZirbAQL2muOlbEBJz8DIsZXdEp5Spga
	5igO5ga0LgEr1aE2me7ze1Pf+7Gnz9gb3JnmQfX4UoIXYk0M2OS4I4xlO6mOPILOT5JJg5ooFAmOu
	eQ+22deiQmAl2EQK7SBocpxKV76XnQpB6jsnQKqP3uNSchM3fJfAZNjagbQ2PoXv6XkMxU3rDEEUP
	wU/IuWMJQnML9V815kgRTxVc5OegDzEnjfslNXRC0oTQXP1PAsKQWHaD7IsqGjZGyZ5qkaKzysZ6D
	FwP8Fl/3NRY0LvmnGLgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kCw-00000007qCY-3Inf;
	Wed, 18 Mar 2026 06:16:42 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kCu-00000007qBm-1Mov
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 06:16:41 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b9795ca4e6dso666307966b.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Mar 2026 23:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773814598; cv=none;
        d=google.com; s=arc-20240605;
        b=JZe/uJlLthfAyf1zjKxBmOQaBAkwg4ETrNG4FOTd0i7MFmtbRv1PQqFukrT5XN9pIN
         vW5AOdmF3B/W1eCyaxiV9I1J7NWX2TwvOwsqVDZsvfHGNQksP0e0S3tKSVt/XD8DZn4w
         pUTmh1Pz9dH8I3Yj35d/QrJtmDvbyn4ECV2W3gWukpqP9r8erNdIXO0DGPYth5DA1Cop
         GjBBpsuA7BSpxYxVRQ6v6020uoUkKUBo7sH9Yu/GkoIzsrlcNy7ThnDkMp/E3uW9Hx2z
         VFKH1kzdeY5PnDuwfzj4yMgrRUANHQRBIT69/niFiQhAM4MgxU2mbQqTTxOTMbNcpetS
         u0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=;
        fh=V9V06cqDWVmj7erkz4rpQ0GGWsJOarQgcJb4HdoeYjs=;
        b=P2fsn9sUGF5psqtqSlfHomP7VW+EQD7O5IiNHwp9fkwMJc8DrZ8fHKlk/zPYB976vX
         QgURNM/2ljnUk9q/hKfoz1W6TG5XZeAaPfTa3C/YUnxwZALVsf1plkJQWeqKdvuV5Gxp
         xta+N5hXNKOKSzuqbMrdMSM6Fe071FH1nWEJKa7gtKpKZPAUETUBXFUjHdiQmnhezBxg
         uqffDLy78CwQso0SxNq/aSgAMSBl6YM7S+3k+2jpLFh/Xj5g2FZFQUTnf42WjixTsFsw
         M2gi1aYVjCydrXS/57fWxpX26pFFX24Oq/mNRDS0NBlKKmyCj5pykZpbKqKMQT6cLqfC
         MGlA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773814598; x=1774419398; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=;
        b=Nrqb1cCYo+GNTvtSA+XAxmq2YcxDTJKovlFYjhTXLqMGSQpYXtbLxT8LC7ldZScrkY
         jLFY9gbDnQKY7OhY5hnQLga+PhVmrTq/zZv9iYA2ZiHt8Jwp9z2aavcOamEKg6ELzHRP
         PHyvyvUyZVbKVyP+AB78NAKFQ4HtELGfxVfL+KjPNtl3xLD3pyR0kNYSAOjA4o5bsUrp
         w2V4b9V1G3NpEwVqbwp43FWPuP8OMT7Ets8REGKkvi9MakciJhUGe3lkEEE1cihgHoLS
         OG/NW70lHEcn0Q85sk3tw09B+flHOSxKmgsD3ZsRXBDzQUR60CZJMAJkI2Arit9ywk+T
         bm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773814598; x=1774419398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hNXx5fLw5itcSqfItrsW3d6my1DlKfO6NqzxE5+AiMo=;
        b=lH/bgZ0nwtHlIs0fW6I0+agHtINMvGbmHLVs+cQxZNw5gXNRfJRLhk5gJLdUdxdfM+
         yAtMwAMlPTgF8HeQnEKGZLAhm3qN7sepWy8mc7VNZG/C0oOFwnlE8wOuR2CFVELttp5d
         qfskFkPQxDKc37mHbiFbMq7mRTRNzmspDXnMRppCkQ/o7fuwBLzzmzvDyCFodcoOuxXa
         i2+B7mIUV6E1UTQIwFZT2eBu7bT2VfFm9np/4GYo6OTi93W/mLQlf+1SHstHsxqJ8ZPT
         uSHud/HyRSgH1iNgseYG2z5KWyASBqKZfZmJ1Gl5uJTrwaMgHUsak5gjsdMGKumqiylV
         k0Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVZsefs+VDco64vAtLTSg2NM451o6vyuSMzTUKnGfZsvcI287LJKeQYXobFwgz+Z+aYQrBqz1UhGoNDIw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5A9mCtsz6il27i0TufijIoBAJk5GM5UHoTH1FeKwRL0WIn/jY
	gqzjm2wJ6FKj/bFybC5jtQPQC5lsXKZf5JmNlUxc4UdUVa7AEuKlUnQt2dumeBGMWWTmNxOvtvP
	YR4E454+FP+njt+7ZGKZi1UzAyv3/l0c=
X-Gm-Gg: ATEYQzyzg0i9U82bVm2g5gJo64aclKECGeY+JuLBZ8U0Zj2X/Lt7+GeMHcseKkxXC/G
	CguIrcoZijtEa/56rP2R13Dpci0vcU5moTQ/Y0WNSluxE8jippSDmP29L9cCBsto1Gls9V9oQfb
	mAHrvZd9TCwMHiF6V1FmtcmCh31ddnqDCL8q9B/EAAUQL3dLaloM0dmN0VCcmQ47dsxFYPpo+/G
	8xOHKM8Kq02duL5TP/pwvrRpfNp2ayL0AudV9bKLsqeVJUA4M6PcyInBt4GSwpHXa5WU68xTUY2
	nGpWjY03/hYV7b7Ztpjnkk4GBE8yBfO7pIv1qd2L/KTfDYsf/Vg=
X-Received: by 2002:a17:907:7b93:b0:b97:cc05:61b9 with SMTP id
 a640c23a62f3a-b97f4801ab5mr133040366b.15.1773814597747; Tue, 17 Mar 2026
 23:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de> <20260302-at-vector-size-arch-v1-14-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-14-a11f03ba2ca8@linutronix.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 18 Mar 2026 07:16:26 +0100
X-Gm-Features: AaiRm51Xx89jeaivgNYAhMk2LxpIu3kD6j5N4SuQDZ84WCnP1EAzJIW2dMNKGiE
Message-ID: <CA+=Fv5RLtUPp9BhXfFEUk3roE3Gah0iUamDEZ-MXCNM_xKm3PA@mail.gmail.com>
Subject: Re: [PATCH 14/15] alpha: remove AT_VECTOR_SIZE_ARCH from UAPI
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-alpha@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_231640_381690_4455986C 
X-CRM114-Status: GOOD (  10.84  )
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

T24gTW9uLCBNYXIgMiwgMjAyNiBhdCAxOjMy4oCvUE0gVGhvbWFzIFdlacOfc2NodWgKPHRob21h
cy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gVGhlcmUgaXMgbm90aGluZyB1
c2Vyc3BhY2UgY2FuIGRvIHdpdGggdGhpcyB2YWx1ZS4gSW4gdGhlIGtlcm5lbCBpcwo+IGFsd2F5
cyBjb21iaW5lZCB3aXRoIEFUX1ZFQ1RPUl9TSVpFX0JBU0UsIHdoaWNoIGlzIG5vdCBleHBvc2Vk
IHRvCj4gdXNlcnNwYWNlIGFuZCBhbHNvIGNoYW5nZXMgZnJvbSB0aW1lIHRvIHRpbWUuCj4KPiBN
b3ZlIHRoZSBzeW1ib2wgdG8gYSBrZXJuZWwtaW50ZXJuYWwgaGVhZGVyLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+
Cj4gLS0tCj4gIGFyY2gvYWxwaGEvaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICB8IDcgKysrKysr
Kwo+ICBhcmNoL2FscGhhL2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggfCA4ICsrKy0tLS0tCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgoKQnVp
bGQtdGVzdGVkIG9uIGFscGhhLCBubyBpc3N1ZXMgaGVyZS4KCkFja2VkLWJ5OiBNYWdudXMgTGlu
ZGhvbG0gPGxpbm1hZzdAZ21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
