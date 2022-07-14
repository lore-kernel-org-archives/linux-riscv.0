Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33832C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 14:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9o12UqA5zGXJSOmjILiUHECJMtooxhSmgwS433fCOHY=; b=HFtDJs8PCGpRXcqgYnBIFTsURP
	hiKso+OjMwYGxxmUh4cyvcE30XSruhbbsP6BgiA1g7YClmmOTcUCXf2M4XVAwkQ/RO8teS6DmD4M3
	HSfWy2h1TdamxRqgbWIjc1TlpOw0ZPWljLx54wgpuMGHWR3m2uwjxGSkGTipI5FRhCWPV+fyqEO0C
	zaZ4kcCpQc9NGhg5Z9OR75fqOJa15UvBsZREjKFz9yR7hrfodTtRtPscbgW31lO3EJ2dpBtM3SuSe
	8c1I/uKLO6tACEy0JRKIIkjyKya1PXkaZVa7x0IUn+/bpTsD4d3is1tFz4r7nPQ8Pn7Q/aKu02cP8
	K0HYWGeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0H4-00FQ4O-8Q; Thu, 14 Jul 2022 14:57:06 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0H0-00FPxi-MG
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 14:57:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id k19so632393pll.5
        for <linux-riscv@lists.infradead.org>; Thu, 14 Jul 2022 07:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=8AkmMBGWOd4ihBqCpOf2YdmAwbNZUEfSdWzzQfyTSdw=;
        b=dgksm73IEozYmtV8FKjUJTPhsEIHVJGJfOtX4IZdAe+6iPc5YGT0xsvu5sXCbJf5QN
         T6rBloYwjtFSgg8frHD6bG1iB51L9Bb/MF8nh9rR7MM9N6uyvbk93iegTEGn1iLTKq0C
         8bwm80p597GSQ5udQpMm1I8UM//78bgG3VHKOc98ORCCWGF8O4NcH/rYfcZONsMHCRP7
         uHsw6g7gwDQO6hUpGTSH4ejr26s1Qk3OyseoQzaYWyoYdioCPxONHWHxAOMzYMysiwiJ
         aP3ntUIfWaYc4IM65r1VHGcMKyZgY4mNOflEtoq7Fl4gOgcI/x7OU/hLXwyGzWqorjOs
         RjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=8AkmMBGWOd4ihBqCpOf2YdmAwbNZUEfSdWzzQfyTSdw=;
        b=iuzBrILIHSqaTvkSa5URtIqbTBF61G8i/vtnmyrforXxuSZXvrsVT1FPncN0GkLz0a
         4EaCOvZtcrFQ0/5Gh2V+V+GIe0BQb4L66TBH7UXCQby7k8zFqFDfJQn6YinC175BS8zI
         jGJr6ZQmFXwSnkmVmKxvNSsTRUUaLEmcCuG5k0LaZuDdwL6i8S3wzPDlmXyLI31IfpHK
         7cRuVbzgzOI94PPo17DTxFkVHWcYCDBlZcufJfANpjrUg2SzV6/nGWXqnmWYLwl40ceP
         4zIPp5GxXg+eVJLQKmMRovSc15tH6ZoJHAzyIaXr8LQioqpDtmPDsbTQMtVj5Ic/GbJ7
         fw6g==
X-Gm-Message-State: AJIora8mzMH9430tYj1WNdcq4f/iP3SSfcNMXF/vJcefvMOg9wgn/n6v
	fUZTqxjWWQ8GYnc1O40QdUfeyYPsO6Xdfw==
X-Google-Smtp-Source: AGRyM1vR3w6B8cCpnTJxGTpjn5V74moMG5wLUgKnCJ6pNAnC9XMKp0rlfnouvxnkWoRDqicJ8SD4mg==
X-Received: by 2002:a17:902:dc81:b0:16c:7132:cc57 with SMTP id n1-20020a170902dc8100b0016c7132cc57mr8771271pld.87.1657810614284;
        Thu, 14 Jul 2022 07:56:54 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902c2cc00b0016bff65d5cbsm1566929pla.194.2022.07.14.07.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 07:56:53 -0700 (PDT)
Date: Thu, 14 Jul 2022 07:56:53 -0700 (PDT)
X-Google-Original-Date: Thu, 14 Jul 2022 07:56:51 PDT (-0700)
Subject: Re: [GIT PULL] Microchip devicetree fixes for 5.19-rc6
In-Reply-To: <499f2802-8402-a466-d20f-5e9d8dfa2641@microchip.com>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-f325f08e-2a0e-4c66-b422-7af21cf10448@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_075702_997155_E6857AEE 
X-CRM114-Status: GOOD (  13.90  )
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

On Fri, 08 Jul 2022 11:26:21 PDT (-0700), Conor.Dooley@microchip.com wrote:
> Hey Palmer,
> 
> Another single commit for fixes here. I have not queued the topology dt
> changes - that's an optional property so I don't qualifies as a "fix".
> 
> Thanks,
> Conor.
> 
> The following changes since commit 5e757deddd918edb8cb2fdb56eb79656ffc6dade:
> 
>   riscv: dts: microchip: re-add pdma to mpfs device tree (2022-06-12 19:33:52 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tags/dt-fixes-for-palmer-5.19-rc6
> 
> for you to fetch changes up to efa310ba00716d7a872bdc5fa1f5545edc9efd69:
> 
>   riscv: dts: microchip: hook up the mpfs' l2cache (2022-07-05 16:54:03 +0100)
> 
> ----------------------------------------------------------------
> Microchip RISC-V devicetree fixes for 5.19-rc6
> 
> A single fix for mpfs.dtsi:
> - The l2 cache controller was never hooked up in the dt, so userspace
>   is presented with the wrong topology information, so it has been
>   hooked up.
> 
> ----------------------------------------------------------------
> Conor Dooley (1):
>       riscv: dts: microchip: hook up the mpfs' l2cache
> 
>  arch/riscv/boot/dts/microchip/mpfs.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)

Sorry for missing it last week, I got tied up with this test flakiness.  
This is on fixes.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
