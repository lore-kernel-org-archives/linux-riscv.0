Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64C1EDF143
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 16:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsF0yuzjmKagBZPxqiFyikEU+3W0jkOV5km6MKygX9o=; b=olkGdKSzraq9v2
	Y2qasltraHz2xnUZESM18PdgyM5xKSOd9XXfIuag7vxee2IF3MHmSDnRvZj/nzZP+mol07y6x4/gC
	mc1N0ZNu23yNXeur+L5J7xY45qO5LmGybb9xqZ2RErgUgnHNNe6Go+mWgcSq7TMKr9PR0VlidRdm0
	85tt+X9PBPYkdXmjxWTIYGXiwjPPmLPgJuahJ0rbI3isQvagApPZ4OAc8SPzewiequaHxexvEHbos
	IjhVj04pcqyIN0HbksDImvQFAOvCgE5y/h9Z3BYjRrk/nbzoVHOZxI456AUnamN5Q5+xDslsuAZdB
	kdmgqPrFsnGxuMYxfQHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqw1C-00000003gCz-2qvs;
	Fri, 13 Feb 2026 16:27:47 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqw19-00000003gCa-3ulF
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 16:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771000064; x=1802536064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=loXZez4fU6bTVN0GB9jS/17xXYK/cezQdjrmGTcZACM=;
  b=B0/a7ha1v+v8NcDDlRH76+5J5KhLPhluz6jOe29oy6LB1cIAQ/mDPVAj
   Lv8/y3pM/pvRTCRLEqstevXvQ8dDVK5OUjkiDOzG1WrG/d7dfoF2LfJI0
   xcilDsgZq2cmmbwJ7qbFhbfriqcqsgg4HGlaOA0h1ahmEwZUMGEFvfYDv
   /5ViQaP8Gxxr+RKV/ppyPgGvEGjoc/Ae+XWXCwfA5QSzaha0W0ScJyIA8
   SOiBfGKt2NguRDgCpFN7TANfwVMVpBRQyMUnCM1NR/3BorpKq0V/z82+H
   eN/f35SfVoP0+O+JvNglqzTQ50l1DvuSP16RlZGThuFdkXVzSwmXzdSHO
   A==;
X-CSE-ConnectionGUID: uQ0+mV/bSGKffzkF+vE5NA==
X-CSE-MsgGUID: gGxIaVXaQ4Cn5wE+UUVyIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72080403"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="72080403"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 08:27:43 -0800
X-CSE-ConnectionGUID: qjkegM0URdKv5bNMpcxCNw==
X-CSE-MsgGUID: oOBomfvvQiC05aSwqnejxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="212057138"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Feb 2026 08:27:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqw11-00000000vfA-1389;
	Fri, 13 Feb 2026 16:27:35 +0000
Date: Sat, 14 Feb 2026 00:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: LiuQingtao <qtliu@mail.ustc.edu.cn>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, jirislaby@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
	bjorn.andersson@oss.qualcomm.com, marex@nabladev.com, dev@kael-k.io,
	mani@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org,
	liu.wenhong35@zte.com.cn, liu.qingtao2@zte.com.cn,
	hu.yuye@zte.com.cn, dai.hualiang@zte.com.cn,
	deng.weixian@zte.com.cn, jia.yunxiang@zte.com.cn,
	bai.lu5@zte.com.cn, yang.susheng@zte.com.cn, shen.lin1@zte.com.cn,
	tan.hu@zte.com.cn, zuo.jiang@zte.com.cn
Subject: Re: [PATCH v1 2/2] LRW UART: serial: add driver for the LRW UART
Message-ID: <202602140029.NXkDToZ7-lkp@intel.com>
References: <20260213093334.9217-3-qtliu@mail.ustc.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260213093334.9217-3-qtliu@mail.ustc.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_082744_024731_3FE43D53 
X-CRM114-Status: GOOD (  14.08  )
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

Hi LiuQingtao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus robh/for-next usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.19 next-20260212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/LiuQingtao/LRW-UART-dt-bindings-Add-binding-for-LRW-UART/20260213-173610
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20260213093334.9217-3-qtliu%40mail.ustc.edu.cn
patch subject: [PATCH v1 2/2] LRW UART: serial: add driver for the LRW UART
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260214/202602140029.NXkDToZ7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140029.NXkDToZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140029.NXkDToZ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/tty/serial/lrw_uart.c:8:
   drivers/tty/serial/lrw_uart.c: In function 'lrw_uart_dma_rx_irq':
