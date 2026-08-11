Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791D2C5B56A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 20:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+l95LVv1+4DHbMrHPqznKugGcFQHpyfN+E7U4wq3Bk=; b=wpc08D18dtxbJG
	gR0aK1zQfPxQY1iFPyIWQg/ZyJ6DHgGKy1wFtRMTyX9/cgU/32macNo4HbHRwUuMk/CvcfHzppP3s
	3kL1eEgj4SM2wFZQHdKKnDFieExAS1d1Ya7G8svZG3X+vTIWVwhahoUY922iFgzYVWjGHJNJOmeBF
	1ReEzpZ0PiC1+ZA9fENr5NZUbkhaueyMij6j1uU+MMDSuKiuw21oD3bS3bb31T3k3Xw+KmD3VDgu1
	pXcv/9GOqKqR+59c3mvlJDOfG7lOtkhey+mvj8qjn6kujb3iEx4RGw/dliRp64XEjIywPQm5E+Nuv
	V55WJOZFfxurC1/HNpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtsrI-0000000Eu2s-0Bci;
	Tue, 11 Aug 2026 20:14:00 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtsrF-0000000Eu1h-1NgO
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 20:13:58 +0000
Message-ID: <2b4e524a-cccc-47d1-9779-b40cc592e1cd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786479224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f22bnD3Sko0dUdBxN3QNw/Z+ZrWPYkDLgjG8TY6rG1A=;
	b=V09dF9j65JUlhfcjqaeq+VmWdpAzRmYHvvnlHqtx5/gzL2DcKqZ8O3MWGueU3AWU/3RSIj
	hM5rLo+hyvUaSDcHIEnmoyJaShGLUjC88DMANkg259S5DiuN5FNIsIjNP8q8uOV75JZ1Ke
	qJ3l/Yzr0pn30dekDUOHDzpxvqzZNQs=
Date: Tue, 11 Aug 2026 13:13:37 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v9 00/20] Add Counter delegation ISA extension support
To: Paul Walmsley <pjw@kernel.org>
Cc: Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Anup Patel <anup@brainfault.org>,
 Ian Rogers <irogers@google.com>, Rob Herring <robh@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
 <42cea3ec-5f9d-7f47-bb8c-ab2789246918@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <42cea3ec-5f9d-7f47-bb8c-ab2789246918@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_131357_505310_886DF0BA 
X-CRM114-Status: GOOD (  11.17  )
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


On 8/8/26 10:36 AM, Paul Walmsley wrote:
> On Fri, 7 Aug 2026, Atish Patra wrote:
>
>> This series adds the counter delegation extension support. It is based on
>> very early PoC work done by Kevin Xue and mostly rewritten after that.
>> The counter delegation ISA extension(Smcdeleg/Ssccfg) actually depends
>> on multiple ISA extensions.
> I'll put the first ten patches in riscv/for-next, replacing the ones I
> queued up earlier.  Let's take a look at the remaining patches in the v7.4
Thanks!
> time period, due to the other recent updates.
Sounds good to me.
>
> thanks
>
> - Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
