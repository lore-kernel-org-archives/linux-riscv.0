Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B76CFB43F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Oct 2024 16:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPu2CiL4Vsb2lAY7P/KXp3pC9WcpPU/KQ0YhLq/EMJI=; b=WvD+Gxn+odED8Y
	zmqUdtoj59i4a/ApDo94XINRfFhyABYewwEa4ADUNOdiEwR2eTeFnhxZ4LCm4Rs6kHGi72/6SqLnp
	K4UtUNCfqOESr3GO8JhWvJBJ7WsTT9RuUBKBCedC7QiXKVgWhEm9yKGuGZT8Wi8yZBG09OjJpHVEd
	+B4gN7qPykxF3McmsWgHFSCh66uovaunkZvNeM6Sp+kGIqIxY4Hhdy4/UsBeMION/D7Z1QPFKZNJ8
	x7GPQwW4istse+Ex5kA3PY/kuK6DprJ41g0hXuWA2rkhKmDWO/3LIyZ2dgId11KW+HOFz2cJGkv88
	vIdU5/+O7u5izppkFsHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxTkK-00000000G2X-2mNw;
	Sun, 06 Oct 2024 16:04:36 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxTkH-00000000G21-1FfB
	for linux-riscv@lists.infradead.org;
	Sun, 06 Oct 2024 16:04:34 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e25cf3c7278so3177197276.3
        for <linux-riscv@lists.infradead.org>; Sun, 06 Oct 2024 09:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728230671; x=1728835471; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uch5zWkAziPgJRQdKvEezF5yVQHunIRJ5aY+mbi1jxQ=;
        b=NNCci4VojEvfQmtuUfuLNZiRtzzO610U7KqRn1+d0jLabG6BOJsZe+3F2elBWvSrv2
         fqhVR6NswhvdYo2mwiM5lkOvD2btqcFKPiADx6VHl6cmYuf+qOLbJBmz+zz5e+WpnI3W
         NLYIFBUzEiyEBWDqIf1FlhsF5qne8mD6WHOd8/KHI24EQGADl0LKrsTG3pGh3IqpKq4Q
         jVERrNybb03565YX5bmjhrXcnibNhW635HPs7X+1cNUX80gCpgQTjZzM48SooNhdsBot
         vV9cL885kCKV/rJkz8PtK07gUYOjW9CHJru1Lm7s+ngHVGyT1Unjpl3yg0wO5xKzMiqe
         mi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728230671; x=1728835471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uch5zWkAziPgJRQdKvEezF5yVQHunIRJ5aY+mbi1jxQ=;
        b=nDK4Qqmo0IMpO5RrHK8VYGyyHAvD3LBMg9z8Tr0MtS6gc0LxQCjnBbwJjF/aVB1EFS
         dDRoOrSAt9AURjm0d6Yenr1ACot+/jSYZn3dp6iGBAcEoZFwVZ2p6Yg6vMEE++QSwR1U
         FbLoni4f33Iat/2Nd2xWbDP/ZiznprFUuBK0Z5C+lNWvsrEsDeVYCGgC8k5U1cNNnzN9
         nQc+S2TonyL9RQmy8aXh9qZK1SBU2VgGupkOdrQQE8noi6wACf/4qt5p7X4eOChP0mQK
         0Dx8CXopLH2L7LQ6zn6fhF2URWHEhZQ558JLzP66GbQabwO8Odd8aWhR+UGxPR/lEx/L
         nD2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrD1Xnma6em+Tl5eex6dUgE74lcvQPO3cRLq3JUD1PbE68W0KfcvRcWJ++CIcNiEajmxEn2Iwx/uIV7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsulfJnX8FCsBz0/0wm9bY7XSbHGSxWr2Ro+0YFxHvGICCn/m2
	rPF1dSRhiQWhX3qfZDOhEBTmCiakjzQEOHNXFUrvZXEHsyHYIBhG/f31D2drAofXlDcd7MFLqeD
	5s3SyhmBRWO5NsJOwMWC9gipv0Ks=
X-Google-Smtp-Source: AGHT+IHghEmYGvQOkKyyuJZaMY/eRKpityYTGhDKnMiJovkVuEa93BGTo1Fa/3AOIwWu8CpUXNrp8IgagfvkZZpUw1g=
X-Received: by 2002:a05:6902:1142:b0:e26:1041:4986 with SMTP id
 3f1490d57ef6-e28937e2eadmr7591066276.26.1728230669839; Sun, 06 Oct 2024
 09:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com> <20240911-xtheadvector-v10-6-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-6-8d3930091246@rivosinc.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Mon, 7 Oct 2024 00:04:18 +0800
Message-ID: <CAFTtA3M3NhooM5u7woDO3juAgQK=EpF-aSf69VJm30aj7iNfZA@mail.gmail.com>
Subject: Re: [PATCH v10 06/14] RISC-V: define the elements of the VCSR vector CSR
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_090433_359711_4032C873 
X-CRM114-Status: GOOD (  14.20  )
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

Q2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4g5pa8IDIwMjTlubQ55pyIMTLm
l6Ug6YCx5ZubIOS4i+WNiDE6NTflr6vpgZPvvJoKPgo+IEZyb206IEhlaWtvIFN0dWVibmVyIDxo
ZWlrb0BzbnRlY2guZGU+Cj4KPiBUaGUgVkNTUiBDU1IgY29udGFpbnMgdHdvIGVsZW1lbnRzIFZY
Uk1bMjoxXSBhbmQgVlhTQVRbMF0uCj4KPiBEZWZpbmUgY29uc3RhbnRzIGZvciB0aG9zZSB0byBh
Y2Nlc3MgdGhlIGVsZW1lbnRzIGluIGEgcmVhZGFibGUgd2F5Lgo+Cj4gQWNrZWQtYnk6IEd1byBS
ZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9y
LmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxo
ZWlrby5zdHVlYm5lckB2cnVsbC5ldT4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMg
PGNoYXJsaWVAcml2b3NpbmMuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8YW5keWJuYWNA
Z21haWwuY29tPgoKPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB8IDQgKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgK
PiBpbmRleCAyNTk2Njk5NWRhMDQuLjNlZWIwN2Q3MzA2NSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3Iu
aAo+IEBAIC0zMDAsNiArMzAwLDEwIEBACj4gICNkZWZpbmUgQ1NSX1NUSU1FQ01QICAgICAgICAg
ICAweDE0RAo+ICAjZGVmaW5lIENTUl9TVElNRUNNUEggICAgICAgICAgMHgxNUQKPgo+ICsjZGVm
aW5lIFZDU1JfVlhSTV9NQVNLICAgICAgICAgICAgICAgICAzCj4gKyNkZWZpbmUgVkNTUl9WWFJN
X1NISUZUICAgICAgICAgICAgICAgICAgICAgICAgMQo+ICsjZGVmaW5lIFZDU1JfVlhTQVRfTUFT
SyAgICAgICAgICAgICAgICAgICAgICAgIDEKPiArCj4gIC8qIFN1cGVydmlzb3ItTGV2ZWwgV2lu
ZG93IHRvIEluZGlyZWN0bHkgQWNjZXNzZWQgUmVnaXN0ZXJzIChBSUEpICovCj4gICNkZWZpbmUg
Q1NSX1NJU0VMRUNUICAgICAgICAgICAweDE1MAo+ICAjZGVmaW5lIENTUl9TSVJFRyAgICAgICAg
ICAgICAgMHgxNTEKPgo+IC0tCj4gMi40NS4wCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
