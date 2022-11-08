Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01BAC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 16:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zE+DazglBfhSBCeAmjGfsxOS+MVCjHi9VYCM1VjtFAY=; b=e4m29gaf+cfv5o
	nZ1u2YUY99nWZ4/weBYTUhqY0jnjHVCF8s4HNpTqv+2qrEZjPD5SIf/CgStjRdUdhsLcZw0Cp6Hxk
	HG94iO+d7bFrRoONGkeObE4r8139FF3QVEw2oXiHy4eK18zXpVhvXTL072d2y61S7j80KNBIZZnmB
	7yJs5FZ4fwtXYXY77KfjGVUFhdyfoonjjiNdhsSXxN9Pz6cJ29z8nXsh+XHe10vpMaLlCg9EjlHLQ
	KmfHllA6E5sIRBrJWDyhY98kHZOzN8Ndpt4MY5lhe7JZrVD7e2Yfsv+vEl6/zO8+BKJQaeEbw1iAY
	n8xTyk4l/kU600cqfX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osR9q-006ceh-9B; Tue, 08 Nov 2022 16:09:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osR9e-006cbh-Nn; Tue, 08 Nov 2022 16:08:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 665CC1FB;
	Tue,  8 Nov 2022 08:08:55 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1141F3F73D;
	Tue,  8 Nov 2022 08:08:46 -0800 (PST)
Date: Tue, 8 Nov 2022 16:08:44 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
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
Message-ID: <20221108160844.iosdfo2bm6srfexp@bogus>
References: <20221108110424.166896-1-pierre.gondois@arm.com>
 <20221108110424.166896-2-pierre.gondois@arm.com>
 <20221108160323.kqotjshjxr67muaf@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221108160323.kqotjshjxr67muaf@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_080850_833412_EB723A31 
X-CRM114-Status: UNSURE (   9.15  )
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

On Tue, Nov 08, 2022 at 04:03:23PM +0000, Sudeep Holla wrote:
> On Tue, Nov 08, 2022 at 12:04:17PM +0100, Pierre Gondois wrote:
> > Riscv's implementation of init_of_cache_level() is following
> > the Devicetree Specification v0.3 regarding caches, cf.:
> > - s3.7.3 'Internal (L1) Cache Properties'
> > - s3.8 'Multi-level and Shared Cache Nodes'
> > 
> > Allow reusing the implementation by moving it.
> >
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> 

Forgot to mention earlier, I prefer to
s/riscv/RISC-V/
s/implem/implementation/

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
