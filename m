Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A67FC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 19:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ruyTpZvhs0+RSaLrXvZvLIEjgiOmvnItCXKKk4vkdl8=; b=zBNisfhDuiVmfQ
	K9xzIrXhBB1QgVWBIQe+ObvdaVcdtlHIVucOw5MfznD5sePUnHVa9YoCRLtD/ikBstaheg3UBHO9I
	28f6ay6bFAPSptOwdJ4QCQEzeYbM+fVK4Pwn9IQupMTVdXVsZ3Nv94KXpSr9xLH2hbFKeeT6czj9J
	tZPxt9mklb1kr7/LubMaif3q3PrC65v2BFKzkJ5Bx8hBzSn7e9dNpktSrc8yRobYQM6GF6CYzC635
	dFdFm+sYxPoHXPYRnNHeZ/z2tzdbP31Vy0ExBhDvl1HmbA6bEHaXzqSADMYOHo/GWqHUWLmdo0PuA
	kiXOjPEkDKoTpo7QGPPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAGGm-006wVe-0N; Wed, 19 Jan 2022 19:05:20 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAGGi-006wUe-Pg
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 19:05:18 +0000
Received: by mail-wm1-x32f.google.com with SMTP id c66so7076296wma.5
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 11:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=DWOJ/x2qrYLClfcPkF95pUctzsp1LecGRHAyU49C+UA=;
 b=YK6o8hD5gFGRAp8tp4YVQydGmIMHSwCHo+EwL5lNkcog2WDKT/73n765xQdnecSYKf
 ydcDvZZpXdBNdRB7+pOXnWXKLQlEpPpd0H1TA+eR74v5jFUQGhWVRhaf5m/pzUflgLjq
 NVlH3Eea3+IZPtdPK/jGlMcE+c5LYQsjPOE0KrjIoUJc+r0i6d+dvsxQvgnTgbDsJnqs
 r5Yz47O5inARvd25H8B6EXPIOogkmFNtHCIFbUZwNf/xJoV1oinP8YZx7oKSspS0J3aW
 eFzytT/xM+nL7lUP2B3Rgsu7Iq/bc65yywCyb6xstCsG+TxXro4RZumdwsJpgEHgeN8q
 0+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=DWOJ/x2qrYLClfcPkF95pUctzsp1LecGRHAyU49C+UA=;
 b=2UxnovTNVSaR3jDKzQCs53mCCYGOFviKtFnF/r/I/e39K5Nb76k63bePEBQ+/3TGWb
 0c8lwgXZZ1s2ToubMKq3WGDYKtcwXz6VFJwJhb8HDrx92pGXHkQx8OwouXZxVxGtWs14
 IoN0ImhgGJfyyyJAy6I6sVR/3ACQ9PQyxqIm5G7FAWZZXqM2qIxouoqaTnwSImot7djs
 lSKZGpSPP9j+m/7xxYNKyfyZPdFYzoQn6ZuOwKZf4dWzwHLflI6PEwKUGZ4CVZnT/8QM
 JG+moYgIxbkRPCNsN1EC6mXdCsuWAGI6+q93lTn2s9OR3d4vuDH9kgglKihpIwFfzKgv
 7Lpg==
X-Gm-Message-State: AOAM533AiIe1TQM9sJ+SZJEtx5wIMoHqF7XBK2g/kQUz1iDx/JRkqR/R
 NDTOvYVytPwq4oECs0jmLk7QQQ==
X-Google-Smtp-Source: ABdhPJy7WMRSFCbTTVL097hhPPluIeFYXq1Tf/b63unQ25AnpQTFmG0xnV5NAe7lOXBhrq+T/8X9Sg==
X-Received: by 2002:a05:600c:4f8c:: with SMTP id
 n12mr4976974wmq.108.1642619114821; 
 Wed, 19 Jan 2022 11:05:14 -0800 (PST)
