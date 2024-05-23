Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C9FC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 18:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuSmMe2PJCbQ0Y18bFoJb1asow5qMPaVLnNyv/VyUV8=; b=T7iM3LwWlXpgjW
	CiBKM9kCuCZlhiv3nh2fcYuldsF0U45K1F9K4BmwtdgoHZQf21LopuLBT+kDLOaX+tLOlGqNX31Ve
	bOt6XixwB0j2flzac5eOAb69mx+xjgWf+/kMZ2NJAgBtE7GIewZINvSTTssLQu4RRCclxsrou952w
	Utnap0lJCNbURj5YWCFyANCnqA3NoomVKjN2VsGW9BzSWxVd654I37rTsGsQtMxyGVXGY/kr/3aRu
	8sHBUVI5u1UXIzavZMw02a2QJKfXR9YxdQgX/E67MhC7vjCKkfKKCEW4vul0RtdPVP8a4UVVfDjjZ
	aJCw0K/xOwhUe7YLn1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sACwR-00000006zPH-2pAn;
	Thu, 23 May 2024 18:13:27 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sACwO-00000006zOO-3VuN
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 18:13:26 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-572f6c56cdaso2365a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 11:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716488000; x=1717092800; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmV9pjx2Z/cgyKoVK6PJ6k9Fa04AQ2nQf51yC2c36Uc=;
        b=uJ3Z/4tWo8IYjQz34UAPo9uZqSGmWfxpKcnWpPV9kMdknn5uPgRH430LDxdyqOrJJa
         MV26pdmMgbjVGhlJsgajUhH4B9N/LgIkJhKwk+toeInlF1jAHKNZJrqFfHku9s8ejr1M
         UuPExBDYksWfnbn6jEZVvrkF0bIgcTvxSYoY9Zz535ozy74797Ps9mWeONRVL7OXHK8v
         WTzASSaYlmCgZvGX4dWzuLoAXk751jpIkmTQVTzNHyUbYpCVXnxezBLlNHnAdS4S4nbE
         dRPJvyUAxNMEmOPbodcVZQ05/Q3DYjc8WVj8fFg7FFVjDfg1GkmUvGZm3Je/Ao7lefSR
         ToAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716488000; x=1717092800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TmV9pjx2Z/cgyKoVK6PJ6k9Fa04AQ2nQf51yC2c36Uc=;
        b=SwLrY4W7mR4T6f55rWO7JI7yO0xHCfTvqc0nyKFvbCcxWm39CvEfRoTjc1N6S8MJu8
         C+rbhkek2Y51L3mUQOyWm6L3Bfp91df9ujMqSR/Z4M8Ld2bumoZGmjRAbvCEz0arg7tR
         WR7qywNoXkJ2MTRAroExlWIGvKwOdtxedSqJbG+iVWa/tUam3GYhD4O8fHhDL8rRCAk5
         ITd9F/V3EqVydRqTNI3p2NfIQZNr9Bb0LhEjW25Sf+NbZkA2QLtFnyOqxV2TRKv6BEH7
         VTfcMf9IUkObgZAgm9yF9Zd2tqO7C3M4+y7rjalWBr1b3Wm2LrUSi1SorIFIeA1Ednpa
         8qcA==
X-Forwarded-Encrypted: i=1; AJvYcCWPQXgZO1vryIsLIQnZgyKTFxycbhXZJabF/pvt5d1n+JWsYcEJdc8FbPdq5dvyPuDLqmOeQpQ5ws4ZO2UDjf+6bRLCrhLzGyLjyqpgwkWQ
X-Gm-Message-State: AOJu0Yy3QFPlIvoFD9Y5zEzOcermwZaqZhxknMg+wAZApV+tEqCdsApi
	RMH7KZMiSnbKibx9+xTXV4l0A6PAlR8PJvdzG/OJnHkq2Hq1xwp4ijrGBa9qnOXQXU5YSMcQ0GT
	pMZnyqCYqzVgi3pTLummlNlIrjQt33mWVPxQO
