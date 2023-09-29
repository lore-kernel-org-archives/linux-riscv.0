Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4E1E80ABE
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 11:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IWkc9nqTpcdRwIZMHs3hn6DU9bz+3JLXvkLatH9D69Q=; b=4ri1CCPjA5Bvxr
	6cPzsOfR9FCd4Ay+vk1UB/9DPFZKGe4vuzs0jjr4dOq5uiZdevuOzbRHirqzb7H1QuvWDK8B8uUjd
	OgfQ5o+tFLvEl63GQ8kvvkUZlJpV8rhE0dxKtwL+L0HXzdib2Xw8SqXLKH2AhIIzqsuUpz2DrQIwU
	DpPoUT6gqqDLBlFS8PRYTfBmHtXiqO/mDiMoeCRyv64G1RYGIw5KFoJzHaLHuS/oBVQz18Xt8c2FC
	63VaUMovxfGFv1dTyU8/hVWwmkYtt8fncEbq0buWul8glLGVstc5n6JMSbqv9fzIDf/11I5BK0yAz
	u/6W40EE/S0PVV3rwi9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmBrg-007onP-04;
	Fri, 29 Sep 2023 11:41:00 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmBrd-007omj-1y
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 11:40:59 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c6052422acso123095ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 04:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695987653; x=1696592453; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZOPZ+xP375DoQjjQBBJV+szQfuC4HZOIDj9VYeNHuY=;
        b=KNDel4ci5Mp6O2dQCl3aqhpoEA7I6XjIpZHFiaRqoBC2kfeVX0zjsPZg5sD1/UbVog
         TT/9N2xYs5s6TciJmLONBxEkjRjNyhcLfitM0kyS/JiPJQgzvJl44L00pfkTk3diDCyt
         HF3FoCrWXTXmvB6bk/bFrYVwEwjAckgRt5hltYsjfHggpO67GTXi9reRvAXE1Rm+gWKE
         5KtJ5xhV8n1T3zH3dUoWgELRkThuv1YLOXqfl8tNkT1tYnTqGoMQP0NSr5pNnNmeAVNX
         ZJ6Za78eoi+wyM2u/4UBcJcq5kYTfrgGEBisM5NhmwSmfyZLGQwwmMLGy0XpdVbTWeWq
         eRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695987653; x=1696592453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZOPZ+xP375DoQjjQBBJV+szQfuC4HZOIDj9VYeNHuY=;
        b=KwwWoyPAgYz5NWDHv6rzQN99lotu2o6K5qLxoO8GJYULx1GRfRzjIBzuaUQ4+RUB8U
         Kjs792Iq20v9dr8L5EpN9MhEZBTpW7/kDruNxjJQqjIDpsMa7LMW8OQmSPinYDArM0pk
         eEm7MfCFoJ/q7rjQLWE/17PH7IvoCjbVtuBLFl4HGcIYdFg71lVz9P5LHuB9sYwmoUVr
         2RIbToXi/eDytTlDz90k+1GkzpNBRdXKUhHVoj7XXIlHdDmRYKIJFSXfwI5/mSwnckAQ
         xxucp9qap1skJ58C3jmlDcU3xZj2KuYuCYVgVzhSgqC8AkIicMAIQtjIhKe427lpSWQO
         CLng==
X-Gm-Message-State: AOJu0YwOVL48lN1TGah2lb9AvBAwG90PSAFqSdq8J4wSw8cNAJNbRDjW
	Auy3JXpey0VsekNIKctio3B9nDZ+19HNyUn2DSIHDA==
X-Google-Smtp-Source: AGHT+IF7Rhuo4hSmvyBubR6o6fBOm+n3EBxZ2Rz7vj6cnrETmCgaWx69H+tOyl1OZ6rOLVnj9DFbd7K5QsJrJwx7NlQ=
X-Received: by 2002:a17:903:32d0:b0:1bc:29c3:5895 with SMTP id
 i16-20020a17090332d000b001bc29c35895mr964124plr.0.1695987653000; Fri, 29 Sep
 2023 04:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000a8df0406061b76e6@google.com> <f8891c2f-38f9-f741-66ad-8c5fbe1e365f@ghiti.fr>
In-Reply-To: <f8891c2f-38f9-f741-66ad-8c5fbe1e365f@ghiti.fr>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 29 Sep 2023 13:40:41 +0200
Message-ID: <CANp29Y7wO0OrrDCauTK_O2Rf=vrqVwrUGmHy-hanSKvWexJpyQ@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes test error: BUG: got no coverage: (3)
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: syzbot <syzbot+2ecff9714d050e3c3a88@syzkaller.appspotmail.com>, 
	aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_044057_691356_5CB70342 
X-CRM114-Status: GOOD (  12.02  )
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

