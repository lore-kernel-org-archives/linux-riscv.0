Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E054C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 09:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oib6jWbllWxlDdQnHryEcSowj2mIVfbIFKV1jyfsVAw=; b=NEkMa4Yp1XaImu
	mWPrNZKS3LAjAVHLmE+7cJ3NPnqzvpppy0tMxbs2szoLB2bm6XTYzoJVDOyq5q3KZL/Wv+EsiGeAg
	+i+QowpsvRE9PwLStehwlQLImX9M/9dQbOyQmgRpH1Dmr8tF94J0o78C/ooqIRhXOIQZhYWTsA++D
	UbVEXne2/NG/EiTDT0v9UyFvfgfLVqs2zzLXCGgPT5UPm49pBFY5s8OkAVz7jCS6RmOLqrA35ASZU
	M7Y5N6yCE7OsCOCc1/V9oruZAtCXnkv6WHNaKrcO+kvWjcP9O5ZS7yauhC0+m8Ds6+QIg4LAvINdc
	WxXEJSq5G9cvcUzDc7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrae1-0000000ATk7-2dsb;
	Tue, 02 Apr 2024 09:41:29 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rradx-0000000ATge-35fF
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 09:41:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17803240009;
	Tue,  2 Apr 2024 09:41:17 +0000 (UTC)
Message-ID: <0643e9d2-3799-4b6b-81fa-fe516e850f72@ghiti.fr>
Date: Tue, 2 Apr 2024 11:41:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix the warnings in the 32-bit platform
Content-Language: en-US
To: Ben Zong-You Xie <ben717@andestech.com>, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: dylan@andestech.com, tim609@andestech.com
References: <20240305120501.1785084-1-ben717@andestech.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240305120501.1785084-1-ben717@andestech.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_024126_153908_0624FF01 
X-CRM114-Status: UNSURE (   8.29  )
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

Hi Ben,

On 05/03/2024 13:04, Ben Zong-You Xie wrote:
> This series fix two incompatible type warnings when building perf in the
> 32-bit platform.
>
> Ben Zong-You Xie (2):
>    perf daemon: Fix the warning about time_t
>    perf riscv: Fix the warning due to the incompatible type
>
>   tools/perf/arch/riscv/util/header.c | 2 +-
>   tools/perf/builtin-daemon.c         | 9 +++++----
>   2 files changed, 6 insertions(+), 5 deletions(-)
>

For the series, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

To me this should go into -fixes, but which tree? perf or riscv?

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
