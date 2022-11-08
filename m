Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8721CC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ju+hp7sGHgNRVB3erZAaaDfckw4hAJlzJj6AfUxBsrQ=; b=k+GKre7vwqkbvL
	phyRUQZbmiLD8Nyegq66JvppP/ioOdxq0lY//vl5JrNCc/BvAuORdVQpS3pEmsu0vQcEqs1Krwtrd
	j0m/IN7xeAAuVA+lJLGaQD8mejDz3jGqPqVte4whstvIZfaZK+q7u9HWRwMiuuhUbW3GjcEXJ68Gl
	9wP5H3xOtJfYOiUdF4MV1WkHEImcA4ZdHXrhDZufsbH4RDoZFQ6DkDW/gvS+mbA/3Rw5asUzIDdGS
	Dll05HhlSVKZigfQ3eZVbyIlOg+pOeJo9eVC3493Aml8/XPHRvc4oS9AntFtXeWiAcgVdBkwV08oh
	07DVb9t+p6LM1yhI+RBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osREC-006dTj-Io; Tue, 08 Nov 2022 16:13:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osRE2-006dQf-Dl; Tue, 08 Nov 2022 16:13:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C66B1FB;
	Tue,  8 Nov 2022 08:13:25 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D3373F73D;
	Tue,  8 Nov 2022 08:13:17 -0800 (PST)
Date: Tue, 8 Nov 2022 16:13:15 +0000
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
	Gavin Shan <gshan@redhat.com>, Peter Chen <peter.chen@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH 3/5] ACPI: PPTT: Remove acpi_find_cache_levels()
Message-ID: <20221108161315.lmm3sakza5quyzlv@bogus>
References: <20221108110424.166896-1-pierre.gondois@arm.com>
 <20221108110424.166896-4-pierre.gondois@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221108110424.166896-4-pierre.gondois@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_081322_535515_BD398A13 
X-CRM114-Status: GOOD (  11.55  )
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

On Tue, Nov 08, 2022 at 12:04:19PM +0100, Pierre Gondois wrote:
> acpi_find_cache_levels() is used at a single place and is short
> enough to be merged into the calling function. The removal allows
> an easier renaming of the calling function in the next patch.
>
> Also reorder the parameters in the 'reversed Christmas tree' order.

Not sure if the above is worth mentioning explicitly. Even if you do,
'parameters' sounds very confusing to at-least me. I was searching for
the changes is some function parameters to understand what it was and
finally realised you meant the stack variable declaration order here.
Right ?


Other than that, it looks good.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
