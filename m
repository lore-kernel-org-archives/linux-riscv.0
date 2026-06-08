Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AB4CD8CA4
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 13:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEoD/sbfcbGPHNOOzgcn+2wB/okuBYSBjKc+04Umve8=; b=5FfNyG4zTDkNf4
	vQMAFv3R0Zck1wECrdo/H4rHJc7cUjsSO4gP/fXd1C5lJLQSm+TaSCBXI1xda9fSxj/Q7A9Y3Ek+1
	UW9808ucJU6glPr3jnALYt2M5ea3vfx8rR4ItYwfWM35E5lGlp62ed8furJq/bYzzS2VYQksfw3/x
	O/Om8aNhSPem2gMsFoR37hosfCY0BBNmsv/0EGh56CMljw/ohGRnjayjifLwCJqiPkaSbc9Saov8R
	+7lanwh2mDK2CwDPnXbsFLssH4SQFYWaP2IJ7eQAkXv6Xf7DtzyMe8xj3s8nU6U7kXupdvEM/UeYH
	myJXb3KqgEpYkf6H+6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWa1d-00000003dD2-3iWn;
	Mon, 08 Jun 2026 13:28:21 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWa1b-00000003dCX-3nk0
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 13:28:21 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8ce9df48e1bso43140666d6.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925298; x=1781530098; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ib003UxJC6YmbGgQtGcZFebArkcoz8imvCj7f2/9g8w=;
        b=J6X1BEUwH047LiHgT2glX80/OKeS2I7EXIiPgSEgo0FjEQBBfe4Ay7lg0oXbsTfBj/
         oA+mTkIMxck4SvByv9ZX1NpmSyc4dNP8AGg32tD8X1yTY2/aqn8EU7MX8RWLysZkRcoB
         GLthTKj390a9NZSFk2l0T02p+8keAFYPnxXNOyGTaD9u2k7WGx+xpbK2AHu4wJVFtHW6
         QYINBakVw0uoWYhoJR+fL8A/txwHARS8qpLUpIvsj8/mYO/XsnwNtuXyo/zi3Xe3ApmR
         9nEwFsXLepNH31yCnOYLJX0ynjfkmm2+Sf5mnR1fHe5EBZxSDMZ3WPsPcP1MwnzejLYN
         /0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925298; x=1781530098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ib003UxJC6YmbGgQtGcZFebArkcoz8imvCj7f2/9g8w=;
        b=GoyRl/Nx+1pkR6ePoyQ6pFBXopDkJPrkLhwMVSTX6Wi5RPoIxB5munnt935cvGJUJi
         Ms9Qtch4HCdV0HR30pr8fcAAdSFLk8pcdkGI8CxcI+MsBllga3u0vrIUATTi/NAPDZhN
         aUe8Ek/epGqLzYfRjz+j8ZR30gJ6kncQAUxUlWmamcss1X1L/uiZCKz2lrzR16dbq0LX
         V45zc2JyBtF1OAZSH+FA1txswWG7lUfAUWFADi9NiS5aFzJNi0OvNrY6Uz/TmH2F9X0I
         MWrmg/UwSzxpjv+dsWSfMDdcv5SXYWA5MlCuAADsa9qzAlzqWLuQurtHfcBObP2MomOy
         J8IQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gSO7vI/aRMck1gwkRgCWIAPm8cZ5z+5ggd7NM65ZrK1o0qS4lefCGUbxLB9nxbkDIBAc48KY//8Ekaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YztJDRjKPCT5FRU4jHj2obzZPmZpyjudaSmhB2oHTwCuHYq2nQZ
	zbQYzR9yLatGh0k+i6eQwQos4Ce0/qvcqDypmEBEfdPDwdCHL77GtBJ0
X-Gm-Gg: Acq92OFum/j6x1ODWd6TeTfaL44yvYb5S2ialZvVuYp9y2qSsqGAHCcEM39PrnJ+qxz
	smOwrVZYfsTCcbYtDajNhHZRglRSt+bx7aRUGAojwpUm0jqAn0bKQw5l6IrYwcGjpTCjReWmtaX
	zm9qVIngbwrNPcOQLN76wtyYMqwx63JpZw/j01B5ACF2jIkxoAzbbHeFzpscYNuG2XWODxF8BkW
	rYTbiWN4AdDB7nWZNchimkuBYhd7nd1rKVxaYTB0kTv1zzWOEGVMeCU/iTXAoX8B3IEORF69Dvx
	mgJH/TFymBGqn04zjDKde6BPZDghPWNNX/J+fwZXDIPdeAaQ6Q0syrMKmInhHlidWTvwEdd1IT2
	dpNLWKlf/wcBwxYim0OmCbeS0nGbaVIoUdHWo98D/pb+7TrVt2v2txohVcYJjIc85nYynP+A8EO
	U6jKzkltAOyPMRFlVfM7yctHziCURL1Fkk5MSca2Ex3vJwWucCv78wHFeIRq35aeX7no8=
X-Received: by 2002:a05:6214:451f:b0:8cc:f175:3ac4 with SMTP id 6a1803df08f44-8cee626eec5mr239264806d6.43.1780925298393;
        Mon, 08 Jun 2026 06:28:18 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd277bbcsm163934526d6.49.2026.06.08.06.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:28:18 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:28:10 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, daniel.lezcano@linaro.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com, dlan@kernel.org, chao.wei@sophgo.com,
	anup@brainfault.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev, hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: Re: [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board support
Message-ID: <aibDam5mwkaIJhHw@sleek>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <ahteTfYC5QMlpjF2@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahteTfYC5QMlpjF2@inochi.infowork>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_062819_957651_6629F1AC 
X-CRM114-Status: GOOD (  13.74  )
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

Hi Inochi,

Thanks for the feedback. The next patch will have a large change with the
pinctrl, I believe I will have to drop the tags for that. For my reference
would the tags be applied to the commits or the top level patch?

I have the pinctrl configs staged in my tree but I am having some issues.

1. spi3 conflicts with sdhci1 (wifi) when enabled since they share pins,
   I am not sure how the original DT had it working. Im assuming they had it
   enabled and the user controlled it through the pinmux program? We originally
   tried to enable only what the vendor had in their DT. Taking another look
   at the vendor DT spi3 is the only SPI enabled, so we probably should not
   choose a different spi node. Should we just disable spi3?
2. I am having trouble getting the card to enumerate with just the DT. I was
   able to get it enumerated with some kernel changes and I am trying
   to translate those changes into the DT.
3. I added at least one pinctrl config for each device. For the devices that
   have multiple selections, should I add all the configs?

Have a great day,
- Joshua Milas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
