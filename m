Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35934C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:49:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 025E4206E9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:49:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WJQgd7MY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ef7GM87o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 025E4206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wLKXCTB0r8+eyAmZmgyjwHUmdRf+UUDGSwWW3Qr8FaU=; b=WJQgd7MYKXhQA56rCj8hN6AeL
	5dha08IHgQ1vmnPHsLwecmcRlC78iUiw+/OY2i7mLWAgb+ud8dsM8g27aqLczbUMn4tu4Dq6xxNh/
	MwaKOXmR8p2f7QiQBLVwQkgqd3DCIq7stmRaRsk8d/YKTZzaEUN257U6UmPhryqEbVJIi2iIVzCxo
	UxOvw9otctowU5d45Myt8zUqxtc6AyJyPBL5xaNiMZW73egvu5LB9n5baq731QRWowblufog6fHhN
	TWlqhanhBBaW0yir7dBzQVUdJe2hBiu76JB/Of11cO79A0A1L+Ui97wUHHfX3RUEMeG4/jwCkVZsP
	9TxaafWGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqGdl-0000uS-Pz; Tue, 30 Jun 2020 13:49:37 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqGdh-0000ti-VW
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 13:49:36 +0000
Received: by mail-qt1-x843.google.com with SMTP id x62so15581333qtd.3
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2020 06:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WCrdJUoNVNNMj8JcDT6tRj1uQCsRvEZVh/xP9ivYzzs=;
 b=ef7GM87owEHjWWyZhYOt5yKpO6ybIHzgnC7cjvyOUJ4xMppFHXLjST8+mNPx2xQ9An
 77XAlNKZvnz9cTrAGubCKc6fs3ik24cXf4Bx+OrhW25kTxETMrR4DZy1zp+lk8F4R3/C
 NnznwjPcHfOIOB+XEWiYhWz8xAT3+o40CDguW0sKfXIVbhOeg6XIrc+arStKmCWVHF0v
 LGxHFLD2u8zneviI2PylJ0CYM0KxHY7CppA2Unu5K/IICVZPkhggGxTkiE/ltj7AKDE/
 zqb0aNC4jELQOUC1hp+8kkEZ2Ol0yTOCugBoiS0tQXT4RLGkpBYa1M1PWJMbEv3hf8Us
 8MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WCrdJUoNVNNMj8JcDT6tRj1uQCsRvEZVh/xP9ivYzzs=;
 b=G0/hq4Sp3f7TeNVylDI4RzdGQ914w7/YB0hWZEkgf6yBsHqZM47NkoZl/TEvKwrmRk
 s8p5fN7/KU6H/ijzkD3SNJZtF7COpUPkqY2VsEsM93KgRsyPlCOoffMQ4b6ZAq7ec+Hg
 ph7xPWVOuvtaFOeF9bTbLaVI3vBcK3GoVCH7tNcui71PPCHWgZO0Jrno1dG0REj+5DfW
 lvZB4wovJxxOAV+8ioVuORHEhJNNGAU8Gu/K+hAFY6lgFRBF2c1wwy4xzyakf9KvHpmo
 SAPl8kYb2HOZ++w94XmD3xIJoOLdX4h145UUxxJJbdQQc1/okeihRLjOWXy7MiWyK0Gf
 Z+jQ==
X-Gm-Message-State: AOAM530QjoHEY0J1U33DwCv7qIG2azqlU9AtRSjbSBPzbAdr851d6Puy
 QtDybgdAP5c2SQCHs9D7ufn1H+Mqf6LsWgi+fbYEhQ==
X-Google-Smtp-Source: ABdhPJx8Ei3cFOq8xiHhSz6SjQc/8Ttg60O+lDWGyKpZbujsIXTFGlBADM7K3SaRvTmT8K4PcK4BwGZJ4MhOJ1wBVtU=
X-Received: by 2002:ac8:7a87:: with SMTP id x7mr21461263qtr.50.1593524970122; 
 Tue, 30 Jun 2020 06:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmtuysn227.fsf@suse.de>
 <CACT4Y+Y8=0m+Xku_+kQYuiiABgFUDzHBEqUK_FNGs8=f9NGZng@mail.gmail.com>
 <mvm4kqsn0e7.fsf@suse.de>
 <CACT4Y+askdjyUjw=D6yqnOHy8n7N3h7QFs8KjvkU5DOHGY66Zg@mail.gmail.com>
 <mvmv9j8llai.fsf@suse.de>
