Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A39C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 23:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekmYOc8QtFHVzaN90hHl8AY/mP/xztrjReaLVBMdV4s=; b=jeCY6e5YMDScEf
	0jBHC4OEQkMzcAQ7+kskpXNQrXhj411WIx0xblX2j5p/sURHuVL9beSNEo5G8a6HOFMa7f2XzA23T
	iy3IRUfAOxgZkF6rirot641qcIAOYQc7vmP37/uknPVMCEHrSHf26Qekn8EN78oCxywG9I9HaxNWx
	dGZ9oOBwgMEAm801Va7RVynfOLkEQbJ9u4q5IGJWrMwVd2nuyl39FHPTqvociq48/ipjpFlwOEtti
	truNKgIuKxws73WwNz0kgum+ridn61YK9uRuEjNilqATnhg//iD7H2ENiep2PGSQxQo7kueS0WfEe
	ncnPl4BMpL7cpa2F+wMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9DLU-00Erxm-1S;
	Fri, 01 Dec 2023 23:54:56 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9DLS-00ErwH-13
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 23:54:55 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-4b28a042838so913809e0c.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Dec 2023 15:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701474891; x=1702079691; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pol7hI1Hy96E33miCesPUidUjW/JKgnpIaa4LePlFSs=;
        b=hk9WJ+bTSYZoZyZH/FgbTGoEjVgfOCcIuOJMBenjALme3T0r18yRWbBiVmcPLj5leB
         daALFvl4nF1yckpzqjZ8arNNj2tcuxQDYxkm8PJeheE0yMhiJVyXkOrMJiJGq7G/HGC3
         1+z9o+R5SJSOlfxxpqHj8Lp2ZpKVwAct654eYajtSVU+BotoNa4uTRLhKs56OuhfpiJB
         1aytUMlfu4Syblok6HrVtEbT/v8R2WrsWSbGcv1vDX/lZeRwbwLvSFrvogswmnyci1WB
         AQLnzdYfATnRebKoExuywIw00mAqBjoCE0DgVN5Z6RiIk5JB3rUlGJqRyc52bpUVFcC/
         tk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701474891; x=1702079691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pol7hI1Hy96E33miCesPUidUjW/JKgnpIaa4LePlFSs=;
        b=s4pqaBc+qn6q6GHe6oRiLWddq9ck0g85nCgTjVWpcPNCMURdHIwIYOrVTvHUAMC0/5
         mK0plvnutZb38DGa7wAmWHSAn+87hbetB6ALN/PcHMhRXf131SXittul892HBQgZdisn
         AmEwarfYlTONnYKbg5P0D3Fg70y8pBliYmsoySzU2MCHLTVLoMgVwN01QLa868FqSm73
         fBovtiWQlZDh69SsjVngTv2Umj42E0NZISLHDbvv586sGYuyHmfPURjCNOjktDBLCqlT
         rEKbm4OjLgt6mnyR0vCBRo5LCq0phbaZAA7WINIWJEfpWHO+365EV1gIW78JGvbHNCw0
         gmJQ==
X-Gm-Message-State: AOJu0Yyqf/+9TR68V81DX3IL7rtaCPGWTAs38BLXvYSzQI8BqUpdmp2l
	BJ2U+J/6b4PR5vNZa33HfUdHLlWzvYmxkT7Eyq39xA==
X-Google-Smtp-Source: AGHT+IFhYdGfLbE8mSyQJ9sVITWjwja5raT5mVt0aQs6YqvlVg9Hcm3bf9FfCdJYLNUrv209BolhENIl06CXXpMM8rM=
X-Received: by 2002:a05:6122:319f:b0:4b2:c555:383 with SMTP id
 ch31-20020a056122319f00b004b2c5550383mr302268vkb.25.1701474891180; Fri, 01
 Dec 2023 15:54:51 -0800 (PST)
MIME-Version: 1.0
References: <20231120144642.591358648@infradead.org> <20231120154948.708762225@infradead.org>
 <20231122021817.ggym3biyfeksiplo@macbook-pro-49.dhcp.thefacebook.com> <20231122111517.GR8262@noisy.programming.kicks-ass.net>
In-Reply-To: <20231122111517.GR8262@noisy.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 1 Dec 2023 15:54:13 -0800
Message-ID: <CABCJKufBiJjUdmnuy=HkV+dDnZ=xne-OBwPSfJ21RX9c0AzCZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/cfi,bpf: Fix BPF JIT call
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, davem@davemloft.net, dsahern@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, keescook@chromium.org, nathan@kernel.org, 
	ndesaulniers@google.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, jpoimboe@kernel.org, 
	joao@overdrivepizza.com, mark.rutland@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_155454_392378_2B30D1FF 
X-CRM114-Status: UNSURE (   8.15  )
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

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMzoxNeKAr0FNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBTbyB0aGUga0NGSSB0aGluZyBpcyAnbmV3JyBidXQg
cmVhZGlseSBpbnNwZWN0ZWQgYnkgb2JqZHVtcCBvciBnb2Rib2x0Ogo+Cj4gICBodHRwczovL2dv
ZGJvbHQub3JnL3ovc0dlMTh6M2NhCj4KPiAoQFNhbWksIHRoYXQgLkx0bXAxNSB0aGluZywgSSBk
b24ndCBzZWUgdGhhdCBpbiB0aGUga2VybmVsLCB3aGF0Cj4gY29tcGlsZXIgZmxhZyBtYWtlcyB0
aGF0IGdvIGF3YXk/KQoKSG1tLCB0aGF0IGxvb2tzIGxpa2UgdGhhdCdzIHdoYXQgd2UgZW1pdCB0
byAua2NmaV90cmFwcy4gSSBzdXBwb3NlCkdvZGJvbHQganVzdCBkb2Vzbid0IHNob3cgdGhlIHNl
Y3Rpb24gZGlyZWN0aXZlcz8KCmh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9i
bG9iL21haW4vbGx2bS90ZXN0L0NvZGVHZW4vWDg2L2tjZmkubGwjTDMwCgpTYW1pCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
