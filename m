Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB77C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 16:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31F7YgNfMM9+O/jz8TzYOpPmxhd95HOOUl0ahZP6PHw=; b=VXrz87dC+E8v2i
	cqIQXIA49pDuH7ywarp9YYEOQPjlrsi3sBiq9GVOL4fVGOezhg71Q8+ZkXxdMx/K0MO9BfCx0fALk
	Ctzj7n1JPazXlnJ1fYiIKra8XawrH3AkpqMsUezfXVSwyICcBJK8/S7hm+K65l0e6bFNg2NPMSh8r
	O6vNQlNiQC2R7aPIhx7HomH3/wWEu3aog0Ou3BOGmbwbNwK2IpGgxbvBQAY7EjSlnspuE+1lxadVO
	/behlBQ2IN4o6dkHbEQwD1N0HJWV+cwSkSW4MPIKbG2d1b8B0f57i1xvFiwx1QDhH5vmLZm2h0KoG
	pOl/LJLR+zaABq05jm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osR7E-006c2p-OQ; Tue, 08 Nov 2022 16:06:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osR73-006c08-4d; Tue, 08 Nov 2022 16:06:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E197C1FB;
	Tue,  8 Nov 2022 08:06:09 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10D103F73D;
	Tue,  8 Nov 2022 08:06:00 -0800 (PST)
Date: Tue, 8 Nov 2022 16:05:58 +0000
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
	SeongJae Park <sj@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH 2/5] cacheinfo: Return error code in init_of_cache_level()
Message-ID: <20221108160558.ee7etff5oom57ddd@bogus>
References: <20221108110424.166896-1-pierre.gondois@arm.com>
 <20221108110424.166896-3-pierre.gondois@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221108110424.166896-3-pierre.gondois@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_080609_244791_2D5D41FD 
X-CRM114-Status: UNSURE (   8.60  )
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

On Tue, Nov 08, 2022 at 12:04:18PM +0100, Pierre Gondois wrote:
> Make init_of_cache_level() return an error code when the cache
> information parsing fails to help detecting missing information.
> 
> init_of_cache_level() is only called for riscv. Returning an error
> code instead of 0 will prevent detect_cache_attributes() to allocate
> memory if an incomplete DT is parsed.
>

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
