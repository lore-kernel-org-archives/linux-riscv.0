Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BFCCA101F
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Sep 2025 23:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOt/joLCqhAlPkVnUwRJVYaJZ/grK5pmHB3TZh9UJBw=; b=St8gaVFxDPilIe
	Yxs1tCGHUXHkMTU+fZM/8GGxvpc1DDG5zMa0gLVggJ6z/Fha1UKJ1MgLQN8Hno0V2Muk8/x+7u5lt
	Wr0ZFxiXVtXfaH0n/49nYDjVGoKzXJQ+LOxIIVMj49OhJCXEi9xSR9Sy8wzY7L4vX+3fGe96lllI4
	1hR+JQAAKYX2noeyuXmVBbQq6PRv2SwSnP8NfAA5sR/TqVG0LzTXNHZBw8xdSXX7w/j39OoBzmSoD
	5/NMp4EDyzJvJBxApniy1gTCn9yqHFG+YkFAyhhKhPd0jEnsqwVBowRVSgVgO1UAHlXEPtpLUcClX
	3SBLSP8VfVHTfIBG7gTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvOb0-0000000DJ6e-339j;
	Sun, 07 Sep 2025 23:14:54 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvOay-0000000DJ5y-2BLW
	for linux-riscv@lists.infradead.org;
	Sun, 07 Sep 2025 23:14:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-24b2d018f92so241545ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 Sep 2025 16:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757286891; x=1757891691; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wo3tK6bHFA7DqiNO7PYI330tCwygBeTXt4YoEOQtnvM=;
        b=sDN/MmspHzvlFKMY4brK307QsMzrVrmw3LA0ABB/AhRxd1hiHw3paYlCO1TpsMLCd5
         X9la4ntnYR2lyLwDVtSY3rvF9ym0c8n0A1Wayo1LnnF+2tJenMfRxgw2bfUkja35SQ/9
         gIgzVp4UBDq9sbsKHKfNYkL2tWFLfB7QKpGvKKCiQD6gpcp92T5Wuyix+LCaXC4nDzmP
         KaN9tFeZRuxnJoDkpswOLcchIsRsJ889OBnsypAeGvYk4UHmiokgyCxeEggIwiZohmnA
         OaAULuPTG/9Zwf9VLUmY9L5iLcxou93i36XFcVEk0GGT/5lepQ+7gEyoPsRQFieKcVzh
         ZmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757286891; x=1757891691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wo3tK6bHFA7DqiNO7PYI330tCwygBeTXt4YoEOQtnvM=;
        b=q1+mTGO/ahpnPNUBaZMfb7kqrj+vsIkZA7SKtvH7ZqdtRDmiZUGTMzkXrV4+bUlL8y
         S/Ayjli1rFr6gM6z0rnHFNg/8wCBmdb4wo8WZ9Rcc0fOoI7vYrpFj9OeTXBWUXnAoVGM
         yjlnxxPpZ5gMEOYs5WCRndmNInd7lMIIhiWU9KecMmlYIpng80zMEW4mXB1eH7FSB4VM
         Tld5smWLMOL3Lf3hGBxGU4navJ8TdFYUpA9Gsol58CYDbZfE9pLIsSTfmkQBbjepmPk/
         roWh2UIW5OSV3+zbi0UTiEBD5kGnSK3B1J4v23A/gk9z7z/sHNSZyDuWn9NiUkb0QPTb
         RuEw==
X-Forwarded-Encrypted: i=1; AJvYcCWQbZEUP2pLFmuC8esda1/kmaL9Xh/KumsJhYYJX1DHtsVLCPQuc/h2lL/RkjD4pzw1iSznWm9guW67Iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDwKXevurESNfMgx9ky4m95awSXeC2JJ6uyZ16UwG9KIGo5u4E
	Nd1pn9hdRV5/teiP94hQv40rboEnxmtJUJUcihPYWTWVF2nJ7bQLonJ2IVsWKjESjv/h/jgrPWd
	C9XJo7Z/QAplSw0YSznkcRxVpLPk/mo/4lcKoLf3X
X-Gm-Gg: ASbGncvSS6asicqnnX/6cmBetBb1eGzLF2tjtU+tR5b3Y6+aRPx4tcHj51WcZ8vYMPE
	56xqkN1hv/8FOHDpP7Ai9i/mPpWkmD6kpf21/iU7LrvDBUWdwI9CQgXdnADo3A+qKRvFQYS8GNP
	8KLLNfSATUNg64Msbzc+weau8drn1KZNhphmChDvJRVE2kX3Ca8vhBllov/uzH3iCL2Gwnz2C2P
	QqG7K0yDd2ZEFE=
X-Google-Smtp-Source: AGHT+IEltd/sAul6Dn7ms8HB6NIeq1vgyjW8DOdKH+H9ryQVdD/7vpwWCRfh119NUS1vpsfKq75+rwJhHcfHD7PiJjg=
X-Received: by 2002:a17:902:db11:b0:24b:1741:1a4c with SMTP id
 d9443c01a7336-2510f458c5emr4290315ad.0.1757286890641; Sun, 07 Sep 2025
 16:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
 <CAEEQ3wmBvevbkP8XmwR0_q_1QWQsie5g0UUxTFm6ovS1m41pEQ@mail.gmail.com>
 <CAD=FV=UzUCPtwuQRFR0SkAkh63MbzMefxNYmiOBxCemL3P_+EQ@mail.gmail.com>
 <CAEEQ3wmLOjZxVh_vBhmctH-u_ZSxnyg0GiN-_e_4v8_pfxcbSw@mail.gmail.com> <CAD=FV=XaSP2A7Dufrxt1DUUznF9Yk-qdBY3wbE03x4_L8HJLSQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XaSP2A7Dufrxt1DUUznF9Yk-qdBY3wbE03x4_L8HJLSQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 7 Sep 2025 16:14:39 -0700
