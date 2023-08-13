Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBB5C0015E
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Aug 2023 01:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gjpDfgjxrT825m4EVNcmHDPNfamrZdvQusyt6FoUhOs=; b=Socs02kTxuUuEV
	0c0/KUCj7sVvcN6HJijIoWNphXVL6HyzWKRJFSueN1bUOCcf8eUi4gJyu/EM2QKiKbT7Y+LOrRj0r
	Sun2YdemStBoiDSeHfirCHzYDwApmzbpEK204MKDsMZ72HkiNwANkzs3GU+IeQLprhoiXqSYKeMl0
	e+FWx0im7KX2Cv8jedjLGjRjcujgrDA2Vpuh7GdULv/bJDDWNV4DWD2CRsCNCNTRG4tSd98IDMCzc
	2ZyQqMsKNGQqUueY5b+kX0hG3XVul9Oi8ErhabW1h1Lwl23p6WVCDJV8lczaNzErA0HABm1pc2u7H
	g+fCfqaDVa+YLsdky1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUzrE-00EHdo-2J;
	Sun, 13 Aug 2023 01:25:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUzrC-00EHdN-0C
	for linux-riscv@lists.infradead.org;
	Sun, 13 Aug 2023 01:25:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A462A60A06
	for <linux-riscv@lists.infradead.org>; Sun, 13 Aug 2023 01:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DD3C433C9
	for <linux-riscv@lists.infradead.org>; Sun, 13 Aug 2023 01:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691889924;
	bh=qBn7ZrOy+UcTVdFjclASJJKKcop5exO2hn21hxT/xuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m9/13huMbVmD3gCR1x395p1wAOBRceMwvCKXF+sqwbAHShDAXYFf/wmzY/1Z6eq0s
	 +P5FYqVzSj7ZzWxldsXvjQml4ymH6jpRxY6PuKN7Hhir6IL+x0iksXbFQhePb/nBaK
	 Ofxc+eqr3HbNjk66iYo/R3lHewmMbuR3daMmWitSA0uE+tFnzhFNxr2/RmHKicLGya
	 ryUc1QodjBEK8YfPpryglqhem2rebThdtk7DGPZR42O6XAV0Oap4PsuUgKghtlMmDm
	 sqyg3YbTjwONcTI7eic+fHgiI+rItnQNiAU/VglkWI7m6QF9r3vs1iOtw/4A+aUPRq
	 UmedHIL6v4K0w==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so8834637a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 12 Aug 2023 18:25:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YzwDcTgf2pCbNj8DOFHp4JZIgHfxMk1gAV7x3wvLMw5gNnMdxuj
	AVbPSs9WclYV2NrpF18dtcyK7InCib6DyBqQ7TI=
X-Google-Smtp-Source: AGHT+IFBUqH08lheIJkH/oMHGgazBLLf/1+HP+LYHvJfgYOnuhTd5XaEtVlAr7EpvNwEjhzFG3y+luogwo0/YJC71vs=
X-Received: by 2002:a17:907:c16:b0:988:d841:7f90 with SMTP id
 ga22-20020a1709070c1600b00988d8417f90mr10036574ejc.27.1691889922298; Sat, 12
 Aug 2023 18:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230811233556.97161-8-samitolvanen@google.com> <202308122238.XLMMmeL0-lkp@intel.com>
In-Reply-To: <202308122238.XLMMmeL0-lkp@intel.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 13 Aug 2023 09:25:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQmezqnJo68CuV8e+=RwCAioKbk0UqTS_fq5--HjUTLDw@mail.gmail.com>
Message-ID: <CAJF2gTQmezqnJo68CuV8e+=RwCAioKbk0UqTS_fq5--HjUTLDw@mail.gmail.com>
Subject: Re: [PATCH 1/5] riscv: VMAP_STACK overflow detection thread-safe
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Deepak Gupta <debug@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_182526_212020_74F4D113 
X-CRM114-Status: GOOD (  12.92  )
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

T24gU2F0LCBBdWcgMTIsIDIwMjMgYXQgMTA6MzbigK9QTSBrZXJuZWwgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4gd3JvdGU6Cj4KPiBIaSBTYW1pLAo+Cj4ga2VybmVsIHRlc3Qgcm9ib3Qgbm90
aWNlZCB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yczoKPgo+IFthdXRvIGJ1aWxkIHRlc3QgRVJS
T1Igb24gNTJhOTNkMzliMTdkYzdlYjk4YjZhYTNlZGI5Mzk0MzI0OGUwM2IyZl0KPgo+IHVybDog
ICAgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsLWxhYi1sa3AvbGludXgvY29tbWl0cy9TYW1pLVRv
bHZhbmVuL3Jpc2N2LVZNQVBfU1RBQ0stb3ZlcmZsb3ctZGV0ZWN0aW9uLXRocmVhZC1zYWZlLzIw
MjMwODEyLTA3Mzc1MQo+IGJhc2U6ICAgNTJhOTNkMzliMTdkYzdlYjk4YjZhYTNlZGI5Mzk0MzI0
OGUwM2IyZgo+IHBhdGNoIGxpbms6ICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzA4
MTEyMzM1NTYuOTcxNjEtOC1zYW1pdG9sdmFuZW4lNDBnb29nbGUuY29tCj4gcGF0Y2ggc3ViamVj
dDogW1BBVENIIDEvNV0gcmlzY3Y6IFZNQVBfU1RBQ0sgb3ZlcmZsb3cgZGV0ZWN0aW9uIHRocmVh
ZC1zYWZlCj4gY29uZmlnOiByaXNjdi1yYW5kY29uZmlnLXIwNDItMjAyMzA4MTIgKGh0dHBzOi8v
ZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDIzMDgxMi8yMDIzMDgxMjIyMzguWExN
TW1lTDAtbGtwQGludGVsLmNvbS9jb25maWcpCj4gY29tcGlsZXI6IGNsYW5nIHZlcnNpb24gMTcu
MC4wIChodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QuZ2l0IDRhNWFjMTRlZTk2
OGZmMGFkNWQyY2MxZmZhMDI5OTA0OGRiNGM4OGEpCj4gcmVwcm9kdWNlOiAoaHR0cHM6Ly9kb3du
bG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjMwODEyLzIwMjMwODEyMjIzOC5YTE1NbWVM
MC1sa3BAaW50ZWwuY29tL3JlcHJvZHVjZSkKPgo+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEg
c2VwYXJhdGUgcGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YKPiB0
aGUgc2FtZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzCj4gfCBSZXBv
cnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gfCBDbG9zZXM6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzA4MTIyMjM4LlhMTU1tZUww
LWxrcEBpbnRlbC5jb20vCj4KPiBBbGwgZXJyb3JzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6
Cj4KPiA+PiBsZC5sbGQ6IGVycm9yOiB1bmRlZmluZWQgc3ltYm9sOiBfX3Blcl9jcHVfb2Zmc2V0
Cj4gICAgPj4+IHJlZmVyZW5jZWQgYnkgYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkubzooaGFuZGxl
X2tlcm5lbF9zdGFja19vdmVyZmxvdykgaW4gYXJjaGl2ZSB2bWxpbnV4LmEKIUNPTkZJR19TTVAg
bWlzc2VkCgo+Cj4gLS0KPiAwLURBWSBDSSBLZXJuZWwgVGVzdCBTZXJ2aWNlCj4gaHR0cHM6Ly9n
aXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy93aWtpCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBS
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
