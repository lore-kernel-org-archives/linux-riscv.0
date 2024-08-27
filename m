Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD9EC5320E
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 07:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4F0+6neKmOwKP+K2el8MtBu0YuhQSK20bedppPoVfg=; b=yNZg6vpOlu/tN0
	K3yk7sxD2aJcuJyyQi2H+J2qCTDn+4preM1wVnbM0Ub/M3H+Ye8/nhv7p5eS0XXVYoMq2p39N6g+3
	YAxXm3zkJYxrTTh/53H3gSVejnch53dT/kcqz++xb0afUTOGBDW4D/YjXcwgLv3nv0HZWZekZAc/L
	JwKSA/SMY6znMz6mBm54xHx6BgkGQFhzj0EJMYHnTtLuzWiZa6DEgjnxzn2p0otfjloCuOe/H8HJh
	xzIt6NwHD3dHU5XTitAp+iXq+i2M5ijyoJdXVz4fmQKIoHo6F2GnasXiM/hRW2jJiMMtmXCyz8XBQ
	chBhoxx9L+eb8fyZilGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siqMw-0000000A9sx-28Bl;
	Tue, 27 Aug 2024 07:11:58 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siqMt-0000000A9sQ-1bca
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 07:11:56 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-699ac6dbf24so46236567b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 00:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724742713; x=1725347513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APSqeIhzw1N+DketUQ7sCGv0QezbS2jJhcROUReG2pg=;
        b=FVK8PLsOMMNqIuy4wsNxYliAu5fMgiwAm3VOj0PbAmnx2OQqjlehYaw0+GNcW9Zyv2
         uJA8oODVlIlYF9/9niXRl5U3xWQZCpfjok/NrluUXYcM5neh1L1BRk0WB3TpGD4iJU3x
         agkFELpc1lcpgTW0u9lWVoHEQ62t4/d1rNM+blvRbLHUXG63bXMao7NeV9uCog243hRM
         uYme/Sz8vIAz8E2OA1bOcbN3ZZYkETm8nyyA4gYs7sovCemCkXYnBv2sDuGquzJ/mG+F
         Dm/Qu+FB0ekTjhzx7Y8BbbvPDcLXr9CaYl5otRxlEU6M/4wpuIIEMi3iFFFJoW1X/oMf
         o+fg==
X-Forwarded-Encrypted: i=1; AJvYcCUPm6zhG4g5F1kavWFSRD+QN4jnyFZlnspLVCAaEpZpKDQb3hGyMILblBy2XEbqdLLc2vVYw9GX2hXRHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/iej75fJtQKvPr7HzxQdjIU2lfqkoDr8raBTM+pwdR8PW6v3k
	H1VbhT9+Os2OmXqRJyEmae7ZOj3RSMTzaTXc3KDYPQzrJ46/2mqJ0f748VEa
X-Google-Smtp-Source: AGHT+IFV+AL4NIBscLREVOQfnCRQqwGmBTvZe3NM0vfbLF1Pmoa2lMpDFAj07hc/g+JDIw4ZfHVj2Q==
X-Received: by 2002:a05:690c:2d07:b0:6ad:5dde:bd39 with SMTP id 00721157ae682-6c62943d1dcmr106894247b3.39.1724742712520;
        Tue, 27 Aug 2024 00:11:52 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c399cb5338sm18033607b3.29.2024.08.27.00.11.52
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 00:11:52 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-699ac6dbf24so46236227b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 00:11:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3tRjHdQSj/Rs27+8ynXefP4obQAlyG8rN/+r5E96tbFIZ5UqhjLav31WTtpQ83BVZv8ksE5z2IBRBEw==@lists.infradead.org
X-Received: by 2002:a05:690c:74c1:b0:6b0:4f2b:29f0 with SMTP id
 00721157ae682-6c628a9f15amr140970477b3.29.1724742711847; Tue, 27 Aug 2024
 00:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240827065230.145021-1-alexghiti@rivosinc.com>
In-Reply-To: <20240827065230.145021-1-alexghiti@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2024 09:11:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUktxDyDUtcvgHR5vH_JXacvM3DQuW_65DB=abJDcEE8g@mail.gmail.com>
Message-ID: <CAMuHMdUktxDyDUtcvgHR5vH_JXacvM3DQuW_65DB=abJDcEE8g@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: Do not restrict memory size because of
 linear mapping on nommu
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, David McKay <david.mckay@codasip.com>, 
	Stuart Menefy <stuart.menefy@codasip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_001155_441818_DDD5D304 
X-CRM114-Status: GOOD (  16.74  )
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

SGkgQWxleCwKCk9uIFR1ZSwgQXVnIDI3LCAyMDI0IGF0IDg6NTLigK9BTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+IEl0IG1ha2VzIG5vIHNlbnNlIHRv
IHJlc3RyaWN0IHBoeXNpY2FsIG1lbW9yeSBzaXplIGJlY2F1c2Ugb2YgbGluZWFyCj4gbWFwcGlu
ZyBzaXplIGNvbnN0cmFpbnRzIHdoZW4gdGhlcmUgaXMgbm8gbGluZWFyIG1hcHBpbmcsIHNvIG9u
bHkgZG8KPiB0aGF0IHdoZW4gbW11IGlzIGVuYWJsZWQuCj4KPiBSZXBvcnRlZC1ieTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiBDbG9zZXM6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L0NBTXVITWRXMGJuSnQ1R01SdE9aR2tUaU03R0s0VWFM
SkNETUZfT3VxKytmbkRLaTNfQUBtYWlsLmdtYWlsLmNvbS8KPiBGaXhlczogM2I2NTY0NDI3YWVh
ICgicmlzY3Y6IEZpeCBsaW5lYXIgbWFwcGluZyBjaGVja3MgZm9yIG5vbi1jb250aWd1b3VzIG1l
bW9yeSByZWdpb25zIikKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0
aUByaXZvc2luYy5jb20+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghClNvcnJ5LCBJIGRpZG4ndCBn
ZXQgdG8gdGVzdCB0aGUgcHJldmlldyB5ZXN0ZXJkYXkuLi4KClRlc3RlZC1ieTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCkdye29ldGplLGVldGluZ31zLAoK
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcK
CkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwg
bXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1
c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
