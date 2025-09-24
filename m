Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64AACAC5B1
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 15:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+syC7SPYh3u5TngNuE8tBpN5Ay2M53l1KkT+0G3SeA=; b=H2jGR9dygDofjt
	OP4ZMmUZqkt9Q33Oc4C+1ePzPSMHBGNT102mTzADwJW/A2+4UK3d5Zm0SM5rgIid4NA/uyN6BM0bI
	pMJIhRIeArSFS2qfJMPvVvspRyygG9r5LcPNqyGz5z5mTD3kJc1MaTCArbORdaIiiTGtqXwXBstoS
	5vXTzIZSdQddLUS4EX7alaQy5flw5QU7PC+tB1YN0dqjeA1GSaei/awU83hIUIUJWmIkD+WpH54L2
	e+mvEC6g7Pyti2SiFsYZ3nI173jscfGdWlZNuyk6i0eYRkRfDKSKsKpeNVi9txYJ668c7cP9vcnu2
	k9+HoWcI2aSthXA80C+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RKJ-00000001Bux-05oV;
	Wed, 24 Sep 2025 15:22:39 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RKG-00000001BsD-26bQ
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 15:22:37 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-330b0bb4507so4497354a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758727355; x=1759332155; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGkkH3On4e9g/uKbOlSYkJKHveGl2HpttCc7mFGVIhA=;
        b=EDkw1bXuAeg/haFUtTJIMZzsI8u0nwvWg1xfUJDyxH3lrVfm0A86kZqK/129I+8W2M
         a7Tqc4q6rB0nlZRWqGgVwRFul+VOPA8KtKD8Qs0hKb9ToLHQCoKfnqbEy3cmL/sO8ClE
         Fz+FI1IWChU69PO7AJAMvLBg6xkhEof1A6Hz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758727355; x=1759332155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGkkH3On4e9g/uKbOlSYkJKHveGl2HpttCc7mFGVIhA=;
        b=D8leOHXc5AGQHs0530qMet42WvoL1jZd+V3WaW95e+F6GYOEiS7H8IPBM/i/0la+Ql
         zrX2RtNyeVu60JOZdMSWV2IxDYrmE+Kl49s2rRa3gHHJxx1Bt8S25hbiAZaB9QcK23V/
         JateG6iu+XzDFmmZtNQreBQluVzXv8ZjxZv2nTyNRCM7RzS2xZCmd9HFBViK54M9vLc+
         PRLqjiVhncYgWap4Z2+Kag1HzcOsUjcI91T3ohszmoTTCJK2torXHqqn2w6Axx4v7+gO
         cTGn2QBugCKJAb/Dks7Y3YwBiriFur6y2IYqlcLnA6GjunySCZtQTeKeZfD2y2aDbMih
         4QRg==
X-Forwarded-Encrypted: i=1; AJvYcCXdnc2D0X3k5NR6xul1Y5xkDb5Dioqp8bDUhYMTds6c1XR6v9tZlTfJ6/t6iVua1cJW/XQwuuVt89EA5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIYS1XWwCkEqybWMgl0pnofOQpPNnaAha0t7GScFhoVoa/axw0
	86cNh0XmxN/qrzfP/L4nD6SuG+RIsu5RpIXQ+y0UsEzIEk7ECi0qhR73JWgb5mDHHLtm4HuTGwL
	khP0=
X-Gm-Gg: ASbGncszRcOKTkMI543m5j0W8WvRl+BDmB3G9O3Zl8YuwLEt87O1sduKiOip2Uxod87
	h5s9HegQRB8X6WpSpZbq/po/P6gwLPBuo6iLloxE349qrtk4u85qGrmrUJseDLCJJbm2kVh2Qby
	vHjBQBoV/USqj4F6KEGHiH344huyw4BQm+Jw2DwrDkL32kQ9WKSVFT7g6E53zwB8ecxgCpMwToV
	lIjqtaJrjQZQHNt6QEQuNpTFFh5Oex20Bx3298DwFAc0EG5g4rBHjPZ9StNAyJnX4SQW23JNK4z
	H0e8AhkebhSAhzwudaM2skpFmPwuqZ5weBjc7E8EVqTisQNdpzMg4VDDkAS+bClj2+zE8bKEMds
	G40ff2DyhCcxZEtGe8omjxgnm3pbLBYK8ik5ePcQvNjBBagNk8r1f5yR4PnABf223Bg==
X-Google-Smtp-Source: AGHT+IF++hyxBGStVOmbu86cgHjzdHgaoqSvtCoonrmzZrSpWHW4aWEv89f6VdpXVEqJ9hKKLbdjhw==
X-Received: by 2002:a17:90b:5109:b0:32b:baaa:21b0 with SMTP id 98e67ed59e1d1-3342a2498b0mr122839a91.6.1758727354501;
        Wed, 24 Sep 2025 08:22:34 -0700 (PDT)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bdb4fafsm2747366a91.17.2025.09.24.08.22.34
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 08:22:34 -0700 (PDT)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-24457f581aeso68783225ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 08:22:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXy/akYZKGoCx/2OfXqH+NZCagksKFrEtgoknM7OADKhKXF7/OlyrPps2RR30LYZLoQFsmwM+CBG+2O6g==@lists.infradead.org
X-Received: by 2002:a17:902:c94d:b0:278:daab:7940 with SMTP id
 d9443c01a7336-27ed4a3dfa8mr1337745ad.17.1758727353184; Wed, 24 Sep 2025
 08:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
 <CAEEQ3wnHzL6KVaW=RAkoMNSoM+HW11n=5miFwkw7=LQw+375Gw@mail.gmail.com>
