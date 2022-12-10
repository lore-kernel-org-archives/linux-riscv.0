Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294B8C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Dec 2022 22:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0TiPs7U5NtIFK7NjK4+mduFS9FsIr3BvWdf3coS3hs=; b=qrnJklemHQSCd9
	IkTpHTfhM/aVcEtvNcJu32Q5lEcrBuXuFFKuOupMjBm51R4hkojYj3GWrgfXMXWYqPrseTBv05ZXF
	xsJfmUdM6bhLy0pdQZ/KOrYyQSP7lSlNSP5y94k2+HEr9nbcr74ypOCS8pAy+OjQkfzBpqdwC9Fn6
	LEm8Ty/yreT39Vy6iOFA5c60eg1iwRdPXEA//zja7IiXvnXaIoJOvg4ZKFLlH/zHjPtZwNa33jYSQ
	Cxc4t0ELzuVE2DSThiqQJClGXD12+lPalrvTTXFpU8VMLl9FO1FQXHK6Zt4FUprNBlEqOfbgMiNGX
	6Vz5pnLEJff+I4CaBzaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p489k-006Foi-07; Sat, 10 Dec 2022 22:17:16 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p489f-006FhR-Vz
	for linux-riscv@lists.infradead.org; Sat, 10 Dec 2022 22:17:13 +0000
Received: by mail-ed1-x52b.google.com with SMTP id a16so7862086edb.9
        for <linux-riscv@lists.infradead.org>; Sat, 10 Dec 2022 14:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LkvxYJidst0R+A5LSErDuxTbyVHaZMmV9GPj7HhWy4k=;
        b=m+Rh+GVonvWaI1jVYpd4Y4DNwGXmMDeBdb5gOMIzJWz5AiKZHbZeluQdJu32GP67yt
         vkpEkt1iKtzCeKkBS3woadSTiMXT09o+vudNZ3m0iXVt/TXMDBPTUaNPK1vapSUkZGya
         HQ577H6ACFXklIovd7XxMKjiAh+PD2FmneoMx9YqayVTeOwJrCtGfINvdcF8MNWtvs54
         CkeAevnEvRrsnlyH8r1OIkDLSyN5W8CSw+7yWaTvJ2NICfeFfV/DP/gmfQCaS9wwuq/U
         mx1GUCvRoC2fKaK7SHxfcuybk6Ib3r73mJjVQZCa1jcXUHtL7UQTCEOfwQ/xFuszbtqh
         mgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkvxYJidst0R+A5LSErDuxTbyVHaZMmV9GPj7HhWy4k=;
        b=Rg6mmroFGE9cQjJhN4dvREbdEpA8N5eq6MAsuusE0M8WARdnxYSYgr5v45aw9boBdt
         nSrtScJnKf5XgX5BqMD0PiUwm8azE6ZKj0NeStPF2HoH1GSxP7SWH2Y7v5Tw85y9MCRK
         42Egpf7eEfpIkYvJKuQUxmELU0YHVsN4t1KQDR2XOoPOlNta1XDCaqfuboEQz2oBJ2ie
         BTao1HDml9Z5/QnPmCvgZpxtGTTVL5ft9WHpaJJgehhmN0xcUfH5j7cG1rgJD0f4uZDA
         ZN4ir1DbaxhLWCBIUM7LtnHQgwWmGSQvFwHaTE47ohL4kLuY6gf5Jl3bafFdkAwJMsk4
         UxCQ==
X-Gm-Message-State: ANoB5pkmR+6uvtM1/BSvd5PV36wP8u0O2ItQBwqmki2yv/5+dJLCmUvy
	eA7YOBm2hKdrkyh+UxcIgoXXd29vgs7dzSwHXNo=
X-Google-Smtp-Source: AA0mqf4q0TbIR1OlRrc3J4pJD8Mqs83Xl2msVMdIs36MozZvMXWNnafRsqaWgWTTK9t620OScdvM6D3ZYKB5w36AZLY=
X-Received: by 2002:a50:ed10:0:b0:46c:226e:6ec8 with SMTP id
 j16-20020a50ed10000000b0046c226e6ec8mr24250591eds.319.1670710626966; Sat, 10
 Dec 2022 14:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20221207180821.2479987-1-heiko@sntech.de> <20221207180821.2479987-4-heiko@sntech.de>
In-Reply-To: <20221207180821.2479987-4-heiko@sntech.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 10 Dec 2022 22:16:40 +0000
Message-ID: <CA+V-a8v4JDNC7yAi_DJB1ZCJXfA3XMwDocm2BNFN8MhwdV3hbQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/12] RISC-V: detach funct-values from their offset
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_141712_129141_016FFA5F 
X-CRM114-Status: GOOD (  10.12  )
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

On Wed, Dec 7, 2022 at 6:08 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
> Rather than defining funct3, funct4, etc values pre-shifted to their
> target-position in an instruction, define the values themselves and
> only shift them where needed.
>
> This allows using these funct-values in other places as well, for example
> when decoding functions.
>
> At the same time also reduces the use of magic numbers, one would need
> a spec manual to understand.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/parse_asm.h | 100 +++++++++++++++++------------
>  1 file changed, 59 insertions(+), 41 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
