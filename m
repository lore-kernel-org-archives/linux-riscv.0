Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F18CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 07:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=g4cNZCcgqp5qayvdFJOfLanF3ukxW8It/edZCAAUpbw=; b=xnJTSRGxehQQBS
	8JIBzN3KmjbYeISZHldUkZ2nG8zp5iy32gyfK8jozY26Im90C/sNaHgsxfEDJYUa6TakDW8RvgD3N
	Lb8sWkISSvDs77oar5g9wJhQmYuEgMI0bMA7wo25TC8HqpoZhWX0G5ZgpHhVQs1aHI53tcmb7foQ2
	NfQ/igMsrv2GYgT2pR7pmkvOp3JAlBwfLnjM94GI3mMV9BH5kLR60/9DqJ7kzpts3ILdfSjymsnML
	HV6IKtIGTqvZrlfcrEXD5MGP6DCDjPHACSqxPjUzIUB3WdP6MDBb9QEQjKX6sWInQYAD4W3AjQ5H/
	8Wp57ut4vWdRY8/Huy3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ZXl-0000000FT2P-3JEi;
	Tue, 14 Oct 2025 07:34:01 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ZXh-0000000FSzX-3pGJ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 07:34:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3f0134ccc0cso3774013f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 00:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760427235; x=1761032035; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BwG/OchAZjwNRXsTLu0s9JIZNQmUXDtfcvX6l0dZWYY=;
        b=t54ZofPs+FGGU1VQNlj4Ljd0cVmdzgQNXsEsrQgTYBLL0HPCv07K7sP3q2GszolaTN
         1HeTMwc5QJmx94tbpwDMSq10etKjs07Z2/SEWDnooxT1Cg65nJ+uYM9unI+Hn+o4ieYa
         SukzSGDShb27P5QFficFX3G9qYklWbRJ7QekQVjt0ziPVYT7EQ78cpz1EInFIg2xliCR
         B28hffQ3AotYnsEasyq3lt9G/IMjsoc0WQkdxSH/fqzvT75efiCMFfzEhNELTvzxCrfh
         Q4VLSBTmkB7iYILWG2FtXDPr33s+X3O7kMDzb05FSSg2AijKPAMvcEivUr2e2/C4jIe1
         Kpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760427235; x=1761032035;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwG/OchAZjwNRXsTLu0s9JIZNQmUXDtfcvX6l0dZWYY=;
        b=TDq5aKLZ/CaXQlt3UwlzXHgYiKvXxEeK2DgAp08nWsgdhOYYF5KD8VFsClKabn/heO
         4KihEZDO4OYAFtnyODBX/P8CFfM9YApseRlFrdP11a8+T01ec5sxX0kMxlu/VkT2MGcU
         khGjH3Z6KaZ2ZY7Bi9Yh4LXqOXn9zIkZMxNAYsQCqaLaYf+F3zO8sjSbQvs5bpmIfJsR
         UeqPX0VpjHS1ATQvxgsNNJGwQsFoRFR84Fw1zGZ4kS4mfn5ivrHVChXGTZbio9wnjY+m
         0iGbXsQcPfJH7wi5fcrU+IY23TIdByI3Vo/r1lxvVb59ld2zuWjjW5DBPKkQj0bK1yxu
         9ZNA==
X-Forwarded-Encrypted: i=1; AJvYcCUviFiFm00EaUydN3J5/cwMsDGpKVfXyiatwUz7qN1gbH6Yb81fG6TDKZneX/gfTjkyuodkuIwp3AW4nQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwggSuFol6sRVbUD+FpUsIe1GmY4hmpWwAU/kVHsEnf6KhPTNKG
	ladMUaBjUpOETOGnh+p6cYV+pogtbHAcWSnbWYZXlMRtS4nKDN5hYqGupoIpF5oZrZY=
X-Gm-Gg: ASbGncsrox+73kruYklt3ws/O23wJTFvJBL3sYZ2HISRhkBAH4CfzUsRI78rECnieM8
	QKbN7sEUANZC5CZkJL+1ZEFn8I/Y2WkqVpK1d94T2wGtotsTfxU9kVvmHKZ3XWgiuiHWWwHZImU
	gHSL0XjDzEZZwMp43d1tYv0dg1kcCGBDHi5n83Cb/pRJuYI1V8HxB3/0lcxdyrChX/FQdYHtp4R
	/yXf3Zzo4cdi+uFWgHj7yz0CavOyFIrbr9M6R9xzb5F/iG6qSmdplbiAIBhyOmX9QAVBjqtqCFG
	0MJS11OPUpYqy7XXVWvEw7m61nXJ4mSm/pCMpT4IZDDNkNQZgZiKHz6SxxrVcA8SPSMpg674OwM
	GsWD4HIA4bXM9xZZHrUviMX9alAJdwMGq3+tIRlsQzJrxcCWDPNY=
