Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F83CA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 07:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vD1gcHIVsTXdN9IiRV5hYzhuJE6NYmOPs8DpWgbBxb0=; b=0mQmDgGyVo2JCq
	jc27f4tEYuaszoxrMFjE4EiZNSH6f9SM5w++GwjeFagFHUSK4zoCzh0WhIVb46+UWbNX2B75BFnO9
	5zM1R9M0zH/F9EtYYtrvQzLkHr0CG+aIMjzUSpbrST8necI9Jyfb9+gOpo20Ji3zG1ryGDEvUopD4
	+BRSH4Co+ozA2CCO/H4+DNwYxCLoCVxSBQVRMI+gbL0PMhlJZEpKrlf/1NxkiUP7l/97K2pvyBSnU
	yNMf8F0b/Kirg7eHHimJN6VV4PHvQ3CIszaYGtu/FxuEjgcECPB348PX88NtnTbQqEVkRkJ06s7zD
	Sd7K99k1yFdOitsnbTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFGY-0000000CYtH-0iFi;
	Wed, 10 Sep 2025 07:29:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFGW-0000000CYsC-3y9S
	for linux-riscv@bombadil.infradead.org;
	Wed, 10 Sep 2025 07:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=; b=UCWYOpO55pvcSWDdwz+B9pVs2F
	BmR2+8bAz3nfV/5YhoF66Yc20Wu0jqiBOhPFuIwXxTNh1F0trvMjfImMQgk7HQTrZpMq3fQZjkxt+
	SvssjoNELHWt8KmQYemCGPlKTFoCdKuLJkK2Evu5XjSLin7QBBCOgxTzgjFWCVUcBPCu4xJnyawpB
	6wWFhqNdwpg/kYmxZ0fDkt6/+YgS/mIuyvsh0rOutAqjTNBNagM1W8iHlgR+VLMs7iHSPlgGdNWTl
	zfn6SAhDstE6XSE2BoDuiBC8RkTXBTAxANBFA0ReMtE+ESOP0U6ohqTKtExJxZxbc8TQnsS/Ej6cC
	2GYVA2oQ==;
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFGU-00000005lGX-0YlO
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 07:29:15 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55f720ffe34so522437e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Sep 2025 00:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489352; x=1758094152; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=;
        b=cN8QsvhKILhBU7aDpexJCtKHBnzhf3ViXym34VfmTNzXZNmDkInQ4Y0Us3b8Nr8LLD
         4Suh69d3kMCBcQ+EB9+EBDuFAZLIQOqRDjAOHskyj+Rqt5U9xWdvRsdwkRiceaZyg1Oe
         84LYJnhoRAOINpDanAaEg7rPstx4GxgkRkWgFsduIt0C+04SEoBNg2yVAYL/8RzO4Fg6
         ZOuvzbq4uQAgwuCgNPyKR6/oPdeNGcvKAm1Lp0MH4DRzkWKdNv9/cEz5nQHJLzPMIqsm
         E4Gtw7Zld+PWCqnVolxKTfrJk7IAk2kzTp82NrFcGjrey8V9adE+yvkQMMtvebqoaR3e
         9unA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489352; x=1758094152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPns3UYk3HTy9Cu967vV+y/kprcH9SmJknyIiH6KUPg=;
        b=NX3aB8AHt5MWJwXT9KF56PMONjoTLgohUGSGQSbAb7XQ/ng8bNMn4G5fLQSQ6ysWRV
         bezK4hFJabQgooyuc2kx8dras+2EWu5TY3SW8NWkAuSTBHnpm268dLqj7TcWr1zCUdYh
         vPv8zX1Df8QAq0ANzEDDXuCinLAlk7MmBQQIiFWdg4NDjcau5LDILM/Jrjv+I4BrTAro
         mlMlsNB4bIX00b3YAuDorVBvQ0/9k2G4Tl0VUu1yBVV+glpEZt6R0B1y33kbaku34Hea
         /aAREdEupsRPSnhild+IFREH7gncFFQEWGnT5IWFEHxunyAU+BOIo+b3lAL28hv+3Ffa
         AGKw==
