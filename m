Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5C4C8303C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 19:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2izSJsoRFirEnWmb7C+HuCWSIWPFRqSwVlf9yfPCZ8g=; b=Mwkct5RN38EeCrHnBNRco/8poa
	Yei9Yk/MdkwawUPVtD7kCqOIzaPWPkUDxSeqV79dbk8xELAIDduTZCFugQo+Q7O/O3HitvIDTlVQr
	eCWhpnT3a78CB9ux2tmmlS+vgv9kSzYDfgY8SWxbKKxxIYmRDU6hHYd2xJiezm/WmCiUw/7gR/Y15
	Af+sCYT+3TGNVertn3GTrjFJFWQPCFWxEHhKpLJxA7hciyqKvd/bRCU4AcONQtewwyr6GTA0spQ/L
	f2BLxqdHrLk9Z4VCt7yyMb667GJgcEVaUB5qPYhO68sdzAGIxrx5TGcOa7KtuKiqTuOcf0FXorMWN
	qulMA68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAa-00000006NTW-2eE5;
	Tue, 08 Jul 2025 19:40:00 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCYg-00000006BEd-1lHW
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 17:56:48 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b34a78bb6e7so3580763a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Jul 2025 10:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1751997405; x=1752602205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+o8LqvaZ6CvfMSgYZPXGDVqAB0BYYQNmg6xijiaWbU=;
        b=2hrXWWs/6XHZmUBndXXwBLtYdq0FUMKDN8i0/Aafx1zatbUdj6MtC2Jkg20wyZ/cGv
         R187mJMu5iF37Uj1/9eUCq8ov3VPjiSipCSyVRTr97SMoTavR8nTnDQ81KoEs8khalMR
         82U/Ay+l5dNF5HiWhu4M7wqQUqpK3nzRnouvGz6VrwO+QwmTeIrFnsAatlTLh5R+AxNV
         2WgZtD5IApsE3nqWQ8ov80j3dzSr5kye8XUlCWBECleDxuRnP36AM9XrJs1mTBDyDPv6
         PtRPSlEsCgUH3beisG2xv9E8YO25q4xGnoRbtyXVD49RWVugYluysxS2wAJZCciPEHwf
         UbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751997405; x=1752602205;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+o8LqvaZ6CvfMSgYZPXGDVqAB0BYYQNmg6xijiaWbU=;
        b=YaIQVHQAVamd2snkIQMxLltmOyTg3uFmyVSZKAiZ16RarOF0NCy31HZcHe+N32wPur
         wNEPu4o3I4ZWxeIGLyByila9S4O7okkFr5nD0hZ4F9X0KWbddW+uFBS3Ufcsud3rf0nt
         kh3W6fs4WZD1oGEw8CoZMbc9wudiRcxIz5OAnWYsXeZt9aPaMkCiPqKm6UspRXWHyCdl
         LqDsTMhMGJusMF/IjHvE/bcLHpMltgzW1JKg5YVCL4I807LVFqaNvmurHus3qMVcKmY6
         H/wDJ5XZlavBTypgMuybov32l/oouO4Q7T2wiAOP3A6ZUIG1deZBFFQ6WINk2MrhTPNN
         XsLA==
X-Forwarded-Encrypted: i=1; AJvYcCUeoTo02lwf8P3k2hYlSpq4Yw4xiAoDMXM5QbVHAlxiu0O8CNQHsmAIT3PVH2wOmBP/4YyGSElsZCfb8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6YDlG7H5A4U9jVXRklI3oO09Zrx0V/7emq3+pgVeY4zFl0Q5q
	O5OKf9geBAxTAD2m2//lpwYCl9lVPhSrNlWYdejV2PJe52alohY2MWHmo+3HPbrRXZk=
X-Gm-Gg: ASbGncu9dbVs3vWbo0Z2VWvpqEbkJpoPxIOUPvPB5OeOF5dtoB4nSwxkUhBUvybKjZs
	k7wdQPOheyWQQz5BxQp13rsLqw3Sv3td+E85BwfDSWINVCwDpByr7G/8Xd46POaoB1K1ovYd5zc
	FGhyP50NhS/mHXZbEVC2bW3nCOx5gN5xY6bbWja6Y4KvRYk+w/AYgmcFOB1Yb9J/9gSrJ5Vdu4X
	ZCMN7clBdrbVW/AFUnDUiMrSVLxWl5JMz2d5XH/8rDgqd/n1UMwetl/igwqz7ENZLij3jwRbxBv
	1R8DS20m6MGAD72al24EhVweB/38BxKHW1eIVVfccUl0FGq7gXcbv8nP60tddqgYvuLRc2g=
X-Google-Smtp-Source: AGHT+IEU0OGusFweO0Bn3dONzwFwwEsX3SLeg726DSpXWtqxvbUi12Aqjr5gGs+m1NJ8BybtUxeI3w==
X-Received: by 2002:a05:6a00:10c2:b0:748:6a1f:6d3b with SMTP id d2e1a72fcca58-74ea49591a2mr1758b3a.19.1751997405070;
        Tue, 08 Jul 2025 10:56:45 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:a219])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74ce359e9a3sm12499347b3a.35.2025.07.08.10.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:56:44 -0700 (PDT)
Date: Tue, 08 Jul 2025 10:56:44 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Jul 2025 10:56:42 PDT (-0700)
Subject: Re: [PATCH] riscv: defconfig: Remove CONFIG_SND_SOC_STARFIVE=m
In-Reply-To: <20250708-jubilant-abruptly-8ff77f7986ca@spud>
CC: broonie@kernel.org, kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
  perex@perex.cz, tiwai@suse.com, hal.feng@starfivetech.com, xingyu.wu@starfivetech.com,
  walker.chen@starfivetech.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, geert+renesas@glider.be, Conor Dooley <conor@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-CB566446-2A1F-4269-B064-9B2ECC847DAF@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_105646_698762_60BB66FE 
X-CRM114-Status: GOOD (  14.48  )
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

On Tue, 08 Jul 2025 09:48:27 PDT (-0700), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> On Tue, 08 Jul 2025 17:36:48 +0200, Geert Uytterhoeven wrote:
>> The SND_SOC_STARFIVE Kconfig symbol was removed, but it is still enabled
>> in the RISC-V defconfig.  Just remove it, as it is no longer needed.
>>
>>
>
> As I mentioned to Palmer a few mins ago, I'll grab this along with a
> couple other soc-related defconfig patches I have. (Apologies if this
> goes out twice, I got a warning last time about a timeout, so ending again)
>
> [1/1] riscv: defconfig: Remove CONFIG_SND_SOC_STARFIVE=m
>       https://git.kernel.org/conor/c/493e9b085299
>
> Thanks,
> Conor.

Ya, I think it's easiest to just keep these together.  So

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

in case anyone cares (I don't really care if it makes it to the commit).

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