In-Reply-To: <CAEEQ3wnHzL6KVaW=RAkoMNSoM+HW11n=5miFwkw7=LQw+375Gw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 Sep 2025 08:22:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XYGmayve1ujv9oqRrJaq-D6g7pRygvQf31WfEMsT3g8Q@mail.gmail.com>
X-Gm-Features: AS18NWDf2q3VkrTezxWiqMq5MaW03lcJwh8tH3BwlSFCZCG9Jd79C5JfcXHF2sY
Message-ID: <CAD=FV=XYGmayve1ujv9oqRrJaq-D6g7pRygvQf31WfEMsT3g8Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com, 
	masahiroy@kernel.org, suzuki.poulose@arm.com, maz@kernel.org, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, mingo@kernel.org, 
	lihuafei1@huawei.com, akpm@linux-foundation.org, jpoimboe@kernel.org, 
	rppt@kernel.org, kees@kernel.org, thomas.weissschuh@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_082236_569941_C0ABAAD9 
X-CRM114-Status: GOOD (  21.62  )
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

SGksCgpPbiBUdWUsIFNlcCAyMywgMjAyNSBhdCA3OjQx4oCvUE0geXVuaHVpIGN1aSA8Y3VpeXVu
aHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gSGkgRG91ZywKPgo+IE9uIFNhdCwgQXVnIDMw
LCAyMDI1IGF0IDU6MzTigK9BTSBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+
IHdyb3RlOgo+ID4KPiA+IEhpLAo+ID4KPiA+IE9uIFdlZCwgQXVnIDI3LCAyMDI1IGF0IDM6MTDi
gK9BTSBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IE1vdmUgd2F0Y2hkb2dfaGxkLmMgdG8ga2VybmVsLywgYW5kIHJlbmFtZSBhcm1fcG11X2ly
cV9pc19ubWkoKQo+ID4gPiB0byBhcmNoX3BtdV9pcnFfaXNfbm1pKCkgZm9yIGNyb3NzLWFyY2gg
cmV1c2FiaWxpdHkuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1
bmh1aUBieXRlZGFuY2UuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvYXJtNjQva2VybmVsL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gPiA+ICBkcml2ZXJzL3BlcmYvYXJtX3Bt
dS5jICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4gIGluY2x1ZGUvbGludXgvbm1p
LmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gPiA+ICBpbmNsdWRlL2xpbnV4L3Bl
cmYvYXJtX3BtdS5oICAgICAgICAgICAgICAgICB8IDIgLS0KPiA+ID4gIGtlcm5lbC9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gPiAge2FyY2gvYXJtNjQv
a2VybmVsID0+IGtlcm5lbH0vd2F0Y2hkb2dfaGxkLmMgfCA4ICsrKysrKy0tCj4gPiA+ICA2IGZp
bGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+ID4gIHJlbmFt
ZSB7YXJjaC9hcm02NC9rZXJuZWwgPT4ga2VybmVsfS93YXRjaGRvZ19obGQuYyAoOTclKQo+ID4K
PiA+IEknbSBub3QgYSBodWdlIGZhbiBvZiB0aGUgcGVyZiBoYXJkbG9ja3VwIGRldGVjdG9yIGFu
ZCBJTU8gd2Ugc2hvdWxkCj4gPiBtYXliZSBqdXN0IGRlbGV0ZSBpdC4gVGh1cyBzcHJlYWRpbmcg
aXQgdG8gc3VwcG9ydCBhIG5ldyBhcmNoaXRlY3R1cmUKPiA+IGlzbid0IG15IGZhdm9yaXRlIHRo
aW5nIHRvIGRvLiBDYW4ndCB5b3UgdXNlIHRoZSBidWRkeSBoYXJkbG9ja3VwCj4gPiBkZXRlY3Rv
cj8KPiA+Cj4gPiBUaGF0IGJlaW5nIHNhaWQsIEkgZGlkIGEgcXVpY2sgbG9vayBhdCB5b3VyIHBh
dGNoLiBJJ20gcHJldHR5IHN1cmUgeW91Cj4gPiBjYW4ndCBqdXN0IG1vdmUgdGhlIGFybTY0ICJ3
YXRjaGRvZ19obGQuYyIgdG8gYmUgZ2VuZXJpYy4gV29uJ3QKPiA+IGh3X25taV9nZXRfc2FtcGxl
X3BlcmlvZCgpIGNvbmZsaWN0IHdpdGggZXZlcnlvbmUgZWxzZSdzICh4ODYgYW5kCj4gPiBwb3dl
cnBjKT8KPgo+IEFmdGVyIGRpc2N1c3Npbmcgd2hldGhlciB0byByZW1vdmUgd2F0Y2hkb2cgcGVy
ZiwgaXQgc3RpbGwgc2VlbXMKPiBuZWNlc3NhcnkgdG8ga2VlcCBhZHZhbmNpbmcgd2l0aCBpdC4g
Rm9yIHRoZSBjb2RlLCB3ZSBqdXN0IG5lZWQgdG8KPiBkZWNvcmF0ZSBod19ubWlfZ2V0X3NhbXBs
ZV9wZXJpb2QoKSB3aXRoIF9fd2VhaywgcmlnaHQ/CgpUaGF0IHdvdWxkIHByb2JhYmx5IHdvcmss
IGJ1dCBJTU8geW91IHNob3VsZCBtYWtlIHN1cmUgeW91IGNhbiBmaWd1cmUKb3V0IGhvdyB0byBh
dCBsZWFzdCBjb21waWxlIHRoZSB4ODYvcG93ZXJwYyBrZXJuZWxzIHRvIGNvbmZpcm0uCgotRG91
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
