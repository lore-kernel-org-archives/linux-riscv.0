Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BB3C5AD2C
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 07:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTyClAZ+myjhMG88gb5VEMEnkNN+8KUyg8m/85JV9zk=; b=ZXfrt/XCK2CezV
	zf1YdpZPwi402XGZcVar+BUy5NqJ/CqzR0m7cnJbChONOHM7nwzfID2qViI5XL5Kb4XMeLSv9ikd9
	LMXW11qk73Tw2viEF8LPE+OsL2ttHjs5YFY11/BOpiYRncTBU+00zYaLidYiB7qRO0pxmViyRXi6r
	bS5ECOxGl0aUr+jxDFTU8ixNe63zLOUwxk53p7L9vVDd7daeuTwQS0/dP4Yg8ldRuAaPcCOmOLIfL
	fNfcg1cOrGk5Mm9N7rz5jHgXjs9r0NRbd+zYmYTUyr7KuAZbfdXi0euC4rh21mivIzZBkqGzTQKnZ
	osqWHz2DYnT7x3oGYFQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsbYQ-000000098Ak-3Ych;
	Sat, 08 Aug 2026 07:33:14 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsbYN-0000000989e-02pI
	for linux-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 07:33:13 +0000
Message-ID: <f29e9ffc-80bd-4bd0-91a5-22feb081ac60@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786174378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rCzgX6JVLx9Ko3n6wKYEJsdgvY6Ca+XBEhJnvXYRW5o=;
	b=iovclzJpjR+LMVlQGMDC1PXGZcwCK7PEsPVXonLV3I6GYXXstpcVN2tQErwnvJQubWeZkW
	SeShr/mMhxwjUHw1ENdLhSGDivCiBRGJQ/ejL80ujQs1mOQN9teOlOUsNYf1YkdNDn/vij
	ctovi6HgvbyGlh6y6/v+IOE/V1+36d8=
Date: Sat, 8 Aug 2026 00:32:49 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v8 05/22] RISC-V: Define indirect CSR access helpers
To: Paul Walmsley <pjw@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>,
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-5-7909f863a645@meta.com>
 <1b20aa77-0f0f-08c7-9439-972983adf709@kernel.org>
 <920aee80-5297-4d70-a1ea-616976db7f70@linux.dev>
 <09a1260b-aa91-f993-e81e-0c636cfd7942@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <09a1260b-aa91-f993-e81e-0c636cfd7942@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_003311_623000_B4530573 
X-CRM114-Status: GOOD (  15.04  )
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


On 8/7/26 6:04 PM, Paul Walmsley wrote:
> On Wed, 5 Aug 2026, Atish Patra wrote:
>
>> On 8/4/26 5:39 PM, Paul Walmsley wrote:
>>> On Wed, 1 Jul 2026, Atish Patra wrote:
>>>
>>>> From: Atish Patra <atishp@rivosinc.com>
>>>>
>>>> The indirect CSR requires multiple instructions to read/write CSR.
>>>> Add a few helper functions for ease of usage.
>>>>
>>>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>> Thanks.  These macros seem better implemented as static inline functions.
>>> That also nicely aligns the code with what you write in the patch
>>> description.
>> I don't think inlining these macros in the following way will work because of
>> the following reason. It won't build once anything calls it.
>>
>> csr_read()/csr_write() stringify the CSR argument straight into the inline asm
>> template:
> Yes, you're right; I should have caught that.  Too bad, there are multiple
> keyhole CSR index registers in use, otherwise it would have been a
> reasonable thing to do.
>
> What's up with the subsequent followup message?  Looks like a
> cut-and-paste from an LLM.
Oops. Ha ha. LLM agent was parsing the lore and preparing a draft response.
It produced so much garbage that I replied manually. I have no idea what 
prompted
it to send it after I sent the response! Sorry for the spam.
>
> - Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
