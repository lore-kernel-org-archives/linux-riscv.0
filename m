Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A1FE88D8D
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 09:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHn8FrDQ4nZzp4sn4HE0yGqnpZW9U/NLgnSi+pVDMIM=; b=PECtqmvTcVScjN/L/uAQHcYVXh
	PbEgSFT61CytfmTQtrnYJwil2NzYrChJqRDiB+WlGOIqtfK4pL5BhwFy1Lx5lv1clgLEHMAaVZlv4
	IpM44iaq9TZWJnh1MyAzjm7yluNP53JbFPTG4vYT+C2N97kvu/rqH9/kTcbusJGjaJq1ETU3hskOW
	23jTCEH9nnX+ihgi7HKLm5DUIhwhp9pvid7lfQ1w2mJeMA5Y1ZgM+FvvmyXQSW8HU45x1LMkd6J6Q
	KZGVsK22NwtX3VRThowEmVMzap2564NysEWHMcTW36gPKdZMHkLi4/1bEuzhYZKrJT+Ee2Fnq1A+/
	xwWpd9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8xAk-00000003K0x-0adP;
	Sat, 04 Apr 2026 09:20:06 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8xAg-00000003Jzm-1h7T
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 09:20:04 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2c15849aa2cso2953024eec.0
        for <linux-riscv@lists.infradead.org>; Sat, 04 Apr 2026 02:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775294401; x=1775899201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4D9KIHfQ19G+ih5n0VIDlQHW6gYQM9spmrNFkW8GpA=;
        b=kzJRjqPRO3iqvbBoy1hkMGkKt0FHtJCAhox6eOANC9AfFCfnDk050lvqwi8G3v9Iwh
         nQT2Ud22fw2MHruDvuJHusPimV7Dtg3vMT1Awbz3RogAt8dO3uozZvxiuCHZWeZGEKQd
         3QpASqLJ1a8OBtZwr23cYnvJy/G7IC0fKQ9B7YrS5wrAXy6xkhM+6Qb+gbenSkgZdnEU
         hjsEb4VpmpPKIyXvSxa8rC3xPN60M2WEISukkgq+L2oyTjpQBHtzNYY2qJEPmLsB8CK0
         ZryPYr+zVf7YY3u7NRvOiy7rYj8W9dxY2PgM9+vVYZI8HM5e13FZC4OOB67MpsAlN8r+
         vkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775294401; x=1775899201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m4D9KIHfQ19G+ih5n0VIDlQHW6gYQM9spmrNFkW8GpA=;
        b=q5qgoHNNrQPABKlJrr4AMIk8Ttw6QG1nJXSF1wnR0kkc1gFOlHf6QQid2oNopgXpu1
         1hUfhs0AcnkQEfJwpKeV0mbj5lBCf161RIaqlH1/PqaurbJZcylHY/uaWgtk152TQU2y
         qjgG7BHwBKz+6hJISzhe+OdXlw3wN+e9VDDbbA4EW8LgTv9IGSSHaZsRQcZLxJ2kcmUV
         e1BkA6wwOz8XIG8XVYdKBHnbb4JIeiih/yr8XiuNWGLl0fMWl/1iVPxuXxRBkwtOLEGI
         4W7WZZrQS36qEve6V2WvVs6yZrCz3ycEN585VZ9URBFIlbcEZbopl40B61+n5nNMXxdo
         O+lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOVLf+j9Utv230Tn7pgWhtjhCslnbFiUnygd1yHawvqY6mcqZyPkumGQErE8wopsZfYoot1oPLtfa20A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnpbYcoSx3kWiezzYWtP5+bCdBsvHZ4NQafLskkhIEf+u6DES2
	YJOJwpDGdRMukkTonukAVM6HqVRIX3k8dz54m8411fJ767v1w+ZZ8xTB
X-Gm-Gg: AeBDietg3R0gaCmsadgO6vWt8mFvfG6WNPBZM6sa/6JDS9FBQq3+uh1YdRe76bgur8Z
	8z3w8J+SDLtpHtsLbCkbch71SAdAsSUIbU6E8a+xjPnaYZA8teE7Zw1fQdlBsvJeKuYhs7CWans
	e7FmOUA64CGJEcycnhP3l8nT9/GGaLXj+OjyGHuXRxkhIFh7SxdhzisiumNrBMCdHF1tFNoBBL1
	SOXWdvTT9igqXMm4wLgZ5jakMzSnM+fJmVN3A13fQMioTpcaaSSK54USdLRazY9LQefICY7JYB+
	KjyGwk79yMuV6PK94A6yrwVh585Qf41LEG/+ImlSn4kjctd3rlleGBypV7b4O6MPVnPqDjKhCu5
	jluAJg1IXSTjDSEbY4YItoDwpbijmD6MALRrEVFCYHm2sumFeeRO4CdZ6XPteg0urRwr0UBvtmZ
	fNTzIYv7W6tcI0dVOnmp2Dzvw=
