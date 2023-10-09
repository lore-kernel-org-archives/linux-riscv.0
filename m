Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F378E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 09:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAvFJQeFW79qhad9JVdx2oVDoQb5koQkAuX56Qr/5IY=; b=vcp+zhP5N3xK4Z
	4onldGFtJtcOxpLdxQhJfAkUbvH+5IrKAgqaqWA+sYYB1eapRJlHcUnjclTP2sddlpXNwff4QHoCQ
	lT3Qob7HizKtLby4sKUNYRFbgDos0F+P6HXQjgb4dcA5b8QpXpP7nasDpqCX/iZDHgRfPUFoUG31g
	2txvOdd61YpV2omkDezUDtdIKtbjpnaIGcXjZ98wujm424Mc9EfiGfDCYiBsUOJrWxCPSakbRNvAK
	1pdlxpRITKE7mvcaSU0YMpufQldbH4eZNx/94uG0X4VHFz0qAgDktsMHeT7yy1xYykjqTvfOWqkEt
	uG19k9aozbHtabGQdAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmvQ-00A8lL-2U;
	Mon, 09 Oct 2023 09:51:44 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmvM-00A8kY-1y
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 09:51:42 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5a7a7e9357eso1010507b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 02:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696845099; x=1697449899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcpLpgd1f1+Ipojmn8r+iB3J9d+aLm5CFxyQ8kyrL4E=;
        b=uaBgPL69+H3vrOouymetw2aFkrI9Z5gzqjUTARaP1eodIV1ka24OZNaF4P4qv+rJrY
         paEvrJiJ3COm8PuKih6I2PZOtMX+9wPG0rScHXf2cdkvivWlcxr/s0YxKTRFQC8AEJ/G
         G8XmAmbADtZlp6RzM+8jsjLSu/BXPgdK5k8uQjPRFOPSTpaXeb9ErxjTsrhR8Ajd3Dge
         0bzBREmnMYNw7eYqSINdgiu9P2zSkoyeq1JDzI5mhck9q0GLVrAXqtVSiRqccLY/7BBt
         xOcoqyFsKVHHz5EzcbSxda+2c0j+vIZZmbuhqD2/fJyd1r++GDq2UjLH/F0smCSGb8uu
         uEaQ==
X-Gm-Message-State: AOJu0YwKB9SP2k+Q77QamtBK8QcFnBCm+4CAY7oZc6Hs1PoX5Xbinacm
	avrLEjlJJx6vap1B1aForo6UYm3AY4IOQw==
X-Google-Smtp-Source: AGHT+IGdORt7Pf59vwaht59LClS46uSIRMP9F+5Gs6OL15nIkax26a5Q/KOyuJyZRAnCbfCd/u4EWQ==
X-Received: by 2002:a81:6d46:0:b0:59b:d7d9:266a with SMTP id i67-20020a816d46000000b0059bd7d9266amr14489439ywc.5.1696845099148;
        Mon, 09 Oct 2023 02:51:39 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id r135-20020a0de88d000000b005a1cc37aff1sm3549574ywe.20.2023.10.09.02.51.38
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 02:51:38 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-579de633419so53145587b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 02:51:38 -0700 (PDT)
X-Received: by 2002:a25:18c1:0:b0:d81:61fd:ef5d with SMTP id
 184-20020a2518c1000000b00d8161fdef5dmr11643273yby.27.1696845098183; Mon, 09
 Oct 2023 02:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de>
 <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
 <20231009091625.GB22463@lst.de> <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
 <20231009094330.GA24836@lst.de>
In-Reply-To: <20231009094330.GA24836@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Oct 2023 11:51:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
Message-ID: <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to CONFIG_DMA_GLOBAL_POOL
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, arm-soc <soc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_025140_658748_FB35314A 
X-CRM114-Status: GOOD (  20.55  )
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

SGkgQ2hyaXN0b3BoLAoKQ0Mgc29jCgpPbiBNb24sIE9jdCA5LCAyMDIzIGF0IDExOjQz4oCvQU0g
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+IE9uIE1vbiwgT2N0IDA5LCAy
MDIzIGF0IDExOjM0OjU1QU0gKzAyMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IFRo
ZSBmaXggeW91IGFyZSByZWZlcnJpbmcgdG9vIGlzIHByb2JhYmx5IGNvbW1pdCBjMWVjNGI0NTBh
YjcyOWUzCj4gPiAoInNvYzogcmVuZXNhczogTWFrZSBBUkNIX1I5QTA3RzA0MyAocmlzY3YgdmVy
c2lvbikgZGVwZW5kCj4gPiBvbiBOT05QT1JUQUJMRSIpIGluIG5leHQtMjAyMzEwMDYgYW5kIGxh
dGVyLiAgSXQgaXMgbm90IHlldCB1cHN0cmVhbS4KPiA+Cj4gPiBTdGlsbCwgaXQgbWVyZWx5IG1h
a2VzIEFSQ0hfUjlBMDdHMDQzICh3aGljaCBzZWxlY3RzIERNQV9HTE9CQUxfUE9PTCkKPiA+IGRl
cGVuZCBvbiBBUkNIX1I5QTA3RzA0My4KPiA+IFJJU0NWX0RNQV9OT05DT0hFUkVOVCBzdGlsbCBz
ZWxlY3RzIERNQV9ESVJFQ1RfUkVNQVAsIHNvIGJvdGggY2FuIGVuZAo+ID4gdXAgYmVpbmcgZW5h
YmxlZC4KPgo+IE9rLCBzbyB3ZSBuZWVkIHRvIGFjdHVhbGx5IGZpeCB0aGlzIHByb3Blcmx5LiAg
TGFkLCBjYW4geW91IHJlc3Bpbgo+IHRoZSBmaXggdG8gbm90IHNlbGVjdCBETUFfRElSRUNUX1JF
TUFQLCBmb3IgQVJDSF9SOUEwN0cwNDM/CgpBUkNIX1I5QTA3RzA0MyBkb2VzIG5vdCBzZWxlY3Qg
RE1BX0RJUkVDVF9SRU1BUCBkaXJlY3RseSwKUklTQ1ZfRE1BX05PTkNPSEVSRU5UIGRvZXMuICBB
bmQgdGhlcmUgYXJlIG90aGVyIHVzZXJzIG9mClJJU0NWX0RNQV9OT05DT0hFUkVOVCAoUklTQ1Zf
SVNBX1pJQ0JPTSBhbmQgRVJSQVRBX1RIRUFEX0NNTykuClNob3VsZCB0aGUgc2VsZWN0aW9uIG9m
IERNQV9ESVJFQ1RfUkVNQVAgbW92ZWQgdG8gdGhlaXIgdXNlcnM/CgpOb3RlIHRoYXQgdGhlIGZp
eCBpcyBhbHJlYWR5IGluIHNvYy9mb3ItbmV4dCwgc28gd2UgbmVlZCBjb29yZGluYXRpb24Kd2l0
aCB0aGUgc29jIHBlb3BsZS4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
