Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51806C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvHrFP7JRLAJVV84KMo/kY6pJwGdiTfhIgpoMcby7Ik=; b=VmB2BZaH5vh6FZ
	fKUaPYbrHGOOF8AkIRBUcFqDZ7Xmf9uD8ejXT4OZayRRIuCpoTzy2DhdFK3eS5Dve6ru3K6f6cER2
	RvOuZ7FL7vo6mxfiqp8xsZ6CFDrLcENr4q8nhnzPO9PknRjNmcGO4BS3G4ex9j6kA/0qQcTXR+ko9
	9oY+/zDh0IDo2cYGdXJGLphhVoPMFKKcvLBiIq7DGlChCD6u91JC6+Ha7lhr+GrfzREGQPUuenqeH
	uIDndclqW41gFkS/bZ8VI0q7iOsHmJTZyii9tVw2nDpFI5YKoaYx2UxL2VdGwPZX/E8xvbDcIw3lU
	zMK+TzvmzumXoZrRCsUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX5Gg-00E2l6-IB; Tue, 28 Feb 2023 19:04:06 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX5Ge-00E2fu-62
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 19:04:05 +0000
Received: by mail-qv1-xf35.google.com with SMTP id f1so7573244qvx.13
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 11:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhF0f5+OI0BrKkPV5TeYBsk54yszg6zUdMYrMu7RCfM=;
        b=h+L4MFqDtmZ+GTkE19Pe0xpMlAJVgmaPr04s99cIr2BJJJXOBUDw/0ZlI8RXgc0tLc
         8TzTLjRsIp6qyRAPCjtGdFhRihInCsNrEJmZxD3ZV7LdM/D+X8mxQTq6p2/qWdyX5GGf
         7zXpgiufF1duId32oYz1lYReQYMZesAD9779H/0y8gpn1AHBObfDRfJ1c10Rr+3ww89p
         jZaRMArTrL4QpAHVBWfxBT5dwqTRUWcnmgfxqeWuLAkwjDfmZMuvBwsFa0MmjJuGRBBE
         72mzWzb9RE2edvVqbVh+TeNQL4n0QIvS7ul1uObwFKsVN5DRWesi3BqYZd3HEqk6eT9B
         RZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhF0f5+OI0BrKkPV5TeYBsk54yszg6zUdMYrMu7RCfM=;
        b=nMcz35C9oyOtfE1wqLYiW6Y9tLIksLhJGuBCr11eVK9h7lwkhx1Oq3ZbCtRggQWEm3
         Iug9MRLpTonICPrVqkNPyGXnOJMn6Ll2gDyIekb0sPs66ebq4aEaIyHmsL9+RgOC3+WX
         tyFze2OsTNa1CED3y2fUmW0NkWtwY0E+bZ8GjgaVGpHNLaGrM30n/Nw6tN5T6za40p4E
         GqZbPCYaYTZ3i9KJ20X3tWLK0DHLIQpG0UN4QMWJl3YZQfl8DDO+2eMyf3epYOEQLSuU
         +UijZMAOAR1nfQOQSY8+Mmmb0smJs/rEJb5wO/UFgoPXVSlOasbwVb5D1+WvX6rs1CQH
         nDhQ==
X-Gm-Message-State: AO0yUKV23m27pA/P2onR/Xkl4UBE+2qRoxjvL2H+UlR50wqWnMu4Zji5
	Ft90DUr3yyIHbCsuls7pDLRqS2t5UyzwtwyM/358hpi/MFCjBQ==
X-Google-Smtp-Source: AK7set+Fy1XS77KWw+GxkksHVNDG5xO/igrEX9DvAIbbOptVcmS3xk67Y1RELe/94wY887lm6V/NBy+zZ6x0FH+mGx4=
X-Received: by 2002:ad4:5949:0:b0:56b:ed36:ffb with SMTP id
 eo9-20020ad45949000000b0056bed360ffbmr4646782qvb.1.1677611016847; Tue, 28 Feb
 2023 11:03:36 -0800 (PST)
MIME-Version: 1.0
References: <20230228184245.1585775-1-bjorn@kernel.org>
In-Reply-To: <20230228184245.1585775-1-bjorn@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 28 Feb 2023 21:03:00 +0200
Message-ID: <CAHp75VfK3RM+SP90d3nOXEobY81Xd_94tLL=Qt86mmdNwXaQpg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] lib/test_string.c: Make definition less dense
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_110404_265291_702E0FA8 
X-CRM114-Status: GOOD (  10.50  )
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

T24gVHVlLCBGZWIgMjgsIDIwMjMgYXQgODo0MuKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgo+Cj4gQ2hlY2twYXRjaCBzZWVtcyB0byBoYXZlIHRyb3VibGUgbWFraW5nIHNlbnNlIG9m
IHRoZSBzaXR1YXRpb24gd2hlbgo+IHN0cnVjdCBkZWZpbml0aW9ucywgdmFyaWFibGUgZGVmaW5p
dGlvbnMsIGFuZCBfX2luaXRjb25zdCBtYXJraW5nIGlzCj4gZG9uZSBpbiBvbmUgZ28uCj4KPiBM
ZXQncyBiZSBuaWNlciB0byBjaGVja3BhdGNoLCBhbmQgbW92ZSB0aGUgc3RydWN0IGRlZmluaXRp
b24gb3V0LAo+IHdoaWNoIHJlbW92ZXMgdGhlIGVycm9yLgoKTm90IHRoYXQgSSdtIGFnYWluc3Qg
dGhlIHBhdGNoLCBidXQgaG93IGhhcmQgaXMgaXQgdG8gZml4IHRoZSBjaGVja3BhdGNoPwoKSW4g
Y2FzZSB5b3UgZ28gdGhpcyB3YXkgd2l0aCBhIHBhdGNoLCBpdCBwcm9iYWJseSBtYWtlcyBzZW5z
ZSB0byBtb3ZlCnRlc3QgZGF0YSBvdXQgb2YgdGhlIGZ1bmN0aW9uIGFzIHdlbGwgd2l0aCBzb21l
dGhpbmcgbGlrZQpzdHJzcG5fdGVzdF9kYXRhIG5hbWUuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMs
CkFuZHkgU2hldmNoZW5rbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
