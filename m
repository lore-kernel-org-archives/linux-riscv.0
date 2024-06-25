Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC9FC2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 12:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFWmhCOyySgxD/8FqX4C4m5Va1qBFRUvt1oUSKTJJjU=; b=qrZgyalVuYl6BJ
	hH5/OTU0tCbvaEM3YsYjd6QyBReELJTQ/Lm0jQrKf4uftvL/zESSvNcn6knDgGFo+8M0Il8ZfOt5b
	fja6LtUqYs39W/wHmYaF9VD4isKV4SOdg8Tza39fal3WCVDijQ4mzNJGUjSUpjTFIuuK/Xa+IKIFg
	BEnFxkpbEjidJmSTWiH06xy+ASb7LPsGN7/ifzkg/booqoaOlAkmN4eoaIs8qA6ELQ2Yw1ZTIQ9of
	KtzpPjyf+XoJzGVn4QIGjjDLdtLM9LZ4QGC4oK17/yXH06INk35pLwkSg85rAgx1yvXjMNiFQvVUs
	dpGojtMDGKjw+1Fa7qjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM5Do-00000002jMk-2Dl2;
	Tue, 25 Jun 2024 12:24:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM5Da-00000002jGB-3WtC;
	Tue, 25 Jun 2024 12:24:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7923C339;
	Tue, 25 Jun 2024 05:24:36 -0700 (PDT)
Received: from [192.168.1.100] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CD783F766;
	Tue, 25 Jun 2024 05:24:05 -0700 (PDT)
Message-ID: <1fdf637d-3571-4145-8008-f2b5f8fc8bca@arm.com>
Date: Tue, 25 Jun 2024 13:24:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] perf python: Switch module to linking libraries
 from building source
To: Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, Nick Terrell <terrelln@fb.com>,
 Ravi Bangoria <ravi.bangoria@amd.com>, Kees Cook <keescook@chromium.org>,
 Andrei Vagin <avagin@google.com>, Athira Jajeev
 <atrajeev@linux.vnet.ibm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Ze Gao <zegao2021@gmail.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 coresight@lists.linaro.org, rust-for-linux@vger.kernel.org,
 bpf@vger.kernel.org
References: <20240613233122.3564730-1-irogers@google.com>
 <20240613233122.3564730-8-irogers@google.com> <Znnyi2IPC79jMd9y@google.com>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <Znnyi2IPC79jMd9y@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_052415_003299_635B4A40 
X-CRM114-Status: GOOD (  17.50  )
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



On 24/06/2024 23:26, Namhyung Kim wrote:
> On Thu, Jun 13, 2024 at 04:31:21PM -0700, Ian Rogers wrote:
>> setup.py was building most perf sources causing setup.py to mimic the
>> Makefile logic as well as flex/bison code to be stubbed out, due to
>> complexity building. By using libraries fewer functions are stubbed
>> out, the build is faster and the Makefile logic is reused which should
>> simplify updating. The libraries are passed through LDFLAGS to avoid
>> complexity in python.
>>
>> Force the -fPIC flag for libbpf.a to ensure it is suitable for linking
>> into the perf python module.
>>
>> Signed-off-by: Ian Rogers <irogers@google.com>
>> Reviewed-by: James Clark <james.clark@arm.com>
>> ---
>>  tools/perf/Makefile.config |   5 +
>>  tools/perf/Makefile.perf   |   6 +-
>>  tools/perf/util/python.c   | 271 ++++++++++++++-----------------------
>>  tools/perf/util/setup.py   |  33 +----
>>  4 files changed, 110 insertions(+), 205 deletions(-)
>>
>> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
>> index 7f1e016a9253..639be696f597 100644
>> --- a/tools/perf/Makefile.config
>> +++ b/tools/perf/Makefile.config
>> @@ -910,6 +910,11 @@ else
>>           endif
>>           CFLAGS += -DHAVE_LIBPYTHON_SUPPORT
>>           $(call detected,CONFIG_LIBPYTHON)
>> +	 ifeq ($(filter -fPIC,$(CFLAGS)),)
> 
> Nitpick: mixed TAB and SPACEs.
> 
> 
>> +           # Building a shared library requires position independent code.
>> +           CFLAGS += -fPIC
>> +           CXXFLAGS += -fPIC
>> +         endif
> 
> 
> I'm curious if it's ok for static libraries too..
> 
> Thanks,
> Namhyung
> 

I think I tested the whole set with a static build so it should be ok.

> 
>>        endif
>>      endif
>>    endif

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
