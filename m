Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B81C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 04:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oa/uqNWVb/cw1t9CbT3QlvS2KbcYl1squSgjCak4skI=; b=nQwiXyBZWbLqwn
	FdMwEF8JhJTFuwTgc38v2UAkOdV1BgLEZEK/Jhzyeot1KcE4lWzfgNKZKDoV9npjMaeqBGSGyfz12
	+nk50TYrSUNT2SnW9pJzuSjhsbtRaiOhw+ilYJv1xa3Ak31hCJW+VQWsTc7is6an82BdXHvgoiq3d
	DmBzLWqhcnoRmq/YXU6az2YUr+p01A7d7n9nr0Gn4I2VwQ1kTHq6vr8EB/hJhZ15HMaj5IeDWs+ic
	5QkvLjlgr/V9vOlwn7jSYtkSwSU24J10470rr1cPCG6j5dBRXYor6DuIXDNSxlcrbIe7A9rL2s5Sx
	6Fm39SSP+OqvywJgzWVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1robVC-0000000F3lw-3VOh;
	Mon, 25 Mar 2024 04:00:02 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1robV9-0000000F3j9-36qP
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 04:00:01 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-221a9e5484aso2601844fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2024 20:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1711339194; x=1711943994; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZBZAdxK2BxmYNtPI0ZDmEsamY0wcrZvwum+qSOABcw=;
        b=eOSLGbXVeKAUqH0vqXGHx8dXMoAwL5KzkHuC5V749NwMNM2aq6U51PgpTeo5DyFaR/
         8E2heNsp+2Hmz6IyJV1zQrHmZOCnXqFcTkRm4qGjvKI33SxY67PiX+yGIx/2+VGni/eJ
         29HBsXmUqPGSFQcwJg9vxgsPpDF0xA02xmX9WE6+A608R52d0iJ5E06z6KCCsE5/wDmr
         AcQtiVYYW1DZ+teGO22WJR00fd6rtK7jgyU2LWXM0ggDfmrrOYoYmx2Dgifm4z6FUFJE
         M5HYcL3w+54GPdPjlr9AA7VSHMS0ReA2Yr+Xg/I7aCIBoGt6Qk1UNZxzge7RQWOiKDOk
         FgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711339194; x=1711943994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZBZAdxK2BxmYNtPI0ZDmEsamY0wcrZvwum+qSOABcw=;
        b=nc74b0uOUN7G3mCDUV5KFDszSrEDEqjR8nbYy1QaOs1Y8oU6VLjeI01FbFddgEj/nQ
         8eiJWRj6/oXdmIrvpTrrh9Zxb0lmxzyQu5WVvUFIqijUORVFok/I5s2mQIZkm2CPqlmR
         oBE5L38YQenoRfno7iWP3dM5Z1LvZqpbWPHDFHucFhiiXKlhMAV98Cb1xZODD0pvRjLf
         VH7mn6WdK7gtPdk19ZPQnOZtcF5EVWA0Cw/VCCWak47hjOK1aXNYBgmaCmUxtInBesPy
         to/GVPksYgxrVQCpfo7ISNPjhxL1f28cIwgOdsxi0LD00t3mHLNYlZzu2cyCtuTpnURP
         740Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNjw8ERaz5xccF4kkMZVbJvxfkOC8Gn9sXgVOUhBpfmgRn9srZ2yvB0neqBxEIde2B85jXC6xcG7BzxSVXizdegFaUbpw9ZWIIM5TkCkUc
X-Gm-Message-State: AOJu0YxJ5OwNw9A8FdLtfgAYsGPX0wA1icZ2fbsh+citWNgGI2+fGfdo
	eVn7FnwW1JC3jgtsZiIdOW3R6Qu8iN7iDg8a6ct97TbCWsH76deVHPdqX1bU/ybMJSd9QD7lOch
	DZSSiqSIIk8aF1S3sGRlP2TgGQ7oBBVPiGHw7VQ==
