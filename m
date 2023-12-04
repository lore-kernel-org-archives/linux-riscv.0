Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E276C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6LItnM+EU6HQ3ZFVicCH/lw8AreXmm+M3ptZ/TYKNfs=; b=d8oEoA+M47ucDR
	epBGdMK9WS/kA+b5D6+l8JSrzpCRlnUabxWnSbV+4Jq77DLK5tasv/Y5vvjQpa8EZWzm7cSFpwxU5
	B4O7FpIGAxuXhkELRTq3KM7UGRNj15GY0OfqxkGJ0GcqbkMOG97EHNFuKk6suZLAxtx4UkapPsJN4
	+cCqq7kOKXZ+kD12gHe4dLSoiS3my0DSxUW/4oTvE1QseAeMARTEG0ynpts9mTp50vZhmRy1rEX7d
	jlKJDXrJXp9MRxMDQwMZLJ8Cy041GTqOTYa7RwexsE7ux0YpY0KwA/OFN84T+rcSPYA/JQjD5SfRr
	BblFDeVGZl/dz+qWeo6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rABoK-0055x2-1P;
	Mon, 04 Dec 2023 16:28:44 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rABoH-0055vG-2w
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 16:28:43 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-332d5c852a0so3578038f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 08:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701707315; x=1702312115; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ExnfZxVYVMvXtVrPDzieFUCNS347qRDxh4C9hinedE=;
        b=oOdIpaxYRkW6pwl5OyoPPxl8Yadm+t2XZ7h7ROpgeeAbGLjWOOGZ45JBJZxWH+z0S4
         AXKsvxsPfvV9+ver5qlMvkyDaDid9yak+JU+Q5PTZyyBv8v1S5XL1fYDD+iphxr5Goei
         lSVDEE9ks2ao/SBHpHpUGEYe0H9bbEUJLs/R01aVSvuS3GJMJhGfh5P1qIfhr2J3t5cm
         5mjJsj9LjkxGn57IrULMJseoT8ePuyWzr5jA9EyvuFzSD9JEB9kGpcuBjn5lCaIZat3h
         7Q9whZQ56U0NXP+yKPIk2m9XfPacF2ga9+xDga0TK4hoXCEEcUV8OuA1+/iDiHEsakcu
         MMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701707315; x=1702312115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ExnfZxVYVMvXtVrPDzieFUCNS347qRDxh4C9hinedE=;
        b=YUnwLFwa8H/o4OFW1130HZNXksCmTDDCvi4iCy9Kl1RmYyhvGu7oKMsaXxuqp0uU0j
         IKBZHksnO/ibc24ly/i5vZsWjmheTEUhnhW3BtbJmik3ikc222ufC54TMpOkV17lSm07
         TOeggd8DzGqpiEiTpHMB32nTaJJ4NfBYkdDOOfcxfvN0ndLG1li9EP8RFjU70pDxIIwW
         ierRgzMssjktxOZRmx2MMYmuAq6hxUZud6QE7yLxkrhFXmqfn3Tf7/wztOCCc97PiUG2
         5AZqBkEKYA3jh4BGQ/TgfhPVXNPvN/ZjNh3YfAc9MtJ0BnUvsGmnjRs3fXGrdI9sc4qz
         wMRQ==
X-Gm-Message-State: AOJu0YwWqOwalO0VFLyX+BtU4G9bZgEqFCnNAAdgpSf0DoTzwbOlagec
	TYSKP9m+X23iRJ/XuMPl7Yr5j0DDm/b8LuDVVnYL5Q==
X-Google-Smtp-Source: AGHT+IGnOKjeCz5yB866/XKel7WGP0XqRZykiL2PjFZMSwT0owq2u4yw/k+2hL+LNgiWmi11i0MklXo5mO20cDi5GUg=
X-Received: by 2002:a5d:50c2:0:b0:333:2fd2:5d51 with SMTP id
 f2-20020a5d50c2000000b003332fd25d51mr3535271wrt.131.1701707315273; Mon, 04
 Dec 2023 08:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20231120144642.591358648@infradead.org> <20231120154948.708762225@infradead.org>
 <20231122021817.ggym3biyfeksiplo@macbook-pro-49.dhcp.thefacebook.com>
 <20231122111517.GR8262@noisy.programming.kicks-ass.net> <CABCJKufBiJjUdmnuy=HkV+dDnZ=xne-OBwPSfJ21RX9c0AzCZw@mail.gmail.com>
In-Reply-To: <CABCJKufBiJjUdmnuy=HkV+dDnZ=xne-OBwPSfJ21RX9c0AzCZw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 4 Dec 2023 08:28:21 -0800
Message-ID: <CAKwvOd=ZgoeXQAZZoLNYmd0OyuHktsnxLtcKzH4MEoDkPXnqyA@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/cfi,bpf: Fix BPF JIT call
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	davem@davemloft.net, dsahern@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, keescook@chromium.org, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, jpoimboe@kernel.org, joao@overdrivepizza.com, 
	mark.rutland@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_082841_948660_C5A020AF 
X-CRM114-Status: GOOD (  10.88  )
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

T24gRnJpLCBEZWMgMSwgMjAyMyBhdCAzOjU04oCvUE0gU2FtaSBUb2x2YW5lbiA8c2FtaXRvbHZh
bmVuQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMzoxNeKA
r0FNIFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4g
U28gdGhlIGtDRkkgdGhpbmcgaXMgJ25ldycgYnV0IHJlYWRpbHkgaW5zcGVjdGVkIGJ5IG9iamR1
bXAgb3IgZ29kYm9sdDoKPiA+Cj4gPiAgIGh0dHBzOi8vZ29kYm9sdC5vcmcvei9zR2UxOHozY2EK
PiA+Cj4gPiAoQFNhbWksIHRoYXQgLkx0bXAxNSB0aGluZywgSSBkb24ndCBzZWUgdGhhdCBpbiB0
aGUga2VybmVsLCB3aGF0Cj4gPiBjb21waWxlciBmbGFnIG1ha2VzIHRoYXQgZ28gYXdheT8pCj4K
PiBIbW0sIHRoYXQgbG9va3MgbGlrZSB0aGF0J3Mgd2hhdCB3ZSBlbWl0IHRvIC5rY2ZpX3RyYXBz
LiBJIHN1cHBvc2UKPiBHb2Rib2x0IGp1c3QgZG9lc24ndCBzaG93IHRoZSBzZWN0aW9uIGRpcmVj
dGl2ZXM/CgpGaWx0ZXIgPiBbdW5jaGVja10gRGlyZWN0aXZlcwoKPgo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9sbHZtL2xsdm0tcHJvamVjdC9ibG9iL21haW4vbGx2bS90ZXN0L0NvZGVHZW4vWDg2L2tj
ZmkubGwjTDMwCj4KPiBTYW1pCgoKCi0tIApUaGFua3MsCn5OaWNrIERlc2F1bG5pZXJzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