X-Google-Smtp-Source: AGHT+IE0SibgFOUsTOWb11Xe06KS5AooYnMfuV3qZwF21RGoTYuiMhvM5xxFKgxQQAvf0jDG3bRS2A==
X-Received: by 2002:a05:6000:1ac8:b0:3f7:b7ac:f3d4 with SMTP id ffacd0b85a97d-42666abbbc1mr17933769f8f.5.1760427235501;
        Tue, 14 Oct 2025 00:33:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426ce5e8a06sm22182799f8f.55.2025.10.14.00.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 00:33:55 -0700 (PDT)
Date: Tue, 14 Oct 2025 10:33:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Randolph Lin <randolph@andestech.com>,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alex@ghiti.fr,
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
	ben717@andestech.com, inochiama@gmail.com,
	thippeswamy.havalige@amd.com, namcao@linutronix.de,
	shradha.t@samsung.com, pjw@kernel.org, randolph.sklin@gmail.com,
	tim609@andestech.com, Randolph Lin <randolph@andestech.com>
Subject: Re: [PATCH v6 4/5] PCI: andes: Add Andes QiLai SoC PCIe host driver
 support
Message-ID: <202510092111.fZmvx6jO-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251003023527.3284787-5-randolph@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_003357_988460_3A3BBE23 
X-CRM114-Status: UNSURE (   8.26  )
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

Hi Randolph,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Randolph-Lin/PCI-dwc-Allow-adjusting-the-number-of-ob-ib-windows-in-glue-driver/20251003-104100
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251003023527.3284787-5-randolph%40andestech.com
patch subject: [PATCH v6 4/5] PCI: andes: Add Andes QiLai SoC PCIe host driver support
config: powerpc-randconfig-r071-20251009 (https://download.01.org/0day-ci/archive/20251009/202510092111.fZmvx6jO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510092111.fZmvx6jO-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pcie-andes-qilai.c:157 qilai_pcie_host_fix_ob_iatu_count() error: uninitialized symbol 'ranges_32bits'.

vim +/ranges_32bits +157 drivers/pci/controller/dwc/pcie-andes-qilai.c

816cad1ac60166 Randolph Lin 2025-10-03  133  static int qilai_pcie_host_fix_ob_iatu_count(struct dw_pcie_rp *pp)
816cad1ac60166 Randolph Lin 2025-10-03  134  {
816cad1ac60166 Randolph Lin 2025-10-03  135  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
816cad1ac60166 Randolph Lin 2025-10-03  136  	struct device *dev = pci->dev;
816cad1ac60166 Randolph Lin 2025-10-03  137  	struct resource_entry *entry;
816cad1ac60166 Randolph Lin 2025-10-03  138  	/* Reserved 1 ob iATU for config space */
816cad1ac60166 Randolph Lin 2025-10-03  139  	int count = 1;
816cad1ac60166 Randolph Lin 2025-10-03  140  	int ranges_32bits;

This should be bool and initialized to false.

816cad1ac60166 Randolph Lin 2025-10-03  141  	u64 pci_addr;
816cad1ac60166 Randolph Lin 2025-10-03  142  	u64 size;
816cad1ac60166 Randolph Lin 2025-10-03  143  
816cad1ac60166 Randolph Lin 2025-10-03  144  	resource_list_for_each_entry(entry, &pp->bridge->windows) {
816cad1ac60166 Randolph Lin 2025-10-03  145  		if (resource_type(entry->res) != IORESOURCE_MEM)
816cad1ac60166 Randolph Lin 2025-10-03  146  			continue;
816cad1ac60166 Randolph Lin 2025-10-03  147  
816cad1ac60166 Randolph Lin 2025-10-03  148  		size = resource_size(entry->res);
816cad1ac60166 Randolph Lin 2025-10-03  149  		if (size < SZ_4G)
816cad1ac60166 Randolph Lin 2025-10-03  150  			count++;
816cad1ac60166 Randolph Lin 2025-10-03  151  
816cad1ac60166 Randolph Lin 2025-10-03  152  		pci_addr = entry->res->start - entry->offset;
816cad1ac60166 Randolph Lin 2025-10-03  153  		if (pci_addr < SZ_4G)
816cad1ac60166 Randolph Lin 2025-10-03  154  			ranges_32bits = true;
816cad1ac60166 Randolph Lin 2025-10-03  155  	}
816cad1ac60166 Randolph Lin 2025-10-03  156  
816cad1ac60166 Randolph Lin 2025-10-03 @157  	if (!ranges_32bits) {
816cad1ac60166 Randolph Lin 2025-10-03  158  		dev_err(dev, "Bridge window must contain 32-bits address\n");
816cad1ac60166 Randolph Lin 2025-10-03  159  		return -EINVAL;
816cad1ac60166 Randolph Lin 2025-10-03  160  	}
816cad1ac60166 Randolph Lin 2025-10-03  161  
816cad1ac60166 Randolph Lin 2025-10-03  162  	pci->num_ob_windows = count;
816cad1ac60166 Randolph Lin 2025-10-03  163  
816cad1ac60166 Randolph Lin 2025-10-03  164  	return 0;
816cad1ac60166 Randolph Lin 2025-10-03  165  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
