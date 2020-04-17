Return-Path: <SRS0=37zL=6B=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B88AC2BB1D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2020 22:59:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D450214D8
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2020 22:59:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j5jWM5Cm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arista.com header.i=@arista.com header.b="XFfxS9KM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D450214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=arista.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+eK9oKTOT3i8zAun0pqdW6UL+0nXAjeXn0xSjWy3ek=; b=j5jWM5Cm3VgWvI
	r2VsptvriGxv7o2ClQkpEGyF42TZjR8H9reI02DAo/5vAnXP4jQHR+X6mvRvJnzxnqSsMuVIMyaV3
	t3iT5gN/8upWaw1iKX3WKlNbQnlcpS49PmNi45qUkNklXwdj8tTdE7KPDsTInY3N6cYMPkK0bjT5e
	vXB9/pavxkFXNvAUqOaPNMCu2Fu1p48T8VN9h3fscxwir9KckbLh3ixYR6WtLqoHz2XNLIdV0Bq9k
	YxrqkqOmr7ItnBEVYFelbARSAK/gtzSIL6BTLwP3V/IBFxaZ0AWfZzWkFnEt1HtcXziQcY7ZOMyyC
	S3kGUD+djeIhvK4yNbAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPZwy-0003iX-On; Fri, 17 Apr 2020 22:59:08 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPZwv-0003i4-8u
 for linux-riscv@lists.infradead.org; Fri, 17 Apr 2020 22:59:07 +0000
Received: by mail-wr1-x443.google.com with SMTP id g13so2802301wrb.8
 for <linux-riscv@lists.infradead.org>; Fri, 17 Apr 2020 15:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9+eK9oKTOT3i8zAun0pqdW6UL+0nXAjeXn0xSjWy3ek=;
 b=XFfxS9KM5RUpYEecDU9LDOTUnYwrQ87bsghotn9o5G37xaObnMtd8FAwhQDPL53IAM
 UdZR8vn7/AtBs/8VwzLToZRY7JA4FRDBCaGXC10UhrvN26Luq6/JzgwcWQrPcA6x5jcd
 3l/ZCADGoGHBAU7VnVJkKn0q3li6SfPlC5H1+4CI+57yfqchhhCT/wBS/Kh1ZoFWSDOq
 W5HT3Q1M0eYUsQdbrrsRBReDHa+b4Y7g1reMHhQP9iaI6+naf/zOhmwNdFKkfkpXDuEr
 2WDaufDeHlN/+xRGdmp4nLIz2kGiaMc/NXIYDDXcvuedv/EQHV+eTS8pR1LxRKT/dRru
 o3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9+eK9oKTOT3i8zAun0pqdW6UL+0nXAjeXn0xSjWy3ek=;
 b=YhEppX5ZuJkqe0wSDCzf5C8YmZ2bprN59OZip7oRT9uTpGBWCMNfwvCiYScZXNeaY8
 ejmBzBXjTwuMUPdArrNpXNZ4u28sPGlz/Vd9/a9aRhXZXLWQuKUXAAvkmBrkjBjdzy/V
 49A8DgZiwFnB8KBNJyMK7YJQn0FN/Z1rhzaw26QE4T0UEDpkGO/NT0zwwg3x4SZwa8ZF
 WujPn+LAv7v8igjDXfEaegq7dyhMtOn236UgUjmCODrawdIqNWI881V7UsmHljY35wlH
 94owVUeUZxfFTPfo+Av/nUQ4hKCLZtEy4E71Y95yTEJ8FOjcSv2C88r884xBJe79pvnf
 ZETg==
X-Gm-Message-State: AGi0PuYiWS7qEmdQwF41rXN5iOEaJMAYyLqrRiTDblxSQ10zvnYUf9X5
 Ma2Q8rEjgZoe0B25FxvmUoqlnw==
X-Google-Smtp-Source: APiQypLqlt3uovyL1IBjjjc8qBljmPanbafSQqKnsPq+OIxxCLbZ6Nc44ailz0qCbC7ZjccZO5rHEw==
X-Received: by 2002:a5d:4452:: with SMTP id x18mr5960505wrr.231.1587164343004; 
 Fri, 17 Apr 2020 15:59:03 -0700 (PDT)
Received: from ?IPv6:2a02:8084:e84:2480:228:f8ff:fe6f:83a8?
 ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id p7sm34069559wrf.31.2020.04.17.15.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 15:59:02 -0700 (PDT)
Subject: Re: [PATCHv2 01/50] kallsyms/printk: Add loglvl to print_ip_sym()
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
References: <20200316143916.195608-1-dima@arista.com>
 <20200316143916.195608-2-dima@arista.com>
 <97ea305c0d336f3c36a804b37e6bbb4b1bbf24fd.camel@perches.com>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <7d17eaf8-a3a8-eaba-ff80-e857135571e1@arista.com>
Date: Fri, 17 Apr 2020 23:59:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <97ea305c0d336f3c36a804b37e6bbb4b1bbf24fd.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_155906_175439_BC04CD9C 
X-CRM114-Status: GOOD (  12.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 James Hogan <jhogan@kernel.org>, Dmitry Safonov <0x7f454c46@gmail.com>,
 Ben Segall <bsegall@google.com>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Jiri Slaby <jslaby@suse.com>, Petr Mladek <pmladek@suse.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Michal Simek <monstr@monstr.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Joe,

On 3/16/20 3:29 PM, Joe Perches wrote:
> On Mon, 2020-03-16 at 14:38 +0000, Dmitry Safonov wrote:
>> print_ip_sym() needs to have a log level parameter to comply with other
>> parts being printed. Otherwise, half of the expected backtrace would be
>> printed and other may be missing with some logging level.
> 
> There are 15 instances of print_ip_sym.
> 
> Perhaps it'd be better to get rid of print_ip_sym
> altogether by expanding it in-place instead.

I tried this and format-string + two casts to (void *) take some space
and the resulting printk() doesn't fit 80 cols.
I guess, it's minor and it can be done on the top of v3..

> 
>>  arch/microblaze/kernel/unwind.c | 2 +-
>>  arch/mips/kernel/traps.c        | 4 ++--
>>  arch/nds32/kernel/traps.c       | 4 ++--
>>  arch/riscv/kernel/stacktrace.c  | 2 +-
>>  include/linux/kallsyms.h        | 4 ++--
>>  kernel/locking/lockdep.c        | 4 ++--
>>  kernel/sched/core.c             | 6 ++----
>>  kernel/trace/ftrace.c           | 8 ++++----
>>  tools/include/linux/kallsyms.h  | 2 +-
> 
> 

Thanks,
          Dmitry