X-Google-Smtp-Source: AGHT+IEvSLOPrvBORb15O7t5WcFvLwtHwr21gOwWhl6ba83FG95/dPss8gUWkSUuH/IqNj/BJ12lEoHWHOFQw32Yq0c=
X-Received: by 2002:a05:6870:c69e:b0:221:9442:4d58 with SMTP id
 cv30-20020a056870c69e00b0022194424d58mr6705190oab.28.1711339194101; Sun, 24
 Mar 2024 20:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240322112629.68170-1-alexghiti@rivosinc.com>
 <20240323062625.2488-1-dqfext@gmail.com> <CAHVXubisa6HQJDbj_GfjwhP1Y4as0DzrxsU0B7N6DSU6HZNaaw@mail.gmail.com>
In-Reply-To: <CAHVXubisa6HQJDbj_GfjwhP1Y4as0DzrxsU0B7N6DSU6HZNaaw@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 25 Mar 2024 11:59:43 +0800
Message-ID: <CAEEQ3w=mXXTwxph+_ttBLQhvNb66bq9b6Wo-Ka35qpp+3iq2JQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: Improve sbi_ecall() code generation
 by reordering arguments
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Qingfang Deng <dqfext@gmail.com>, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_205959_827087_E04A5EB9 
X-CRM114-Status: GOOD (  14.57  )
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

SGkgQWxleCwKCk9uIE1vbiwgTWFyIDI1LCAyMDI0IGF0IDI6MjDigK9BTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gSGkgUWluZ2ZhbmcsCj4KPiBP
biBTYXQsIE1hciAyMywgMjAyNCBhdCA3OjI24oCvQU0gUWluZ2ZhbmcgRGVuZyA8ZHFmZXh0QGdt
YWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgQWxleGFuZHJlLAo+ID4KPiA+IFlvdSBjYW4gc2lt
cGx5IG1ha2Ugc2JpX2VjYWxsIGBfX2Fsd2F5c19pbmxpbmVgLCBzbyB0aGUgQyBmdW5jdGlvbiBj
YWxsCj4gPiBvdmVyaGVhZCBjYW4gYmUgZnVsbHkgYXZvaWRlZC4KPgo+IEkgdW5kZXJzdGFuZCB5
b3VyIHBvaW50LCB0aG91Z2ggSSBkb24ndCB0aGluayB3ZSBuZWVkIHRvIG1hcmsKPiBzYmlfZWNh
bGwoKSBhcyBpbmxpbmUsIGl0J3Mgbm90IGluIGFueSBob3QgcGF0aCBzbyBpdCdzIG5vdCB3b3J0
aCBpdC4KPiBUaGlzIHBhdGNoIHNpbXBseSBnZXRzIHJpZCBvZiBhIHJlYWxseSB1c2VsZXNzIG92
ZXJoZWFkLCBidXQgaXQgZG9lcwo+IG5vdCB2aXNpYmx5IGFjY2VsZXJhdGUgYW55dGhpbmcuCj4K
PiBJIGhvcGUgaXQgbWFrZXMgc2Vuc2UsCj4KPiBUaGFua3MsCj4KPiBBbGV4Cj4KClRoZSBjb21w
aWxlciB3aWxsIGhhdmUgaW5saW5lIHNpemUgcmVzdHJpY3Rpb25zLCBzbyBJIGFncmVlIHdpdGgg
dGhlCm1vZGlmaWNhdGlvbiBvZiB0aGlzIHBhdGNoIGluc3RlYWQgb2YgaW5saW5lLgpQbGVhc2Ug
cmVmZXIgdG86Cmh0dHBzOi8vZ2l0aHViLmNvbS9nY2MtbWlycm9yL2djYy9ibG9iL21hc3Rlci9n
Y2MvY29tbW9uLm9wdCwKImZpbmxpbmUtbGltaXQtIgoKU2/vvJoKUmV2aWV3ZWQtYnk6IFl1bmh1
aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
