Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD871C56202
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 08:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dLbEZgeOcK2KDYq2fwJaeApJsp9BpP5GcsdghRQF1Y=; b=yGLKi7hzJHB6Vf
	6TLb/5brxu/e9d4x/U7rZY0pPf3M+Y/oQjMY9uLjErRSSS0ny4R8V0b62Cxc9v/j/5K/gdPpsT205
	rlNyaAMZ0TOSuxT3vwR3BeqPNImsEhm9pV53Yx24LAnO08x0bGwyUsJ/4iFc3rJJcqh3Ot2BzmQFG
	CdPAMyR0LNdCj18z5ojWaGT8OIpkOSUAhPao/QbZukiLzbejPexVewOOE6dQqG16AKZIkV6I55K+0
	tl+kZtS2sxd85ukiw8hMmPOruyDs/yTR+Um5ATXKEiGJ5s7MQ+g5bcPyPD/iEf1Oi65Is5p3nRXoa
	FqHZVm/dfQRpJGEmsDzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWb7-00000003TKB-2eZa;
	Wed, 05 Aug 2026 08:03:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWb6-00000003TGS-10MP
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Aug 2026 08:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kSsEJ/sE1Eczg1jKOdFsL+iRe6l4DBX81fNWGZNDqJw=; b=PiV+DV3htT800nXZEOt5wXA6qo
	H8OzoIk7Xox/20F/ur5vkSvZUEeiScOiJNmEfomje4o+GO5gs+ftMk4z1n0jyTQmFh6Rb+h+jib+C
	4bl36iNB/Ib3etQCBUwMDnuDynicI3lypgEl4YSvAmcNLD/LtNjXRbxCh0rp1K+g/7AVEbY+2gcM1
	oP94syu6MWj6bBaLbcCAKx7K/KjgomM4EJRwIe78sUvefP2EqX5H/YR4tmd4XxvmMbrBLui6x7W89
	wm2QfZcvFPuf8oUYvEOPHnMf2stUjkHfgGsvVYfTlwKlLL+8DoMINy1bzJ/MQCqjeczI4LY2QkLgS
	o5wOrvMQ==;
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrWb1-0000000AYrG-0jiF
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 08:03:31 +0000
Message-ID: <83784ad9-a51d-4c68-af78-f4f3010ba8a0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785916991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kSsEJ/sE1Eczg1jKOdFsL+iRe6l4DBX81fNWGZNDqJw=;
	b=nDWtB1o83TQelmp7M8sA6wsvFikCj5DjJ26GgkJMraqmpL1TeA5hZC+Agy6SthA7GB1ouG
	9iR9t/GKx3AFNc4xORkrk2aIDnpzXH8NehczDiRacma1KG6EuQO5fE9v+mpQZ6fZcbxz93
	Qb4aZ5w3aPlvMw2L9+NvjMoO2ew5r8A=
Date: Wed, 5 Aug 2026 01:03:03 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v8 00/22] Add Counter delegation ISA extension support
To: Paul Walmsley <pjw@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>,
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <09a2dde3-788b-555e-22ba-2f2582a89524@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <09a2dde3-788b-555e-22ba-2f2582a89524@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_090327_343841_7C209CE5 
X-CRM114-Status: GOOD (  16.17  )
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

On 8/4/26 7:14 PM, Paul Walmsley wrote:
> Hi Atish,
> 
> On Wed, 1 Jul 2026, Atish Patra wrote:
> 
>> This series adds the counter delegation extension support. It is based on
>> very early PoC work done by Kevin Xue and mostly rewritten after that.
>> The counter delegation ISA extension(Smcdeleg/Ssccfg) actually depends
>> on multiple ISA extensions.
> 
> So as you've probably seen, I've started adding some of the prerequisite
> ISA support patches from your series to the RISC-V for-next branch.
> Looks like you're planning to repost the series at least one more time;

Yes. There are couple of comments that I need to address and one bug 
that sashiko found. I will send it tomorrow.

> you can either include those patches again, or base it on RISC-V for-next
> as you wish, but if you include those patches again, please note in your
> cover letter if you've changed anything.

Thanks for queuing the base patches for-next. I will rebase on top of it 
(except the macro vs inline function patches) and send the whole series 
again so that it  easier to apply the remaining patches.

> 
> 
> thanks,
> 
> - Paul
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
