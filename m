Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC20DCCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 15:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJTVi1fbHj1M76IT6eFwkfqY9cm17BjIUqA5PZnpN7M=; b=M2RJe65R0VyDrS
	aBSMKerRSgi2A/TWV+dIp5E3zOU9/HoyMPgrkRQe38yWevi8yOfZgsEdiJE7KUF9HJDQbwWifsYC0
	XefVYpcHioip/Y3DdcI5SUdZ1B+WltOFpqRF3xyFvcJaTAj/2Q5F8U/PhWnbkzHoEbYlcxqjVqFk7
	oU2zzY/i7iDPgQEylG7JenjOsh2Th1w/CgD+N7Ptg1m7YEdY40xvSW0r5O7BXyPGQGknKkkO5QyV8
	UbiX1oi+IpRv5nCSTDHO7JU9KnchqBmsEfgg/a8zjYXUtQKNbsmgIqWlKSqD7o1bWd3RyS5YbEvCR
	tYqduqD5qsqGfYAeEjOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gun-0000000Gpas-2min;
	Tue, 14 Oct 2025 15:26:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8guj-0000000GpYg-0HaL
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 15:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760455571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BPklb6K1+lkU1jV8UO4c/obMd20v1vJ9fV4tt0H1zPw=;
	b=RweqxQ+V0ktjKiFe9JID4OkFsr51HG2RWDe52/tDj9HfpOdbUz2ReLjxtBgQmlrHm7XOKE
	5FfuReY2J/QsCpjPv0x9ETfBZD5qoUHuXUnZb9Vpa1Br2DxIo8Mj3rEa1yeTDXT3Rrrwqn
	P4DJQZcRlFkROtdwiEiAlI/AObZHZT0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-LWvtoq4WMJe3Tro82Pq75Q-1; Tue, 14 Oct 2025 11:26:08 -0400
X-MC-Unique: LWvtoq4WMJe3Tro82Pq75Q-1
X-Mimecast-MFC-AGG-ID: LWvtoq4WMJe3Tro82Pq75Q_1760455567
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e7a2c3773so28335125e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 08:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455567; x=1761060367;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BPklb6K1+lkU1jV8UO4c/obMd20v1vJ9fV4tt0H1zPw=;
        b=WJ8QplVSgaII1nFUBeb10iGmRnRmJ2NsBN6LnSQmVXr9MpbiJYxlAxy0jnss3KacUn
         yfnpyzQzttlzWOxygl80wH/jQFKZ4p68Sd7gwSSSmlTvnw3BA2/VWC5yyMc2ilSSUka8
         rhdbyw3GJf8UWYh5ddP44INfriqk1fQlrcIHStS/YuxgSV1NuV5GAZmJuPHBBV9TxqY2
         ZZs3yUROSdMUZaPthNrHGscSLum02AlEFjVHCqfoBKGJEu+F2BcxC7IVsD0TXkrd+HxN
         HAVxZ/QB9WK1/JDyVovYF5+b2b/8kOjCBSP8G+OvABj3asEDRUOmhS4VLk6KumFDnJNk
         WQEw==
X-Forwarded-Encrypted: i=1; AJvYcCU8PYgLqkU07OsF5DEa+lxp+KX3p85svT8jGKRoW6a6ZJwUBrLegWT83BeHdqmsMPu1mpPRmQbAdj4jWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHlSt2B+ETIQ9SlmjxkReS5WqALYDOtXcG5YCbc5u7vATgJGyB
	TMyq6WAndiBhKx9QUnsx2Sck3hsEluoeU4Vaez5zmaL3hWQIgi8JBXMHcUTdBBonvWsuDRY++PW
	23A6WTjyQiIS8bvS3qpk+r/qgFyNRnLqq7VzPCJB9AtA24DjsEfU2Cw1A4K+wYm8zosh+UA==
