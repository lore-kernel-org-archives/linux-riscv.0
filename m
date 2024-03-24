Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD12C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2024 18:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4P5Y3bGdkXaTHcO4ouEj41/PzznBVyNAPf9SpGDnfmQ=; b=Q56PgknhBweIY0
	NaazJBUSJsIJAhCwTNSyDKXnIL/ckD5ccZtzem4jOV979t8OJe1z/CVxYkeQofFd3XgWM7TEoPGP/
	Sm6Mmu2eS9wnNxQq3+HdP/d5ZVi1AmOJHvxLLs/gZ0YXnbcrraaxWsu4BssiHjiJwEjavykM9D1bB
	WJDj3iKzvDOirdleSt8TABETXugJ37LACzpmgXytdEEP4J1rBZ5iHwnKXS05vPsFFMZDhUjG2xTL0
	/NCW7MWmteYauY01pYtfrU8y0LYHMoDKds303qis3d0TrzQ6k4Wnd8aNPe2Fq64yXhixMRpPC3Nf6
	79PJd6w2BASqcZgmnw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roSS7-0000000DBJx-1nFc;
	Sun, 24 Mar 2024 18:20:15 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roSS3-0000000DBJ4-27mX
	for linux-riscv@lists.infradead.org;
	Sun, 24 Mar 2024 18:20:13 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a474d2d8ce6so85699666b.1
        for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2024 11:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711304408; x=1711909208; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcURe01+2Dp23RDAAs5J3VwKExLuBYmDlvMP6G0CPRY=;
        b=rm1KCOZrC+LTS4H8Uiayy7mQU0HR8t/7yDpl3jWpfxbiKDVsOvTYoLRGEQqNMVAuN7
         nM+KnpFYAt9QrbthxTcR10PcG6X2OUbuRMV/nviqhmiHjvV6db7/tRsQxoVwPWDr/lY9
         TSw7X2uYlAYniC6z7+q1S30CSjS0bCWuTjtRLAXkBMy7ZbRf7r9mlxJwlwDKaHRggumB
         WFBngdVYlZkk0h15baaINOXnw7xD0ygX3r5v7f4WyXAGwPnB8QKnv2qO3q9bbsvyxqVX
         CdIsB97+qNUoDydXJqWv35XsCkwslhE1desQrNYOqPUccGCncdqqnueZ2AqWzp2ZDEF4
         ieLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711304408; x=1711909208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcURe01+2Dp23RDAAs5J3VwKExLuBYmDlvMP6G0CPRY=;
        b=HY2CFmfCciKjDUPFMjhvp37QkARJerW9KQkENGxXmIhDNpoN/bkXvfbCenKhTrVrY+
         20hezCimWvTd+YuFbya/SFo4lDrBFrsvlBKqRK/lFKAPQo0JIgWF/uZztokcEvc9GjOA
         DlgI8UP6jtaP10LgniNQUx6ILtdB0ICkSMnGwoFnl1OLH1caV7ZZA0FfLfqkZoEYrIxm
         m5+ELHCBpi7WnJpSS5hiGYLfh8RVrOli7ZXoL77xDtUCA6gEc+ikxRbKj2F7jXzw7xNG
         AXI3kQwQBHmdEz6AoiIPd/7ARYkeWwUKiLcWlpeVxptcjS46hnQdVuI61o2xbNomTfQ2
         1MVg==
X-Forwarded-Encrypted: i=1; AJvYcCVgvHssQD1bkvbCZz4XZCtlgxTbi2ogZR52yZGlu02WmHZ72RFsLpShwJs4dt71qJD864S1sCD+eSckxwwrukHRRaE7K7PWqlQHwhSkaULA
X-Gm-Message-State: AOJu0YzUUFlLccf+BphNg89gdakYn5SgRSqg+eSCAWd1gtEkch0KTJLf
	+L9jJbrjPJFK9CYCEhnje7sPp/Ml7HKe/JZkmUBIeM4X79vykRdQ8gf2yDt/yQZ81aIAtpRs6Zf
	49uvmHP7VbKbHJItbYMPHWwJs5uW2LPtFcqYEBw==
X-Google-Smtp-Source: AGHT+IH80eFEX1cLDFFwaoYEe0nA3zQAUOJv6glpAAIEAlcfpQG3B9i6sSNod2Y6qc1if8PuXmzbfow2pjSjlkiL6rM=
X-Received: by 2002:a17:906:fa90:b0:a46:faa7:d014 with SMTP id
 lt16-20020a170906fa9000b00a46faa7d014mr3249934ejb.9.1711304407841; Sun, 24
 Mar 2024 11:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240322112629.68170-1-alexghiti@rivosinc.com> <20240323062625.2488-1-dqfext@gmail.com>
In-Reply-To: <20240323062625.2488-1-dqfext@gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Sun, 24 Mar 2024 19:19:56 +0100
Message-ID: <CAHVXubisa6HQJDbj_GfjwhP1Y4as0DzrxsU0B7N6DSU6HZNaaw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Improve sbi_ecall() code generation by reordering arguments
To: Qingfang Deng <dqfext@gmail.com>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_112011_746110_380623D9 
X-CRM114-Status: UNSURE (   8.04  )
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

SGkgUWluZ2ZhbmcsCgpPbiBTYXQsIE1hciAyMywgMjAyNCBhdCA3OjI24oCvQU0gUWluZ2Zhbmcg
RGVuZyA8ZHFmZXh0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbGV4YW5kcmUsCj4KPiBZb3Ug
Y2FuIHNpbXBseSBtYWtlIHNiaV9lY2FsbCBgX19hbHdheXNfaW5saW5lYCwgc28gdGhlIEMgZnVu
Y3Rpb24gY2FsbAo+IG92ZXJoZWFkIGNhbiBiZSBmdWxseSBhdm9pZGVkLgoKSSB1bmRlcnN0YW5k
IHlvdXIgcG9pbnQsIHRob3VnaCBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdG8gbWFyawpzYmlfZWNh
bGwoKSBhcyBpbmxpbmUsIGl0J3Mgbm90IGluIGFueSBob3QgcGF0aCBzbyBpdCdzIG5vdCB3b3J0
aCBpdC4KVGhpcyBwYXRjaCBzaW1wbHkgZ2V0cyByaWQgb2YgYSByZWFsbHkgdXNlbGVzcyBvdmVy
aGVhZCwgYnV0IGl0IGRvZXMKbm90IHZpc2libHkgYWNjZWxlcmF0ZSBhbnl0aGluZy4KCkkgaG9w
ZSBpdCBtYWtlcyBzZW5zZSwKClRoYW5rcywKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
