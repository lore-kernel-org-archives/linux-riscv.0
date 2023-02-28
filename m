Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A5EC64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 07:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPF76Mb6hrZX448t2KtMoPl/GFZC8NXwCzWsRdRl/Jk=; b=2irYiVBuCJmOTf
	GBYe8bjv9NZUUIqJ3qcJ/s94yIENPNqvSZRaYJ3bg+I/SgKBSdqsuOCeE7KUtuCR1cuf4wh9eNOz6
	ck3SHajWRVxY15Hietv0BtsN8/7eAWLyec/H4a2T78iTxqp0jPZL1FuMHqiRwvY/nqOVkHILPJ0Wv
	qMqLRr7ndOegmkCe27HPOtz0zJaNYgmu+GjeyRX9Kcf4lNhkjXK95V8/35niyWN01zR7n80GISiLp
	hi6827IqefstbusF2+iweYVq3odqFGdRHJXpe8HxP/YL5qKHCMBorqmK8/b1gxFJXUtPkYv5+eTBS
	IGyK1Tdp4D/VIwKvQiBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWuA1-00CE2t-Tq; Tue, 28 Feb 2023 07:12:29 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWu9y-00CE1X-GQ
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 07:12:27 +0000
Received: by mail-lf1-x12c.google.com with SMTP id f18so11894991lfa.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Feb 2023 23:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677568341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2el8epI4ehY4PQhzCIaQmBUYq/tD84LZ7fZuHKl00o=;
        b=OogPw/DeSprgfA45tucixhanu1pqk4JujFYhoxxBMC/vl2iAoBga9+G3Pu/pq9n6o7
         ztmvezIRFcEG2RSBLU2vIZPHB2hPPQ2Nbire1D2KdUiTWfpCgNaYRmgozx1y0k38yIlQ
         zgLemtdhlCTC4gUWaPT0xCpO6tAioJnDr+IBXdQSqY7OEPGUMPtFKGFXa9KkR6qzDSiy
         Ap+QSgf452caujUPME3M3ACeUyaErwZ+1rZM3HthMeQ2wIEz19bgoH9Q8oSD3DECxZ9d
         NHyJHnWkHHZLt7wFVEKrxbNubIe+Ki1v0v/frQRrLW5T3LZgOIuXtIN5QSCgpM6YvOwM
         20Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677568341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2el8epI4ehY4PQhzCIaQmBUYq/tD84LZ7fZuHKl00o=;
        b=3BngkURJH1HWMVrUAvmJRezuribPXzuOW0gv/b8EkDVEnzc+ceXf+E4fmSALm20BbF
         2tCfxx6SDmiHgYg23W5L4oV8FWbjPzoYElMTPnrle30R1WfgnvFQXwkaVBIzl7KXojcI
         58YK856QiJm4ss5XxSJyUZJSFeAnvlXy7BxreG4xRhmS1+36rc1yUFrCx9MR+gAJIEEz
         KOhh8bmsDv/8aBFUOMbQhWElyDluc0GK1HYhhCa7qEuUpRKzoduNp5/eOlcFMlFYcVQ/
         8E0yNoVZGJxFAPvT0LbEV5NjNkHJm+A99aDW2lqS+NXcEx7NM8POk4dJ4COsjNBFyPWD
         8iNQ==
X-Gm-Message-State: AO0yUKU5lJmKj55rsXkXDlZmcEg3ZbkVJIiK5Naz+IpCKFGlu/LMBA38
	TWXWOsUxBgEAlv4mu4fPhbRojf2/UYLcc+FmwWM=
X-Google-Smtp-Source: AK7set85nhQ9g8yz02zH57y/oTI0WP0o9k1NFfgZU2Uz9PbtXdmMvCjK/p4NyEDFKJMgEHfHvgJnVUYXT02rDuEFI5Q=
X-Received: by 2002:ac2:4432:0:b0:4db:38ba:618d with SMTP id
 w18-20020ac24432000000b004db38ba618dmr382693lfl.12.1677568340985; Mon, 27 Feb
 2023 23:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20230227105941.2749193-1-suagrfillet@gmail.com>
In-Reply-To: <20230227105941.2749193-1-suagrfillet@gmail.com>
From: Alex Shi <seakeel@gmail.com>
Date: Tue, 28 Feb 2023 15:11:44 +0800
Message-ID: <CAJy-AmnZmeTEwG9xTevhCzB2t9y0nb2yYsyWPMLn8R1V4XonQw@mail.gmail.com>
Subject: Re: [PATCH] sched/doc: supplement CPU capacity with RISC-V
To: Song Shuai <suagrfillet@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, siyanteng@loongson.cn, robh@kernel.org, 
	conor.dooley@microchip.com, palmer@rivosinc.com, leyfoon.tan@starfivetech.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_231226_571170_258CAEDC 
X-CRM114-Status: GOOD (  14.99  )
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

