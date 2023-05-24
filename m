Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C2BC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 17:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KTnqb0+HUV3uSdBbK0umbteJ1s3DLISYRKFY9R/2ZlQ=; b=do+CySHnT1Oq9a
	lYW5HvkM2Oj7S6NjmL4rcM0KJYGrg2ZKvWy7yflYJlbgzR8i2ohvNrd3LfdArwPMgRhzpna+YS6GG
	3eIh0SkqNpZ8Q8TtEx3Zt+tzsArwS3p1ZISkQq1mxkOQk4Wi4YqFl4s/02atcGjeYu+jdj/acYDwA
	TttFI6vys7Qwc/2vRSZnm/YSQ23mdWCxXg2Ztnj+6/1t5NV8JDsMZJh1Z3hB6Gw+gTuMDFRHzMQeq
	Vqtbefhcy4K+USXo/49cV1iB4I7sDK5G8Qv7HCDMUWp/9RWKNzyjKQcgrJJ1FlMNXQLbmyNBRAD3V
	uwEGjs9au9XfccW1mMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sMV-00EC9C-2U;
	Wed, 24 May 2023 17:33:23 +0000
Received: from mail-ej1-f43.google.com ([209.85.218.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sMS-00EC67-2t;
	Wed, 24 May 2023 17:33:22 +0000
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-96f44435d92so35531066b.0;
        Wed, 24 May 2023 10:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684949597; x=1687541597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCSKoj+QaYMGiALxKIVygFGEfEGQMG7Gw+jdrUBXjYI=;
        b=SbARSQf6XoJGa51JiCSGePRTJCfBeDrYeDtVz88n7tv+08TJve+HLEMVRG1ERL1LAC
         9k8EvQSJ07C0P483Gzsupd1YzHWVmtNrMUwJUt+m2/u7NmXNEm0pDdQWCi2nNTO5BY7j
         Z0zT22ul6jIMQYMF3XPoVrARIOEB3b/RrIJ6OiRqtBdQ1KsKB+TfbzzFNqxXMh4YN7gD
         MiLLgng7J7H9ua7VNUXALR7hVvIA2ZH22kAV+9xbD3CYJ5/l1d5MWr+FKAj7+3uD9Lqg
         +vuWQZZKDz/p/JPKZlmHN2xssBplQ5NRm+t7KHtJ3lOqEDzHS7bWaoc7tJCjdZdCcCmj
         eRSw==
X-Gm-Message-State: AC+VfDxcce5KLPn1Rknr73R31BzNDyk6OeGrBdtCN98RNQH8Q2lMuxVN
	jJA4hYiGgjdz9pO8TV/Qy9hwo0GyvjlTHijqmZY=
X-Google-Smtp-Source: ACHHUZ75t5LOoP5fPEw1B3B8AOZ5QAW3p/uA3PR3RjFQ63NrJQ3bU0l+qjgSiV2WQ1zsptMKJ1KiCOsk0UIwyQ0utjI=
X-Received: by 2002:a17:906:2218:b0:96f:4c38:4b1a with SMTP id
 s24-20020a170906221800b0096f4c384b1amr16403004ejs.5.1684949596574; Wed, 24
 May 2023 10:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230517131102.934196-1-arnd@kernel.org> <20230517131102.934196-11-arnd@kernel.org>
 <CAJZ5v0h0spuxK-7LBJSU9BK2TEOUeMjf7hhKScadkxFN_RwStQ@mail.gmail.com> <6b7f6f66-7890-47a3-a22d-e29f2944823a@app.fastmail.com>
In-Reply-To: <6b7f6f66-7890-47a3-a22d-e29f2944823a@app.fastmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 24 May 2023 19:33:05 +0200
Message-ID: <CAJZ5v0h+HNTMcfxFuOeO92D__NzJSTHfjzP5VQG4D+WuNmHpdw@mail.gmail.com>
Subject: Re: [PATCH 10/14] suspend: add a arch_resume_nosmt() prototype
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	x86@kernel.org, Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Pavel Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, audit@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_103320_931738_E92EE770 
X-CRM114-Status: GOOD (  14.75  )
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

T24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgNDo1MuKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXkgMTcsIDIwMjMsIGF0IDE1OjQ4LCBSYWZhZWwg
Si4gV3lzb2NraSB3cm90ZToKPiA+IE9uIFdlZCwgTWF5IDE3LCAyMDIzIGF0IDM6MTLigK9QTSBB
cm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gRnJvbTogQXJu
ZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+Pgo+ID4+IFRoZSBhcmNoX3Jlc3VtZV9ub3Nt
dCgpIGhhcyBhIF9fd2VhayBkZWZpbml0aW9uLCBwbHVzIGFuIHg4Ngo+ID4+IHNwZWNpZmljIG92
ZXJyaWRlLCBidXQgbm8gcHJvdG90eXBlIHRoYXQgZW5zdXJlcyB0aGUgdHdvIGhhdmUKPiA+PiB0
aGUgc2FtZSBhcmd1bWVudHMuIFRoaXMgY2F1c2VzIGEgVz0xIHdhcm5pbmc6Cj4gPj4KPiA+PiBh
cmNoL3g4Ni9wb3dlci9oaWJlcm5hdGUuYzoxODk6NTogZXJyb3I6IG5vIHByZXZpb3VzIHByb3Rv
dHlwZSBmb3IgJ2FyY2hfcmVzdW1lX25vc210JyBbLVdlcnJvcj1taXNzaW5nLXByb3RvdHlwZXNd
Cj4gPj4KPiA+PiBBZGQgdGhlIHByb3RvdHlwZSBpbiBsaW51eC9zdXNwZW5kLmgsIHdoaWNoIGlz
IGluY2x1ZGVkIGluCj4gPj4gYm90aCBwbGFjZXMuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBB
cm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+ID4KPiA+IERvIHlvdSB3YW50IG1lIHRvIHBp
Y2sgdGhpcyB1cD8KPgo+IFllcywgcGxlYXNlIGRvLiBUaGFua3MsCgpEb25lLCB0aGFua3MhCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
