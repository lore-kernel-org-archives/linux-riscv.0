Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61933C3DA49
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OuOusY+QBGJqsEFwgjBfq8gWN+3RIEwn0QCc0Tt1ZE=; b=tmnIHuRK8qE5vm
	vlHf3EI79Urx9+38C7QJkNLul7Sq2IAs9kF1spKCtpw+Z907Mo1dSgijcE+T/+tScncamMnyWA8PV
	b/b+BI3WUvLBCqliXOrkuBG8tHY9JvZAa7rYCvvB3pi4jkfZoj9wmt7H9kAnxPY525Sy+H2JBbJS8
	c1zlfS6V+wp4uqBNqNky3fMj2aYjUCpnsGesB5BKRyPXFKE7mt5un9sRv2T8t3c1bscKUi4GsTgwP
	G6wZ+H4mheIYvV7U6ZCMA+7cWV5dhIeGj1rAnbsH7mIgw890hLq0jyizRTzHLKlr37kn9hfkOPXUO
	xJMF4itp61RF4gYcO3zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSumZ-000000045Dv-2KQo;
	Sun, 14 Jul 2024 08:40:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSumW-000000045Bh-3f4G
	for linux-riscv@lists.infradead.org;
	Sun, 14 Jul 2024 08:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 584C4CE0B14
	for <linux-riscv@lists.infradead.org>; Sun, 14 Jul 2024 08:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A510CC4AF0A
	for <linux-riscv@lists.infradead.org>; Sun, 14 Jul 2024 08:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720946428;
	bh=s8soivgswzKr34xn9NybnkAsHMLba+0++ujftpyAp+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ulzzKus7lpIXaoeA6m38ml/q7gdaAQuUuqzA0vGYqWZX9GHxSiwOLzCq41NTh/Xlo
	 QhZQTs6I6YM8kGIcOUWthF+FkPkmBF6Ox5nB9Qq5b9LIeNP2LumIvyn7yLelfhXQNd
	 Drlkb1RGyHnqeEqEWNzCU1S0P2OLKrapZ0zbfuF1CR0dEm4kSOFNrdZkFLO93vzyvn
	 ghDSwYSGN5ZkvFTrdto65cVSJAkbjS/n96faFDo8WNxQvPVt+kYIc52gRX5Jazjqhd
	 Ski9OufniAK5B6Yll68GxKwKz101OVE/fQQFDzW5A/yLrJEFIaiYUCy80E734M6SS6
	 K2/b4RAEsZbAw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a77c2d89af8so392885266b.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jul 2024 01:40:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGwQ0eNSkxN0G6Q+JmDZdqp/gktGiPhE/AtVbxFYn5VCAGD+6OCT5I51HGnLXMNXigIcPubzv7JpsdB123JFzCjVD9dKgxfGUp84CLmW26
X-Gm-Message-State: AOJu0YyS6bARbryVoL82Uh3Hkj0VUCptuoCYgFN/q4rcigb2FXrPHrNn
	t2LvJwPFTfawePalIOTbc3G5/30iXQBx3CGU3rIriUQWtKoM6o0RUfudj3zowDKGXC67gm5Bdb3
	Emyqn2fFnpY/t9vao1qkVkuwVbGo=
X-Google-Smtp-Source: AGHT+IHk0B/KQ0UHpO4zRyQ37JCRdbe5R3p6F7IAMzuKLMcl5DciHhWTkd2Fb9CtK+utm6IM1/0+1te65nTHb8dpIqI=
X-Received: by 2002:a17:907:3fa3:b0:a6f:51d0:d226 with SMTP id
 a640c23a62f3a-a780b89ed3bmr1274072766b.66.1720946427193; Sun, 14 Jul 2024
 01:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240711111508.1373322-1-ruanjinjie@huawei.com>
In-Reply-To: <20240711111508.1373322-1-ruanjinjie@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 14 Jul 2024 16:40:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTAVoqpeuWyVQGoqg3baQt3HLZ-1ircbtdaXJj4BbG08w@mail.gmail.com>
Message-ID: <CAJF2gTTAVoqpeuWyVQGoqg3baQt3HLZ-1ircbtdaXJj4BbG08w@mail.gmail.com>
Subject: Re: [PATCH] riscv: Remove unused _TIF_WORK_MASK
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	samitolvanen@google.com, debug@rivosinc.com, andy.chiu@sifive.com, 
	songshuaishuai@tinylab.org, bjorn@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_014033_123449_AAA1C33A 
X-CRM114-Status: GOOD (  11.27  )
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

T24gVGh1LCBKdWwgMTEsIDIwMjQgYXQgNzoxMOKAr1BNIEppbmppZSBSdWFuIDxydWFuamluamll
QGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gU2luY2UgY29tbWl0IGYwYmRkZjUwNTg2ZCAoInJpc2N2
OiBlbnRyeTogQ29udmVydCB0byBnZW5lcmljIGVudHJ5IiksCj4gX1RJRl9XT1JLX01BU0sgaXMg
bm8gbG9uZ2VyIHVzZWQsIHNvIHJlbW92ZSBpdC4KWWVzLCB5b3UgZ290IGl0LgoKUmV2aWV3ZWQt
Ynk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKPgo+IEZpeGVzOiBmMGJkZGY1MDU4NmQg
KCJyaXNjdjogZW50cnk6IENvbnZlcnQgdG8gZ2VuZXJpYyBlbnRyeSIpCj4gU2lnbmVkLW9mZi1i
eTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oIHwgNCAtLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhy
ZWFkX2luZm8uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaAo+IGluZGV4
IDVkNDczMzQzNjM0Yi4uMGVlYWQ2YjdiNzkwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdGhyZWFkX2luZm8uaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhy
ZWFkX2luZm8uaAo+IEBAIC0xMTEsOCArMTExLDQgQEAgaW50IGFyY2hfZHVwX3Rhc2tfc3RydWN0
KHN0cnVjdCB0YXNrX3N0cnVjdCAqZHN0LCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnNyYyk7Cj4gICNk
ZWZpbmUgX1RJRl9VUFJPQkUgICAgICAgICAgICAoMSA8PCBUSUZfVVBST0JFKQo+ICAjZGVmaW5l
IF9USUZfUklTQ1ZfVl9ERUZFUl9SRVNUT1JFICAgICAoMSA8PCBUSUZfUklTQ1ZfVl9ERUZFUl9S
RVNUT1JFKQo+Cj4gLSNkZWZpbmUgX1RJRl9XT1JLX01BU0sgXAo+IC0gICAgICAgKF9USUZfTk9U
SUZZX1JFU1VNRSB8IF9USUZfU0lHUEVORElORyB8IF9USUZfTkVFRF9SRVNDSEVEIHwgXAo+IC0g
ICAgICAgIF9USUZfTk9USUZZX1NJR05BTCB8IF9USUZfVVBST0JFKQo+IC0KPiAgI2VuZGlmIC8q
IF9BU01fUklTQ1ZfVEhSRUFEX0lORk9fSCAqLwo+IC0tCj4gMi4zNC4xCj4KCgotLSAKQmVzdCBS
ZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
