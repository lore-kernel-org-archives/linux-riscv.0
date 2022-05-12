Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CE1C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xb15i6Skkwm3/3e/rX1oCxLEvC94kes/M8srOwp9rPo=; b=CHqEfqLu6/37aS
	KvAG4MjdUmXaXBtzgU8Z53NyuqEFYs7An3hxnmixTARLQgJ74b2QUxXqCYd4nBYeAUOWq36cK0qQS
	72rxJVryZXfY0Rt+ZWqvO5n5FA6lQEqeXFW+y9WHhxAVgp/SYJi8pYbFRkmHe7dGipzoGI5UUK21c
	UQp9ERuMFn6qSt8drwvz6CN5v574kWfAHdwOnys1Atv1W/NW5yNhtqygPdbu03ouUl1kloz15CfV9
	cP8sU8uI0DhlTTj2iXFvnMX7TGEki6CmAVDAxwCcxkeaN69VClEKFruY8991kxWVJqQo5tOhYCBaE
	E8PBR71f2NvVcQJNRTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np4IE-00B0oY-2a; Thu, 12 May 2022 08:35:30 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np4IA-00B0nH-Mz
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 08:35:28 +0000
Received: by mail-ed1-x536.google.com with SMTP id y21so5384823edo.2
 for <linux-riscv@lists.infradead.org>; Thu, 12 May 2022 01:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asbradbury-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6JtWs7RSdHsbfSTu16o6pg57zg9dX7Xy00LanH4+FX4=;
 b=Ma1lHg5+GZH75MgULlpr4+OUxpjkeEIbQuI3J2nDp8o/kS4DMTBXnkty/iTzwWo9Dl
 GlZ85NV/w7ozfW4aohFlD9z6uc4mgWgXcSP1i5YeedWbYzQKXWl6DHpWVkbKG4ytwzxP
 lGp3PQ7oN8HXQExyjfv93EzwiNIzuK5Wlto/QLPe1skezqrvGEVXlRBHvwAXeWnmLEvl
 fvhPdEtPNF8zOT/PhTzOTb7lqWV/Lkt1BHNIvTJQOPrbU6OXv9vJjXH65LRIE99nt8Ed
 FAzlnA8qgE22csLMKNwdZ/WaYwGX28fly83iX9VXN3D6q0Bh+rThToR2zNd52Y01yoe5
 Kjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6JtWs7RSdHsbfSTu16o6pg57zg9dX7Xy00LanH4+FX4=;
 b=ccwUjfSaU1dc5CewGjihjiRh9H5mAcroZ67l6Jl2CWr9CtoxtzF1V1sgw8xXIZvcqz
 A1Ta4LOvkXjszUyJ175sKT1WVcWinND7+XkTdCHg6vpR9aFCNK+pg/SIfbTQ9DGQDSm9
 nnXoGxr0IYqvBKUDDyWj8LZsgNv6iTNReIcRW8MED9mdKRABTk7lFSwqSxwiINlty5zu
 UYxZcF3rszsUFJYJMCcGM1mHU6UY2Z0Qo56YYHmGSWz8YU+RHAifeWELx11CxFUH92Of
 ysfZufZqdL0oK8bHTMfwG8MNeBhYblTg8uN+N4YznGFJdCpMIa+NKtkcJ+LUZez57O/0
 GQSg==
X-Gm-Message-State: AOAM5315oxNL1Fw3GDuKWKt5uiVzzVg4TXm6qU+6yAQIfN/L99QakfsB
 G2UXqWUvm/mvGn8l/W4Ku7zRB4V8wlmhwsEP2PE=
