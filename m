Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6CBC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jun 2022 05:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cpo7aoz9c27kny7wqNcba492KT5NoYTQBti46tUwNsg=; b=C1x2Mz6nWPkV0j
	LWRJhm5B/Z++AK3ysxLw3FBD7gXk0dtU0zuId9/WVp2B8pISpkiOvOtaAWRSstpvSXcS2ODB1FqYu
	bQK7TL43bbaiu9RffgQ9Sk48eOLWVIe8KvDc3BGq+9MkAsjWZNBfZsS0wfEE4tEpJR9P4MY8Hh1HO
	vHStmOt1F+1WqfAGzrVBTNR2g6IfUgbTD3UQMGAXFkqallFqQwa5u0L7ZEmHAL4jKrZ0iKJEO4w6R
	aompdn7ZqaeEY29i9eT950nAhYRT4Jm7cpWSR57Sc92VrZ3hcRiZrZCyzXzR1dbBGCHiFElqzx6BC
	fmW8IX4IwoKM4DwHqGFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4yLN-004iJe-Kk; Sat, 25 Jun 2022 05:28:29 +0000
Received: from forward500j.mail.yandex.net ([2a02:6b8:0:801:2::110])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4yLI-004iHg-2F
	for linux-riscv@lists.infradead.org; Sat, 25 Jun 2022 05:28:28 +0000
Received: from sas1-0e0150e31af0.qloud-c.yandex.net (sas1-0e0150e31af0.qloud-c.yandex.net [IPv6:2a02:6b8:c14:392a:0:640:e01:50e3])
	by forward500j.mail.yandex.net (Yandex) with ESMTP id 18D446CB7324;
	Sat, 25 Jun 2022 08:28:18 +0300 (MSK)
Received: from sas2-e7f6fb703652.qloud-c.yandex.net (sas2-e7f6fb703652.qloud-c.yandex.net [2a02:6b8:c14:4fa6:0:640:e7f6:fb70])
	by sas1-0e0150e31af0.qloud-c.yandex.net (mxback/Yandex) with ESMTP id lMAl9z8mXq-SGfGlZik;
	Sat, 25 Jun 2022 08:28:18 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1656134898;
	bh=olh/t8bBvdypCRtDpfeOgA30mVxtptEkmVnsLVjMzDc=;
	h=In-Reply-To:Subject:Cc:To:From:References:Date:Message-ID;
	b=Bp/ICzPWzLMY/gyXracYUUPZjyK9jzgM+dU+ClK8GBSj4ff43N/t2tDIg7Hvn7ow5
	 utFRQA1pzsRFajGPBt3QMKTxR1jNxhiv0UgbL1ARXc1yBFN17rSfRlGVvGgAUqJw1n
	 Q2rTefMzib1Tws59ZSND0T12UFKfojGaeTjOfMqs=
Authentication-Results: sas1-0e0150e31af0.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas2-e7f6fb703652.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id G8teebH6cY-SEN46qGX;
	Sat, 25 Jun 2022 08:28:15 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
Date: Sat, 25 Jun 2022 08:28:13 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 =?UTF-8?B?Sm/Do28gTcOhcmlv?= Domingos <joao.mario@tecnico.ulisboa.pt>,
 linux@yadro.com, Nikita Shubin <n.shubin@yadro.com>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/5] perf tools riscv: Add support for get_cpuid_str
 function
Message-ID: <20220625082813.3b70727c@redslave.neermore.group>
In-Reply-To: <YrXnFAaT/B1In/+t@kernel.org>
References: <20220624160117.3206-1-nikita.shubin@maquefel.me>
	<20220624160117.3206-3-nikita.shubin@maquefel.me>
	<YrXnFAaT/B1In/+t@kernel.org>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_222825_062268_7071F326 
X-CRM114-Status: GOOD (  12.16  )
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

Hello Arnaldo!

On Fri, 24 Jun 2022 13:32:20 -0300
Arnaldo Carvalho de Melo <acme@kernel.org> wrote:

> > +	if (mimpid)
> > +		free(mimpid);  
> 
> just use:
> 
> 	
> 	free(mvendorid);
> 	free(marchid);
> 	free(mimpid);
> 
> fewer lines, free() accepts NULL.
> 
> > +
> > +	return cpuid;
> > +}
> > +
> > +int get_cpuid(char *buffer, size_t sz)
> > +{
> > +	char *cpuid = _get_cpuid();
> > +
> > +	if (sz < strlen(cpuid)) {
> > +		free(cpuid);
> > +		return -EINVAL;
> > +	}
> > +
> > +	scnprintf(buffer, sz, "%s", cpuid);  
> 
> You're leaking cpuid here.

Agree with both.

Thank you for pointing it out.

> 
> > +	return 0;
> > +}
> > +
> > +char *
> > +get_cpuid_str(struct perf_pmu *pmu __maybe_unused)
> > +{
> > +	return _get_cpuid();
> > +}
> > -- 
> > 2.35.1  
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
