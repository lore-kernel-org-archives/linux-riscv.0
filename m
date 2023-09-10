Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24368EE14D8
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 09:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj27696rA/MuE3rHB/hmD8iHYAusQuhDnvvlAzs4aQw=; b=JejAdqgfXQvDjJ
	efomhBbrAdsTnZbhCRgyffdTiOLAvER3Ooq+94L2yxyAcifCg+k3CqTOxbuqtqiwKuijpZ8xnXO8g
	7QzngsNZ17uOr8cUWnZlKxN3rP7vKphy04vCaVHjCbjc2nBt1jysT0Wq3j7BCdiB06TyZBV8YmYf3
	/Ico9fXzCmhAvoWFlBz/p3GJ0uERIosnKumQtaHVZ1tH94baNLF+8GQwPMiQSpRMit2NBr1jHA9c6
	8T+56yqAiMzoCBxBEo1vx4XV1MtBZz/SUinuF8cWfUCwdFihVC3iGRRpT8nQGl/jIdABQg3n3NpsU
	E8pOm31Id9Gt+ZxS8OIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfGYy-00GKep-2Z;
	Sun, 10 Sep 2023 09:17:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfGYw-00GKe6-0J
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 09:17:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4823C60C2C
	for <linux-riscv@lists.infradead.org>; Sun, 10 Sep 2023 09:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05AF4C433CD
	for <linux-riscv@lists.infradead.org>; Sun, 10 Sep 2023 09:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694337420;
	bh=+JBZQJzotIOYs9fXSQFX8sizkN6DRxWti0Yre7ZIJX4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gZ59VqAjC/z+rERsUUL4+ZXtm+WO5006wx1jnl11U81wJuab+zgpyey/kgk108jCZ
	 ipAxJeGoiPz/C5dJdmMRjPrJa+VYexYxrp/6JyFDM0amtAZnwWsL1AhX2mil0MLU8d
	 +WuBvrpFpjb0K3B9lRIlf1hAAgkuCWl05ELy6sDAFwl3ZcSACpcOfCy7qMiExG3wYh
	 kA9oJ0TpQWfD6fVj7uiutH4jNGTXV/VaBm8D+MmVCE/Y1DvskIMA6zTALIx4l4K6yv
	 1J9dRSSLUWsCvEVSskInB2tB+7k4PkcBuys7gZx/D+rZvjcHCQJP28uDd7UbrTtbie
	 o60TMOic52Jpg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-500c7796d8eso5695758e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 10 Sep 2023 02:16:59 -0700 (PDT)
X-Gm-Message-State: AOJu0YxGxBZWXYIEw0Qks7Chn9uZ/XcBeh+AU7g788OrsMJdtfnxpxP4
	tv+MTTrAkUVOeTaUzhjUsQMk9Dx4hjix4Q3Vkc0=
X-Google-Smtp-Source: AGHT+IFpF+LgwLC9jMuH3fyzLk6H5NxjEAwfEs9DH+cBxZFoOziKJXI+MVzuCCAr7xmvmidUJE/jFbRbHqFEIsgcywo=
X-Received: by 2002:a05:6512:456:b0:4fe:1681:9378 with SMTP id
 y22-20020a056512045600b004fe16819378mr4859204lfk.66.1694337418174; Sun, 10
 Sep 2023 02:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230910082911.3378782-1-guoren@kernel.org> <20230910-esteemed-exodus-706aaae940b1@spud>
In-Reply-To: <20230910-esteemed-exodus-706aaae940b1@spud>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 10 Sep 2023 17:16:46 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRQd_dNuZHNwfg3SwD0XERaYXYUdFUFQiarym40kpxFRQ@mail.gmail.com>
Message-ID: <CAJF2gTRQd_dNuZHNwfg3SwD0XERaYXYUdFUFQiarym40kpxFRQ@mail.gmail.com>
Subject: Re: [PATCH V11 00/17] riscv: Add Native/Paravirt qspinlock support
To: Conor Dooley <conor@kernel.org>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org, 
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, longman@redhat.com, 
	boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org, 
	rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com, 
	conor.dooley@microchip.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com, 
	ajones@ventanamicro.com, jszhang@kernel.org, wefu@redhat.com, 
	wuwei2016@iscas.ac.cn, leobras@redhat.com, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_021702_221133_55030513 
