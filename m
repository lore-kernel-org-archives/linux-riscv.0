Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CA0C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jan 2022 09:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oyg1CNIIbvUm1kuXz7AUT2/Ed0DV4z68SLwgrehJxXc=; b=pZIsoPV7EL0Ujh
	qDimkmPcIuuxWflBOFkMekC39W672IYpmiDGSs3Rzz3EQ3DRQdZFmmrN2RdMuGtTkcvOD/H8ZXsXg
	E03lHEj5JfL3RqOhPCtWFg4OxmJKOAPrJ3BKy/4G4MEXewVPL0H5/kfgTrFdH98k3idVedTuJx7wj
	5tigrtsUJ1ei3qmJs3F0wxMxIqdDPiFELPBYyGgE3Qqc4umUCvBA3+l09R09Ua4P+8zAV7l0KYI4u
	5hZTKW9Exvj6XIC5vPj6K89rb6/ZzlHXSvZazOS87SmE5n+fQoMAIjcO1C7Vp/gv7Awl81+SHTOGF
	KnieNPryeLg5U4UefSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7wkX-005JmE-RD; Thu, 13 Jan 2022 09:50:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7wkV-005Jla-HL
 for linux-riscv@lists.infradead.org; Thu, 13 Jan 2022 09:50:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5F62661B0A
 for <linux-riscv@lists.infradead.org>; Thu, 13 Jan 2022 09:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A96FC36AED
 for <linux-riscv@lists.infradead.org>; Thu, 13 Jan 2022 09:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642067425;
 bh=txY+LUm5NxB9B4BEC1y4CRhy+yjRifp3BP9skkYnBdM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QoDkaiQcTWRbAHDyrlCSz/cKkWrW9uKMlhTywpie1ygyLJudZqBwYuswQGtnYP7dx
 4bFGBOBq067hU1owmENurTbXhJscL+seDTTfUS+fu+P8zl51GXDohInHCZD5BRhBg6
 i32F9vLXz6EC2gx6uLnN0lJGqEW8V4x3fhGOXcfyqrea2TKffjz2Pui1hrAJ3lqJXo
 TYHW6rpExbZHxJku2P1KP6gShUDLLypPn146yp9OJ3O7Xmm987Ukf3kR6SDDeBpj8j
 22/pSHq3j50UZUuK1DaPe+KAZBNTg8zVIJlKYresm6E4nMVxpr+Eqq+LohRHEbkv2L
 IgVy5JRZrFjlQ==
Received: by mail-wm1-f43.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso3249391wmd.5
 for <linux-riscv@lists.infradead.org>; Thu, 13 Jan 2022 01:50:25 -0800 (PST)
X-Gm-Message-State: AOAM5328YeMV4SuCNqve5Z7Psyy5r+jpwQO04ZSe4WlxK+LY4V+dfRhM
 MJxzT/PUfsYZ7qfZnzRMBovGQhW3Ehrn/pVfG7c=
X-Google-Smtp-Source: ABdhPJzEkV2eqX+RxjWNB8s4aNPY7K+izy8anpKH51bSMrjsjIvJ0agb6zAir/25WaXAMpp0PNqGnepB2ciKraO88K8=
X-Received: by 2002:a05:600c:35cf:: with SMTP id
 r15mr3114756wmq.106.1642067423459; 
 Thu, 13 Jan 2022 01:50:23 -0800 (PST)
MIME-Version: 1.0
References: <CAOnJCUJfEpW6TtBPFGZ9TfNJeb9r+-L_8BddsxxejAd9Fe8VHw@mail.gmail.com>
 <CAMj1kXHGPZBfaiMCPYt7tYe+5wt_jn78Qdih9U-XLDba5sfqtQ@mail.gmail.com>
 <6fccad4e-b579-25ed-6bf3-2fb2a968b243@canonical.com>
 <c758bae4-3578-f062-edfd-f5835ae525fe@gmx.de>
 <CAOnJCUJ6Aoh7881HOSifQTc61+vCTVjxnYORfWM_WGLJQCugRg@mail.gmail.com>
 <7416157e-50d1-3664-7df0-2a45e29cd8c1@canonical.com>
 <CAAhSdy1DOnEGpxPQF7juUSyBTyx9W8KsH8exTpOmTLOnNCMJqg@mail.gmail.com>
 <CAOnJCU+taK16cnfnQtk3QM3s-f4RCUTWENAPe8Nhs-8L29vKew@mail.gmail.com>
 <d7f57c7f-a02c-c245-e1ef-af30bc9f6998@canonical.com>
 <CAMj1kXHXFXSojAUz6EDeoTkqD5AxeFTffA=RyTu5JnsAsAHsfg@mail.gmail.com>
 <20220113094448.GA15466@sunil-ThinkPad-T490>
In-Reply-To: <20220113094448.GA15466@sunil-ThinkPad-T490>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 13 Jan 2022 10:50:11 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFU2TeywomSK5anCUihu1Ts-=OwSDEAJS5hq+vRc82c5Q@mail.gmail.com>
Message-ID: <CAMj1kXFU2TeywomSK5anCUihu1Ts-=OwSDEAJS5hq+vRc82c5Q@mail.gmail.com>
Subject: Re: Question regarding "boot-hartid" DT node
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, Abner Chang <abner.chang@hpe.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, sunil.vl@gmail.com, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_015027_665703_4DDE366D 
X-CRM114-Status: UNSURE (   9.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> Hi Ard,
>    Here is the draft EFI_RISCV_BOOT_PROTOCOL specification.
>    https://github.com/riscv-non-isa/riscv-uefi/releases/download/0.3/EFI_RISCV_PROTOCOL-spec.pdf
>
>    If you are fine with this, we can freeze this spec. Thanks a lot for
>    your help on this.

Please don't use the EFI_ prefix, it is reserved for protocols that
are defined in the UEFI or PI specifications.

Other than that, this looks fine to me.

-- 
Ard.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
