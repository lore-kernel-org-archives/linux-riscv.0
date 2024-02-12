Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F92C4829E
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 20:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DbIhzopDzkmsMSYLiD9UBlp8eietzpqKS8hDnhh+Ats=; b=BLxw+IczIT1hnT
	/x6QsG1+gE7Idz8Qfh/lETCuAsrapER81AKFhMsbqijLgLhWtcRHgEdgZGje/zXvj1w6V4RvVilVE
	E0Piaf/y64rsWEB659BRZdPdwjG760vX3zG9K42zUfLI2Ojvc5QuTumHORWpbRUZyqISOFeMw4K2M
	S2enuvJVX7tgUcOlND7U0XGZwHvDhJ+J/lTGHYG1GJ/YZP6+HRs8LD5S70cuSC3Xb/LxAIDVvvVZR
	uPSUmVB5HKTKwLJ/7jTtBRfZX0+LFJ0WRy6zfKq0srhBpUjYW9XKeVai5zqc17/hraO19PVTZoMI0
	NQ27TnYDpJHzXrnY51UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZd32-00000006stm-1keP;
	Mon, 12 Feb 2024 20:37:04 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZd2y-00000006st4-3hq2
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 20:37:02 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-46d2085eeebso1692805137.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 12:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707770214; x=1708375014; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Qq/MTNXhRSFGfhT1MpQL4wU8zE0C84XuaSbfhwx1Oc=;
        b=BuiH+ZlBBTfGX64wNqdoQFR4/bEjXKbT1CaETJTZkU2rLmK6gMAzM+/QO6jztzkd3J
         1lCB5/sU/Sjs4tY069rFeWZZoSknPmIvxHyaWDj8VRTOd4Y3a1kRsHPY7GaYPhl3CmtK
         LFwxngWhhuwKFjQuG8nZUDEDIZHJp6RMP17wONq8kkDnbK1iYO39x/RrY/x2TLpDhq1G
         Fx80WPVF7FZ/aJM81APtStYjKpm8wjt40xPIWDQ0xMlOOLU9yMnTJ1QxRkXQub2Je6oY
         q11/04V4KnZuMULTup4wLlg88Dbrw5Qia9niJoJTxQ9DDYU+hRM2WOfHk3kVtPbhbVKR
         6gRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707770214; x=1708375014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Qq/MTNXhRSFGfhT1MpQL4wU8zE0C84XuaSbfhwx1Oc=;
        b=IcpwHGYb8wgq3n6xoyHAAufK0BvfcV8734ZrVv3BvhHktitoHI8hoQFV9eNOjXh/Vt
         pV4BWAIDGhBw6xOwDwPiNjG1CJh/cGPmA4DMaRPjZ3i6yyghQC4s61s9W3vtygnUlxbx
         UVpLwL1UKHvtM95x4SlynNX5oVo88dqiw+kiV+bfoX5BOwCD6JMeo8zYrj9erDYy1yJv
         7AkagGlbGnTAyfYXzQXatdSfzIqsVeRyp0qjXJfQtytyPzfsrdXDYuC8Sbv3Lyu/R/jv
         Y626qJxlFQvtYAGBQ1LGzxusEDgiRNnlWRRxHnBAjlsAaFtPZ7wnpoZ9IAGk0NSdIXCL
         yxXw==
X-Forwarded-Encrypted: i=1; AJvYcCUbQHlZ5symuC1hgMutDow24oDAbP8byit+UjRUmpNFzFd0Kem/UEE8FLBDJRi+PyHsEGhvvnKxb19N6yi8V3CBGLRbZAOs4httXtxWiIFB
X-Gm-Message-State: AOJu0Yy8wXxoG057bGCCzc0aMuep7mSk9KhfngTb8SaV+xYWy7dqWIO0
	ZQrqaSFNgs4jqgejoUW5tZ/ERGoEGbVV2NML/qEYSGji/9OIZqjX1QFDTDroNR1Z+lfL8Du+gAM
	saERO3zV5iGtKoU8GURzvWZ0sLiD6BNGESF9n
X-Google-Smtp-Source: AGHT+IFWndKWzDTOT0x0/4s8Etpblas7Df8C2xR5KB9thOTs6aRnFjIThpiH1ujxZsNIy/J6F6pXaMbg0Ae3jkIJHZ8=
X-Received: by 2002:a67:e947:0:b0:46e:cadc:f340 with SMTP id
 p7-20020a67e947000000b0046ecadcf340mr645454vso.7.1707770213832; Mon, 12 Feb
 2024 12:36:53 -0800 (PST)
MIME-Version: 1.0
References: <20240117-swiftly-parasail-618d62972d6e@spud> <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud> <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy> <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud> <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
 <20240209-rage-keg-1b2982cd17d9@spud> <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
 <CAOcBZOSfN8Yefez_Gy_T3_QTAd4HcLzmMCOoR37K2agWD_U_PQ@mail.gmail.com>
In-Reply-To: <CAOcBZOSfN8Yefez_Gy_T3_QTAd4HcLzmMCOoR37K2agWD_U_PQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 12 Feb 2024 12:36:15 -0800
Message-ID: <CABCJKueFuDkmUmXWbtA3DveQ719vdZx5kBQE1bZ1f6oD5zYNzA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Ramon de C Valle <rcvalle@google.com>
Cc: Trevor Gross <tmgross@umich.edu>, Conor Dooley <conor@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_123700_991125_44720BA0 
X-CRM114-Status: UNSURE (   8.16  )
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

T24gTW9uLCBGZWIgMTIsIDIwMjQgYXQgMTE6MDTigK9BTSBSYW1vbiBkZSBDIFZhbGxlIDxyY3Zh
bGxlQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiBTYW1p
IG1pZ2h0IGJlIHRoZSBiZXN0IHBlcnNvbiB0byBhbnN3ZXIKPiB0aGlzLCBidXQgS0NGSSAobm90
IENGSSkgdGVzdHMgYXJlIGxvd2VyZWQgYnkgcGFzc2VzIHRoYXQgYXJlCj4gYXJjaGl0ZWN0dXJl
IHNwZWNpZmljIChzZWUgaHR0cHM6Ly9yZXZpZXdzLmxsdm0ub3JnL0QxMTkyOTYpLCBzbyB3ZSdk
Cj4gbmVlZCB0byBhZGQgc3VwcG9ydCBmb3IgUklTQy1WLiBUaGVyZSBpcyBubyBhZGRpdGlvbmFs
IHdvcmsgcmVxdWlyZWQKPiBpbiB0aGUgUnVzdCBjb21waWxlciBiZXNpZGVzIGVuYWJsaW5nIGl0
IGZvciB0aGUgbmV3IHRhcmdldC4KCkxMVk0gMTcgYWRkZWQgS0NGSSBzdXBwb3J0IGZvciBSSVND
LVYuIFNvdW5kcyBsaWtlIGl0J3MganVzdCBhCnF1ZXN0aW9uIG9mIHdoZXRoZXIgcnVzdGMgdXNl
cyBhIG5ldyBlbm91Z2ggdmVyc2lvbiBvZiBMTFZNIHRoZW4/CgpTYW1pCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
