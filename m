Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7134BC54EBD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 09:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kqM/YbIPNVr4Zk/vTnFd7dviKSM5g88mbkhj6lcU7E=; b=c1cLrLLXInMMG6
	Js/VloXILQpanR0H84zV/emGH87OfKjgmi7F5N1HYkHiy0i1jDGVr+s2GBCU4RltByv5uM+OkzMUk
	BM2B2Do72PoefkA0IWKn0WNZyZOo8hA76HoqJgBAwf62Vw6jCrDvgAnfKwPUlJzb44sMiVsmF3FEV
	KwMxO5YrttZrmC/MDcQq9A9FUl8nxMuX+c/qZsvba78zTGPxplSCSlSUiluJ4TR+aDyv1tkrX5dr3
	EFs/wg0G2EcHBwZK8Wm5HgldH2VOQte6sDbUv4ttNkmOKS9YTw6ImaWq4VscBCt7qQJd4Kc2KYhtG
	SFfIMdeCQ1XSXwd2C8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtmQ-00ELmU-6X; Thu, 12 Jan 2023 09:21:50 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtmN-00ELjt-AI
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 09:21:48 +0000
Received: by mail-ej1-x634.google.com with SMTP id qk9so43247627ejc.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 01:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kqb6Iris8XWiiMxft3j9JHa7v06d0Pz4gSRMhwJTQx0=;
        b=n/F6PNUGVNPoZrDebVKmVpiZJ+hGLnh9tTOom2GkMxmVqhiyluaHAS2mBeZ+cssrXK
         bLQjy0nWfHpIxez+jYZWgkjA6OiUnTKL9YEYoI+7cP76G0AvRrsmQ6wjpXoccCUStBP4
         0csRTNp5wI1csOg0vSp1k0usXDWeatgNKt9JkZu3PIUlq14P4jCWeYU5bG9GnOsazUu4
         QVEtXP5nka4fCPL3IId1dI4rA43UPGnDlpgPPN+StdxX1bn1GEK7MMAof+79Yt3iU1zM
         jcokevDrio0CVEdvkfLF9M8n9gAW8KKaXiQTLBNrINIAJ4SDfUoH5IwDkpkGi1+jcQP8
         ee3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kqb6Iris8XWiiMxft3j9JHa7v06d0Pz4gSRMhwJTQx0=;
        b=b2L212mVvgAWyPO2s50y1P9iqRPjGq9phzeH50jwpYHQAZ3NIm8xZyXSt8M8dbBRBY
         I1xxR82rYqm30ruIsUxfZcDnmH+Xuk6QpfyJsHb/Wb5KZtM5wdRaJ0qA3FkILlmbFmLD
         /5xyjLD0w7LufPpKUAtt51M/M/lcler887vBmxbaun2AIhy1SciLQPnMExIEPKtt7Cj6
         VQhpkBFoJLq4jwKR+it4tVVPtHE0ErAHKtY1IsWNfKnwnPexAQA4bZqZ0B8hL3t43z8e
         NkEIldSKi8pPdnb7zW7GhNnjVvYFli+Ng3rxj0sWlwKaGMXu57nJA6LA9esHzBsB5HuL
         we5w==
X-Gm-Message-State: AFqh2kqyuitX0wZZrE1MJxVIEHKHzUuzozCPz5ngwkhD5gkaAAHIc2Pp
	NcMP3j2ppTH+NbKZ1PqDYUqB1w==
X-Google-Smtp-Source: AMrXdXtlLbGsD7vOfKM14h8N4DFizPIig28V7mzUwlWavZAZ0XBiIpC8ynNkF7zMf6Uiq65IATUG/w==
X-Received: by 2002:a17:906:34db:b0:842:3920:df75 with SMTP id h27-20020a17090634db00b008423920df75mr66807232ejb.33.1673515303467;
        Thu, 12 Jan 2023 01:21:43 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id y16-20020a1709063a9000b0084ce5d5d21bsm7189751ejd.22.2023.01.12.01.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 01:21:43 -0800 (PST)
Date: Thu, 12 Jan 2023 10:21:36 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 05/13] riscv: cpufeature: extend
 riscv_cpufeature_patch_func to all ISA extensions
Message-ID: <20230112092136.f2g43hrhmrqouy4y@orel>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-6-jszhang@kernel.org>
 <2398293.3Lj2Plt8kZ@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2398293.3Lj2Plt8kZ@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_012147_362219_0A5F02F6 
X-CRM114-Status: GOOD (  22.27  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 12, 2023 at 12:29:57AM +0100, Heiko St=FCbner wrote:
> Hi Jisheng.
> =

> Am Mittwoch, 11. Januar 2023, 18:10:19 CET schrieb Jisheng Zhang:
> > riscv_cpufeature_patch_func() currently only scans a limited set of
> > cpufeatures, explicitly defined with macros. Extend it to probe for all
> > ISA extensions.
> > =

> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  arch/riscv/include/asm/errata_list.h |  9 ++--
> >  arch/riscv/kernel/cpufeature.c       | 63 ++++------------------------
> >  2 files changed, 11 insertions(+), 61 deletions(-)
> =

> hmmm ... I do see a somewhat big caveat for this.
> and would like to take back my Reviewed-by for now
> =

> =

> With this change we would limit the patchable cpufeatures to actual
> riscv extensions. But cpufeatures can also be soft features like
> how performant the core handles unaligned accesses.

I agree that this needs to be addressed and Jisheng also raised this
yesterday here [*]. It seems we need the concept of cpufeatures, which
may be extensions or non-extensions.

[*] https://lore.kernel.org/all/Y77xyNPNqnFQUqAx@xhacker/

> =

> See Palmer's series [0].
> =

> =

> Also this essentially codifies that each ALTERNATIVE can only ever
> be attached to exactly one extension.
> =

> But contrary to vendor-errata, it is very likely that we will need
> combinations of different extensions for some alternatives in the future.

One possible approach may be to combine extensions/non-extensions at boot
time into pseudo-cpufeatures. Then, alternatives can continue attaching to
a single "feature". (I'm not saying that's a better approach than the
bitmap, I'm just suggesting it as something else to consider.)

Thanks,
drew

> =

> In my optimization quest, I found that it's actually pretty neat to
> convert the errata-id for cpufeatures to a bitfield [1], because then it's
> possible to just combine extensions into said bitfield [2]:
> =

> 	ALTERNATIVE_2("nop",
> 		      "j strcmp_zbb_unaligned", 0, CPUFEATURE_ZBB | CPUFEATURE_FAST_UNA=
LIGNED, 0, CONFIG_RISCV_ISA_ZBB,
> 		      "j variant_zbb", 0, CPUFEATURE_ZBB, CPUFEATURE_FAST_UNALIGNED, CO=
NFIG_RISCV_ISA_ZBB)
> =

> [the additional field there models a "not" component]
> =

> So I really feel this would limit us quite a bit.
> =

> =

> Heiko
> =

> =

> =

> [0] https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/comm=
it/?h=3Driscv-hwprobe-v1&id=3D510c491cb9d87dcbdc91c63558dc704968723240
> [1] https://github.com/mmind/linux-riscv/commit/f57a896122ee7e66669207932=
0fc35829434cf96
> [2] https://github.com/mmind/linux-riscv/commit/8cef615dab0c00ad68af2651e=
e5b93d06be17f27#diff-194cb8a86f9fb9b03683295f21c8f46b456a9f94737f01726ddbcb=
b9e3aace2cR12
> =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
