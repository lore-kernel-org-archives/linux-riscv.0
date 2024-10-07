Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23468CFB451
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 18:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLS1pjTof9ancDmQJ9pFEOCNUsunsa+j4YB1twn499E=; b=bb6U+OA+O0anT+
	lIjrpz2ZbEbu0FHq2C8TcfawnFDcEcemdzJjwl8mDiyJceh7+f/Q7aNI4U8M/gIvExqzyhdCg0atG
	cQO0CPuJrhh6Di/CCcY07vtTss6lH+X0NDVAh7NqoSRuowO7RLZIl0+SOv2fMukQuFvPxw8GduaIk
	vNOnB4MnHaTagDKfveHJE54yBNSyvZXj0bF22oCyfzDwWKTtKXYtEf6jgIrk31V0dR7P5WVMRpujk
	sBnoY+jiVREXScnzds0Y7y0WfDHZ6UwXpXjwOK+j3tMr4Nmj67xiqzBcQrZSGmYs71UlGvsmyDFyG
	u/wKkUmS3F96YSKgTmiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxsC6-00000003QpD-3hsX;
	Mon, 07 Oct 2024 18:10:54 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxs5N-00000003Ptm-2Xv2
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 18:03:59 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71dea49e808so2667953b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 11:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728324236; x=1728929036; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MVGSjDknVMXjQYoTQZQyn6ion9DZQ87YWfmvoPAOAL8=;
        b=ScHeqW8RYEQ/7s8dGodLlhcejK6e/EqeqWj0Us2PNDo1T04bN0MD+VNh2g2oIIQqL/
         754peRSRSrZsuPREHnDvNkBenG4soAI0hSQLnFmRlFV3YuS6EoGgipqnyFrm3WZcJE0g
         V4Hi5OXxW7Z0FppeoDgoEynPRov3s97L9r9nEJdZMOICwvZNYnLhjjgHqgASrnmXS23P
         lpzIkB+9RNatMcZSapWGK+SyvXwH79/gby8+RJaoldogqdVOJlJd9YDIWS916ybTICX7
         lM68Vhki4oi3/c72Ri04WKjIDuPq83I8J2RinaQUd/QnPeBQesC3DvI0SUnUafhvxJDn
         2qXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728324236; x=1728929036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVGSjDknVMXjQYoTQZQyn6ion9DZQ87YWfmvoPAOAL8=;
        b=UkjzBaZ8ZLBGJ7x13ETayrcsbVqyFcTBVHRwoUnXtvPkksnLebWCHe55BO7Cvi9na5
         bg2JjrSR5AqKjNnWF4SqCxslDEEFeiC+GGehM3vY9lS+e5hPhXLF1dUqbG9EkFvsB+au
         oY9PvoXiGcc0WEMdIfOCvdANSXS4ENgBarVDrKr7qSkRSBwes4SQ3ivgru1lYz3Zlw//
         Y2ohw4UJQ3m5v1H9/NTQ/0LoPILg/VYGoPw9uTqL2lf/dMSAO3xhuozDgBhd2kL4fsLa
         hG4GrDfZ+g9r3vvYMzuEWXVNwKwaO9FJQ3T592c4RZsOENLp/2MgKf+Zq9Bda5H5haAx
         w1Vg==
X-Forwarded-Encrypted: i=1; AJvYcCW08t7jhHy/MFyD98FIt9S85RJPQSXr6U1Yas9Jq0654tgsupwL70fHzv2v0lpmKKJjmcVc9GRKMuUV6A==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvu70DfZIW/wpITnEmCcSdQSfBGhGRHjPf8n+nuOLgIak6Bk65
	9F4R0rw5nXp8rBOUl+k0cG5/2z9tPo3W9UX0P3AHRQ3mB4FrVK6lE2aXEhv2VZTzdp+ERfUtc4C
	t
X-Google-Smtp-Source: AGHT+IHtCkLsJksWiActtwWLrS0eD/m1ABPJG3RzxhSPeEyDzgju5CyXRLJOluQztqFFZN29rhif1Q==
X-Received: by 2002:a05:6a00:2d8c:b0:71e:b8:1930 with SMTP id d2e1a72fcca58-71e00b81b19mr9261207b3a.16.1728324236611;
        Mon, 07 Oct 2024 11:03:56 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d47edfsm4662653b3a.128.2024.10.07.11.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:03:56 -0700 (PDT)
Date: Mon, 7 Oct 2024 11:03:54 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: kernel test robot <lkp@intel.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
	oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] pinctrl: th1520: Convert dt child node loop to
 scoped iterator
Message-ID: <ZwQiijdDKDHvwcOx@x1>
References: <20241006-th1520-pinctrl-fixes-v2-3-b1822ae3a6d7@tenstorrent.com>
 <202410072033.XpRqZ8nz-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202410072033.XpRqZ8nz-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_110357_671266_F7A95347 
X-CRM114-Status: GOOD (  14.07  )
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

On Mon, Oct 07, 2024 at 08:26:28PM +0800, kernel test robot wrote:
> Hi Drew,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 2694868880705e8f6bb61b24b1b25adc42a4a217]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/pinctrl-th1520-Fix-return-value-for-unknown-pin-error/20241007-014953
> base:   2694868880705e8f6bb61b24b1b25adc42a4a217
> patch link:    https://lore.kernel.org/r/20241006-th1520-pinctrl-fixes-v2-3-b1822ae3a6d7%40tenstorrent.com
> patch subject: [PATCH v2 3/3] pinctrl: th1520: Convert dt child node loop to scoped iterator
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241007/202410072033.XpRqZ8nz-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410072033.XpRqZ8nz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410072033.XpRqZ8nz-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/pinctrl/pinctrl-th1520.c: In function 'th1520_pinctrl_dt_node_to_map':
> >> drivers/pinctrl/pinctrl-th1520.c:420:29: warning: unused variable 'child' [-Wunused-variable]
>      420 |         struct device_node *child;
>          |                             ^~~~~

It seems this is because the scoped iterator declares *child in the
macro and thus no separate declaration is needed:

 #define for_each_available_child_of_node_scoped(parent, child) \
         for (struct device_node *child __free(device_node) =            \
              of_get_next_available_child(parent, NULL);                 \
              child != NULL;                                             \
              child = of_get_next_available_child(parent, child))

I'll fix in next revision.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
