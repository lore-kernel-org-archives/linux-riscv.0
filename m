Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F64C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 20:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnOyhxodItoPXCvD81tJyvvSecNoCuSU99hQcwddehs=; b=bBpxjVeNKUXrsG
	FJhei9JZxlOErENHGzFzhkcF4ysdPUHTzHJrYTqGlfI1czwqRmPN9C+7ffupJ3uv+FKFNYNNNPHq3
	YQvFSeveTkWJMjywx+vouV/wYJS/uSD/5WFCJVfkZihFuGjq+QP9uPgGSGpFrRCwCtEy33X0XYgX9
	vwto5ns8XhAHDj/O/rXs6CeQd5H6Mmvtg5Ft9Fp4JLX948nXdBOWdKp4/nEhiLTJs3WuzR1XTruz2
	1oUg5PbO17E40UzIPoING8UX/UeMqT/rXdp50MmOJQUR674BLGe5RT3LydDhREHHHw/vheZEMDevc
	VeUKjWJa4VWIDdQChPng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwrUU-00BEq8-9s; Mon, 13 Dec 2021 20:00:06 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwrUG-00BEkf-FV; Mon, 13 Dec 2021 19:59:53 +0000
Received: by mail-qk1-x72e.google.com with SMTP id t6so14997458qkg.1;
 Mon, 13 Dec 2021 11:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=Qky24JZIeQoHw3ICTTlxOYct+/eWozkLnsHMN8yEZf4=;
 b=ivEG6K43UlnRJVSW/+OrBaa1XEkyyqfkx8XAA64gt4Dy4VRPjGHdDJDqsSz12/kHkK
 azGPzqgNdxhzQdBB9bFiJcxnxqG3f5R0n7HCaGNo9a8VZmIVRJFpnwLIw1c5CMg91cU0
 NfLH/aF3DiwVdVnW9T7V3iB6BBOuhSbGPhdvIez6JTfh0hnE23g1aocIfxhUBlrp5W0w
 ruQN19Lfko+l7/XjN/hbvGooHOoVEcAP3X85hazukilQ6CaBb7jhmsJvdsZIVvOts7UO
 t8A06J11kvwxf1orjJTUPFgHBpqgQP7kUEo3p8mV0Jd2kKuURHxleafgrjeyfrohSOQV
 7gkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=Qky24JZIeQoHw3ICTTlxOYct+/eWozkLnsHMN8yEZf4=;
 b=Wszh/jBgz3RGvSmXqLgW4cFD26xxqwadMmtuXyeTrMi/ZP8+LqShh7EMtLfpYOuX2c
 aW9VgHu5jf5+TakPDX/mOhpQW49w8XBj4Q95wsX8DyCPut+7KVwLXwjXehLZnGSJLEeW
 ++yESXdQz5RJOYk4Wya4rJI2MgBaDyqhAhifWZjlgZSPtljLkhRESQXwoVlOklOZQQuu
 CRUZJf+Ug6xTR/tFMJB2hSYihWNkwd0poXBXLz1NQWhPzqQ1v/OEUvb2mFl18T6NASdq
 3kfDy4/p9NflM4xajZrDEd7E2P5YuZ7C90UAiBPSjslETb095/mOaiIpMjq9FqIhjwzL
 7S/Q==
X-Gm-Message-State: AOAM530w8B+gF9kc/6d88nEjeQwNIbqDzEZRA9cPBuMVtTWx2wymv+X4
 MDPbLsM1NKTDp1OaLlrwMPk=
X-Google-Smtp-Source: ABdhPJzXkFVOnvL6om1urqQQwGsRx0vuW8k9svX4LYQHYCkqevEIteL3bkY8PMDyQueWXOJTQnYgVQ==
X-Received: by 2002:a37:644f:: with SMTP id y76mr348341qkb.244.1639425588460; 
 Mon, 13 Dec 2021 11:59:48 -0800 (PST)
Received: from [127.0.0.1] ([187.68.231.66])
 by smtp.gmail.com with ESMTPSA id a16sm10343593qta.94.2021.12.13.11.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 11:59:47 -0800 (PST)
Date: Mon, 13 Dec 2021 16:59:41 -0300
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
To: German Gomez <german.gomez@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
CC: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, John Garry <john.garry@huawei.com>,
 Will Deacon <will@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_2/4=5D_perf_script=3A_Add_=22struct_?=
 =?US-ASCII?Q?machine=22_parameter_to_process=5Fevent_callback?=
User-Agent: K-9 Mail for Android
In-Reply-To: <73ecfe08-f38b-1308-40b5-a1a778323bf5@arm.com>
References: <20211201123334.679131-1-german.gomez@arm.com>
 <20211201123334.679131-3-german.gomez@arm.com>
 <D6A3A8F3-9946-44FE-A70F-42977C6F38A1@linux.vnet.ibm.com>
 <38fd4992-63ae-4871-ddfd-27d40b5c48d2@arm.com> <YbePfOMaiJjoDb3b@kernel.org>
 <73ecfe08-f38b-1308-40b5-a1a778323bf5@arm.com>
Message-ID: <729C0734-B346-455A-A95D-A9C170369F72@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_115952_540871_C7492EEB 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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



On December 13, 2021 3:31:47 PM GMT-03:00, German Gomez <german.gomez@arm.com> wrote:
>
>On 13/12/2021 18:22, Arnaldo Carvalho de Melo wrote:
>> [...]
>>
>>> Thanks for the suggestion. It looks like we can skip this patch if we
>>> can get the arch value that way.
>> So the first one is already upstream, will you post a v2?
>>
>> - Arnaldo
>
>Hi Arnaldo,
>
>I sent a v2 where this patch was removed. The upstreamed patch (1/4
>here) remained the same.

Thanks, I'll check.

- Arnaldo
>
>https://lore.kernel.org/all/20211207180653.1147374-1-german.gomez@arm.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
