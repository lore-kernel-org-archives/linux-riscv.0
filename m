Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF608C27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 21:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oc+fHq6/R8clkst26PlAFrHCbnQ7F8qcb3+xQ6VO2cs=; b=S7ZM0GCkrtWSDm
	VwoXgJwQaYfYzEgX5kuWo5utGx6GC7ynsRJCgn3Sg7lkdEQSfxGEn1NmKxu1i2KFxggMaHbofIV70
	iJfArRAC9Y/vUctjTaeCHrFjsdx6VUbq4iZZ3wKW+x58ClFNBk5gvzD+oQfBPphVuiR/y99s3pVRT
	ZMTSn+5treUX+5Y8m4bJp4RIW+ah9YmY+FEwcI6Ug5cKRWo4L+PLh3VVKuUUJe6PfiFbjg/Gg2XLz
	j0hJp5OGOET2uh5IK/UaxqWdjVm/hvOOWG7ADhAk5yePCsLHjbv5ZGg3aPwlhsZUQgRupFIMZBnVD
	Ks2g/LZPJjuPI8gqQYIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZHdL-003o4F-2j;
	Thu, 24 Aug 2023 21:12:51 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZHdJ-003o3S-09
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 21:12:50 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-64914f08c65so1679266d6.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 14:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692911554; x=1693516354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4U1ivCyumzozlOIlLtJN6Z5xOoT4k9wuOs/HLGPW8t0=;
        b=VJTm8lTcxoztRvIBEKss1oLLWxWSKgQM+369NiNy8dvn6YCJDWVB+CfukSFIaxAJUD
         KH1SYydQ4D1GB4zvI2rf433XTYXT8mIRtF+fh4asnISKH84UUcQcOGYjbhhyc6s+3VVy
         l/jl/mku25gwK5PWyZxzTsGrcj5POmnlDzqJ0aK/7nblSFUoWz0Wp69s7yyrz30fM6Ju
         42+RX2+D62Pw75tLd9JnBqgcnuM+Iqa3jNAiw6LBvWXKLuxIeWMXofxmelfE01nIyoGT
         wJIwK/xjL1v0pE0G13JTFZQMB7DfQaKWxGkxX8+3OFgYOeOsarWYFtTlgBttr7mWS/CL
         EajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692911554; x=1693516354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4U1ivCyumzozlOIlLtJN6Z5xOoT4k9wuOs/HLGPW8t0=;
        b=ENyuQMI70Dtwu4YKZY5u7MsSsnhTg2x06pVeO+jXkY9I3dwrmpssiri2zbzkC1fyqX
         zp8TXg3mE60Ug4WBD9mCi24Dl5qONQKrxnB1NUkduU3kjJC6CZECKofnK72ozlJslBb2
         SX5nP4FcVgv0agJttIyenE1NdvP4IFX9YtlvJZuX5XKdKAntGBwCefi+T1/zLaofVXoP
         GwoxzLvSKxoKJljd2pQSthTUw7RMWVUVABnnggomAYWRjab2j7MbL8n6B3yG/biizcf8
         8zdo66fgC6S6UaKegSkf0L3kxqC8/2GAJmU6xJDGoRFeiqqvioKq2jZFt3RQIcI/n5Wu
         ZkxQ==
X-Gm-Message-State: AOJu0YzKGbZ4qfSwzqaRYNF5QOG1urXHHIn+VhrWVjMv8KNzt0nUn8uW
	hezMIonHdcVkdRnRhlKguDK5iaW0/XIcBcXcd+nOEg==
X-Google-Smtp-Source: AGHT+IHJ5oM96Zm8ClYAtCrxKInIQduZvCd9928l9ysBLty471FXDG4CQkDMxa/8esRD1pekknsSAm8ScMk0Ote30z8=
X-Received: by 2002:a0c:ac49:0:b0:647:2def:6a8 with SMTP id
 m9-20020a0cac49000000b006472def06a8mr15925588qvb.45.1692911554574; Thu, 24
 Aug 2023 14:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230824-docs-v1-1-67e061278b8f@google.com> <20230824184910.GA2015748@dev-arch.thelio-3990X>
 <CAKwvOdkdb=dDggNNPHb08AiZNp5V-H9utgm0H+2hJmZJdO-biA@mail.gmail.com>
In-Reply-To: <CAKwvOdkdb=dDggNNPHb08AiZNp5V-H9utgm0H+2hJmZJdO-biA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 24 Aug 2023 14:12:23 -0700
Message-ID: <CAKwvOdkuxO0TeERBCRFrjKvKUsg=nchOuPJc_gx_zGfOaWwhmA@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: refresh docs
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Tom Rix <trix@redhat.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_141249_121223_EF678C10 
X-CRM114-Status: GOOD (  10.73  )
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

T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgMTozMuKAr1BNIE5pY2sgRGVzYXVsbmllcnMKPG5kZXNh
dWxuaWVyc0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDI0LCAyMDIzIGF0IDEx
OjQ54oCvQU0gTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+
Cj4KPiA+IEkgc2VlIGEgZmV3IG5ldyBrZXJuZWwtZG9jIHdhcm5pbmdzIGZyb20gbm90IGFkanVz
dGluZyB0aGUgdW5kZXJsaW5lcyB0bwo+ID4gbWF0Y2ggdGhlIG5ldyBsZW5ndGggb2YgdGhlIHRp
dGxlOgo+ID4KPiA+ICAgRG9jdW1lbnRhdGlvbi9rYnVpbGQvbGx2bS5yc3Q6NDA6IFdBUk5JTkc6
IFRpdGxlIHVuZGVybGluZSB0b28gc2hvcnQuCj4gPgo+ID4gICBUaGUgTExWTT0gYXJndW1lbnQK
PiA+ICAgLS0tLS0tLS0tLS0tLS0KPiA+ICAgRG9jdW1lbnRhdGlvbi9rYnVpbGQvbGx2bS5yc3Q6
NDA6IFdBUk5JTkc6IFRpdGxlIHVuZGVybGluZSB0b28gc2hvcnQuCj4gPgo+ID4gICBUaGUgTExW
TT0gYXJndW1lbnQKPiA+ICAgLS0tLS0tLS0tLS0tLS0KPiA+ICAgRG9jdW1lbnRhdGlvbi9rYnVp
bGQvbGx2bS5yc3Q6MTAyOiBXQVJOSU5HOiBUaXRsZSB1bmRlcmxpbmUgdG9vIHNob3J0Lgo+ID4K
PiA+ICAgVGhlIExMVk1fSUFTPSBhcmd1bWVudAo+ID4gICAtLS0tLS0tLS0tLS0tLS0tLQo+ID4g
ICBEb2N1bWVudGF0aW9uL2tidWlsZC9sbHZtLnJzdDoxMDI6IFdBUk5JTkc6IFRpdGxlIHVuZGVy
bGluZSB0b28gc2hvcnQuCj4gPgo+ID4gICBUaGUgTExWTV9JQVM9IGFyZ3VtZW50Cj4gPiAgIC0t
LS0tLS0tLS0tLS0tLS0tCj4KPiBvb3BzISByZW1pbmQgbWUgb2YgdGhlIG1ha2UgdGFyZ2V0IHRv
IG9ic2VydmUgdGhlc2U/CgpGb3VuZCBpdDsKbWFrZSBodG1sZG9jcwpodHRwczovL3d3dy5rZXJu
ZWwub3JnL2RvYy9odG1sL2xhdGVzdC9kb2MtZ3VpZGUvc3BoaW54Lmh0bWwKCgotLSAKVGhhbmtz
LAp+TmljayBEZXNhdWxuaWVycwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