X-Forwarded-Encrypted: i=1; AJvYcCVqR3rEsXs5edBWbU3P2t6ZpTl0vgmu64CKPLcdj/x+TLc3LMKq90a8g0TDLWr/acJskAfLKqN4whm8aw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJuyecsqvsWlPdoa/sCsBhwBsdkgcArumKswRHtZB73vQF2+qX
	75yUzXcSHduO31V6RrNFfXp2dgmjGda/GrLYoJlQQpJDiXdmGc6e2uQt4zq1gPRiiGPkM1hoP6G
	htCGhCi8YNvcrdCae0XxGGnffvmvUbng5nq4GXwWHTw==
X-Gm-Gg: ASbGncvOPnlqe2sYyvpvM3PWL9Q43iAc7cVFnBASfIpLWjS1htQDUjTkG0nT/rj5edl
	rN7Jz9z4IP9/xCJW3oWHMlSNK3DwOpbIjSef70I9Br72ERPnMDq0reGbyvZ0H1/RNfUvFnuhyp6
	NR1S30MEyIMf2/h5FHgf1UtyiduBL3Gc8wn/LFNu2MkHiN81bjF7j2BDSggQhClg36InFJaAI7j
	Or9YdYWjucCobVt5BKXy3c9aVEuthWI3ZBAovY=
X-Google-Smtp-Source: AGHT+IEqPJ9kigcz2GLj3mP+JOGINamypRE0PiCaaHlUwxbs7HlrGNQFZsWt9jHWryRE9N3BOTU+Nqgodo1ymFIXUx4=
X-Received: by 2002:a05:6512:3c93:b0:55f:552c:f731 with SMTP id
 2adb3069b0e04-56099453ef8mr6704484e87.7.1757489351780; Wed, 10 Sep 2025
 00:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-13-f3d1a4c57124@linaro.org> <CAHp75VcczAm_=XXAjwLFqNTCF72-UJfdisPvavadDEXJR2G19A@mail.gmail.com>
In-Reply-To: <CAHp75VcczAm_=XXAjwLFqNTCF72-UJfdisPvavadDEXJR2G19A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:28:59 +0200
X-Gm-Features: Ac12FXylJ9GUUlvsjAHDZW0ZjH7_XucWxGNpk3CSzJ659744jxYcf8C0LoVlvQM
Message-ID: <CAMRc=Md1kLjELc48-fvjsgpZH+t+kE00v0uMDztubooM_AJ2oQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_082914_338034_DE582827 
X-CRM114-Status: GOOD (  12.23  )
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

T24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgOToxOeKAr0FNIEFuZHkgU2hldmNoZW5rbwo8YW5keS5z
aGV2Y2hlbmtvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAxMCwgMjAyNSBhdCAx
MDoxM+KAr0FNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+IHdyb3RlOgo+ID4K
PiA+IENvbnZlcnQgdGhlIGRyaXZlciB0byB1c2luZyB0aGUgbmV3IGdlbmVyaWMgR1BJTyBjaGlw
IGludGVyZmFjZXMgZnJvbQo+ID4gbGludXgvZ3Bpby9nZW5lcmljLmguCj4KPiBJbiBjYXNlIHlv
dSB3YW50IHRvIHRha2UgaXQKPiBSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5QGtl
cm5lbC5vcmc+Cj4gT3RoZXJ3aXNlIEkgY2FuIHRha2UgaXQgdmlhIG15IHRyZWUgYW5kIHRoZW4g
UFIgdG8geW91Lgo+CgpJIHdvdWxkIHByZWZlciB0byBhcHBseSB0aGUgd2hvbGUgc2VyaWVzIGRp
cmVjdGx5LCB0aGlzIHdheSB0aGUKY29udmVyc2lvbiB3aWxsIGJlIGRvbmUgaW4gb25lIGdvLgoK
QmFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