Received: from smtpclient.apple (global-5-142.nat-2.net.cam.ac.uk.
 [131.111.5.142])
 by smtp.gmail.com with ESMTPSA id p4sm856793wrr.4.2022.01.19.11.05.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jan 2022 11:05:14 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] riscv: eliminate unreliable __builtin_frame_address(1)
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <87v8yg6lhf.fsf@igel.home>
Date: Wed, 19 Jan 2022 19:05:13 +0000
Cc: Changbin Du <changbin.du@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-kernel@vger.kernel.org
Message-Id: <AAAA7852-EBCA-47A3-B74E-A425023468C6@jrtc27.com>
References: <20220117154433.3124-1-changbin.du@gmail.com>
 <C2470F2D-9E45-49D7-A03B-E6A7BB4B9738@jrtc27.com> <87v8yg6lhf.fsf@igel.home>
To: Andreas Schwab <schwab@linux-m68k.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_110516_892523_5954E0C4 
X-CRM114-Status: GOOD (  11.35  )
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

T24gMTkgSmFuIDIwMjIsIGF0IDEwOjU4LCBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQGxpbnV4LW02
OGsub3JnPiB3cm90ZToKPiAKPiBPbiBKYW4gMTcgMjAyMiwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6
Cj4gCj4+IFllcywgdGhpcyBpcyBhIGJ1ZywgdGhhdCBpcyBhbHdheXMgd3JvbmcuIExMVk0gZ2V0
cyB0aGlzIHJpZ2h0Lgo+IAo+IElzIHRoYXQgYW4gQUJJIHJlcXVpcmVtZW50PyAgSW4gY2FzZSBv
ZiBhIGxlYWYgZnVuY3Rpb24sIGdjYyBzYXZlcyB0aGUKPiBjYWxsZXIncyBmcmFtZSBwb2ludGVy
IGluIHRoZSBmaXJzdCBzbG90LCBub3QgdGhlIHNlY29uZCAoaXQgZG9lc24ndAo+IHNhdmUgdGhl
IHJldHVybiBhZGRyZXNzKS4KCkxlYWYgZnVuY3Rpb25zIGJ5IGRlZmluaXRpb24gZG9u4oCZdCBo
YXZlIGNhbGxlZXMgdGhhdCBhcmUgdHJ5aW5nIHRvIHJlYWQKdGhlaXIgZnJhbWUgcG9pbnRlciBz
byBhcmVu4oCZdCByZWxldmFudCBoZXJlLiBUaGUgc3RhY2sgZnJhbWUgbGF5b3V0CmlzbuKAmXQg
c3BlY2lmaWVkIGJ5IHRoZSBBQkksIG9ubHkgdGhhdCB0aGUgaW4tbWVtb3J5IG91dGdvaW5nIGFy
Z3VtZW50cwpiZSBhdCB0aGUgYm90dG9tIHdoZW4gY2FsbGluZyBvdGhlciBmdW5jdGlvbnMuIEhv
d2V2ZXIsIEdDQyBrbm93cyB3aGF0CmxheW91dCBpdCB1c2VzLCBzbyBpdCBzaG91bGQgYmUgY29u
c2lzdGVudCBhbmQgZm9sbG93IHRoYXQgbGF5b3V0IGZvcgp3YWxraW5nIGJhY2sgdXAgZnJhbWVz
LiBFc3BlY2lhbGx5IGZvciBfX2J1aWx0aW5fZnJhbWVfYWRkcmVzcygxKSwgdGhhdApqdXN0IHBl
cnRhaW5zIHRvIHRoZSBjdXJyZW50IGZ1bmN0aW9u4oCZcyBmcmFtZSwgd2hpY2ggaXQgY2xlYXJs
eSBrbm93cwp3aXRob3V0IGEgZG91YnQsIHNvIHRoZXJl4oCZcyBubyByZWFzb24gdG8gZ2V0IHRo
YXQgd3JvbmcuIEFjY2Vzc2luZwowKHMwKSBpcyBqdXN0IHN0cmFpZ2h0IHVwIHdyb25nLCB0aGF0
4oCZcyBhY2Nlc3NpbmcgcGFzdCB0aGUgdG9wIG9mIHRoZQpzdGFjayBmcmFtZSwgd2hpY2ggaXMg
bmV2ZXIgZ29pbmcgdG8gbWFrZSBhbnkgc2Vuc2UuCgpKZXNzCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
