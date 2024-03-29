Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0434CCD1283
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 06:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evoxJbrf4DRy5VcpkWQ/kNQY2JZZqCStfYFvLOdspM4=; b=DFDumvQSr9GXq3
	p63c9rTNyVpQUDKaXfO+/KmS0T2G6HRCXTTTocNZOfAimvX41n22I8YT1ASrYQOl43xyU/dkaN925
	VxsRumavbD7n9+tQI9mj0YH/up07zJn88JPQkHpgaiIEQ0LJy4XlN+NAPPFXEv0D9U0uw2XAhRTNi
	GzMbgjXxOcgwfIT7fSZykZ3w6pYAVPXEOOyYA42cudbZ2sOVqXv7JMrQO/tQpcer/zqycmzkd4XrA
	veXcmSCI/mAKqMQix09uPeF2QiM+RPTn4590uFomgH9cHUNeJchQur9fSok36gwZ8FdnJOk3G8VMR
	hDumx5ieYPQE9D1LG9gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq5Zu-0000000H14q-3Pzo;
	Fri, 29 Mar 2024 06:19:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq4av-0000000GtKn-0Afe
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 05:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SA5bcVE32KgGG5TtTqzFEWB8zyElCwHL0lTeALGfaJE=; b=jZ2OfTs9X4R8qYhf2Hp/A1EqQs
	Ji6GhE32PmfxckOsGLuLNXI5/yQa6Kk66UarF2RONl+CPWR8nj9AgcbOYiQB3CeM6Gs3baPn14HhP
	wxY6jUgmAmE8iSaigy0yH7UAKJLE4sDWGaatAIxQm6x5XghhtXIkB2eexZfOsOwiqXnWCRWRZ+lu7
	PcniLuHV0eR46hkeSGlAgcTigDx+/yfg6N+uTTaD/7s4mF7UKG7HCNmHeAUDb6N3AU0TUPzKnaDx9
	ZspR9IbnE+Bv9xovDZYNuAiOTcZvU61CSI7Jxf3uHaCFyf81yfsTLX647keRL4zp2OrwOt6+SOPRz
	rotuBoCQ==;
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq4ar-00000001Ny4-3W13
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 05:15:59 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-60a3c48e70fso17331237b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 22:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711689350; x=1712294150; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SA5bcVE32KgGG5TtTqzFEWB8zyElCwHL0lTeALGfaJE=;
        b=fFl2PSFTW1Mx+NLembOZoxX6q9kstP71J6alOa1ymohFVs1AiYd8Foe4AqaGULcOKl
         B4d3c+zguQESTjtdqRR14NXZYreDJ61TX2Vkp1kpwrhhni00HyBAU4fj50p9AI+bUYar
         q+KYcY3uu2odXige5uVFekdzyR9PAsnvqEitd9iua9ICnaEmrbjy2iZ2UOysYYENRoPq
         7zTSXCmrra4tq0OQMJyzYjm8oaYEf9BQ/A8a/BWn20JHFKICQAjekvjraCytN4TRTaKc
         AiYrDigYo5FX/3VVB8ls7pQGk1Lv1J+yd/K3iQF/GNa335LL0hNYwVxD7oGbNka0kzUZ
         /xcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711689350; x=1712294150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SA5bcVE32KgGG5TtTqzFEWB8zyElCwHL0lTeALGfaJE=;
        b=Nk3x2Gw96bRZ/fDruHxq5IyRzngZuP+o9F0PEC1w8Tg07Jlu9rUkiq2ry7ZJI+oomK
         FK1kao3bAkl97I2Ay8+4Yuy27W7F2agevjm3XLCgnCVDwyvg30xVdd3ytYmnZsl5KuYj
         KG+k7xHk65H2f75d0waHGEWI9T4y+1w1EIA7cNjWqwN94Iw97bOM/8RvcqEzI09VOcqO
         tRPLA+lFtScodRwnTz4urvGO+S0Ox/ant5fIacnH1cNFKwFYvyAu6UAU9ouSCxJH90mk
         xRK7ukR4R8XKfpdbZceyVu3qxbZaBVMmBsGQwMGVIPqF3qFTEgW8sowFGNgSax6JwkkE
         zVHw==
X-Forwarded-Encrypted: i=1; AJvYcCUaZs9VfrLGkA+9c3pXQUemLNPYtyMMnTYUl0pffxH58M+qWhipC3p1nveiGz3hWFK8fXd8A57r3z42tNds3JRDxFk+fEAYeig2QyzK38E3
X-Gm-Message-State: AOJu0YwaEoPYf0i6XmZ/B3KpsvqekIa6TgZ6t974++RZwwdMpb2lq317
	Vb0HJ6TEP/ZGp4AEYbxHc6cTFfpvspx/og8XIKFki8C2nLWvRHB8ONU5zrDrtawlXRfhXmz9tDJ
	LtRDBISTeUttEHtjm1WRObKzsXQIR7D5Yii1hgw==
