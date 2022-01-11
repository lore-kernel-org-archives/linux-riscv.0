Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325B1C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 18:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZxjyuuzSTLALjmlegeBrIC2bxa3YsCoCBaxRrudSMI=; b=Ryc7vZaYn02K+Z
	Wslr7KQXecIM4Dw9ddoakXfZ1pBKVix+SuziqlzU/Ev4VRe0FvgmMry4yafEFg3zH8juUmBp+wvFJ
	wprT99G5S8aQvh7tRSjl/l+erYZuWABCaA2BLIq3ul4FxbbdB8r6llrPJCsaxM5r7jGnUGUrMNzJp
	agrltDwtjCKex+BQ7CziPvJAqREGgTx0jFtBWgYJVRsHNN0DZSJVY/UHhWgRLCJXlP5m9zPtrWaqg
	90EOGfUTOiCPihbrlD2xTL0dvQ/P46dlhBLPVhh62Va5+3fi4wkszU6s2bO5CzXPTIkdVPK2srB/n
	VANfRWNRPvax8DK6qJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7MGL-00HJh1-6A; Tue, 11 Jan 2022 18:52:53 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7MGF-00HJe7-IS
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 18:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641927167; x=1673463167;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Sua0LrwqqZdGAfIsKVCvbngimpLDy6yy/a/Faw9JSso=;
 b=WVP8DLUSrZsVjIn9XftzLKsCN9UVQxz8iO2Rtyu8+KxB4fuuAgx/fwAe
 B7oZWoIq4yROGT5yDA30X1UzZyXti3pHQYOKVz+j6zDxYEXrAmnS63Mu9
 6yWHJiGyab2bf/kLhjFjKuFEFMdJ3pxdS2DvTahB/0aK6gtycAbUwpWx4
 oRTskmIxB2SauxAGEaRL76qwpWIgoyYA0vyxWJsemAbfF5Jxh7SOLCH8B
 tQwECxtyMmEQk8/NO/CQ4NH70CnQiafBM0n0KXbUbgCNAdjRyvLNefh0u
 iAhN3UXJLvKScROuUYzgvsIAmeBcGPduVxArw5iFdhbW+YdG8N09mnfZZ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="304299756"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="304299756"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 10:52:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="528400339"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.209.36.204])
 ([10.209.36.204])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 10:52:44 -0800
Message-ID: <4b655bf8-ce56-ffe6-78b6-1f949b8df11f@linux.intel.com>
Date: Tue, 11 Jan 2022 10:52:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [RFC PATCH 1/1] perf tools: Add 'm' event modifier for counting
 machine
Content-Language: en-US
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux@yadro.com, Nikita Shubin <n.shubin@yadro.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, Jin Yao <yao.jin@linux.intel.com>,
 Ian Rogers <irogers@google.com>, John Garry <john.garry@huawei.com>,
 Riccardo Mancini <rickyman7@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Song Liu <song@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220111142054.18733-1-nikita.shubin@maquefel.me>
 <20220111142054.18733-2-nikita.shubin@maquefel.me>
From: Andi Kleen <ak@linux.intel.com>
In-Reply-To: <20220111142054.18733-2-nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_105247_712162_42A83E38 
X-CRM114-Status: UNSURE (   4.84  )
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


>   
>    u - user-space counting
>    k - kernel counting
> + m - machine counting


You really need to explain what "machine counting" actually is, as well 
that is likely irrelevant for most CPUs.

I also didn't see that anywhere in the commit logs.

-Andi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
