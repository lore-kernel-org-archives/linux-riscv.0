Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AA8C55ABF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 01:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tx/lladTZBYU5zcU3IDSbSJza1QkhTC9R5gAPfrVTfA=; b=l8KlCuADegi40c
	LyMvka6YdLIDu7V7hO2AB2Sxqb13Ow+tqoOVDzdPHmJJgsRkKs4IZIS1LyMY/jWmXXFSdprGlvoWY
	QQztGKpcIEEM1u8gM2z55fGU7fD4wBPPdXC7gZsL+rjP/NOA9iRsoCm3/Z7flHKotkCmzdzbDC8nM
	iQ1IXKj1WG5C+ZdenFwaRyeSWHjRYN5q1A/QMfvZH7SwgLTYh4n3JldzS08aVKbZnSLw10t4vlF7U
	baTZvPt4TZS+4PSlWV+E4J+omFKELF4/HE3aHztqGfVpEKeiSSccIXRFJbhd3wLFrhcoP5Q1iu36n
	0hfO/uTbRBbYco+G9jKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrmnL-00000004l2s-3SfT;
	Thu, 06 Aug 2026 01:21:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrmnK-00000004l2U-1GGR
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 01:21:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0090160A63;
	Thu,  6 Aug 2026 01:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0961F000E9;
	Thu,  6 Aug 2026 01:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785979272;
	bh=hDGqstzzjBKEwA87lDJOzh7sqG1Xvv3RgfgKzbRXTKc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ZuJaJ7CaSUNULH/y7SLUAu0fEGbuBeEu7FyezYtiybDTQ8Pa/foOX0STx0NeHytEb
	 l93xuHs0Z+E9Z7Vc/TnyskljCazpEUdompRI91EEwPFabhE6+bBP8onlxT+Y0OXKEG
	 iGa3n1WDx51n1WNF7xMhNBB9O+udscqJ0jggSotCNIJ/GrhzNzapRPgXUBj59cK3jW
	 6+W+4GyKkPhv9+fOjnWBBMecce3rdE441E4hgON18UuyHDU4ggVzAZZ389yLe/x9/T
	 ikjF9UEL2cNoxo++KOjOxXCBf+/WmS2FEyqCt+5JakJ/b0bHxqVS/Ii3Y4nN3zfgD0
	 tKbEbA80Pc0ag==
Date: Wed, 5 Aug 2026 19:21:02 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Drew Fustini <fustini@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, Adrien Ricciardi <aricciardi@baylibre.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
    Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
    Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
    Chen Pei <cp0613@linux.alibaba.com>, 
    Conor Dooley <conor.dooley@microchip.com>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, 
    Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
    guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
    =?ISO-8859-2?Q?Kornel_Dul=EAba?= <mindal@semihalf.com>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
    Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Peter Newman <peternewman@google.com>, 
    =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@ventanamicro.com>, 
    Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Tony Luck <tony.luck@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, 
    Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
    yunhui cui <cuiyunhui@bytedance.com>, 
    Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 3/8] riscv: Add support for srmcfg CSR from Ssqosid
 extension
In-Reply-To: <anOiJHmU24Lpbizi@x1>
Message-ID: <c6d85325-7ba6-57f3-62e0-9ae843c98cf6@kernel.org>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org> <20260729-dfustini-atl-sc-cbqri-dt-v6-3-7c22b05d461b@kernel.org> <3b6dd35e-dabb-3cb0-547f-0c8a0b035e1a@kernel.org> <anOiJHmU24Lpbizi@x1>
MIME-Version: 1.0
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

On Wed, 5 Aug 2026, Drew Fustini wrote:

> Thanks for queuing this patch. It is okay to leave out the READ_ONCE()
> since only Patches 1-3 are being applied.
> 
> The READ_ONCE() is meant to pair with the WRITE_ONCE() in
> resctrl_arch_set_closid_rmid(), which comes in patch 5. RCID and MCID
> share the srmcfg csr, and resctrl can update thread.srmcfg from another
> hart while this task is switched in.

OK thanks, that makes sense; I've put it back. 


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
