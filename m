Return-Path: <SRS0=BHV5=OA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A94EC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 05:06:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C9E721104
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 05:06:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fIkuRxk4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j///fBuq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C9E721104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9XGZqZr/WhPbCswLBifuFzQzI1rqUbo6LA4+2y0/7U=; b=fIkuRxk4k74N3G
	YbIxU2XTRFbUTcyWto3gereFK6sNWnq3S7nX+961UpAmNKelJXr2RegK7G/cS5CL8Ds5XU+WR/XFm
	nUQ4/ofoNNh40zJJkDFKKxFEaWwZ51JlpTzOClAjFeQNtRUk42DnnQepjgB/9jo6uPUaGOh5JAJ4V
	nFENa3ojW0MJioVzbhqTi+6yNLwSbL20eB6I+Mw8JJ3TA7vSUAbfpS17bzbA6QpsmNttzhVcFeiui
	xau8OO6S6Y+ltZG/mHxPM0rPae8q2DVkqiKX4Nohs07g7u+0GKr8r0bUKvPyFzwoF3dgP6VW+iGzE
	JM2dsZ5zCTnS6KHHe17Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPKiq-0000hL-LU; Wed, 21 Nov 2018 05:06:44 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPKio-0000gb-6c
 for linux-riscv@lists.infradead.org; Wed, 21 Nov 2018 05:06:43 +0000
Received: by mail-ed1-x543.google.com with SMTP id f4so3803041edq.10
 for <linux-riscv@lists.infradead.org>; Tue, 20 Nov 2018 21:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JZ1k8k0effVcK2h5mrwQpghGNI41Urk+FZjlZ/wFtYg=;
 b=j///fBuqtGOPx7YbJwAJ8TGP8FSvQ7ZxroFueMgXgqbl6w+izk1OpdpcdHUnCI0BFk
 j5WTlaoNerxJGDNUmw+piD3Su24zlQoZp/EbJsNxHYG+QbZ+WPhOFwcQyfPsLwYr+zlp
 rUNeF1tafVccWX+IF2aC0pnSSCREn7/pjwqSSCN1Yu8PkhDcbo7f7AgJmq0am1vAHSqS
 YBdCUQY6e/MoPsmfF2VZSSLxIhEjJ2zQVQBcR6BF6Kstpg8X3Hs8R5sDN4Ysafb71HAr
 4MrUlx9N1lMNpIdD409ldloVg+kSYsdVVWsHPWyZWmzGPQGoOmPypX33vK6YJpZLSTFy
 XQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZ1k8k0effVcK2h5mrwQpghGNI41Urk+FZjlZ/wFtYg=;
 b=o3CwSr8f5FABzukkQtbSeHr38k0eoGbQmDVgCNjoHrvIs3XfWaIEBQjd+9C9jtjB6g
 mYKIzBUZeM0Iyyl7qSmSvh4pXPo/OMdCx8Oa1YynI6s6oy9Qo8er7vPHP5umYJtynUM6
 2/+0/KcIr+qGXQwAbD+RuNBmNaPJMhijaIlGeBaVY1DWbDHY+90BDUeL9HUVizNL8OFe
 iFdkLtSBbq9EwmIpmyyZDKIk1ruJhVsMSYuYzaXqPTPvG+iGYnS98aNKxkU7AusB5Zvr
 pRVqHVapx1re9s0DGMsstXK3FRJD32Jp3gjPDSY1gfU2xDAAJQh6opgu/NAPgLrseUVP
 LOqQ==
X-Gm-Message-State: AA+aEWYfYlZcVidrsnmxPt6RemafKhaI/JtrilpwmK0tur97AvJdp4nZ
 lWEBfk4O/QL8IlfQQ8MGk/c0aG6eLZRjxufBfV4=
X-Google-Smtp-Source: AFSGD/XoPG5/+9Sfuow6ZIrDrCimwRfOA0UeUnWBjTC3+3bX8uLIqXECK1YA3BQPGFBmlWnOZCDAA5s9ZDvkg8npTx0=
X-Received: by 2002:a17:906:4e82:: with SMTP id
 v2-v6mr881777eju.149.1542776789695; 
 Tue, 20 Nov 2018 21:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20181112055515.20341-1-anup@brainfault.org>
In-Reply-To: <20181112055515.20341-1-anup@brainfault.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 21 Nov 2018 13:06:18 +0800
Message-ID:
 <CAEUhbmWskEtQR-kAuAYx=SHOJ4-MrCRUchSQ68WwZ62hxsTQyQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Build flat and compressed kernel images
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_210642_247747_0ACA4966 
X-CRM114-Status: GOOD (  11.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, palmer@sifive.com,
 linux-kernel <linux-kernel@vger.kernel.org>, hch@infradead.org,
 atish.patra@wdc.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181121050618.uXISoAmfbsizQYjE9qe58kCR51zWR6XG7MOtrFV6MpU@z>

On Mon, Nov 12, 2018 at 1:55 PM Anup Patel <anup@brainfault.org> wrote:
>
> This patch extends Linux RISC-V build system to build and install:
> Image - Flat uncompressed kernel image
> Image.gz - Flat and GZip compressed kernel image
>
> Quiet a few bootloaders (such as Uboot, UEFI, etc) are capable of

nits: U-Boot

> booting flat and compressed kernel images. In case of Uboot, booting

nits: U-Boot

> Image or Image.gz is achieved using bootm command.
>
> The flat and uncompressed kernel image (i.e. Image) is very useful
> in pre-silicon developent and testing because we can create back-door
> HEX files for RAM on FPGAs from Image.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/Makefile             | 15 ++++++++-
>  arch/riscv/boot/.gitignore      |  2 ++
>  arch/riscv/boot/Makefile        | 33 ++++++++++++++++++
>  arch/riscv/boot/install.sh      | 60 +++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/head.S        | 10 ++++++
>  arch/riscv/kernel/vmlinux.lds.S |  2 +-
>  6 files changed, 120 insertions(+), 2 deletions(-)
>  create mode 100644 arch/riscv/boot/.gitignore
>  create mode 100644 arch/riscv/boot/Makefile
>  create mode 100644 arch/riscv/boot/install.sh
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Tested with U-Boot s-mode on QEMU virt, using bootm to boot the kernel
Tested-by: Bin Meng <bmeng.cn@gmail.com>

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
