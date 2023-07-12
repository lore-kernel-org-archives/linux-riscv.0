Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8713DEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4BuFxBPkCRvCzJORx0aadUJgpeAYWWb0oA2BEBG9lY=; b=BBz1outxQ5dv1a
	+g5crtMRJU52hRS2ErRRaFB2Lyx8l9Thpz9dK6TDmmCrw0EY2PCXB3T0DZ1nPELU9WqVnlKcvtAFs
	tycADbdbxvPnXqNcU+dQjp7TMVgmXkuuMQC3vET2Aqk1GrIwkeGFmzrugDyV3aoJ3HomFSM0StapO
	/4DH2f9XBI3Rdhiaw05VhVVtm0aC0U1WGkOKYIpJ+DPMsLajUwyJw61JetOMShEjC+1kiZcS71Bdx
	7o04aW8To15UkUDaxmChnl2rykXxa5I43Wai76B9iVsX2mERD709Gz1jpfN2tvF7DMQyYtiGcEPQz
	xtBgDqr3CivcHZb21uig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVlz-00GzPV-2G;
	Wed, 12 Jul 2023 09:04:35 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVlx-00GzOW-01
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 09:04:34 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-57712d00cc1so79498767b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 02:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689152671; x=1691744671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIF186mRaGX5BFXMSlH2BgP4u+RcqYufJt4GrXqOpCU=;
        b=PkYoYuhsqIqfPSvmVHGTx0RoYXlFJvZGKtaiu1RLv1j3DaAMyRvMYw6QCNC0yzlXM3
         0w7sLTwCpKdvNoeP9zyNtCURIlXP7ZfZINvtxqH76V4804AQzxylTtfM/AAbwr11/ydO
         IaD/9nUWibnF7JoOEtKRyfvCkX7dXJ7bd1T78TU3IF6g965KXpik84MT9pjRo6LEtUAw
         dTr/ztT/76fLN+Rv24GM1iA26o4sw/rjztXJuBWreMIeGVpeKFu2cjpb7dQL+zb1H6Zv
         hZRR73oKhdqWh7WU1obSkqlk75TToXBt+wfUMT/v70MD/jbEuOmjIgUZ/jjrzuUJRGVg
         rt3Q==
X-Gm-Message-State: ABy/qLbLMQNLJhwDumOWhJ8PpKHPJv+MJMfa5W+kqXhizdQPPK4CXWPk
	0rqKwT/kS0uc8wYEuNSREoLels2LEiAVkQ==
X-Google-Smtp-Source: APBJJlE1UHTcFGtVeRARF4WOd3DxXmITB8No0uGeChdFJZmQAKS49N1DYHTcQf1JSHLg2I85JpyhGg==
X-Received: by 2002:a0d:eb8c:0:b0:579:e8de:3580 with SMTP id u134-20020a0deb8c000000b00579e8de3580mr22651146ywe.9.1689152671494;
        Wed, 12 Jul 2023 02:04:31 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id w18-20020a814912000000b0057a92cd7f95sm1044953ywa.100.2023.07.12.02.04.31
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 02:04:31 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-c2cf4e61bc6so7765775276.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 02:04:31 -0700 (PDT)
X-Received: by 2002:a05:6902:28b:b0:c4b:41ce:f68b with SMTP id
 v11-20020a056902028b00b00c4b41cef68bmr16459258ybh.41.1689152670844; Wed, 12
 Jul 2023 02:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230511181931.869812-1-tj@kernel.org> <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org> <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org> <20230712080504.GA3100107@hirez.programming.kicks-ass.net>
In-Reply-To: <20230712080504.GA3100107@hirez.programming.kicks-ass.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jul 2023 11:04:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMRS9_nJXp3rrWQrODRQcBQggze0k=0GjSScCknFmmgQ@mail.gmail.com>
Message-ID: <CAMuHMdUMRS9_nJXp3rrWQrODRQcBQggze0k=0GjSScCknFmmgQ@mail.gmail.com>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE mechanism)
To: Peter Zijlstra <peterz@infradead.org>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-team@meta.com, 
	Linux PM list <linux-pm@vger.kernel.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, linux-rtc@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, netdev <netdev@vger.kernel.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>, 
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_020433_043442_20C0F94F 
X-CRM114-Status: GOOD (  20.17  )
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

SG9pIFBldGVyLAoKT24gV2VkLCBKdWwgMTIsIDIwMjMgYXQgMTA6MDXigK9BTSBQZXRlciBaaWps
c3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+IE9uIFR1ZSwgSnVsIDExLCAyMDIz
IGF0IDExOjM5OjE3QU0gLTEwMDAsIFRlanVuIEhlbyB3cm90ZToKPiA+IEkgd29uZGVyIHdoZXRo
ZXIgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGhlcmUgaXMgc29tZWhvdyBzY2FsaW5nIHRoZSB0aHJl
c2hvbGQKPiA+IGFjY29yZGluZyB0byB0aGUgcmVsYXRpdmUgcHJvY2Vzc2luZyBwb3dlci4gSXQn
cyBkaWZmaWN1bHQgdG8gY29tZSB1cCB3aXRoIGEKPiA+IHRocmVzaG9sZCB3aGljaCB3b3JrcyB3
ZWxsIGFjcm9zcyB0aGUgbGF0ZXN0ICYgZmFzdGVzdCBhbmQgcmVhbGx5IHRpbnkgQ1BVcy4KPiA+
IEknbGwgdGhpbmsgYWJvdXQgaXQgc29tZSBtb3JlIGJ1dCBpZiB5b3UgaGF2ZSBzb21lIGlkZWFz
LCBwbGVhc2UgZmVlbCBmcmVlCj4gPiB0byBzdWdnZXN0Lgo+Cj4gV2UgY291bGQgc2NhbGUgYnkg
Qm9nb01JUFMgSSBzdXBwb3NlLCBpdCdzIGEgYm9ndXMgbWVhc3VyZW1lbnQsIGFzIHBlcgo+IHRo
ZSBuYW1lLCBidXQgaXQgZG9lcyBoYXZlIHNvbWUgcmVsYXRpb24gdG8gaG93IGZhc3QgdGhlIG1h
Y2hpbmUgaXMuCgpUaGF0J3MgZ29ubmEgZmFpbCBtaXNlcmFibHkgb24gZS5nLiBBUk0gYW5kIFJJ
U0MtViwgd2hlcmUgQm9nb01JUFMKZGVwZW5kcyBvbiBzb21lIHRpbWVyIGZyZXF1ZW5jeS4KClIt
Q2FyIE0yLVcgd2l0aCAxLjUgR0h6IENvcnRleC1BMTU6IDQwLjAwIEJvZ29NSVBTClItQ2FyIFY0
SCB3aXRoIDEuOCBHSHogQ29ydGV4LUE3NjogMzMuMzMgQm9nb01JUFMKCndoaWxlIHRoZSByZWFs
IHNsb3cgNDggTUh6IFZleFJpc2NWIGdldHMgMTI4IEJvZ29NSVBTLgoKR3J7b2V0amUsZWV0aW5n
fXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4
ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