X-Gm-Gg: ASbGncv3uBQvSLvIo9Np0bKij5b/NOuKabzGByxPkT90ELfc3FvVS0uSoR/Y7C6f32s
	A+oLiobbuB8MJa2awAohQrbRiEVxiTuJhKwn0L8/NIYf0NkiR066/2yZrPf5la9uf2ClU/3MbK8
	R0FZaEbunjXw3zmCzlCw23A6ESlTP5SfmUcjxnUFb5vpDhmn3UznwA0VkR/5hqaCR9ft/jvVZvx
	tGzptWZ8E9/ndL6iaAqdVAJkcYZzx4o7yZtQyqkLl1FM24Wm8SM5LWcx2R4Ej+Hp5QUZe53Y4tH
	ahTTS2i2gvuL6iUZ1RZRxSi/hxjclaO8NmGU7Z1wDdkFCew+HlF/M3Ckd0+29Xr9cesFRJUweAM
	lqbab1sq651Q0jc/YZrLcrTCmkQ==
X-Received: by 2002:a05:600c:8115:b0:46e:711c:efe9 with SMTP id 5b1f17b1804b1-46fa9ec7556mr181899015e9.13.1760455566800;
        Tue, 14 Oct 2025 08:26:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW593XOgtaLpqw6H4D31qH5lmbNbujonLfE4h+J4hQ9AwSFy0g3uK3ztnKvCXj4YJKI0uSVg==
X-Received: by 2002:a05:600c:8115:b0:46e:711c:efe9 with SMTP id 5b1f17b1804b1-46fa9ec7556mr181898575e9.13.1760455566403;
        Tue, 14 Oct 2025 08:26:06 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d3b9sm24483884f8f.11.2025.10.14.08.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:26:05 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Clark
 Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Daniel Wagner <dwagner@suse.de>,
 Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 00/29] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
In-Reply-To: <aO5I2WGtXqSPYFmH@jlelli-thinkpadt14gen4.remote.csb>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <aO5I2WGtXqSPYFmH@jlelli-thinkpadt14gen4.remote.csb>
Date: Tue, 14 Oct 2025 17:26:04 +0200
Message-ID: <xhsmhzf9tld2r.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0A55LVl5IP-fb0lHz7pjc93yPLLpDLcajiRoECf2uYs_1760455567
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_082613_460273_1F32AD61 
X-CRM114-Status: GOOD (  15.84  )
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

On 14/10/25 14:58, Juri Lelli wrote:
>> Noise
>> +++++
>>
>> Xeon E5-2699 system with SMToff, NOHZ_FULL, isolated CPUs.
>> RHEL10 userspace.
>>
>> Workload is using rteval (kernel compilation + hackbench) on housekeeping CPUs
>> and a dummy stay-in-userspace loop on the isolated CPUs. The main invocation is:
>>
>> $ trace-cmd record -e "ipi_send_cpumask" -f "cpumask & CPUS{$ISOL_CPUS}" \
>>                 -e "ipi_send_cpu"     -f "cpu & CPUS{$ISOL_CPUS}" \
>>                 rteval --onlyload --loads-cpulist=$HK_CPUS \
>>                 --hackbench-runlowmem=True --duration=$DURATION
>>
>> This only records IPIs sent to isolated CPUs, so any event there is interference
>> (with a bit of fuzz at the start/end of the workload when spawning the
>> processes). All tests were done with a duration of 6 hours.
>>
>> v6.17
>> o ~5400 IPIs received, so about ~200 interfering IPI per isolated CPU
>> o About one interfering IPI just shy of every 2 minutes
>>
>> v6.17 + patches
>> o Zilch!
>
> Nice. :)
>
> About performance, can we assume housekeeping CPUs are not affected by
> the change (they don't seem to use the trick anyway) or do we want/need
> to collect some numbers on them as well just in case (maybe more
> throughput oriented)?
>

So for the text_poke IPI yes, because this is all done through
context_tracking which doesn't imply housekeeping CPUs.

For the TLB flush faff the HK CPUs get two extra writes per kernel entry
cycle (one at entry and one at exit, for that stupid signal) which I expect
to be noticeable but small-ish. I can definitely go and measure that.

> Thanks,
> Juri


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
