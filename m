Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8D3E784B2
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avW0Op9AgFzbUKUBaj0sm2RzymTLp3cC6Kiheyov7rY=; b=cUkGlo/ndxjWcK
	CzT8q282b7poL0jeOgDe8689aOQp1OFCmMzfFq6S+cKFxmNbQEREbFq6ziTyKpoq8xxcvuktn3YbX
	gACSY4JetERv2p0PayTdvXISooEaaPjtmNCGJm37El9MEaeoU+Ymz0UEEdi+Ai7grqWMJEpkdnHuA
	wSjgFsHcQmwsy2tR5+mOei7T1YrI1ADBOaHooVX95k0M+DUvi6HV50mUg+k0jYtiiJ9I35jjCe/t8
	sUQfvxiFFou2keG8bL94++T4x7itA77iiqj+qPNRhWTmnQRD6QV6sELBfek97Ice6IXEvRtPKBbFk
	mRmLOHcxRsXlj3KtAfNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnG2N-00CJnU-0q;
	Mon, 02 Oct 2023 10:20:27 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnG2K-00CJmV-0w
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 10:20:26 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c6185cafb3so216585ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 03:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696242022; x=1696846822; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wfxsi3rUolUe3A835MzACItI/kOFGspetH8wi1i5DIY=;
        b=wc357X0Zyku7wPRVE3RqE6unHCPxzYbT3rIXmKlJpYLBneDOAtKyVG4/rzdDzG9N4V
         4RPMsVWtRk5A0vir8TJMGbR0ep9BMfPw0R60K6rcs5Hv366Qdamo6ZF6CqihSq8qP3bz
         lxm3Qvc3+IJkzIDbqOYriqt+1FMcNESfr2hrPuDwaAmOmiXho8vwCM60asrkaWwReo0r
         ZY4UKVZ1EUlvmndnMDoY7aWeSD5oUs/s9EuxgS5LwleWxsp+fFXjnDcvSOWdFzl0Z4QF
         44fA39QOuldtpkTihc7k4XhEs4/pKE6uMZl8Z12IOOwT0JdWTFMXlIJFaa6BvI3Hzdcg
         XtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696242022; x=1696846822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wfxsi3rUolUe3A835MzACItI/kOFGspetH8wi1i5DIY=;
        b=r/Q34MC6e8qtHfMd3zxAnKjcddAdZD3W5lIlmAyx0NWho72h6xWzNHtjXSXuJl9JMc
         ahk1qh0R7UMcI/y0J1EbD6z5JLfsly1rpILXRkE1MmAD4L//IDmzMXFi7LOmn3SXVF/W
         38WxEryhaK4wzgNsbxrLRYJHjAYskWk8DIIJ9max0/IEbli0RFzOSnAD0bPz9OSKF2vb
         6SCtfMaTHy2b6DNTIl6WHSNQNlyab4PVXJIE39108dSerIrv1LmgGiARXPaRCbxvOqvy
         n35oeie2i/wdReUCSYQvlw6jc8YlAgx25e0cqRZ/wC9LEBhiOdxnRVxd9aL4wCa5bWD9
         jb/w==
X-Gm-Message-State: AOJu0YwplpZZyvabBWnM5iOJeC7sVODAl9pgRJxpsiWoZLGfBcfTUUm+
	1ROuORUsF6sSpFLSiCz5izkA/+d6WUG0+5iXMVOH2w==
X-Google-Smtp-Source: AGHT+IHchCZRUpV6NwJgG6ccmDwgmfcXhM/2BrSTDVL+h1R5tsrVPd96BpWJkqeGytkLXa67Y+jBbWituyuUs4ujeqc=
X-Received: by 2002:a17:902:e549:b0:1c3:90e3:a75b with SMTP id
 n9-20020a170902e54900b001c390e3a75bmr169411plf.15.1696242022265; Mon, 02 Oct
 2023 03:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <2023092939-lagoon-punctual-e312@gregkh> <20230929230534.45142-2-twuufnxlz@gmail.com>
 <2023093049-next-confusion-b812@gregkh> <20230930-quotable-feeble-2bd6513ca643@spud>
In-Reply-To: <20230930-quotable-feeble-2bd6513ca643@spud>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 2 Oct 2023 12:20:10 +0200
Message-ID: <CANp29Y79=Y76i72wHWfOJqU1tg8Z6vpbmwBRr=wcet7t5xdX5A@mail.gmail.com>
Subject: Re: [PATCH] Test for riscv fixes
To: Conor Dooley <conor@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Edward AD <twuufnxlz@gmail.com>, alex@ghiti.fr, 
	alexghiti@rivosinc.com, aou@eecs.berkeley.edu, guoren@kernel.org, 
	jirislaby@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	liushixin2@huawei.com, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_032024_346380_CBB05A6D 
X-CRM114-Status: GOOD (  14.09  )
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

