Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D811C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 10:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1lKHYmRs6LaB9IyZCqKmJU2wkYBSlsK9xkwsf27eMk=; b=tIqy+MOKw9uwDF
	pt0voN8XFN2P+qhkQ+g5eDfdYTAfcA86lYpxbU5HFDBA0HmpfrI9+zS1nf825ikqH+NNgh+JgNy4y
	VVUtKHGauMgROeIgcHoTuWGVV+g7PTDFSTcsfn6x4IZ5OUNlffLfCzPMzaHZrip2xAdBz6RSscT0e
	+Gfz0Q0VV74dvKXOCUyqda8lI7Odgn9wxc/0MbNV3uXlmI9j0DNaMFD5oy/MDff9N5cRp/OdIK6nS
	tgN7CIKY8EgGIdUPi+U6etSE4C3GApDfvwGZLn+2SAyREkEeuuhoQhO4tZ9p2d1tR9l3ITjPtJucd
	o0IVYEJhdnmIDHJOnviA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUzv-00HNM6-3V; Tue, 07 Mar 2023 10:56:47 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUzr-00HNLA-AT
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 10:56:44 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-536cb25982eso236951787b3.13
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 02:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678186601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPOHIY+gc8hcUU6SBmeBbgRx0IvK4FL5OmeKKmmeG0c=;
        b=PFdukvBPDDh0hDaR0PstyR2iC4hbrhIkphg1WMlxchabdYYe2Twc9ALPRctsDXh66a
         87KfbWOTKvcIGkhvH6+ML8X5Z+0VL4Es0451Qu370/K8u/mEc3WS/mCKa4OU3i2f5noE
         QFYnVm/1ePinq+SbMpDWAUnLgNQaqxkexF1yKa+XakdjqxmvgdquTy1/O7pcvSEQEZH+
         eh4k1B7/LNejIIEKKvwc0/7kXp46yNfUFFQ5NCYVeGdCbwtHF8vp1qqRTlcLQbPlkdrz
         7dkwWdOPL1rq+9esaqYlvvePBXVcWh+BQPTGsZxKMyNVxhZ58nriRWAsj0aVr8dkGzxH
         DN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678186601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPOHIY+gc8hcUU6SBmeBbgRx0IvK4FL5OmeKKmmeG0c=;
        b=UcuUD7Y34cDErRGnMXJexrCf0vejM2T6ELW0uehCAArYFREpKChiFx/gIoOW4+bVZI
         mErk1ToM0l8LyH7zmuz0GfBrXmj95HfOeefehSnIU5aZleTsIK/pTnh/bDAUzs12AHiX
         bckJzQOZTunRxFQmF6uGSeHo8O0/elz4b1tgGiOExFOJOeqCipgXP5a+/az3HRGdwI6j
         Q/cm9LcEVBFkrJk5wBAN2VRqiIL0Gme4i15LNHZe0pkA3xqMRW9XlZhxMcE6Sf8Mt90e
         sZUxK/B8WBc4BMzkl6VsQwSUWpwbAaTl04ryIZwg6U6Z8AU8Lj9hcIbwsTJBaE+dQT4M
         nmxw==
X-Gm-Message-State: AO0yUKWHXMr6te3L5yUq3QH1+bP7abAji0idiscpKqdT8OYuAiRI/4/u
	a05Ms8btPe3HYg+NQSev0JLuH7Ps4aVvy1JCh2A=
X-Google-Smtp-Source: AK7set/vZP5VgbdieRCGNt1P4MDgpVw9hkloznp6byCCn62NkrbtjZscaBSfnfsnnnnthyx3ZGOqFsywK3xzdXzGsPw=
X-Received: by 2002:a81:431e:0:b0:533:8080:16ee with SMTP id
 q30-20020a81431e000000b00533808016eemr9046679ywa.10.1678186601088; Tue, 07
 Mar 2023 02:56:41 -0800 (PST)
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com> <20230307102441.94417-3-conor.dooley@microchip.com>
In-Reply-To: <20230307102441.94417-3-conor.dooley@microchip.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Mar 2023 11:56:30 +0100
Message-ID: <CANiq72nLjBgMSUTtWuF7qU5vG9rA3v=ekWk1d6+SNiGkfcaS8Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] RISC-V: enable building 64-bit kernels with rust support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_025643_377011_38BAD9F0 
X-CRM114-Status: UNSURE (   6.48  )
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

T24gVHVlLCBNYXIgNywgMjAyMyBhdCAxMToyNeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gV2hpbGUgYWRkaW5nIFJJU0MtViB0byB0aGUg
dGFibGUsIEkgdG9vayB0aGUgY2hhbmNlIHRvIHJlLXNvcnQgaXQKPiBhbHBoYWJldGljYWxseS4K
CkZvciByZWZlcmVuY2UsIHRoZXJlIGlzIGEgcGF0Y2ggZm9yIHRoaXMgY29taW5nIGF0OgoKICAg
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4L0kwWWVhTmpUdGM0Tmg0N1pM
SmZBczZyZ2ZBY19RWnhoeW5OZnotR1FLc3NWWjFTMlVJX2NUU2NDa3A5LW9YLWhQWVZjUDNFZkY3
TjBITUI5aUFsbTFGY3ZPSmFnblFvTGVIdGlXM2JHQ2dNPUBiYW1lbGlzLmRldi8KCkNoZWVycywK
TWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
