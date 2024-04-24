Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720EAC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 16:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzL2aWlhgZyqg0SlZLwpYtGo07T91hSpONo5Bqt5a9U=; b=V8XGfjd6aVUlYB
	NZYtIYHhpzsRVaRSQw5tpxSmkgi/2UNdsMvSuCtrlnvSW55b7XqFv1LEcQ60dmPQUknTo39cWNVys
	g80etZLJlulNt+FvtBaeh6x0txdb2hrKa/7Yqcw246kgAFeZUhwGIHrtN6Nt8AqqpS/8KLLcHUt53
	kSqNSartYOTStZil2ev6bdAceM6IlUgZxqH95nX+A1Hfn8y7xLq5MCPesuRuuEAuzELC06EhbmFmv
	Ta8Eex0VtSRKiHW4iPv85tsKtuN3JHFgij4dYkgirmFDH6B30cD9Ft8SeSKUyRF4kPH77yaM7bBnS
	5+UFmECo+R5h8EBeJ/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzflP-000000050X8-1SEx;
	Wed, 24 Apr 2024 16:46:31 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzflM-000000050Vj-20ed
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 16:46:30 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso11454973a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713977183; x=1714581983; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OR2ExOkbn5NhoJ3EHQ69fEuHqlCRe0lWGaAZLilHS5Y=;
        b=IFdBq6GLcwRHYF6DYyB6mc2AhcbdBAgNm2SVOLsVkziq3mQgXL0fJJYElE5pDG3LY4
         MrHFkz/dGSqmpRgjKeFG+nUkVjbqfWSkau5MtgCWflB2rM864eySThaSddzNnTvOAZPj
         H7hTXnwm56EBk4tBhIxfoHbPzf2QU8EsvQa2vJx0Fg58djJINmMjLmh9s3pY1NV2lDgH
         rKZ8XZc+YiXM082Ni+K2FEE9Ya28m0f5JfCDlIc1hHmatRXHobC/h0UpsaA6/GgfBFxR
         FFPk4XyRlU/aPMsgIYZ8EQGeJ5KH85YVAwIzKjT1b33/uMn4D280Dxm8JQUQyvMQSDh0
         +qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713977183; x=1714581983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OR2ExOkbn5NhoJ3EHQ69fEuHqlCRe0lWGaAZLilHS5Y=;
        b=F7KfTxO9FH0SNKPUWiC/MTP2MqOmRpxmmqQvCTHOKfB1OVqQr+1Nw1KFFbBhBvMR6b
         +VEe5ZdDgcE5mMfoclDwu8Pu7MZQY/qFV58D+1k5YFuYSelcvs1Rj609/N3UxHYdaYIz
         Eum5a1Df+S+LUfgvVNvtOgoTNeF0XadBhe1GvGO32rNfBWjDv710TncLlDws9WoUflnM
         ubyDSUsiZdUW9EEdH2AmD9YlqJyCK/EM9U2W0LZ+w9YkUFN8hkUYrzr5UVrEGVtvLkDy
         5Rrtq54+XV/Gfw4in2N/TZ31Pp3G8004GgF/2mYUuPxec04tgV7Nkabb2EtxCBMVzx/t
         aymQ==
X-Gm-Message-State: AOJu0YxVN5wWQt2mBdKSwOwcZqNoc2dFktM0AcNpRICKklgfisI4jevb
	s6kwXjBfcT6FdUsofkaeNRzpWDXcC9zkzMBRBE/biv6vC6sXRbtaBzjb0whcvas=
X-Google-Smtp-Source: AGHT+IEFGfcCTyr95j87C3m9QEcJHbWTs8ecvq8vgRfzfWoK9hZpODauOtNeyf9IWI85E+PeMJSnXA==
X-Received: by 2002:a17:907:1048:b0:a55:347e:7a89 with SMTP id oy8-20020a170907104800b00a55347e7a89mr1880894ejb.67.1713977182761;
        Wed, 24 Apr 2024 09:46:22 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 16-20020a170906319000b00a5544063372sm8553551ejy.162.2024.04.24.09.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 09:46:22 -0700 (PDT)
Date: Wed, 24 Apr 2024 18:46:21 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Pu Lehui <pulehui@huaweicloud.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: clarify what some RISCV_ISA* config options do
Message-ID: <20240424-e62cefb761bd56b398ec9235@orel>
References: <20240424-tabby-plural-5f1d9fe44f47@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424-tabby-plural-5f1d9fe44f47@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_094628_631845_A78DCB15 
X-CRM114-Status: GOOD (  20.58  )
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

On Wed, Apr 24, 2024 at 05:25:21PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> =

> During some discussion on IRC yesterday and on Pu's bpf patch [1]
> I noticed that these RISCV_ISA* Kconfig options are not really clear
> about their implications. Many of these options have no impact on what
> userspace is allowed to do, for example an application can use Zbb
> regardless of whether or not the kernel does. Change the help text to
> try and clarify whether or not an option affects just the kernel, or
> also userspace. None of these options actually control whether or not an
> extension is detected dynamically as that's done regardless of Kconfig
> options, so drop any text that implies the option is required for
> dynamic detection, rewording them as "do x when y is detected".
> =

> Link: https://lore.kernel.org/linux-riscv/20240328-ferocity-repose-c554f7=
5a676c@spud/ [1]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> =

> Since this is a commit entirely about wording, I dropped both R-bs for
> v2 as, while my intent hasn't changed, I've come up with a new set of
> wordings.
> v2 redoes some of the "detected by the kernel" wording to avoid stuff that
> Drew pointed out was redundant & adds a wee bit more wording to the C
> extension's stuff to be clear that it is a build time option.
> =

> CC: Samuel Holland <samuel.holland@sifive.com>
> CC: Pu Lehui <pulehui@huaweicloud.com>
> CC: Bj=F6rn T=F6pel <bjorn@kernel.org>
> CC: Andrew Jones <ajones@ventanamicro.com>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/Kconfig | 36 +++++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
