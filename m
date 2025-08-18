Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4DDCA0EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Bw3RUPg8xnieMKMpFPwnjfU1r2YZU8uk3A/jy0Onzhg=; b=E7pcDe41OodZv4
	BHcHImVIji3re25ws8OIjvYiEjxMr77OjeYEIhRtYNCkpeHwN4rFblKvpBHBv9kcuBgB+D+J9CmQk
	fDfuP2S5/RnXYDmzLvL/2yxVOywiwvtDSa5HXDxgHNANV7yz9FHcJ4CEl3cum7/TRMi2JarZLVq8C
	uKwG/QO5zUIEa1NRSGbmCsJ/iwtWqaDBAq0aXvNzJLkxcBgYp8cGTYKKfHWbIX9u34h5gZEN/vVh2
	sQmuAXLETX911VkPoQ+h07uA711VN7bGAsg2XHoK1fwZa512+BioCHWYFIhXNmB/zHe/pNz7mBaFG
	CC8H/rfO6HItx9+mO0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuea-00000006plG-1FuV;
	Mon, 18 Aug 2025 07:51:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unu7e-00000006m7D-22Dn
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 07:17:39 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3b9e415a68fso3607887f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 00:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755501456; x=1756106256; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=00HmFiTKWlOUviqLOmDiviucp/G1KSLyabeRXjoLhH4=;
        b=QmOmOXoRfJ6PaTW7K4rjdAVBKXLOJubqB8vF9CXo/UXsbh/+7QSwkEvkiOfRwPKUpf
         9US1dOgbbNX3feoFYjnPfKzPxpgliXndcmeJT8mW/jM3VZ/wA+HkcPotdX88P9H4ck2K
         jE3WXqhwavnRH2XA1rDA7mdgOCCNU1gJtbKOFFXFFhFpbIl46j4VS5dJgHCElnde+edg
         CwIM0VGLRjDq9MLcju4IMtVUXoOd4btaGE0LVBlgsmucwysh4DfLyaqvr9w4+grjhXYq
         gB35A9WjRT56rzOYe+W3RZnE+hYPgObiXEnklZWpTIdwbVv5TB1GQ12buxy37/Xqt6uX
         HeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755501456; x=1756106256;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00HmFiTKWlOUviqLOmDiviucp/G1KSLyabeRXjoLhH4=;
        b=w5UB8mG8nCToZMDvrrSU4VGp2kOma8l4cUsQ7sR94HI0m7IvsyFgNuXlF43xm0hVFY
         Qe8yihQtcU75QANYU2v4W/FHM9qoCh1z91vJHL+mZjWSJuUcMuPCJnLpJVJs6pZ6GbnT
         n6K6hgQQXf+71OGyMEJ/NgRwcwZYnrQ+G1MNYSTRd3rb5MZ4ZqOEkjvNyGJvLDBlbOfz
         vdlSpnl0dF9YVoFS+HFxe+4NjoOwlh9KSj0HO5XfqTp5P7ItJNCP0aLydRJDytZKljwu
         qDQVGHxg3v+CC5gTl6wJKnSd45nAgFce6qZL5Nf1QIjJ7Y84Vh4bk/iUIPD6eGTwJG6K
         56eA==
X-Forwarded-Encrypted: i=1; AJvYcCV5yA1VHQCDSPr/7+udyJpJQs3T55O995KFqFNqBdTt0DCNwrqS0cn/Tr/fHLwLRmglAxq7CoFJlBul1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPwiGYmqWq+8W4D/QSW/SdRQG8Pa2JIB6EvP77Lf3yBig8yX2n
	nwkPe9/5xF1vmyByzWIJ05nyzshK+36izAhn8HQfeM4BO+wJ75dTheu8BpDRrtKezq8=
X-Gm-Gg: ASbGncu/M2JY1f+o+pRkYW4mGzL39VhFqDyz7WeYRiAdxoNSMfSmmjZRfWUWQmZVtMW
	PamI7fUojIRR9RCbz0OcmoRx+t0cIGAc5QG8JHCLbcqYixZyaVdo8RmBb40U4N6KtsjFIjvVIN1
	SLcFoq0e2F7ED3/HiuKZFxvAJeicVIWo2MtIM6jWM5mUy+s57YrEY41EGv/j9X2sTc6jM+gBYUt
	YYIJLPWL4K0xaextKs6CPh5lnGVu9feBDTZRp4wrTndqFXVm30hJN3/EHXb6dZWpRXJK4kzIPMW
	JJ4TRzWmCkmZIEvG5cOie6KKr7WRUFTeMIgBdnpAUm9hkh+ZrGifPc+fCwcq6V4NTlIHsM6Fvee
	dRdwg6nhTgIdfW8rBYHtZFBl8KMUjEgpslcvGH8p8WPw=
