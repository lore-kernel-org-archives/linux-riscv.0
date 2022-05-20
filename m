Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB0CC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 12:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVcQo78Oj8UsWCTyng9r3/NsTBVnIGJaTG880yXB10Q=; b=C+lQqoG4waPOV5
	zj2OwflAEZe9Km6vpkbNR54hSYC27jeG6rr+KyQGyBO9W7/cJZfgX/W8A4aYezQW+zlBLjREIvVWY
	LP5y1ra13oHPQYqbMBu7yhuYrQSwoPnj7mkibnQAFK51A8Fwl9+YWAeC3v9MF9eZ/CNbNB+IVv1I6
	WNv9b7LaBbFSFOFCp5979UkbwQ0/gv4aJXXNJfP5RpzxAt637IT8zw33PQN3qhrRPc0UhAoYV07IN
	Y2OlFvEU4l3dd8iMoGFsT1VgPeEdAgE5Mj0uoJ88Y7xHlOuGXn9X/tkmOOltajAb6jmzjy2HAeylG
	4cBsGvkhDa/q/Xwxzo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1oD-00CL8S-RH; Fri, 20 May 2022 12:32:45 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1o1-00CL1j-CL; Fri, 20 May 2022 12:32:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A7EF1477;
 Fri, 20 May 2022 05:32:32 -0700 (PDT)
Received: from [172.29.1.145] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC9513F718;
 Fri, 20 May 2022 05:32:29 -0700 (PDT)
Message-ID: <db6dc5e0-780a-5542-5e49-711cd454a9d8@arm.com>
Date: Fri, 20 May 2022 14:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/8] arch_topology: Set thread sibling cpumask only
 within the cluster
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>, Atish Patra <atishp@atishpatra.org>, 
 linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
References: <20220518093325.2070336-1-sudeep.holla@arm.com>
 <20220518093325.2070336-3-sudeep.holla@arm.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20220518093325.2070336-3-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_053233_488970_3FE0D58C 
X-CRM114-Status: GOOD (  10.52  )
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

On 18/05/2022 11:33, Sudeep Holla wrote:
> Currently the cluster identifier is not set on the DT based platforms.
> The reset or default value is -1 for all the CPUs. Once we assign the
> cluster identifier values correctly that imay result in getting the thread
> siblings wrongs as the core identifiers can be same for 2 different CPUs
> belonging to 2 different cluster.
> 
> So, in order to get the thread sibling cpumasks correct, we need to
> update them only if the cores they belong are in the same cluster within
> the socket. Let us skip updation of the thread sibling cpumaks if the
> cluster identifier doesn't match.

So this issue should be there on ACPI systems as well then. Kunpeng920
and Ampere Altra don't have SMT, so very likely nobody has noticed this
so far.

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
