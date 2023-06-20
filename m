Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CEBEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 15:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EeVtMoXW+NZQTnoEcCOn2tbWHTFFXMpQQoSB83QGMiw=; b=yG3Mq6n69KgAWa
	VRBSlC7ilfpROiQl7w1rOpnq5+YrYG6AWRYuK6d1BkJ0TNkIE38nqgun/xmZZ+126n4pHhmSUP+rR
	U8YH7eL4bqXHMMI/Fos7ogwyr90MxObCFIikmhBobs18DUA+FvWDxhaHKucj9uE5rkthi1X38idCZ
	/iR7YbETl1PMztCVtpturbVevjuCiOafXsqMjVhIvIQ67ca8OFRG9JkvGPFBTo/TGOzGSoG/Q5r31
	mvr3cKBcNOmpUwJVDQjk9RordDC1DedIg5ROfu9nioYX0Sbt2a0KPGYp31vaIbTWcaTiubgbSDG2K
	ujvDJUxD2U80QrzWMe9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBdLe-00BgMH-2h;
	Tue, 20 Jun 2023 15:32:50 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBdLb-00BgK2-2n;
	Tue, 20 Jun 2023 15:32:49 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-518b69d5b5dso6720849a12.1;
        Tue, 20 Jun 2023 08:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687275165; x=1689867165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0jVFIWxWqZ/TuBplqDvmEEANKo26b83Dz5MygWHhzo=;
        b=R2BhcgahF4eA1vnlN0qyJmASSGyaKyq8k8oOrUAtCf6A4nOmgevBEhPzEV8rIbjTgF
         yXzVElUQYcMdeYQTQkO+X2Y+9ZuwgkppnVdZSXyRsEkPbs6x/ssnctoQke0QTIMErPf3
         qLgAPk3+Vpo3W0G2QiGZq35LggwDfRrpFYUUYGCVB1g7szVQ79eBlKEygcj7p7OVjxQf
         pa51oJokqPD+3D2MoPj8cm17qxZzYmsGb5TOKjwNPuJs0U4g/8S2QCH5/u+vSkwhFWvm
         3m8n5V/yFyRQTrN52yzRlNSqLm1w2gZ7QUzER3KDhhogdRbdvNc25JV4yGkEnTVq2UW0
         ShAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687275165; x=1689867165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0jVFIWxWqZ/TuBplqDvmEEANKo26b83Dz5MygWHhzo=;
        b=Q4/4/lP7eHoeZFveTbVn5aoGH3Sh2Lih1+mG8fMpj9CX9zn2djfWb92ebSn+rSqg9u
         QAeD098sGikuHfGbQXnLIypU+vwHm/TGX1HPWks9wnbAaJWWGaE+RBeJa+LCVAy0rdvN
         VEa1tmxNbK56G4qM8f/ebl7CfWPSihWfL0vr3OL7jehtRtkMEvYMCh6Oztfne7t/ROdz
         NrB/wZvCwwzu3gby+/aX8999zFsSH41XeD4Eu/SYlLW7k3gVK46dTPKb95p1rfX0Jg/e
         L9yIkiBS1eNo7gD3bHA360v6N50HLmTE9wOwBUwu4keI9eTOUZ3j0Lxu0KnLDLWgzJPO
         hI2Q==
X-Gm-Message-State: AC+VfDzKu3CiJnwHT6aDGQGPBJ8Bdj6e7lv+EgMdYvGVzqdatp/4BipG
	AiiuqjMIGPuoJCpk8H11Vw8/vb13+MYNeYgsLO0=
X-Google-Smtp-Source: ACHHUZ5ux98lA0dfOqVXfQP0ndlYyBoHuqHpCIjpPqNu3qgP8TLa7JJDdMIHBmrGJ6oD7j3SfcbrFl7+8TyeQPspzGA=
X-Received: by 2002:aa7:cf16:0:b0:51a:40ca:d081 with SMTP id
 a22-20020aa7cf16000000b0051a40cad081mr7305340edy.27.1687275164525; Tue, 20
 Jun 2023 08:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-7-rppt@kernel.org>
 <87jzw0qu3s.ffs@tglx> <20230618231431.4aj3k5ujye22sqai@moria.home.lan>
 <87h6r4qo1d.ffs@tglx> <20230620105104.60cb64d8@gandalf.local.home>
In-Reply-To: <20230620105104.60cb64d8@gandalf.local.home>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 20 Jun 2023 08:32:33 -0700
Message-ID: <CAADnVQK_dWhPxdjs4HuAXWBTeVAf01er15dZU8tC+d=g6QCPXw@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller" <davem@davemloft.net>, 
	Dinh Nguyen <dinguyen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Song Liu <song@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Will Deacon <will@kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org, 
	linux-mm <linux-mm@kvack.org>, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-s390 <linux-s390@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, loongarch@lists.linux.dev, 
	Network Development <netdev@vger.kernel.org>, sparclinux@vger.kernel.org, 
	X86 ML <x86@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_083247_901891_6E44214A 
X-CRM114-Status: GOOD (  15.80  )
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

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgNzo1MeKAr0FNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgMTkgSnVuIDIwMjMgMDI6NDM6NTggKzAy
MDAKPiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4gd3JvdGU6Cj4KPiA+IE5v
dyB5b3UgbWlnaHQgYXJndWUgdGhhdCBpdCBfaXNfIGEgImhvdHBhdGgiIGR1ZSB0byB0aGUgQlBG
IHVzYWdlLCBidXQKPiA+IHRoZW4gZXZlbiBtb3JlIHNvIGFzIGFueSBpbnRlcm1lZGlhdGUgd3Jh
cHBlciB3aGljaCBjb252ZXJ0cyBmcm9tIG9uZQo+ID4gZGF0YSByZXByZXNlbnRhdGlvbiB0byBh
bm90aGVyIGRhdGEgcmVwcmVzZW50YXRpb24gaXMgbm90IGdvaW5nIHRvCj4gPiBpbmNyZWFzZSBw
ZXJmb3JtYW5jZSwgcmlnaHQ/Cj4KPiBKdXN0IGFzIGEgc2lkZSBub3RlLiBCUEYgY2FuIG5vdCBh
dHRhY2ggaXRzIHJldHVybiBjYWxsaW5nIGNvZGUgdG8KPiBmdW5jdGlvbnMgdGhhdCBoYXZlIG1v
cmUgdGhhbiA2IHBhcmFtZXRlcnMgKDMgb24gMzIgYml0IHg4NiksIGJlY2F1c2Ugb2YKPiB0aGUg
d2F5IEJQRiByZXR1cm4gcGF0aCB0cmFtcG9saW5lIHdvcmtzLiBJdCBpcyBhIHJlcXVpcmVtZW50
IHRoYXQgYWxsCj4gcGFyYW1ldGVycyBsaXZlIGluIHJlZ2lzdGVycywgYW5kIG5vbmUgb24gdGhl
IHN0YWNrLgoKSXQncyBhY3R1YWxseSA3IGFuZCB0aGF0IHJlc3RyaWN0aW9uIGlzIGJlaW5nIGxp
ZnRlZC4KVGhlIHBhdGNoIHNldCB0byBhdHRhY2ggdG8gPD0gMTIgaXMgYmVpbmcgZGlzY3Vzc2Vk
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