In-Reply-To: <mvmv9j8llai.fsf@suse.de>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 30 Jun 2020 15:49:18 +0200
Message-ID: <CACT4Y+Z3hMtE0+BZVijxoBWrQDYiZBzM9gW6L7UAR74hsft4RQ@mail.gmail.com>
Subject: Re: syzkaller on risc-v
To: Andreas Schwab <schwab@suse.de>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMzAsIDIwMjAgYXQgMzo0NSBQTSBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQHN1
c2UuZGU+IHdyb3RlOgo+ID4+ID4+IE9uIEp1biAzMCAyMDIwLCBEbWl0cnkgVnl1a292IHdyb3Rl
Ogo+ID4+ID4+Cj4gPj4gPj4gPiBLQVNBTiB3b3VsZCBiZSBhIHByZXJlcXVpc2l0ZSBmb3IgdGVz
dGluZyByaXNjLXYgb24gc3l6Ym90Lgo+ID4+ID4+Cj4gPj4gPj4gWW91IG5lZWQgdG8gaW1wbGVt
ZW50IHRoZSBHQ0Mgc3VwcG9ydCBmaXJzdC4KPiA+PiA+Cj4gPj4gPiBJbnRlcmVzdGluZy4gQmrD
tnJuIGNsYWltZWQgS0FTQU4gd29ya3MgYWxyZWFkeS4gIEFuZCB0aGVyZSBpczoKPiA+PiA+Cj4g
Pj4gPiBjb21taXQgOGFkOGI3MjcyMWQwZjA3ZmEwMmRiZTcxZjkwMTc0M2Y5YzcxYzhlNgo+ID4+
ID4gQXV0aG9yOiBOaWNrIEh1Cj4gPj4gPiBEYXRlOiAgIE1vbiBKYW4gNiAxMDozODozMiAyMDIw
IC0wODAwCj4gPj4gPiAgICAgcmlzY3Y6IEFkZCBLQVNBTiBzdXBwb3J0Cj4gPj4gPgo+ID4+ID4g
SXMgdGhlcmUgYW55IGtub3duIGlzc3VlIHdpdGggZ2NjPwo+ID4+Cj4gPj4gaHR0cHM6Ly9nY2Mu
Z251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9OTE0NDEKPiA+Pgo+ID4+ICQgZ2NjIC1m
c2FuaXRpemU9a2VybmVsLWFkZHJlc3MgLXhjIC0gPC9kZXYvbnVsbAo+ID4+IGNjMTogd2Fybmlu
Zzog4oCYLWZzYW5pdGl6ZT1hZGRyZXNz4oCZIGFuZCDigJgtZnNhbml0aXplPWtlcm5lbC1hZGRy
ZXNz4oCZIGFyZSBub3Qgc3VwcG9ydGVkIGZvciB0aGlzIHRhcmdldAo+ID4KPiA+IGh0dHBzOi8v
Z2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTkxNDQxI2MzCj4gPiBGaXhlZCA7
KQo+Cj4gWWVzLiAgV2hhdCdzIHlvdXIgcG9pbnQ/CgpNeSBwb2ludCBpcyB0aGF0IHRoZSBHQ0Mg
cGFydCBzZWVtcyB0byBiZSBpbXBsZW1lbnRlZCBhbHJlYWR5IGFuZCBpZgpvbmUgd2FudHMgdG8g
dXNlIEtBU0FOLCB0aGV5IGRvbid0IG5lZWQgdG8gaW1wbGVtZW50IEdDQyBzdXBwb3J0CmZpcnN0
LiBJdCBsb29rcyBsaWtlIHNvbWV0aGluZyBvbiB0aGUga2VybmVsIHNpZGUgYnJva2Ugc2luY2Ug
SmFudWFyeS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
