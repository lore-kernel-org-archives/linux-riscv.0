Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9403AC6FA99
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=bBkVMkBe2mmx/P1AnrD/GP2qfGAEQ/R1ClHp+fEOcC4=; b=2zAwAOutDxbsiaFMvxohzwRicx
	2ayQwQnMyKpOOPpTcQtMTgT9ebXJ0ma0WAmlGAsVckKCnyl1yapocDaFzPY2Foa4Y7+WXmDV96GYT
	RamEsqCDO5gPLz1lf4ubR84Tp2Migjpv34AsmgcZn1QFT6UClyBkTaLwg8TndZHFaGToCDXH1is6m
	3Hrf8lYXhYh13IQnTux1536LXmCFg3g70YGdZojbRm5mXQhhCxaYLTnHO2yiIHty8rN5GZ7+cX+xJ
	wv3tRLrlkujT8d959eBCGi4WCtdu39rkrZj0Qk7DJ5CmnGqwgPI/BSl6+jSlevepBo5gxtlD4m4fq
	EFFTps/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZePT-002RsB-AS; Tue, 07 Mar 2023 20:59:47 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZePJ-002Rpj-98
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:59:38 +0000
Received: by mail-pj1-x1031.google.com with SMTP id q31-20020a17090a17a200b0023750b69614so13067818pja.5
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 12:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678222775;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6atF6I2q0Ii8LJH3Gz8PsiaDUZKWNvxsL7EGNgfsZ8=;
        b=17PlGSKbkKuIupnjF7zLginu7kJrESk+P/cZNJX3rRw0zF5jTVklMTT4oR5QGRJVM7
         td0ySlYq+69ZpSgNbAzR6FlBEXGLj2Nis9SADR+8/t3oWYFVdd1c8s8Eyy+n25AsiJOt
         CiC+MRleb+/J3bbZRtBB3/bmGXFd/un/5H3hKP1sq+a2g1SiQrHa54iR/iizzfYy75st
         ZSCa1KDT9CGoTh5cv/Lswq88zQ3lR9cBRvLTJhT5+JJq/gsHU8khfZp8LLNGcTMCMeQl
         g0KFdVBvW8oyUCRSU+kvddY3z0TLf28jI0RrkaJcNvizuIkpYAEfriNVf7GtZNbClPEv
         WPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678222775;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6atF6I2q0Ii8LJH3Gz8PsiaDUZKWNvxsL7EGNgfsZ8=;
        b=aogS6VjAu9GyzPT3f6+bh5V/iQ6KdlmC8ztPXCXsX/4ukCavTcrD1XZjzX4FbcuIU5
         UgBBiKzCZV7fosD9j/k3ZRtAzp7u8n2WrX7FUH5GgBl5tbn9yJMN7jWsOVoAmQZBP8Io
         2hiL0jep6eTKMsx690g0Vs43xjFH53tP+WDAFnuEoGBp+ldGf26k52ioU057M62wHfe8
         H1iEfGVAzyMBeIMYB6w8k/PSJSqmpIJ4LXkIWHkmUNLlFaFmqTRrs3EJGzMDt65RMQ52
         STbc6ft7qbx2a1ICIyQFs04gObtqd5riJXmdnpQhZpJWNT5r0I1zjtJbhGZgBgP4XW7J
         4TOA==
X-Gm-Message-State: AO0yUKUFU4cVMHmN7FC5eSysdXp2lwVfR/+0sjL/pOSELMTlzIEBcYwm
	O/XA4ApXGQqMqzzDn2/hp3hSXw==
X-Google-Smtp-Source: AK7set8gIjw0BxRnruPT5teFvlmXm/ZFQq6QpH299KEvyKIMUvG5/5R6imaZgBOnNpMXCYoLV8qPeA==
X-Received: by 2002:a17:902:c94e:b0:19a:ae30:3a42 with SMTP id i14-20020a170902c94e00b0019aae303a42mr17281637pla.21.1678222775335;
        Tue, 07 Mar 2023 12:59:35 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id ke15-20020a170903340f00b0019aaba5c90bsm8828902plb.84.2023.03.07.12.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 12:59:34 -0800 (PST)
Date: Tue, 07 Mar 2023 12:59:34 -0800 (PST)
X-Google-Original-Date: Tue, 07 Mar 2023 12:58:37 PST (-0800)
Subject: Re: [PATCH 1/4] dts: add riscv include prefix link
In-Reply-To: <20230106010155.26868-2-andre.przywara@arm.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andre.przywara@arm.com
Message-ID: <mhng-6efe8a4c-7234-4324-8861-b4f1ff028ec2@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_125937_341287_CB9EF201 
X-CRM114-Status: GOOD (  15.48  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, samuel@sholland.org, fabien.poussin@gmail.com, linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, wens@csie.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, frowand.list@gmail.com, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, szemzo.andras@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 05 Jan 2023 17:01:52 PST (-0800), andre.przywara@arm.com wrote:
> The Allwinner D1/D1s SoCs (with a RISC-V core) use an (almost?) identical
> die as their R528/T113-s siblings with ARM Cortex-A7 cores.
>
> To allow sharing the basic SoC .dtsi files across those two
> architectures as well, introduce a symlink to the RISC-V DT directory.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  scripts/dtc/include-prefixes/riscv | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 120000 scripts/dtc/include-prefixes/riscv
>
> diff --git a/scripts/dtc/include-prefixes/riscv b/scripts/dtc/include-prefixes/riscv
> new file mode 120000
> index 0000000000000..2025094189380
> --- /dev/null
> +++ b/scripts/dtc/include-prefixes/riscv
> @@ -0,0 +1 @@
> +../../../arch/riscv/boot/dts
> \ No newline at end of file

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
