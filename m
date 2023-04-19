Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E4BC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 14:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jdBJkDgX3YuS3WZ/7IBWaVIZwp9wvHI3sH2Dv3vHMcs=; b=VDMN/FuFQD0ItF
	LiyMe6LXuQ7YZRtMMN2O7t9IVZSWEIgvYKG5NV9NIyfAm7CFm3oe5AWBcKhxbWndP4Odp9jdyXQSm
	FwrnGCAlyRwrgZcCti8J05uxitESwISrqgLxqJ3kcQFnsZy5I9xRfN7py+x/taEXWjvPmWUsIun1n
	VHw15Gn6HxVP9rP2sL0mfoQBmO+ImSiwrTPV8339FUze2WWG84ecRemiILRY68rn9OM7lECWtovkI
	w618MAXrJ7w7wHoiaqgi+pBeKaU01+j7WVsOBbuA6GuCDmPU1EGgvogD6WMD6YwG/gt/vcN7pMcct
	kaBGAXgnq4+TOdiJoraA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hq-005dw9-0Y;
	Wed, 19 Apr 2023 14:22:46 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hl-005diL-0y
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 14:22:43 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-246eebbde1cso3329808a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681914160; x=1684506160;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMJ/Ks8F05/giS2sBv9GPELVvdqCwDwD9O0hhEBT8Xc=;
        b=UoocXWjwl9V3/hx6ZI4+IjcvhlWT0acnKID1oyI8wcavFlhZyOXd7O9Os7Cgxkmh6z
         TdwJKMilnVzlPZAmQNIj3OYbc31I194tIdCA2s2aNo6sppTQ9L+QiWmkqbM5e5mZ2fsj
         gu8iv5kgqEMhUx5GEB+4NU1Kn7nBtlXDD5HzsixU7CHgNHVR6Ks3oxZ0Rv5c5WwM8ed2
         pFlQyTWZHpt3WsjG9bzXh8E3PjPBAaxSoP+pqAk+eTquK+fqheyAg0EohC6XGjcOKV4c
         WKr2SVuiUKFHsXeWURUEkNkjPLmjbXUmTw3KmLSSPuiP1jwM/QFJhwmcSeR3TIpBI+uH
         LxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914160; x=1684506160;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMJ/Ks8F05/giS2sBv9GPELVvdqCwDwD9O0hhEBT8Xc=;
        b=jUJRsnvUsVU/94B532ufxuV5ql7eUqc0+XzE31SEeC0XQR7rLIqNNbuQm1p55TGSlm
         HY2uUE98m9pCCPBq+G2Vue9bYFM2VrUQMefPLhBzmKXzpbxhstfI/O9kW/yeZz6UIwao
         IqK1S33A4nRRZ8wmI2yTenEUAE387UR3HwwjORLRNKGWrQCL2ASo4pqCmO9tjieXp4fj
         sg1XDLaXZCgsDP9CFV9Vd5gldThVbUpcl5d853X7rCzDJX+bQ/8Eq+q1PbQfOZMsox3p
         5TPOUvgUpiqtik6CjS9rL2G2SVQO2InnKThCY8pf5BUkjAqbjkNs2E2vJqAW05R+OCxx
         xA3Q==
X-Gm-Message-State: AAQBX9cuO0g8M8WFAVGlEO/+aErfG6ST2bQXTCehfDitCNvRkQBer+2G
	K1yHzRkbcuf2tnPdfWOvOur2gx9/7396IJNYpLY=
X-Google-Smtp-Source: AKy350ZymVA5je/JcZjLGXcT5bH394U6gvSQpMLr27jaRm4O7bjq/74s/E3gO89lzpSu3uJBBBoyiQ==
X-Received: by 2002:a17:90a:f415:b0:247:6be7:8cc0 with SMTP id ch21-20020a17090af41500b002476be78cc0mr2863499pjb.35.1681914160200;
        Wed, 19 Apr 2023 07:22:40 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id fv23-20020a17090b0e9700b0023d0290afbdsm1509639pjb.4.2023.04.19.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:22:39 -0700 (PDT)
In-Reply-To: <20230310110336.970985-1-suagrfillet@gmail.com>
References: <20230310110336.970985-1-suagrfillet@gmail.com>
Subject: Re: [PATCH] riscv: Kconfig: enable SCHED_MC kconfig
Message-Id: <168191414578.1929.148048847590891306.b4-ty@rivosinc.com>
Date: Wed, 19 Apr 2023 07:22:25 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  aou@eecs.berkeley.edu, Conor Dooley <conor@kernel.org>, Song Shuai <suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_072241_568647_AA81B8FF 
X-CRM114-Status: UNSURE (   7.51  )
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


On Fri, 10 Mar 2023 19:03:36 +0800, Song Shuai wrote:
> RISC-V now builds the sched domain based on the simple possible map.
> 
> Enable SCHED_MC to make the building based on cpu_coregroup_mask()
> which also takes care of the NUMA and cores with LLC.
> 
> 

Applied, thanks!

[1/1] riscv: Kconfig: enable SCHED_MC kconfig
      https://git.kernel.org/palmer/c/8bf7b3b66762

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