X-Google-Smtp-Source: AGHT+IH4XyN34wwdQO+LD1omzn19g4Z0hsO4LF5HJg6/COqxImkywXTVpGaksCMO62vMlBB+i2WN/mYDnRwwA5mbJXU=
X-Received: by 2002:aa7:c941:0:b0:578:33c0:f00e with SMTP id
 4fb4d7f45d1cf-578510d677dmr19276a12.0.1716487999947; Thu, 23 May 2024
 11:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com> <20240522005913.3540131-3-edliaw@google.com>
 <94b73291-5b8a-480d-942d-cfc72971c2f5@sirena.org.uk> <CAG4es9WAASaSG+Xgp31-kLT3G8wpeT5vAqbCA4r=Z8G_zAF73w@mail.gmail.com>
 <9e2677ec-1d54-4969-907b-112b71ef8dd3@nvidia.com> <d5471e30-227d-4e6d-9bbd-90a74bd9006b@linuxfoundation.org>
In-Reply-To: <d5471e30-227d-4e6d-9bbd-90a74bd9006b@linuxfoundation.org>
From: Edward Liaw <edliaw@google.com>
Date: Thu, 23 May 2024 11:12:52 -0700
Message-ID: <CAG4es9XU2fMo7hBv81vpn1JGKFWt9gExOhyAyRtOc-5OR5eiLQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/68] kselftest: Desecalate reporting of missing _GNU_SOURCE
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Mark Brown <broonie@kernel.org>, shuah@kernel.org, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Christian Brauner <brauner@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Kees Cook <keescook@chromium.org>, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_111324_928056_D1224D14 
X-CRM114-Status: GOOD (  15.02  )
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

T24gVGh1LCBNYXkgMjMsIDIwMjQgYXQgMTE6MDLigK9BTSBTaHVhaCBLaGFuIDxza2hhbkBsaW51
eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIDUvMjIvMjQgMjA6MjgsIEpvaG4gSHViYmFy
ZCB3cm90ZToKPiA+IE9uIDUvMjIvMjQgMTA6NDYgQU0sIEVkd2FyZCBMaWF3IHdyb3RlOgo+ID4+
IE9uIFdlZCwgTWF5IDIyLCAyMDI0IGF0IDQ6MjHigK9BTSBNYXJrIEJyb3duIDxicm9vbmllQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4+PiBPbiBXZWQsIE1heSAyMiwgMjAyNCBhdCAxMjo1Njo0OEFN
ICswMDAwLCBFZHdhcmQgTGlhdyB3cm90ZToKPiA+IC4uLgo+ID4+PiBZb3UndmUgbm90IHByb3Zp
ZGVkIGEgU2lnbmVkLW9mZi1ieSBmb3IgdGhpcyBzbyBwZW9wbGUgY2FuJ3QgZG8gYW55dGhpbmcK
PiA+Pj4gd2l0aCBpdCwgcGxlYXNlIHNlZSBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGlu
Zy1wYXRjaGVzLnJzdCBmb3IKPiA+Pj4gZGV0YWlscyBvbiB3aGF0IHRoaXMgaXMgYW5kIHdoeSBp
dCdzIGltcG9ydGFudC4KPiA+Pgo+ID4+IFNvcnJ5LCBteSBtaXN0YWtlLCBJIGZvcmdvdCB0byBh
ZGQgaXQgYWZ0ZXIgY2hlcnJ5LXBpY2tpbmcuICBJZiBhZGRlZAo+ID4KPiA+IEFkZGluZyB0aGlz
IHRvIHlvdXIgLmdpdGNvbmZpZyB3b3VsZCBjb3ZlciB5b3UgZm9yIGNhc2VzIGxpa2UgdGhpcywg
SSB0aGluawo+ID4gaXQncyBwcmV0dHkgY29tbW9uIHRvIGRvIHRoaXM6Cj4gPgo+ID4gW2Zvcm1h
dF0KPiA+ICAgICAgc2lnbm9mZiA9IHRydWUKPiA+Cj4gPgoKVGhhbmtzIE1hcmssIEknbGwgYWRk
IHRoYXQuCgo+Cj4gTWFyaywgRWR3YXJkLAo+Cj4gSXMgdGhpcyBwYXRjaCBzdGlsbCBuZWNlc3Nh
cnkgb2YgdGhlIHNlcmllcyBpcyBkcm9wcGVkPwo+Cj4gdGhhbmtzLAo+IC0tIFNodWFoCj4KCk5v
LCBpdCBpcyBub3QgbmVjZXNzYXJ5IGFueW1vcmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
