Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56720C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 07:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYwnzR3Q6iYV3RtZYNS3g2Ox8hd43+1EroeYEMDeJqU=; b=rX0fhFOiau5dyf
	l1CCY9sCEziI8MX9feTIjKFi1TqIrmDQ2bWg4Bvs9w2aUc+26Z1j881S83KHUvV9PbcJV7y470tXu
	I4b5HoJN57tb7ZwfftZuE9HhDNWlyN3Xttp2UISiFpZF1uc+xTcmIciGHFfvYyHuKS9grW/Xu5Gr3
	IeOCm7TKb0W+wscLk3pbtVWnHJ4sUpb53J7M7xDFvVt52fmZ2BYAIanZg8OVOXpT+wH7lfLYMtXQh
	C1zMfZ9C1qsg7VmBqLcwui2k2/RnpjT7wHMgb3qr1khv2zSvAPjIMm0G5cO4DWGtPdcfHQJ/NwuqL
	LKAzSbPZt8Fc8yba1vpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMm9h-00D8qi-AA; Wed, 23 Feb 2022 07:33:45 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMm9e-00D8oe-OC
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 07:33:44 +0000
Received: by mail-lf1-x134.google.com with SMTP id y24so17112371lfg.1
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 23:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lDlvFrajDqrQchn6w54uabpCbRnHwQwOc/C3bGmlO0U=;
 b=dPv5BYrzN39pPB63DQ2U4vLv0nOlr98gwht+Zo4QATaTg5q7prK52shXjsR/AXna6U
 k71RPBMDx5GsG8mV17b87tTN3iAWOTahxvggmsaI0oMlsVgEiZoXtDR87rqcGCLj6DI5
 Msk2/lY5YZo0wR4NNR2sUeLocDFc3Kpo8TpPo23Ye2kg3mFHuHr14max0+aI3TyZvlOF
 8/MHL9x9RtHFgI1bjFWYygEWBld8kk8y3weK7HbCIlbe9QeLYfl/cWhrdhEiwzJh2s+d
 gpokPBntHpV5rlru4h165pnoUlQhr32QsgOK4yvG8nWcE8dA1duH6MCTXNjLtpdQ1fOp
 IODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lDlvFrajDqrQchn6w54uabpCbRnHwQwOc/C3bGmlO0U=;
 b=uTNnFIMDxbATMuZrsf8dgxLll1OCmLYqVVsT6T02yaGIxNvainBZ0Iwpht7AxN749d
 qhxXQRLH9jg2J1Xhs2WUpSoO2pX/IS/F10vwoQbkAX6L3jdYNIOtPbLG3/A/YThKzOp+
 WKqZlSUlEESVK4VjZWh0AlVKHWFgZly7nJqBGS81fJ6FaY72JIHnSkzXOZMXBNxVpmPF
 bA5rGRznKy7ZltzLM04yNG6CkncnoeEgbq2+9HXIVi1KwslU8nzLOoBNLNsO6RlMXpER
 yxRyxZiMPAobIgyOw/yvP0yE4PxLv4jC8Iw7g2Z+rzVcl8RjWc9H7tuvR/yFYsUnEJ8w
 APpw==
X-Gm-Message-State: AOAM5335NHj13bQd8eFxLtmQk4teaTWHuSJUqjh0KwnJthjpw1xEQnCg
 kR2LBye4CCYfGszdK0snqyAzDQ78gqySsh8Jn/X5fw==
X-Google-Smtp-Source: ABdhPJw/GJqPBESH0NTsrjpQmSPMVgGSEkmdayQA8+Ukdar13GPBEALRgM9upMK7jU0EafwCI3f8KY3Ur+qVWLFe8VA=
X-Received: by 2002:a05:6512:710:b0:443:7fb6:5223 with SMTP id
 b16-20020a056512071000b004437fb65223mr19200205lfs.223.1645601615597; Tue, 22
 Feb 2022 23:33:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1642582832.git.zong.li@sifive.com>
 <mhng-ffd770d4-8f8a-417a-a589-f14d09f55282@palmer-ri-x1c9>
 <CANXhq0pYHfsa4T1t=FK2=jM4OEfgXD=sDS5vVV4EKCpkwTz6og@mail.gmail.com>
 <20220218222339.9BF5CC340E9@smtp.kernel.org>
In-Reply-To: <20220218222339.9BF5CC340E9@smtp.kernel.org>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 23 Feb 2022 15:33:24 +0800
Message-ID: <CANXhq0qbjBpRPMP51cK9QsvQj-uvG_czPgLw+cjrWXhWEibcDw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Refactor the PRCI driver to reduce the complexity
To: Stephen Boyd <sboyd@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Lee Jones <lee.jones@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_233342_871138_E9A8EF22 
X-CRM114-Status: GOOD (  32.87  )
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

On Sat, Feb 19, 2022 at 6:23 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Zong Li (2022-02-06 21:21:50)
> > On Sat, Feb 5, 2022 at 2:56 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > >
> > > On Wed, 19 Jan 2022 01:28:37 PST (-0800), zong.li@sifive.com wrote:
> > > > This patch set tries to improve the PRCI driver to reduce the
> > > > complexity, we remove the SoCs C files by putting putting all stuff in
> > > > each SoCs header file, and include these SoCs-specific header files in
> > > > core of PRCI. It can also avoid the W=1 kernel build warnings about
> > > > variable defined but not used [-Wunused-const-variable=], like 'commit
> > > > 487dc7bb6a0c ("clk: sifive:fu540-prci: Declare static const variable
> > > > 'prci_clk_fu540' where it's used")' does.
> > > >
> > > > This patch set also contains the dt-bindings and dts change, because
> > > > we change the macro name for fu540 and fu740 by adding the prefix
> > > > respectively.
> > > >
> > > > Thanks all for your review and suggestions.
> > > >
> > > > Zong Li (4):
> > > >   dt-bindings: change the macro name of prci in header files and example
> > > >   riscv: dts: Change the macro name of prci in each device node
> > > >   clk: sifive: Add SoCs prefix in each SoCs-dependent data
> > >
> > > IIUC these there aren't bisectable: the bindings change will break
> > > builds of the DTs and drivers.  I'm not sure what's generally the way to
> > > go with these, but I always try to avoid broken builds in the middle of
> > > patch sets.
> > >
> > > Aside from that this generally looks good to me, but the DT and clock
> > > folks are probably a better bet for a proper review here.  Happy to take
> > > this through the RISC-V tree, but IMO it's a better candidate for the
> > > clock tree so
> > >
> > > Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # aside from breaking bisect
> > >
> > > Thanks!
> > >
> >
> > Many thanks for your review and reminding, and yes, it seems a bit
> > hard there since the DT binding docs and includes need to be a
> > separate patch.
> >
>
> Why not add new defines with the same numbers in a different file? Then
> a cycle or two later the conflicting defines can be removed? The driver
> can include the new file with the new defines while the old defines can
> be changed in parallel?

Hi Stephon, many thanks for your tips. I'm afraid that I don't
completely understand, does it mean that I can create a new temporary
file to define these numbers for the driver, and add a patch to remove
this file in the same patch set. If I understand correctly, let me
prepare the next version for doing that. Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
