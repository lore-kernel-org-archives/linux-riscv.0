Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F27C0015E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 16:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2d2mNNEZSFVgLX/rOHVE6ejVnl3KLmXxTM768fdsxxs=; b=Yq7NjsH12dYsic
	s2oaD9at8+fIGoOqPBAkD2jr75YqDHuKUZAZTeubsA7lMtAGA983cfhFe5o8Hx+fX1BhEqHfNLvv7
	TxoxRUl/fhSTTu83uvhc0t9yBQIWL3iF9FiUdfu8nn3m0tdq2pnyHXH+256l/C88FeGf95eL0MFne
	Ci/aPyN6ubNhTKuP+3NvKqQPe+mEvEFWh968EI5q3JMb1GnPuiDCV5iFut+9Igd4P+NSws8xtfMt8
	7u5BELTRq4MDLsW4N64qoQq/p2TGk7xPbRYV/v0PzFPmfX+/pXnkCM2qKCbH+L8RKrD1ZRt1SfyUX
	E1aQo09P89YMjsfOIeig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTlcl-005Lpu-2C;
	Wed, 09 Aug 2023 16:01:27 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTlcj-005Lok-0N
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 16:01:26 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe463420fbso10890916e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 09:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691596880; x=1692201680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dm2KtxC3KkUxdh/UXiI53XVPED1SIB3YNoNictA1qsw=;
        b=MQWVQh5nWfIq/a52yn3t1bKMVZmJggxeOrQq0xUXYF1H85bwd70nalne7Te5Jk9WEu
         nAigKVEZ2Tfw0b4DXizNbpdXneNwQiCLH3fhSGz1ymfrQUwCOAEKLlzwYsGOHtiWckmg
         H+tRYnCnhaacvGy/M80UvdiBnSSEPv6+HiLdrT7yAsaQqLQXp1wKunCNBop6GJY0IcnZ
         YRyY2fsHltUb71/mbQxTeInK1Js4r+c+sKtUtSH9ZfOuSjal16bnJJB2nzIt9Az+dE8A
         eDeeTUM1Ha8pTYCOjDYEaGCcvc5E4wZxZTim7BtpTRSn/rEsDOLXEXNrUDwhd8MiBMM3
         cWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691596880; x=1692201680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dm2KtxC3KkUxdh/UXiI53XVPED1SIB3YNoNictA1qsw=;
        b=X55dtSMwgyIUxTIN8Lwc/gbLyw/+83WL8Q7UA6MdPQpFg0CVftDSxJGIJF7yhU/uYi
         PgUKwsjwUIsnOzHzMGNBbi1EypV9RG3XCPz3FKSpoPO1+4QG8mvdZFl/QtK71+N+TcOi
         iGYlzqEWXQa6OeC9HOy5joaiY5rg4dGbwz2/QfrEszX5CcmIxI43yHpwj2UyIIGBlRFh
         Uly3YAZd+BdI0tkLWqLncH4FhOjfk41wAo4Gw48A3WVBn76WApfph03koj5qVbpD9tNW
         XJ5q29ZvQ2e4b6tEwqVBL73He/To77oWd5ncnblR4G53iI3xG/a3ftbAf2FSFyLzz+Bh
         /ngQ==
X-Gm-Message-State: AOJu0YxRSqzOHg3aOwwRdMIpixxhtD0qaQ9jZtnjOV7cGfNB/ywVgF2z
	fsq0eqJAWrbkuIshwZCvnR8dOAEMyEpaztWnBfpuew==
X-Google-Smtp-Source: AGHT+IG+p8rHHPO9TM9pkYlD0htSpDHtqv9k2gaO4nqSej3iDQKMKDt3TxAS9UTI43ixpd2X7mfL3gKFQqtqryieIbQ=
X-Received: by 2002:a05:6512:200e:b0:4f8:77db:1d9e with SMTP id
 a14-20020a056512200e00b004f877db1d9emr2047179lfb.12.1691596880487; Wed, 09
 Aug 2023 09:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230809115516.214537-8-ajones@ventanamicro.com> <20230809115516.214537-11-ajones@ventanamicro.com>
In-Reply-To: <20230809115516.214537-11-ajones@ventanamicro.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 9 Aug 2023 09:00:44 -0700
Message-ID: <CALs-Hsuop+2kNj3gGbW5oeWwsFPt9qppoTLk61fk8aGbqBgsDg@mail.gmail.com>
Subject: Re: [PATCH 3/6] RISC-V: hwprobe: Expose Zicboz extension and its
 block size
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_090125_154028_4034EBEA 
X-CRM114-Status: UNSURE (   6.59  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCBBdWcgOSwgMjAyMyBhdCA0OjU14oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBFeHBvc2UgWmljYm96IHRocm91Z2ggaHdwcm9iZSBh
bmQgYWxzbyBwcm92aWRlIGEga2V5IHRvIGV4dHJhY3QgaXRzCj4gcmVzcGVjdGl2ZSBibG9jayBz
aXplLiBPcHBvcnR1bmlzdGljYWxseSBhZGQgYSBtYWNybyBhbmQgYXBwbHkgaXQgdG8KPiBjdXJy
ZW50IGV4dGVuc2lvbnMgaW4gb3JkZXIgdG8gYXZvaWQgZHVwbGljYXRpbmcgY29kZS4KPgo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+CgpSZXZp
ZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
