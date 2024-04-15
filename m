Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8641FC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 14:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIjdWP+dyzzL7WH4zvF0yHdH1QCg1GAUyhoQgt9h/hY=; b=Wju5FGc9SiaHD1
	b+b7OxMAYXJxOcooxeDd5ir+L8nG1rpw8wWUza940JZfNUD4YIeQCg4poFJIoqY7Z1NimN29u7KHn
	bumiaqMBQ7bW3ZNGyZnJLvnVhjcKgtUZou5U5arMiB1x8qRiwEtU5kuRuTV6ySpPXl12QtIHuwvZF
	x9pF3PPQvUcNyAmJs0JiFSilGlKnYnUXN3iu3uN7n+j9sgl0G4dVkWwIDAmYq2YX+2SdIpNwrXDYw
	BR7md3uJefGz1za8iZBgJVybPFWj8doxZcJanRmDzrlVuikwRKCklzVPTj8uZj8bpu3nbyeSjLVLX
	mZseS5qVL+D0oED4MVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwNA2-00000008ebV-1TSV;
	Mon, 15 Apr 2024 14:18:18 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwN9v-00000008eZJ-1gvO
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 14:18:17 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-617f8a59a24so29360017b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 07:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1713190688; x=1713795488; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqqqjCa8OZ82zdxbWAvkpK8zvR3ppQ2NndSIF2x4rXo=;
        b=aiMxHub12WA+Ysr5FExVgTY8Jdhiv+JuTU9r6PNdSZAJ+ZKQ5k6phtzRBhd/ogYxv2
         Skby7lDMwtra4n4hGMojLJSS79tsbNKrsHZ4KCLSvlFTlxvws8q3fTQODlCJIAQq8o2U
         X8Sx+oGZmHpAYnYuIjGZ6o39rLKDC4R6E/yFgd1BuqQD5j6KAAqE0UC484hOS9FFUyBG
         KqSYSCK3kicUL5oICo56yRokx+JT403kzGF/ydHsy9flmopBZpEwkF5GCwD/gU4iWY3S
         f2qlbT9rYcdWYX0jzO7FAm41IjcYoF0ePpil6TacWLTUAENAensm//Uwylgqtb3tgeUF
         lxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713190688; x=1713795488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqqqjCa8OZ82zdxbWAvkpK8zvR3ppQ2NndSIF2x4rXo=;
        b=FX8bbFbD02qOwhJ59KxWf8PO7dRb58PXUqYrlR8v9any7KDiQi8WqdaLWqeJV3Otl1
         ULWPwlT5Jpu5TzImQHaapmqDmatf0Q44djMCueJdLXVmLCdb8DmWpptGEakpR6kgIpsP
         qFrAvQx3EPXusf+lnRxT9FWfLRAmL4F6lh/oR28jCNw2ROwKrGDSHiT6fR0WS/sK4cRt
         zpecqrikWqUrEtRDKsImjarKEVL9mJhyip4QKoyVkMOD2GMd5yIvXgqvCeKNM0x1gcFQ
         cUwYZVuZu8YO8eruv558yenA67D66ltSyBjfUcAbsddYugae6Ed5O8mL9HT1UbDyl+ul
         d5fw==
X-Forwarded-Encrypted: i=1; AJvYcCWm3qBbB/ehVuTXek+jnQ9o2UjKsMRcXVu+zD9G0FpFDQbOHytZj0JbgiWyWXEc7gqB58sLbD8halq6cbkTtv8WoupTsS6IF1ypPYme2p2l
X-Gm-Message-State: AOJu0YyHalfnmmfOVfuzc6W8E6tcs5bhniVrZfEWi8DmwiGUW/A49yD+
	MahNozkcSctSZL+d4pAjcBQ5DKPxtNY+inJYKr0PbkMvtLydSVaBIdPYf1ZE8ZXoAAsB19yc4yu
	Jir0Y/My9CK9PxMj5sc/kOtsps8BShSn51P25
X-Google-Smtp-Source: AGHT+IFLkqpounEUU/2bE6dJh6q9whX/HjDtCGadHGTvaVHifyPAFZys4Iq+yJ+GbVJMCc2FKsEdAoulZVngTb0CJTg=
X-Received: by 2002:a0d:eb02:0:b0:615:3996:5c86 with SMTP id
 u2-20020a0deb02000000b0061539965c86mr9873358ywe.21.1713190688256; Mon, 15 Apr
 2024 07:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
 <CGME20240328155911eucas1p23472e0c6505ca73df5c76fe019fdd483@eucas1p2.samsung.com>
 <20240328-jag-sysctl_remset_misc-v1-2-47c1463b3af2@samsung.com> <20240415134406.5l6ygkl55yvioxgs@joelS2.panther.com>
In-Reply-To: <20240415134406.5l6ygkl55yvioxgs@joelS2.panther.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 15 Apr 2024 10:17:57 -0400
Message-ID: <CAHC9VhTE+85xLytWD8LYrmdV8xcXdi-Tygy5fVvokaLCfk9bUQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] security: Remove the now superfluous sentinel element
 from ctl_table array
To: Joel Granados <j.granados@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, 
	John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, David Howells <dhowells@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Luis Chamberlain <mcgrof@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
	io-uring@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_071811_664433_4CA0FE72 
X-CRM114-Status: GOOD (  13.47  )
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

T24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgOTo0NOKAr0FNIEpvZWwgR3JhbmFkb3MgPGouZ3JhbmFk
b3NAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gSGV5Cj4KPiBUaGlzIGlzIHRoZSBvbmx5IHBhdGNo
IHRoYXQgSSBoYXZlIG5vdCBzZWVuIGFkZGVkIHRvIHRoZSBuZXh0IHRyZWUuCj4gSSdsbCBwdXQg
dGhpcyBpbiB0aGUgc3lzY3RsLW5leHQKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9zeXNjdGwvc3lzY3RsLmdpdC9sb2cvP2g9c3lzY3RsLW5leHQKPiBm
b3IgdGVzdGluZy4gUGxlYXNlIGxldCBtZSBrbm93IGlmIEl0IGlzIGxpbmVkIHVwIHRvIGJlIHVw
c3RyZWFtIHRocm91Z2gKPiBhbm90aGVyIHBhdGguCgpJIHdhcyBob3BpbmcgdG8gc2VlIHNvbWUg
QUNLcyBmcm9tIHRoZSBhc3NvY2lhdGVkIExTTSBtYWludGFpbmVycywgYnV0Cml0J3MgbWlub3Ig
ZW5vdWdoIEknbGwgZ28gYWhlYWQgYW5kIHB1bGwgaXQgaW50byB0aGUgbHNtL2RldiB0cmVlIHRo
aXMKd2Vlay4gIEknbGwgc2VuZCBhIG5vdGUgbGF0ZXIgd2hlbiBJIGRvIHRoZSBtZXJnZS4KCi0t
IApwYXVsLW1vb3JlLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
