Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6341CE7719F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 10:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4RE/b1wIJXJXxU65m8wXgHc+TsP9burYOnHphO25gE=; b=tewpRXPkGQzjHK
	5nX0FIRMa7b+KdYzmQa1Syjk1AAjyOuIyePWieOf6AUBpR13ExyqZOgWHWRXAigsxn9zcLD+yHjj1
	RH24YKsWe9GlbucpVCwxZsafSitoahAAg5wZR9x3VsypbHoHriIvMJerdpqwlEKez+f0SKD4Kl8JR
	oxHyup8payxdNoWeLGfNL5edQfchRSVbV4jg5o9S1J6DNay1fCDyU9gAyjox6HSkcZL7DWlrs35Ql
	6QKgIrEhrxWsYMQSmy9vDSWTZnzkqsdnJ/TiYRP5+BVyMPk215AJ7Ae2/Zl1PyGgIbk/5hf5Mllfz
	8Lg7+cf7b3j+6cjCfO/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHKV-00000004jVB-2LFV;
	Mon, 13 Jan 2025 10:05:55 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHIB-00000004ix2-3sEm;
	Mon, 13 Jan 2025 10:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736762612; x=1768298612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yOi1Bdox+5zsBF06a/0GQ4AAYxWD4N4tKTWcnJAm4ZQ=;
  b=kby3sNRCE8JqI2wvO5I5R2eT+jDIAFiSvdRRfQf/1eMrBtoVR73ttDLa
   BxrFqez4NFZ2X/sRDDQzcw1J8K+JxXz/t+5g8b4V6xLlpwtTwZ9CuTXRq
   W1yBoTvzWLpXAIl6DXueeSC55oyFkJSf9/GrMWBXkK3WPodTUvztuj1w6
   FmMn2zcB9QlwYiSyg1G2wvPPnWMKBjSbT3FhJE2APcnEpBI23U2gGdLec
   Icz0ua7gtCphZHaHcA4GzYlDNc+CugAp45BIodxMsiv9QV9odCq5a6MkE
   1NacL8sYBnQk/QYojnzfTuQ9oThlO1ZrltmTjmkLXtgElnJqcwP2x8HYv
   Q==;
X-CSE-ConnectionGUID: NV5bOUh7Sgaf1fqEX+eOgw==
X-CSE-MsgGUID: kwJLhPRPQuK17ISYP3GjiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="47589798"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="47589798"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 02:03:30 -0800
X-CSE-ConnectionGUID: vZ8ms0C0RmiJpI0bTAU8lg==
X-CSE-MsgGUID: y1Gp6sg0SE2iX8qgnePkGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="104382079"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jan 2025 02:03:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id E22CD331; Mon, 13 Jan 2025 12:03:22 +0200 (EET)
Date: Mon, 13 Jan 2025 12:03:22 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>, 
	Eric Chan <ericchancf@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kai Huang <kai.huang@intel.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Russell King <linux@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, 
	Suren Baghdasaryan <surenb@google.com>, Yuntao Wang <ytcoode@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCHv2 2/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as
 encrypted by defaultk
Message-ID: <ejh2llcaxahkgz3k2ji3b35dfdss3bfgztyhsfgtu6adejasr7@ajehr7ac3bp3>
References: <20241021105723.2707507-1-kirill.shutemov@linux.intel.com>
 <20241021105723.2707507-3-kirill.shutemov@linux.intel.com>
 <20241118164616.GAZztvWGs9cOV8t20_@fat_crate.local>
 <s4frmqwtuvclinuu7ttyzfpe7bj7hju5xgt6sxzy3gyt3prr62@rrgvhkv4lgwv>
 <20241121114952.GCZz8eYEVa3yubYQzO@fat_crate.local>
 <bz3vlh3lri7yfckdkddopwhsgvkmizhw5q6ecomgeba7q22ufp@ntu2kugiho4o>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bz3vlh3lri7yfckdkddopwhsgvkmizhw5q6ecomgeba7q22ufp@ntu2kugiho4o>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_020331_994221_A4635868 
X-CRM114-Status: UNSURE (   5.89  )
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

Borislav,

Is there anything I need to do to get this patchset merged?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
