Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A9BD6D22C
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 15:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xw1BZXpTtzwkxNtDsF4LEtVrWFniRFDfTPRi+HyFbPQ=; b=k4hrjMAfePyzHv
	Vvu2yDyriqNnJCHe1Ky16FMnuS63MUu7PBJ2f1Vgov5koXpmtBguJk6tAHaPGtusOyx/6FtHpFUQT
	fObE46peR2FYcenLsWrkWpJMXwsmJZ20EUXSqz2xH/3R8TxoiZ/YN6CZwkY39Y7hAbZtQ7U6GEvSb
	4UN085pfHFnYmUvPuEI5e8g2Pi9ekBbasZVdeWueKN8yM8qWDMUOe2lnvSiRPpcZNRd6mbHjkN+4x
	LAJ5FWpVyZjERd7coVuExgL6dvWVckWPRxZxdqRNqokYpBI5qg8aL5N1wEvv7tlQqMRTrAZXtWlTD
	8h2BuiH2lAP9xCpK8pdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFZW-00000008emY-17RX;
	Thu, 18 Dec 2025 15:05:42 +0000
Received: from mail-oa1-x44.google.com ([2001:4860:4864:20::44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFZT-00000008em0-3oTs
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 15:05:41 +0000
Received: by mail-oa1-x44.google.com with SMTP id 586e51a60fabf-3ec5df386acso560804fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766070338; x=1766675138; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7x1LVvCf3VLvAjtIqXQBbk4xwbIbAqccEsSWEs0YiDA=;
        b=HJFSzEbydpbpgjhC7YhzoZeZGP+OITT6q+c4qz4vqEakF6R3wooC9Emvgig0fA2bhP
         GLrYtS7XHBew+6FW+XGYsW0o75gACv+Xhwo63Ke08ydLaLYSoSOl2CelnwNZ0J4PZcrD
         x889ymcp7Wwbj7akYkoXuTbf3fqCMklXCFG+LeTcMPAB6oUaYtQ8SVH6xPIvdKeHQ8rG
         YCjkBtbnmLDQGWxJmDRq6KwQGC2G07zEnYgGmAB5L0mMRa29EwCBfEPOeteLXHLjmgch
         ULQEjR5nit0I4KdDcuhNmvgUY000H1Pyw6zfbsyjdDS9zw8tmeePLv12vcuLOl9eddHq
         GZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766070338; x=1766675138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7x1LVvCf3VLvAjtIqXQBbk4xwbIbAqccEsSWEs0YiDA=;
        b=oCvUv1ymiKjViT0hlyG6XAso/8+GVoL/IoS0x3ozzxMRtydEBz6gGJeEbs/O5uDEWT
         pq9AKOaMWROzlEIkl2E2+1zULQy1Nvj5kuohMjVSDei/S1QQi0hVTCmHoQXjBrgyoyU9
         W5kWeO1usVW11a658YRWo06/gY+K+KgqhuZWzhdKGQ6DNYLsomM6pqTAqZo3e1PzhKzu
         jlAbeJ83IsUnroRDTRoG1S8R0T5xZorRzBjdacyG8BTjFsVjEBSXS+O8pB78T0VzWbZb
         3YCXxvq7Rsr2qgeY5Y83Swr62v0fENob/BQodQdVuNCCSxWyi2V82n58FmBNfdJS0sOK
         TPwA==
X-Forwarded-Encrypted: i=1; AJvYcCWBSV8RBR3GJZiUi1IhdU/v6Bu5cu1mSE8IyZ5YSbPS0IyJjmeqqgaBNExDwcDYP0yDS5alyc5C39n5LQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCZWj908ZWXrJm//PfrbE1D6D/VWo4JygPyREL7osaRELFKNws
	YnG0bxl0mRYMsF5niJXtLWUBKDB/Mc35CvkgNCCXSU7V95152iqOp5rwuWw66XPe/kCMz4k9PMD
	89BTk4Zm/4YsBmdGzk0/c5dUcnt9aYWs=
X-Gm-Gg: AY/fxX5UMJ09NLBZpnDkBS/2BkwkuoNZNlEA2JE84MDkEMLq/ZfZoBpL2zRX27OAd8U
	yGKAaucSaWFEHuWOJOpzLv6vtbLEjrFuH1MYhM1KEFVQTCRFMj468XPeMIp5N8nFKe9xOJyJQmp
	uUGvJAIVy3dp5eobVhQ3SRApYaSp6xB/F0zq8rb1GqKhzc/MsmzlUrm8FkM9DIvxVT3uKfTtGg/
	H5z/TLoJq5SoOUKo4ID3nIDEfUzNkl4MKxRYWM1vvyJ2fMoP/oMqDc4Ws1hIEZeLAszQ+Q=
X-Google-Smtp-Source: AGHT+IF/fTgkutYeIcFjjXnYQpZJcb84xx01Knr1X9n+e2+wE5pUKMKQXwP4SNGCv9mNmL7FhzoGgDf01xZJLuAW9uk=
X-Received: by 2002:a05:6808:1919:b0:450:4628:e3ce with SMTP id
 5614622812f47-455ac843d39mr8893507b6e.15.1766070334496; Thu, 18 Dec 2025
 07:05:34 -0800 (PST)
MIME-Version: 1.0
References: <20251118123639.688444-1-dongml2@chinatelecom.cn>
 <20251118123639.688444-4-dongml2@chinatelecom.cn> <874ipnkfvt.fsf@igel.home>
In-Reply-To: <874ipnkfvt.fsf@igel.home>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Thu, 18 Dec 2025 23:05:23 +0800
X-Gm-Features: AQt7F2rBCJ5wWtnPg0y__c3D4AxuhAyRjyuKDUvUD5czSDgloXW-454tfs3x8_U
Message-ID: <CADxym3byFuS7c9C17pUc7EE+ipAoQMdJgsBM0wr5+VV5esNw-Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/6] bpf: fix the usage of BPF_TRAMP_F_SKIP_FRAME
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: ast@kernel.org, rostedt@goodmis.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, 
	mhiramat@kernel.org, mark.rutland@arm.com, mathieu.desnoyers@efficios.com, 
	jiang.biao@linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_070539_963255_95B9AC32 
X-CRM114-Status: GOOD (  10.34  )
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

T24gVGh1LCBEZWMgMTgsIDIwMjUgYXQgMTA6NDXigK9QTSBBbmRyZWFzIFNjaHdhYiA8c2Nod2Fi
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IE9uIE5vdiAxOCAyMDI1LCBNZW5nbG9uZyBEb25n
IHdyb3RlOgo+Cj4gPiBTb21lIHBsYWNlcyBjYWxjdWxhdGUgdGhlIG9yaWdpbl9jYWxsIGJ5IGNo
ZWNraW5nIGlmCj4gPiBCUEZfVFJBTVBfRl9TS0lQX0ZSQU1FIGlzIHNldC4gSG93ZXZlciwgaXQg
c2hvdWxkIHVzZQo+ID4gQlBGX1RSQU1QX0ZfT1JJR19TVEFDSyBmb3IgdGhpcyBwcm9wb3NlLiBK
dXN0IGZpeCB0aGVtLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1lbmdsb25nIERvbmcgPGRvbmdt
bDJAY2hpbmF0ZWxlY29tLmNuPgo+ID4gQWNrZWQtYnk6IEFsZXhlaSBTdGFyb3ZvaXRvdiA8YXN0
QGtlcm5lbC5vcmc+Cj4KPiBUaGlzIGJyZWFrcyBSSVNDLVY6CgpJdCdzIHdlaXJkLCBhcyB0aGUg
MiBmbGFncyBzaG91bGQgYmUgc2V0IHRvZ2V0aGVyIGFsbCB0aGUgdGltZQppbiBSSVNDLVYuIFNv
cnJ5IHRoYXQgSSdtIGFscmVhZHkgaW4gYmVkLCBJJ2xsIGNoZWNrIGl0IHRvbW9ycm93Cm1vcm5p
bmcuCgpUaGFua3MhCk1lbmdsb25nIERvbmcKCj4KPiBbICAgIDguNTg0MzgxXVsgICAgVDFdIHN5
c3RlbWRbMV06IGJwZi1yZXN0cmljdC1mczogTFNNIEJQRiBwcm9ncmFtIGF0dGFjaGVkCj4gWyAg
ICA4LjU4ODM1OV1bICAgIFQxXSBJbnN1ZmZpY2llbnQgc3RhY2sgc3BhY2UgdG8gaGFuZGxlIGV4
Y2VwdGlvbiEKPiBbICAgIDguNTg4ODIzXVsgICAgVDFdIFRhc2sgc3RhY2s6ICAgICBbMHhmZjIw
MDAwMDAwMDEwMDAwLi4weGZmMjAwMDAwMDAwMTQwMDBdCj4gWyAgICA4LjU4OTIxOV1bICAgIFQx
XSBPdmVyZmxvdyBzdGFjazogWzB4ZmY2MDAwMDBmZmRhZDA3MC4uMHhmZjYwMDAwMGZmZGFlMDcw
XQo+IFsgICAgOC41OTAxMzNdWyAgICBUMV0gQ1BVOiAxIFVJRDogMCBQSUQ6IDEgQ29tbTogc3lz
dGVtZCBOb3QgdGFpbnRlZCA2LjE4LjAtcmM1KyAjMTUgUFJFRU1QVCh2b2x1bnRhcnkpICBjOTAw
ODgxZWQxYzE5ODhlYzVjZjNlOTE0ZDBlZGViMWI0ZDgzY2EzCj4gWyAgICA4LjU5MDg5OF1bICAg
IFQxXSBIYXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0aW8gcWVtdS9xZW11LCBCSU9TIDIwMjUuMTAg
MTAvMDEvMjAyNQo+IFsgICAgOC41OTE0OTRdWyAgICBUMV0gZXBjIDogY29weV9mcm9tX2tlcm5l
bF9ub2ZhdWx0KzB4YS8weDE5OAo+IFsgICAgOC41OTIyOTJdWyAgICBUMV0gIHJhIDogYnBmX3By
b2JlX3JlYWRfa2VybmVsKzB4MjAvMHg2MAo+IFsgICAgOC41OTI2NThdWyAgICBUMV0gZXBjIDog
ZmZmZmZmZmY4MDJiNzMyYSByYSA6IGZmZmZmZmZmODAxZTYwNzAgc3AgOiBmZjIwMDAwMDAwMDBm
ZmUwCj4gWyAgICA4LjU5MzEyMV1bICAgIFQxXSAgZ3AgOiBmZmZmZmZmZjgyMjYyZWQwIHRwIDog
MDAwMDAwMDAwMDAwMDAwMCB0MCA6IGZmZmZmZmZmODAwMjIzMjAKPiBbICAgIDguNTkzNTY2XVsg
ICAgVDFdICB0MSA6IGZmZmZmZmZmODAxZTYwNTYgdDIgOiAwMDAwMDAwMDAwMDAwMDAwIHMwIDog
ZmYyMDAwMDAwMDAxMDA0MAo+IFsgICAgOC41OTM5OTddWyAgICBUMV0gIHMxIDogMDAwMDAwMDAw
MDAwMDAwOCBhMCA6IGZmMjAwMDAwMDAwMTAwNTAgYTEgOiBmZjYwMDAwMDgzYjNkMzIwCj4gWyAg
ICA4LjU5NDQ0Nl1bICAgIFQxXSAgYTIgOiAwMDAwMDAwMDAwMDAwMDA4IGEzIDogMDAwMDAwMDAw
MDAwMDA5NyBhNCA6IDAwMDAwMDAwMDAwMDAwMDAKPiBbICAgIDguNTk0OTQwXVsgICAgVDFdICBh
NSA6IDAwMDAwMDAwMDAwMDAwMDAgYTYgOiAwMDAwMDAwMDAwMDAwMDIxIGE3IDogMDAwMDAwMDAw
MDAwMDAwMwo+IFsgICAgOC41OTUzOTZdWyAgICBUMV0gIHMyIDogZmYyMDAwMDAwMDAxMDA1MCBz
MyA6IGZmNjAwMDAwODQ1OWZjMTggczQgOiBmZjYwMDAwMDgzYjNkMzQwCj4gWyAgICA4LjU5NTgz
MV1bICAgIFQxXSAgczUgOiBmZjIwMDAwMDAwMDEwMDYwIHM2IDogMDAwMDAwMDAwMDAwMDAwMCBz
NyA6IGZmMjAwMDAwMDAwMTNhYTgKPiBbICAgIDguNTk2MjE1XVsgICAgVDFdICBzOCA6IDAwMDAw
MDAwMDAwMDAwMDAgczkgOiAwMDAwMDAwMDAwMDA4MDAwIHMxMDogMDAwMDAwMDAwMDU4ZGNiMAo+
IFsgICAgOC41OTY2NDFdWyAgICBUMV0gIHMxMTogMDAwMDAwMDAwMDU4ZGNhNyB0MyA6IDAwMDAw
MDAwNjkyNTExNmQgdDQgOiBmZjYwMDAwMDgwOTBmMDI2Cj4gWyAgICA4LjU5NzA2NV1bICAgIFQx
XSAgdDUgOiAwMDAwN2ZmZjliMGNiYWE4IHQ2IDogMDAwMDAwMDAwMDAwMDAxNgo+IFsgICAgOC41
OTczNjNdWyAgICBUMV0gc3RhdHVzOiAwMDAwMDAwMjAwMDAwMTIwIGJhZGFkZHI6IDAwMDAwMDAw
MDAwMDAwMDAgY2F1c2U6IDgwMDAwMDAwMDAwMDAwMDUKPiBbICAgIDguNTk4MDMzXVsgICAgVDFd
IEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBLZXJuZWwgc3RhY2sgb3ZlcmZsb3cKPiBbICAg
IDguNTk4NTk3XVsgICAgVDFdIENQVTogMSBVSUQ6IDAgUElEOiAxIENvbW06IHN5c3RlbWQgTm90
IHRhaW50ZWQgNi4xOC4wLXJjNSsgIzE1IFBSRUVNUFQodm9sdW50YXJ5KSAgYzkwMDg4MWVkMWMx
OTg4ZWM1Y2YzZTkxNGQwZWRlYjFiNGQ4M2NhMwo+IFsgICAgOC41OTkyNDRdWyAgICBUMV0gSGFy
ZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvIHFlbXUvcWVtdSwgQklPUyAyMDI1LjEwIDEwLzAxLzIw
MjUKPiBbICAgIDguNTk5NjU5XVsgICAgVDFdIENhbGwgVHJhY2U6Cj4gWyAgICA4LjYwMDExN11b
ICAgIFQxXSBbPGZmZmZmZmZmODAwMWExZjg+XSBkdW1wX2JhY2t0cmFjZSsweDI4LzB4MzgKPiBb
ICAgIDguNjAwNTE3XVsgICAgVDFdIFs8ZmZmZmZmZmY4MDAwMjUwMj5dIHNob3dfc3RhY2srMHgz
YS8weDUwCj4gWyAgICA4LjYwMDg0NF1bICAgIFQxXSBbPGZmZmZmZmZmODAwMTIyYmU+XSBkdW1w
X3N0YWNrX2x2bCsweDU2LzB4ODAKPiBbICAgIDguNjAxMTc2XVsgICAgVDFdIFs8ZmZmZmZmZmY4
MDAxMjMwMD5dIGR1bXBfc3RhY2srMHgxOC8weDIyCj4gWyAgICA4LjYwMTUxOF1bICAgIFQxXSBb
PGZmZmZmZmZmODAwMDJhYmU+XSB2cGFuaWMrMHhmNi8weDMyOAo+IFsgICAgOC42MDE4MTldWyAg
ICBUMV0gWzxmZmZmZmZmZjgwMDAyZDJlPl0gcGFuaWMrMHgzZS8weDQwCj4gWyAgICA4LjYwMjA4
OF1bICAgIFQxXSBbPGZmZmZmZmZmODAwMTllZjA+XSBoYW5kbGVfYmFkX3N0YWNrKzB4OTgvMHhh
MAo+IFsgICAgOC42MDIzOTVdWyAgICBUMV0gWzxmZmZmZmZmZjgwMWU2MDcwPl0gYnBmX3Byb2Jl
X3JlYWRfa2VybmVsKzB4MjAvMHg2MAo+Cj4gLS0KPiBBbmRyZWFzIFNjaHdhYiwgc2Nod2FiQGxp
bnV4LW02OGsub3JnCj4gR1BHIEtleSBmaW5nZXJwcmludCA9IDc1NzggRUI0NyBENEU1IDRENjkg
MjUxMCAgMjU1MiBERjczIEU3ODAgQTlEQSBBRUMxCj4gIkFuZCBub3cgZm9yIHNvbWV0aGluZyBj
b21wbGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
