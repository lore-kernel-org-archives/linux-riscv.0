Return-Path: <SRS0=xrvF=6G=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB48DC55185
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2020 17:26:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9396020776
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2020 17:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pvQIMOJz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OR8qtC+s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9396020776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xCBiL4UeKrv7hAKUKJgAhkl/9W+XzwM+RZ7hgiggjLA=; b=pvQIMOJztmuukfg0d3o3icLkO
	ppS3mlmJWztc+fPXYyLDpQk7F69nB0ywM/p3v+/61GDMsAhAoEYEyIRAyfOCTvrBQecfvSAWZv7S4
	R05WP4XZIa+pDeyLWkuLtrRNl5No/yr+qB4TXAKwFIIFnL/squYJcVRFPIKiW4Gn+R5/J/rAiQli4
	w//chXeZqPWvgI9zhjjD/cAii5xXyB8xi5sHdeKFEFacHgGvH8+OKImueavDY0YyeSPpYa9J09CW/
	ThwGimgIgtl+CeAD/GFTr0ZFay96vxCfnmH6q6c4ixxsmcUiF9cDpKY5SiQOO4o5huJ08u+zeZgF0
	9ylMuQQfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRJ8R-0007NB-Mu; Wed, 22 Apr 2020 17:26:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRJ8O-0007MD-UL
 for linux-riscv@lists.infradead.org; Wed, 22 Apr 2020 17:26:06 +0000
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 904AC2098B
 for <linux-riscv@lists.infradead.org>; Wed, 22 Apr 2020 17:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587576364;
 bh=xCBiL4UeKrv7hAKUKJgAhkl/9W+XzwM+RZ7hgiggjLA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OR8qtC+sAwprVmhowaRIZpLS27rtT8PE0VCGE2PJtkAU2z+cYEmQMD24DVQTnYRbx
 VmvWdTi5uurvMkkiKUVOP48yivOwotOobsc3mngIaMNPbhv7h06FX4/LotgOrelpe+
 1jFlc/LiaxwUnkO6CaQ+0re8Mbw6EHQZVEdFfQOA=
Received: by mail-io1-f46.google.com with SMTP id p10so3250826ioh.7
 for <linux-riscv@lists.infradead.org>; Wed, 22 Apr 2020 10:26:04 -0700 (PDT)
X-Gm-Message-State: AGi0PuZHXw+j1c61KmFBhtO012mp6a1DtNTjPFOcPmDnc7i5qudn8Js5
 rNz2nO0ZKoyC7/qehVfjQX6rnhxXPTD4zozKJMw=
X-Google-Smtp-Source: APiQypKgnUrxsoKaubXK1VqoevgVi/hWnfek7JkKhHrnbkHUsrr60pTcGH2Q0pqPhP6G2yqnoPOpaAi1zdTCcoFFkEM=
X-Received: by 2002:a5d:8b57:: with SMTP id c23mr26587932iot.161.1587576363980; 
 Wed, 22 Apr 2020 10:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200422172414.6662-1-ardb@kernel.org>
In-Reply-To: <20200422172414.6662-1-ardb@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 22 Apr 2020 19:25:52 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGswTWFggax=xV8d6VSpWm9FnLQSLt7E+67L6dbmYEOpg@mail.gmail.com>
Message-ID: <CAMj1kXGswTWFggax=xV8d6VSpWm9FnLQSLt7E+67L6dbmYEOpg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Add UEFI support for RISC-V
To: linux-efi <linux-efi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_102604_995573_07EC8FCE 
X-CRM114-Status: GOOD (  11.46  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 22 Apr 2020 at 19:24, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> This is a rework of Atish's series [0] to add EFI stub loader support
> to the RISC-V port. The purpose is to split the code in a way that makes
> it amenable to being merged via different trees during the same cycle.
> While at it, I added a patch to disable initrd= loading for new ports,
> given that it is deprecated and replaced with a method based on a
> special UEFI device path.
>
> My changes are logged in the individual patches.
>
> I propose to take the first four patches via the EFI tree, and expose
> them via a stable tag so that the RISC-V maintainers can merge it before
> applying the remaining patches. That will ensure that both trees remain
> in a buildable state, with working EFI stub support on the riscv branch.
>

[0] https://lore.kernel.org/linux-efi/20200421033336.9663-1-atish.patra@wdc.com/