T24gRnJpLCBTZXAgMjksIDIwMjMgYXQgMTI6NTbigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhA
Z2hpdGkuZnI+IHdyb3RlOgo+Cj4gT24gMjQvMDkvMjAyMyAxNjoxNCwgc3l6Ym90IHdyb3RlOgo+
ID4gSGVsbG8sCj4gPgo+ID4gc3l6Ym90IGZvdW5kIHRoZSBmb2xsb3dpbmcgaXNzdWUgb246Cj4g
Pgo+ID4gSEVBRCBjb21taXQ6ICAgIGIwNmZhYjAwM2FlMSByaXNjdjoga3NlbGZ0ZXN0czogRml4
IG1tIGJ1aWxkIGJ5IHJlbW92aW5nIHQuLgo+ID4gZ2l0IHRyZWU6ICAgICAgIGdpdDovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yaXNjdi9saW51eC5naXQgZml4ZXMK
PiA+IGNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50
eHQ/eD0xNjM4ODkxODY4MDAwMAo+ID4ga2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2FsbGVy
LmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PTg5ZjBhODhkNGJjN2YwZjQKPiA+IGRhc2hib2FyZCBs
aW5rOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9MmVjZmY5NzE0ZDA1
MGUzYzNhODgKPiA+IGNvbXBpbGVyOiAgICAgICByaXNjdjY0LWxpbnV4LWdudS1nY2MgKERlYmlh
biAxMi4yLjAtMTMpIDEyLjIuMCwgR05VIGxkIChHTlUgQmludXRpbHMgZm9yIERlYmlhbikgMi40
MAo+ID4gdXNlcnNwYWNlIGFyY2g6IHJpc2N2NjQKPiA+Cj4gPiBEb3dubG9hZGFibGUgYXNzZXRz
Ogo+ID4gZGlzayBpbWFnZSAobm9uLWJvb3RhYmxlKTogaHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFw
aXMuY29tL3N5emJvdC1hc3NldHMvYTc0MWIzNDg3NTljL25vbl9ib290YWJsZV9kaXNrLWIwNmZh
YjAwLnJhdy54ego+ID4gdm1saW51eDogaHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29tL3N5
emJvdC1hc3NldHMvZDc1MWQzZWFkNjNmL3ZtbGludXgtYjA2ZmFiMDAueHoKPiA+IGtlcm5lbCBp
bWFnZTogaHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29tL3N5emJvdC1hc3NldHMvZDcyMzgw
YmQ5OWNjL0ltYWdlLWIwNmZhYjAwLnh6Cj4gPgo+ID4gSU1QT1JUQU5UOiBpZiB5b3UgZml4IHRo
ZSBpc3N1ZSwgcGxlYXNlIGFkZCB0aGUgZm9sbG93aW5nIHRhZyB0byB0aGUgY29tbWl0Ogo+ID4g
UmVwb3J0ZWQtYnk6IHN5emJvdCsyZWNmZjk3MTRkMDUwZTNjM2E4OEBzeXprYWxsZXIuYXBwc3Bv
dG1haWwuY29tCj4gPgo+ID4gZXhlY3V0aW5nIHByb2dyYW0KPiA+IGV4ZWN1dGluZyBwcm9ncmFt
Cj4gPiBleGVjdXRpbmcgcHJvZ3JhbQo+ID4gZXhlY3V0aW5nIHByb2dyYW0KPiA+IDE5NzAvMDEv
MDEgMDA6MDU6NTMgU1laRkFUQUw6IEJVRzogZ290IG5vIGNvdmVyYWdlOgo+Cj4KPiBOb3Qgc3Vy
ZSBob3cgdG8gZGVidWcgdGhhdCwgYW55IGlkZWEgd2hhdCdzIHdyb25nIGhlcmU/CgpUaGUgZXJy
b3IgbWVzc2FnZSBtZWFucyB0aGF0IEtDT1YgZGlkIG5vdCByZXR1cm4gYW55IGtlcm5lbCBjb3Zl
cmFnZQp0byBzeXprYWxsZXIgd2hlbiBpdCBzaG91bGQgaGF2ZSByZXR1cm5lZCBhdCBsZWFzdCBz
b21ldGhpbmcuCgpJdCB3YXMgcmVjb3JkZWQgb24gc3l6Ym90IG9ubHkgb25jZSB+IGEgd2VlayBh
Z28gYW5kLCBzaW5jZSB0aGVuLApzeXpib3QgaGFzIGJlZW4gYWJsZSB0byBidWlsZCBhbmQgYm9v
dCBuZXdlciBrZXJuZWwgcmV2aXNpb25zLiBTbyB0aGUKcmVwb3J0IGlzIG5vIGxvbmdlciByZWFs
bHkgd29ydGggaW52ZXN0aWdhdGluZy4gTGV0J3MgaW52YWxpZGF0ZSBpdC4KCiNzeXogaW52YWxp
ZAoKPgo+Cj4gPiBsb29wIGV4aXRlZCB3aXRoIHN0YXR1cyAxMQo+ID4KPiA+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
