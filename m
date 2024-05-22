Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DED8C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mU/vdyyXS63ONIkaUV+Ng8oVZA3O/WUw5o5UohACjFM=; b=E3jhGA8cZ3z43N
	Y7YZYaY23+8m7byCcWVe4Dc0qxS/91s/vb3ywUg2NrztgD0GhlfDrOY4ikXPQC8LAIgf4TOKYiIJR
	yo0OrQeXW2cEmAMFhODuCuTHsPAYZP9IRaKXGk0qtdCNLb3pKAAN370QlT/onp5muyzLOGIT5sPMb
	bUUqcMw5uITqZpDWF+6iqAJyUlMbryNUdU9djjeziiRuFnClcBEVsn6bjKvGVHVnUT/vLfSrbTH5c
	SS3LyczyHkVV1A/eL73G1U9HLoF7M8fp1zHiV8LJSngAijwTQA+8iZfZZFwwvAovNMVnJAR529a/m
	8r83Vn7z9O64YQq/QBZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ovn-00000003XmN-3vPd;
	Wed, 22 May 2024 16:35:11 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ovl-00000003XlG-1CKg
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 16:35:10 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5b2b7af31d7so329063eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 09:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716395707; x=1717000507; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FF30FLh4FVIj5wgbcXLnpEEb1c/d7E6kmTu0z50oYHg=;
        b=anS6i2Z/PLnD3fDU7ii11n+fsiDugdxexd6oP7BeXEFbTr00XclQqggjXGokn0umSD
         0BOX4DCiTxR9t1m8H6SvVsh6MWE9Mm7CYOXJzVeHSmD++j1HzvSlfgfFGPd4SbiRy7Gy
         qvzuwokezZl2DlSvCgFn2WzlJ7EgN4a3cfKds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716395707; x=1717000507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FF30FLh4FVIj5wgbcXLnpEEb1c/d7E6kmTu0z50oYHg=;
        b=AvfBExVPkRXAsqnAYABKrj1Y+zlibYgrqitJMN9XegEVp1y8d4fIhtlcEqougCmus1
         5ygEDr8L5XG/9VHPBrjNIQUEgz8t0sWLJ0JM8s4u+stzBPo6W6mh3FBb5uY8bthpew/M
         GHjF1qsPLIidMw4VlFcxMAcKqy8iB8er6JAstUv3nHjs+bQj+poa7/7p+pKMuO/HP0pf
         fbYgCqAMhHNVuvB67IFbTJKTgDfd8NgMc1b75LpL2qykH1nKKIWmE5jSLY3HKSW2HFWP
         WW911slApixRYyX793B093y4+/08mj2Yb7BXmh78yhHqAQdp2lB+byStAxg+Xj/vgn/J
         Y93w==
X-Forwarded-Encrypted: i=1; AJvYcCXt+SLDWlWXEfymmpBToY6gxEVApNITDImwQohG6F9cTysoee6ymi5lhN7Ikw44aVfdVU1vMtEGiCTzXADOI3O0GVqjNclAm6jBQCrSQS/d
X-Gm-Message-State: AOJu0YyWR0idkeKh4uX2lq6GSDtPflxYdLQB+SnRalFiOo+iZCMoyxk4
	454PY6JO+o4Wyqq+o0K+ufTWbzKOgju+5oSGx6faWuSrw0N3DLR60hcIfgI2ZCg=
X-Google-Smtp-Source: AGHT+IGHfAC3qkCN6OulIhZiaDBbxXmwg5VKYB936DJVaSdhJlQGCxL++LW2UUdg3/EuZDRuVOh0Ug==
X-Received: by 2002:a05:6820:2585:b0:5b2:7d9f:e708 with SMTP id 006d021491bc7-5b6a2df34f2mr2891522eaf.1.1716395707090;
        Wed, 22 May 2024 09:35:07 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5b31b52263fsm2644126eaf.21.2024.05.22.09.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 09:35:06 -0700 (PDT)
Message-ID: <25596b05-205a-471d-884f-289db262c485@linuxfoundation.org>
Date: Wed, 22 May 2024 10:35:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/68] Define _GNU_SOURCE for sources using
To: Paolo Abeni <pabeni@redhat.com>, Edward Liaw <edliaw@google.com>,
 shuah@kernel.org, =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
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
 <b5e333368d9e69efc6325187a23cef4f4337c738.camel@redhat.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <b5e333368d9e69efc6325187a23cef4f4337c738.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_093509_531494_DAD7AFE1 
X-CRM114-Status: GOOD (  12.09  )
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

On 5/22/24 01:42, Paolo Abeni wrote:
> On Wed, 2024-05-22 at 00:56 +0000, Edward Liaw wrote:
>> Centralizes the definition of _GNU_SOURCE into KHDR_INCLUDES and removes
>> redefinitions of _GNU_SOURCE from source code.
>>
>> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
>> asprintf into kselftest_harness.h, which is a GNU extension and needs
>> _GNU_SOURCE to either be defined prior to including headers or with the
>> -D_GNU_SOURCE flag passed to the compiler.
> 
> I'm sorry for the late question, but what is the merge plan here?
> 


I have asked Edward Liaw explore options to localize the fix to the
problem introduced by the following commit

809216233555 ("selftests/harness: remove use of LINE_MAX")

I am not happy with the churn. I don't plan to merge this series
as it for sure.

If and when this problem gets fixed, I plan to merge the change and
take it through kselftest.

thanks,
-- Shuah

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
