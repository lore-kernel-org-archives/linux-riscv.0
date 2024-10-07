Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D318ACFB449
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0omeg4PN7ZCa84YVzeimuVDry3AOQK+xxp6Guw1A7g=; b=GVnua8L+N1WP6R
	MwALfiwxrsYc5NAjGerW9IYePwnVLhExFby9IHCuioZWuK8XnF4RHllRyOPyoCURDl1VOl0ntlgBG
	/CLjbrAFOqoBTOKwkLofVaIRR0LpU30AosTfP1OnohAHRyd2AIVFEtO1xlUF8UOgvBRMXp72ygKRJ
	lZEzfzQwyhrt2I1HBDweZTmOj/KirsqxMYH6Fp904u1ycH8Yfe7pFl8XxhNHiXEqW0yUofWlX6nTr
	exas4PD9Nq4HQ22dqiY8y7r3yTHB6Gv/H8RKdQ6wb8VnDFOaUXLeMHTLh/00g6XKsa/3SQ76qgl6f
	qt4yt731sE0M5G6P/3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqgM-00000003Ahv-3m1K;
	Mon, 07 Oct 2024 16:34:02 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqgJ-00000003Agn-0ygY
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 16:34:00 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71e029efecdso1023306b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728318838; x=1728923638; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YZWM6QTmBe9B09ML2vqXCSoB0/AzhE/+M2NioGDzKy8=;
        b=X4Lc+Q0uWGMpxeR0Am8408fuCz/ZTOVbm9MQUlr8I5xELQi2MBh0E51zM3DCnD/pCt
         1sZzFAh0WwiURCgY0KJSJ5u/GZV/Qh19/kLLEaVnNSwkqNi6qxjN/ncOinGiyhaihdYo
         WzcVvIA9wDquAdj6nhHg4snBleMhesRh4EGVeG+nKWH62ZfVldbM6+huBpUslfeT4K90
         58yMun+6n1v5tZ+4HVMYxX+RULDND2Pq6P6yHJeWQO4Ma0LfWdfFFF5/Sj3tGS/DQ0IR
         Uw8/UosIK1taYk/M8LJVyB5F5ThVRM0ZoWICLAysgQXQ2FUeV6OFNXF0wtAPSQbG/dtw
         vuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728318838; x=1728923638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZWM6QTmBe9B09ML2vqXCSoB0/AzhE/+M2NioGDzKy8=;
        b=HO/REkomsyojGUEx35SDlas1AgNVx4e6uG3BWNUzGyCr3aC6tpBVgbIA9H+pn6gwa5
         zMoCkpD+mt2zQR+ay8nG4RTSdBct2bcJjElGEadfb7zaYNY+UvGVfVD0Eb1QyXJsWvuq
         fQ0lZi07dwEJ6FtJUrMlg4eF86uHypFyHz0NkGzOFPc7d2b89kuWNvNMdpKwQZrrThjr
         3e+vCfgKzXLks4vp6h0B7na+9dEGj6Fl0JLysAUMysxY942a2Vyc3ePQ5AR5cUEz0Q8A
         BAM4CRtKvUTRlU0KUFZS8jyMQ6zvd++5DwaSnbQPBeexpAvimZBeB65GrDtF7zajiTy9
         z2gg==
X-Forwarded-Encrypted: i=1; AJvYcCX9tyE67V5V6KuGLEu0v9J5XEdV6mN3HAnGypuo4SaU5qI0oBlHfyy4X2RntTc9//9p+9n4W0J2pI4baw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhPkQJlNWj/jwLppruV0Rj4VA1FQ5AAJv4um0RlwdoVMhwFVwm
	TB/EuMyyDS1zkldfaFP7bhjnyeYu14IfyRNgUHblGRKZ/Uw6lQ5BKnq/FcdLepI=
X-Google-Smtp-Source: AGHT+IEOn2aNJRc6PNcmA1E8hHomUDAvzvN8DoqLjg4IGSM4t5x9BXT+gVd7xFtvp6ibMbgO/sW9JA==
X-Received: by 2002:a05:6a00:1ad0:b0:717:8044:3169 with SMTP id d2e1a72fcca58-71de23b5f19mr17937448b3a.9.1728318837846;
        Mon, 07 Oct 2024 09:33:57 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d4a1f4sm4590147b3a.113.2024.10.07.09.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 09:33:57 -0700 (PDT)
Date: Mon, 7 Oct 2024 09:33:55 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded
 mutex
Message-ID: <ZwQNc9/sO9lhUvmw@x1>
References: <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
 <6b3d9f7a-c87b-4ef5-8571-77276f3896a1@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b3d9f7a-c87b-4ef5-8571-77276f3896a1@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_093359_300635_380CE18B 
X-CRM114-Status: GOOD (  11.63  )
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

On Mon, Oct 07, 2024 at 06:41:36PM +0300, Dan Carpenter wrote:
> Hi Drew,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/pinctrl-th1520-Convert-to-thp-mutex-to-guarded-mutex/20241006-033647
> base:   2694868880705e8f6bb61b24b1b25adc42a4a217
> patch link:    https://lore.kernel.org/r/20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00%40tenstorrent.com
> patch subject: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded mutex
> config: parisc-randconfig-r072-20241007 (https://download.01.org/0day-ci/archive/20241007/202410072108.uG2sVTN4-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410072108.uG2sVTN4-lkp@intel.com/
> 
> New smatch warnings:
> drivers/pinctrl/pinctrl-th1520.c:538 th1520_pinctrl_dt_node_to_map() error: uninitialized symbol 'child'.

It seems this is because the scoped iterator declares *child in the
macro and thus no separate declaration is needed:

#define for_each_available_child_of_node_scoped(parent, child) \
	for (struct device_node *child __free(device_node) =		\
	     of_get_next_available_child(parent, NULL);			\
	     child != NULL;						\
	     child = of_get_next_available_child(parent, child))

I'll fix in future revision.

> 
> Old smatch warnings:
> drivers/pinctrl/pinctrl-th1520.c:502 th1520_pinctrl_dt_node_to_map() warn: missing error code 'ret'

This has been fixed in the v2 series [1]

Thanks,
Drew

[1] https://lore.kernel.org/linux-riscv/20241006-th1520-pinctrl-fixes-v2-0-b1822ae3a6d7@tenstorrent.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
