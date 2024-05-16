Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1799CC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 16:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTiofbnOdthyBS2sqDj8HnKO+4161Sh+84BYngsU6zo=; b=B2PfRJxUJfH9FA
	RW45UVUVQPZvEhvQxeyXtF1/zTP4kPPkUc9x3Wr0MeCJBaCbPd3VfJ+fPnAmdYqEfmlhutg2DWQoL
	Hi+Yq5O6VsmK3wK3tgVBVgVZnQNgLkzCKJa34ZfVCRAffjoa+1tZ5SbW/3FlXhIM18KHMzY2enBh2
	Kq/jWvVq+3qTwvAJlONLm5BNhUyZeQAFMkO84v6GDya6eKd6W6RsDd/8ldPvk7pK9XQ5EPZ32zDiG
	mGq3lbDjFdMDYANRs1ptLthVLzYpVgke+zYfMLDuBjlVRRNwbU6OSXkUwlDuuyrDbp0oEtkbS6cmL
	pqRVqqXbVS6mKzZ6hShw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7e0p-00000005Wsm-2iwF;
	Thu, 16 May 2024 16:31:23 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7e0j-00000005WrG-05US
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 16:31:22 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7e1b88a886fso6242439f.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 May 2024 09:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715877076; x=1716481876; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDnoiv+aAilJOglosMLJSLeZ15PVLhndVRN5KP2yh64=;
        b=UqSKp8RY9Am2oKaIs7RqGmyR3HAzRqajV8NvWNfc7A3sZKkibd2wypjzMMcu0XkmNq
         RuYa5U/uZvS9DW51vAwe1mCMv7jEyAeg8TVTBkcv0d0SYPKrOhOnZRAhOuTOFnr6O+eX
         7qjcyCKeEg8DFbRkRcjL/o+fPnUcWHWQ7UDoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715877076; x=1716481876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDnoiv+aAilJOglosMLJSLeZ15PVLhndVRN5KP2yh64=;
        b=eGm7r8Di+TpDbHpf/T9m2B6qPyXovL5HS6fbA7rwN1FO7pbJWNNareu9S3rPxyV+1V
         akOpqn4a/vO9PqshixGarTRZx+rkzwvFrUknEmJhsqHz+DzQyxKIJD/+ItAZK53bnRdx
         SpvViXTaUVmvmCi4qWyoWLsTuLILz0NMCQfOJBCUj97FPdvBhoxYGYvkcQNe0B48+zQi
         RfF0ETiuoTHR+DrmEzascxVzFHUH9hwisZE5ZNOSbMQwLrthWzEkj/OL3KLvGY9ppQSy
         vu2J9IYCBdOqG9rjeiR1REIl1GPfOyqPcOdD8f1Q7QvmAtMadvGJwE9qYP3Sp+ovc1su
         QeQA==
X-Forwarded-Encrypted: i=1; AJvYcCXAFD40P/7YdQAOjG+W3FKG/saaFAKdJuzk5TEQQ4Vzxa1nQoZZamT7+uG+Oe3vhrWHrpLpleDDSv9+Lh6uZ+HiOm7Kj8BUTL+mbEUVQPae
X-Gm-Message-State: AOJu0YxM3RFDwKN7RMBPmyHyVOVbSWv12flUyA8gjZgjzn900K+BljTd
	QkS2VNyUQs5gJShOoHd/R0ojKTKHeIqFZ5dFiPypfj/3gjt6kFtUOz0LQqxmYJY=
X-Google-Smtp-Source: AGHT+IHC7NWHiVtGdW49HXEWLPpD9poqjpxpz8h5HFbktLyqnUrR9q12B55ixwuwmtZx24K1zeLkFg==
X-Received: by 2002:a05:6e02:1c8b:b0:36c:c599:698a with SMTP id e9e14a558f8ab-36cc599af7dmr211295495ab.2.1715877075869;
        Thu, 16 May 2024 09:31:15 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-36dbbd191b0sm7514315ab.17.2024.05.16.09.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 May 2024 09:31:15 -0700 (PDT)
Message-ID: <9e72d97a-9a04-4423-a711-0c21c1c8b161@linuxfoundation.org>
Date: Thu, 16 May 2024 10:31:13 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZkYymMDd690uufZy@slm.duckdns.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_093117_105752_1B7A48CF 
X-CRM114-Status: GOOD (  12.22  )
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

On 5/16/24 10:21, Tejun Heo wrote:
> On Thu, May 16, 2024 at 09:50:06AM -0600, Shuah Khan wrote:
>> On 5/13/24 11:02, Tejun Heo wrote:
>>> On Fri, May 10, 2024 at 12:06:25AM +0000, Edward Liaw wrote:
>>>> _GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
>>>> redefinition warnings.
>>>>
>>>> Signed-off-by: Edward Liaw <edliaw@google.com>
>>>
>>> Applied to cgroup/for-6.10.
>>>
>>> Thanks.
>>>
>>
>> Hi Tejun,
>>
>> Please don't include this in your PR to Linus. This patch series needs
>> to go together as it is causing several build warns and some errors.
> 
> I'm afraid it's too late. The PR is too late. Do you want me to send an
> amended PR with the commit reverted? If it's just temporary issues in
> selftests, maybe we can just wait it out?
> 

I am exploring options and leaning towards reverting the patch

daef47b89efd ("selftests: Compile kselftest headers with -D_GNU_SOURCE")

Your amending the PR helps me if I have to send revert. I am sorry
for the trouble.

I can all of them together in a second update or after the merge window
closes.

thanks,
-- Shuah



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
