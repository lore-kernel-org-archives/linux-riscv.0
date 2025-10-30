Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FF1CCF9F0
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 15:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RuTzW7bzso1O0An3eg0j5C1Eq+nbkUpP9b8cJH0no+w=; b=a46M6+QPQWKcr9
	CMGNvogHFMvDfP39/uiTtz3hrD58y7MbmJnqIOcYLCTw4eRiEAJb5uVMu1e2qZQA1QQBYuXrzUo6r
	ltrDIg+ZHy7UEtNF6RWBXmrIKhO/XyIvdl+PMOMV3HJRSZHwABQRMlHKJhWlEFtfX0sYYwK8CLnrl
	n6JV+U9a+f3HzAbJgHD5P4iy6OFwxyOsKJqzAblgIk3i1bhImntZU/YbDHqOV7jbklLXE7MO6aXAd
	Fmf9Zd2/Wzhi2Fq2zPTsjOaFpGhg0Ae7LKCFbj7TzsqhGeif3kjqRV86J8p/uyDgjaptlAA991v1P
	j1SMl38q1bmdK9O1nMCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUCo-00000004Ldh-33Xe;
	Thu, 30 Oct 2025 15:04:50 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUCk-00000004Lby-3LfC
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 15:04:48 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b8aa14e5ed9so919950a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761836685; x=1762441485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f00VBxUENVeblbXPvhKCpxOm0snkMJ7cmP2mPUW0kL4=;
        b=jPGjhUGEdRzX+YDoU6bmdo/I0/Jy5UuRitDKCggsJWcwrCHKtsi0IO+EPUsH19IYeO
         azqt9+ynHldy9q2LiDfs84HOOtIHR3xyLfW3fih65/yvQZ+XxsbXDheE4RhVQhqOGh5F
         a0fRz5sfMcC9pW8zrbY89qRH1I3F1uUSOlLewMlxhFsuoLpD/zn5HUgLdPasKyESiQqc
         1BGqejCWHy6L3xrVj0+r3dCJ9OCUgdshQ0hTHPkJr0vDn5KYx7duY73jQpL8rrugjA9D
         LYPoN6LTlqkOI3+TiqxTM/nkexDlow13i81VJcO92nuQB7meva0/++D4kaiX+EMT2LuJ
         h7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761836685; x=1762441485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f00VBxUENVeblbXPvhKCpxOm0snkMJ7cmP2mPUW0kL4=;
        b=XjaugjGe4ctNg/QfjjfbAmL5YlUxs5B7rPlNtX3Ljfl6EbXj4kBHC5EV700JOcHk97
         8zr2RsgeaCJRKZoVfznZANJY7U0wLkRNKbrgYkz2b1kZ4NRrbbyQtBJGCNPpZ3e3dlq4
         qXsg5qk4HJ2vw86YEYifIEyeqOC1dGblHICMaLETUR2oInyUZjoJd0R5e3tBSXXfbeYf
         sQhZIjVLjt7D2uLBp/KQwwX5wD/sXDrHxwfmv7qFHEEaRVIhqaZqq6W7JUK5yG4D5rXp
         +C3pg3MAXkhNRovIKPk1eFh4LN4hO1X5FaFxzwJVfT4CoMxc9ATfRtykdZ1Nqa6lFAAJ
         YmwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg2EGiNaKAF4AKQaJMUAEbxfsBDeDM1bAIu5dnEJAZqpF1vzo1MBblkGAGvKoP11ug5Kq0qucIpxdMpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzB4XZTnd6TvyTBPaEuBxhUhTybpYVXzH3BkpKpHX38MrZjybbV
	NdM3jt3Npp5Wn41rmG225AeXv6ettbpLw8Ug4g7Y4xKX+7AVFUkhTiwp
