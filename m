Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EA1C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 16:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KqpPLexBXE4PWq/m9WIZ8WULlZpl2EOTN/sJQKtHmc=; b=BADpAxhKN+UAwM
	y/d15dv+2CAMghIhY339ckyBCR+vz4HgFVqythcXiVo6mq6bZvIga/BYXqLFjLqrKi844jJ+BtnvM
	bT5QleG8X+/+et4qcq8GtCLCThC5MVHcPcwFXH2nWgI7+tXg1/ByAz6xZWAj0XboqVMXOK3s1g8EF
	Nt940ImyyrrgZNOXzPTGrWu9DhwG9kJ8nciBpagkPmAGdDInwK4BeVQUtl6EeVC1SHda80Jn7QYRu
	bLluV03aklXO4eRTpUUWaLjxr+vnDHfKqinKq6RQZ0r60/Bw4IxuYQvwbhd54V56xpUnb8nT7mLUq
	YgF/o16IOCHmTUzZQu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mEP-0031BP-Ji; Fri, 24 Jun 2022 16:32:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mEN-0031B4-SS
	for linux-riscv@bombadil.infradead.org; Fri, 24 Jun 2022 16:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FjTKrtMkOHYf2Anv9YZ6BCYv7v0IOvC+2m6SwumHyIk=; b=LlU8/CsMHi74EylsG4+LKynRtX
	IG70uoAJVYdbOkhF4AKSA+a0gLjgXz264GGVXIF8Zp68975VY0K9kye9HJFDL7moXokxWNPUS2ERo
	CD4JECqysQRUEsGOLwmlaqRfMW+DXoprA42uvCJ6GAvPnCMQSCnG1KGBnul99yIw/gZQFVicdh3mi
	jbgEB6v4hQaNkkQp5rFNPLgyiLEIWigCqGBiAzf3gzi+MHAHAgB5h3BRe9/XEtTl1FpG0C5N40/9/
	+W+pAEqZ/w4iDP+hbTg+9lNG77cKpBCnej5MD0CWeqwwmUQ6qAJs+LC607NksCZdwfSm8gRSWvfaz
	ZwErPS0w==;
Received: from [187.19.236.69] (helo=quaco.ghostprotocols.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mEK-00CFvI-6g; Fri, 24 Jun 2022 16:32:24 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id F00184096F; Fri, 24 Jun 2022 13:32:20 -0300 (-03)
Date: Fri, 24 Jun 2022 13:32:20 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
	=?iso-8859-1?Q?Jo=E3o_M=E1rio?= Domingos <joao.mario@tecnico.ulisboa.pt>,
	linux@yadro.com, Nikita Shubin <n.shubin@yadro.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/5] perf tools riscv: Add support for get_cpuid_str
 function
Message-ID: <YrXnFAaT/B1In/+t@kernel.org>
References: <20220624160117.3206-1-nikita.shubin@maquefel.me>
 <20220624160117.3206-3-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220624160117.3206-3-nikita.shubin@maquefel.me>
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

