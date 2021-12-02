Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC13AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 16:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMDOAD5+eh/SgUbtWXwgbHpAOoRzf880Oph4h15BrXk=; b=o45ikobIFyBWx+
	aiv4PQ0Ea3rjVnSwD0ZO7OW6F9bB4GRVSA6PT0qwaqH5KiAqPPsRGRemIQMjMuvGRFBmlmfNy1Iy5
	jFWGhr274OwsUI8EVMHkoify48bEezQ4yVigQ5sCBXNID0PbU7GdLcKTbvx1dgbcNlFmSC4fEAJgo
	RBJTfZ6IteZ/NeKSvHiET5tyXIfh1fX3kt5aOjWdvpFwcp3ypDp2jODskA/enp5G28YfOZ+M5tCi7
	dhhqAFCnQc9PVstCL9N8FDDOwJ94t5wKFhLjV0DteyDrto4tmn1wXeFSs3QP9HJ2P9lR42K58/xUM
	CGuHYBU52704GMBbggcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msop2-00Czw3-V6; Thu, 02 Dec 2021 16:20:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msop0-00CzvF-Se
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 16:20:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F6F36270F
 for <linux-riscv@lists.infradead.org>; Thu,  2 Dec 2021 16:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079CCC56747
 for <linux-riscv@lists.infradead.org>; Thu,  2 Dec 2021 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638462033;
 bh=1WDMLJeidqFjnh0pxrnksXMXOaTGk6uLPCSzajNaDG4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=I1VZM7EHJrBYi/maWid0khKW9kHSVM9uSPKzWgRZcCuhs+P72jrsPzTGctpJVvB8Z
 cmp61+W0cxcrbeOlmlABQ4nAiL6I2AgaJjod4lp7biJDwX2BaLOLSc4crcqew0wl5L
 rE5Ve1Kr+07FNjIZ9Ns5Y6Wtpdqi+E8w5D4yCV7ufd/H/sgHrnYFJHlNfivp9viufe
 MgIcYvFSs6dOeNkdiDr50gZpZS2n22eucmRJL5jQFCvfFkphAfYTPVW+bxfpGe882j
 WGzBdy4jtJ7mGAWeAPZbh5f+A2SGOrqduXKAjknTV1oV5dLbDAoGA+9sL5UdO9+v0C
 fpNFRuBOFgw7Q==
Received: by mail-ot1-f54.google.com with SMTP id
 h19-20020a9d3e53000000b0056547b797b2so327715otg.4
 for <linux-riscv@lists.infradead.org>; Thu, 02 Dec 2021 08:20:32 -0800 (PST)
X-Gm-Message-State: AOAM530s4DhscUvGL8FdFHU6Dcyhh8TmS06UrEEhmEErMx+Y7Y9vH5CC
 wZg8SbgiRi8mK9ysCsuTJe+FdmnK+honi0aCcPU=
X-Google-Smtp-Source: ABdhPJw9DiIj0UYwHcKDoPKEBlk6Q8Vbh4TwZEzp9Bx3NTOf92u57YzEw6ALHSfZ8UhgzeHd+QOgHx5Zwtx3MjfC/90=
X-Received: by 2002:a05:6830:1445:: with SMTP id
 w5mr12215817otp.112.1638462032141; 
 Thu, 02 Dec 2021 08:20:32 -0800 (PST)
MIME-Version: 1.0
References: <20211202150515.GA97518@sunil-ThinkPad-T490>
In-Reply-To: <20211202150515.GA97518@sunil-ThinkPad-T490>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 2 Dec 2021 17:20:21 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGJtMmcXLjHEG8xX0sSFNfdjj4A2_4DPcviEJ3=MARh+w@mail.gmail.com>
Message-ID: <CAMj1kXGJtMmcXLjHEG8xX0sSFNfdjj4A2_4DPcviEJ3=MARh+w@mail.gmail.com>
Subject: Re: Question regarding "boot-hartid" DT node
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Abner Chang <abner.chang@hpe.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@rivosinc.com>,
 sunil.vl@gmail.com, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_082034_991268_AE1E000C 
X-CRM114-Status: GOOD (  23.25  )
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

On Thu, 2 Dec 2021 at 16:05, Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> Hi All,
>    I am starting this thread to discuss about the "boot-hartid" DT node
>    that is being used in RISC-V Linux EFI stub.
>
>    As you know, the boot Hart ID is passed in a0 register to the kernel
>    and hence there is actually no need to pass it via DT. However, since
>    EFI stub follows EFI application calling conventions, it needs to
>    know the boot Hart ID so that it can pass it to the proper kernel via
>    a0. For this issue, the solution was to add "/chosen/boot-hartid" in
>    DT. Both EDK2 and u-boot append this node in DT.
>

I think this was a mistake tbh

>    But above approach causes issue for ACPI since ACPI initialization
>    happens late in the proper kernel. Same is true even if we pass this
>    information via SMBIOS.
>

It would be better to define a RISCV specific EFI protocol that the
stub can call to discover the boot-hartid value. That wat, it can pass
it directly, without having to rely on firmware tables.

Note that you don't need any spec changes for this on the ACPI or UEFI side.

>    Do you have any suggestions what can be done in ACPI case? Can we use
>    a UEFI variable with RVI specific GUID to pass this information? This
>    will have the advantage that it can work with either DT or ACPI.
>    Also, we may not need any UEFI spec update. Do you see any issue with
>    this approach? Your inputs will be very helpful.
>
> Thanks!
> Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
