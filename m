Return-Path: <SRS0=OTun=AM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435DCC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 10:42:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FB1020722
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 10:42:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hj81zRIj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1PhMJHd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FB1020722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tPhVZ2mIFhcYl8FfrGkTTw/CJg3WDWSuxHtBKGDyjXI=; b=Hj81zRIjkHwcUZm/yA931pmjP
	gHqXtSQ/bMvKKnGjrv2TUQeHledHoHsdpJq6Om1hwjhESVkhF0Oq/rOEx8P/r2OZaq2lBx9J6Y9pz
	6FuWkR6zx1LNh1uuWzKsX5TbWBPIwzwnsVLkRL2UbMFsaDFErvyvsXyZeW+jtkQSF2Ez08/8CHmTB
	wfbfdz0xvia9w0vlJRNgxC+/aL6fbL96JkKX4yAktl2lcO4BNIruqKZ4GgAbmP0QrPk5zLbtbvy5a
	AIoRNm+9Npvpv91bs3EtxoEFsZn3nHOH4VxUKfrQfBa/dm62h/qAhQWTM8sNH0nSfjFJ1ZdiOueCd
	5Lk5Q1wRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqaCC-0007L0-Dn; Wed, 01 Jul 2020 10:42:28 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqaCA-0007KZ-4U
 for linux-riscv@lists.infradead.org; Wed, 01 Jul 2020 10:42:26 +0000
Received: by mail-wm1-x342.google.com with SMTP id l17so21880852wmj.0
 for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2020 03:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iAWo4dxgN7pY4QHXCCZ7PZUH5Z7OXwv+NKwzVc3uYTY=;
 b=n1PhMJHd7gg872QGiVREtj7Wpce4shBwBL4if9UtRXsn49Gu9Sho/dQlyLF0HtHXPJ
 gjp+2Q9Gf/5z8+qlxOWim4Fwo/2IUgOoIKMWcqTL+aqCKz/szbPB/F2lSQdV3su9cGJC
 NWu0qtRgmyWwFEJFLCxseTdim5r2HpCp/yap3Qz40ZyR+/2hWd83YTAS0fjd2//xjjrF
 4ehyPVlb5qZVKXYHEo1dM5KKuYB2iirdkoQA73u3Xf297MbRUKrbwQ7fCD1jAm7WpTuf
 b9dFaECLZxQrfFN0F4eEZLDvlQsyNFjqXGgpl0fnCV6IpYcVKmQJsGwiM8v3XelGZwV3
 VA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iAWo4dxgN7pY4QHXCCZ7PZUH5Z7OXwv+NKwzVc3uYTY=;
 b=UZBI2V7VSakprsrCHYmUA4OjBT66fACITqjZgXi0VUkjfQC6VnibU/c4BhoZQrZT2T
 IG1SH+JMKEzPNLLO7TdylP5Bl1yshgS4ibpMVqCmvH7zx6tpBNHkH5rd6O2RgoInCu20
 ciKLID6Pfm+KxwAQzFQD86g6GOPKkkd3pkrYdF+BMLG84ORNbRHcLS7D08LiUlMWZH+W
 rkkAwnDlAxpYEfFka1nu38nissSwuEsJUh40yArinjOKVpMsF+AWYJAXhS4nxXfuR4kl
 bHag1BghCM+5h4NcXhORm/eNp8DqEcUWRiAvDB43qsbH4ZN5FZFqXQefCsEk6J13w+oy
 E6xQ==
X-Gm-Message-State: AOAM533fwWmMwG0FODmNtadv1iPcZ1dvH09zNnte94rIJzh3idB9gPbA
 Ot4MP8+tKtYIXG6N29E+SEwcO8QLl2b5oM51R0Y=
X-Google-Smtp-Source: ABdhPJxHb7Cqzl/XVcc9ZPR15RgMheaPu5NUE6rCyrAazRA8GkjJs0pAamtIZo3ycbi2mTxyxTTGv7RWsK3S3tUephc=
X-Received: by 2002:a1c:3c82:: with SMTP id
 j124mr27833080wma.155.1593600143683; 
 Wed, 01 Jul 2020 03:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmtuysn227.fsf@suse.de>
 <CACT4Y+Y8=0m+Xku_+kQYuiiABgFUDzHBEqUK_FNGs8=f9NGZng@mail.gmail.com>
