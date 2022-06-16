Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AD7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 04:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ld9PyrfvnSEw9zi7QTNg1gUhaUwQs+rtzXiFxMb29RQ=; b=Jv6L4L5p6KBDTP
	IkBIKB8ipr2qdgtwu3nr6a857Zc0tBENXJjo+yGAbwEoAzkzrmvCTVkE0epJVyIvwdo8MDq2VrXMW
	OhH4OLHCGR7YKqvQpdC8lUdeTB/qTdz6wZsTrNlM+uNHLet5zJyyjRHsfGhhIvaLjQZ95buEU1nkC
	fPBHvY/stt4xjVrAQ/yuB/OJs6Zkwds1WcIMXvBk9J60s8+Aw4iOQAkVQqLn1Pvgeez7koHPnrPFe
	NGVEtiBBx7Qjoy8KjaQ1QJEqmAulwTaQxZx3lpT4/XXp4mv0TiTt6Ig33+iD9ynDSuf3hYs4K2nBK
	vebLS9CP2DPo6KOF3bWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1hXH-000RWt-Ca; Thu, 16 Jun 2022 04:55:15 +0000
Received: from m1524.mail.126.com ([220.181.15.24])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1hXD-000RQX-OV
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 04:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=dshfT
	7W6MY5sBDSYiWA99vNTQfl5M8jX0dK3LxKchtg=; b=kGaypZpwiRhQsvtsbLNua
	gqglHQHDFf3c2zv5nv2hPsuXQKIt0OMw9jbY+77QFvhBqhyOK/Xupjaa4uG+JUoE
	9bhn7IWxO3tKBmbFLf7JCc/KWftTz2xb22hKWYgZuA1ZOtJ9BaNmbydDc1mWOZqx
	Kj2QJXL1rvaIDZ2Oc9F4uk=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Thu, 16 Jun 2022 12:54:50 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Thu, 16 Jun 2022 12:54:50 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "kernel test robot" <lkp@intel.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	kbuild-all@lists.01.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] drivers: soc: sifive: Add missing of_node_put() in
 sifive_l2_cache.c
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <202206160559.fVKJx0ST-lkp@intel.com>
References: <20220615122315.3965435-1-windhl@126.com>
 <202206160559.fVKJx0ST-lkp@intel.com>
MIME-Version: 1.0
Message-ID: <3e6469ba.38b2.1816add33c5.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowACXpiaat6piW_k2AA--.1844W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuA4iF2JVj44gFgACsB
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_215512_192243_97F19129 
X-CRM114-Status: GOOD (  10.02  )
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





At 2022-06-16 05:58:05, "kernel test robot" <lkp@intel.com> wrote:
>Hi Liang,
>
>Thank you for the patch! Yet something to improve:
>
>[auto build test ERROR on linus/master]
>[also build test ERROR on v5.19-rc2 next-20220615]
>[If your patch is applied to the wrong git tree, kindly drop us a note.
>And when submitting patch, we suggest to use '--base' as documented in
>https://git-scm.com/docs/git-format-patch]
>

When I use --base, there are too many prerequests-patch-id caused by my local commits. 
I don't know if it will cause other troubles. So I resent a new patch still without this '--base'.
Is it Ok?

Sorry, I forget to say in new patch that  is based on v5.19-rc2 mainline git repo.

>url:    https://github.com/intel-lab-lkp/linux/commits/Liang-He/drivers-soc-sifive-Add-missing-of_node_put-in-sifive_l2_cache-c/20220615-202528
>base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 018ab4fabddd94f1c96f3b59e180691b9e88d5d8
>config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20220616/202206160559.fVKJx0ST-lkp@intel.com/config)
>compiler: riscv64-linux-gcc (GCC) 11.3.0
>reproduce (this is a W=1 build):
>        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>        chmod +x ~/bin/make.cross
>        # https://github.com/intel-lab-lkp/linux/commit/49c4086768b5aff410a4a19ca740f8ae8e211844
>        git remote add linux-review https://github.com/intel-lab-lkp/linux
>        git fetch --no-tags linux-review Liang-He/drivers-soc-sifive-Add-missing-of_node_put-in-sifive_l2_cache-c/20220615-202528
>        git checkout 49c4086768b5aff410a4a19ca740f8ae8e211844
>        # save the config file
>        mkdir build_dir && cp config build_dir/.config
>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/soc/
>
>If you fix the issue, kindly add following tag where applicable
>Reported-by: kernel test robot <lkp@intel.com>
>

Thanks for this report, now I make a new patch and add "Reported-by: kernel test robot <lkp@intel.com>"


>All errors (new ones prefixed by >>):
>
>   drivers/soc/sifive/sifive_l2_cache.c: In function 'sifive_l2_init':
>>> drivers/soc/sifive/sifive_l2_cache.c:224:17: error: expected ';' before 'goto'
>     224 |                 goto out_put;
>         |                 ^~~~
>
>

Thanks for all your effort to improve the patch.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
