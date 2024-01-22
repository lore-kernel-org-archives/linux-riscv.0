Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ED6C4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 07:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NM9Bh83L4Fi2zI32jSJ+UQ+UU15qhzXwRowKxpTRZyU=; b=BVZ3c3eoNVylIG
	c4XRnl0kbESMKOYwzJhtW34RfBgvDD9irgBygPwfTAFeb7EdIKfNizw70mVGvzEc/KS+HJDAOQ3uM
	ojZ0PYN+hzrgmx8all1Z/Bh0aQA9UuTybNW4RpCiNmuXLrTn4XUCVa9RB0I1UTzDd+VWBo3JXkZBZ
	+Hwfc783kOq6vJ9G8I/GxXYIxW7cqmW9pzM4mfLrz8FdYlHaxQi1G3JH6KZoYMNEf3KeZ5eLraHjK
	oMEByBGm2LSvJcH/1PdPU7ROMCutecPkvtWp4wNZe9YS3TcD12R4XxC9xNzkovTXcCqEt8uku5OIP
	ucqbvTiEfwF6w7oWEy1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRotX-00Asyy-00;
	Mon, 22 Jan 2024 07:38:59 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRotQ-00Asvf-2k
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 07:38:57 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5ffee6e8770so5586787b3.0
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jan 2024 23:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705909131; x=1706513931; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btEptr2pD3e12BZE7dkiwHzMFQh/dHJsUOjIgsxvBmo=;
        b=Pu9ZQxijqlPPLsSbVtQt7onjX6afdjgU3huzNR8V2cbKbv+DUS4wCF2l4mYclTUN+l
         Ic1tkhxdKH+Pw4OfXe0Ljj+Aa3OMXU68SqNmechCnIcV2fbNqb1qFUdHtFttXpMTKMA1
         SYzMJPWNdNchqwlM9We6SoN3Y9dWirp9cdzWQ5wgXISQRW+cyct9FvWGHWQpOT3yDSxu
         yF7HT1YNctFZenMkTCdNguFpBMW6RXBlGaaRzPauEjH6aIBb+KtJwhvNoDdoGvBVDv3X
         JqUZrvDggPf3tnJhBDyYBIiIJjuIxRB04AzAvn2o42nUfTn9l88g37gXqb0IW0utOcSb
         fsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705909131; x=1706513931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btEptr2pD3e12BZE7dkiwHzMFQh/dHJsUOjIgsxvBmo=;
        b=MOnEq6/NH07hCPcv2iu2G/l7fQu/sbw64q2M5pMT1KR91erEN/sRyX5sW3YrTV74Ti
         znRiqXvjaVC6EywVyXAm5lscs7aPQ80UP9Vy3bei+SQoGFliAkRCc4EbDrj6BwSevu9s
         ZbARqbFBseisUHM9b0flqATkio/eMFulSle231O5fVqr9A48nBNUoS29m6jLKMnY93xf
         Qpw3gV0CSRBIsO1JUMVKFaSN57dTNXPHMNBWK/H62rRnMvdyLPJC/W1/ObfGua55xcBg
         sy8qTdw2vRUyapY3934fCJXziO3pTseNboQusI1eK/vQaN/XmPEb2YrWmbYDX8fFTFdw
         he2w==
X-Gm-Message-State: AOJu0YwGeWYmOgqgln4nzli3H+Vhb0yZdvac3uquL5ZyDzbmiTIeiDDf
	icwcxjOvy8gLOiDI4vECZnqtUm+zFKW1A/QinEBjnRxQjmcRt7WgrkEng99IMMuqOHvNItgrg0v
	E/ofMzctpv9GJ0799l9I04o5FD7XyxPPpj+ee