X-Received: by 2002:a05:7300:a287:b0:2c1:74ad:2cd7 with SMTP id 5a478bee46e88-2cbfbf760c4mr2791873eec.27.1775294400761;
        Sat, 04 Apr 2026 02:20:00 -0700 (PDT)
Received: from localhost.localdomain ([2607:f130:0:11a::31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df3b84sm7176920eec.5.2026.04.04.02.19.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Apr 2026 02:20:00 -0700 (PDT)
From: wang lian <lianux.mm@gmail.com>
To: 21cnbao@gmail.com
Cc: akpm@linux-foundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	surenb@google.com,
	willy@infradead.org,
	wang lian <lianux.mm@gmail.com>,
	Wang Lian <wanglian@kylinos.cn>,
	Kunwu Chan <chentao@kylinos.cn>,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying page faults after I/O
Date: Sat,  4 Apr 2026 17:19:32 +0800
Message-ID: <20260404091936.51961-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CAGsJ_4wnwAet4svDrxT4sTdp24sweAU-2VyYn3iNPOoaKdXxPw@mail.gmail.com>
References: <CAGsJ_4wnwAet4svDrxT4sTdp24sweAU-2VyYn3iNPOoaKdXxPw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_022002_442008_7674DC9E 
X-CRM114-Status: GOOD (  15.65  )
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
Content-Type: multipart/mixed; boundary="===============8418261870289922443=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8418261870289922443==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Hi Barry,

> If either you or Matthew have a reproducer for this issue, I’d be
> happy to try it out.

Kunwu and I evaluated this series ("mm: continue using per-VMA lock when
retrying page faults after I/O") under a stress scenario specifically
designed to expose the retry behavior in filemap_fault(). This models
the exact situation described by Matthew Wilcox [1], where retries after
I/O fail to make forward progress under memory pressure.

The scenario targets the critical window between I/O completion and
mmap_lock reacquisition. This workload deliberately includes frequent
mmap/munmap operations to simulate a highly contended mmap_lock
environment alongside severe memory pressure (1GB memcg limit). Under
this pressure, folios instantiated by the I/O can be aggressively
reclaimed before the delayed task can re-acquire the lock and install
the PTE, forcing retries to repeat the entire work.

To make this behavior reproducible, we constructed a stress setup that
intentionally extends this interval:
* 256-core x86 system
* 1GB memory cgroup
* 500 threads continuously faulting on a 16MB file

The core reproducer and the execution command are provided below:

#define _GNU_SOURCE 
#include <errno.h> 
#include <fcntl.h> 
#include <pthread.h> 
#include <stdatomic.h> 
#include <stdint.h> 
#include <stdio.h> 
#include <stdlib.h> 
#include <string.h> 
#include <sys/mman.h> 
#include <unistd.h> 
#include <time.h> 

#define THREADS 500 
#define FILE_SIZE (16 * 1024 * 1024) /* 16MB */ 

static _Atomic int g_stop = 0; 
#define RUN_SECONDS 600 

struct worker_arg { 
        long id; 
        uint64_t *counts; 
}; 

void *worker(void *arg) 
{ 
        struct worker_arg *wa = (struct worker_arg *)arg; 
        long id = wa->id; 
        char path[64]; 
        uint64_t local_rounds = 0; 

        snprintf(path, sizeof(path), "./test_file_%d_%ld.dat", 
                 getpid(), id); 
        int fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0666); 
        if (fd < 0) return NULL; 
        if (ftruncate(fd, FILE_SIZE) < 0) { 
                close(fd); return NULL; 
        } 

        while (!atomic_load_explicit(&g_stop, memory_order_relaxed)) { 
                char *f_map = mmap(NULL, FILE_SIZE, PROT_READ, 
                                   MAP_SHARED, fd, 0); 
                if (f_map != MAP_FAILED) { 
                        /* Pure page cache thrashing */ 
                        for (int i = 0; i < FILE_SIZE; i += 4096) { 
                                volatile unsigned char c = 
                                        (unsigned char)f_map[i]; 
                                (void)c; 
                        } 
                        munmap(f_map, FILE_SIZE); 
                        local_rounds++; 
                } 
        } 
        wa->counts[id] = local_rounds; 
        close(fd); 
        unlink(path); 
        return NULL; 
} 

int main(void) 
{ 
        printf("Pure File Thrashing Started. PID: %d\n", getpid()); 
        pthread_t t[THREADS]; 
        uint64_t local_counts[THREADS]; 
        memset(local_counts, 0, sizeof(local_counts)); 
        struct worker_arg args[THREADS]; 

        for (long i = 0; i < THREADS; i++) { 
                args[i].id = i; 
                args[i].counts = local_counts; 
                pthread_create(&t[i], NULL, worker, &args[i]); 
        } 

        sleep(RUN_SECONDS); 
        atomic_store_explicit(&g_stop, 1, memory_order_relaxed); 

        for (int i = 0; i < THREADS; i++) pthread_join(t[i], NULL); 

        uint64_t total = 0; 
        for (int i = 0; i < THREADS; i++) total += local_counts[i]; 

        printf("Total rounds     : %llu\n", (unsigned long long)total); 
        printf("Throughput       : %.2f rounds/sec\n", 
               (double)total / RUN_SECONDS); 
        return 0; 
}

Command line used for the test:
systemd-run --scope -p MemoryHigh=1G -p MemoryMax=1.2G -p MemorySwapMax=0 \
--unit=mmap-thrash-$$ ./mmap_lock & \
TEST_PID=$!

We also added temporary counters in page fault retries [2]:
- RETRY_IO_MISS   : folio not present after I/O completion
- RETRY_MMAP_DROP : retry fallback due to waiting for I/O

We report representative runs from our 600-second test iterations 
(kernel v7.0-rc3):

| Case                | Total Rounds | Throughput | Miss/Drop(%) | RETRY_MMAP_DROP | RETRY_IO_MISS |
| ------------------- | ------------ | ---------- | ------------ | --------------- | ------------- |
| Baseline (Run 1)    | 22,711       | 37.85 /s   | 45.04        | 970,078         | 436,956       |
| Baseline (Run 2)    | 23,530       | 39.22 /s   | 44.96        | 972,043         | 437,077       |
| With Series (Run A) | 54,428       | 90.71 /s   | 1.69         | 1,204,124       | 20,398        |
| With Series (Run B) | 35,949       | 59.91 /s   | 0.03         | 327,023         | 99            |


Notes:
1. Throughput Improvement: During the 600-second testing window, overall 
   workload throughput can more than double (e.g., Run A jumped from ~38 
   to 90.71 rounds/sec).
2. Elimination of Race Condition: Without the patch, ~45% of retries 
   were invalid because newly fetched folios were evicted during the 
   mmap_lock reacquisition delay. With the per-VMA retry path, the 
   invalidation ratio plummeted to near zero (0.03% - 1.69%).
3. Counter Scaling and Variance: In Run A, because the I/O wait 
   bottleneck is eliminated, the threads advance much faster. Thus, the 
   absolute number of mmap_lock drops naturally scales up with the 
   increased throughput. In Run B, the primary bottleneck shifts to the 
   mmap write-lock contention (lock convoying), causing throughput and 
   total drops to fluctuate. Crucially, the Miss/Drop ratio remains near 
   zero regardless of this variance.

Without this series, almost half of the retries fail to observe
completed I/O results, causing severe CPU and I/O waste. With the
finer-grained VMA lock, the faulting threads bypass the heavily
contended mmap_lock entirely during retries, completing the fault
almost instantly.

This scenario perfectly aligns with the exact concern raised, and these
results show that the patch not only successfully eliminates the retry
inefficiency but also tangibly boosts macro-level system throughput.

[1] https://lore.kernel.org/linux-mm/aSip2mWX13sqPW_l@casper.infradead.org/
[2] https://github.com/lianux-mm/ioretry_test/

Tested-by: Wang Lian <wanglian@kylinos.cn>
Tested-by: Kunwu Chan <chentao@kylinos.cn>
Reviewed-by: Wang Lian <lianux.mm@gmail.com>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

--
Best Regards,
wang lian


--===============8418261870289922443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8418261870289922443==--