X-Gm-Gg: ASbGncsiMuWyq8wu/mRVChqRI9pY+mmAV1izOX+95D7VYITqJp4qTYC35yqMGeRjFZT
	cP8L/Z1WNJdaWuzI2NU5ted2gFA99h6H1cY0FQDO9HfhJCeHu8GZ12K/PE/Pbe6KmqaqtnwVjBH
	87rwMRfMICIk2U+fX8R7gnU0k60p7bsejsp+JkKWhE5iMg0dIjT1sq00q3SZ+IqKVPzpglN7nWh
	05paDiNJb2uVhyQGso1RNeWJIH52o2hZ2neCCOu3tI2xzDG2w8tttUbEGLAXiSzZRg9Iizu8zWL
	wrZQlj9QS3+wHhbdMwEJKGZR2uVZAHypLvRfBw/aBn2+H42u3vEcx+MglCqRiGcPsEu3INcTXbI
	mvc7mV3V+fXYdJPvVVbxDjRv/AwaeObOViweLrLRVAq0nqZ/asKpfnPLBY5cdAu2Z0du+kFPN4v
	YFo5FT+YtOoD+69/FA9VGeqsdqUXkMJYfVjZkrUIUSmr1V1g==
X-Google-Smtp-Source: AGHT+IFxuPu5wcyDPeg3Kdk0JRjahgJ17UoLRDSJTEQ1u/yQOEaCGqjms2tHqaizN3DYh1M8w79Hqg==
X-Received: by 2002:a17:902:db10:b0:290:dc5d:c0d0 with SMTP id d9443c01a7336-2951a50c96amr102885ad.49.1761836684991;
        Thu, 30 Oct 2025 08:04:44 -0700 (PDT)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d274b6sm188234395ad.59.2025.10.30.08.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 08:04:44 -0700 (PDT)
From: Xie Yuanbin <qq570070308@gmail.com>
To: david@redhat.com
Cc: acme@kernel.org,
	adrian.hunter@intel.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	andreas@gaisler.com,
	anna-maria@linutronix.de,
	aou@eecs.berkeley.edu,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	bsegall@google.com,
	dave.hansen@linux.intel.com,
	davem@davemloft.net,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	hpa@zytor.com,
	irogers@google.com,
	jolsa@kernel.org,
	juri.lelli@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux@armlinux.org.uk,
	lorenzo.stoakes@oracle.com,
	luto@kernel.org,
	mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	max.kellermann@ionos.com,
	mgorman@suse.de,
	mingo@redhat.com,
	namhyung@kernel.org,
	nysal@linux.ibm.com,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	pjw@kernel.org,
	qq570070308@gmail.com,
	riel@surriel.com,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	segher@kernel.crashing.org,
	sparclinux@vger.kernel.org,
	svens@linux.ibm.com,
	tglx@linutronix.de,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	will@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 0/3] Optimize code generation during context
Date: Thu, 30 Oct 2025 23:04:17 +0800
Message-ID: <20251030150417.684-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <c6f8871a-5118-4947-9801-43b2a7a42993@redhat.com>
References: <c6f8871a-5118-4947-9801-43b2a7a42993@redhat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_080446_836133_D586CCCB 
X-CRM114-Status: GOOD (  12.68  )
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

On Wed, 29 Oct 2025 11:26:39 +0100, David Hildenbrand wrote:
>> I did some testing using my devices,
>> and the testing logic is as follows:
>> ```
>> -	return finish_task_switch(prev);
>> +	start_time = rdtsc();
>> +	barrier();
>> +	rq = finish_task_switch(prev);
>> +	barrier();
>> +	end_time = rdtsc;
>> +	return rq;
>> ```
>>
>> The test data is as follows:
>> 1. mitigations Off, without patches: 13.5 - 13.7
>> 2. mitigations Off, with patches: 13.5 - 13.7
>> 3. mitigations On, without patches: 23.3 - 23.6
>> 4. mitigations On, with patches: 16.6 - 16.8
>
> Such numbers absolutely have to be part of the relevant patches / cover
> letter to show that the compiler is not actually smart enough to make a
> good decision.

This was indeed my oversight; I did not read the submitting-patches
documentation carefully, thank you for your pointing it out, and I deeply
apologize for this.

Do I need to send the V2 version patches to supplement the relevant data?

By the way, the above data was tested in WSL. I did a more detailed test
on a physical machine. If possible, this data may be more appropriate:
Link: https://lore.kernel.org/20251027152100.62906-1-qq570070308@gmail.com

> Cheers
>
> David / dhildenb

Thanks very much.

Xie Yuanbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
