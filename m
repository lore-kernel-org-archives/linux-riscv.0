Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A269CE7A95
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 11:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=zFSlLbywX94coYF0zTktBHcnQ2/mo/lc9lbVpnLZDpM=; b=a/BQo6IM0bfuvGRjTvvpacSLNx
	vc+93rvzsWEdKKgN7lwzN6D0++6Xcq+8K5FS/AauInpQkZXqONi/2lHo3ftlxW5kQD33EAtSNR9Ct
	tPk4lyft5qgm4EcM4YAt8sCqXjeKVJAzTkWqsuKwPjkUmmUR9zgPCwmdHp27x0zLByjXITnqLtRcW
	p50tRYaLgvPe2CynieCJdlRbIPQcWSzyfbJPlsJP6AujMVQTsd2gXHv4kX4ShjD3Y9B6N7XruW1oi
	r8gUbLyaBDef1S1mY1/Apz9eV2YlWK7ZN2ZyTOh341MvpiwKZjuBCwZvZsBk8+Kp/cnwrqHFPAldi
	d0T+h7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjgm-00E9v1-0Q;
	Mon, 25 Sep 2023 11:23:44 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjgg-00E9tE-1o
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 11:23:40 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c5db4925f9so42605835ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 04:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1695641016; x=1696245816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2IbUX/1OwYLXuK1h7D1CAs4ULubveo2MQxXVnkHGDM=;
        b=zMGJZnnjEgBWl/1QxtnwrHapyOKKYGSHXnMDPs+T501OprOG7sHzaxdIXv+7IO8JVF
         hyS4eYefZNUCEHfnv0a8Zvex29eOeAWNSKbJ+PKbwmcffXF/UZAuee5SkHYOxuKKTz1y
         eJqtOwG7sNxJhYUA0xWvq7qsif9dHO6JESQVFrSMEyTaz716/Kuzzuy3u1pHQutYtwQI
         hsCkVpZwRRUsjFnDupYorCqDCKFy1HRhicE1/oQ8qzMKRPQQM5V2pOnz0JNiLWfRBQ3H
         0QnchlyJzra+sE2Ve2eBYiPagFNKLBpPP7eYLgew81tKUAf2D3WS5Tobndn3miFu9o/8
         C/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695641016; x=1696245816;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2IbUX/1OwYLXuK1h7D1CAs4ULubveo2MQxXVnkHGDM=;
        b=ugPR8LSBj30bgZE+ub6IcsBrnUPvFmI7ZQUr/2NiJtflq3r4LSfj42scsLnlzt0KyW
         RAeoIfQzfNl8EaP0NpptyPNfL3ju4B2euY3f4Pokuw2pWTcVNxjEV6UfMyochE7O0f56
         RRm6wMjrWJ3vMRQyQeKVzA1hBZx0wg50NsobrlrmpSeHVHZYXeZSnY+EDOqcGLVYWM32
         G4my3v0JYEvBGQ6p6XoElX0HD0OjiNTbBIpWiSSDfGnRGJzHR9B+6rgAJSYa53jvesnm
         GLiLB+AAW+THYmrzwEdje9zf8BXNm+urJJ9ZZYL6vNhdX3WPdTNEikZSbM7ifSrsKMys
         yQQw==
X-Gm-Message-State: AOJu0YyvHoo4w74O6Z/3JqZSYoaky0rPvc4ud2ZNBB07QV5ZRaYJUf/B
	N5jSjFT4nktzL7M1jjQkSnMyT4IBC3YYcmxlbZsiDA==
X-Google-Smtp-Source: AGHT+IFQruh+OvXb+EZ8vseq3Z7KV+KCjhdzqDvEHkJ5N8BstO9vrI6bAsMmh3L2fgIPrpRJKMmygg==
X-Received: by 2002:a17:903:22cb:b0:1c6:11ca:8861 with SMTP id y11-20020a17090322cb00b001c611ca8861mr4394406plg.21.1695641016034;
        Mon, 25 Sep 2023 04:23:36 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id ik29-20020a170902ab1d00b001c0a414695bsm8775729plb.43.2023.09.25.04.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 04:23:35 -0700 (PDT)