X-Google-Smtp-Source: AGHT+IHyrx5So2JkHy8B3V9n10eIVkllRTMcnOfbIYL9Fak+QjG/0EyC3RMUePQ7ZAM0RE6YfPigZA==
X-Received: by 2002:a05:6000:250c:b0:3b7:8473:31c3 with SMTP id ffacd0b85a97d-3bb6646e10amr7831271f8f.9.1755501455230;
        Mon, 18 Aug 2025 00:17:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb67c902dbsm11683675f8f.47.2025.08.18.00.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 00:17:34 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:17:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Guodong Xu <guodong@riscstar.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	duje@dujemihanovic.xyz
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Elder <elder@riscstar.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Guodong Xu <guodong@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v4 4/8] dmaengine: mmp_pdma: Add operations structure for
 controller abstraction
Message-ID: <202508181040.az8RxLrG-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250815-working_dma_0701_v2-v4-4-62145ab6ea30@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_001738_544435_AFC21B03 
X-CRM114-Status: UNSURE (   9.68  )
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

Hi Guodong,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Guodong-Xu/dt-bindings-dma-Add-SpacemiT-K1-PDMA-controller/20250815-132049
base:   062b3e4a1f880f104a8d4b90b767788786aa7b78
patch link:    https://lore.kernel.org/r/20250815-working_dma_0701_v2-v4-4-62145ab6ea30%40riscstar.com
patch subject: [PATCH v4 4/8] dmaengine: mmp_pdma: Add operations structure for controller abstraction
config: parisc-randconfig-r072-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181040.az8RxLrG-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508181040.az8RxLrG-lkp@intel.com/

smatch warnings:
drivers/dma/mmp_pdma.c:546 mmp_pdma_prep_memcpy() warn: variable dereferenced before check 'dchan' (see line 542)
drivers/dma/mmp_pdma.c:712 mmp_pdma_prep_dma_cyclic() warn: variable dereferenced before check 'dchan' (see line 708)

vim +/dchan +546 drivers/dma/mmp_pdma.c

c8acd6aa6bed3c Zhangfei Gao     2012-09-03  536  static struct dma_async_tx_descriptor *
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  537  mmp_pdma_prep_memcpy(struct dma_chan *dchan,
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  538  		     dma_addr_t dma_dst, dma_addr_t dma_src,
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  539  		     size_t len, unsigned long flags)
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  540  {
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  541  	struct mmp_pdma_chan *chan;
918da7ee50b22b Guodong Xu       2025-08-15 @542  	struct mmp_pdma_device *pdev = to_mmp_pdma_dev(dchan->device);
                                                                                                       ^^^^^^^^^^^^^
The patch adds a new dereference

c8acd6aa6bed3c Zhangfei Gao     2012-09-03  543  	struct mmp_pdma_desc_sw *first = NULL, *prev = NULL, *new;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  544  	size_t copy = 0;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  545  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03 @546  	if (!dchan)
                                                            ^^^^^^
But the old existing code assumed dchan could be NULL

c8acd6aa6bed3c Zhangfei Gao     2012-09-03  547  		return NULL;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  548  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  549  	if (!len)
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  550  		return NULL;
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  551  
c8acd6aa6bed3c Zhangfei Gao     2012-09-03  552  	chan = to_mmp_pdma_chan(dchan);

[ snip ]

2b7f65b11d87f9 Joe Perches      2013-11-17  701  static struct dma_async_tx_descriptor *
2b7f65b11d87f9 Joe Perches      2013-11-17  702  mmp_pdma_prep_dma_cyclic(struct dma_chan *dchan,
2b7f65b11d87f9 Joe Perches      2013-11-17  703  			 dma_addr_t buf_addr, size_t len, size_t period_len,
2b7f65b11d87f9 Joe Perches      2013-11-17  704  			 enum dma_transfer_direction direction,
31c1e5a1350ae8 Laurent Pinchart 2014-08-01  705  			 unsigned long flags)
50440d74aae318 Daniel Mack      2013-08-21  706  {
50440d74aae318 Daniel Mack      2013-08-21  707  	struct mmp_pdma_chan *chan;
918da7ee50b22b Guodong Xu       2025-08-15 @708  	struct mmp_pdma_device *pdev = to_mmp_pdma_dev(dchan->device);
                                                                                                       ^^^^^^^^^^^^^


50440d74aae318 Daniel Mack      2013-08-21  709  	struct mmp_pdma_desc_sw *first = NULL, *prev = NULL, *new;
50440d74aae318 Daniel Mack      2013-08-21  710  	dma_addr_t dma_src, dma_dst;
50440d74aae318 Daniel Mack      2013-08-21  711  
50440d74aae318 Daniel Mack      2013-08-21 @712  	if (!dchan || !len || !period_len)
                                                            ^^^^^^
Same.


50440d74aae318 Daniel Mack      2013-08-21  713  		return NULL;
50440d74aae318 Daniel Mack      2013-08-21  714  
50440d74aae318 Daniel Mack      2013-08-21  715  	/* the buffer length must be a multiple of period_len */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