X-Google-Smtp-Source: AGHT+IGjEOIHrmfM7ezfh27Xzea24O4bRYWpgPSlKnEmn5Ffc3QES0sPWXdEsTBBAXnmQNHKy//6OSpslLEBp2dKAfc=
X-Received: by 2002:a81:7202:0:b0:5ff:b07b:99f0 with SMTP id
 n2-20020a817202000000b005ffb07b99f0mr1289150ywc.93.1705909130740; Sun, 21 Jan
 2024 23:38:50 -0800 (PST)
MIME-Version: 1.0
References: <20231226214610.109282-1-surenb@google.com> <170578498755.24348.16166096320323933297.git-patchwork-notify@kernel.org>
 <Zaw31DVa9q3JZASo@shell.armlinux.org.uk>
In-Reply-To: <Zaw31DVa9q3JZASo@shell.armlinux.org.uk>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 21 Jan 2024 23:38:38 -0800
Message-ID: <CAJuCfpGV_CwQm+PuiqRz3L1x7QnpgE9LQb4PPChqFv0mzbYeBw@mail.gmail.com>
Subject: Re: [PATCH 1/1] arch/mm/fault: fix major fault accounting when
 retrying under per-VMA lock
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: patchwork-bot+linux-riscv@kernel.org, linux-riscv@lists.infradead.org, 
	akpm@linux-foundation.org, willy@infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, palmer@dabbelt.com, mpe@ellerman.id.au, 
	christophe.leroy@csgroup.eu, agordeev@linux.ibm.com, 
	gerald.schaefer@linux.ibm.com, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_233852_890415_2239E03A 
X-CRM114-Status: GOOD (  23.09  )
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

