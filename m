Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA13C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 22:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ki563ozkRFO0XVB/lKsUEaBPDiRlb67kC0pyMNSpEd8=; b=FaNiGZ+FHJcC0CziSnSZPCfZVw
	SYkiVFXgk/7+0oHq7t0K3nGxOC5t9nfUNRHsgMKKTENjAMjCyuGTvQjmL5tEDiC1ER5EL1OWwXXaQ
	c77uDxIrCDdiVS1vlu5mWo7j7A5t5l/1e/jPD+nghkW1mXUlgStW3g576h3ChE8tbYCZCXmh90fhQ
	m7KIak6I1dM7dbCZ1RXSsRcXSeUmaS7Q89xjBUMM3pn+NbzTtqwwMpbrjSi+V33XEQqiN0hzue+HJ
	1kP8QMFYxFEtnwKbefmJSSuD8GbxIXbTvh4W3W+kEAIPOQv93qakdS+CyT13DV3OUQrjZdYwFCB0T
	BPPwEeQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1yAI-004dmw-1h; Thu, 16 Jun 2022 22:40:38 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1yAF-004dm2-8a
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 22:40:37 +0000
Received: by mail-pf1-x42a.google.com with SMTP id c196so2687132pfb.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jun 2022 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=JIt+pdZ+SWTbzFVvDuM7Cuy4Fw2c8XZ2gywtu9NDU7o=;
        b=5zB2EBgkX80G//+F4FLXiU8QU1PhaFQmfZNr+kMvTIz/3X+EkxGiqcwZ29JVCqq6N4
         TQtvMCb90Hnm4tmS65P8obiRJ7tRkwGgomAjBK3TNWgCcvLbzrQhIWoQb/ac3W4L9aWD
         ctLpcbTJkwuTS20edY6JpzpYaVVoZCu4U7+FY/js1TdSVCVhox85Kq+LQuecI6Cxnu8b
         5E5GkrcaOU8zf9jR4DF4GpF2RAewJ390K2qcWCgEtTiuwt5vfaUB6rMMb39Y2GOpsNqM
         4OFklBIyvqluzCfRW5WeQlI/qzu4JSivHSgxoxn1+Zw4NXDBZgAQOzEXEBErCjqjnhWt
         4REA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=JIt+pdZ+SWTbzFVvDuM7Cuy4Fw2c8XZ2gywtu9NDU7o=;
        b=rhmM5DJRcSVLBkAMJNJ0MheSIexh3fgCDuP/afd1Qb4glRagL7Iv36UkIPckgRmBLz
         drrjtdI+UTJzAUwmDPJpa9zfyOnAxEKrwb2bxqAAR+wmuMWNYjfTzl0qAIeAOGuQvde7
         Jdb72/T88yFeDImbuOYxszuOyGlEMgV3IibW9m5iKP/RW5SVlbL0OBWTarVdr+34Gq4S
         iKSc2FBe+IEyIZlV5hX4aHVz3iXYyx7KuLL/5RrvHWcxzSRQL6nidzncfy2Q/rLgsBr7
         f32vAaITNJCjpSCgYAnnkmkxMu1y+dUfJ1EyEEQFQNMmvW0xwq2a/HT1xiYLpFb1Dd6R
         Ru1w==
X-Gm-Message-State: AJIora9Pa6GDUl3FnYXe0P/no4IWMxK9/C1QUU0lEq/1OKaRBvj2pi3S
	z2H0UYHrLqpX4pZwcYvXSRkUeJvgktKEsA==
X-Google-Smtp-Source: AGRyM1suM3z4NwGsqYvIrIpx4oVXMhsuWPQKN265aIutnmbMnw1bOcU43IlPA8UJJJKXw63ey0QCVw==
X-Received: by 2002:a63:7b08:0:b0:408:c719:11cc with SMTP id w8-20020a637b08000000b00408c71911ccmr6222510pgc.310.1655419229875;
        Thu, 16 Jun 2022 15:40:29 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id f5-20020aa79685000000b0050dc7628196sm2231113pfk.112.2022.06.16.15.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 15:40:29 -0700 (PDT)
Date: Thu, 16 Jun 2022 15:40:29 -0700 (PDT)
X-Google-Original-Date: Thu, 16 Jun 2022 15:40:28 PDT (-0700)
Subject: Re: [GIT PULL] Microchip RISC-V devicetree fixes for 5.19-rc3
In-Reply-To: <93062022-8973-494c-8526-a79e41f8494c@microchip.com>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-493e96be-477e-4b95-b913-775b02ea0a4b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_154035_566577_951FF8B1 
X-CRM114-Status: GOOD (  18.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 16 Jun 2022 14:39:47 PDT (-0700), Conor.Dooley@microchip.com wrote:
> Hey Palmer,
> Figured it was best to do this early with just a single patch rather
> than wait until things had built up. Hopefully the tag etc are done
> correctly.
> FWIW this has been in -next for the week with no problems, although
> I'd hope not given it's devicetree...
> Thanks,
> Conor.
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tags/dt-fixes-for-palmer-5.19-rc3
> 
> for you to fetch changes up to 5e757deddd918edb8cb2fdb56eb79656ffc6dade:
> 
>   riscv: dts: microchip: re-add pdma to mpfs device tree (2022-06-12 19:33:52 +0100)
> 
> ----------------------------------------------------------------
> Microchip RISC-V devicetree fixes for 5.19-rc3
> 
> A single fix for mpfs.dtsi:
> - The sifive pdma entry fell through the cracks between versions of my
>   dt patches & I gave Zong the wrong conflict resolution, so it is
>   added back.
> 
> ----------------------------------------------------------------
> Conor Dooley (1):
>       riscv: dts: microchip: re-add pdma to mpfs device tree
> 
>  arch/riscv/boot/dts/microchip/mpfs.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)

It's my first time trying to actually merge a pull request so I'm a bit 
new at it, but I think I got everything right.  I went through and 
manually checked, I'll try to figure out something saner for next time 
(maybe finally sorting out how b4 works).

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
