Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8599FEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 11:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UC2h4Yc1u4XLNdcB1NyxtxfUivSzmaliLT64WovjeC8=; b=m0aOQCWBMWUBsQ
	Odzn1VbQSqLE5OKAoaIaxVMFyTp29lUtNHnyNwkHpYgbLrXJBwA0+wK9RqiLcEd69CjXNBGWq85mu
	MQVnWlSsCcWd8ipkQS9sDRj35F40z4fsi0ymC5aUXS/HnsiZHgyJ1AVr3WNCWGx4yUVZWhWeSVxXo
	h+FcqiVmfeizZewpx0Ywa3X1zjOMB+/xHTFOuxxsTpzOB46N4ybvC3bjGpbZg3eMV1vUKfSO3Aao5
	NgBwxvR/JNqrgMU6te9BdIg1jsh0MYhsZC5EGDHz83Se1F5JziPdMrQw/AxsorNi4iWiBcPASx4Cm
	TuwKxAydz+1za5cdqjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoUA-00DxCy-14;
	Fri, 21 Jul 2023 11:39:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoU6-00DxBN-0z
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 11:39:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0CDC861A1D
	for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 11:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408F5C433C9
	for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 11:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689939584;
	bh=ixcyPI+tRpHz9AI3BMtu2lOFnZGfsu9wB3fa27jasCs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=byMPQs+WrmgchWqISNjIN7asmtO1iXkgIlVIsv+Xdnz7Qc7VZQTXRaVacoAwAgZSw
	 tXdHLLnn3dYw907IDn39Ql4ucmZlH1ZCmKTJBXSAMM7PeinD2wFawWwbXD/de+S5UY
	 bcfFAu7M4bGRTV1Sbbdp2XqXc1YRP+HBIe5U8v7TxJBTXdiqLxSY/rVIk79bjzCevH
	 ib6tGgNhWifxjtPh88ZOE7Yxxo6uJlAZpZQXQyKwuUgX1aNTX+MbErMDd03vJYlp0T
	 CRtKYI6c8dWrhuymV5H6f4tXPr1XgrpxoCQsvLND3iPHpwCVeQ5pEYhRwcKq6rRDql
	 37fyiury4Mk1Q==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fb77f21c63so2934086e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 04:39:44 -0700 (PDT)
X-Gm-Message-State: ABy/qLahBtzLvF7+G+vs/prthUhZbDZd985v1e31MOH69mA5Y81FMdzg
	sOIkLMY9Gtb5JFQoM/1l8s50gPSacf2BEv5f1b8=
X-Google-Smtp-Source: APBJJlFezRKIZgJimN3FDD+tyYMlmqo8uIRe1cDw4B8uo9Xt83FU0WZLGjAZLyP+5rUYx5qfU75Xll2qGWNV8aOTYXo=
X-Received: by 2002:a05:6512:4022:b0:4fd:d016:c2dd with SMTP id
 br34-20020a056512402200b004fdd016c2ddmr1315548lfb.12.1689939582014; Fri, 21
 Jul 2023 04:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230711153743.1970625-1-heiko@sntech.de> <20230711153743.1970625-11-heiko@sntech.de>
 <20230721054036.GD847@sol.localdomain>
In-Reply-To: <20230721054036.GD847@sol.localdomain>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 21 Jul 2023 13:39:30 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFqs9v1Ao1RQRXiccKEMhXpy9O=Ng8TQ--vdOkTz5Yc5Q@mail.gmail.com>
Message-ID: <CAMj1kXFqs9v1Ao1RQRXiccKEMhXpy9O=Ng8TQ--vdOkTz5Yc5Q@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] RISC-V: crypto: add Zvkned accelerated AES
 encryption implementation
To: Eric Biggers <ebiggers@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, herbert@gondor.apana.org.au, davem@davemloft.net, 
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	christoph.muellner@vrull.eu, Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_043946_451248_81F65701 
X-CRM114-Status: GOOD (  20.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 21 Jul 2023 at 07:40, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Tue, Jul 11, 2023 at 05:37:41PM +0200, Heiko Stuebner wrote:
...
> > +static int riscv64_aes_setkey_zvkned(struct crypto_tfm *tfm, const u8 *key,
> > +                      unsigned int keylen)
> > +{
> > +     struct riscv_aes_ctx *ctx = crypto_tfm_ctx(tfm);
> > +     int ret;
> > +
> > +     ctx->keylen = keylen;
> > +
> > +     if (keylen == 16 || keylen == 32) {
> > +             kernel_rvv_begin();
> > +             ret = rv64i_zvkned_set_encrypt_key(key, keylen * 8, &ctx->enc_key);
> > +             if (ret != 1) {
> > +                     kernel_rvv_end();
> > +                     return -EINVAL;
> > +             }
> > +
> > +             ret = rv64i_zvkned_set_decrypt_key(key, keylen * 8, &ctx->dec_key);

The asm suggests that the encryption and decryption key schedules are
the same, and the decryption algorithm does not implement the
Equivalent Inverse Cipher, but simply iterates over they key schedule
in reverse order. This makes much more sense for instruction based
AES, so it doesn't surprise me but it does mean you can just drop this
part, and pass enc_key everywhere.

> > +             kernel_rvv_end();
> > +             if (ret != 1)
> > +                     return -EINVAL;
> > +     }
> > +
> > +     ret = crypto_cipher_setkey(ctx->fallback, key, keylen);
> > +
> > +     return ret ? -EINVAL : 0;
> > +}
>
> It's a bit annoying that RISC-V doesn't support AES-192, though also not
> particularly surprising, seeing as AES-192 is almost never used.  (Intel's Key
> Locker, for example, is another recent CPU feature that doesn't support
> AES-192.)  IMO the issue here is really with the kernel crypto API -- it should
> treat AES-128, AES-192, and AES-256 as separate algorithms so that
> implementations aren't forced to support all three key sizes...
>

Why is this a fundamental limitation? AES-192 uses the same AES block
size and round structure, the only difference is the number of rounds
and how the round keys are calculated.

Creating the key schedule should never be performance critical, so if
the lack of AES-192 support is due to a limitation in the key schedule
generation instructions, I'd suggest to avoid those if possible and
just use the generic library code to derive the key schedule. If that
works, I'm pretty sure AES-192 support is just a matter of
implementing a 12-round variant modeled after the existing 10/14 round
ones.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
