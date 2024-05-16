Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF476C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 18:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5ohUw75WggXhqlJQRPPBy4cg9pNa3t/Emnv5hC6ylc=; b=SBsv47ri73JzXc
	ZU0RxtJeww95tw2R8FnwSgZH7Hv6tuyHjz/Vp09KSoAw5BFj30F0O40OtLaQFmP/mG81MM+CI+1qt
	5t76bqHIL1UNsz+CrfX6dLvZHSOfT/RxUokv0QsgnzB6F2DmtYu4bfWBqzclutcX4J9KrMksitIOZ
	kixYVqh4+iAM23+U+eDn6BF7XgtQZAuVE9R0mNnOsyYyfiIkic+4TuPzNZ1hMbtcEfIs3k+9sDAVQ
	meOLSah/8RDHYA6wW/zh/pHaz0JNW4BDvy2LQTAmv1HQCFb8h9jrUjZGSrInkaGs+r13WKu/cVJIe
	irOM1cDqsn7uTV58TWYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7fUN-00000005l6b-0Ryz;
	Thu, 16 May 2024 18:05:59 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7fUI-00000005l4z-3LEQ
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 18:05:56 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7e1b8718926so9580439f.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 May 2024 11:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715882752; x=1716487552; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4kOPvncac5GEXKOWcgYcErTg+ZSoHGXXhbSEbOdfWFY=;
        b=hi11YleQEXQLa7hN7tuF1z9LX06Jli8lNjmCs3wgMFeJese8SC5ZpHVNdc1E8bzkRd
         09wgxCPnC1sDzLduZnMjMSIw7a7Luu27LpXo0XinZHsWpcUuhaga1kGoHWNAnEdpnfw9
         c26n40QhpJr4IBdj8s0OZ+cD7WmOhax6FiD2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715882752; x=1716487552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4kOPvncac5GEXKOWcgYcErTg+ZSoHGXXhbSEbOdfWFY=;
        b=rL+yZjSkFGZhNieI+6/8KOByoEh8aU5OC3Gfkxn5g77HNnfEyMq1STI0c0fF0uoCNg
         Au0pClayN39UmCskO29DnQDpqM79aBXM+h6WvSARhry1J6xYJjL91tYiQ37ikrNFBK6D
         HiR8f4UHlIQ3ICh9BiY5Ra+9UQ5gUwllMkGT7LTTwpkcefmJU3w8PhSBz/d0sC29I2I/
         A/N8sVkk2cemci2YQsvEpiWvbrmdd/QGsRfIudwENufLjQUewQ28VGyy6A21ma0+Z1sc
         S0jwttVkb244bMYRnXgWuw4nN2nqb7GzVGKW7d3IOvHPLbgvRSkdwIJObAeFGHIgmHGc
         IqLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV6MmyzztmTyqkNCjZMkW8n1HHpxT5O38cDAgYuW2/KRQDNqdZoH6wRsXVS+Kk/UnZkhfGnh8jxg4wPtitDoDew6Rwg7HX6crOtoqk2sww
X-Gm-Message-State: AOJu0YwlqIHAIVEMN7h5hct4OQLVR29BSjHATE+l7Cnx5QSK+NOV5RsB
	siaxIlGrs0Lbv0ZXqdwu0yHSJ0jwDCQ5q1pbiYUzL+HM294z48sZfdeXeSUcR+s=
X-Google-Smtp-Source: AGHT+IG9thpIuxuOJl/ateMI7c9MGpJjRHArmdLOc92/CkQSwD6jAwuSSMxSGmhDOz36YwjGKp1fTQ==
X-Received: by 2002:a6b:d203:0:b0:7de:e04b:42c3 with SMTP id ca18e2360f4ac-7e1b5022577mr2055903739f.0.1715882751618;
        Thu, 16 May 2024 11:05:51 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7e2031b57bcsm134683339f.8.2024.05.16.11.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 May 2024 11:05:51 -0700 (PDT)
Message-ID: <a8702e6b-0360-493d-bf8b-94dd7f17e7f1@linuxfoundation.org>
Date: Thu, 16 May 2024 12:05:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/66] selftests/cgroup: Drop define _GNU_SOURCE
To: Tejun Heo <tj@kernel.org>
Cc: Edward Liaw <edliaw@google.com>, shuah@kernel.org,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Zefan Li
 <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Muchun Song <muchun.song@linux.dev>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosryahmed@google.com>,
 Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@android.com, linux-security-module@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240510000842.410729-1-edliaw@google.com>
 <20240510000842.410729-9-edliaw@google.com>
 <ZkJHvrwZEqg6RJK5@slm.duckdns.org>
 <bec3f30e-fc9a-45e2-b6ea-d739b2a2d019@linuxfoundation.org>
 <ZkYymMDd690uufZy@slm.duckdns.org>
 <9e72d97a-9a04-4423-a711-0c21c1c8b161@linuxfoundation.org>
 <ZkZGP9Io6o9Dhh36@slm.duckdns.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZkZGP9Io6o9Dhh36@slm.duckdns.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_110555_410636_D2A06965 
X-CRM114-Status: GOOD (  13.78  )
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

On 5/16/24 11:45, Tejun Heo wrote:
> Hello,
> 
> On Thu, May 16, 2024 at 10:31:13AM -0600, Shuah Khan wrote:
>> I am exploring options and leaning towards reverting the patch
>>
>> daef47b89efd ("selftests: Compile kselftest headers with -D_GNU_SOURCE")
>>
>> Your amending the PR helps me if I have to send revert. I am sorry
>> for the trouble.
>>
>> I can all of them together in a second update or after the merge window
>> closes.
> 
> The cgroup commit is already pulled in unfortunately. Can you please handle
> the revert and whatever's necessary to fix up the situation? I'll ask you
> what to do with selftest patches from now on.
> 

Thanks for the update. Yes I am working on fixing the situation and
will send revert for cgroup test patch as well if necessary.

No worries. It is not a problem for you to handle cgroup test patches
in general. I will need your review anyway and letting you handle them
reduces the overhead.

This kind of framework change causes needs to be coordinated.
I should have held back on the framework change on my part.

thanks,
-- Shuah


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
