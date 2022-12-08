Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A00C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 01:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lAslsddVc3rzRWX2+v+FajTO+9FyW5WFnfy7YPBIy8=; b=jxRBS0HpOWLncw
	jYNeTdxfYA/v0YYUASr8v9ut+zozE7YlVwhU8iVELU6uUwQ9qvbgLlpuRWfjhhlWyeCu4cL5xveqy
	scXKpESrwaqsakBVBprOQ4kuEKJoRKSC8Zb/Sc240yD7w2WsFkdo6R+qgMkFNIcWsmoEEVJq5Ywvb
	BIE+2hiodP8UlNG1aFBhpBbWRkrseW4L1yZ6wekqhw9rLB1ulYvpb2XLr0bD4TjsUKF58SJs22It5
	Mlqf9PtYUoaj3lZaid1XQ/T1nE01NdjOqZinL9F3zd0eWVRjevzXdaqx/7cnLTChFgmBvOm+HIj6j
	ewgXWk8BdQoCzPQDVgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3S7c-00HZ8i-Qw; Fri, 09 Dec 2022 01:24:16 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3S7X-00HYzA-9q
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 01:24:12 +0000
Received: by mail-pj1-x102b.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so3360610pjj.4
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 17:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sh3DpSD9hmFO/dex/jVh6bGRV5N5LUyE3oOlwg3aL5M=;
        b=Vm9r2YID3VAMHXS/hHE3pBlUDKFPjeQGp0ma3v7DGNWTWfecsle7RiBJnsoyyTCaI1
         /S3/0e2AncyK7bMpvzKZu0DEHJSdULB3B42HD874t2XMinAOYPT18MjNp8rNaf+9TFbV
         0YmIJGCceR20pHAQ1rlszLJcFj9L6JCENtuGuaH6P26Ibs4D7K9eIGHtjR4ZFObewKVy
         6J1YUxR1HtyRcqPfBr+ff12TaMecaZSrPUvZcRD9hvWw2IID+2Fn+q9VTykkxJI/kajh
         AEI4SMa4FOSQi/6Zy13i5ItmjT8oJgZlCzvqWtnbQPchDsyrILtcMLBHJVv2/l6gC2mM
         WatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sh3DpSD9hmFO/dex/jVh6bGRV5N5LUyE3oOlwg3aL5M=;
        b=1ITP4z157kOluC4D/38OFGYPEHFldC1wiFRXCqbHz3sa2ajnYyB4O2M+pB/ERpF679
         EiTEy/scjlHUJbEgQdAU643xdrHaSCfSrKi9J1TQ2gGe+BZ45GozeXWIJKh4UomJraST
         j1+eqBE4rz5xTI9uKEXd5roG2M457aakH+itxeX++Gbf7O7XEwMH0MpGCgvZKPSOA77x
         n3OW9F5ZGfYLgUEo1pbdKJRBPKCrmLwmRLv7mp48+KK1mvr9Y9lHGyExrDt/piptHQ0u
         FNh/iyRDHgvdvErjy7190APbX+07Kp1ncf3T60aTPSU6p6TN1CagVoW+AA4UWb3AA+BB
         eVYQ==
X-Gm-Message-State: ANoB5plLTgJAGd8/5LzK/kkhKryvPnW1cdCKMYt4sjQywCtKJ4Jbbq2s
	CA+UVk6r6xV8INXe7DxgOcHHmA==
X-Google-Smtp-Source: AA0mqf6NyW7czNvsIhY95K1Jdc/lOdQ5a/byVZNbMGPNGmzYiRe+hryvEd5tjIxIxLKK82dEP+06bg==
X-Received: by 2002:a05:6a20:d044:b0:a9:167:1788 with SMTP id hv4-20020a056a20d04400b000a901671788mr4645650pzb.19.1670549048337;
        Thu, 08 Dec 2022 17:24:08 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id r36-20020a17090a43a700b00218fba260e2sm194151pjg.43.2022.12.08.17.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 17:24:07 -0800 (PST)
In-Reply-To: <20221118104300.85016-1-conor@kernel.org>
References: <20221118104300.85016-1-conor@kernel.org>
Subject: Re: [PATCH v2 0/3] RISC-V interrupt controller select cleanup
Message-Id: <167054390671.12029.6021322479982022289.b4-ty@rivosinc.com>
Date: Thu, 08 Dec 2022 15:58:26 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
  Thomas Gleixner <tglx@linutronix.de>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>,
  Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_172411_382033_2DC9A058 
X-CRM114-Status: UNSURE (   7.23  )
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

On Fri, 18 Nov 2022 10:42:58 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey Marc, Anup, Palmer,
> 
> Submitted a patch yesterday defaulting the SiFive PLIC driver to
> enabled [0], and in the ensuing conversation Marc suggested just doing a
> select at the arch level and dropping the user selectability completely.
> 
> [...]

Applied, thanks!

[1/3] irqchip/sifive-plic: remove user selectability of SIFIVE_PLIC
      https://git.kernel.org/palmer/c/fdb1742aff43
[2/3] irqchip/riscv-intc: remove user selectability of RISCV_INTC
      https://git.kernel.org/palmer/c/d8fb13070c3c
[3/3] RISC-V: stop selecting SIFIVE_PLIC at the SoC level
      https://git.kernel.org/palmer/c/bf3d7b1d8499

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
