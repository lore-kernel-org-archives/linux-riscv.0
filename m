Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B694FC25B77
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 03:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3hzBw5tyvQ8uUrs5Nh16jHiMCKvg1X2HehV6a/i68c=; b=uhBLLqg8kHGCUC
	oGpivIwhVCqspaExRJEoVOrJ72718tLbidliRF46Tm3sNdSKwKeLFWsegb387CIDJohWBe/nWgnNs
	XGQ0lmh5AGtuR8mJEN8EfFzxB1K5Yhfm+a4Rg3F6wjQI1CAN5sRqz9DFLN3u319CMx3QYhSs2PyWm
	RwXE4cor0dMPo252o3KurfSyiL0ycqhknvdkIlG7ML27bDZteCVAP8jVZjouu2vXsQHJVzzvUXAOi
	QqORt305aAfeI0Wu/4G2/CncLbyq2IHf5JNK7C29SgXaSFgtXE5g2PUBkreoh7mZFpmI+utrdFbzB
	wg7w1YRxnefIKGnYAIEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7oYs-00000006js8-3TTc;
	Fri, 17 May 2024 03:47:14 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7oYo-00000006jqy-2Noo
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 03:47:12 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7e1b520812fso13101439f.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 May 2024 20:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715917627; x=1716522427; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yDlOiioY4qBdeDaBJ3EMBjG9W4k3e+q2KQuwlwFm/Wg=;
        b=XAMb54A3SmTRoHHdDu900oybwV6aIy/U5VjK9Ayn+yZUZkUY/xjmboLg+0smdNrFHu
         k4KfcmlJSHXP2SiWRcl3PjJ//qfDUQQjYhKfTX2cILTtrqUxSufug6UobB/z3E/rlI/F
         CqjQinnTS7ei0EANsxGHxat90qDT/YQKxQuoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715917627; x=1716522427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yDlOiioY4qBdeDaBJ3EMBjG9W4k3e+q2KQuwlwFm/Wg=;
        b=i2O41QhNY2Z3XkSiiQqeKv9aaePVc1iYbdVuuV0v4WXXKdVYyS9JTXt8L3AnwL61RQ
         J3x6Bm8586hSLBhjx/y4X+ZBjwZhYf2/3C7+v/9Nxg52Ocn0pSqY8PoIDHqFTu+h4KGv
         cXaI1dobi6AsVtUkWL29L4wcgmvXl16qZO6mrnxGRjdNmwJUUO41Z5joryZANjI/v1jz
         4AcQJcxkiL/0jRBcCbMmLuHBrUA1X0/uaq77S/xflWE5naK9eQ3o6UuCJWQgC8zToTj9
         Ntu0MhNhX9ibgiL/3bz4jFE0Q7g3pRjuV754ypSuVyMSOH1w0hY7m5bhXs0FcDOln4hy
         ywZw==
X-Forwarded-Encrypted: i=1; AJvYcCVE0vbo01wtXhDo/oC1hMGrNNj7zKWPuM2KdZ8UoSdYOJoHqoAxeqAkAqe0TAkKYoYXFNGKElwcTHZVCNraLfFSA+puTQ/xNlNhx6tobH4V
X-Gm-Message-State: AOJu0YwFUCgP6mUtC0ohiAv28RL1/I4zBaKubWP8uWoLdlfAcyc7yqLk
	MaiyYWwEw21ait0ZOV7O3cJPfYb8/PD68YFJFkLX71M1wLkT0dwwu/RrtK2wOyg=
X-Google-Smtp-Source: AGHT+IGdK6rFNtMzv/o7w6HNu0tCiqSEnlqZgL7f/KrvB7GNWi1KNGokcDBCge/J7xruX5muwQNDjQ==
X-Received: by 2002:a5e:c748:0:b0:7e1:d865:e700 with SMTP id ca18e2360f4ac-7e1d865e82emr1709781039f.2.1715917627289;
        Thu, 16 May 2024 20:47:07 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-489376de473sm4436301173.154.2024.05.16.20.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 May 2024 20:47:06 -0700 (PDT)
Message-ID: <f3bff4ea-507c-419f-8fca-9276281c3b9e@linuxfoundation.org>
Date: Thu, 16 May 2024 21:47:05 -0600
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
 <a8702e6b-0360-493d-bf8b-94dd7f17e7f1@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <a8702e6b-0360-493d-bf8b-94dd7f17e7f1@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_204710_658706_381B1055 
X-CRM114-Status: GOOD (  17.14  )
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

On 5/16/24 12:05, Shuah Khan wrote:
> On 5/16/24 11:45, Tejun Heo wrote:
>> Hello,
>>
>> On Thu, May 16, 2024 at 10:31:13AM -0600, Shuah Khan wrote:
>>> I am exploring options and leaning towards reverting the patch
>>>
>>> daef47b89efd ("selftests: Compile kselftest headers with -D_GNU_SOURCE")
>>>
>>> Your amending the PR helps me if I have to send revert. I am sorry
>>> for the trouble.
>>>
>>> I can all of them together in a second update or after the merge window
>>> closes.
>>
>> The cgroup commit is already pulled in unfortunately. Can you please handle
>> the revert and whatever's necessary to fix up the situation? I'll ask you
>> what to do with selftest patches from now on.
>>
> 
> Thanks for the update. Yes I am working on fixing the situation and
> will send revert for cgroup test patch as well if necessary.
> 
> No worries. It is not a problem for you to handle cgroup test patches
> in general. I will need your review anyway and letting you handle them
> reduces the overhead.
> 
> This kind of framework change causes needs to be coordinated.
> I should have held back on the framework change on my part.
> 

As mentioned in the other thread

https://lore.kernel.org/linux-kselftest/24975952-b1fa-44a5-bac5-aef538ad0c09@linuxfoundation.org/T/#t

I reverted the following patch and the framework change patch.
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=next

Will send PR to Linus this weekend.

"selftests/cgroup: Drop define _GNU_SOURCE"
commit c1457d9aad5ee2feafcf85aa9a58ab50500159d2

thanks,
-- Shuah

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
