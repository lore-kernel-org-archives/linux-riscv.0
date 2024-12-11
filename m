Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18118E77180
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 15:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WRwsNYQBwPno2D0WALXY6jUJ4p9T9HigB/LzoFTinyc=; b=Hm6tqnFVwCYnu6
	jRVhMmgmJ208gM9Lm8Paway/Ou9X5zzKq+dzuuJ0XsrlSjHVn7cq/TV9HPSbeVDfLvoLFzoHTgugG
	zQwLENFSkiceEXfKnWt33e7YRR9v5U6/cyD9wDa2EpOqHT27ydQzuY/nriv0L8A5aYAGbwLLtMhc2
	Y+EQe22HOEwwkgYXaq94HJqL7zCTE5ZoabZw50zFQ8JrFiIm9AemfYtX5tn1TEx2YT5vxfXAMW4B/
	TIwrV+ru7ngcEgAIjJESKmNIehoVMzxO7R1QKgE2CwwFxpungdwLtKXV9q3ulFnRBKJdZ4W4hY9zA
	0nZjjaJ44MnxegSWU1zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLP5B-0000000FM15-066Y;
	Wed, 11 Dec 2024 15:57:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOxJ-0000000FKJa-1uXg
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 15:48:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2167141dfa1so8467365ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Dec 2024 07:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733932132; x=1734536932; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUyQM6sPB26ijwTRoR0dvI4sIp4E1qaATJkXlSbU4zc=;
        b=YH1rqBycBezkoorp9XFosP2CcIb9PIDBMrM8lsUMqqUsDdkNKsaUa2M7aqeVsU+RIA
         QE0rN5gwwZaWeWbUhVuUPZkDEeHHkhtGt+PXF3rpqO2uAKLGqjbeVy/W814sKNsY5Ybi
         W38kQdWEO52cve9VqfFsPa3F0VddtUBL7Q++qs9dxs9RUUvTxm7aW+pH6MbcKo6FckSq
         O2y3o6XS8EQA/pH56GfgbO96nVTY9yFQ7TjUQC6h+3hswK8cBG8Zsu3N9mO6+Ys8dZRT
         OQ3dzL8II6e4l/DrEsCjW60QpJ0KIHQGWsQWG0T5C3FYMmSHyIeeqxF6kNdDNRPkoHxs
         UhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733932132; x=1734536932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUyQM6sPB26ijwTRoR0dvI4sIp4E1qaATJkXlSbU4zc=;
        b=MSIADy1M5XdQ8gAZTlP/7/KXt/gcdgX7NiYcSqLMeQYpKV+upXrYpu+J/dixF75x6w
         WJizJINRiSFeU+0gMV02ftaPAjRjaAQZ++D/VVuGqku6H09tiP8iHLMZ7rgb/7nobkW7
         0VJZt344zECzBufQlUPVeTHDbUYaRvNUCAS4Jb2/H1sZg/LXFVV2s/oYnFUaj+XL+kJE
         EmAoRvzcyLLz90OjckVQyS1F0AdlmVJwzqWqP86o7yjnYsoX4XB7T18e7cHQ4Ek7LaYW
         JoyZRtMDZHsW1XnZ4KvKbMjbSiZCV8nFdHL5UFWNFzumVHxq1dhM1iQG3v2mlr2JAcEa
         7Bew==
X-Forwarded-Encrypted: i=1; AJvYcCVs5v0Ybh6w9BlZ3euL7UkhLPWU5xf99thK7YKqJTe6q3QKcQEBK2D9w907DozYGhdlEkW3uW2eeLQRzw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yww2PDLflFi4Znk2XM3K9rnHQPHuP5c3m0jQhXV8ghoLmtaNGLO
	Tc45iVq0YGTNqhd75ciDTAKUNIV5e8wG7dQDvATBdY4QAK4SwoRvdirPOD7zchyobwuimaWaWLl
	2igxeUyoDWqMAEFl12dtkUdIe3Wg=
X-Gm-Gg: ASbGncsNO4LeIyp/qo3kN9CMgVE0VtJEDXiQ2remXakbwvqvj/KVjMLmimaBMtCu4Kz
	fYFfgC/U4GFrWVwLkU6JXvoYcZhmsKwkY
