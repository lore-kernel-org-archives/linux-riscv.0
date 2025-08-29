Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABDCCA0FF9
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJSQuNYsrcjLSvRYR9ADPslnchy361xC3x4oLAQhvZo=; b=3sWp/Wzozl4CY3
	Ymr+pfZNPVNhctvz5q2BmvlTrjkhPcXFj02o97P98upnHDDdjN2qIqkxYp6Rf6d0VftZhor+HNgJN
	fwp7T/OsQtKHbS76nym5HcwTsjFdA8uTupj0QJAmLSt8qZEZ0yFSXkV2yRU/E2pZVpkle0/yzawM9
	A0KbEzKNuc68aq/A7CChfNd7HB0jAodecaWEYy8VwxfqgIV+6HfmPGn5hRK1BHlyEjGAWxsrkthJA
	NNYJ8zpdbYzqJA2q0oQZhujFfeTBvRFomMbGb8vVvDX8N2ck6iTdM2L54KLaCKIBLGDi7gyxzEpAk
	fFYVDWO7oRpGH+LgYrzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9oR-00000007CTO-42MJ;
	Sat, 30 Aug 2025 00:51:23 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us6je-00000006tXl-3AWn
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 21:34:15 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-77238cb3cbbso539052b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Aug 2025 14:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756503252; x=1757108052; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dis7nbiiCt2fP4GWwjgCXhTEHKxInIHXXX1XONaAGoM=;
        b=dRXGf1KIRqDqM4huZ5J36IKTve9/bnIqV4nK/PBNc2eIKK4mIDNjoWwdXYkYofzqjY
         Y85696htEs8syqq6vNNLYWwV0XI48eBXcOuuqLMoXdq6lJbH0mbjsGxTslILTg6e+9uF
         3LivOFrGCCwAi0ZO9ugWge8Bq4/29YUoRGLCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756503252; x=1757108052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dis7nbiiCt2fP4GWwjgCXhTEHKxInIHXXX1XONaAGoM=;
        b=KiDg36fGRf7qCvf3+2/iFtToZHKOOBOUpvrQZufYzo2wSrlNU+LwR1idh8UjLQzSkG
         SHf4j+8IePYRafXLwQKUxzLwxcEb4NOTh1/iRszg4ON2sZsaB8V7qYoflaqCb+XFFg/j
         TPHCZC+du9vjK81j5xA+rcUMyEHZd7CrR5tzbkQBEbQgXoUXapzMO0uAFUyv8ZX7d8Tk
         g0yCNehgzRjry+Rfj8teHI5pHeQwm8T6S/0BIKiNCzBGP4UJ8PZbnqvkj5muDmMPx3vh
         NMbHu9+NqX9M0z680smQE0r8NKDV442XOMMF3fSMPEUVeNn+An0OZDGzT88J4JUPCmmR
         Hijw==
X-Forwarded-Encrypted: i=1; AJvYcCWRmEFGU4HCjZX+la2TA2dweTCjSrBQsqL8ue8KZCx0R+wFjFo6WD5GEuvff6Q5kdGni0egoN+OZo4BsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyA3gLEaMISy1JkUswFYrj0SVFXUr4GiCChDZlK3zqYyPfWxyPX
	gZJ2F1OWjnmMCECe8mkMqaBGNjcPB4ko2TrQ1wGLC0ymzqtMToRAIuhDjW+YZ7eHUtbHEyzvOop
	S7Yc=
X-Gm-Gg: ASbGncsn6ZURbz6/bIRmxf7fTyD6p5tmhYCPxDy/2bcvaSPIlxR0uQpuSpSdrQxVLLI
	iqze1EdjB8dzEglsPr+lazDizufIHICWQhXqDIFdqG5D7gMql8S3C9UZApFLA7FDXAIN7rtm1ot
	36EnYFdRq1mpWQ5R95HCSeTYP2DM1/lVWnnSnO0CkZpRAkZN6W5zOv9Z4mlhTsb0hLCs5noZePS
	RfzIRLasecWYcBSLnQ6+hiS66W3Ix936RlFk0p/yrwpPEtcUvD9x1xhgoZj5FnH/cACITYa8C6T
	sm5i0eQNLX0lK1UC4YQzz45Q+PPYaW51JVb92RHd1OlmSpOQwrEYz/FzgMzPAxCfgErKJYwpmHi
	ACRmGn9T20PnWvCtXs/zL+GdRoPj0//pNcIbmq6CHjcuQYCYxvucrqFDgIDh/EttMhvz42JLY3d
	XD