Em Fri, Jun 24, 2022 at 07:00:52PM +0300, Nikita Shubin escreveu:
> From: Nikita Shubin <n.shubin@yadro.com>
> 
> The get_cpuid_str function returns the string that
> contains values of MVENDORID, MARCHID and MIMPID in
> hex format separated by coma.
> 
> The values themselves are taken from first cpu entry
> in "/proc/cpuid" that contains "mvendorid", "marchid"
> and "mimpid".
> 
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> ---
>  tools/perf/arch/riscv/util/Build    |   1 +
>  tools/perf/arch/riscv/util/header.c | 109 ++++++++++++++++++++++++++++
>  2 files changed, 110 insertions(+)
>  create mode 100644 tools/perf/arch/riscv/util/header.c
> 
> diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
> index 7d3050134ae0..603dbb5ae4dc 100644
> --- a/tools/perf/arch/riscv/util/Build
> +++ b/tools/perf/arch/riscv/util/Build
> @@ -1,4 +1,5 @@
>  perf-y += perf_regs.o
> +perf-y += header.o
>  
>  perf-$(CONFIG_DWARF) += dwarf-regs.o
>  perf-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
> diff --git a/tools/perf/arch/riscv/util/header.c b/tools/perf/arch/riscv/util/header.c
> new file mode 100644
> index 000000000000..53e8ddf7990b
> --- /dev/null
> +++ b/tools/perf/arch/riscv/util/header.c
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Implementation of get_cpuid().
> + *
> + * Author: Nikita Shubin <n.shubin@yadro.com>
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <api/fs/fs.h>
> +#include <errno.h>
> +#include "../../util/debug.h"
> +#include "../../util/header.h"
> +
> +#define CPUINFO_MVEN	"mvendorid"
> +#define CPUINFO_MARCH	"marchid"
> +#define CPUINFO_MIMP	"mimpid"
> +#define CPUINFO		"/proc/cpuinfo"
> +
> +static char *_get_field(const char *line)
> +{
> +	char *line2, *nl;
> +
> +	line2 = strrchr(line, ' ');
> +	if (!line2)
> +		return NULL;
> +
> +	line2++;
> +	nl = strrchr(line, '\n');
> +	if (!nl)
> +		return NULL;
> +
> +	return strndup(line2, nl - line2);
> +}
> +
> +static char *_get_cpuid(void)
> +{
> +	char *line = NULL;
> +	char *mvendorid = NULL;
> +	char *marchid = NULL;
> +	char *mimpid = NULL;
> +	char *cpuid = NULL;
> +	int read;
> +	unsigned long line_sz;
> +	FILE *cpuinfo;
> +
> +	cpuinfo = fopen(CPUINFO, "r");
> +	if (cpuinfo == NULL)
> +		return cpuid;
> +
> +	while ((read = getline(&line, &line_sz, cpuinfo)) != -1) {
> +		if (!strncmp(line, CPUINFO_MVEN, strlen(CPUINFO_MVEN))) {
> +			mvendorid = _get_field(line);
> +			if (!mvendorid)
> +				goto free;
> +		} else if (!strncmp(line, CPUINFO_MARCH, strlen(CPUINFO_MARCH))) {
> +			marchid = _get_field(line);
> +			if (!marchid)
> +				goto free;
> +		} else if (!strncmp(line, CPUINFO_MIMP, strlen(CPUINFO_MIMP))) {
> +			mimpid = _get_field(line);
> +			if (!mimpid)
> +				goto free;
> +
> +			break;
> +		}
> +	}
> +
> +	if (!mvendorid || !marchid || !mimpid) {
> +		cpuid = NULL;
> +		goto free;
> +	}
> +
> +	if (asprintf(&cpuid, "%s-%s-%s", mvendorid, marchid, mimpid) < 0)
> +		cpuid = NULL;
> +
> +free:
> +	fclose(cpuinfo);
> +
> +	if (mvendorid)
> +		free(mvendorid);
> +
> +	if (marchid)
> +		free(marchid);
> +
> +	if (mimpid)
> +		free(mimpid);

just use:

	
	free(mvendorid);
	free(marchid);
	free(mimpid);

fewer lines, free() accepts NULL.

> +
> +	return cpuid;
> +}
> +
> +int get_cpuid(char *buffer, size_t sz)
> +{
> +	char *cpuid = _get_cpuid();
> +
> +	if (sz < strlen(cpuid)) {
> +		free(cpuid);
> +		return -EINVAL;
> +	}
> +
> +	scnprintf(buffer, sz, "%s", cpuid);

You're leaking cpuid here.

> +	return 0;
> +}
> +
> +char *
> +get_cpuid_str(struct perf_pmu *pmu __maybe_unused)
> +{
> +	return _get_cpuid();
> +}
> -- 
> 2.35.1

-- 

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