X-Gm-Features: Ac12FXyVydF5cSsxyRKJ_un6fARDQ6-2DZTw3qkJGbuqWtoGH405LU6WKebU2PI
Message-ID: <CAP-5=fWkcxvZ0z9FJztbN4EhU+BNEJTNxe2a6_+11EcYhjZQaQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: Doug Anderson <dianders@chromium.org>
Cc: yunhui cui <cuiyunhui@bytedance.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, atish.patra@linux.dev, 
	anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, masahiroy@kernel.org, suzuki.poulose@arm.com, 
	maz@kernel.org, zhanjie9@hisilicon.com, yangyicong@hisilicon.com, 
	mingo@kernel.org, lihuafei1@huawei.com, akpm@linux-foundation.org, 
	jpoimboe@kernel.org, rppt@kernel.org, kees@kernel.org, 
	thomas.weissschuh@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_161452_581133_088403A2 
X-CRM114-Status: GOOD (  19.38  )
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

T24gRnJpLCBTZXAgNSwgMjAyNSBhdCA0OjU34oCvUE0gRG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNA
Y2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gV2VkLCBTZXAgMywgMjAyNSBhdCA0
OjU24oCvQU0geXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4g
SeKAmXZlIHJlYWQgeW91ciBsaW5rZWQgY29udGVudCwgd2hpY2ggZGV0YWlscyB0aGUgcHJvcyBh
bmQgY29ucyBvZiBwZXJmCj4gPiB3YXRjaGRvZyBhbmQgYnVkZHkgd2F0Y2hkb2cuCj4gPiBJIHRo
aW5rIGV2ZXJ5b25lIHdpbGwgYWdyZWUgb24gY2hvb3Npbmcgb25lIGFzIHRoZSBkZWZhdWx0Lgo+
ID4gSXQgc2VlbXMgdGhlcmXigJlzIG5vIGtlcm5lbC93YXRjaGRvZyBlbnRyeSBpbiBNQUlOVEFJ
TkVSU+KAlHdoYXTigJlzIG5leHQKPiA+IGZvciB0aGVzZSB0d28gYXBwcm9hY2hlcz8KPgo+IEkg
Z3Vlc3MgdG8gc3RhcnQsIHNvbWVvbmUgKHlvdT8pIHNob3VsZCBzZW5kIHNvbWUgcGF0Y2hlcyB0
byB0aGUgbGlzdC4KPiBNYXliZSBvbmUgcGF0Y2ggdG8gbWFrZSBidWRkeSB0aGUgZGVmYXVsdCBh
bmQgb25lIHRvIGNoYW5nZSB0aGUKPiBkZXNjcmlwdGlvbiBvZiB0aGUgInBlcmYiIGxvY2t1cCBk
ZXRlY3RvciBzYXkgdGhhdCBpdHMgdXNhZ2UgaXMKPiBkaXNjb3VyYWdlZCwgdGhhdCBpdCBtaWdo
dCBiZSByZW1vdmVkLCB0aGF0IHBlb3BsZSBzaG91bGQgdXNlIHRoZQo+ICJidWRkeSIgZGV0ZWN0
b3IgaW5zdGVhZCwgYW5kIHRoYXQgaWYgdGhlcmUncyBhIHJlYXNvbiBzb21lb25lIG5lZWRzCj4g
dGhlICJwZXJmIiBkZXRlY3RvciBpbnN0ZWFkIG9mIHRoZSBidWRkeSBvbmUgdGhlbiB0aGV5IHNo
b3VsZCBtYWtlCj4gc29tZSBsb3VkIG5vaXNlcy4KPgo+IFlvdSdkIHdhbnQgdG8gQ0MgZm9sa3Mg
d2hvIHdlcmUgaW52b2x2ZWQgaW4gcmVjZW50IHdhdGNoZG9nIGNoYW5nZXMKPiBhbmQgbWFrZSBz
dXJlIHRvIENDIEFuZHJldyAoYWtwbSkuIElmIGZvbGtzIHJlYWN0IHBvc2l0aXZlIGFuZCBBbmRy
ZXcKPiBhZ3JlZXMgdGhlbiBoZSdsbCBsaWtlbHkgbGFuZCB0aGUgdGhlIHBhdGNoZXMgYW5kIHdl
J2xsIGhhdmUgbWFkZQo+IGZvcndhcmQgcHJvZ3Jlc3MuIDotKQoKKzEKClRoZXJlIGFyZSBhbHNv
IHRoaW5ncyBsaWtlIC9wcm9jL3N5cy9rZXJuZWwvbm1pX3dhdGNoZG9nIGJlaW5nIHVzZWQgdG8K
ZW5hYmxlL2Rpc2FibGUgdGhlIGhhcmQgbG9va3VwIGRldGVjdG9yLiBJZiB3ZSBjb3VsZCBtb3Zl
IHRoYXQgdG8gYQp1bmlxdWUgZmlsZSBzbyB0aGF0IHBlcmYgaXMgbGVzcyBjb25mdXNlZCBpbiBw
bGFjZXMgbGlrZToKaHR0cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL3Rvb2xzL3BlcmYvdXRpbC91dGlsLmMjbjcw
CmllLiBwZXJmIHNob3VsZG4ndCB3YXJuIGFib3V0IHRoZSBOTUkgd2F0Y2hkb2cgYmVpbmcgZW5h
YmxlZCBhbmQKdGFraW5nIGEgcGVyZiBldmVudCB3aGVuIGl0IGRvZXNuJ3QuCgpUaGFua3MsCklh
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