X-Google-Smtp-Source: AGHT+IHThwGZrSE8Kvi0DYwE3KwGB0Ql7m487G/wRX+TeyivUkie/e8N+6KzhT3tjYxpEGgcdrahHQ==
X-Received: by 2002:a05:6a00:b8e:b0:76e:885a:c1c9 with SMTP id d2e1a72fcca58-7723e3fcacamr94843b3a.27.1756503252184;
        Fri, 29 Aug 2025 14:34:12 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com. [209.85.214.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4bb5dasm3288825b3a.55.2025.08.29.14.34.10
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 14:34:11 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24458272c00so27626895ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Aug 2025 14:34:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQ4SBp0pQKfhRS12yvSRs6Gx9Ko5EziwFFt9L+AoY2MBLqXU6VZU6Qi+IVTEGrmvkuaK5UHHBRRyCMaw==@lists.infradead.org
X-Received: by 2002:a17:903:1a2b:b0:245:f7a8:bc68 with SMTP id
 d9443c01a7336-24944b1f682mr902835ad.57.1756503250127; Fri, 29 Aug 2025
 14:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com> <20250827100959.83023-2-cuiyunhui@bytedance.com>
In-Reply-To: <20250827100959.83023-2-cuiyunhui@bytedance.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 29 Aug 2025 14:33:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
X-Gm-Features: Ac12FXwa45bnt2Fo7fophuQQG1oKhw1sdW41Dqgu52LADz5-5chJEPC22bATC7M
Message-ID: <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
Subject: Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com, 
	masahiroy@kernel.org, suzuki.poulose@arm.com, maz@kernel.org, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, mingo@kernel.org, 
	lihuafei1@huawei.com, akpm@linux-foundation.org, jpoimboe@kernel.org, 
	rppt@kernel.org, kees@kernel.org, thomas.weissschuh@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_143414_790852_D0D368B7 
X-CRM114-Status: GOOD (  12.85  )
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

SGksCgpPbiBXZWQsIEF1ZyAyNywgMjAyNSBhdCAzOjEw4oCvQU0gWXVuaHVpIEN1aSA8Y3VpeXVu
aHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gTW92ZSB3YXRjaGRvZ19obGQuYyB0byBrZXJu
ZWwvLCBhbmQgcmVuYW1lIGFybV9wbXVfaXJxX2lzX25taSgpCj4gdG8gYXJjaF9wbXVfaXJxX2lz
X25taSgpIGZvciBjcm9zcy1hcmNoIHJldXNhYmlsaXR5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogWXVu
aHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4gIGFyY2gvYXJtNjQva2Vy
bmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGRyaXZlcnMvcGVyZi9hcm1f
cG11LmMgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICBpbmNsdWRlL2xpbnV4L25taS5o
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBpbmNsdWRlL2xpbnV4L3BlcmYvYXJt
X3BtdS5oICAgICAgICAgICAgICAgICB8IDIgLS0KPiAga2VybmVsL01ha2VmaWxlICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gIHthcmNoL2FybTY0L2tlcm5lbCA9PiBrZXJu
ZWx9L3dhdGNoZG9nX2hsZC5jIHwgOCArKysrKystLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAgcmVuYW1lIHthcmNoL2FybTY0L2tlcm5lbCA9
PiBrZXJuZWx9L3dhdGNoZG9nX2hsZC5jICg5NyUpCgpJJ20gbm90IGEgaHVnZSBmYW4gb2YgdGhl
IHBlcmYgaGFyZGxvY2t1cCBkZXRlY3RvciBhbmQgSU1PIHdlIHNob3VsZAptYXliZSBqdXN0IGRl
bGV0ZSBpdC4gVGh1cyBzcHJlYWRpbmcgaXQgdG8gc3VwcG9ydCBhIG5ldyBhcmNoaXRlY3R1cmUK
aXNuJ3QgbXkgZmF2b3JpdGUgdGhpbmcgdG8gZG8uIENhbid0IHlvdSB1c2UgdGhlIGJ1ZGR5IGhh
cmRsb2NrdXAKZGV0ZWN0b3I/CgpUaGF0IGJlaW5nIHNhaWQsIEkgZGlkIGEgcXVpY2sgbG9vayBh
dCB5b3VyIHBhdGNoLiBJJ20gcHJldHR5IHN1cmUgeW91CmNhbid0IGp1c3QgbW92ZSB0aGUgYXJt
NjQgIndhdGNoZG9nX2hsZC5jIiB0byBiZSBnZW5lcmljLiBXb24ndApod19ubWlfZ2V0X3NhbXBs
ZV9wZXJpb2QoKSBjb25mbGljdCB3aXRoIGV2ZXJ5b25lIGVsc2UncyAoeDg2IGFuZApwb3dlcnBj
KT8KCi1Eb3VnCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
