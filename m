Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3941C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 14:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mM8OCTtoEaPewl0XM8IN05WhJWYcJm70qaCjagRoaPw=; b=PlgEbJhQcuD+/C
	4A0lmVEuQyHORZ2pPy1zyCX2fQCEgQYy56OisadCHJTdVqoK88D/ulcvbjpVsnxXlZs2U9a+xrUc8
	1DrVNpQFRcmANmrXgRDpSofp4CED4T1N5R02M3webB80Ttup4KW8nSHa1av5jHK07Jg+W8tHpzNxh
	A+L/PKCuqAY8rfvOZMrsaVz/EqtMHWIGuE0TcHMTo44dbe8FfMhcqyo142scdDylXBbb6NdVFJYEA
	zHxfbtTdKq7SjyC4GNCazX01O8VUYXg29LvxVLhw7wEbnwbl5L37kOnWR4MsYOhhYGJuodMVC9eJw
	HMQVn1fbO2VcNBbsvtPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhAg-007fsT-UQ; Wed, 25 Jan 2023 14:54:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhAW-007fqV-6b; Wed, 25 Jan 2023 14:54:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB1E74B3;
	Wed, 25 Jan 2023 06:55:09 -0800 (PST)
Received: from bogus (unknown [10.57.77.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB89D3F71E;
	Wed, 25 Jan 2023 06:54:25 -0800 (PST)
Date: Wed, 25 Jan 2023 14:54:23 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gavin Shan <gshan@redhat.com>, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arch_topology: Build cacheinfo from primary CPU
Message-ID: <20230125145423.pid3hsstswzuez73@bogus>
References: <20230104183033.755668-1-pierre.gondois@arm.com>
 <20230104183033.755668-7-pierre.gondois@arm.com>
 <CAMuHMdUjgxgOXf5He1x=PLn7MQTjZgFQUHj8JrwbyweT4uOALQ@mail.gmail.com>
 <20230124140420.4srnufcvamvff77v@bogus>
 <Y8/tl999NQwbPL/R@wendy>
 <20230124144839.2szjjv256j3pdaif@bogus>
 <20230124145541.2xwtr7ro2bjnsjd7@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124145541.2xwtr7ro2bjnsjd7@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_065432_301725_3E4E0379 
X-CRM114-Status: GOOD (  10.18  )
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

Hi Geert,

On Tue, Jan 24, 2023 at 02:55:41PM +0000, Sudeep Holla wrote:
> 
> Geert, can you please try with the patch Conor pointed out and see if
> that helps to fix the allocation failures[1]
> 

Sorry for the nag, but did you get the chance to test -next with [1]
and see if it fixes the cacheinfo memory failure you were observing ?

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20230103035316.3841303-1-leyfoon.tan@starfivetech.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
