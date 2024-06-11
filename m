Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5FAC27C75
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 15:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEUsVDKkvZmIpfjZTlBzmnVfnXiRS//+KZNjHv4LVnA=; b=fOxrKSOtf7KNb8
	nNPRiWfw7/3UIQiyZuTLd1zUoT7JcE45xBlHqKF5LhgkBSTI4/ztaqtsou3/+CEj+ifnvxkuTtr9H
	lZrJQo2zaxmlTaJ4NuEk77XLk+viLvmiUR4IEsm9quObRRKr9oBKiUnYxqMhcnHcUs18+bexvuoBb
	B/lrs6+xCgeL56YHWrzzs4CJb1Rox0W4SKsU0LJQyHwYQHQAhnRMfNRhK7QkEf0uXXEtzmabdi8V6
	frNKr0X/GmdX21pAa2DKkU+FbSDX1lydKMdQFDdsG2HDUJqbr+0PzNLqNCCa8ynFvm0ATsPrUOIeb
	DVFWZHxm9fPPA+U4pXkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH3u2-00000009Pw5-2Yap;
	Tue, 11 Jun 2024 15:59:18 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH3tz-00000009PvW-2MxX
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jun 2024 15:59:17 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-57a1fe63947so1850504a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jun 2024 08:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718121554; x=1718726354; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KeeLnew4Dr2lt2iWiQJB+NWU2kaX728eR1Y/pdt+oA=;
        b=kbaPktWGmwf6gZ6yFXockwrgf2WDGT0HyhQ72iPIY0v43MIdew59yNx1Dr2wg/kQ2d
         lssLGdGpS+M9i6YZZ2AeP9wCcsBo7u4tOmhSYRNcUd0DYWV9oMuVRyW7gYXQfUgiJoLG
         /mpolDs7EwUTO6PXvQIcv/sip3MKl7vFWQXpjV9/vRM7BmhltnnN9udZcZ0M6xDsp692
         nPO9b7npn1pJIUwSbTTeEaj1ph8AxZtIDdGtU6M6pM9dnbzffIcE0FwRnUY66fcvRlxW
         az0ktbbjrx80rhxgmt7e7NmHqEh13Vys7citJksVAJDSstazDgeJwcs8g35YJcIEc8Go
         MS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718121554; x=1718726354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KeeLnew4Dr2lt2iWiQJB+NWU2kaX728eR1Y/pdt+oA=;
        b=qchwXNYAn1ISBXypwssNWPT8eYj41nq/uQ48jmCbzcYO8Uwjxk+nItsls/P2GZqjjm
         ebVR2cB8jSs8DpS3rs14peudzuR2LVk4q8gzpZI1BnDPG84x00rUaR2zSoGOonC8zRto
         eHuNOmVQPegvzJCZ1vKDJ908KrCTlTYsB61aRQMFFjnk7Wd+67VN1CnKlhxau7/l8KBx
         EdJG919395Za3R+S49hdy9NwL/zhcgB7R3dMXbZwXvpAL2IvxOFEO8ikN7HT1AuuzI3z
         Po7aoYQyECyef/nMSXxm8XjOqWH57So4d49l+hZkjfcN14D9arLqFcVGY71RidS4Ydx4
         r6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1B+urPKJzUmHUIjzIWcfWxuEVyhpRzlrq0WOOyyC9mYjKoqidvtEof1bjVGV1mBZfiQE6u20ajInMk/PGjs9Y8MK9qK8ILbgBiRi8uUyv
X-Gm-Message-State: AOJu0YxCs3YYw2PGftjfWAy6ZZiUspJsItKaDNOLcrVu6xwWtsjUhwog
	OyYuskTq+adgf/4W3dwYYsnuCvvhST0Wbfu/m63tFd5r3lrCwGFO+cI/qw97toTKR0/WYSQL5BV
	7g2FJHgvnuZM6qxFX/oxs8/HezXkPO/CDI/pAyw==
X-Google-Smtp-Source: AGHT+IFtN4cYhXjGsiGLi9dtTvtTxex9wzVTtZ32q9gZra1QREy0esNjyQa0xfTpDsvoF9kv8aqdxu0J/DY1HdrDZBE=
X-Received: by 2002:a17:906:2811:b0:a6e:f7bc:dcab with SMTP id
 a640c23a62f3a-a6ef7bcdd76mr607353666b.65.1718121553604; Tue, 11 Jun 2024
 08:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com> <20240610-xtheadvector-v2-11-97a48613ad64@rivosinc.com>
In-Reply-To: <20240610-xtheadvector-v2-11-97a48613ad64@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 11 Jun 2024 08:58:37 -0700
Message-ID: <CALs-Hsu2jFAfr7H9UfLd9VHEZvpfF7Q6Chxko3XbBZBCU94eSw@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_085915_629625_14CC3152 
X-CRM114-Status: GOOD (  14.53  )
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

T24gTW9uLCBKdW4gMTAsIDIwMjQgYXQgMzo1N+KAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gRG9jdW1lbnQgc3VwcG9ydCBmb3IgdGhlYWQgdmVu
ZG9yIGV4dGVuc2lvbnMgdXNpbmcgdGhlIGtleQo+IFJJU0NWX0hXUFJPQkVfS0VZX1ZFTkRPUl9F
WFRfVEhFQURfMCBhbmQgeHRoZWFkdmVjdG9yIGV4dGVuc2lvbiB1c2luZwo+IHRoZSBrZXkgUklT
Q1ZfSFdQUk9CRV9WRU5ET1JfRVhUX1hUSEVBRFZFQ1RPUi4KPgo+IFNpZ25lZC1vZmYtYnk6IENo
YXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEV2YW4g
R3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2FyY2gvcmlz
Y3YvaHdwcm9iZS5yc3QgfCAxMCArKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJv
YmUucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gaW5kZXggMjA0
Y2Q0NDMzYWY1Li45YzBlZjhjNTcyMjggMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNo
L3Jpc2N2L2h3cHJvYmUucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJv
YmUucnN0Cj4gQEAgLTIxNCwzICsyMTQsMTMgQEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZp
bmVkOgo+Cj4gICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX1pJQ0JPWl9CTE9DS19TSVpF
YDogQW4gdW5zaWduZWQgaW50IHdoaWNoCj4gICAgcmVwcmVzZW50cyB0aGUgc2l6ZSBvZiB0aGUg
WmljYm96IGJsb2NrIGluIGJ5dGVzLgo+ICsKPiArKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9L
RVlfVkVORE9SX0VYVF9USEVBRF8wYDogQSBiaXRtYXNrIGNvbnRhaW5pbmcgdGhlCgpPdXIgcmVj
ZW50IHNuYWZvbyB3aXRoIENQVVBFUkZfMCBwb3BwZWQgaW50byBteSBtZW1vcnkKd2hlbiByZWFk
aW5nIHRoaXMuIERvZXMgdGhpcyB3b3JrIHByb3Blcmx5IHdpdGggdGhlIFdISUNIX0NQVVMgZmxh
Zz8KU3BlY2lmaWNhbGx5LCB3ZSBuZWVkIGh3cHJvYmVfa2V5X2lzX2JpdG1hc2soKSB0byByZXR1
cm4gdHJ1ZSBmb3IgdGhpcwprZXkgc2luY2UgaXQncyBhIGJpdG1hc2suCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
