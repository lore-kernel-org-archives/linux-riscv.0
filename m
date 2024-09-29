Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E25CF6499
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Sep 2024 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FUpsTzljal1Ssir7mfDJV/Dp3s6A7slJsEBuUOFpVc=; b=XbnGOkco6GsPQ9
	ErPfDdtZil+vD9DVIV2zp6lrbyybCCy128lRsl5QcmakEpvkPTDSKPIqvD4bigveGIAoh9PVCcpmm
	0HKJsRnpXnN9IX6TIyCEyHdhKNQpdU99v+zj0+L2u9drN84+8KMx0Ue0ko2NtHRafzI4TiNUMaAPb
	d/bP9uOTWlIsXooztFii54jGkLq+cOuOfiUWzk+E72BkRMb23pdkHDcdhiC+bN4zPHzvBjJtYkqyP
	44ZZgYHBQyahuaAxPhg/fUIpIP/iaRQXgpy9HJhSP2zuD/6JcD32Oa09U2Cr/B0gLpiB8sWnWK2Ux
	5mBVXbukgJlh9Dp+EEKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suvGo-0000000Ev7y-0J4O;
	Sun, 29 Sep 2024 14:51:34 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suvGk-0000000Ev7d-2S6t
	for linux-riscv@lists.infradead.org;
	Sun, 29 Sep 2024 14:51:32 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3e3a47ae905so81971b6e.1
        for <linux-riscv@lists.infradead.org>; Sun, 29 Sep 2024 07:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727621489; x=1728226289; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T65RvJ2RzDevgyS0nNwp9jJIWNgQTO30JdoGEb1Fg/s=;
        b=VdLWjPcBhY2uBhaUM087KdbU0+0k50/j4IM85+j9HXNav3rQXNu25v0u8X7FDmq0/z
         0FTvWulttRvY2QEo1uGHVPqdbYnqnn7YVDLfFUXyQrkvYecAfKfBRAATTfAf1WodZPyv
         0KkgEgLGqWBD8F1cusCeKviW7kzRIuOU1F5oJ4bt6DSO0t4B6OQPOfDEAwLUatsAo0Hn
         bhfXWhG1lwc2EhhZ8VknhsjGzDKH9IACpZcUJmWE+pZv0oS7CsZNKdjZal2PPLf3c+ZE
         vQq/uhCQGkwy0bnqklQyL+3lH99psQhZ0I5iI+wMECbYKBpCwUXbtf5nIdRyOt6Y869k
         SEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727621489; x=1728226289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T65RvJ2RzDevgyS0nNwp9jJIWNgQTO30JdoGEb1Fg/s=;
        b=BvEhhjHaECyFJzxBgzF53WdUxQy1yCnFB+S8WUqc9OyBOezGIvttSg8dcXed+VGJDI
         XV/g8owNu8QqlRtTiavhgcDWku5RtjIYl6cLJznt6+hUCPDiEKUT/qo/1V6VjSRyjXPv
         MTxajz1f9PnCiKuXL4mg5XxslDSKoCmOqLH0K9hgLUxANcwhukR2bE4AqP28i83kKDdO
         31A0wtCDQDrCSuNxOIUWGXQLq3FLVVkWK+zycXFCIno6v/6UWgY1F2139gca011T/SjR
         7oFXP6oF+zwtVPIgONoUhvz6qckujZdWIgkBAPnMY6Nk/wZfYTGwJXKXS5EkzQQYUnsO
         t9lA==
X-Forwarded-Encrypted: i=1; AJvYcCVZbJgIWEerfO4yqXvlgw2eqzAY2E9zIylQ3DnFVkVIPaQymImLVsi9BwtYJt+HrVggBVDD5LlBTIPk0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDWJyvtn+FGWydQjaqTbGw/MtsESAbBBODynM5NE0KBDxWONgJ
	6UsU+DIDQxyJgVa9vAxgtGeGjy3USiEm+wxjNIjHs0vZxAlSQJpT
X-Google-Smtp-Source: AGHT+IFcaswfHNQbdC/8ux9KsM8hlYXaU3fn82Gp+XBCe4Hq5w0ub8Nm5qf7Bqdqn2/75J87QBgfwA==
X-Received: by 2002:a05:6808:bcd:b0:3e0:5896:a0bb with SMTP id 5614622812f47-3e393968e30mr5826771b6e.18.1727621488734;
        Sun, 29 Sep 2024 07:51:28 -0700 (PDT)
Received: from [172.31.0.109] ([136.36.72.243])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e3935bdc75sm1881408b6e.40.2024.09.29.07.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Sep 2024 07:51:27 -0700 (PDT)
Message-ID: <e55950a2-beb0-4f2a-81da-1c66724116d7@gmail.com>
Date: Sun, 29 Sep 2024 08:51:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Page sizes supported by RISC-V
To: Florian Weimer <fweimer@redhat.com>, linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>
References: <878qvbzqfx.fsf@oldenburg.str.redhat.com>
Content-Language: en-US
From: Jeff Law <jeffreyalaw@gmail.com>
In-Reply-To: <878qvbzqfx.fsf@oldenburg.str.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_075130_658183_C8EE39EB 
X-CRM114-Status: GOOD (  10.05  )
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



On 9/28/24 10:35 AM, Florian Weimer wrote:
> I'm working on adding a <sys/pagesize.h> header to glibc, so that
> programmers can easily determine the range of possible page sizes for a
> particular target, for things like pointer tagging and mapped file
> alignment requirements.
> 
> Linux currently supports 4 KiB pages only.  I couldn't find anything in
> the RISC-V specifications that mandates a specific page size, but of
> course the way ELF LOAD segments are constructed necessarily imposes a
> maximum page size constraint for particular executables.  Today, the
> toolchain assumes the maximum supported page size is 4 KiB, and this is
> also reflected in arch/riscv/Kconfig in the Linux sources (as far as I
> can read Kconfig).
4k is probably the most common in practice right now.  RISC-V generally 
seems to leave this kind of thing to the implementors to decide, so I 
wouldn't be at all surprised if there's nothing in the privileged spec 
other than specifying a minimum page size.

  Jeff

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
