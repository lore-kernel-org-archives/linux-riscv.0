Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FE3C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 17:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kh2EURLxhQU6VSV6PR5G49et/jlwDc5qlZLL1LBHEc=; b=Y6AH3U1jzQdYJT
	UIa3FnGU3ms6wKBMJxFwIcay4TatGMggFD65kjdm5sdR7DcYNGJwuDsdJesUABWG7/YHDfOyFyRzn
	sOBQRf3U6rfOsNWEVv1UXeIF+kEAfyw3JJrrDcLmV4OI2jluLekWrWfT5U6VnO3tC4RJ74DLgd7Vq
	NlRVycfvsMC6XspA62jxaPAAXHYvPFIG0q1+93IhCWPRswDjz3OVl0QSH0tAicIhAAELLbsR4AFyU
	A02qLMB5wl184JNUOTOqMnu3fXAAO4UfqGEsDGisYPN3+2i6nFO71qf59ypv1CiKSgxRDLv6WZw+8
	W/qI7B4GA/9/Tkp8W9hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSHs-00702M-Lg; Tue, 08 Nov 2022 17:21:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSHh-00700M-F1; Tue, 08 Nov 2022 17:21:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2804EB81B4D;
	Tue,  8 Nov 2022 17:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33235C433C1;
	Tue,  8 Nov 2022 17:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667928070;
	bh=DlMHpgYF6fEe5J2HjZk1J+WbnRi5LdPQe3AxBSfoBtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o6Cv5V6efM2n7JUbiYlknPcXf5YU+wsfF3ayVGOcCl6KzWjTQfpf9P/DxPBzki7xQ
	 w0H4anKjaubXltO/ORS0AxYyYWMUW02TpkK0lxtNWvEuNTJgxy5kI1HkytTAI3BRMZ
	 qAvnl6sZ56oXhnSc4GjGnL/EEuXmow5ZOmOh+AHCZcmB259ApGTdpLZJ1ZOS6P+ivR
	 pmlVeEFZZ3yQ8sIs02fhYwk5S6jOPy7jynVJbJcbOWbsadqc7XwcQoVD+0PiJOCjQG
	 C/CHCiih+Zy1HlFxwbn2gTA8HRZ2JKgNK6TfgHh2wnDl3aFbqqm+2mzG/YhPqBx/sv
	 mau3HKmmFbgJw==
Date: Tue, 8 Nov 2022 17:21:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-kernel@vger.kernel.org,
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
Message-ID: <Y2qQABd9Xsubx77Q@spud>
References: <20221108110424.166896-1-pierre.gondois@arm.com>
 <20221108110424.166896-2-pierre.gondois@arm.com>
 <Y2pirStbsJOidAkz@wendy>
 <20221108155906.3pssiipdfrm55q56@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221108155906.3pssiipdfrm55q56@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_092113_663063_86498DD7 
X-CRM114-Status: GOOD (  14.13  )
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

On Tue, Nov 08, 2022 at 03:59:06PM +0000, Sudeep Holla wrote:
> On Tue, Nov 08, 2022 at 02:07:41PM +0000, Conor Dooley wrote:
> > On Tue, Nov 08, 2022 at 12:04:17PM +0100, Pierre Gondois wrote:
> > > Riscv's implementation of init_of_cache_level() is following
> > 
> > heh, "Riscv" always looks a bit odd!
> > Code movement looks fine, nothing surface level is broken on RISC-V.
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >
> Thanks for the review and testing. I was planning to ask Pierre to cc you
> next time but you seem to have covered that for me :).

Ye no worries.
Feel free to add some sort of "R: Conor Dooley <conor@kernel.org>" entry
where appropriate if you want to make sure I'll take a look - but I
should see it anyway if it goes to the riscv list.
Up to you.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
