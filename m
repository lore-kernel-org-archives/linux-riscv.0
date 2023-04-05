Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304F4C76188
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 12:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csve1JcpIJpHVZdQT+UTjowjO/g/KjjWSGDOAX+W/Ig=; b=vNzkL4gewAylPv
	qIbvNWDVfZ6gQyJ8RKUTN7DdKPe8IR16OBRAV90M9rVOV9emhmQRgQqCEU0p8cC0ZCAt3b6ptk+wY
	oSzIGtc3CY02kbCkL19XYfoR7nDjqVRgy4dAZjXtz8oXzqlBTNAjt0wOFcLG/uRI/9Rx2GPN4DYwn
	fH0qAll4n8HvHwHcR4xeVfVHa+SgjLxXxGVO3lQL+KurRRb7EbvxdIBEp+uB4mlzoRA9YX/xYP+ut
	BYQ5lQpi3Ylxz85mJqNtB2BZDadij7ORS/a43J+Q0KUeGRCBlF8kebd6v2zJH6uvdbsBWz9u/e653
	mA2pxXJfeBiY9tIjV4NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk2gb-004SAQ-2H;
	Wed, 05 Apr 2023 12:56:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk2gZ-004S8x-2q
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 12:56:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so18233598wms.5
        for <linux-riscv@lists.infradead.org>; Wed, 05 Apr 2023 05:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680699378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qqIoRMvG1QeYhczVkKyTcP1dfEQErDm8mcMam+msEWk=;
        b=S3dfBJlw5NXGWQ6AKDRVQCiIGdpTCjBHub+a/pGpnS6lYZQpw1u5WQquIe4/VC3g7A
         ePb/D/dMosxqEU7qOLwHpWdV1W/RMKNgQ2uQkMN2VQqFChV6au7OfFocz5F06foGUmy6
         mX97SgF4rT3FkKAIZ9ibQ8HDSct6Ohy5O0Cb9dT0N94ioHIE4W1O2cknYq45qhFgeHZT
         xvLaEH4MHYERb8peZAwZcc7EmiM72srgjxhLCZ6FqqqooM81UnJomZh1KvJguUrcZxRG
         d49zo6Stf0McwXlnoMtuddMt0Uzh8Oh92r51uHk7tc1lYmxKZ5Prx96iODGpg5v6eqWc
         J6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680699378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqIoRMvG1QeYhczVkKyTcP1dfEQErDm8mcMam+msEWk=;
        b=NVkFDCrQnjQS5cRMWFANdS+rhvnVskEGae3btfkX2OaFLfEhS9cCK8prkGjAqz4kEU
         texoMeCceuBTkrlzzNN+svnnLHub1fYlx2GPqQhgC0/gA1y0pXfDgUCoQgwf1W8yp+lq
         1fE741hi1jJUBMRNzLVuBl/aznwB0slRz85/2WmDqx5aKxoxYgnb8HrwzR6YFw/Bg7J8
         FQhr3fR7X5euua/xuZP4KFrsXfEYP7lcG0p5yB2vF2Do4fKhNPwzvPa46LQSLEgAarFi
         0kV7S2hsazFHum7f/gwckJHiFp++ktVpxD2PaqnTzNTmnY2PGEjRA5XcOS5u+LTGaT/V
         HLtA==
X-Gm-Message-State: AAQBX9d2pjH9ebows70q7ZWkSXFAxC/p8E3UBwZJjlmDEZxWbB/69l2f
	sd9ztGhoDxGMDHZLTHGNez62vWj5tSI+zyiePdA=
X-Google-Smtp-Source: AKy350aXCtnMAEw8e/zpZ/Nh+UZ0DdBoAVE0a92pf46xbz7MCWoQV3i08dH4y1+BtxNkEQwK0KwS8g==
X-Received: by 2002:a7b:ca54:0:b0:3f0:3c2:3fa4 with SMTP id m20-20020a7bca54000000b003f003c23fa4mr4687136wml.12.1680699377951;
        Wed, 05 Apr 2023 05:56:17 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b003ef67848a21sm2152297wmb.13.2023.04.05.05.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 05:56:17 -0700 (PDT)
Date: Wed, 5 Apr 2023 14:56:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: palmer@dabbelt.com, conor@kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] RISC-V: align ISA extension Kconfig help text with
 each other
Message-ID: <cpbbgpvyy72btg3lfmh3z7pn7yp6wqofvvtw6yhsm6wyytel5g@2xhxeymnussy>
References: <20230405-pucker-cogwheel-3a999a94a2f2@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405-pucker-cogwheel-3a999a94a2f2@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_055623_927531_2E2C9A48 
X-CRM114-Status: GOOD (  14.37  )
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

On Wed, Apr 05, 2023 at 11:21:10AM +0100, Conor Dooley wrote:
> Other extensions only capitalise the first letter in the text visible
> in Kconfig menus, and provide a short comment about the extension's
> meaning. Do the same for Svnapot & Svpbmt.
> 
> The precedent for capitalisation in the Kconfig text was set by Zicbom
> & sorta followed for Zicboz. The RVI styling used for multi-letter
> extensions only capitalises the first letter, so do the same here.
> If nothing else, my OCD likes it when the extensions follow a consistent
> pattern.
> 
> While editing one of the lines, reformat the "spelling" of 64-bit.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v2:
> - do the same for Svnapot too
> - s/ZICBOZ/Zicboz
> ---
>  arch/riscv/Kconfig | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
