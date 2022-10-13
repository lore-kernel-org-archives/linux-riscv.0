Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7B5C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 04:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OXy5bIeEqAScjhycspwlGYT1LAIrejtMS2wq15DlczU=; b=MJBmmuX46Q509n
	FJUwHNug7ZMF0nGTm0hNALpcClsaTqxuYtERpQnWRcsDQABqW3UfJuPxyvEnVV6SniB+u3KnO1M9m
	WCVP1qHzWKrUtZtxu0FhAn2XduxnKsD/xO9/HRgs1KZw7Mu3HyYcZfl/3/4Km0rUyxok056RoWh8E
	9DfOEluqy121rGqYh9d7feVHnI2+NXW8YHfiWEtZdcy7Rc3HhSADt5DAMWzo3ffNlo773afe7xfq8
	pOV0OoTT9LjVp1Jmv5mh6/H1gbwt9WMAsRmZRii0hXxJve1Xsg47UVsy/fONAkHfUKkfXo03tzrYx
	As9oN/xrSf5KLc5vD0iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGk-00Ad9R-Ll; Thu, 13 Oct 2022 04:56:30 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGc-00Ad3H-8w
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 04:56:23 +0000
Received: by mail-pf1-x42c.google.com with SMTP id 3so953574pfw.4
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 21:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=v0UkCHDCpb0SQXipAoNT2TBB6AI57CfyDRGKOFbFDxM=;
        b=02NaSQwYpacpxD453y5wlUVALaIMnCHleq/eMGjj6MbNnnksjxpiZPh7T/6ivwKs15
         B6M6NtF5b1z6oHsZkPKWM1Abynf19TqN6F/ymAq5N0DPqFF1DG1x27tOyEpNvae1DzMt
         OfNxH/H6uPut4s6x9gJ2Iy4tFZK25wLHvIC/9FjD8ErblkFCPHCHyQG5BhFVrGLQk1AP
         FElSsWsF3y55u22hLcDJAx8nFymW4+EtM8U21ENGEPDB/LCQSj66i0g00zgtocX7NcgV
         Wq2DDRzMIKLxM1ZW6KX2E9EH2dTb5/2eE13bXd39uP+3JvXQd0ik32n0HYiC4rlBtlEj
         Yu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0UkCHDCpb0SQXipAoNT2TBB6AI57CfyDRGKOFbFDxM=;
        b=74Ggi0xMWzP7nz3qcaqEadnFM49YBT/oLqJdt1GNv9GpgWtgdwd84/RyXwNKABlh3e
         xmeq7R2snPUDwLbKSkc5eZDR9oTkMfrP5Y+Un86mzWrIOZQyIrMem2WpV16EF+zBS4Nd
         hZdGzxQY+F7+SPd8fEjbMkslSXVEAw9J5Ww96wY2jZIbtvtFvJE8B2/hcg6ftR2ujaYi
         R10O5doVrSU2oyUoxS3ieFIrX3z6o/m8aRHl2OHfSTXm6KNXdFsQrSYOoVDr9vllneF4
         R5HEaiXbipCWMCnKKKTbv7TK9cC2itni+gOnyTJWNlJCNsAYhkpmlLb8RraWMCIgJGMF
         7tkw==
X-Gm-Message-State: ACrzQf0RyX7WDi5cWDSFYd6GIlSmmEjkbThgLOdiy7uaotq5j8XAFHc3
	xWxeaHo6FMuwJMRZ3f+Zu/Y9Fg==
X-Google-Smtp-Source: AMsMyM4xYxfSCrlo5ZD8i7krGTytpwPAaf5IcxrbU4QzjhRLQ4Wzrv7QyLp9p5ewMgSHjQwEongTBA==
X-Received: by 2002:a05:6a00:f03:b0:563:210a:5ffb with SMTP id cr3-20020a056a000f0300b00563210a5ffbmr24187318pfb.70.1665636980362;
        Wed, 12 Oct 2022 21:56:20 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n3-20020a056a00212300b005625d6d2999sm750313pfj.187.2022.10.12.21.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 21:56:20 -0700 (PDT)
Subject: [PATCH v2 0/4] Documentation: RISC-V: patch-acceptance changes
Date: Wed, 12 Oct 2022 21:56:15 -0700
Message-Id: <20221013045619.18906-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Cc: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
  Atish Patra <atishp@rivosinc.com>, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux@rivosinc.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_215622_344354_E5462E3C 
X-CRM114-Status: UNSURE (   6.77  )
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

We talked about this during Plumbers and it seems like there was pretty
minor feedback on the v1.  I don't intend on committing this for the
current merge window, as it's only been through one round of review and
I don't see any reason to rush it.  Like last time we're just violating
this as the status quo, so we can stick with that as we sort out the
wording.

Changes since v1 <https://lore.kernel.org/all/Yyn9FJ4iuzJTfO1T@spud/t/#mcc9b5e547a2ca2b25d7f78a4d2572f39ddc5593e>:
* Various minor wording changes.
* "UEFI forum specifications" instead of just "UEFI specifications".
* New patch 4 with implementor -> implementer
* Atish and Conor's Reviewed-by.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
