Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C684C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9zrbX5kktGrjkFOqsko1RLXVq0ShPECauPQDtkQ48HU=; b=OdLI0ibIX9fU4p
	J/WteUVEi5sBWV8u8heGMGbB1VBUByp5vrRBDaOPNxBg3Q16oiJ/npMcYHijZo+oDv5SAChpXAQwF
	hYHEsnQit/DcwcTGfgokTbRiA5EuVMrZNt1AYdFa/B7bgSqTI/ttNHrVF/1WJ46x5Acv14J6GR9kI
	OTEtwcoXYGjqDCiOqUiSFGX5zO6rzm6rAhS1nwGlrD/N8cFGywioB3iv2nMMpzmckaV1bOeVRfKEA
	drBc6qzmJ0UNssm2XaM9E2SX7ks5Um8guGNVa2ckcsfeYWrhG674pFZTvO2PEfKGrW/Ff97XZS8s5
	bSIBh0OAlMqT9whkqymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osR0Y-006ar7-QN; Tue, 08 Nov 2022 15:59:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osR0O-006apv-3u; Tue, 08 Nov 2022 15:59:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E6E61FB;
	Tue,  8 Nov 2022 07:59:18 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F12263F73D;
	Tue,  8 Nov 2022 07:59:08 -0800 (PST)
Date: Tue, 8 Nov 2022 15:59:06 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gavin Shan <gshan@redhat.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH 1/5] cacheinfo: Use riscv's init_cache_level() as generic
 OF implem
Message-ID: <20221108155906.3pssiipdfrm55q56@bogus>
References: <20221108110424.166896-1-pierre.gondois@arm.com>
 <20221108110424.166896-2-pierre.gondois@arm.com>
 <Y2pirStbsJOidAkz@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2pirStbsJOidAkz@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_075916_240120_60BCF621 
X-CRM114-Status: UNSURE (   9.67  )
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

On Tue, Nov 08, 2022 at 02:07:41PM +0000, Conor Dooley wrote:
> On Tue, Nov 08, 2022 at 12:04:17PM +0100, Pierre Gondois wrote:
> > Riscv's implementation of init_of_cache_level() is following
> 
> heh, "Riscv" always looks a bit odd!
> Code movement looks fine, nothing surface level is broken on RISC-V.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
Thanks for the review and testing. I was planning to ask Pierre to cc you
next time but you seem to have covered that for me :).

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
