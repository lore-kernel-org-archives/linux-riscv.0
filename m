Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534FBC7EE2D
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 15:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vEnSLVDgM6mDuzYsC+OwWe8vdy0k0OGtKnWhsy43IgI=; b=PWlEUFzP5L4r8O
	Kkl9qli7ykxnECzh+vavUfoi0JMtX4ipseLvH8N/OF+rg/TYcVxZwdmcIxRT3YqCzececG+3Ib2Zz
	ncGig/jMxvL6No7cLd2vqGDy55VLjyOI/6tdty76oyqFJ890/t3kv2+Fv771eYx0oFIur3yyEU78V
	cw4S48UMBNMErIEFUcx89DXruWVoVSQbF7XI+uOeckwmjLtHOIjHDmwjVwwbBvG3YZbsqTBnNEiQo
	9O4BzgYi+fHIRNux9mAIdKPU9HkqwhkjxOYOEy6wmmbY/QTIm6IZ+Z+CkpYp4p8bzkLgqr62rPGKN
	6cymYYLjAbkNbt+GVg3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NMb-000Dvl-1M;
	Wed, 31 May 2023 15:03:49 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NMX-000Dtt-2f
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 15:03:47 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-64d5f65a2f7so4140167b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 08:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685545422; x=1688137422;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALTOtXPl7WneZEczbI4aASRfMlEXlldwEBTkzZZ2WKs=;
        b=O/6IXWweMuAY+XSU/vwd/R2Qf3/keOkkfHe6yktMlbJAYIrjwYAwCScR8URQtfLVBF
         Q3cEeWrM+a/bFZb9Vyyy/lciMxEGaLoWbK2qmjwYXfJS0JxZIiEF7VXNnwvDublCb45M
         8iQTZn/ys+aM8FkCtO+1ZufzUuO728sHlS0sXgVbHLXO42x+z5k6/tLHHb+O1LIG59TB
         6TdpQK4NtEWQCjtmXOD+f6TeZReZKT7dhXcl5SZz0lIImqdaMClJH3NJ4qwHhdKpcGaN
         7j7DtpmMJLQimaleoxWLMMnhHQsEen3FDRth823BxdUAQswqvsx2+08xLETJ+Jea1sSR
         jeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685545422; x=1688137422;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALTOtXPl7WneZEczbI4aASRfMlEXlldwEBTkzZZ2WKs=;
        b=WuarWxcLH4nmavcFdUOP9rNCqyEcqi89CPCKXhxucNIE1UfpeRYX5fezDbOaIJpYtn
         57dnt4QrdrzfR0gkDeCOoX5juBXdjciMaaF19DUP3LH08kib3jXliSkFInGJDdObhqyM
         bAtKao8D4hz5sqbDwNAP/+DRYEyIc8Hfh86VMWMa4gJ3OAquSwQoHfWjVuhlYgEZMksS
         2MdX4RbNf4on0vZeCSjhmeBgD6Qnny/0GQVqIqey6tfxnlXhrdYeqBnFTb59QawvKFYR
         3F8O9K6z5tLlybjVXvWcLQ2Cptbtj7Akb2FvAQ/b7nIfdefEX5u78Apv+E6X8yny1NXD
         7yOA==
X-Gm-Message-State: AC+VfDxzajxrR81iuqGSLKjFc+j/98BhI7WquuCmELHmFkfy4Yvrfgv4
	hRLAmh+LvqVlHmew2GcxFnEC4g==
X-Google-Smtp-Source: ACHHUZ7dVAFU6Mu2bNkSmU2wj27QKF/ql1+HpKaSeoc1pbUUdsoZeBMyRumOex8m7gIkk1G1oKWYJw==
X-Received: by 2002:a05:6a00:15d4:b0:64d:1215:a0f5 with SMTP id o20-20020a056a0015d400b0064d1215a0f5mr5381179pfu.34.1685545422406;
        Wed, 31 May 2023 08:03:42 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id u7-20020aa78487000000b0064358d032a4sm3530851pfn.145.2023.05.31.08.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 08:03:41 -0700 (PDT)
In-Reply-To: <20230526-astride-detonator-9ae120051159@wendy>
References: <20230526-astride-detonator-9ae120051159@wendy>
Subject: Re: [PATCH v1] RISC-V: mark hibernation as nonportable
Message-Id: <168554541142.21606.8005252517231405209.b4-ty@rivosinc.com>
Date: Wed, 31 May 2023 08:03:31 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Conor Dooley <conor@kernel.org>, atishp@atishpatra.org, anup@brainfault.org,
  alex@ghiti.fr, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, Song Shuai <suagrfillet@gmail.com>, JeeHeng Sia <jeeheng.sia@starfivetech.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_080346_079515_3E5FAF83 
X-CRM114-Status: UNSURE (   9.77  )
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


On Fri, 26 May 2023 11:59:08 +0100, Conor Dooley wrote:
> Hibernation support depends on firmware marking its reserved/PMP
> protected regions as not accessible from Linux.
> The latest versions of the de-facto SBI implementation (OpenSBI) do
> not do this, having dropped the no-map property to enable 1 GiB huge
> page mappings by the kernel.
> This was exposed by commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages
> for the linear mapping"), which made the first 2 MiB of DRAM (where SBI
> typically resides) accessible by the kernel.
> Attempting to hibernate with either OpenSBI, or other implementations
> following its lead, will lead to a kernel panic ([1], [2]) as the
> hibernation process will attempt to save/restore any mapped regions,
> including the PMP protected regions in use by the SBI implementation.
> 
> [...]

Applied, thanks!

[1/1] RISC-V: mark hibernation as nonportable
      https://git.kernel.org/palmer/c/ed309ce52218

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
