Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119F7C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 11:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfgHL4VNVFA2X2iDzj9xHVsDSZGJRo3y/+MuqBiMvQk=; b=EoAG+f6VjUuWCk
	1hBzNtFnZxTHWkxVhAapX40w6OgEpygYmSxFvSKD9cMqX1F7xhFeq3cW1Xy61E7FWWbrQZs2WJogC
	P1l+P54OBacrycT90ff6OVfTRlUAf3vo69dsKADvRrllistfzK6gIsVrUKS1e7+/QNkri/BCSKybX
	iZD4Xrh5vZlBpTYkzMwyaeQhKjGMFKPt++gGDzSkbkLpeZFY9rT2JHEPcCDAkfjuFCubnUGA9AzUP
	/YD0hV1RxFKQWfW7nBMcEcfnBeO443ONKg6n8Y6winLnLQ2F9xEl5/Z27fzfg6rkt4l8xYf1f+APN
	ahK+uxi9t5FRdZx81FsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUlQZ-00000002TGE-1P3v;
	Fri, 19 Jul 2024 11:05:31 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUlQV-00000002TFj-3TU2
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 11:05:29 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-664ccd158b0so18443077b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 04:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721387124; x=1721991924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9Syv7sYvr8dFphe6oDhNBd5AoqFGOBMWLjrnJkdXso=;
        b=ruR0dfijnp1EoitVJ0N940ES1+L7+nsIR0FHzP9vhjzb7T5rcDWOB7JufxNnrp6kpc
         HWjGs9V1k1TTU7hUMqS+XrbxOcZfpasAmaix8BjYBFe/pHvuxtbGfMRWkyhO9A/YfcW4
         ogweA3gioUb8iT/BaDA3HUCcSDQx70udGXO188NJh8U0bavUaHUuLklMsN/c+514UsF8
         8irPeNkTRsVXbviA4DVzZFTAofoxnixpfCPmUGuFVZn4NOqyaHmItGdp/2rktTQbEFey
         19w245eFSqXas5slvi1m8ryIzyRdF8QsmTwD4mS+RadXr7ec4lmL/nFd30WZDEziQtR0
         FlPw==
X-Gm-Message-State: AOJu0YwRdHz0kSaffsbEkiGhi6wTrkfMLxlm6+UR+VMlrGGTyzrGiD/E
	u/62vbHtr+9e51aGj3VxLujU7ZYwZW2vS585jrdA5zi2+N5MAbIIrxavG4C1
X-Google-Smtp-Source: AGHT+IEp55OqJpom3vXQtcfDJyndwO66LZjAwKmFV/Yi+0yuF5D+HP6NB/qQ4xuTusi5bNeXy0dSrA==
X-Received: by 2002:a81:85c5:0:b0:64a:489c:4fbc with SMTP id 00721157ae682-66500d32c71mr86329507b3.46.1721387124278;
        Fri, 19 Jul 2024 04:05:24 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6695245b17esm4087697b3.51.2024.07.19.04.05.22
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 04:05:24 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e05e4c3228bso1632976276.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 04:05:22 -0700 (PDT)
X-Received: by 2002:a05:6902:2b93:b0:dff:3028:4631 with SMTP id
 3f1490d57ef6-e05ed729577mr9622463276.33.1721387122548; Fri, 19 Jul 2024
 04:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240717-shrubs-concise-51600886babf@spud>
In-Reply-To: <20240717-shrubs-concise-51600886babf@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jul 2024 13:05:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXc_VPRLg1N_uCerXzzntJ23pq6m3Jb5eSPVZjxuXjHAg@mail.gmail.com>
Message-ID: <CAMuHMdXc_VPRLg1N_uCerXzzntJ23pq6m3Jb5eSPVZjxuXjHAg@mail.gmail.com>
Subject: Re: [PATCH v1] RISC-V: run savedefconfig for defconfig
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_040527_887670_FC2852BA 
X-CRM114-Status: GOOD (  17.36  )
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

SGkgQ29ub3IsCgpPbiBXZWQsIEp1bCAxNywgMjAyNCBhdCAzOjI54oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPgo+Cj4gSXQncyBiZWVuIGEgd2hpbGUgc2luY2UgdGhpcyB3YXMg
cnVuLCBhbmQgdGhlcmUncyBhIGZldyB0aGluZ3MgdGhhdCBoYXZlCj4gY2hhbmdlZC4gRmlyc3Rs
eSwgYWxtb3N0IGFsbCBvZiB0aGUgUmVuZXNhcyBzdHVmZiB2YW5pc2hlcyBiZWNhdXNlIHRoZQo+
IGNvbmZpZyBmb3IgdGhlIFJaL0ZpdmUgaXMgZ2F0ZWQgYmVoaW5kIE5PTlBPUlRBQkxFLiBTZXZl
cmFsIG9wdGlvbnMKPiAobGlrZSBDT05GSUdfUE0pIGFyZSByZW1vdmVkIGFzIHRoZXkgYXJlIHRo
ZSBkZWZhdWx0IHZhbHVlcy4KPgo+IFRvIHJldGFpbiBERUZWRlJFUV9USEVSTUFMIGFuZCBCTEtf
REVWX1RIUk9UVExJTkcsIGFkZCBQTV9ERVZGUkVRIGFuZAo+IEJMS19DR1JPVVAgcmVzcGVjdGl2
ZWx5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9j
aGlwLmNvbT4KClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKClBlcmhhcHMgd2Ugc2hvdWxkIGFkZCBh
biByemZpdmVfZGVmY29uZmlnPwoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
