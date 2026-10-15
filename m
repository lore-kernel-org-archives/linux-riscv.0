Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F82CC6B34
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 12:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hryDG2Jz+NCpmnG5wsM3ec1kk+JXAizGA4XB+7kau7Q=; b=o/XWFHASgfQIT+
	CWBuuqmAM3qVaNCPxmJkK2ToeGb36roHOi/2O0LZ8TEgEFD6AEfd/Ut+1TTKRJlm0pUISxR3N+Cz3
	NJOEyBhGR63FkBeHsMRb/9EhwEcx5cAqV0w7JJwcqL9hhsAnMnUDiZ4BnnCmEuwxrbPnexy4WUUlu
	pkt6GOyRAFwfjTpwsu67LhcJ35iU62iq3YEWUMAd4/3KI1RtJ9PT6LOapjXMFYleVW8YVrEqY8nlW
	1kTgADRTSJ6ONjKPgQYo6xN88rwx0eb7qcp1Wrp2L+1Nl81UkpURHar88CNO8rymS750r90KAEgUi
	2cRksY6n2M8ZNjOjfVUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKNN-000000004Rh-3RGD;
	Thu, 15 Oct 2026 12:16:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKNK-000000004R2-2gQp
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 12:15:59 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so1376767a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 05:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792066556; x=1792671356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SN6vSgMsnnJYN+HFBZesKCHrB6GOW3IUndONKHtHc6k=;
        b=nZy7XDpO1OJW1mqbOQnA1CYM31CXYnt6I9TttvA4q2fkIL4KXYb1gnzV2zuF+XxOOa
         7lFxvkZQ8ikC6+LwPD72X6Ul2xvT98nhz+1XBIil43Vl5PhQjC/bdTRM6OIpaohGVfzj
         LLFhhSo4lvQlyGouDlSv4dCYuEAYo0HimDhcrnTri0yRrrSwzq7KgJ2MJiPdFsFvewns
         hVkk3/IsxfHUhLXWCOawNhlSSkVjhMEbpHDo66W+s4t4eIhPaJYuIBfs6fCDsDo+Rb7C
         852tsIcKzlIrtgNtYCDwz4o4BSW2R82wR4VliU9vl+dpAh1nIOkezJtkvqGpDXU7xQjM
         qsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066556; x=1792671356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SN6vSgMsnnJYN+HFBZesKCHrB6GOW3IUndONKHtHc6k=;
        b=Ei97JGmI6X0GbI9HY4HQvq6hQaZw/j389WG7wZLfG+rGR16HdibLUG95QrD+qtgVay
         U51LridYFlq17SLM03TuIdlSGUmizEKV9luNoT4rxK+O/4yV9HifDqmCkgOcJMJMYC8t
         g71TYON9Dm2KJqirmcM4MdUd3B9OEJK2hTiddthNS+ejQFoNF9gJAm7P/m6hYSgVTtmy
         ZqnsAeSHTQa9a1qC/KV7kidNQhsgc8YJzQGoKvslQdNbrJpitJ/IxRbEA493Z8DtwkDD
         hCQeYSCckQc6A2C5xq7DELhEqz/osXgPy9Aeyi710uFzmLBQ5jvlyjto3JDhPnsKlIkP
         iNEA==
X-Forwarded-Encrypted: i=1; AKwUvBx8eSNXmO4gVuNrAZoxNjj8wAAPXQR2X5tmDYTvAFDbBMIUDZs2UiNSLP7Ho3jSEk6NpSn+FCAPm1IfDw==@lists.infradead.org
X-Gm-Message-State: AFq9FYI01lZG5DJk5ak6mzZ96DM4ooRzUcysPPwFKYEFd48IctI/PUHQ
	PrsvUFnq7EyITFV+1URpeJK0krpc+G79AF1VDCStHlhNmuRrG8z7uM2Y
X-Gm-Gg: AYBFou18XMg98vippiMvZsJd7rXY1UBBfzvFoiHI6oErOCdZqxAvT0A3EbIScKbirLR
	HjKrg+9nNBA+yzZ7Mx6mNC5/67ctAYqSxYRqimY6z7cZZONEVeH5Dry5ZwDnqu+AzqKAYNO1E/+
	7HVrGRGomITbf6faZAmf0t9s8fJYtkzyD3IvjE+/MYMCl1n0itv9tx1gJ+TytCf+EBX7N4GgFb7
	GfJ4p7++UnvxmFQ6UjtlZX/PG+jakcUmTHVM1cVGbe2P5cAA4zCxFRI6JxZxSVCyDpExFwIO1YJ
	xocSIP7j2bXqTOX+F2C8v0yYhzimxeZ564ZTivr0fHzpw2Q2gKql+cihMRWVVkRRfmyVrqs0bCO
	7B2QSeu3pVHgIjqtD3QShKgdc5WUw2vGKWOIzn1M9uXWT1+CNNWf7FtRrGCEz+Gj3d7Z0mKamqi
	qWDOScaWauMaa3kvDkW4tVq0fBW69rwZVLZDYIsox8vnjeyjjWdw2WemUvw9xlImtdewshnUrLD
	OVD/wz782GSt10gIOxPcEgkNuQcmPYJNxs/IxF0HSapXNpVpIlbRasVyIDisOW2sXXvhYrl4qcE
	HPSvwyOz56okgEh0iCgklA0YWFfjcfMHXDwfaAwWAYmJqKb0iLVhrA==
X-Received: by 2002:a17:90b:5825:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3ac9ed8f5eemr1065524a91.30.1792066555611;
        Thu, 15 Oct 2026 05:15:55 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9437aa5fsm4273307a91.3.2026.10.15.05.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:15:54 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Thu, 15 Oct 2026 20:15:49 +0800
Message-ID: <20261015121549.3809199-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015074621-GKN26088@kernel.org>
References: <20261012235624.77993-1-alan.tseng.cs@gmail.com> <20261012235624.77993-3-alan.tseng.cs@gmail.com> <20261015074621-GKN26088@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_051558_678711_CC72AF63 
X-CRM114-Status: GOOD (  15.64  )
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

Hi Yixun,

Thanks for the review.

On Thu, Oct 15, 2026 at 07:46:21AM +0000, Yixun Lan wrote:
> > &i2c8 {
> > +	bootph-pre-ram;
> We could move this to dtsi file, since all board share
> same design which use i2c8 for connecting to pmic, the
> reward would be that we no longer need to carry this
> property all over board dts file.. similar we could do
> for "i2c2", but I noticed k1-orangepi-rv2/r2s have no
> eeprom enabled..

Agreed, v2 will tag i2c8 in k1.dtsi. I'll keep i2c2 in the board
files, as the OrangePi RV2 and R2S have no EEPROM.

> > 			buck1 {
> > +				bootph-pre-ram;
> U-Boot also carry "regulator-name" for this node, we
> probably could also merge it here, but could do it in
> another patch if want to limit this patch to "pre-ram"
> change only

I'd prefer a separate patch for that, to keep this one about the
bootph tags. The U-Boot K1 SPL looks the rails up by name ("vdd_core",
"vdd_1v8", "vdd_1v8_mmc"), so once the names are upstream, U-Boot can
drop the overrides in its -u-boot.dtsi files.

Thanks,
Hung-Chun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