X-CRM114-Status: GOOD (  12.41  )
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

T24gU3VuLCBTZXAgMTAsIDIwMjMgYXQgNDo1OOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIFNlcCAxMCwgMjAyMyBhdCAwNDoyODo1NEFNIC0w
NDAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPgo+ID4gQ2hhbmdsb2c6Cj4gPiBWMTE6Cj4g
PiAgLSBCYXNlZCBvbiBMZW9uYXJkbyBCcmFzJ3MgY21weGNoZ19zbWFsbCBwYXRjaGVzIHY1Lgo+
ID4gIC0gQmFzZWQgb24gR3VvIFJlbidzIE9wdGltaXplIGFyY2hfc3Bpbl92YWx1ZV91bmxvY2tl
ZCBwYXRjaCB2My4KPiA+ICAtIFJlbW92ZSBhYnVzaW5nIGFsdGVybmF0aXZlIGZyYW1ld29yayBh
bmQgdXNlIGp1bXBfbGFiZWwgaW5zdGVhZC4KPgo+IGJ0dywgSSBkaWRuJ3Qgc2F5IHRoYXQgdXNp
bmcgYWx0ZXJuYXRpdmVzIHdhcyB0aGUgcHJvYmxlbSwgaXQgd2FzCj4gYWJ1c2luZyB0aGUgZXJy
YXRhIGZyYW1ld29yayB0byBwZXJmb3JtIGZlYXR1cmUgZGV0ZWN0aW9uIHRoYXQgSSBoYWQKPiBh
IHByb2JsZW0gd2l0aC4gVGhhdCdzIG5vdCBjaGFuZ2VkIGluIHYxMS4KSSd2ZSByZW1vdmVkIGVy
cmF0YSBmZWF0dXJlIGRldGVjdGlvbi4gVGhlIG9ubHkgcmVsYXRlZCBwYXRjaGVzIGFyZToKIC0g
cmlzY3Y6IHFzcGlubG9jazogZXJyYXRhOiBBZGQgRVJSQVRBX1RIRUFEX1dSSVRFX09OQ0UgZml4
dXAKIC0gcmlzY3Y6IHFzcGlubG9jazogZXJyYXRhOiBFbmFibGUgcXNwaW5sb2NrIGZvciBULUhF
QUQgcHJvY2Vzc29ycwoKV2hpY2ggb25lIGlzIHlvdXIgY29uY2Vybj8gQ291bGQgeW91IHJlcGx5
IG9uIHRoZSBleGFjdCBwYXRjaCB0aHJlYWQ/IFRoeC4KCj4KPiBBIHN0cm9uZ2VyIGZvcndhcmQg
cHJvZ3Jlc3MgZ3VhcmFudGVlIGlzIG5vdCBhbiBlcnJhdHVtLCBBRkFJQ1QuClNvcnJ5LCB0aGVy
ZSBpcyBubyBlcnJhdHVtIG9mICJzdHJvbmdlciBmb3J3YXJkIHByb2dyZXNzIGd1YXJhbnRlZSIg
aW4gdGhlIFYxMS4KCj4KPiA+ICAtIEludHJvZHVjZSBwcmVmZXRjaC53IHRvIGltcHJvdmUgVC1I
RUFEIHByb2Nlc3NvcnMnIExSL1NDIGZvcndhcmQgcHJvZ3Jlc3MKPiA+ICAgIGd1YXJhbnRlZS4K
PiA+ICAtIE9wdGltaXplIHFzcGlubG9jayB4Y2hnX3RhaWwgd2hlbiBOUl9DUFVTID49IDE2Sy4K
CgoKLS0KQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
