Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493EDC77B73
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Apr 2023 13:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b0rumtclj/9AIZVYoEeMtMtNPAR9jKB+0jX39s2uNBA=; b=ado/3qlVNJoAHy
	MGAJ66t94yf646a+vhSRJuYrDI5eiRvjMr9wrVhZRUHK9CCWHhUUzb4tjJS0KmpcAa28zpMexSHd1
	Ube5HT5FWmX/Zu98wuTt7BYYHGZxq8DduMwvW2Jv2VGtt+6UirAP0Ge95z5iCX3Pju9897u+bKj5I
	tbkOwuhK/0MVze8r1oewP4Clo8aMzLQx6Csdz/a9wvGCchTLHIA98msR0xMMMZYYCXgIAFvatzmeM
	TdDiAblpAap2jwEdDqd2rOW0eKGVs/5uaMOaWBSYtbA6TrQ6FmjCD9IzLKt4fDBC4zXmRq90dgd4g
	ZGljT/hqoa6B/nwnWh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pt6iR-00ECLx-1k;
	Sun, 30 Apr 2023 13:03:47 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pt6iM-00ECKo-24
	for linux-riscv@lists.infradead.org;
	Sun, 30 Apr 2023 13:03:46 +0000
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so16017328276.0
        for <linux-riscv@lists.infradead.org>; Sun, 30 Apr 2023 06:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682859820; x=1685451820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7WF7SpO6yLlGrM65QrDk8wld6xpe3XopvGtDDxj/oU=;
        b=DZX66bpBlfw6c5JwAnZ+motTkiR3tnAXIepcIMaRVfJt4tpKUl5Kx6tb4bXsJvmuUw
         1r+Ju3Hr9LZLA4zkHVC1UZ8JZKVdnOdMtmAzfWU4pXpheQJn/gdMHriqL5uNfF0qym/x
         w2S2kzPG64NTCfi9aeKw7+MEqfQiCAjM7rI6bYEz27LvTFG840TWF+EarWkObOeE65e8
         Y8L5vgtzwHgfbbuhjrOJbdNBKM+BjSk6UT2nR4uXlV5eLMum1Sgr2Xh0U8v5NkMmJkTx
         yzmzNAxEV2EU/q3/9OKt5t51KTFtrsyndG8o5tPy90sGuXBfQAdGI5SoebfAJl8ay0cg
         oslg==
X-Gm-Message-State: AC+VfDyrMc0XTaVgJFPn94JhjzcCOs8TPbQHkbt2I619Ki1SIv3BIeHn
	FI2yVraWd1nZq7JWY04u7yrOynray6l4bQ==
X-Google-Smtp-Source: ACHHUZ4UnvHywwswTYelq19drVmK7yxfC0eE7XKPhW2/K6YCqRti1e+cgDimwj9j4ikX8sZEc02xog==
X-Received: by 2002:a25:7b46:0:b0:b8f:3990:636d with SMTP id w67-20020a257b46000000b00b8f3990636dmr9684541ybc.23.1682859820055;
        Sun, 30 Apr 2023 06:03:40 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id b124-20020a251b82000000b00b9a63c60fefsm2121508ybb.31.2023.04.30.06.03.37
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Apr 2023 06:03:38 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-b9a6f17f2b6so15987551276.1
        for <linux-riscv@lists.infradead.org>; Sun, 30 Apr 2023 06:03:37 -0700 (PDT)
X-Received: by 2002:a81:5253:0:b0:54f:b615:1e44 with SMTP id
 g80-20020a815253000000b0054fb6151e44mr9871377ywb.7.1682859817683; Sun, 30 Apr
 2023 06:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <74a647f7-cf5f-4c23-aad6-77bf5b04e116@app.fastmail.com> <mhng-8d0e378d-10f7-4107-99aa-b204c3d2a619@palmer-ri-x1c9a>
In-Reply-To: <mhng-8d0e378d-10f7-4107-99aa-b204c3d2a619@palmer-ri-x1c9a>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 30 Apr 2023 15:03:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVgAETQPzYNgEnSijt8K6LE86xM2GuJdh7b6_SNCFj2w@mail.gmail.com>
Message-ID: <CAMuHMdVVgAETQPzYNgEnSijt8K6LE86xM2GuJdh7b6_SNCFj2w@mail.gmail.com>
Subject: Re: [PATCH] libgcc: Add forward declarations for generic library routines
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Arnd Bergmann <arnd@arndb.de>, geert+renesas@glider.be, akpm@linux-foundation.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, chris@zankel.net, jcmvbkbc@gmail.com, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_060342_685496_5533F857 
X-CRM114-Status: GOOD (  22.51  )
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

SGkgUGFsbWVyLAoKT24gU2F0LCBBcHIgMjksIDIwMjMgYXQgMTA6MjDigK9QTSBQYWxtZXIgRGFi
YmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToKPiBPbiBGcmksIDIxIEFwciAyMDIzIDEz
OjM4OjUyIFBEVCAoLTA3MDApLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gT24gRnJpLCBBcHIg
MjEsIDIwMjMsIGF0IDE2OjU0LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPj4gV2l0aCBX
PTEgb24gcGxhdGZvcm1zIHRoYXQgdXNlIHRoZSBnZW5lcmljIGdjYyBsaWJyYXJ5IHJvdXRpbmVz
Cj4gPj4gKGNza3kvbG9vbmdhcmNoL21pcHMvcmlzY3Yvc2gveHRlbnNhKToKPiA+Pgo+ID4+IFJl
cG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+PiBMaW5rOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMwMzI3MjIxNC5SeHpwQTZi
UC1sa3BAaW50ZWwuY29tLwo+ID4+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gPgo+ID4gTmljZSwgdGhpcyBpcyBvbmUgSSBkb24n
dCBoYXZlIGluIG15IHNlcmllcywKPiA+Cj4gPiBBY2tlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4KPiA+Cj4gPiBJIGhhdmUgcGF0Y2hlcyBmb3IgYSBsb3Qgb2Ygb3RoZXIgbWlz
c2luZyBwcm90b3R5cGUgd2FybmluZ3MsIHBsYW4KPiA+IHRvIHNlbmQgdGhlbSBvdXQgYWZ0ZXIg
LXJjMS4KPgo+IFJldmlld2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNv
bT4KPiBBY2tlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpUaGFu
a3MhCgo+IEkgdGhpbmsgSSd2ZSBtZXJnZWQgc29tZSBzdHVmZiBhcm91bmQgaGVyZSBiZWZvcmUs
IGJ1dCBpdCdzIHByb2JhYmx5Cj4gYmV0dGVyIGZvciBzb21lIG1vcmUgZ2VuZXJpYyB0cmVlPyAg
TE1LIGlmIHlvdSBndXlzIHdhbnRlZCBtZSB0byBwaWNrCj4gdGhlc2UgdXAsIHRob3VnaCwgSSd2
ZSBnb3QgYSBzbWF0dGVyaW5nIG9mIHNtYWxsIHN0dWZmIGFscmVhZHkgc28gSSdsbAo+IGhhdmUg
YW5vdGhlciBQUiBlaXRoZXIgd2F5LgoKVG9vIGxhdGUgOy0pIEFscmVhZHkgdXBzdHJlYW0gdmlh
IGFrcG0ncyB0cmVlLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
