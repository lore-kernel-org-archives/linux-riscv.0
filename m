Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8609C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmAnHOc9YmZ/Jmeic80roN6cePAgv/MGdqJa1zOmyXE=; b=QcrgBZsfvpe9Ee
	kjThD0P76B43DVf2GeuV+gPU/8Klce0dYwoJVf2cB1n1L/e2rC/MWH+XW9q5skcJqwLIpDm4TRLDY
	SA+wVqvOMCCRiX4HUg5rCmI6XlC0gdh+PdNjyO64B1ZEV9JKvxdOUhr2RN9r7QYAHwL4T6Df7iyqS
	QCzL26586MLWS4NRdSoPY/lMU10OREmpJ4w1uB740wxnEF/XW6rHau6aiWf8JASC+0q0YNLYJK9U1
	CJbEEhesUhVmUH6k4Ht2z+YhmFPr1Y0s2kGIM/0N87giBCAeMN9DPZ+AE3tWr7v4kocX3dLo9MZ2H
	R2II9cHHpGMSBpfo2yOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvvF-00Ax6o-2J;
	Wed, 06 Dec 2023 17:42:57 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvvB-00Ax63-17
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 17:42:55 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a1db6816177so399966b.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 09:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701884571; x=1702489371; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5cQSdmy5VXvMhl1lDfSWOEIqrjKBlLF9FrQbjdBXHKU=;
        b=eqNyUGMph/YjQo266RAxDTLDgJCDtLdJIYi2O9GkHsvP/Hk9mCv3Fukkgsxcu1nNN5
         3fyVE2c3JCnwZrjgsvvnmkz9YyGwjIQmRZ4RQCEV5zmWJWQPzGoDriE4JKdz8n3cvgjf
         Dze+AhVH3zYK/U1sbJaoUYCA5bN9MvHyin/pg7urvGz+lD5/SRuT7XzcAGRWLlOjWajo
         0uiLLl18sV+LCOQJmNg0V31K6Qmn0eOtUkcGqie1wDCEzK9jFiHpO6H3Jz3t3UaWm7tc
         N8cmLfKfR11BFQG4/oz5NrtEESscNRML21XxjvgH5zwZwM1kay6kYZLr1lqR9dRbBph+
         CXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701884571; x=1702489371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cQSdmy5VXvMhl1lDfSWOEIqrjKBlLF9FrQbjdBXHKU=;
        b=YH1c+hDJtelnjjBgMvQbU1qZUAeGrAdWmFxNA/sl1GEQ1qqHiV1umdV3VOci9PB3Cs
         6s5ro0aCnHOpW5Ipn8ZmAhxE/32X41iO2XYrDaMIXYckX4pqao7sAJL1UpU3pV5dKI0R
         7+TWLJ1B/+GMGocYWqB368bBtvPEPhiOeIB4LU6mZpS9rw1YjyInfOlNlUd17xgidSpP
         +v0n1X3bergRnE7FegGN+SgcIFMEkikAcuCLBVSmixV4O5fpeEpxmM4TZ0UGVFzGV7yh
         Z1GCnx8outee1+px0N6FqJKcGOsTnmBQmsyKyGG1k7T/UcXN23xFE1O3akiG7NWTZJNe
         LvRQ==
X-Gm-Message-State: AOJu0Yz7pb+c82sL/2BRj4OzrfDlTq2MinG2uWe2HiDA4QGbnld/7sOn
	POvLoT+J/Elsq99K2TbFhlw=
X-Google-Smtp-Source: AGHT+IEqNY3yzxYYXl8igoGLjOk/4cPykJ/7Y/Xr3Wh21g/tUrcHy0cIIuxSjqPNQCjvvDdSWt6cPg==
X-Received: by 2002:a17:907:bb98:b0:a19:a19b:4265 with SMTP id xo24-20020a170907bb9800b00a19a19b4265mr646334ejc.208.1701884570832;
        Wed, 06 Dec 2023 09:42:50 -0800 (PST)
Received: from andrea ([31.189.124.152])
        by smtp.gmail.com with ESMTPSA id g11-20020a1709061c8b00b00a1cd9151af6sm207563ejh.210.2023.12.06.09.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 09:42:49 -0800 (PST)
Date: Wed, 6 Dec 2023 18:42:44 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: mathieu.desnoyers@efficios.com, paulmck@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	mmaas@google.com, hboehm@google.com, striker@us.ibm.com,
	charlie@rivosinc.com, rehn@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] membarrier: riscv: Provide core serializing command
Message-ID: <ZXCylOEXSbEMGB96@andrea>
References: <ZXCA+4WyI6D+Somy@andrea>
 <mhng-26a1b3dd-ca9e-4b82-86e9-1faf1e3571e5@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-26a1b3dd-ca9e-4b82-86e9-1faf1e3571e5@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_094253_386513_954FFEB5 
X-CRM114-Status: UNSURE (   8.88  )
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

> > The final version of this fix will likely depend on some machinery/code
> > introduced by 3ccfebedd8cf54 ("powerpc, membarrier: Skip memory barrier
> > in switch_mm()"); but, yes, nothing we can't safely adjust I think.
> 
> Ya, I guess we'll have to look to know for sure but hopefully it's
> manageable.

Absolutely.  One approach would be to follow what PowerPC did: AFAIU, before
3ccfebedd8cf54 membarrier/powerpc used to hard code the required barrier in
in finish_task_switch(), "masking" it as an smp_mb__after_unlock_lock(); riscv
could use a similar approach (though with a different/new mask function).
Alternatively, we could maybe keep the barrier in switch_mm().

But let me complete and send out v2 with the fix at stake...  this should give
us a more concrete basis to discuss about these matters.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
