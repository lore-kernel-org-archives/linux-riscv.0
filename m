Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F07CC43458
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 20:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8zFOyC98xB9VtdYhz9P1Y8SU8Rn1lKMGg4XVzPd0NOk=; b=asABPEbQpnr6TA
	JrMuE9uFluNVduKie18Kjm1fCq9ec31xVjAb/TrZ4t2xzR8ox8UqcgN/PqlJODnhRl2YPa70F7QHd
	KssMRal1n1Yai7czzomPZ7pPZRCb/cIQl7FKcaH+qKS9VC+yOKctnZ+fqqQa8Sg0IXwcIIKKeozCI
	fd5+z/ib5mOk8uLJCpp9ecxWnnolxZSAUCm1xhLI7cLzKOirbF86qcpaYjB6kiq71QUznSMTRyJVs
	7y0tgqxNRF79WOzpnmra01KFK6qgLXsYIHz1SeA+yuqMRrEyC/W2bSx6IMXYBSsk7uo8HykJUrQ1w
	y7MMNxssKN3ijusiAPvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj0bZ-00000007iyp-1Tqj;
	Sun, 12 Jul 2026 20:16:49 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj0bW-00000007iyQ-1mfY
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 20:16:47 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-8114a4542b2so33835687b3.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 13:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783887404; x=1784492204; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sexe2OJDiMkFGhURClJc1NsMoa58P5WaL0Byl520pbw=;
        b=I+/BnumdzfyjVQ4jDfmjPwwNJ8O86Yk0ZGPKE+PRDl6wwCzWG9dPnFH1niRwmWMbTo
         fS4xNaCJiBWBZBgaSpdf1a3ttsgidbmdYaNYSorUx19nsSm/5rzsz1iDyOIqT2C+3Ib0
         7A3PPibRBky+AHgYswXtAhz341NhQZei14f/jt8l9Xcyux2nJXLtJ35YfvMIFmRs3lQP
         F43BfXGJGqHQJ6gpV1Wmb90WGMHj04BL6C5N8K19Y/0KBBNUYQDsQpyIJNy8tr2IwWAb
         lv1/+7Hnw/kF01yrKvGiS6FW73GHwQ/oEkrQCjRKzgXUhXVVzYqpliw1+wsAotO1hGOv
         DWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783887404; x=1784492204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sexe2OJDiMkFGhURClJc1NsMoa58P5WaL0Byl520pbw=;
        b=iKQKrchaoNGpH+sZgQ6wHsxwDpgaLKDQkaVOkT2aEtlBvmp6VlFtyeKG+4fMdbmZTS
         OJanspzGAm4HfVSU0ZLIdKdA0AcSBBG7CPx+2D1Qx+IpvxxeWKjnSRwvoEkP+GkYiTgl
         +5+OMAOGUr6cYBl7SohGjwzQ1zqaeqj2S4/OXT9Yjg+c1RreR30zEJZkjsrjnB1nQqFO
         i/RThgZj60qT+dpne+tppJvCz1efzYV5XlqBvOM46BpaoK6imyK12pNujPo4zwAuFZCR
         IJx9YdSKMWfQDsZ6NgsFTNmyoOQ4X3zaqXWlMoa/1ZCRnjog36RBgE9CYUaAl1wSbgGB
         Sj7A==
X-Forwarded-Encrypted: i=1; AHgh+RrJn//6UUmSVa6hebHJG9SZnrzq+QXZ2Bc+dkK6NQVtaod8TRhY9WfK1+77D4iHiqfGLSppah0Sa32HPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YydsG+EBRk+YB3oLALzZwOsLMeGmejZTTE3svXkIAfF6OS9NA41
	hwesOW626QlfZzH1Byvlml3ex5f0ppb+5DkqSKZffKOH3ZEPRYTiSYn4/eHUmN4CyHQ=
X-Gm-Gg: AfdE7cn2rx2xsbAl4298uoRHfYymd/WKWq7JWRVuMzdHmRaINc3EzVWb852f2KrBe5x
	5xkjk7o+KEWA3mDRameKB6PtoZSX2bCSaoGGiAyQZFqosNs1K20+RrW7ChsGLTvqhru2hbJwzoK
	CPjpHdZUE/vWfuiyMwPzB0EOYxCEBPfQqtmTF+ph9ZzLBlV3dUzu/dfx/z3LmvfupquemtgQBtp
	m8Xc+SV81uQNFDqF0XuHrwvKnpcC6w/2huP29OLqfCNR8npEdsJxbiAWO3bIcoRI48CUcelTgXt
	2UnONsx1yuBocbqW9xQZmpNreoOaClLgL2p5L0bCDFtc1GSyFZfhcsVf4tlrgMHmHLnaZQsTijA
	AhutEFZpW89J8cAC9kiFEuyOwHCs4Mue4NRSt3zSfTidsT0sAtaI8FnNEHvBjL/Vhj3BrJzjTwk
	Rd57/9e7YDm875P6lbDiGJhFXc4QZvUGZfbO5iR8t/vn3uD8Tam4F653+0TazN4Zx9No+z
X-Received: by 2002:a05:690c:250a:b0:81e:68a2:89d5 with SMTP id 00721157ae682-81e901b3d89mr51627807b3.55.1783887404652;
        Sun, 12 Jul 2026 13:16:44 -0700 (PDT)
Received: from toolbox ([2600:1700:220:59e0:5e9b:73c6:ee82:165e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1f11bbsm98699367b3.35.2026.07.12.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 13:16:43 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:16:40 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] scsi: ufs: spacemit: k3: Add UFS Host Controller
 driver
Message-ID: <7x3b4sttnc4oxkuvxmpkihfi76lkapjcigo7khgcgfytvol7w2@v5ykuyrk2z3m>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_131646_601548_886EE875 
X-CRM114-Status: GOOD (  15.73  )
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

On Thu, Jul 02, 2026 at 02:31:36AM +0000, Yixun Lan wrote:
> SpacemiT K3 SoC consist of UFS (Universal Flash Storage) Host Controller
> which has features compatible with JEDEC UFS 2.2, MIPI UniPro v1.61 and
> M-PHY v3.0 standard.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/ufs/host/Kconfig        |  12 +
>  drivers/ufs/host/Makefile       |   1 +
>  drivers/ufs/host/ufs-spacemit.c | 931 ++++++++++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-spacemit.h |  90 ++++
>  4 files changed, 1034 insertions(+)
> 
> diff --git a/drivers/ufs/host/Kconfig b/drivers/ufs/host/Kconfig
> index ff170c0b6da0..4f53b7f7688f 100644
> --- a/drivers/ufs/host/Kconfig
> +++ b/drivers/ufs/host/Kconfig
> @@ -132,6 +132,18 @@ config SCSI_UFS_VARIABLE_SG_ENTRY_SIZE
>  	bool
>  	default y if SCSI_UFS_EXYNOS && SCSI_UFS_CRYPTO
>  
> +config SCSI_UFS_SPACEMIT
> +	tristate "SpacemiT UFS controller driver"
> +	depends on SCSI_UFSHCD_PLATFORM && ARCH_SPACEMIT

Can you add SCSI_UFSHCD_PLATFORM and SCSI_UFS_SPACEMIT as modules to
riscv defconfig (or just add the former and add a default y if
ARCH_SPACEMIT in this Kconfig entry). This will let defconfig kernels
to boot with persistant rootfs on these devices.

> 
> -- 
> 2.54.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