>> drivers/tty/serial/lrw_uart.c:973:23: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'long unsigned int' [-Wformat=]
     973 |                       "pending %zu exceeds DMA buffer size %zu\n",
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:142:62: note: in definition of macro '__WARN_printf'
     142 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:185:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   drivers/tty/serial/lrw_uart.c:972:13: note: in expansion of macro 'WARN_ONCE'
     972 |         if (WARN_ONCE(pending > LRW_UART_DMA_BUFFER_SIZE,
         |             ^~~~~~~~~
   drivers/tty/serial/lrw_uart.c:973:62: note: format string is defined here
     973 |                       "pending %zu exceeds DMA buffer size %zu\n",
         |                                                            ~~^
         |                                                              |
         |                                                              unsigned int
         |                                                            %lu
   drivers/tty/serial/lrw_uart.c: In function 'lrw_uart_dma_rx_callback':
   drivers/tty/serial/lrw_uart.c:1022:23: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'long unsigned int' [-Wformat=]
    1022 |                       "pending %zu exceeds DMA buffer size %zu\n",
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:142:62: note: in definition of macro '__WARN_printf'
     142 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:185:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   drivers/tty/serial/lrw_uart.c:1021:13: note: in expansion of macro 'WARN_ONCE'
    1021 |         if (WARN_ONCE(pending > LRW_UART_DMA_BUFFER_SIZE,
         |             ^~~~~~~~~
   drivers/tty/serial/lrw_uart.c:1022:62: note: format string is defined here
    1022 |                       "pending %zu exceeds DMA buffer size %zu\n",
         |                                                            ~~^
         |                                                              |
         |                                                              unsigned int
         |                                                            %lu


vim +973 drivers/tty/serial/lrw_uart.c

   943	
   944	static void lrw_uart_dma_rx_irq(struct lrw_uart_port *sup)
   945	{
   946		struct lrw_uart_dmarx_data *dmarx = &sup->dmarx;
   947		struct dma_chan *rxchan = dmarx->chan;
   948		struct lrw_uart_dmabuf *dbuf = dmarx->use_buf_b ?
   949			&dmarx->dbuf_b : &dmarx->dbuf_a;
   950		size_t pending;
   951		struct dma_tx_state state;
   952		enum dma_status dmastat;
   953	
   954		/*
   955		 * Pause the transfer so we can trust the current counter,
   956		 * do this before we pause the LRW UART block, else we may
   957		 * overflow the FIFO.
   958		 */
   959		if (dmaengine_pause(rxchan))
   960			dev_err(sup->port.dev, "unable to pause DMA transfer\n");
   961		dmastat = rxchan->device->device_tx_status(rxchan,
   962							   dmarx->cookie, &state);
   963		if (dmastat != DMA_PAUSED)
   964			dev_err(sup->port.dev, "unable to pause DMA transfer\n");
   965	
   966		/* Disable RX DMA - incoming data will wait in the FIFO */
   967		sup->dmacr &= ~UARTFCCR_RXDMAE;
   968		lrw_uart_write(sup->dmacr, sup, REG_FCCR);
   969		sup->dmarx.running = false;
   970	
   971		pending = dbuf->len - state.residue;
   972		if (WARN_ONCE(pending > LRW_UART_DMA_BUFFER_SIZE,
 > 973			      "pending %zu exceeds DMA buffer size %zu\n",
   974			      pending, LRW_UART_DMA_BUFFER_SIZE))
   975			pending = LRW_UART_DMA_BUFFER_SIZE;
   976		/* Then we terminate the transfer - we now know our residue */
   977		dmaengine_terminate_all(rxchan);
   978	
   979		/*
   980		 * This will take the chars we have so far and insert
   981		 * into the framework.
   982		 */
   983		lrw_uart_dma_rx_chars(sup, pending, dmarx->use_buf_b, true);
   984	
   985		/* Switch buffer & re-trigger DMA job */
   986		dmarx->use_buf_b = !dmarx->use_buf_b;
   987		if (lrw_uart_dma_rx_trigger_dma(sup)) {
   988			dev_dbg(sup->port.dev,
   989				"could not retrigger RX DMA job fall back to interrupt mode\n");
   990			sup->im |= UARTIMSC_RXIM;
   991			lrw_uart_write(sup->im, sup, REG_IMSC);
   992		}
   993	}
   994	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
