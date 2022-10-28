Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2D6ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 12:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDBxx+SXZswhF8S1Xp/qMVgAX4A11XUkGgABqV+lDiQ=; b=btEvbsGlLRs/Fp
	dDMsbk48FsVrSwxnEEOgP3vdxnDB/AYIVnoTIhJR6EKrFjzDXFt7vbW2EnAxny9gPY+WupajUNiAd
	tDtx3Lwlgdhs/4Rw3c8kFVtQS69E0VRUlBNiWw+aEAhNsVqdq5UB+zTavoNR0T9vXMXCvUmGGILBI
	tLKGv6z1YtvrvqVjwHJ6DLWUOC8IBnXRt81jt2zUJdYvx9utlM33wCn8mLHxNNeI6CwQ1N6vP/SSI
	dQnVXJN3s0FxABCgTLAthaIXuzXa1aKuCF79QUXxA2c8O7zmQ6Ptxh7sYaVwmc0KrybfK3JVucYHX
	ngyT5m88EHU3ykdCdLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooOjU-00H8kR-M8; Fri, 28 Oct 2022 12:45:08 +0000
Received: from mail-qv1-f43.google.com ([209.85.219.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooOjS-00H8k4-PW
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 12:45:08 +0000
Received: by mail-qv1-f43.google.com with SMTP id c8so3946958qvn.10
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 05:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5L/coRKTHoItE23ReDb1PV3s90z+puDyMQpN9g990M=;
        b=rPMLRCY+Xc2adjV/68RjEts7GnKjx0VATat3MiZCbKKTBzpWst98XOJXMP250M+JBU
         gOBwjBVf2qouBXdXEO0A9s9Yi/kgDpmt38lY6iff3y0z93ykHwu2NSkaSk2Ra9O5lc3L
         yIeZej3OI8RB2MDejc0vSKqPBOpKthw/az1KAqO1nckbxXoVXxUh/fArPaI66ZY74nxF
         wc9zRjeOy8Ij13Nuxo3g2ulXX/J2hf4QHMV5T64ch8nSPax3kn2zyWb+a7lkmkCj5qoe
         aI7WtisWpVScS4jS3WinzcX9gF02vE5LMofAfeP0uSSIf0q8Xhzk1YS5Ogu2EiqtNYgi
         VdXg==
X-Gm-Message-State: ACrzQf0ZyEK1JucLm0pNI094GUJH5dSOSk+5XR6A8MyqKMk2QpSJgeri
	brwVrl6SCPyrIz7nhwxndOJiYmuZcHg9hA==
X-Google-Smtp-Source: AMsMyM4cfLgAHXkiODlnBd8iHvjmR6m8hwVCrB+RPTc+71bP/NwfqOF7SSUJmwFLLEi/Go2xsvyEoA==
X-Received: by 2002:a05:6214:2608:b0:4bb:b0d4:2346 with SMTP id gu8-20020a056214260800b004bbb0d42346mr1465417qvb.26.1666961104495;
        Fri, 28 Oct 2022 05:45:04 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id c2-20020a05622a024200b0038b684a1642sm2368227qtx.32.2022.10.28.05.45.01
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 05:45:02 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-36a4b86a0abso46053507b3.7
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 05:45:01 -0700 (PDT)
X-Received: by 2002:a81:3d2:0:b0:36b:6772:75a3 with SMTP id
 201-20020a8103d2000000b0036b677275a3mr30116483ywd.383.1666961101680; Fri, 28
 Oct 2022 05:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220920184904.90495-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220920184904.90495-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Oct 2022 14:44:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaxb05O0vqw8PqRQShOFE-f9JEQqxGb0LaPWTA=yDAYg@mail.gmail.com>
Message-ID: <CAMuHMdXaxb05O0vqw8PqRQShOFE-f9JEQqxGb0LaPWTA=yDAYg@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: soc: renesas: Move renesas.yaml
 from arm to soc
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Atish Patra <atishp@rivosinc.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_054506_849403_DB407ECB 
X-CRM114-Status: GOOD (  23.06  )
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

On Tue, Sep 20, 2022 at 8:50 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> renesas.yaml lists out all the Renesas SoC's and the platforms/EVK's which
> is either ARM32/ARM64. It would rather make sense if we move renesas.yaml
> to the soc/renesas folder instead. This is in preparation for adding a new
> SoC (RZ/Five) from Renesas which is based on RISC-V.
>
> While at it drop the old entry for renesas.yaml from MAINTAINERS file and
> there is no need to update the new file path of renesas.yaml as we already
> have an entry for Documentation/devicetree/bindings/soc/renesas/ folder.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3 -> v4
> * Updated the path in the DT binding
> * Included RB tag from Geert

Will queue in renesas-devel for v6.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