X-Google-Smtp-Source: AGHT+IEKGRQwrWyCqxzJ0SB08UytfQ1UABftg33xsS/BUh/oR9gt6JPV6v/mkEdtL2mGt8izQHtaPErdxwMk9zmhQVo=
X-Received: by 2002:a0d:f184:0:b0:608:5dfc:1336 with SMTP id
 a126-20020a0df184000000b006085dfc1336mr1323243ywf.39.1711689349755; Thu, 28
 Mar 2024 22:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240329044459.3990638-1-debug@rivosinc.com> <20240329044459.3990638-12-debug@rivosinc.com>
In-Reply-To: <20240329044459.3990638-12-debug@rivosinc.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 28 Mar 2024 22:15:40 -0700
Message-ID: <CAKC1njTheY9+gRFgiWaA8fG5hiOFXqESz7eGDbhHhDZC7Kignw@mail.gmail.com>
Subject: Re: [PATCH v2 11/27] riscv mmu: teach pte_mkwrite to manufacture
 shadow stack PTEs
To: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com, broonie@kernel.org, 
	Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org, 
	ajones@ventanamicro.com, conor.dooley@microchip.com, cleger@rivosinc.com, 
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net, tech-j-ext@lists.risc-v.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de, 
	ebiederm@xmission.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	lstoakes@gmail.com, shuah@kernel.org, brauner@kernel.org, 
	andy.chiu@sifive.com, jerry.shih@sifive.com, hankuan.chen@sifive.com, 
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com, 
	charlie@rivosinc.com, apatel@ventanamicro.com, mchitale@ventanamicro.com, 
	dbarboza@ventanamicro.com, sameo@rivosinc.com, shikemeng@huaweicloud.com, 
	willy@infradead.org, vincent.chen@sifive.com, guoren@kernel.org, 
	samitolvanen@google.com, songshuaishuai@tinylab.org, gerg@kernel.org, 
	heiko@sntech.de, bhe@redhat.com, jeeheng.sia@starfivetech.com, 
	cyy@cyyself.name, maskray@google.com, ancientmodern4@gmail.com, 
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com, bgray@linux.ibm.com, 
	mpe@ellerman.id.au, baruch@tkos.co.il, alx@kernel.org, david@redhat.com, 
	catalin.marinas@arm.com, revest@chromium.org, josh@joshtriplett.org, 
	shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org, 
	jhubbard@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_051558_126040_FEA06CE2 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgOTo0NuKAr1BNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IHB0ZV9ta3dyaXRlIGNyZWF0ZXMgUFRFcyB3aXRoIFdSSVRF
IGVuY29kaW5ncyBmb3IgdW5kZXJseWluZyBhcmNoLiBVbmRlcmx5aW5nCj4gYXJjaCBjYW4gaGF2
ZSB0d28gdHlwZXMgb2Ygd3JpdGVhYmxlIG1hcHBpbmdzLiBPbmUgdGhhdCBjYW4gYmUgd3JpdHRl
biB1c2luZwo+IHJlZ3VsYXIgc3RvcmUgaW5zdHJ1Y3Rpb25zLiBBbm90aGVyIG9uZSB0aGF0IGNh
biBvbmx5IGJlIHdyaXR0ZW4gdXNpbmcgc3BlY2lhbGl6ZWQKPiBzdG9yZSBpbnN0cnVjdGlvbnMg
KGxpa2Ugc2hhZG93IHN0YWNrIHN0b3JlcykuIHB0ZV9ta3dyaXRlIGNhbiBzZWxlY3Qgd3JpdGUg
UFRFCj4gZW5jb2RpbmcgYmFzZWQgb24gVk1BIHJhbmdlLgo+Cj4gT24gcmlzY3YsIHByZXNlbmNl
IG9mIG9ubHkgVk1fV1JJVEUgaW4gdm1hLT52bV9mbGFncyBtZWFucyBpdCdzIGEgc2hhZG93IHN0
YWNrLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+
Cj4KPiByZWJhc2Ugd2l0aCBhMzBmMGNhMGZhMzFjZGIyYWMzZDI0YjdiNWJlOWUzYWU3NWY0MTc1
Cj4KaG1tLi4gTm90ZSB0byBzZWxmOgpNaXNzZWQgcmVtb3ZpbmcgdGhpcyBsaW5nZXJpbmcgY29t
bWl0IG1lc3NhZ2UuIFdpbGwgcmVtb3ZlIGl0IGluIHRoZQpuZXh0IHZlcnNpb24uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
