Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD83DC3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 17:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/gWtN6P6kpDGpsRNrtH4TFgL62OfzS0P4Bj4YTRgVo=; b=jk73A3bF3KZs6X
	YwaK9sfbiJImjJqbAf+wxb965sGv8Ha0Ci5kemndhllqgitpPy5F58Nblj7m4llAl3Axp/79btgmY
	9bUQRBMA+hfvCSybq6hvEbB0P91nRzMDmILU2a90iydra+yuDYFWKjKuzdVih3pTRAkf3eoz3+MzR
	iN+5RTeMaYnfT3loeFeftPk5csxWjtIpvj7ZOPNa3QVDhXN+eSZ8CEHiZvjCPnl7G0bzhm0hCK7uo
	qtPmnSKd2nSIf75NE1XCcApBXKJWWfYWMGupqNLALXCjlS5j8jdQrNu9vDyHqr8pRpntEm3Op36x8
	RUZrSaGyCAuL0s9ChK3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXOmw-00000004XPt-0aS3;
	Fri, 26 Jul 2024 17:31:30 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXOmt-00000004XO4-13Lj
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 17:31:28 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a7a81bd549eso177910266b.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 10:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722015085; x=1722619885; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHKjTGsA5xoJdxNc5US7opyHTsaUSz6DP4R2VVpLsL0=;
        b=CMvwDsqtb7vwQz4hdDbuzRp7YiCtn6BEVQD+GEF2LiQM2vVwrf7skpdKiVAAf3VuwV
         Ks//M5hkUJgelBwqggEGh0t7u8MeumfdmM580AeV3bhsSAZASUVLle3gthtfj/CFE65F
         3kaYVYzQe/6PDrTMfsUhJi2bYex6pOAwJo8yjzhSGTAL5+UtmhJK2kgVGWo4sfHICT5N
         L7OLrFMxh5S0vh/c5SR41q4pDrjyZ1TV7WMWsWfC8Ykd/2WoxMQEQ3eVEW5OR7Yfw6VM
         H7YqocXLxc6rnZTZ6fJBIS7vvL//IDNYNQYD/Ukw0f8XALYlh/YKxBZRuzApyGIIi6YK
         Qvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722015085; x=1722619885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHKjTGsA5xoJdxNc5US7opyHTsaUSz6DP4R2VVpLsL0=;
        b=iDlelOnkzTXD/0G0UHcAdBw52UXUObqI6k4nuWaf3Hdrp2Wz72w+WotN/MgTojr/qd
         LXFJY51rUf68c92urfsBAvQQVNlsPTP/lx7x1kjrG/0espu0LXWxY4aqmeHGsjIpjeT4
         hCTj+8dLiZc1faq/SIa6Ko4l2pUr1W2y5aAfCnwvDElFRT+xYr67yF9d7TKgc2+cFhDv
         EcSzhFpD6RWWwWvFwvzQHy1NcTegdWJec7IA2+NdEHcwp61SXcWBLl1WxJt2GMQS38Vx
         D8vuP62hB0k2iLkk9u1T6/jB6JH1CoWJNXE3ytVBm2DDPiWDPmuQ40A+hHlWf6EbF0XJ
         pk2Q==
X-Gm-Message-State: AOJu0YwU4bjyHEQQ3/aTom+vFvYdXBO/ErP3XmAVtkrQv6rS99EtBnDb
	Eyb5Qlpso8cdtmkjvEv7YITVIF3b1eqlLezxW9f2sc3ON1gD/EDxEyHmCACzwdvNtPBG//bCuv6
	AiMumhtTIc87l2HCKrsiF8zyQSRvOH41UzK2XXA==
X-Google-Smtp-Source: AGHT+IEI2htU4rQmXKR32DSuhL2duertaz8E+94T640gTu2H7zXYYH/H6bLeEQ07Rgpskv2eHm4WeT9H3VNis9yy8bk=
X-Received: by 2002:a17:907:97c4:b0:a77:e1fb:7dec with SMTP id
 a640c23a62f3a-a7d3fffd2b8mr14159766b.17.1722015084967; Fri, 26 Jul 2024
 10:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240726163719.1667923-1-jesse@rivosinc.com> <20240726163719.1667923-8-jesse@rivosinc.com>
In-Reply-To: <20240726163719.1667923-8-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 26 Jul 2024 10:30:48 -0700
Message-ID: <CALs-HsvJzeqhymXDG07rN4t_iz2vZV54ACrqtmJ+1UA9jY+Rvw@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] RISC-V: Report vector unaligned access speed hwprobe
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_103127_312450_90CB49FF 
X-CRM114-Status: UNSURE (   7.13  )
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

T24gRnJpLCBKdWwgMjYsIDIwMjQgYXQgOTozN+KAr0FNIEplc3NlIFRhdWJlIDxqZXNzZUByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gRGV0ZWN0IGlmIHZlY3RvciBtaXNhbGlnbmVkIGFjY2Vzc2Vz
IGFyZSBmYXN0ZXIgb3Igc2xvd2VyIHRoYW4KPiBlcXVpdmFsZW50IHZlY3RvciBieXRlIGFjY2Vz
c2VzLiBUaGlzIGlzIHVzZWZ1bCBmb3IgdXNlcm1vZGUgdG8ga25vdwo+IHdoZXRoZXIgdmVjdG9y
IGJ5dGUgYWNjZXNzZXMgb3IgdmVjdG9yIG1pc2FsaWduZWQgYWNjZXNzZXMgaGF2ZSBhIGJldHRl
cgo+IGJhbmR3aWR0aCBmb3Igb3BlcmF0aW9ucyBsaWtlIG1lbWNweS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IENoYXJs
aWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+CgpSZXZpZXdlZC1ieTogRXZhbiBHcmVl
biA8ZXZhbkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