T24gU2F0LCBTZXAgMzAsIDIwMjMgYXQgMTA6MjTigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBTZXAgMzAsIDIwMjMgYXQgMDg6MTM6NTZBTSAr
MDIwMCwgR3JlZyBLSCB3cm90ZToKPiA+IE9uIFNhdCwgU2VwIDMwLCAyMDIzIGF0IDA3OjA1OjM1
QU0gKzA4MDAsIEVkd2FyZCBBRCB3cm90ZToKPiA+ID4gT24gRnJpLCAyOSBTZXAgMjAyMyAwODow
NDo1NyArMDIwMCBHcmVnIEtIIHdyb3RlOgo+ID4gPiA+IFdoZXJlIGFyZSB5b3UgZ2V0dGluZyB5
b3VyIG9kZCBjYzogbGlzdCBmcm9tPyAgVGhpcyBoYXMgbm90aGluZyB0byBkbwo+ID4gPiA+IHdp
dGggc2VyaWFsIGRyaXZlcnMuLi4KPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzAw
MDAwMDAwMDAwMDAxNzBkZjA2MDVjY2Y5MWFAZ29vZ2xlLmNvbS9yYXcKPiA+Cj4gPiBJIGRvIG5v
dCB1bmRlcnN0YW5kIHRoaXMgYW5zd2VyLgo+Cj4gQUlVSSwgdGhlIG9yaWdpbmFsIHJlcG9ydCBm
cm9tIHN5emJvdCAiYmxhbWVkIiB0aGUgc2VyaWFsIG1haW50YWluZXJzLgo+IE5vdCB0b28gc3Vy
ZSBob3cgaXQgZGV0ZXJtaW5lZCB0aGF0IHRob3VnaCwgZ2l2ZW4gdGhlIGNvbnRlbnRzLgo+Cgpi
bGFtZSBpcyB0b28gc3Ryb25nIGEgd29yZCBmb3IgdGhhdCBhdXRvLWluZmVycmVkIGhpbnQgOikK
ClllcywgdGhlIGFjdHVhbCBwcm9ibGVtIHdhcyBpbiBhIHRvdGFsbHkgZGlmZmVyZW50IHBsYWNl
LCBidXQgRldJVwpoZXJlJ3MgaG93IGl0IGhhcHBlbmVkOgoKU3RhdGlzdGljYWxseSwgc3RhY2t0
cmFjZS5jIGFuZCBhIG51bWJlciBvZiBvdGhlciBnZW5lcmljIGxvY2F0aW9ucwphcmUgcmF0aGVy
IHVubGlrZWx5IHRvIGFjdHVhbGx5IGNvbnRhaW4gdGhlIGJ1ZyAodGhleSBjYW4sIGJ1dCB0aGUK
Y2hhbmNlcyBhcmUgdGhhdCBpdCdzIGRlZXBlciBpbiB0aGUgY2FsbCBzdGFjayksIHNvIHN5emJv
dCwgd2hpbGUKdHJhdmVyc2luZyB0aGUgc3RhY2sgdHJhY2UsIHNraXBwZWQgYWxsIGZyYW1lcyB1
bnRpbAoKWzxmZmZmZmZmZjgwZmEwYzdlPl0gZm5fc2hvd19zdGF0ZSsweDFhLzB4MjIgZHJpdmVy
cy90dHkvdnQva2V5Ym9hcmQuYzo2MTQKWzxmZmZmZmZmZjgwZmExMTUyPl0ga19zcGVjIGRyaXZl
cnMvdHR5L3Z0L2tleWJvYXJkLmM6NjY3IFtpbmxpbmVdCls8ZmZmZmZmZmY4MGZhMTE1Mj5dIGtf
c3BlYysweGNlLzB4MTAyIGRyaXZlcnMvdHR5L3Z0L2tleWJvYXJkLmM6NjU2Cls8ZmZmZmZmZmY4
MGZhMzA2Yz5dIGtiZF9rZXljb2RlIGRyaXZlcnMvdHR5L3Z0L2tleWJvYXJkLmM6MTUyNCBbaW5s
aW5lXQpbPGZmZmZmZmZmODBmYTMwNmM+XSBrYmRfZXZlbnQrMHg1ZmEvMHhhNWUgZHJpdmVycy90
dHkvdnQva2V5Ym9hcmQuYzoxNTQzCgpQZXIgTUFJTlRBSU5FUlMsIHRoZXNlIGxvY2F0aW9ucyBi
ZWxvbmdlZCB0byAiVFRZIExBWUVSIEFORCBTRVJJQUwKRFJJVkVSUyIuIFRoZXJlZm9yZSBzZXJp
YWwgaW4gQ2MuCgpUaGUgYXV0b21hdGlvbiBhY3R1YWxseSBhdHRyaWJ1dGVzIGEgbG90IG9mIHJl
cG9ydHMgY29ycmVjdGx5LCBidXQsCnVuZm9ydHVuYXRlbHksIHRoZXJlIGFyZSBhbHNvIHRyaWNr
eSBjYXNlcyBsaWtlIHRoaXMuCgotLSAKQWxla3NhbmRyCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
