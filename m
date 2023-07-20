Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C97EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 13:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZGqMCZvys3E0OsE3W4ZRww2WOJhmMu+hUtdU4+2EJg=; b=DMhNJsvhTpYbJ7f+hnozEfyKhB
	Htg1mEaZdrUISgdTz5LZPX30VR7yoyGVoqOJFj7hucpnd7V9LL/gjH/75BpbemPx+pnJXGvLLSXWu
	6/jr78ZbwdVBSHGtxzgmNZeEJ2aGxkDmNLl2H3gxKY7josq63kI7RalPn5BGQtHgVGFQyj7nB46Rt
	kjRYxaT7c0L4++1JydgAVz65Auem9dvwP05R6B6fdeWXksUnmWXEVvj3wjJfSR0FNJf3YNNH6nNtI
	T1GYLx7pVsIqEsdi6O0+aYKDNgPchNTPVcrLaC/l7f+JhzxVpUEETctF0QubtqKtUrlKrZ5D0WhvM
	LsPV8Xgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMTYB-00BEkf-0l;
	Thu, 20 Jul 2023 13:18:35 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMTY8-00BEkL-2t
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 13:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689859112; x=1721395112;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=StnBaGaOlRqqTLgANOZt5SAXy2wagVOHiKTaAVKHt2Y=;
  b=caCTYeH70vy8pxTJ2Zmy0MMiVf436Vr5C9+6bWhSM8rW4vN0QDtAVyMX
   2gWlSjceYppgxb2erBt0fjxOYCQK1BQs8RT2JVyMY7KCURYzY0VaA9TNz
   FsLWiWx1SVYL5a+RxnekpDnMmAXnXDDYuJeUzTIUTjczkNr4LJKWscrSZ
   hEbXuTigISGCSfjuuVNchbcPNINmY0ywMzEjPsl/x4vPtQe+baKs6o97E
   opnzI1Hby8RxvsssYWjW30tcq0Rpi3jFGqzl5bqTF9IX7j0qQd5vzeFx8
   0jIQB0dpfxw+SeYk/pv8PoJS1FLchE09nwdJ+dC0cToLE/un7tEMeJzbj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="370297819"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="370297819"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 06:08:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="727684950"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="727684950"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.191.109]) ([10.252.191.109])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 06:08:28 -0700
Message-ID: <d766f11f-45a6-9d47-3bfb-b3632a0b0f0b@linux.intel.com>
Date: Thu, 20 Jul 2023 21:08:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 06/11] RISC-V: drivers/iommu/riscv: Add command, fault,
 page-req queues
Content-Language: en-US
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <1fd79e5c53d9d6ed2264f60dd4261f293cc00472.1689792825.git.tjeznach@rivosinc.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <1fd79e5c53d9d6ed2264f60dd4261f293cc00472.1689792825.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_061832_987337_DA3818A6 
X-CRM114-Status: UNSURE (   3.63  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2023/7/20 3:33, Tomasz Jeznach wrote:
> Enables message or wire signal interrupts for PCIe and platforms devices.

If this patch could be divided into multiple small patches, each
logically doing one specific thing, it will help people better review
the code.

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
