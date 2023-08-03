Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29986C04FE0
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 15:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/mnwAuCQwKkLFLTXJXc428zkpwykND4+RhwPDznSZQ=; b=qfF4l/L9GeWTMm
	fOorJIsbnD20Ru75Wvgmp6mWekQhXTpkjcmF3HnP2DijHfHnbWfvdl9rKaYtFqLi3V3VEosW3dAd8
	upBlJyZbBbdU3TFSAK06yz8WaWIYOv1DAQvtm++LbsvRYsqLAJy1/d5bsOAVBig1LBOR1MI/KiKgi
	qfGTP3MCq062xeNsDa9OggaZu//75vmGdXL8mwty3JtCIsTQEI90xd+PQg0WaTCktEaLHTg5Zfwcw
	NRe/g/b5kaFnubLDr2HIaWuXkh7NVay5vI9f6ul1SELkVnw/CJyJdk+R89M0hLoiZ8AW8D1NANE6C
	25RcHA09xtJtkfQIvV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRa1X-00A6bI-22;
	Thu, 03 Aug 2023 15:13:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRa1R-00A6Tv-2D
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 15:13:57 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bbdc05a93bso7802665ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691075632; x=1691680432;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QfdqFLI+Yigoh2tSKncXu/Nn57pn/kwUE3F2H3L+0lQ=;
        b=QfkUzDL0Vm8IZGyEdI0nOBHryanS4OZSKoIOCn1T5u13n3Qmzaim+gXxII9Uwe0n06
         /HqawbymsuS3f7q0VxzzkfA2Tzr8elr1eYqpOZ2z7DSTbgy5GuXfOVc45PefSWEirM3G
         N+nD84idw0RlhCoFONSeOP2fg6acY3mdxXoGpiyJ9w+gxa4r07YMKh+YHoUVsqwcT2LY
         hdctxcswM47jlFLU/V3o6zGzAQnkXBxw6OMzpoXQBv9y42ePJIStVOHTVxE+WYKYEbZX
         vQRVtRt6bxYX1haxGp1ANow9thYAR9SlyDV6XYNO/1CHs6PbBoA6TdiQwOjg2VgLWGjm
         2fxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691075632; x=1691680432;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfdqFLI+Yigoh2tSKncXu/Nn57pn/kwUE3F2H3L+0lQ=;
        b=NFDQH3Nkya46vHGp1x2lICf2JCvyQyUUXIZxdslCT/Lx6RTv8kpVxoExHFVpNfaDtF
         ghTH04ThKQgBOtFEh+2Kas6zY0WtPsQvDOj4bYaHmEnwWDWZ9wwvVZvWtXIQzWALDl98
         hJ0ZaOFyLlpEez+5WjV53kecWUimi2kUZfjjb6gZ8So4BXQAAz8NitmopFU76E/+OIa8
         YW0o0ghSifd79ueXHQUSlVYYpjmo0qGG0zoKULMRCK31CyBMYmiSjpi2fY64bE9PBMg7
         7IOy33N8Io/hmFTjj0XujFLK1dEt1uZmUNnuz4xUGYjZ1QRycvw9LXgXVqXu/nyT/XYt
         DEyw==
X-Gm-Message-State: ABy/qLYl254Gl+fNUav4fAEEBAnBWzShAYxEEx4Fj5IOBfqmH16hq2Br
	lIACJ1lAYADlWHmoaRUU2WuvtQ==
X-Google-Smtp-Source: APBJJlGhjEEgT3hr12KvBN8qcCVSd9AdvEfi+asOYi2IMMVbUfmY4NJ7WLSAG8b8QfUJ7FD0xk11Gg==
X-Received: by 2002:a17:903:44e:b0:1b9:d362:426f with SMTP id iw14-20020a170903044e00b001b9d362426fmr13881743plb.3.1691075632530;
        Thu, 03 Aug 2023 08:13:52 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id e14-20020a17090301ce00b001a98f844e60sm14492382plh.263.2023.08.03.08.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 08:13:52 -0700 (PDT)
In-Reply-To: <20230724100346.1302937-1-sunilvl@ventanamicro.com>
References: <20230724100346.1302937-1-sunilvl@ventanamicro.com>
Subject: Re: [PATCH v3 -fixes] RISC-V: ACPI: Fix acpi_os_ioremap to return
 iomem address
Message-Id: <169107392505.27633.6574092293821407107.b4-ty@rivosinc.com>
Date: Thu, 03 Aug 2023 07:45:25 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>,
  Andrew Jones <ajones@ventanamicro.com>, kernel test robot <lkp@intel.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Sunil V L <sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_081353_730162_8274AC2A 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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


On Mon, 24 Jul 2023 15:33:46 +0530, Sunil V L wrote:
> acpi_os_ioremap() currently is a wrapper to memremap() on
> RISC-V. But the callers of acpi_os_ioremap() expect it to
> return __iomem address and hence sparse tool reports a new
> warning. Fix this issue by type casting to  __iomem type.
> 
> 

Applied, thanks!

[1/1] RISC-V: ACPI: Fix acpi_os_ioremap to return iomem address
      https://git.kernel.org/palmer/c/568701fee366

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