T24gTW9uLCBGZWIgMjcsIDIwMjMgYXQgNjo1OSBQTSBTb25nIFNodWFpIDxzdWFncmZpbGxldEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBjb21taXQgN2QyMDc4MzEwY2JmICgiZHQtYmluZGlu
Z3M6IGFybTogbW92ZSBjcHUtY2FwYWNpdHkgdG8gYQo+IHNoYXJlZCBsb2F0aW9uIikgdXBkYXRl
cyBzb21lIHJlZmVyZW5jZXMgYWJvdXQgY2FwYWNpdHktZG1pcHMtbWh6Cj4gcHJvcGVydHkgaW4g
dGhpcyBkb2N1bWVudC4KPgo+IFRoZSBsaXN0IG9mIGFyY2hpdGVjdHVyZXMgdXNpbmcgY2FwYWNp
dHktZG1pcHMtbWh6IG9taXRzIFJJU0MtViwgc28KPiBzdXBwbGVtZW50cyBpdCBoZXJlLgo+Cj4g
U2lnbmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgo+IC0tLQo+
ICBEb2N1bWVudGF0aW9uL3NjaGVkdWxlci9zY2hlZC1jYXBhY2l0eS5yc3QgICAgICAgICAgICAg
ICAgICAgIHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVs
ZXIvc2NoZWQtY2FwYWNpdHkucnN0IHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Nj
aGVkdWxlci9zY2hlZC1jYXBhY2l0eS5yc3QgYi9Eb2N1bWVudGF0aW9uL3NjaGVkdWxlci9zY2hl
ZC1jYXBhY2l0eS5yc3QKPiBpbmRleCA4ZTJiODUzOGJjMmIuLmUyYzFjZjc0MzE1OCAxMDA2NDQK
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL3NjaGVkdWxlci9zY2hlZC1jYXBhY2l0eS5yc3QKPiArKysg
Yi9Eb2N1bWVudGF0aW9uL3NjaGVkdWxlci9zY2hlZC1jYXBhY2l0eS5yc3QKPiBAQCAtMjU4LDcg
KzI1OCw3IEBAIExpbnV4IGNhbm5vdCBjdXJyZW50bHkgZmlndXJlIG91dCBDUFUgY2FwYWNpdHkg
b24gaXRzIG93biwgdGhpcyBpbmZvcm1hdGlvbiB0aHVzCj4gIG5lZWRzIHRvIGJlIGhhbmRlZCB0
byBpdC4gQXJjaGl0ZWN0dXJlcyBtdXN0IGRlZmluZSBhcmNoX3NjYWxlX2NwdV9jYXBhY2l0eSgp
Cj4gIGZvciB0aGF0IHB1cnBvc2UuCj4KPiAtVGhlIGFybSBhbmQgYXJtNjQgYXJjaGl0ZWN0dXJl
cyBkaXJlY3RseSBtYXAgdGhpcyB0byB0aGUgYXJjaF90b3BvbG9neSBkcml2ZXIKPiArVGhlIGFy
bSwgYXJtNjQsIGFuZCBSSVNDLVYgYXJjaGl0ZWN0dXJlcyBkaXJlY3RseSBtYXAgdGhpcyB0byB0
aGUgYXJjaF90b3BvbG9neSBkcml2ZXIKPiAgQ1BVIHNjYWxpbmcgZGF0YSwgd2hpY2ggaXMgZGVy
aXZlZCBmcm9tIHRoZSBjYXBhY2l0eS1kbWlwcy1taHogQ1BVIGJpbmRpbmc7IHNlZQo+ICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY3B1L2NwdS1jYXBhY2l0eS50eHQuCj4KPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NoZWR1bGVyL3Nj
aGVkLWNhcGFjaXR5LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVk
dWxlci9zY2hlZC1jYXBhY2l0eS5yc3QKPiBpbmRleCBlMDdmZmRkMzkxZDMuLjhjYmExMzVkY2Qx
YSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVs
ZXIvc2NoZWQtY2FwYWNpdHkucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vc2NoZWR1bGVyL3NjaGVkLWNhcGFjaXR5LnJzdAo+IEBAIC0yMzEsNyArMjMxLDcgQEAg
Q0ZT6LCD5bqm57G75Z+65LqO5a6e5L2T6LSf6L296Lef6Liq5py65Yi277yIUGVyLUVudGl0eSBM
b2FkIFRyYWNraW5nLCBQRUxU77yJCj4gIOW9k+WJje+8jExpbnV45peg5rOV5Yet6Ieq6Lqr566X
5Ye6Q1BV566X5Yqb77yM5Zug5q2k5b+F6aG76KaB5pyJ5oqK6L+Z5Liq5L+h5oGv5Lyg6YCS57uZ
TGludXjnmoTmlrnlvI/jgILmr4/kuKrmnrbmnoTlv4XpobvkuLrmraQKPiAg5a6a5LmJYXJjaF9z
Y2FsZV9jcHVfY2FwYWNpdHkoKeWHveaVsOOAggo+Cj4gLWFybeWSjGFybTY05p625p6E55u05o6l
5oqK6L+Z5Liq5L+h5oGv5pig5bCE5YiwYXJjaF90b3BvbG9neempseWKqOeahENQVSBzY2FsaW5n
5pWw5o2u5Lit77yI6K+R5rOo77ya5Y+C6ICDCj4gK2FybeOAgWFybTY05ZKMUklTQy1W5p625p6E
55u05o6l5oqK6L+Z5Liq5L+h5oGv5pig5bCE5YiwYXJjaF90b3BvbG9neempseWKqOeahENQVSBz
Y2FsaW5n5pWw5o2u5Lit77yI6K+R5rOo77ya5Y+C6ICDCj4gIGFyY2hfdG9wb2xvZ3kuaOeahHBl
cmNwdeWPmOmHj2NwdV9zY2FsZe+8ie+8jOWug+aYr+S7jmNhcGFjaXR5LWRtaXBzLW1oeiBDUFUg
YmluZGluZ+S4reihjeeUn+iuoeeulwo+ICDlh7rmnaXnmoTjgILlj4Lop4FEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvY3B1L2NwdS1jYXBhY2l0eS50eHTjgIIKCkxHVE0sClJldmll
d2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4KCj4KPiAtLQo+IDIuMjAuMQo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
