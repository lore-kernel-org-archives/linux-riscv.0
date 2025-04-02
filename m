Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C559BC3601A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Apr 2025 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DBeqasEz31ed3WBldFECZ2MHR3YpIgmiSNpH4rmQ9Y=; b=of9DmswgH3FOri
	0zbAGbdgPIuqWhZjApvRkkGIVkcaMm9WN6sRezQFgHvTENubLkP0ICs02/kWwKRtaYzFERYJnyUcw
	Ft968VHZF9dMF8GPszHGD+x4Yz5gGshp9g1+e7C5t+tY1Aie2qgIOfqlvpOuAV9672leNHmv04CRt
	+86e8UMCAPOW9m8QQWZo04nSdisL9VQt6NiVf0oNFvL5nP9O1DIdSsxcKaS0tzQAj1NbU/ehOdyEW
	A2sDMStWnP0jvL81+TBy5hyhJ3SHWVhot14CvjKIMZ3FRokY+b9YR4P+otuolD6gc3DBIeaKl7VKJ
	vQiOJXTAx9+JX2GRM9GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxhx-00000006Aoy-1HOX;
	Wed, 02 Apr 2025 13:00:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxhu-00000006Anl-1sGP
	for linux-riscv@lists.infradead.org;
	Wed, 02 Apr 2025 13:00:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso66933405e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Apr 2025 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598837; x=1744203637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngxDFq1nGLdsrKZFLcmh45jEs49yfqhaJP1grV4jxpE=;
        b=ACrVM4jouHazeTpPIrbmlUDc8erCZre1lbe8mL2+QuIZaTEB/8Wd60PxJMwc5FCvIz
         MkzDZxn2w4cBYG7GC/SIFCnj2ouRI630st0oyfpeDZBi0mcXh7WPkN31Z+GlRoIppg3H
         D2BPg3fAFa9SFO1byM+uX4ay8GsU/1X04oHA/QptMKhXXYmvnPKmhGkcKqdDcBUzGAnA
         F+ffYFCCcZNGY+ne3Q898W5kvKMBEkuL3WpYw3Qi7miGuMKjypDcqcZ8OvEbzKkZ6kc6
         TQZ9oWV85efVPynemYywTdABTU2O/bTclvVBG+2FH8D4+wfKVpKejiIjRRcSs/arw3VM
         a7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598837; x=1744203637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngxDFq1nGLdsrKZFLcmh45jEs49yfqhaJP1grV4jxpE=;
        b=b5djPnOhUqfZSgAhewypily3oDiYg5RdyFnLSeJdGOz2yYouP2seYHrTqwOij9x1ge
         dmtYsGl9lWBDGJV2Gten9tIo7S4ZjQsoSxuu9eQmIak7sUhdmaOH3GOowcQk3OHl/Bfx
         C9lOSr10nzgZKckGafazsc22EnT1pjiyvVcGMO25M9o2FuRIymcMPYPPWw6XIEPlvsv/
         gKPmHrBJwcvoFx9lfUdY/qvVoEZNEYZ2PezLdDikZKxXAsqFIb2/9GZSTr3E/SkMnWal
         pdvGOgnJTb4bDQyS9w88Sw1lMlN/xvsGV9dUZn96pFaAzwIv12I/xktoIxOKLLWJE7s4
         v/QA==
X-Forwarded-Encrypted: i=1; AJvYcCUdFt3ZmNWXVKzDKg7ji/VSMDkv72XlE5i48DyKxtxF41o5Own98YGUi3Rpww/49soQWbEPfpfoe6Omlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsuNGovjEks3QvGWE6Tub97F8TlK/cKHzwwjdkfQcyCSQRaGU3
	LB4GDsTuUk0a0MeLUO1+gfXpzFp9ibQCIWlhL/PhArd6qJsa13zN
X-Gm-Gg: ASbGncvQaliSRePCajldh8AYIIR7BAjAZt5HJg0T76bn9vuR0SDVQc1enks41yvRawI
	X5kn7N93oSkLI/91MWRpTyzcNT1+j1cHB2CL7OmWYV14CJgkqMxp1ODV3aNc17zICn5L2RipM/y
	8QMvOUR3yXJgCP0xFHGxMCFEIMgPqn8LTA4bLqRtsn2/8bTNtZy4bfyqgovr5O3LChneVPBQ9jn
	zDZQLhaHDvDdCVEX4itWFRaMu464M3qRQS9ykEtGGnPN7YhwBbl/Y/xnMjr7KNEALfID6xT8gpX
	h/JoS1kMY8UQ+Ya4MKVgZWQ2+K7mY9N+ore68l5pVR815elfiw/9kjV6FipmllTEm4M6FDwbjeY
	ju0Vr8Yc=
X-Google-Smtp-Source: AGHT+IEicv5KsZA/zLNoahNekdHnYAFlpnVcWaBREtvGIuqd11qcLb81th3r38X1cJ6IPJ8qdCPrVA==
X-Received: by 2002:a05:600c:4f43:b0:43c:fad6:fa5a with SMTP id 5b1f17b1804b1-43db62b77acmr152520745e9.24.1743598836578;
        Wed, 02 Apr 2025 06:00:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea8d1673dsm41466725e9.0.2025.04.02.06.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:00:36 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:00:34 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Xu Lu <luxu.kernel@bytedance.com>, tjeznach@rivosinc.com,
 joro@8bytes.org, will@kernel.org, alex@ghiti.fr, lihangjing@bytedance.com,
 xieyongji@bytedance.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH] iommu: riscv: Split 8-byte accesses on 32 bit I/O bus
 platform
Message-ID: <20250402140034.0fc4cbac@pumpkin>
In-Reply-To: <8cfe938f-5eff-483e-95a1-c4029993e287@arm.com>
References: <20250325144252.27403-1-luxu.kernel@bytedance.com>
	<8cfe938f-5eff-483e-95a1-c4029993e287@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_060038_620718_925DD08A 
X-CRM114-Status: GOOD (  13.64  )
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

On Wed, 2 Apr 2025 12:28:54 +0100
Robin Murphy <robin.murphy@arm.com> wrote:

...
> It is not, in general, safe to do a split write to a running counter 
> either way - low-high vs. high-low just moves the problem around, 
> changing *which* combinations of values are problematic and capable of 
> overflowing into each other between the writes. If the PMU driver can't 
> write counters atomically, it will need to ensure that it only ever 
> write them while stopped (at which point the order surely shouldn't 
> matter). Conversely, though, reading from running counters is a bit more 
> reasonable, but it needs more than just hi_lo_readq to guarantee it's 
> not got a torn result.

Or have hardware that latches a value waiting for the following cycle.
That could be done in the bus interface logic.
In which case the cycle better come from the same cpu, not another
cpu accessing an entirely different register.
That requires a global lock for the device.

	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
