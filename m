Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E814BCD11C2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 10:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JaBiQOr4afIuQpEnXf/0VIl+ZJacI+79fiDoqics8xk=; b=tfu5/oOiPsYfHo
	EI6UV9YDSR8LBJkYIHKpYLtSeetNJ4JY0Ys4U1TfGEAW90AQ33BmHdmCM3Slv190yhyO4CL4MIDas
	RmchW9sqp6EGVaZ9SsdexkEZrlN9gxjSdqnwEW1epwqp7VX9NyQI1qcudg6RCKRBZhSgXstuRt64P
	hCiwJsCk5lq7iqiNQIzrRvYH8EH89rX5GQsTuD1eqE7S/lvtrV60UIGFIy/ZK7fNrF3xbDxie73GP
	lmssCgi033enUcaJqee6vKGdKqbbLsOE7Y2CNWIAkv3PLm3xA/4MRSCW58Hr2GmBx+sbsZPZzeIIh
	AJzJ17gZNpq/BWVlLQPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsgqW-00000006Rxl-1D9h;
	Fri, 05 Apr 2024 10:30:56 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsgqS-00000006RuJ-1ijf
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 10:30:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-29ddfada0d0so1425616a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 03:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712313044; x=1712917844; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjyZT3uHQHE76lUIF8K+O+k+aMaljvlerxoCcM2gaOQ=;
        b=VVe74593brGbTS6922owmzfOXpO1OAHxUKvH0nit5cjk/Xr2MgV1/EUU/v61dcIch5
         DbPo0WYE8Mt8ZXHXbCFlIfnqbGfm8QeUlNkUKzW1mUtE0VdhJsadxfvbW8j6oZU2MHt3
         bXfQLTpZV6uubp7/+KQYBgbestVOuUr7McnEdpb3e83nPA8UHxjs5q074Qe6Wcq6yCKk
         6OKFkwbLS0CrWaqYhyUDB3UJWI17vpswoeyZnZnoM8gMeFygPaKpLwWBU9kimvuyTmd5
         ERnrNzNgddbUDUlmWIy5pMJASPAzarIOlToR2NcJ0CZEk5uCfpnjcPSMTel4erU4qCNL
         WyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712313044; x=1712917844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjyZT3uHQHE76lUIF8K+O+k+aMaljvlerxoCcM2gaOQ=;
        b=sSzR+/4HEdOrqO2VlqsTn5hGCICeHM9s1vj11QrudVwJVcv++gCZZEYPkiYbAft8hK
         7gZtaIu40mVWqLb7ni4cLmit8yZ+HDvKaD/cdlB129oPgTsnjdDPVD2uqirSovzr0Jk2
         2Hv3sji5KBgydH40xbokHcxiHXVNZAK6MWC09gUcIgm9SSmF980vfQUzLMM5UTMOufy5
         3v9FASardsbgmnVYj9h/v5UH6xiqUX621rNTon8tX5KidlS92T5gAuAn/JXEshSL/DFk
         5foIWknDah0i/4I5NPx85rXkYdRF5M61Fh/PKqhfxcGLs7J+h1UNxdWvJ9pvQPGiePl4
         Cepw==
X-Forwarded-Encrypted: i=1; AJvYcCX0xOxo5ymSaqYEwQ1ZI87mE3jlOn2nSMMZc2H9OOAKi2fdG2+o4wQN825f+iJTntQmM4Ue4sbYmYoWam1a+IR3KidtKuXTLembDM8pIY+q
X-Gm-Message-State: AOJu0YxQF9XXXxC6/paJ1Xe7qGlxb4ccHyNjmDjuvayj0dDOHKXzUuKT
	ylgRUwwViGaogA/ZH4YHIc2wj9Uq87aSpJd3YyyfzZhGS8nfwwdaOWlEbDUWfiE9DLYy2hFcm3C
	r4RYhQ88hSQcqmw//Ga6nZCkf9p0=
X-Google-Smtp-Source: AGHT+IFYJriAFttp3bClZnkaGaA416ql9G0BWF43cyDOJfJ+9QjQwmRH9HhSoypwCYo/lJU4PVsdV36O4Srk2/lVIwc=
X-Received: by 2002:a17:90a:9ab:b0:2a2:38ee:66f with SMTP id
 40-20020a17090a09ab00b002a238ee066fmr762112pjo.46.1712313043351; Fri, 05 Apr
 2024 03:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240404-providing-emporium-e652e359c711@spud>
 <20240404153258.GA852748@dev-arch.thelio-3990X> <CANiq72kSfC2j07mAaV591i4kDwejWRYcFTvASgQmNnHVe5ZwCw@mail.gmail.com>
 <CAOcBZOTuqzwQncS8rMUMoOj3zE+FnLxPY6O=4EEaOP2xuFG9Vg@mail.gmail.com>
In-Reply-To: <CAOcBZOTuqzwQncS8rMUMoOj3zE+FnLxPY6O=4EEaOP2xuFG9Vg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Apr 2024 12:30:01 +0200
Message-ID: <CANiq72ko18KobmSp4x=twYRBT5NZmg80rBUC2_rXkDg=67aMOw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
To: Ramon de C Valle <rcvalle@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_033052_471734_CEB465C9 
X-CRM114-Status: UNSURE (   7.20  )
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

T24gRnJpLCBBcHIgNSwgMjAyNCBhdCAxMjozNOKAr0FNIFJhbW9uIGRlIEMgVmFsbGUgPHJjdmFs
bGVAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBTb3JyeSBhYm91dCB0aGF0LCBJIHNob3VsZCd2ZSBk
b25lIHRoaXMgYWxyZWFkeS4gSW4gYWRkaXRpb24gdG8gdGhlIGxpbmsgeW91IGFkZGVkIGFib3Zl
LCBoZXJlJ3MgYSB0cmFja2luZyBpc3N1ZSBmb3IgS0NGSSBzdXBwb3J0IGZvciBSdXN0Ogo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvcnVzdC9pc3N1ZXMvMTIzNDc5CgpObyB3b3JyaWVz
ISBUaGFua3MgZm9yIHRha2luZyB0aGUgdGltZSBjcmVhdGluZyB0aGUgbmV3IHRyYWNraW5nIGlz
c3VlCi0tIGxpbmtlZCBub3cgZnJvbSBvdXIgaXNzdWUgIzIuCgpJIGFsc28gbGlua2VkIHlvdXIg
dXBkYXRlIGhlcmUgYW5kIG5vdGVkIHRoZSBiZW5jaG1hcmtpbmcgbmVlZHMgLwpyZWdyZXNzaW9u
cyByZXBvcnQgcmVxdWVzdCB0b28uCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
