Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCEAC48BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7kCCDwGYM9UOof5DseZd3YYee04d86dkzHtT+nbPKo=; b=Bd7HikAisLRF2O
	gvmjKCxLdmYh/z9lcrwwsVbL0OJqFV/qI12BmGA1nimFCRCH4qgY1p2MZ2jj8oQtOB1q11/+GDJ1m
	2sEKw8jR9JPuXjo1vQo7Wao1UUL6vN/aX2RPzRaI3jTn9fypQKrT6X6emGTJBuYdthpvm+PyJWJmO
	Wf1CcPzQMyYEFT9FWe5B9GUlMVIYMwDBwbKNDvVLisdj30RROZgbPTcEEKgx2Hx5TRlOJ0pav1rKT
	5uSQAklIbv2eqokXHUr7hB2rPx5ujVsuT0DNFd+aP/QPxWNMW+pHZUp5zGcjGLBunmBrdHpydJtgY
	hknMK/xvkAcA09WJYy4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCbS-0000000CXiW-47RD;
	Wed, 14 Feb 2024 10:34:58 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCbQ-0000000CXi3-2HhF
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 10:34:57 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-337d05b8942so4298479f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 02:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google; t=1707906894; x=1708511694; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXOXdlKbQ7b8gP1IjielEHY25ZzqNlF3NYnAzC4w8e0=;
        b=PwgSwAxi6XgygX91tpDnFiO8ITYcf6WNcaihZxn+AUzIIEvgg/brhlochWUp1glHCJ
         uL/AuHGJI+aUagzrlMI0cbW+1ATkY5e9PGUMPm+zV8l9Ae5l7x9OtpJ68GNEOnxXn6AP
         VeJ2dP/9UIt1pG4ZbfcQ+WrGsYjcxld7jN93vTDYlZNQtkfZYdrT3/60J4KzfxK3Atrd
         q4sCKy5F8JtSpiOraJTyvEWa7xXsRy7N1kpOVyMUl86xBk6jb0lNiTrmSIMONDajEdZ5
         F5siP7T03sgBuhVwOkDgXqOA0qf4MELVLKc1L1khP3wFPp4tt+t7YP8reF1LBH6NmMQ5
         6Www==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707906894; x=1708511694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXOXdlKbQ7b8gP1IjielEHY25ZzqNlF3NYnAzC4w8e0=;
        b=ATfMruZeX+O9jXN1gaFNIdGw6UXCQtjL4N+cOwI33XYkH1LvQGU804mfarQDRSFyGl
         EKX7SfavqsD+6drDWV1FaFTzuS4Ob5uhz29f9tiiTMfyKgC0Ly+8xM1p5NZ2jM+a/tPG
         F3ZIn3cVXxqxINverqRG9ZTfcDTKZGAn7pscy+T18Jx7q/ALN2Nr/fyt4P+C1lmd09FF
         VRnKLNorv6UcKRp4MIkYmwsKfyZ+soGgkkOZMCGMUKXj4FeU9jWeANY66q1nWMiq1bu3
         jvwLZmitZJgNUu8rM4Tp4zQ8sqP3LjSOqsjwl84CWtaYxqx4mrIk2kE3vBVxLKQ9LsOf
         2YZw==
X-Gm-Message-State: AOJu0YyDe1XgJb7nZaC2LBNKzNTBUJuppOZs5dW3IlqYSvrt8CGCi3dL
	qBhdjfh5gOHum2i00ulZvk/k+YalVOQ1M2JFEnVKbprgIOXKHwgfw2BOoV0F0gs=
X-Google-Smtp-Source: AGHT+IFEPDAfEvDMu8J4XJ0lQXp8hFlITdGR9tguh8nJGFpjGxYLL/K/WaEm+SnPqS0/z0r/zmKOew==
X-Received: by 2002:a5d:50d1:0:b0:33b:433d:e1d7 with SMTP id f17-20020a5d50d1000000b0033b433de1d7mr1515184wrt.1.1707906894167;
        Wed, 14 Feb 2024 02:34:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV74FnXZgGq7FLgYrggZY2ycn0bi0uPib5wlWD/R5foh16pmW1mMSUZ8MKgolPvYKxbwkB5Tb2ORQTJzTyV6tnIc7dMp8C5IgUco11J/NRLki8V5qTDkoQzUYbjkZ1A8XE/NDvqGTXJn1Gmb+9TCsy6xwZsfB6E+eOZaCgLf4p92JA+RaN6XglKaS7iO/FjueR2FKEQMp+V+FUUO/dThdc=
Received: from [192.168.2.9] ([109.77.20.129])
        by smtp.gmail.com with ESMTPSA id bt9-20020a056000080900b0033b75d0993esm10923171wrb.74.2024.02.14.02.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 02:34:53 -0800 (PST)
Message-ID: <4cd7cee5-7943-42eb-bd26-c0e782f29a48@conchuod.ie>
Date: Wed, 14 Feb 2024 10:34:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: use KERN_INFO in do_trap
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yunhui Cui <cuiyunhui@bytedance.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org
References: <mvmh6ic1y75.fsf@suse.de>
 <20240214-exclusion-pluck-fcb6352a8393@spud> <mvmttmbz781.fsf@suse.de>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <mvmttmbz781.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_023456_624026_1AB6D85C 
X-CRM114-Status: GOOD (  11.01  )
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

On 14/02/2024 10:10, Andreas Schwab wrote:
> On Feb 14 2024, Conor Dooley wrote:
> 
>> On Tue, Feb 13, 2024 at 10:59:58AM +0100, Andreas Schwab wrote:
>>> Print the instruction dump with info instead of emergency level like the
>>> rest of the output when printing the information for an unhandled signal.
>>
>> I'm not entirely sure that this is true, __show_regs() prints with
>> KERN_DEFAULT, but this certainly is more consistent than it was before.
> 
> The first line is printed with pr_info.

Yah, that's what I meant with "more consistent" :)

> Perhaps __show_regs should gain
> a level argument.

I wouldn't be averse. There's 3 users, of which one is show_regs().
I think we could easily add an argument that sets the printk level
to match the other outputs from the non show_regs() callers. I
suppose show_regs() could retain the KERN_DEFAULT behaviour unless
you've got a better idea.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
