Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2A3C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 16:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7g0U4/rrAHxVScBLhj0/RxMXctIjqwa3UTXRpWZIS0Q=; b=eWHZIo3l+EvaNi
	T9d8+lPuhMvq4dU67AdqpBtlOpCxZCFnhvuGRDmI94qy8ywjWSjASfOu5xe12+KsTfLb1WKW9CaQh
	gGJdjzKn4tcm6FDH7+qgOiJic+0FIiCNG28qsyHQkNUTak6fRDStlBkEviDHXlwp1Lik9dapQdad5
	2BTLc/2swbatx0xvX4AMXX6bgyMiFCey8YHAn0w04jVUtaPKh5ZKKEldzpSpkOg/vr5cV9J6CT0YW
	2TogmQTendXL7TIPlbfXNkJ5eXKXGnv4F+8IACGrTIpWTeMmtOowFgufZ0dnxg9RRMln69PtQsjr/
	ORH38kIICVhkIPJ/LpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ogx-00000003ViY-0Gky;
	Wed, 22 May 2024 16:19:51 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ogu-00000003Vde-1Uuv
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 16:19:49 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7e1b520812fso35658639f.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 09:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716394775; x=1716999575; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=26coTTJPMwihRdwvqlxfLCNSgtD/ruUTDG9z4IGxkNE=;
        b=St+XOxcMhNs9ZS7FUv0gYZKjbYM0s4EiD+mqV68/sF7pspkGOcfnB9IEzOfgqx85BE
         F+7nIJRYz47qXhXaOGizNni0nu9Q8oYHBvy93y9yaNt8SEcY9rkbU4TJRUts9k0YSvUv
         AqwIrhIwXcRy+oZbJrN8xloBSXW1az1qV7kXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716394775; x=1716999575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26coTTJPMwihRdwvqlxfLCNSgtD/ruUTDG9z4IGxkNE=;
        b=Q/Z8JaO9vFDlVxi34aKkTRe3+XULNiGqL8xaJDmhDyGb8V7bshf3m7/GzJSnCGWCLH
         jUKY/+ccQJHmCkdCZEIw2vnqGITpNBg+UKOMndnn0ZmxU0bCfjmNI/klccOZCsJ/61ak
         ULQg9t3v/2M8Rxt/Y8JVG8A1UZ2fWUtEenX+3DgB3/U5AG4PIVdBvDa9NZY7bZwnWDNb
         6+Mg4enx9ZKfmU7kzag/WbrRtqVL8wbu/Z4jy/3Izx+Iqm62PDVIwSCqlJedy7lRhbqR
         ciOIFjMI0AlutJ7m/7WWdyut6KoFz5LizVd+KHEoPGXxE9pr+lkLLjN+WUY6XMPUCGQg
         dZsA==
X-Forwarded-Encrypted: i=1; AJvYcCUvO/sBTng5FfigeCYiTNv+SN3zHnG3vbu0P6326BHYLweP+mCPi4Yvxj4ZhaWXZznzOH+x1lAE03H0lt0+qLjMIOkjrQ87aiGRhB3c6v4/
X-Gm-Message-State: AOJu0YwImlfkDVjRJ6g7/dhBUDMzOMJa440awGNM2YBuLNkFO7OfSfQf
	ARFk55+7fT7EdvqE8VxLLdXXS18U4FCYYu/vuK1EOQR8zBrpfP5bWgT9nCeRrNk=
X-Google-Smtp-Source: AGHT+IH/KZa0o+v3YObJYKHyHITiD47mIwmwbzcFdaePVDylL6T1KHgx+UsgI0x7EBrdYtRJOKeT1w==
X-Received: by 2002:a5e:cb03:0:b0:7e1:d865:e700 with SMTP id ca18e2360f4ac-7e38b2004fbmr274656739f.2.1716394774799;
        Wed, 22 May 2024 09:19:34 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-489376fc6aasm7421787173.174.2024.05.22.09.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 09:19:34 -0700 (PDT)
Message-ID: <6caf3332-9ed9-4257-9532-4fd71c465c0d@linuxfoundation.org>
Date: Wed, 22 May 2024 10:19:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/68] Define _GNU_SOURCE for sources using
To: Edward Liaw <edliaw@google.com>, shuah@kernel.org,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@android.com, linux-security-module@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240522005913.3540131-1-edliaw@google.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_091948_443924_301E4FAF 
X-CRM114-Status: GOOD (  10.85  )
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

On 5/21/24 18:56, Edward Liaw wrote:
> Centralizes the definition of _GNU_SOURCE into KHDR_INCLUDES and removes
> redefinitions of _GNU_SOURCE from source code.
> 
> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> asprintf into kselftest_harness.h, which is a GNU extension and needs

Easier solution to define LINE_MAX locally. In gerenal it is advisable
to not add local defines, but it is desirable in some cases to avoid
churn like this one.

> _GNU_SOURCE to either be defined prior to including headers or with the
> -D_GNU_SOURCE flag passed to the compiler.
> 

This is huge churn to all the tests and some maintainers aren't
onboard to take this change.

Is there an wasier way to fix this instead? Please explore
localized options before asking me to take this series.

thanks,
-- Shuah

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