Date: Mon, 25 Sep 2023 04:23:35 -0700 (PDT)
X-Google-Original-Date: Mon, 25 Sep 2023 04:22:42 PDT (-0700)
Subject: Re: [RFC PATCH 4/5] RISC-V: selftests: Add which-cpus hwprobe test
In-Reply-To: <20230921125518.175428-11-ajones@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
  apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-ddfdccec-5f40-4cb4-a77f-3dc3a3f12806@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_042338_604692_C4CCC534 
X-CRM114-Status: GOOD (  27.15  )
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

On Thu, 21 Sep 2023 05:55:23 PDT (-0700), ajones@ventanamicro.com wrote:
> Test the RISCV_HWPROBE_WHICH_CPUS flag of hwprobe. The test also
> has a command line interface in order to get the cpu list for
> arbitrary hwprobe pairs.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  .../testing/selftests/riscv/hwprobe/Makefile  |   5 +-
>  .../selftests/riscv/hwprobe/which-cpus.c      | 156 ++++++++++++++++++
>  2 files changed, 160 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/riscv/hwprobe/which-cpus.c
>
> diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testing/selftests/riscv/hwprobe/Makefile
> index f224b84591fb..cec81610a5f2 100644
> --- a/tools/testing/selftests/riscv/hwprobe/Makefile
> +++ b/tools/testing/selftests/riscv/hwprobe/Makefile
> @@ -4,7 +4,7 @@
>
>  CFLAGS += -I$(top_srcdir)/tools/include
>
> -TEST_GEN_PROGS := hwprobe cbo
> +TEST_GEN_PROGS := hwprobe cbo which-cpus
>
>  include ../../lib.mk
>
> @@ -13,3 +13,6 @@ $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
>
>  $(OUTPUT)/cbo: cbo.c sys_hwprobe.S
>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> +
> +$(OUTPUT)/which-cpus: which-cpus.c sys_hwprobe.S
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
> new file mode 100644
> index 000000000000..83877a715b08
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + *
> + * Test the RISCV_HWPROBE_WHICH_CPUS flag of hwprobe. Also provides a command
> + * line interface to get the cpu list for arbitrary hwprobe pairs.
> + */
> +#define _GNU_SOURCE
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sched.h>
> +#include <unistd.h>
> +#include <assert.h>
> +
> +#include "hwprobe.h"
> +#include "../../kselftest.h"
> +
> +static void help(void)
> +{
> +	printf("\n"
> +	       "which-cpus: [-h] [<key=value> [<key=value> ...]]\n\n"
> +	       "   Without parameters, tests the RISCV_HWPROBE_WHICH_CPUS flag of hwprobe.\n"
> +	       "   With parameters, where each parameter is a hwprobe pair written as\n"
> +	       "   <key=value>, outputs the cpulist for cpus which all match the given set\n"
> +	       "   of pairs.  'key' and 'value' should be in numeric form, e.g. 4=0x3b\n");
> +}
> +
> +static void print_cpulist(cpu_set_t *cpus)
> +{
> +	int start = 0, end = 0;
> +
> +	if (!CPU_COUNT(cpus)) {
> +		printf("cpus: None\n");
> +		return;
> +	}
> +
> +	printf("cpus:");
> +	for (int i = 0, c = 0; i < CPU_COUNT(cpus); i++, c++) {
> +		if (start != end && !CPU_ISSET(c, cpus))
> +			printf("-%d", end);
> +
> +		while (!CPU_ISSET(c, cpus))
> +			++c;
> +
> +		if (i != 0 && c == end + 1) {
> +			end = c;
> +			continue;
> +		}
> +
> +		printf("%c%d", i == 0 ? ' ' : ',', c);
> +		start = end = c;
> +	}
> +	if (start != end)
> +		printf("-%d", end);
> +	printf("\n");
> +}
> +
> +static void do_which_cpus(int argc, char **argv)
> +{
> +	struct riscv_hwprobe *pairs;
> +	int nr_pairs = argc - 1;
> +	cpu_set_t cpus;
> +	char *start, *end;
> +	int rc;
> +
> +	pairs = malloc(nr_pairs * sizeof(struct riscv_hwprobe));
> +	assert(pairs);
> +
> +	for (int i = 0; i < nr_pairs; i++) {
> +		start = argv[i + 1];
> +		pairs[i].key = strtol(start, &end, 0);
> +		assert(end != start && *end == '=');
> +		start = end + 1;
> +		pairs[i].value = strtoul(start, &end, 0);
> +		assert(end != start && *end == '\0');
> +	}
> +
> +	CPU_ZERO(&cpus);
> +	rc = riscv_hwprobe(pairs, nr_pairs, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
> +	assert(rc == 0);
> +	print_cpulist(&cpus);
> +	free(pairs);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	struct riscv_hwprobe pairs[2];
> +	cpu_set_t cpus_aff, cpus;
> +	__u64 ext0_all;
> +	long rc;
> +
> +	if (argc > 1) {
> +		if (!strcmp(argv[1], "-h"))
> +			help();
> +		else
> +			do_which_cpus(argc, argv);
> +		return 0;
> +	}
> +
> +	rc = sched_getaffinity(0, sizeof(cpu_set_t), &cpus_aff);
> +	assert(rc == 0);
> +
> +	ksft_print_header();
> +	ksft_set_plan(7);
> +
> +	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
> +	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
> +	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
> +	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
> +
> +	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
> +	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
> +	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_IMA_EXT_0);
> +	ext0_all = pairs[0].value;
> +
> +	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
> +	CPU_ZERO(&cpus);
> +	rc = riscv_hwprobe(pairs, 1, 0, (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
> +	ksft_test_result(rc == -EINVAL, "no cpusetsize\n");
> +
> +	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
> +	rc = riscv_hwprobe(pairs, 1, sizeof(cpu_set_t), NULL, RISCV_HWPROBE_WHICH_CPUS);
> +	ksft_test_result(rc == -EINVAL, "NULL cpus\n");
> +
> +	pairs[0] = (struct riscv_hwprobe){ .key = 0xbadc0de, };
> +	CPU_ZERO(&cpus);
> +	rc = riscv_hwprobe(pairs, 1, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
> +	ksft_test_result(rc == 0 && CPU_COUNT(&cpus) == 0, "unknown key\n");
> +
> +	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
> +	pairs[1] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
> +	CPU_ZERO(&cpus);
> +	rc = riscv_hwprobe(pairs, 2, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
> +	ksft_test_result(rc == 0, "duplicate keys\n");
> +
> +	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
> +	pairs[1] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, .value = ext0_all, };
> +	CPU_ZERO(&cpus);
> +	rc = riscv_hwprobe(pairs, 2, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
> +	ksft_test_result(rc == 0 && CPU_COUNT(&cpus) == sysconf(_SC_NPROCESSORS_ONLN), "set all cpus\n");
> +
> +	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
> +	pairs[1] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, .value = ext0_all, };
> +	memcpy(&cpus, &cpus_aff, sizeof(cpu_set_t));
> +	rc = riscv_hwprobe(pairs, 2, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
> +	ksft_test_result(rc == 0 && CPU_EQUAL(&cpus, &cpus_aff), "set all affinity cpus\n");
> +
> +	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
> +	pairs[1] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, .value = ~ext0_all, };
> +	memcpy(&cpus, &cpus_aff, sizeof(cpu_set_t));
> +	rc = riscv_hwprobe(pairs, 2, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
> +	ksft_test_result(rc == 0 && CPU_COUNT(&cpus) == 0, "clear all cpus\n");
> +
> +	ksft_finished();
> +}

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
