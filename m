Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF36AEE3F39
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 00:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/w6Sw1FV8r9RWVA7mCiBx0cpTcn3YQCjT5q4q/xge40=; b=JHqL3eWsBULsrv
	8uVj8m24VSStFED7Ih84fio7gdSnUZe+7SA/nC682OluWL8XAfAtaYVTqGW4angeWw963Usc6uWLl
	VdNgCxtM2o+Mo8lCqqz0UMN2xNRIXNIMoHQBCwarG6wyMSJk4LEd91ZBnMEFdePtv4K5L8KuF2+2o
	3Jd0UnLB3c0uDCMhdxK7lHOJ4fcjAgFSaLhYhLfBDi94OWZVEfx/JB/xEWTug9ntoHbdF7nZfv9SZ
	obDBZ+w0joZoS5dD+f0T1cLkOB1gUIUKYRg+YNH0jDMAhvpTSjHr1e0aS0iudRPZkDeDL/k9LfcTB
	GmvQkc+qJhEQ2L/mg9CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgDfF-004LIb-12;
	Wed, 13 Sep 2023 00:23:29 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgDfA-004LHL-26
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 00:23:27 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-577a98f78b2so874241a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 17:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694564601; x=1695169401; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOhmKDFFhYcx1y8tO/VRSWiRCjqVz75pT0zsg6b/Xa4=;
        b=O5VUxtJLz7VF/NERE7M4V5alEqRswak9ZV2zYi+RImc/hYyE/7SKkxdkCXAjuZM85/
         oOjbIuvcrBonM4IclklEiAaAZTJdFqHbmQxjxYs+Y0WBySsNTB2VPkxdfnS6sgVfOk+O
         vD8Prl48cpZ1nVg98qZd97QCsrKC5mYrhxipIcBvI/c5fVxinhFK8SKY6pG1baSKA5Ej
         MISs/shM9ZWrSkHZjl99EP+OnHgP504ZcSWC7FUnwT4J+2tTMieEVSx8DagBg8shwrNl
         lpXSP4aD7JWnEjbOud4KrL6ZGpxCJBWGGh/NKp202J8rahrYDlSNQpPjuO7jeXEmnqoV
         C5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694564601; x=1695169401;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOhmKDFFhYcx1y8tO/VRSWiRCjqVz75pT0zsg6b/Xa4=;
        b=ubvbeuzKiGJKvzRHNTm1kz/LPOkKA974kIVTDE/tCrdQNpqFRGOXIX0HZFSNmwsj3U
         KULflQedI+drShXf4hPx0joiWnWOgCNmiGr3tMZlRMFneYgcXXZc5nHQY2VnDkMxFQ8x
         R0yG7Wf9joLnYuU3d+Y5No6rhKhQhsUyTqOqrFxagLq7JvJUrE1m+UOwxYyh5PIm8OmK
         xHB3t5l4kgME4mzPKd620g+BoiDBI064cvlBTJQHbFeIgmwI7G3ZdR/l/yTZejQvyiuz
         GyHcA3Gvk31snXliqhDWjTnS2BhMYjKAOep8PL0eR5Axi0IO+sFmvHr++uBBcoAzTZtT
         O47Q==
X-Gm-Message-State: AOJu0YyBxEJBqr0+oEgHC4MsV5KKUr2HjKVCLacHXQwdmMSkRHo5hfQN
	CKnKJdwWDwvDEOCsa3FgR6wOR5hmJz01TruUIp8=
X-Google-Smtp-Source: AGHT+IHtksDvrtXTyIosszVXb6/me1pri1h0SIKokQujnOEaOSA3YgcIcCZk09BGD1oo+8W2bOSiJQ==
X-Received: by 2002:a05:6a20:e122:b0:14c:6a05:dfbf with SMTP id kr34-20020a056a20e12200b0014c6a05dfbfmr1277340pzb.60.1694564601481;
        Tue, 12 Sep 2023 17:23:21 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id j13-20020aa78d0d000000b0068bff979c33sm7866199pfe.188.2023.09.12.17.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 17:23:21 -0700 (PDT)
In-Reply-To: <20230912072410.2481-1-jszhang@kernel.org>
References: <20230912072410.2481-1-jszhang@kernel.org>
Subject: Re: [PATCH v3] riscv: errata: fix T-Head dcache.cva encoding
Message-Id: <169456458177.23158.17807764760843101758.b4-ty@rivosinc.com>
Date: Tue, 12 Sep 2023 17:23:01 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_172324_704764_D05F5BF2 
X-CRM114-Status: UNSURE (   8.90  )
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
Cc: Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Heiko Stuebner <heiko@sntech.de>, Drew Fustini <dfustini@baylibre.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Tue, 12 Sep 2023 15:24:10 +0800, Jisheng Zhang wrote:
> The dcache.cva encoding shown in the comments are wrong, it's for
> dcache.cval1 (which is restricted to L1) instead.
> 
> Fix this in the comment and in the hardcoded instruction.
> 
> 

Applied, thanks!

[1/1] riscv: errata: fix T-Head dcache.cva encoding
      https://git.kernel.org/palmer/c/8eb8fe67e2c8

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
