Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92BAC07CB1
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 14:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U3UaRiWVIKuMv9z4nE2UJ14wk5V3s1B+S2rEEbkHJrM=; b=kwW1vgGCohl0R7
	jgqGOwQnPrphjOiL9BFUZDpDva2gwjsIzszipC0H0MSTxQ+oxaIdm5ZBC1WcrW9tCyMndwygN1S0o
	DBa0tsWGf4PkGJLYsvy20GCl3eJ9+QvmWBr4f3CdqoDtgbIDp0hUmwR8JSx9n3VyYtzvTtDGGOrMQ
	ki20+NWrECVCmN4aUUctkJ39C3qLLI/aVfh3ntg0Aqp65yx59lBocJH3XxpKMfMVZgZx6JZmuUNlE
	Ex8mZcipCKJsgYZ6/y2Q1acKxzL95x6/2S/FKm3keOeLAQ9ewu16fvJkgikZJVkTfyJQwY0r/dTFk
	q5JV1lGSXrgv72MHtQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7cmV-002in0-1k;
	Mon, 27 Nov 2023 14:40:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7cmS-002im9-1W
	for linux-riscv@bombadil.infradead.org;
	Mon, 27 Nov 2023 14:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zlMwSJB93o1LYes6jD4wgX1KYs39fQTgh2h5hT3dc7k=; b=XUJrOraJwA9SAT7dNWfH3NhuD+
	3tqCSwvs2QTESvK58jELYf0u8J5bYkLDY5UuPnyM/oMiB5X4PXT6kskoxT7nAq3J0BIkJp90Qw4W3
	PfYxz7d89PrQpO9WuBgUzx5MgwzDNTdIv5Vnq7pIMbN3rRf6yPMBl+EXne2n4hyHHJc6f+qNA4qSU
	7Sfvu6jU3pIKoE0fX1pnYufjBTlHjfeUdXsOca1c1w+7gzqs0wtqJrcu3B9Sy6J61MBy3ixmZzRyD
	DuF3DdZJ5YO68I0jvyL9gVnpQWR7dfcmOxtmfSE91rhU6UxOXkqUFTZVGJzxdhYxiBbK4chqaPmmQ
	xs+SpUbQ==;
Received: from [187.19.173.117] (helo=quaco.ghostprotocols.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r7cmQ-00BSID-Jc; Mon, 27 Nov 2023 14:40:10 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 71CF340094; Mon, 27 Nov 2023 11:40:07 -0300 (-03)
Date: Mon, 27 Nov 2023 11:40:07 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nikita Shubin <n.shubin@yadro.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4] perf vendor events riscv: add StarFive Dubhe-90 JSON
 file
Message-ID: <ZWSqR8cqMB//WE/A@kernel.org>
References: <20231122030908.2981502-1-jisheng.teoh@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122030908.2981502-1-jisheng.teoh@starfivetech.com>
X-Url: http://acmel.wordpress.com
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

Em Wed, Nov 22, 2023 at 11:09:08AM +0800, Ji Sheng Teoh escreveu:
> Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> ---
> Changelog:
> v3 -> v4:
> - Reuse common and firmware json file from starfive/dubhe-80.
> - Rebase against latest perf-tools-next
> - Update commit message to reflect the above changes.

I guess this addressed all the review comments, applied, if something is
still amiss we can add a followup patch.

- Arnaldo

> v2 -> v3:
> - Add standard RISC-V firmware event
> - Update commit message to reflect addition of standard
>   RISC-V firmware event.
> v1 -> v2:
> - Rename 'Starfive Dubhe' to 'StarFive Dubhe-90' in commit message.
> - Rename 'starfive/dubhe' pmu-events folder to 'starfive/dubhe-90'
> - Update MARCHID to 0x80000000db000090 in mapfile.csv
> ---
>  tools/perf/pmu-events/arch/riscv/mapfile.csv | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
