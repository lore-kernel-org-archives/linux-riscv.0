Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29CDC27C6E
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 22:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GKC8Ea/loMs3mp5DY8IW9ifd34GM3iESnS7nQ44gxGA=; b=3JeXAFk7UuW/Xu
	0oZd2Js8kdwBCwdZzIdlb5Jn+xbwqlbgXVxnqWav61etp1OO38yWHh+dOnJauChcy57NXGc7iL5Mg
	IS158vpf1BxhkHctExxMLHpa1NALQJMPZ13Ux+NDw/mWcpwIJKaAhWEHeWURi26PAnTFLsm6XfLRZ
	DZX/jVQPWvir7smJXK0Rk62b7XVjiOkxoHOXmIhjbjD1eOZYOYBvaNa/AtgB0iA5neyx3OWJX6GTY
	CCFrQsb1xp5ic0QglQeLRY0fsEQprvBRBZtQj3ng465FsW/QweYFoZh63SK3n47mcZl3oxwleSxel
	amXMklygd1BmMvEjjlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWPFF-0057dE-1C;
	Wed, 16 Aug 2023 22:44:05 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWPFC-0057cg-39
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 22:44:04 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-644e8aeb791so25371796d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Aug 2023 15:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692225840; x=1692830640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpXUVMogWRocilVaW/S4SCVa83XVVrH7ZUS0RaQaZsw=;
        b=bITiTOHHUbrE3AfEqZC3NlsbjtrTDYN/ox+QNsR20wrJtxXdjPvZaxu6LlussS7O2Y
         ub2pZ5mu8vXNS2VfuGlvUzm0TcJsZcM3NY29ZwyW+PLIe+yIpryDjrUYWVd9Ic6RVi8n
         F8tbR2KcKBprzVc240jNqvFjL2m0cDlKZqYjHqDkx6dL3FYASHHJV/3lZqCmAUpwR5Iw
         PK5IhoQEW7O2rTklcHgu4zJAAgMkw9k3RLL0uMBonxd/iLEcRHp09kfuWyINXHJjqLHz
         kA1+CRh6P9Vn5mLRb6zR+Qug60FQVc7t60VJqronab4Vk8+o0/kWU7GbpzYGP1sex8NR
         LBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692225840; x=1692830640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpXUVMogWRocilVaW/S4SCVa83XVVrH7ZUS0RaQaZsw=;
        b=XPntNva/6OxOIkjGHnmeV729S/bTIZ9oesdT7sNrtiMBEUzZPU73PGVViLSiObkCBQ
         VDp9/7wVDcR7V/n/5VJSpEKjlNp9bdoth5i4AZjPMJzSWnndZ2vNqnp5QoGyX4G2dw3z
         gZSKiNuBL+QAIsjAaxhfjHGATHPluZLILYuPPJUPKqSgBfgw4d+CDqzoob/yx6zpbZXj
         poTsVbNdpeWn0zOLGRY7foD94lswbJE36AKIuHujVmG34CospyIYEHM1jf4LfyBz9H0o
         qukBk0qM0GGiVKJqD0xX7lQRHC0e3/ht7EUuF51nl8HtJwHS7AmkMFdU9ygPYpIpIrCE
         +ECg==
X-Gm-Message-State: AOJu0YyVb5SKGWNLBQ2Ehphlae6uD+wuzrnlxADuSOmIjZ92lTFZOD6g
	+U+txhHHUkcEP2d8j8zkRWh5n6XDV8T92o8eO9U6oA==
X-Google-Smtp-Source: AGHT+IHHjvWLPWLuDT0dUPubBgu4Lkyk2WaI8TiIj6jXKhfYFzJh/0ALHGThw/osOop0kHb6wyBy4Bt0BgaH9TvWYlY=
X-Received: by 2002:a0c:c981:0:b0:635:e81d:e57d with SMTP id
 b1-20020a0cc981000000b00635e81de57dmr3655334qvk.55.1692225840509; Wed, 16 Aug
 2023 15:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230816-riscv-debug_info_split-v1-1-d1019d6ccc11@kernel.org>
 <20230816220457.kqzlbiibeomvki4y@google.com> <CAKwvOdnRb1OmLWNWnj5f-r-rqL0=OsBXJV9d7OU3bjXtOLLtiA@mail.gmail.com>
 <CAFP8O3LzmUQNHMPKwW6cz05hdC576WbbUsrBSkWMTSMc=P1vaQ@mail.gmail.com>
In-Reply-To: <CAFP8O3LzmUQNHMPKwW6cz05hdC576WbbUsrBSkWMTSMc=P1vaQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 16 Aug 2023 15:43:49 -0700
Message-ID: <CAKwvOdnB8YdmxxnDF=L2Bs=BLU2goXuFkksj1Vy5hLOs_gE5hw@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: Restrict DEBUG_INFO_SPLIT for RISC-V
To: Fangrui Song <maskray@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, akpm@linux-foundation.org, conor@kernel.org, 
	trix@redhat.com, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_154403_013241_D1C47EB9 
X-CRM114-Status: GOOD (  10.37  )
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

T24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgMzo0MeKAr1BNIEZhbmdydWkgU29uZyA8bWFza3JheUBn
b29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXVnIDE2LCAyMDIzIGF0IDM6MzXigK9QTSBO
aWNrIERlc2F1bG5pZXJzCj4gPiBGYW5ncnVpLCBhbnkgdGhvdWdodHMgb24gZmVhc2liaWxpdHkg
Zm9yIGAtbXJlbGF4YCBhbmQgYC1nc3BsaXQtZHdhcmZgCj4gPiBjb21wb3NhYmlsaXR5IGZvciBs
bHZtPwo+Cj4gWWVzLCB0aGlzIHNob3VsZCBiZSBmZWFzaWJsZSBhbmQgaXMgb24gbXkgcmFkYXIK
PiAoaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2lzc3Vlcy81NjY0MiNpc3N1
ZWNvbW1lbnQtMTU0ODQyMTAyNikuCj4KPiBJdCdzIHRoZSBuZXh0IHRoaW5nIEknbGwgZG8gaW4g
bXkgc3BhcmUgdGltZSBhZnRlciBEV0FSRiB2NSAmIGxpbmtlcgo+IHJlbGF4YXRpb24gaW50ZXJv
cDogaHR0cHM6Ly9yZXZpZXdzLmxsdm0ub3JnL0QxNTc2NTcKCkNvb2wsIEkndmUgcmVtb3ZlZCBT
YWxlZW0gZnJvbSB0aGUgYXNzaWduZWUgZmllbGQgdGhlcmUgYW5kIHBlbmNpbGVkCnlvdSBpbjsg
Ym90aCBiZWNhdXNlIEkgdGhpbmsgU2FsZWVtIGhhcyBuZXcgY29uY2VybnMgYW5kIHNvIHRoYXQg
eW91CmRvbid0IGxvc2UgdHJhY2sgb2YgaXQuICBUaGFuayB5b3UuCi0tIApUaGFua3MsCn5OaWNr
IERlc2F1bG5pZXJzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