In-Reply-To: <CACT4Y+Y8=0m+Xku_+kQYuiiABgFUDzHBEqUK_FNGs8=f9NGZng@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Wed, 1 Jul 2020 12:42:12 +0200
Message-ID: <CAJ+HfNgzyOfr7gXeg+weLf64HHOWmm2Wug5Oc1OrOJN9ZcR5bQ@mail.gmail.com>
Subject: Re: syzkaller on risc-v
To: Dmitry Vyukov <dvyukov@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_064226_192339_08D6D120 
X-CRM114-Status: GOOD (  14.99  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 Atish Patra <atish.patra@wdc.com>, syzkaller <syzkaller@googlegroups.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAzMCBKdW4gMjAyMCBhdCAxNToyNywgRG1pdHJ5IFZ5dWtvdiA8ZHZ5dWtvdkBnb29n
bGUuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDMwLCAyMDIwIGF0IDM6MTQgUE0gQW5kcmVh
cyBTY2h3YWIgPHNjaHdhYkBzdXNlLmRlPiB3cm90ZToKPiA+Cj4gPiBPbiBKdW4gMzAgMjAyMCwg
RG1pdHJ5IFZ5dWtvdiB3cm90ZToKPiA+Cj4gPiA+IEtBU0FOIHdvdWxkIGJlIGEgcHJlcmVxdWlz
aXRlIGZvciB0ZXN0aW5nIHJpc2MtdiBvbiBzeXpib3QuCj4gPgo+ID4gWW91IG5lZWQgdG8gaW1w
bGVtZW50IHRoZSBHQ0Mgc3VwcG9ydCBmaXJzdC4KPgo+IEludGVyZXN0aW5nLiBCasO2cm4gY2xh
aW1lZCBLQVNBTiB3b3JrcyBhbHJlYWR5LiAgQW5kIHRoZXJlIGlzOgo+Cj4gY29tbWl0IDhhZDhi
NzI3MjFkMGYwN2ZhMDJkYmU3MWY5MDE3NDNmOWM3MWM4ZTYKPiBBdXRob3I6IE5pY2sgSHUKPiBE
YXRlOiAgIE1vbiBKYW4gNiAxMDozODozMiAyMDIwIC0wODAwCj4gICAgIHJpc2N2OiBBZGQgS0FT
QU4gc3VwcG9ydAo+Cj4gSXMgdGhlcmUgYW55IGtub3duIGlzc3VlIHdpdGggZ2NjPwo+IERpZCBh
bnlvbmUgdHJ5IGNsYW5nPyBBZGRyZXNzU2FuaXRpemVyIHBhc3MgaW4gY2xhbmcgaXMKPiBhcmNo
LWluZGVwZW5kZW50LiBOb3Qgc3VyZSBhYm91dCBnY2MuLi4gaXQgbG9va2VkIG1vc3RseQo+IGFy
Y2gtaW5kZXBlbmRlbnQuCgpXZWlyZC4gRGlkIGEgcXVpY2sgYmlzZWN0IChqdXN0ICJkb2VzIGl0
IGJvb3Qgd2l0aCBLQVNBTiBvciBub3QiCnRlc3QpLCBhbmQgdGhpcyBmZWxsIG91dDoKCi0tCmVm
Y2ExMzk4OTI1MGMzZWRlYmFmOGZjYWE4Y2E3Yzk2NjczOWM2NWEgaXMgdGhlIGZpcnN0IGJhZCBj
b21taXQKY29tbWl0IGVmY2ExMzk4OTI1MGMzZWRlYmFmOGZjYWE4Y2E3Yzk2NjczOWM2NWEKQXV0
aG9yOiBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2RjLmNvbT4KRGF0ZTogICBUdWUgTWFyIDE3
IDE4OjExOjM3IDIwMjAgLTA3MDAKCiAgICBSSVNDLVY6IEludHJvZHVjZSBhIG5ldyBjb25maWcg
Zm9yIFNCSSB2MC4xCgogICAgV2Ugbm93IGhhdmUgU0JJIHYwLjIgd2hpY2ggaXMgbW9yZSBzY2Fs
YWJsZSBhbmQgZXh0ZW5kYWJsZSB0byBoYW5kbGUKICAgIGZ1dHVyZSBuZWVkcyBmb3IgUklTQy1W
IHN1cGVydmlzb3IgaW50ZXJmYWNlcy4KCiAgICBJbnRyb2R1Y2UgYSBuZXcgY29uZmlnIGFuZCBt
b3ZlIGFsbCBTQkkgdjAuMSBjb2RlIHVuZGVyIHRoYXQgY29uZmlnLgogICAgVGhpcyBhbGxvd3Mg
dG8gaW1wbGVtZW50IHRoZSBuZXcgcmVwbGFjZW1lbnQgU0JJIGV4dGVuc2lvbnMgY2xlYW5seQog
ICAgYW5kIHJlbW92ZSB2MC4xIGV4dGVuc2lvbnMgZWFzaWx5IGluIGZ1dHVyZS4gQ3VycmVudGx5
LCB0aGUgY29uZmlnCiAgICBpcyBlbmFibGVkIGJ5IGRlZmF1bHQuIE9uY2UgYWxsIE0tbW9kZSBz
b2Z0d2FyZSwgd2l0aCB2MC4xLCBpcyBubwogICAgbG9uZ2VyIGluIHVzZSwgdGhpcyBjb25maWcg
b3B0aW9uIGFuZCBhbGwgcmVsZXZhbnQgY29kZSBjYW4gYmUgZWFzaWx5CiAgICByZW1vdmVkLgoK
ICAgIFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPgogICAg
UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CiAgICBTaWduZWQt
b2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgoKIGFyY2gv
cmlzY3YvS2NvbmZpZyAgICAgICAgICAgfCAgIDcgKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3NiaS5oIHwgICAyICsKIGFyY2gvcmlzY3Yva2VybmVsL3NiaS5jICAgICAgfCAxMzIgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAx
MTggaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCi0tCgpJJ2xsIGRpZyBhIGJpdCBtb3Jl
LgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