X-Google-Smtp-Source: AGHT+IFKKOunXsjn4hXooZcv50p8WF3a7dxui616l9bO0fyzpMsTfI84K1HzN1Q65fm2cm9yZV+gLtwd4NTSnvr+pLs=
X-Received: by 2002:a17:902:d2cc:b0:216:6ef9:60d with SMTP id
 d9443c01a7336-2177a55b1a2mr46879645ad.23.1733932132125; Wed, 11 Dec 2024
 07:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20241127172908.17149-1-andybnac@gmail.com> <87ldwxot7i.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87ldwxot7i.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 11 Dec 2024 23:48:40 +0800
Message-ID: <CAFTtA3NKxxh9=ZAfU1tS_4Jg0+6K3R6NWOPpRJHpPhurWKdOFw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] riscv: ftrace: atmoic patching and preempt improvements
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, bjorn@rivosinc.com, 
	puranjay12@gmail.com, alexghiti@rivosinc.com, yongxuan.wang@sifive.com, 
	greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com, 
	tommy.wu@sifive.com, eric.lin@sifive.com, viccent.chen@sifive.com, 
	zong.li@sifive.com, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074853_489279_4F384F8B 
X-CRM114-Status: GOOD (  15.17  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4g5pa8IDIwMjTlubQxMuaciDPml6Ug6YCx
5LqMIOS4i+WNiDg6MTjlr6vpgZPvvJoKPgo+IEFuZHkhCj4KPiAiYXRvbWljIiBzcGVsbGluZyBp
biB0aGUgU3ViamVjdCBsaW5lLgoKU29ycnksIEkgd2lsbCBmaXggaXQKCj4KPiBBbmR5IENoaXUg
PGFuZHlibmFjQGdtYWlsLmNvbT4gd3JpdGVzOgo+Cj4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gLSBB
ZGQgYSBmaXggdGFnIGZvciBwYXRjaCAxCj4gPiAtIEFkZCBhIGRhdGEgZmVuY2UgYmVmb3JlIHNl
bmRpbmcgb3V0IHJlbW90ZSBmZW5jZS5pICg2KQo+ID4gLSBMaW5rIHRvIHYyOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNDA2MjgtZGV2LWFuZHljLWR5bi1mdHJhY2UtdjQtdjItMC0x
ZTVmNGNiMWYwNDlAc2lmaXZlLmNvbS8KPgo+IEhtbSwgdGhlIGZpeGVzIHRhZyB3YXMgbm90IGlu
Y2x1ZGVkLgoKRG8geW91IHN1Z2dlc3QgYWRkaW5nIGZpeCB0YWcgdG8gdGhlIGVudGlyZSBzZXJp
ZXM/IE9yIGlzIHRoZXJlIGFueQpwYXRjaGVzIHRoYXQgaXMgbWlzc2luZyB0aGUgZml4IHRhZz8g
SSBhbSBub3Qgc3VyZSBpZiB0aGlzIGlzIGEgZml4CnNpbmNlIHdlIGRlZmVhdHVyZWQgUFJFRU1Q
VCAyIHllYXJzIGFnby4KCj4KPiBBbHNvLCB0aGVyZSB3YXMgYSBsb3Qgb2YgY29tbWVudHMgZnJv
bSB2MiB0aGF0IHdhcyBub3QgYWRkcmVzc2VkOgo+Cj4gICogTWlub3Igc3BlbGxpbmcgbml0cwo+
ICAqIEJyZWFraW5nIERJUkVDVF9DQUxMLCBhbmQgaW5jbHVkZSBQdXJhbmpheSdzIENBTExfT1BT
IHdvcmsgaW4gdGhlCj4gICAgc2FtZSBzZXJpZXMgZm9yIERJUkVDVF9DQUxMLCB0byBhdm9pZCBi
cmVha2FnZS4KClNvcnJ5IEkgZGlkbid0IGdldCBpdCBhdCB0aGUgUGx1bWJlcnMuIFllcywgSSBj
YW4gdGVzdCBhbmQgbWVyZ2UKUHVyYW5qYXkncyBzZXJpZXMgYW5kIHNlbmQgYSB2NC4KCj4KPiBJ
J2xsIGhhdmUgYSBsb29rIGF0IHRoZSBiYXJyaWVycyAod2hpY2ggY2FtZSB1cCBhdCBwbHVtYmVy
cykhCj4KPgo+IENoZWVycywKPiBCasO2cm4KClRoYW5rcywKQW5keQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
