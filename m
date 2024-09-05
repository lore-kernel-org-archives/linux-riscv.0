Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C84ACD4F5B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 08:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijYc7hKix3l5/BKLF5b9EIF41IHd4efkyTYQ7tNTUYY=; b=dAgPY5nXp20rXx
	Zy4xkOUAl+c/pdnb7iHvKJkagOB1UzsSLO41W0AaJBUVc6S72rjQX8zO3PZmjDWtrULKZxe1nEN9+
	xBua8iMetTU53soYDx8OjNjIeeVBeug7IXl2+lPTLuCSuktNW3yXW17bVS6Y3WRRU1JO8YazN3PtS
	xztVOWpLAo2cO9Z51LsmRs7F7Nrks+HvGIdGvQQXmyLjJAYn6YNpB94b3yszVG9OCmpN7IfWLyd4l
	6226Qi63o7jxRJnixcJg2Nf34Tmxa/MZ8y5G1GQFJIYl8ci0HbXc8DwHrZTuC8uMYcUfi4tbLTG+Z
	flNZJZJbwPF/NFrd0Acw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7hd-00000007XOZ-42nS;
	Thu, 05 Sep 2024 08:18:53 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7hA-00000007XHT-48YU;
	Thu, 05 Sep 2024 08:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725524306; x=1757060306;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MxbG1NFAO2hA0Y81lnNJT1+jSGtQoe5Vz9VbrJuDz5M=;
  b=RbWOCf0zlHu9mzAfpffAKif9gEAVyE6l/sahEeqTtkWhXoad6SKvotzM
   B1ay6NWX0uzkbqNwTYMsHzGdVSXRwRZ8183CLqVhqGMJU6ErMGwhhTke/
   dq6XVzq4D1FR08hxywpqUEyV/P/F4vtsfMlj0V7FoVE8V4co2HNOvRM85
   Ky1rRSyVEGXq0UV7PFC/gJ6bQjBks0J/6gFAGZ/4OdMX2iLDzYqHdGCqL
   slpJUHtif6VdjDQyS5E5v9AQ+UXUPLEavW1PXCNcWaQMItecaWN1eocsl
   K8mysfHbVAmUniJL4W9WOz8v+Bi/97JOUZjsO0gd7ZicW1/lGa0DfF0O5
   g==;
X-CSE-ConnectionGUID: w9uC2ArHRPaVzGWjCopi1w==
X-CSE-MsgGUID: QBWbkpS/S3mhNyrgZXgbEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24383599"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="24383599"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 01:18:24 -0700
X-CSE-ConnectionGUID: zUECY1JsTCytv0zNGU91zg==
X-CSE-MsgGUID: 3BzHH7e7Syqb+WqtcOa6iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="65242627"
Received: from mylly.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP; 05 Sep 2024 01:18:16 -0700
Message-ID: <6cbdf44e-7346-4463-a622-7810706d5419@linux.intel.com>
Date: Thu, 5 Sep 2024 11:18:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] i2c: designware: Group all DesignWare drivers
 under a single option
To: Andi Shyti <andi.shyti@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, UNGLinuxDriver@microchip.com,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-snps-arc@lists.infradead.org
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
 <3phynd24wmymhqugikbdwdzoa6vlzxwv5a6n6bk4446atbf7nu@c2kb766j3pcc>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <3phynd24wmymhqugikbdwdzoa6vlzxwv5a6n6bk4446atbf7nu@c2kb766j3pcc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_011825_102782_B7EB69EF 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/4/24 12:01 AM, Andi Shyti wrote:
> Hi Jarkko, Andy,
> 
> ...
> 
>> Heikki Krogerus (7):
>>    ARC: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
>>    ARM: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
>>    arm64: defconfig: enable I2C_DESIGNWARE_CORE with
>>      I2C_DESIGNWARE_PLATFORM
>>    mips: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
>>    RISC-V: configs: enable I2C_DESIGNWARE_CORE with
>>      I2C_DESIGNWARE_PLATFORM
>>    net: txgbe: Fix I2C Kconfig dependencies
>>    i2c: designware: Group all DesignWare drivers under a single option
> 
> I believe you know this code already, do you mind giving it an
> ack?
> 
To the patches 1-7/7 in this set:

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
