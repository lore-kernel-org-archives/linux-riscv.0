Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F82AC4743C
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 02:40:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8A8D6052B
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 02:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8A8D6052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLFt6SIGT2DhXj9DbwktjqyPWJ5wy7BpgfHUKKPdp3I=; b=mgQCjjG0HfftxS
	sI6RaUN6nfZoVAu/Www0IwyVqmkYFzOl4fKKUYw3ynPT4Maryy6ZFm7WnQ+yJitnOHPaeiaQ6oQgt
	BhfM7RB0oz22+5MsqfjSoIlKRVUtbnWwkHrPuGWZ1/D65teSqd9wGWk10n6jDr+04MmbAZVvMzPQx
	6j4Hafu/SXnm9sfTtCCmmMERKUE6bso780Kjh3QkddKJdHSanMA5R9oqlgA1WiM3epYQtTnYUrTgQ
	JGZrcBtE/fhcQEVflY8keg1b6jduheRGRbgJqXGQfMFbAlLZxAnkXvm3I0qTH/HRAgPnt4pc9UEaM
	171x2y+Fai+tvjXtxO6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvWKb-005Qyr-Vw; Tue, 22 Jun 2021 02:40:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvWKY-005QxY-Sv
 for linux-riscv@lists.infradead.org; Tue, 22 Jun 2021 02:40:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F49761353
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 02:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624329601;
 bh=5kf0xaAD8wEWnNmPDX+5RNxnyxXPsxVMT9o9aiq6skU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Lqghe0x9BT/w83E/LU5mo8iJbvWbgZSuit/45gevMKYaIXtSWZ/1z705+A6bQhEat
 xkRQR7HUE+7CN9KvPBB5ZRcLu0WKesOuEzP6rMYjiOhi75FPbsEr8ifB01W3Kl3ds8
 IoWvtCJWa53gIyaKDG2O/khrACMUdSdqKUkpO8hs9jyWLONtQOthac+izHLq9/xv06
 bbmYkvKYulcBjof7L3wsOP5jGrKXxxZcan7gtoQhE1tiKFN30BOXeJ4Ab/Rc4NE203
 Q12rNELllrKm2QvYbMREzw9b9dMPFLhN7TMRnnVKjukGiTC00VfjY/4QO7IrPsLBof
 aVLTH9f3CoqLQ==
Received: by mail-lj1-f176.google.com with SMTP id r16so27962215ljk.9
 for <linux-riscv@lists.infradead.org>; Mon, 21 Jun 2021 19:40:01 -0700 (PDT)
X-Gm-Message-State: AOAM5319iYXrfM0CeU/GGVg2gvThOGhyxmi5Didu5xcZ2jhv0UcHFPhe
 zsQDx3/OsLHuiAEJ5cJb0vHXVTA4PG+qQDD/754=
X-Google-Smtp-Source: ABdhPJwaE7X7V/NNZnXsKtAApRFD8er7mpM4NwDHR/R5llESxNtdnmOSlhREOJVKaZQVuejMRimHvOVhRlhXEKVItoM=
X-Received: by 2002:a05:651c:211d:: with SMTP id
 a29mr1068278ljq.115.1624329599798; 
 Mon, 21 Jun 2021 19:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <e968312557f147af1e5efb341eeef0ad@mailhost.ics.forth.gr>
In-Reply-To: <e968312557f147af1e5efb341eeef0ad@mailhost.ics.forth.gr>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 22 Jun 2021 10:39:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTipWCvwu0p7CdPqr2krfHvviQxqdNPCy9VHBUXvh6FyQ@mail.gmail.com>
Message-ID: <CAJF2gTTipWCvwu0p7CdPqr2krfHvviQxqdNPCy9VHBUXvh6FyQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] riscv: optimized mem* functions
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Matteo Croce <mcroce@linux.microsoft.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>, 
 David Laight <David.Laight@aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_194002_996181_57FE4776 
X-CRM114-Status: GOOD (  13.44  )
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

T24gVHVlLCBKdW4gMjIsIDIwMjEgYXQgOTowOSBBTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNz
LmZvcnRoLmdyPiB3cm90ZToKPgo+IEhlbGxvIE1hdHRlbywKPgo+IM6jz4TOuc+CIDIwMjEtMDYt
MTcgMTg6MjcsIE1hdHRlbyBDcm9jZSDOrc6zz4HOsc+IzrU6Cj4gPiBGcm9tOiBNYXR0ZW8gQ3Jv
Y2UgPG1jcm9jZUBtaWNyb3NvZnQuY29tPgo+ID4KPiA+IFJlcGxhY2UgdGhlIGFzc2VtYmx5IG1l
bXtjcHksbW92ZSxzZXR9IHdpdGggQyBlcXVpdmFsZW50Lgo+ID4KPiA+IFRyeSB0byBhY2Nlc3Mg
UkFNIHdpdGggdGhlIGxhcmdlc3QgYml0IHdpZHRoIHBvc3NpYmxlLCBidXQgd2l0aG91dAo+ID4g
ZG9pbmcgdW5hbGlnbmVkIGFjY2Vzc2VzLgo+ID4KPiA+IFRlc3RlZCBvbiBhIEJlYWdsZVYgU3Rh
cmxpZ2h0IHdpdGggYSBTaUZpdmUgVTc0IGNvcmUsIHdoZXJlIHRoZQo+ID4gaW1wcm92ZW1lbnQg
aXMgbm90aWNlYWJsZS4KPiA+Cj4KPiBUaGVyZSBhcmUgYWxyZWFkeSBnZW5lcmljIEMgaW1wbGVt
ZW50YXRpb25zIGZvciBtZW1jcHkvbWVtbW92ZS9tZW1zZXQgYXQKPiBodHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC92NS4xMy1yYzcvc291cmNlL2xpYi9zdHJpbmcuYyNMODcxIGJ1dAo+
IGFyZSBkb2luZyBvbmUgYnl0ZSBhdCBhIHRpbWUsIEkgc3VnZ2VzdCB5b3UgdXBkYXRlIHRoZW0g
dG8gZG8KPiB3b3JkLWJ5LXdvcmQgY29weSBpbnN0ZWFkIG9mIGludHJvZHVjaW5nIHlldCBhbm90
aGVyIG1lbWNweS9tZW1tb3ZlIEMKPiBpbXBsZW1lbnRhdGlvbiBvbiBhcmNoL3Jpc2N2Ly4KWWVz
LCBJJ3ZlIHRyaWVkIHRvIGNvcHkgdGhlIEdsaWJjIHZlcnNpb24gaW50byBhcmNoL2Nza3kvYWJp
djEsIGFuZApBcm5kIHN1Z2dlc3RlZCBwdXR0aW5nIHRoZW0gaW50byBnZW5lcmljLgpyZWY6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFyY2gvMjAxOTA2MjkwNTM2NDEuM2lCZms5LUlf
RDI5Y0RwOXlKbklkSWc3b010SE5abERtaExRUFR1bWhFY0B6LyN0Cgo+Cj4KPgoKCgotLQpCZXN0
IFJlZ2FyZHMKIEd1byBSZW4KCk1MOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5
LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