X-Google-Smtp-Source: ABdhPJw8qnLD2gnFG8kFy330m1H4U/ujGT/G0nY6BIJuG9RkcskZLqIXnVSXcQsqqpjJV+kZ0DjQrA==
X-Received: by 2002:aa7:cd10:0:b0:428:659e:a4c8 with SMTP id
 b16-20020aa7cd10000000b00428659ea4c8mr31099605edw.190.1652344522096; 
 Thu, 12 May 2022 01:35:22 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 y3-20020a1709063a8300b006f3ef214e75sm1830533ejd.219.2022.05.12.01.35.20
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 01:35:20 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id ba17so5372859edb.5
 for <linux-riscv@lists.infradead.org>; Thu, 12 May 2022 01:35:20 -0700 (PDT)
X-Received: by 2002:a05:6402:2932:b0:425:d7b3:e0d1 with SMTP id
 ee50-20020a056402293200b00425d7b3e0d1mr33664329edb.141.1652344520348; Thu, 12
 May 2022 01:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220510065336.hlfjrc25ajed5zj4@M910t>
 <CAKwvOd=OnJ=ZhsbX+epzbhg3sWg9yOaR=zQ4jF_Deo=B8Nx9Og@mail.gmail.com>
 <10BD31AB-C9F3-45FD-9A4A-EF7DC07C94D5@sifive.com>
 <20220512083007.gdvlaq7ar2tyarza@M910t>
In-Reply-To: <20220512083007.gdvlaq7ar2tyarza@M910t>
From: Alex Bradbury <asb@asbradbury.org>
Date: Thu, 12 May 2022 09:35:03 +0100
X-Gmail-Original-Message-ID: <CA+wH296d8p06E6LU4HUxcGZEf6ZkcUS_oEUY4k_zcC-Y6+-1+Q@mail.gmail.com>
Message-ID: <CA+wH296d8p06E6LU4HUxcGZEf6ZkcUS_oEUY4k_zcC-Y6+-1+Q@mail.gmail.com>
Subject: Re: riscv: llvm-compiler: calling convention violation: temporary
 register $t2 is used to pass the ninth function parameter
To: Changbin Du <changbin.du@huawei.com>
Cc: Craig Topper <craig.topper@sifive.com>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>,
 hw.huiwang@huawei.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, codegen-riscv@discourse.llvm.org, 
 llvmproject@discourse.llvm.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_013527_012507_8794B747 
X-CRM114-Status: GOOD (  11.49  )
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

T24gVGh1LCAxMiBNYXkgMjAyMiBhdCAwOTozMCwgQ2hhbmdiaW4gRHUgPGNoYW5nYmluLmR1QGh1
YXdlaS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXkgMTEsIDIwMjIgYXQgMDE6MDc6MTRQTSAt
MDcwMCwgQ3JhaWcgVG9wcGVyIHdyb3RlOgo+ID4gSeKAmW0gZ3Vlc3NpbmcgdGhhdCBiZWNhdXNl
IHRoZSBmdW5jdGlvbiBpcyBzdGF0aWMsIHRoZSBjYWxsaW5nIGNvbnZlbnRpb24gd2FzIGNoYW5n
ZWQgdG8gZmFzdGNhbGwgd2hpY2ggYWxsb3dzIHVzIHRvIGlnbm9yZSB0aGUgQUJJLgo+ID4KPiBJ
IHRoaW5rIHNvLiBCdXQgdGhlIG1jb3VudCBmdW5jdGlvbiBhc3N1bWVzIHRoZSBBQkkgaXMgbm90
IGNoYW5nZWQuCgpJdCBmZWVscyBsaWtlIHRoaXMgaXMgYSBwcm9ibGVtIHRoYXQgd291bGQgYmUg
ZW5jb3VudGVyZWQgb24gb3RoZXIKYXJjaGl0ZWN0dXJlcyB3aXRoIGNsYW5nYnVpbHRsaW51eCBh
cyB3ZWxsLCBkdWUgdG8gZHJvcHBpbmcgdGhlIEFCSQpyZXF1aXJlbWVudHMgZm9yIGxvY2FsIGZ1
bmN0aW9ucy4gSGF2ZSB5b3Ugc2VlbiBzb21ldGhpbmcgc2ltaWxhcgplbHNld2hlcmUgTmljaz8K
CkJlc3QsCgpBbGV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
