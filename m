Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FC6C3600F
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 06:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prZ91J5K8pAJ9vzLWSrWza/dVu963VGeA19sVR/hlK4=; b=Kp+5chw5LaXNe4
	DfVKAI7tFsvO5HJNpu9BGGDQzUGC4lbeDlDKhcW9tWNOu1PHSQDBsZEctbzHK6hVBQBy3elCBGRJ3
	2+aUn2EvdNHqlzbzF9v7KuFWBCtbv/SPHulP/OjMbY0s36A4o6QpDBN7Iekqq0vHSlVky69IOTBkt
	DSgAR1xGL/N/FoJnG6LRDTu3IQd1YUhidyckhfLmWk2LZg4T3CiPrGkUSLKKS1cpAu85ILAuZdKyz
	LrFBzI23O/NVlhuRGlPc3E47x2scSEX1QGlOwdxJXhldiT5Fl39FkHgVy952T++GuCXxe9pa1Ah+q
	CW6LxjOwfAe0+vMQPWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqnoY-00000007VVV-13mW;
	Wed, 18 Sep 2024 06:05:22 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqnoU-00000007VT3-3UjO
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 06:05:21 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so76902166b.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 23:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1726639517; x=1727244317; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t5mGxf+CZ3zZYnX4JbiIfh5pZ7tAjdTRZMOnJjviD4c=;
        b=YM0l+7WcM9jI6q9Up4S45/0wbbo+9C4grm1SP0/xUr85YhNks+KBeR2QbfsZemFIGg
         nFAwInwSb9ngVlZfCo2L6JuDu39pOHF8CVZqKbUnb87y28ZABsDp7+CDzmV/XjazKDK5
         OBsr7Cr6PzlMt9cGBcm0zUzIgN8bw9DhBcsYusDt2hrNZH6GsVr4GbUYy4GG87uD7my8
         L7EM2jlKaHVwzwwfQltuzQ8elxhX3ZpHz+9fuuBztaw5xYXZ2xM5EnJ2tfn4tNWZHwi0
         gf1kD+bcvdzv6JUjQZAUlcSlnzo9mhp+MgKo+qi3qy25ciCyWpOEgUXqPZq+q7SDYcaD
         7FaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726639517; x=1727244317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5mGxf+CZ3zZYnX4JbiIfh5pZ7tAjdTRZMOnJjviD4c=;
        b=gZDrAKJc9q6zn7O+UYUgP6HzuCRCGmuc9vOxEQdCA7xZo2RiUO1I7/KNKVnP55X8fo
         J+5g4D5XkgKTpJIBZmzIWv6vpSQgxl9aqLbSzUWxMQeotnVMzlxdheDXqv9TwVQWuc3d
         mBGjNT+2if3pMfYa3OXG0UnEtnZk2d0G35XHDEV2OMLVa98LG/e6xfUVWu3/qFGyAdqh
         9UVZWSp1bkcXA9JbX758DM4WuY1X3SHQeRS+6cHGxyW+GsO57xKrzvZkrIT90a7zt1bT
         918tVFuyz4DGq8WTWLm58fDQy7NzDcx18FZ9kc7Ln5/gwbcQf2Rok4SWzhvO2SYWFXQC
         iEzA==
X-Forwarded-Encrypted: i=1; AJvYcCUPF+YFk78srzcVMWYa0lFAsp/i/b5MwsaITanAJW06yzV271dpy2d3f2RIlI9H5ys8Ni2j4mI+VPZb4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEz2dFjw4IYiQVtaXbU9EWSnW1yx+22ZPxomDSezhHMjJk1Gy5
	6YonrSFHVCcx0kcOAuj220zrCvY5CJgjOhnQoRZ3b0vCR2QOD6XyGMYPQpMpJcs=
X-Google-Smtp-Source: AGHT+IGHKR0qqgSX96tsaPbrMvlFd8LcDl6wWuDi67U5uzQHtG4PPaURsQoSA0G1nXDghe6Ahz69jQ==
X-Received: by 2002:a17:907:7ea7:b0:a8a:cc5a:7f30 with SMTP id a640c23a62f3a-a902a8c26ffmr2252797466b.25.1726639516625;
        Tue, 17 Sep 2024 23:05:16 -0700 (PDT)
Received: from localhost ([213.235.133.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9061096aa2sm536689566b.35.2024.09.17.23.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 23:05:15 -0700 (PDT)
Date: Wed, 18 Sep 2024 08:05:13 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
	qemu-devel@nongnu.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] target/riscv: enable floating point unit
Message-ID: <20240918-039d1e3bebf2231bd452a5ad@orel>
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel>
 <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel>
 <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_230518_926334_D61BA4C7 
X-CRM114-Status: UNSURE (   8.91  )
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

On Tue, Sep 17, 2024 at 06:45:21PM GMT, Heinrich Schuchardt wrote:
...
> When thinking about the migration of virtual machines shouldn't QEMU be in
> control of the initial state of vcpus instead of KVM?
>

Thinking about this more, I'm inclined to agree. Initial state and reset
state should be traits of the VMM (potentially influenced by the user)
rather than KVM.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
