Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD21C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HnWlZN6S5AO99xEJSs+OR049qgGfvVTV1RIGez5W6lk=; b=vi5ruvjQlx9khj
	2ENS3v59RPAAJKaQ0Lb3S5vvK+sf/rZFK2MqACQgLe/1S0RwBf1VmPP7kl/mXqEVJj28WzSaMKjCR
	nVDUvDJvObGBpDDpu39qBjN0MslSc5lEOvvp7I3Khh/ogr/sQSp96ZEJNNoqQUdINWe+JKCL2GGGv
	OWU7kE+dut2JlOe+G6K4S3QJ6fUBUF5HVlUewQNtpd0tgkryJ8St7qa8peLMXK4lqmmapPLS/e+yp
	S3ZZDoRnVMB9boNPbz1HhUYJ26X56QMQbdUOTYHAMF+NtlcqCbAI6FJCuONyyOA4iGzi83QhgAAxW
	BTL0LyV5CEZxNyVjFDgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hr-005dwl-0O;
	Wed, 19 Apr 2023 14:22:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hn-005du9-1J
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 14:22:44 +0000
Received: by mail-pl1-x630.google.com with SMTP id w11so28575134plp.13
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 07:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681914161; x=1684506161;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvguoCVK3pTK1kPVS4RiO/qRKM+UQQZZ8Zh0QOk1U6A=;
        b=UsOAlfNh2BSefM5HJuO7qWcuJjJdshpLkO0j2H8h6BkoeQf4FO6h8ZnYR9WACD1Oj7
         CJ25s4rI2rPevIzG1Q8jM0xlVU4dcHfbtU+k2PPvc32k60S4KLmL5WUPBy71cZgZx3qg
         ZR5YGpz9y1iAZEAlSRTFq9HZRsSsFYHiAKKCXUBPR/zZQ7pDm99mWCoue/5glhHexQYZ
         iO4OP8jfBk5+J7itwQ55YMMxDLALl2p/Qaq0T2o5m49VnSnEVRP2d/Dc0QUFB15k2luE
         cVDnmhg8DKBBkJWm8CStONn/v9X7/or7GKgYzxJG93Rz8THu9w79d+yI+u5XAUSTxlQO
         5MIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914161; x=1684506161;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvguoCVK3pTK1kPVS4RiO/qRKM+UQQZZ8Zh0QOk1U6A=;
        b=f45/ixE8TUPSAYDJZefzsB0JsGpXgKhaLSEZ4PVEupVRbaphIzQsKa/ruDRcpEjS41
         0PRh9tQCImO4YyhBlTQ1+URONs3bQsvoCsfycmcrmWjAqANXPLU9rEVCIYq7nxbx2Qiv
         yKCPqVvz63uh/HtvzqMStuyUQDY5VkmDjwwH+fIOSG/oJ5sBOPm01BCvp+BJYR9FONSW
         JHBOv9MYdQXDf3ezukFb8+BSQC8tRL4bHrLnKqw3m0BjTLy1nM+kVewXmLAB/INPuM04
         Ty+vQctzREBuFn35qzbSYvgtZW7BOOeXBhJc7lVxUgIKD9qkpsnLZ8ooVuvoavoPfNp3
         ULeg==
X-Gm-Message-State: AAQBX9fHnqXiO1InTntdH5MR3wU85HqiTBcA24iRZoVs57PLzFYtSFiF
	tIyygL5U8Pmh1+ubC/d+nfORfQ==
X-Google-Smtp-Source: AKy350ZTM7nJeehuHMXd0tnWcMNfNy3Q6mNDYwaocJQYTb6fBYVsOXcMQFb+wr5Z0qT2YjOhTt9Vqg==
X-Received: by 2002:a05:6a20:158e:b0:ec:6039:f76f with SMTP id h14-20020a056a20158e00b000ec6039f76fmr4673502pzj.11.1681914161302;
        Wed, 19 Apr 2023 07:22:41 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id d17-20020aa78691000000b006338e0a9728sm2043066pfo.109.2023.04.19.07.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:22:40 -0700 (PDT)
In-Reply-To: <20230405-pucker-cogwheel-3a999a94a2f2@wendy>
References: <20230405-pucker-cogwheel-3a999a94a2f2@wendy>
Subject: Re: [PATCH v2] RISC-V: align ISA extension Kconfig help text with
 each other
Message-Id: <168191414579.1929.5290815666993052452.b4-ty@rivosinc.com>
Date: Wed, 19 Apr 2023 07:22:25 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_072243_443170_90838AE8 
X-CRM114-Status: UNSURE (   9.01  )
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


On Wed, 05 Apr 2023 11:21:10 +0100, Conor Dooley wrote:
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
> [...]

Applied, thanks!

[1/1] RISC-V: align ISA extension Kconfig help text with each other
      https://git.kernel.org/palmer/c/5464912cfae7

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