T24gU2F0LCBKYW4gMjAsIDIwMjQgYXQgMToxNeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIFNhdCwgSmFuIDIwLCAyMDI0IGF0
IDA5OjA5OjQ3UE0gKzAwMDAsIHBhdGNod29yay1ib3QrbGludXgtcmlzY3ZAa2VybmVsLm9yZyB3
cm90ZToKPiA+IEhlbGxvOgo+ID4KPiA+IFRoaXMgcGF0Y2ggd2FzIGFwcGxpZWQgdG8gcmlzY3Yv
bGludXguZ2l0IChmaXhlcykKPiA+IGJ5IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRh
dGlvbi5vcmc+Ogo+ID4KPiA+IE9uIFR1ZSwgMjYgRGVjIDIwMjMgMTM6NDY6MTAgLTA4MDAgeW91
IHdyb3RlOgo+ID4gPiBBIHRlc3QgWzFdIGluIEFuZHJvaWQgdGVzdCBzdWl0ZSBzdGFydGVkIGZh
aWxpbmcgYWZ0ZXIgWzJdIHdhcyBtZXJnZWQuCj4gPiA+IEl0IHR1cm5zIG91dCB0aGF0IGFmdGVy
IGhhbmRsaW5nIGEgbWFqb3IgZmF1bHQgdW5kZXIgcGVyLVZNQSBsb2NrLCB0aGUKPiA+ID4gcHJv
Y2VzcyBtYWpvciBmYXVsdCBjb3VudGVyIGRvZXMgbm90IHJlZ2lzdGVyIHRoYXQgZmF1bHQgYXMg
bWFqb3IuCj4gPiA+IEJlZm9yZSBbMl0gcmVhZCBmYXVsdHMgd291bGQgYmUgZG9uZSB1bmRlciBt
bWFwX2xvY2ssIGluIHdoaWNoIGNhc2UKPiA+ID4gRkFVTFRfRkxBR19UUklFRCBmbGFnIGlzIHNl
dCBiZWZvcmUgcmV0cnlpbmcuIFRoYXQgaW4gdHVybiBjYXVzZXMKPiA+ID4gbW1fYWNjb3VudF9m
YXVsdCgpIHRvIGFjY291bnQgdGhlIGZhdWx0IGFzIG1ham9yIG9uY2UgcmV0cnkgY29tcGxldGVz
Lgo+ID4gPiBXaXRoIHBlci1WTUEgbG9ja3Mgd2Ugb2Z0ZW4gcmV0cnkgYmVjYXVzZSBhIGZhdWx0
IGNhbid0IGJlIGhhbmRsZWQKPiA+ID4gd2l0aG91dCBsb2NraW5nIHRoZSB3aG9sZSBtbSB1c2lu
ZyBtbWFwX2xvY2suIFRoZXJlZm9yZSBzdWNoIHJldHJpZXMKPiA+ID4gZG8gbm90IHNldCBGQVVM
VF9GTEFHX1RSSUVEIGZsYWcuIFRoaXMgbG9naWMgZG9lcyBub3Qgd29yayBhZnRlciBbMl0KPiA+
ID4gYmVjYXVzZSB3ZSBjYW4gbm93IGhhbmRsZSByZWFkIG1ham9yIGZhdWx0cyB1bmRlciBwZXIt
Vk1BIGxvY2sgYW5kCj4gPiA+IHVwb24gcmV0cnkgdGhlIGZhY3QgdGhlcmUgd2FzIGEgbWFqb3Ig
ZmF1bHQgZ2V0cyBsb3N0LiBGaXggdGhpcyBieQo+ID4gPiBzZXR0aW5nIEZBVUxUX0ZMQUdfVFJJ
RUQgYWZ0ZXIgcmV0cnlpbmcgdW5kZXIgcGVyLVZNQSBsb2NrIGlmCj4gPiA+IFZNX0ZBVUxUX01B
Sk9SIHdhcyByZXR1cm5lZC4gSWRlYWxseSB3ZSB3b3VsZCB1c2UgYW4gYWRkaXRpb25hbAo+ID4g
PiBWTV9GQVVMVCBiaXQgdG8gaW5kaWNhdGUgdGhlIHJlYXNvbiBmb3IgdGhlIHJldHJ5IChjb3Vs
ZCBub3QgaGFuZGxlCj4gPiA+IHVuZGVyIHBlci1WTUEgbG9jayB2cyBvdGhlciByZWFzb24pIGJ1
dCB0aGlzIHNpbXBsZXIgc29sdXRpb24gc2VlbXMKPiA+ID4gdG8gd29yaywgc28ga2VlcGluZyBp
dCBzaW1wbGUuCj4gPiA+Cj4gPiA+IFsuLi5dCj4gPgo+ID4gSGVyZSBpcyB0aGUgc3VtbWFyeSB3
aXRoIGxpbmtzOgo+ID4gICAtIFsxLzFdIGFyY2gvbW0vZmF1bHQ6IGZpeCBtYWpvciBmYXVsdCBh
Y2NvdW50aW5nIHdoZW4gcmV0cnlpbmcgdW5kZXIgcGVyLVZNQSBsb2NrCj4gPiAgICAgaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzQ2ZTcxNGM3MjljOAo+ID4KPiA+IFlvdSBhcmUgYXdl
c29tZSwgdGhhbmsgeW91IQo+Cj4gTm93IHRoYXQgMzItYml0IEFSTSBoYXMgc3VwcG9ydCBmb3Ig
dGhlIHBlci1WTUEgbG9jaywgZG9lcyB0aGF0IGFsc28KPiBuZWVkIHRvIGJlIHBhdGNoZWQ/CgpZ
ZXMsIEkgdGhpbmsgc28uIEkgbWlzc2VkIHRoZSBBUk0zMiBjaGFuZ2UgdGhhdCBhZGRlZCBzdXBw
b3J0IGZvcgpwZXItVk1BIGxvY2tzLiBXaWxsIHBvc3QgYSBzaW1pbGFyIHBhdGNoIGZvciBpdCB0
b21vcnJvdy4KVGhhbmtzLApTdXJlbi4KCj4KPiAtLQo+IFJNSydzIFBhdGNoIHN5c3RlbTogaHR0
cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwo+IEZUVFAgaXMgaGVy
ZSEgODBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
