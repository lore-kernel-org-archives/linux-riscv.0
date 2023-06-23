Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58A5EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUKgYiDT0nChjuGrEGh+RgLgXXsiGYC1d6VGLRRu3Rs=; b=IoSZr00ALMPVnW
	zEz7T+u/auiT2RfnqCFFQ1ySon1qbVUJd02SlONLQhfUVPYwlD2IM/c6EROx6bKe0vZRQAI/YNCsm
	ZY5rV+gGMImEFqKaTtb3qHjHI1NXES5ZqlbpW6VmQRyT98NPf8nD+ZHjp2yC33oEpCJ/NvrdVhsg5
	tCib8FkwfQjmahccclqKeJcg32J5v46CZSlsZmobopYhAX7mHBh/20TfurGVznseYW19UwmUZ1Vyz
	Em7DfcUepLByfy48yMsMf6g/kMOfa/Ey4cXiUEgeCyDFfgbBwEY9zTn9z26DWMPsqQKEvOSAniYbl
	Xgi53GqDlzyThUgYURbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qChYj-003jOu-2S;
	Fri, 23 Jun 2023 14:14:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qChYh-003jOI-2s
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 14:14:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 39BC761A5E
	for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 14:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E717C433CA
	for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 14:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687529682;
	bh=Ntwqh09qmutd77sQNlmVOHd5bIfNAdcpB+jwd7Dvzlw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cIWGE/xYx6FhuOWo1rWD5adSy5SGN4jxMtKWmwu0imvbFbt3flRSYUdFL46YF5J7G
	 LkMJeQI06jlBE8PdeGrIXhr/g+grnRs7bKXXuc52XiTjI2BgUNTUpqtTlkjwHnFXVH
	 BMdaXs4E50oGmRWqwX+3euLV+3F4GwAa8+zkLVlTaV0BQ+0kyTZNfdGOQN5UXCgffu
	 zs4OdZqA/PY8KgSsI5MhZCfOQlo5Z4Hr04/f/dEND3djtJ8BCW7U87dEXll9Kkmd0o
	 fitS2ZiST0DHakHKjTxvg9xJjVDSQ6c4qE9Wo0TQ60nB5dNkgIYgtAnosQ4WNB5Mts
	 9kv6kIxfcEa/Q==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b46d4e1b0aso11717851fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 07:14:42 -0700 (PDT)
X-Gm-Message-State: AC+VfDxRadvLakhzUrX+DsMeOWLecA9Ktd+ugVCbDdSCDx6RGELtUVhs
	y6uzGrb7FTSdJhCPmfIvbtuQB1slKTY+yVgwHns=
X-Google-Smtp-Source: ACHHUZ6j121/uUmv9VZ02vStSifRCtqhkFuWl4bjIhDNZ4UprfeA0HkFrvWSABiPLW1nzksW5LkbbQkrhi9/Kv7Py1Y=
X-Received: by 2002:a19:431e:0:b0:4f8:6dfd:faa0 with SMTP id
 q30-20020a19431e000000b004f86dfdfaa0mr9759749lfa.2.1687529680638; Fri, 23 Jun
 2023 07:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230621072234.9900-1-alexghiti@rivosinc.com> <mhng-8d50653b-2461-4020-be8c-be0b9afc6cfc@palmer-ri-x1c9a>
In-Reply-To: <mhng-8d50653b-2461-4020-be8c-be0b9afc6cfc@palmer-ri-x1c9a>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 23 Jun 2023 16:14:29 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFtJes-m78infhP9VDrHc9r=kFvLTsZ+NP5chxQwu5xqQ@mail.gmail.com>
Message-ID: <CAMj1kXFtJes-m78infhP9VDrHc9r=kFvLTsZ+NP5chxQwu5xqQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] Documentation: arm: Add bootargs to the table of
 added DT parameters
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_071444_002695_F014BC80 
X-CRM114-Status: GOOD (  19.54  )
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
Cc: aou@eecs.berkeley.edu, alexghiti@rivosinc.com, corbet@lwn.net, linux-doc@vger.kernel.org, songshuaishuai@tinylab.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 22 Jun 2023 at 16:39, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 21 Jun 2023 00:22:32 PDT (-0700), alexghiti@rivosinc.com wrote:
> > The bootargs node is also added by the EFI stub in the function
> > update_fdt(), so add it to the table.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  Documentation/arm/uefi.rst | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/arm/uefi.rst b/Documentation/arm/uefi.rst
> > index baebe688a006..2b7ad9bd7cd2 100644
> > --- a/Documentation/arm/uefi.rst
> > +++ b/Documentation/arm/uefi.rst
> > @@ -50,7 +50,7 @@ The stub populates the FDT /chosen node with (and the kernel scans for) the
> >  following parameters:
> >
> >  ==========================  ======   ===========================================
> > -Name                        Size     Description
> > +Name                        Type     Description
> >  ==========================  ======   ===========================================
> >  linux,uefi-system-table     64-bit   Physical address of the UEFI System Table.
> >
> > @@ -67,4 +67,6 @@ linux,uefi-mmap-desc-ver    32-bit   Version of the mmap descriptor format.
> >
> >  kaslr-seed                  64-bit   Entropy used to randomize the kernel image
> >                                       base address location.
> > +
> > +bootargs                    String   Kernel command line
> >  ==========================  ======   ===========================================
>
> +Ard, who looks like he's the last one who touched this.
>
> I'm OK picking this up along with the RISC-V doc patches, but I don't
> know the Arm bits.

No objections from me.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
