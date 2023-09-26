Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB35BE7E648
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 15:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6mGN6LdnJC4bAKxaTOpt1/ON1FdBlHVbN1N2mbgkUI=; b=4nsGGcv5YAv7bI
	2h9wN9v46hqxyZiUPMD+LZmgb2PQ1yPDCP+Mrzl6eTyvtBBGc22Gr6g634HPP1cvrVuKkKQlu4PDD
	tYtaCbYU5X9oZWwduyqcps5ntqBs66dcPCex+f/WfNpd3zRbfBnSmSGPytGbWlnYvApDSYrM306pU
	uqDY/AEfeT7K9Xa/tD9ojUTjVpyn/jli7Kzo5rQdr8+PWHCKjVxQEryBqpS1G61ZDKE2wHvYmtEqo
	NTFtWI0DdqteMA5hrpvUsU0fDVFuF0rh//BfsAzl9741myZXcRa13P5mCsbb95kmW4St3+k9rAb+y
	nPkWJ1Dsb0wABubEBRBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9bl-00GbVY-0Y;
	Tue, 26 Sep 2023 15:04:17 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9bi-00GbSt-2P
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 15:04:16 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d865854ef96so7428612276.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 08:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695740652; x=1696345452; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gACCqU464nbmifans7JAXRQVvVlNjsznE9UNt5TqO8E=;
        b=HrxTsokbvxG2sCCYu0ECLE7Su1yDjHevjGELNfxO9RpGHWCdF6MEFnchUrWveSMfat
         nntOX9+5tE3Xj5HCHQFKvrsN1AWVArQ+aHm04Rvduj2JcuDpjDNrDjGjofAUsSeSGjm1
         ywhdN4fhBt5iQ+u5SRVWUc3tqDR45QcFRZdnmLTd3QU+Xk0nv1LPkRyBIgqUiTZbu9/R
         c/kGEQe2NhblURq+ond4JfgBbQ/WCKcpf1JwQ4JsqnY/fGZyYbv+kEeikpHXW29oohkL
         0YC8h2F9StBqbF6jdXkrGSZBV2JUC20x23+hjndSDmfLzfrVguhaLGZZQNyQIS/3ThRP
         exVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740652; x=1696345452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gACCqU464nbmifans7JAXRQVvVlNjsznE9UNt5TqO8E=;
        b=dTSnzNJ9VIm6DMdOaYJt0F9s80DciPQ8c9lc43nl/mpUBk4x3bQ/POonItzB/HRFzl
         KRYAVD4jwE17v+ooD1YOo7HsGyMQ+5V5NIy9DRnpxQM6mxkWiviTlkYEWcz2QkcZXmWl
         06a/1021LOQALGrpma8UFfRmVeTmdXFGeNUolWYrdNhwJvpaH5v11/hk7tr4edyVK+Fc
         hJiVGE/XGkgX3HrhyOImR1kxevLYw/PUfJB1+j28dkSE5BiJ2/vGCSV3Wd+N+/c5SjiS
         tqiKimCk7cAXZFnu9weHskDYxDqsVCYbGczBDY6suF75h1Dsp8EgFTSJTnNkSD8oHQ3b
         NijA==
X-Gm-Message-State: AOJu0YxuuifciNfH+Nm5F5L3Akhalkf83e4hWNT44msXnmivY31rbRp8
	QEXs/uBcOoj5Dnc+BACNXenSgbIWn9dBE3pXXS+5Kg==
X-Google-Smtp-Source: AGHT+IHebOY62vQuQ8mi7GVykbe+TPx5MZJx0BhkK6giVggi+4w9oRLPJPUde9+BtK9dj0EgQ9y6d+OUJIa5A5+74kA=
X-Received: by 2002:a25:320e:0:b0:d7f:13da:f773 with SMTP id
 y14-20020a25320e000000b00d7f13daf773mr9543151yby.6.1695740651642; Tue, 26 Sep
 2023 08:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230922062834.39212-1-william.qiu@starfivetech.com>
In-Reply-To: <20230922062834.39212-1-william.qiu@starfivetech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 26 Sep 2023 17:03:35 +0200
Message-ID: <CAPDyKFrrW+c9zm5pb6B7T_ULfij6=47E7OM-sgpCKTyWZ_BV0w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Change tuning implementation
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_080414_784426_3ED2C6F1 
X-CRM114-Status: GOOD (  14.92  )
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

On Fri, 22 Sept 2023 at 08:28, William Qiu <william.qiu@starfivetech.com> wrote:
>
> Hi,
>
> This series of patches changes the tuning implementation, from the
> previous way of reading and writing system controller registers to
> reading and writing UHS_REG_EXT register, thus optimizing the tuning
> of obtaining delay-chain.
>
> Changes v2->v3:
> - Rebased to v6.6rc2.
> - Dropped redundant criteria.
> - Keeped "starfive,sysreg" in dts file.
>
> Changes v1->v2:
> - Rebased to v6.6rc1.
> - Keeped "starfive,sysreg" in dt-bindings but removed from required.
> - Changed the function interface name.
> - Maked the code implementation more concise.
>
> The patch series is based on v6.6rc2.
>
> William Qiu (3):
>   dt-bindings: mmc: Remove properties from required
>   mmc: starfive: Change tuning implementation
>   riscv: dts: starfive: add assigned-clock* to limit frquency
>
>  .../bindings/mmc/starfive,jh7110-mmc.yaml     |   2 -
>  .../jh7110-starfive-visionfive-2.dtsi         |   4 +
>  drivers/mmc/host/dw_mmc-starfive.c            | 137 +++++-------------
>  3 files changed, 44 insertions(+), 99 deletions(-)
>

Patch 1 -> 2 applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
