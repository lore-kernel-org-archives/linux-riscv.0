Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FE3606A327
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tAwFTlNr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=m7jq040q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SPz7OgRkujBp6iq/zekiPNNh9zt8YVm8BfqT3lNKbwA=; b=tAwFTlNrXMk/l4BB9flT846ll2
	bSWDfbaxWrxMd5b5hsH3UEbq8Lssk7orIyaEDSIzZ27UId0poo6GAISfz/mqwY2r0SVHrJqFoA2tt
	5NFksbxyKIT68AL7XpMzyoqfdwfv+Se7QWjsZHi6fZHUNFIu3TuJkL+i2EhUXEpwV/d4i17xse5JT
	CXiPRRkmB96FvkW5N9qKWJ7nANF37G0MZ+9sAFktE1LesYREqe3o/WBQuA2HolmOyikU4cl9GHec7
	CStlM5jO2ETmdlcT141JXKGi3vrP5U3gZ2+STUFNguFIe/VGJe/gUSpxu5bXiiSTvBXLZv4cMLaeX
	cMODJqwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPsr-00000002csG-02kK;
	Mon, 23 Nov 2026 08:58:47 +0000
Received: from outbound.baidu.com ([180.76.5.236])
	by bombadil.infradead.org with smtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPqb-00000002cHv-094E
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 08:56:28 +0000
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.3.11
From: "Li,Rongqing" <lirongqing@baidu.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
	<namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>, Paul Walmsley <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, Atish Patra <atishp@rivosinc.com>, Anup Patel
	<anup@brainfault.org>, Shenlin Liang <liangshenlin@eswincomputing.com>,
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBwZXJmIGt2bTogRml4IFJJU0MtViBWTS1leGl0IGR1?=
 =?gb2312?Q?ration_accounting?=
Thread-Topic: [PATCH] perf kvm: Fix RISC-V VM-exit duration accounting
Thread-Index: AQHdaqsYju6/93onaUCoF9GUXgxXLbc7e2zQ
Date: Mon, 23 Nov 2026 08:55:43 +0000
Message-ID: <10d466045b764b7590abaef251df06c1@baidu.com>
References: <20261102091809.2215-1-lirongqing@baidu.com>
In-Reply-To: <20261102091809.2215-1-lirongqing@baidu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1795424149;
	bh=pdCSnO3vFDLEtKHfqKwTbrDh775Mc8mkkHWJ0WsIDsg=;
	h=From:To:Subject:Date:Message-ID:Content-Type;
	b=m7jq040qstopctYBicKWHH9TehqXD/dRklxUzAx3kpAaWUFRLzqENW1xYN+yc30jd
	 LF7zEAfL8mMgm7nBmakmOhtmC6srJMP9GLVgh+nQ9eSjx7AackXfvhwLhI+GV2r5ZE
	 YYdmzfV0hinWeQBtVQXW8y3w5szRHrlzoygh8VT76voyVc7N9l8SriPhFXmVKLQ2V6
	 vITMvkNlVsE7/mJWLgs/IMjq0G+hL8TdjCimREICU9XPZwMDkeUqww5ecMQOM93fns
	 2s9qDqFvUsnrPHme6vXDXyYrNSprIe/GIfzBwjsY9lLbDlVTreEjrOknA79fRTdFNY
	 OAehTQNrSr7Ig==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_005626_411783_7FFC4840 
X-CRM114-Status: GOOD (  14.07  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> 
> From: Li RongQing <lirongqing@baidu.com>
> 
> Use kvm_exit as the start event and the following kvm_entry as the end
> event for RISC-V VM-exit statistics. Keep decoding scause from the exit
> sample.
> 
> Before this change, RISC-V measured guest runtime as VM-exit time.
> 
> Fixes: da7b1b525e97 ("perf kvm/riscv: Port perf kvm stat to RISC-V")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>

ping 

[Li,Rongqing] 


> ---
>  tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c
> b/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c
> index 967bba2..09c9c7d 100644
> --- a/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c
> +++ b/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c
> @@ -31,13 +31,7 @@ static void event_get_key(struct perf_sample
> *sample,  }
> 
>  static bool event_begin(struct perf_sample *sample,
> -			struct event_key *key __maybe_unused)
> -{
> -	return evsel__name_is(sample->evsel, kvm_entry_trace(EM_RISCV));
> -}
> -
> -static bool event_end(struct perf_sample *sample,
> -		      struct event_key *key)
> +			struct event_key *key)
>  {
>  	if (evsel__name_is(sample->evsel, kvm_exit_trace(EM_RISCV))) {
>  		event_get_key(sample, key);
> @@ -46,6 +40,12 @@ static bool event_end(struct perf_sample *sample,
>  	return false;
>  }
> 
> +static bool event_end(struct perf_sample *sample,
> +		      struct event_key *key __maybe_unused) {
> +	return evsel__name_is(sample->evsel, kvm_entry_trace(EM_RISCV)); }
> +
>  static const struct kvm_events_ops exit_events = {
>  	.is_begin_event = event_begin,
>  	.is_end_event	= event_end,
> --
> 2.9.4

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
