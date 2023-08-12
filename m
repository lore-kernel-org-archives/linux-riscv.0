Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23122C001B0
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Aug 2023 00:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h27K8yLEezMUZWdSTFv8E818zY1M7U/duYoYqoEO4tM=; b=4npZOUZbz4p2GC
	/ny9j6GIjf24CsoqNKknPrsD0s9kTAKtMmAuHIsz0uBz7BECCWMRzNNRrLHJ8GFOI3HGro1s/LFJL
	r/z9QPrcQxpQRES0GuqPU1WvoxNbY6c8oFLb6p59gYtRQ4wGPtwb4TZS2sYjUB54dad+HTZxEAXmF
	LdexBMtuwQ7py0433gE/5xceRcQ5ejOOdI69Vw2+4nLe/Akz4qd48e/nBmJLvsqRYgzF4axoiqTWM
	yH+uG9G5/qcH9uEZM1XWv62+W9WOuCVyDJI8dvJtCzaScILQm+DhjsPcJtxVBs4TiNNAUUFpw+h6j
	0slinhntr4qG2ydhYZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUcLi-00C4x3-2O;
	Sat, 12 Aug 2023 00:19:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUcLb-00C4uN-1m
	for linux-riscv@lists.infradead.org;
	Sat, 12 Aug 2023 00:19:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52D9665DB8
	for <linux-riscv@lists.infradead.org>; Sat, 12 Aug 2023 00:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E517C433CC
	for <linux-riscv@lists.infradead.org>; Sat, 12 Aug 2023 00:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691799553;
	bh=ZH7R8L9H36iGum3yddu2dsyzpdsuw1sAIenikiEMZA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ay4YlKH5YOBAS9PJ9FowqgsyJw2ANhvUwCuhnSwEbJdZhlvPKQzuw8CAibvAA2gr0
	 G2Mum8efPmzCKhj2iVg5XstRQELdn9DTh4UwcrgRpg+z37C2I4WFinYitJKYPoYQ7W
	 /lGYlwI79qNPj/8BsId04ZaeWRo4bbLMjS3G/794FSkFYaqh5R/J/R8291T79zWm+P
	 ITy4f1L8K2IiLCZ2Zf8r0RkmwJAhIPvp07qWxfuyWdABsPyzyt8c4i0Wz8Tkv9ULiv
	 OrMu0agB2Z3b/Rv8W5/ssWQFwNWty0xHiKyJXiy8LntRG0Aka1gC8jDL95sn4jke+D
	 f7r89GSd+vuyg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so5201302a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 17:19:13 -0700 (PDT)
X-Gm-Message-State: AOJu0YxTVMkm8NqqXVByh2EBoy4H271QELuRoPM2EBkyKGcqfkZOHOR7
	j/bAkf4UNNwn6h7PoS3QfQwo2AjJn4JC68PTvuM=
X-Google-Smtp-Source: AGHT+IGykQHZkBnk0VjR3Xj0zOX9nVrUef4Ne260Er2ch8t9g/FTZHcOPiq+G7Cvcs2WlBhAQJvmDn5QazlY9Qk6qU4=
X-Received: by 2002:a05:6402:11c9:b0:51e:5bd5:fe7e with SMTP id
 j9-20020a05640211c900b0051e5bd5fe7emr8275790edw.17.1691799551836; Fri, 11 Aug
 2023 17:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230802164701.192791-1-guoren@kernel.org> <20230802164701.192791-5-guoren@kernel.org>
 <ec070d3b-80fb-b625-cde1-80ead49c6227@redhat.com>
In-Reply-To: <ec070d3b-80fb-b625-cde1-80ead49c6227@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 12 Aug 2023 08:18:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTq2i6Bv7vq4_aV0pD-vOrNJQ=5Rfm7fCLHfNw-Zy3QMQ@mail.gmail.com>
Message-ID: <CAJF2gTTq2i6Bv7vq4_aV0pD-vOrNJQ=5Rfm7fCLHfNw-Zy3QMQ@mail.gmail.com>
Subject: Re: [PATCH V10 04/19] riscv: qspinlock: Add basic queued_spinlock support
To: Waiman Long <longman@redhat.com>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org, 
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, boqun.feng@gmail.com, 
	tglx@linutronix.de, paulmck@kernel.org, rostedt@goodmis.org, 
	rdunlap@infradead.org, catalin.marinas@arm.com, conor.dooley@microchip.com, 
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, alexghiti@rivosinc.com, 
	keescook@chromium.org, greentime.hu@sifive.com, ajones@ventanamicro.com, 
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn, 
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-csky@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_171915_672808_8E135DED 
X-CRM114-Status: GOOD (  13.16  )
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

T24gU2F0LCBBdWcgMTIsIDIwMjMgYXQgMzozNOKAr0FNIFdhaW1hbiBMb25nIDxsb25nbWFuQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4KPiBPbiA4LzIvMjMgMTI6NDYsIGd1b3JlbkBrZXJuZWwub3Jn
IHdyb3RlOgo+ID4gICAgICAgXAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc3BpbmxvY2suaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3BpbmxvY2suaAo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzY0NGE5MmQ0NTQ4Cj4g
PiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NwaW5sb2Nr
LmgKPiA+IEBAIC0wLDAgKzEsMTcgQEAKPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMCAqLwo+ID4gKwo+ID4gKyNpZm5kZWYgX19BU01fUklTQ1ZfU1BJTkxPQ0tfSAo+ID4g
KyNkZWZpbmUgX19BU01fUklTQ1ZfU1BJTkxPQ0tfSAo+ID4gKwo+ID4gKyNpZmRlZiBDT05GSUdf
UVVFVUVEX1NQSU5MT0NLUwo+ID4gKyNkZWZpbmUgX1FfUEVORElOR19MT09QUyAgICAgKDEgPDwg
OSkKPiA+ICsjZW5kaWYKPiA+ICsKPiA+ICsjaWZkZWYgQ09ORklHX1FVRVVFRF9TUElOTE9DS1MK
Pgo+IFlvdSBjYW4gbWVyZ2UgdGhlIHR3byAiI2lmZGVmIENPTkZJR19RVUVVRURfU1BJTkxPQ0tT
IiBpbnRvIHNpbmdsZSBvbmUKPiB0byBhdm9pZCB0aGUgZHVwbGljYXRpb24uCk9rYXkuCgo+Cj4g
Q2hlZXJzLAo+IExvbmdtYW4KPgo+ID4gKyNpbmNsdWRlIDxhc20vcXNwaW5sb2NrLmg+Cj4gPiAr
I2luY2x1ZGUgPGFzbS9xcndsb2NrLmg+Cj4gPiArI2Vsc2UKPiA+ICsjaW5jbHVkZSA8YXNtLWdl
bmVyaWMvc3BpbmxvY2suaD4KPiA+ICsjZW5kaWYKPiA+ICsKPiA+ICsjZW5kaWYgLyogX19BU01f
UklTQ1ZfU1BJTkxPQ0tfSCAqLwo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
