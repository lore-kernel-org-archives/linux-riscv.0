Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE795C36010
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 15:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ei2cZoP6M8qafOKtbubHjjwF+c2RWQLfF8ORoHJ8NA=; b=3Apk7AgIIYa0SR
	kvgXbpiCGaBQunuZHj2uPxtZhuJ7hWjJX2vlEwEvJEpB+2rqHaRlHvhHS17gkbDOExSegkHqZHCNJ
	+gLDt/H+pou2+owvGBSDb8HvW8b0mMIIof61llfy4NQ+gw7jhkBh8kfyNxe258YE59zkgs84rGuot
	XlQMmlK3F+y93902/524Thc95tp9jF1xnBiTUOCuZtrVVvKyhY6VJYHX8Gg5LmXZ01uAFKBK4xe4a
	CJagfKNt61+UFKGltInjxpt0jkJf1Qf14M1hD3R0eJ6CDCXo3HVcgQje53MArK7c7YfRwX5W8dzNA
	1651q/8DS8lrfNZI8B6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdPA-00000003hUp-3Ly3;
	Tue, 01 Apr 2025 15:19:56 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdP7-00000003hUJ-3NIR
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 15:19:55 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6e90b8d4686so50112596d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1743520792; x=1744125592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9RX2MhL48qiAun01P3LgrVxPQPk3OXe0hAHtALtiNuk=;
        b=IzOxPEPT5nuTHj3R4mXNMwFaAsIzBsbYMmXQsW1F5RxLphMLLRQuS1UUw25JA1pZxl
         rg6zwgCyuzZQ9ck0NvQ0IAkoynLFQuXqX4nY03kYMm1KVfMlZUo3E9nSABY0ZLVpxSqW
         +5m0YvVwvobQN6/5RlhsgIbjCInvcuxG979cOZO8WELXhlWtKJXK5Xl71ALWurJnN9fS
         +jnK0Z0rciwpbtMsNoRTHYu2jVG5hZ/VIFtBBnOfEYb1IQwVh6uNEulFIYpc29AYUXYS
         oZmbxBhDLo1w24ya8xY7tweTfXYMo7iMJjX30rFRSY64cs+T6F29LFAj+M4aiapSuhn+
         7QPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743520792; x=1744125592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RX2MhL48qiAun01P3LgrVxPQPk3OXe0hAHtALtiNuk=;
        b=jNJg6BARCLaYv8D4X9E4EjxDfpMTxT3CmZcgNRgCru+JkaW0XjRd8qxeDtaSFjdzbT
         l5UG8JU9S+widd6Te6/ikOD/sTMYUIyDpi7D63jQGhCoTmoFwJtMO/+xWF+Pwkse6+8H
         fmPcqvjbgQ/bqumlT8diTd8ns+1XJf1BfHixxCA38kYqC/0W1TiUYZXcQW2dPE57HRG3
         ga6CalC++gqVvhsTUkEnR5wUwZKA/pfVyJPXUFGvTlrWe63+CqogXAJ2fwdGgB4yRich
         edIWdVhkFpyUceQdeNHejkfvfAbBmnohfhFr7XPyo1zh3ZRbfCWU9uGAZd3dKc5s5bLK
         NOCw==
X-Forwarded-Encrypted: i=1; AJvYcCWkLsQ9UzKN5MfA/eeQlccXY/MvgsIoYrUGirMkjh0BbfkXn1f7CeEkHw3dhCeSEuIadUGny/yo4kcDCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuxXLwq/aOeY2sskOpiKkdKsH8SSArFBimIqPIwEE/UHq6gmbF
	i64Hm2JGFiqsRlgxNcKuR6Z1ByFmnfoPVCPesfcokr3aNWU2O9zNE4Cllbw0i+E=
X-Gm-Gg: ASbGnctWxHMc5xd+CNETP1gQrjwYJj+FDOso1puYoPsz+pRync0qn5s9ZIfTaIbos7C
	Abf9ap1g8r8yZMom530xFSrmn5BeyM1+vEX0r4Zr20WLn3axDbz+pcRMRuahxmKnnrOAT7RQ5XK
	kbvDVwnyjwFkTD0WnFy7Kvu7oIQ4E8KWnZqO03DGMbu4nfW5ud4BlM5jwStaiVeEWiGkqV7WPLp
	/tNf62lbhcibuprC2lTcwDZFJqF72ULIDQOAojH0zaVgrJEtgmzECCWpJ51UXW/1CSIgZmUCrF0
	K8PjIs7rqhiP16EwJSs73VZHHqkhxm2+K3g0hqgoXCAmr1C2X0OdBnr6AFw107NnxCResjj96Kp
	SwbVckAiIcb/IpDPBfBdoYX0=
X-Google-Smtp-Source: AGHT+IH3zCk5MmZmXCv7ZuPqcRLbba65JHJK5uzLaCAUKvfGgXjHj0hYugrFbyOE/Zo8jfUORYkHtA==
X-Received: by 2002:ad4:5de8:0:b0:6d3:fa03:23f1 with SMTP id 6a1803df08f44-6eef5d9d049mr52040406d6.13.1743520792422;
        Tue, 01 Apr 2025 08:19:52 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec965a18dsm63016516d6.55.2025.04.01.08.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:19:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tzdP5-00000001Lxl-1sHc;
	Tue, 01 Apr 2025 12:19:51 -0300
Date: Tue, 1 Apr 2025 12:19:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: akpm@linux-foundation.org, jhubbard@nvidia.com,
	kirill.shutemov@linux.intel.com, tjeznach@rivosinc.com,
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	lihangjing@bytedance.com, xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH RESEND v2 3/4] iommu/riscv: Introduce IOMMU page table
 lock
Message-ID: <20250401151951.GG186258@ziepe.ca>
References: <20250318035930.11855-1-luxu.kernel@bytedance.com>
 <20250318035930.11855-4-luxu.kernel@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250318035930.11855-4-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_081953_842223_6A462CC8 
X-CRM114-Status: UNSURE (   6.95  )
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

On Tue, Mar 18, 2025 at 11:59:29AM +0800, Xu Lu wrote:
> Introduce page table lock to address competition issues when modifying
> multiple PTEs, for example, when applying Svnapot. We use fine-grained
> page table locks to minimize lock contention.

This does not seem right, there is no need for locks to manage a cont
bit on the iommu side.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
