Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F28C30653
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 09:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SO6hSTnMzxJo9493mkjatkw1rqidRboF6N+zZULte60=; b=O6uRiOBGVk03Ic
	9YGn/ntVLaiwleRcXESSsj9Z7ziksxCwLv1sdSrbOdEPnRBljZM+zBeHr8hNAhUycuPFnp1++P5ur
	uXLjym7JXhx4mxSyV316uNABc/gxLcTPwIm8DoS0wZCo0f061bYPfSN8vujJXX2e1ldjUrNs28C/W
	DI/LDDqlHmh2UHmpOtuPYErBexqmXE5vudiu5QCrqt+NNMTqviFHUkL2zSHzCCLjR+0SsjcHnuP2W
	tZcHgmjZjiCzs8LgZVBJq76bwwDiudfcLLhdQqrreue6acW9JwftfuP6Yg0qefbeVZnn6CeAG6opd
	HYi+NLXBMsZ32gDlaT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOD7j-00000002PNg-22Jg;
	Mon, 01 Jul 2024 09:14:59 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOD7h-00000002PN8-19mf
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 09:14:58 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2c7dbdc83bfso1835553a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 02:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719825296; x=1720430096; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pKtmEUrQlTA0F2ac3541cFZOBFkYUhrUldNV8WVF0HY=;
        b=YLQVOYXHdKHWNQ+L7iA8S5iKL0PqadZ76Rgs9DJz5TBEfz21/vUi9WvkLY7gDojtII
         9by+ecL9cBhoomMGyTWSKs9uYZKNvjrar4K1BxUedOiDBpWOb+9zCPjhebNhn4/jPGMr
         5xJDKSaIHyhDqULxAYSmF7nZR4NkXsfdGVF6BiWCpfQz3fZTReGsjSbRrZpJ3FYnTPfz
         dX1DsyzyoNjR92I/bEs5ko51PFUllM0S+LbyUmaFttzvmQE64ayUppov+sROwbdouuXc
         mJVRwNt1Lv+4SLcZuTA3IaLBbM/1bwgHyfa/xVAB/qe2EY5TiYJz8/rPKLPRZQT3rAc/
         bpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719825296; x=1720430096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKtmEUrQlTA0F2ac3541cFZOBFkYUhrUldNV8WVF0HY=;
        b=UEIPpji+tccPAzlghmWmV9baTd0HZ93mwmPOIv/IcL+Oz5tpRjFKQ0k5ofTnlpVOTr
         IN76cICITDHBPERSieKrnYPlHzfwU6DoJ0yIUKi5B0FAIcsaAz1X5/bXL53JO95jinwd
         KFm58agmzUfPeJf2qhRbbmThhBuaDSwOU6Ze+XstxvYZIamKgDwOl8LAqQPa7IFF08Ov
         x+81vmXctTCLLsP+AURB2yh/RPyToujvd1kcm67h8/bZFM7V9bMK8+LB6SsYHEFo4fdi
         gM/CfdvPMfQbMX1uX8hXzFstYr2f4sJsI7kK/z/A6GFlgkFUyDQbLYIROgnszg1tKPM0
         9J3g==
X-Forwarded-Encrypted: i=1; AJvYcCXhJhEQldvuNo4zBcKKUcx3ZRvrjMXCOnnneFxe1Hn2ypMPDDR88KBmkvaP4fcJwfucodhlKfRtRf9aN05bm30T7MWKZUED+7jf7Im5aCyD
X-Gm-Message-State: AOJu0YwPT9motnMkFIskxaLjWHiarVwT0YJr4Pu4yckCEG9hgwRGdmRv
	YYjEWEqkP83eLSlmCce/nSEF13Kt6iBdTT5Vgs8KWbQlyQmjzlVNrqYCFAm+n6FuQ4pTDFt7M9o
	KOfa6Lf9u9FtHbVmfpoLX6i5VLaLTHLt4g5rdOw==
X-Google-Smtp-Source: AGHT+IF9jQpQKcrxcoLFI513tP4pa+3WxK9vkzmTGRABCk37DfpNT9a0kMZr3OJoZGwOYrQPiOPna0U7ATKOrjtwlnA=
X-Received: by 2002:a17:90a:fe13:b0:2c7:ad68:f99f with SMTP id
 98e67ed59e1d1-2c93d77c93cmr3483555a91.46.1719825296558; Mon, 01 Jul 2024
 02:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240701072908.25503-1-luxu.kernel@bytedance.com>
 <20240701072908.25503-2-luxu.kernel@bytedance.com> <CAH2o1u7j6pXhWHL2rBZak6LeXxn_KUbQHjygRGQKuEfS_vmtkQ@mail.gmail.com>
 <CAPYmKFtCzQOOsN7vutoY0MrthtvcGxBqRsbr4ZgMQsaY1CrXHQ@mail.gmail.com>
In-Reply-To: <CAPYmKFtCzQOOsN7vutoY0MrthtvcGxBqRsbr4ZgMQsaY1CrXHQ@mail.gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 1 Jul 2024 17:14:45 +0800
Message-ID: <CAPYmKFs-R4SfjZOMyV5wxjrkV+Eawc-zRWKgAZNFpOezZ6JQDA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/1] iommu/riscv: Support sharing irq lines
 between iommu queues
To: Tomasz Jeznach <tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_021457_334500_4B058780 
X-CRM114-Status: UNSURE (   5.61  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, linux@rivosinc.com, will@kernel.org, joro@8bytes.org, linux-kernel@vger.kernel.org, xieyongji@bytedance.com, iommu@lists.linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, robin.murphy@arm.com, lihangjing@bytedance.com, baolu.lu@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Oh, I think I understand what you mean now after checking the
implementation of riscv_iommu_queue_vec(). I apologize for not
understanding the meaning of the code before, please ignore my
disturbance.

Best Regards,

Xu Lu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
