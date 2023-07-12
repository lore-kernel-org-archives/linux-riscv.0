Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CB5EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 09:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/uq+1+nqN9kUZcp2p2UJoYOgcpjpXolxRXLz6kv2Ykc=; b=anxqAj96K2i+O2
	MZSdI7FlDThrdcoNNnG3n6M9qhyC4y8BCjd+OF2qYP+wcWzV09R8iJTM9BhL0hF57LKa+k+iRtXc5
	pxjOiYz2LpYl0cLSGUkp9xrWhKe//KYkWWHg7PSEmW12QuI3ehDGVGCOoi8Un86Sudle5+RpwQPKl
	RysxdIpvo3z5A2o7x0RbPks5o2JAmPFRL0plJaftieLDHg8HH1zgEQnInw18wQkFyC76eVVwJGb4U
	qjGjBMGumoChC7D/k4ZKxmh1SVXkyL/5cwOGkqYnnMfA2KrfPdKOEUHOJLmHsKTW0g5sDapT8oX3Y
	MqTITuTYE/HiaFNLg7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJWbr-00H7Vv-02;
	Wed, 12 Jul 2023 09:58:11 +0000
Received: from mail-yw1-f172.google.com ([209.85.128.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJWbm-00H7T4-08
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 09:58:08 +0000
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-577ddda6ab1so8633377b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 02:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689155884; x=1691747884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6MzudJP2Fu/sGdEnelPPluUqTi475Db7xeaDmuW9Sk=;
        b=abDNINn3iKQxjnzoCmK0jRwbVx0nWG4c6tJnNJ7H8jNAQEMtuZLBViaK4gikCiV7EV
         LQyHEfvQb0jt0Jm4Kd8kyQtJUch57ZlWDslhqipe3V5hE7M6VMnf7cGD+7jctifMNOyt
         CMCvP8s38QvsDZd/SvmE+Il3IQoU+uq1p1Wvu3Qu6z31To5/kF5dk98T4et/51YR715x
         Pj3HPHLKthkO27x8tt4hpXGq+BpDVY8zzcuAt1XljGHSm9vnA7IQ3qMw/L7kt3jf86Ys
         3TXW3RaEDwq1Szq8MJRm1sqcuTSkifbp6qh3TUTmdJJ6a88OxZDGwjQrM9IhuAyIe3x0
         ILQA==
X-Gm-Message-State: ABy/qLbm6knytBraRVT1/jqQWMssaLDxSHU3g2G57unDfoHtuREuqceN
	lXYcOxH5cXxO2xK7jPJ/O+Jkw44FU+jOFQ==
X-Google-Smtp-Source: APBJJlHuj5ApyP9Xub4gwpYsOGdnbQ3EQ1byPQmV/8CahKXOx6I0Qg+2xLqZPm0oiH4ldQZHaS3hOQ==
X-Received: by 2002:a0d:d409:0:b0:56c:e260:e2d5 with SMTP id w9-20020a0dd409000000b0056ce260e2d5mr1684934ywd.7.1689155884438;
        Wed, 12 Jul 2023 02:58:04 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id q187-20020a8175c4000000b00577374e8abasm1067349ywc.87.2023.07.12.02.58.03
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 02:58:03 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-ca9804dc6e4so198577276.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 02:58:03 -0700 (PDT)
X-Received: by 2002:a25:ae5d:0:b0:bd6:a97e:3597 with SMTP id
 g29-20020a25ae5d000000b00bd6a97e3597mr1632945ybe.30.1689155883328; Wed, 12
 Jul 2023 02:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230511181931.869812-1-tj@kernel.org> <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org> <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org> <ZK30CR196rs-OWLq@slm.duckdns.org>
In-Reply-To: <ZK30CR196rs-OWLq@slm.duckdns.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jul 2023 11:57:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCXPi+aS-7bR3qRetKF9T3W9jk_HKjvaXmfHv5SEeuFg@mail.gmail.com>
Message-ID: <CAMuHMdUCXPi+aS-7bR3qRetKF9T3W9jk_HKjvaXmfHv5SEeuFg@mail.gmail.com>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE mechanism)
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, 
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-team@meta.com, 
	Linux PM list <linux-pm@vger.kernel.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, linux-rtc@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, netdev <netdev@vger.kernel.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>, 
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_025806_076717_1D8FD848 
X-CRM114-Status: GOOD (  21.50  )
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

SGkgVGVqdW4sCgpPbiBXZWQsIEp1bCAxMiwgMjAyMyBhdCAyOjMw4oCvQU0gVGVqdW4gSGVvIDx0
akBrZXJuZWwub3JnPiB3cm90ZToKPiBPbiBUdWUsIEp1bCAxMSwgMjAyMyBhdCAxMTozOToxN0FN
IC0xMDAwLCBUZWp1biBIZW8gd3JvdGU6Cj4gPiBPbiBUdWUsIEp1bCAxMSwgMjAyMyBhdCAwNDow
NjoyMlBNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgSnVs
IDExLCAyMDIzIGF0IDM6NTXigK9QTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPiB3cm90ZToKPiAuLi4KPiA+ID4gd29ya3F1ZXVlOiBuZWlnaF9tYW5hZ2VkX3dvcmsg
aG9nZ2VkIENQVSBmb3IgPjEwMDAwdXMgNCB0aW1lcywKPiA+ID4gY29uc2lkZXIgc3dpdGNoaW5n
IHRvIFdRX1VOQk9VTkQKPiA+Cj4gPiBJIHdvbmRlciB3aGV0aGVyIHRoZSByaWdodCB0aGluZyB0
byBkbyBoZXJlIGlzIHNvbWVob3cgc2NhbGluZyB0aGUgdGhyZXNob2xkCj4gPiBhY2NvcmRpbmcg
dG8gdGhlIHJlbGF0aXZlIHByb2Nlc3NpbmcgcG93ZXIuIEl0J3MgZGlmZmljdWx0IHRvIGNvbWUg
dXAgd2l0aCBhCj4gPiB0aHJlc2hvbGQgd2hpY2ggd29ya3Mgd2VsbCBhY3Jvc3MgdGhlIGxhdGVz
dCAmIGZhc3Rlc3QgYW5kIHJlYWxseSB0aW55IENQVXMuCj4gPiBJJ2xsIHRoaW5rIGFib3V0IGl0
IHNvbWUgbW9yZSBidXQgaWYgeW91IGhhdmUgc29tZSBpZGVhcywgcGxlYXNlIGZlZWwgZnJlZQo+
ID4gdG8gc3VnZ2VzdC4KPgo+IEdlZXJ0LCBkbyB5b3UgbWluZCBwb3N0aW5nIHRoZSBmdWxsIGtl
cm5lbCBsb2dzIGZvciB0aGUgYWZmZWN0ZWQgbWFjaGluZXM/CgpodHRwczovL2RyaXZlLmdvb2ds
ZS5jb20vZmlsZS9kLzF0b0RzN3VnWkoyZVhhdHBkdnlTWTR5eFNzTmFtOXhBQwppcyBhbiBhcmNo
aXZlIHdpdGggYm9vdCBhbmQgczJyYW0gbG9ncy4gIE5vdGUgdGhhdCBteSBrZXJuZWxzIGRvIGNv
bnRhaW4KbG9jYWwgZGVidWcgY29kZSwgYW5kIG1heSBiZSBub2lzeS4KCkdye29ldGplLGVldGlu
Z31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02
OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
