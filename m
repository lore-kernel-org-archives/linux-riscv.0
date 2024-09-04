Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABB4CD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 21:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KAngKMORCVykOjKNMQMHUVV7Rnu1IZVgltmQ8Nriw04=; b=s/4XNdyvkpB8Ja
	n2hd3LXebOH2LCldQpt8T3Y2CO0sMNcQjW/0tX3L6PiHaV7MIsZeb6JdfxGzfKOcTAbLcAOXzMzP3
	cE+fZ0TYPbw9x5ts+WZmRC9v/DtE6TeRsWnzoAelaqdYdeLGJbkHlSBCSuFlCBNpEZuDwRQw2G2w3
	GffNjJYRxMdfYIyK7XdMvQjG50oOO5ZGoI8XjGoZPe57bwYKgbz0uelOz5L433mG5m7OL1tAOobG4
	T/BjXViSmJJJI2ze7q5hlI39FwSOIz67B40ODzb2pbP4xiQW6hZlriViAOUA91qvu87zu2EGJduG8
	doZQLykVP62fmohNNbcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slxkD-000000069Mx-3431;
	Wed, 04 Sep 2024 21:40:53 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slxkA-000000069MB-1Qla
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 21:40:52 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-714226888dfso62990b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 14:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725486049; x=1726090849; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C6QnB0bivarKFkHaA1aPrUAuJ4bGbwKRQFPnKJW2rw0=;
        b=QmMFfGqM4fbsrG4IenBDTQTyvg3hmS1/bBbKwKBC6ZBNx5o3p/Qdsu4GQ6YNguXZTp
         UUd4sNSbQiJRo9zb2hn68utsSsZ9LyWhwF0ZEp9W2K7UpZFi30y/OfuA2fR1OD0Xm9xe
         2dE+j6EdiZjgNj6RCYK+Upad78Nvf6GKTReLqpBG6B+ihOq+A2W49WcWfScXs7+uuIKo
         +5qwvyGLQbBj5Dvk4ir2YTj0jv82dA93j+tBKU9SIIiXxVqA3DrqrZegzvMf/PFaV38C
         Dp0rltN6S1jK53Q1KRBoe9iS3f3B5Gir9il6Fh4me/gxR5HZL20Jl0w3Z+Xb429r3DYV
         +gHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725486049; x=1726090849;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6QnB0bivarKFkHaA1aPrUAuJ4bGbwKRQFPnKJW2rw0=;
        b=aGoZgKVTLmasQF15r7fhNzJMZdZUWd3QZCHInkmh1eUikex8Jpsu8Df9WyvJKCvRSD
         QSlhAwMoZ5SlYHLxRTqLX+ol5uwOSPt/OkUO/yQPNsCKR9FI/cU8oqdyVHjf0MV3jUxI
         3L0bpvJus9zllGbpjHnbdyGdYdjYOsXn8ZGD7d2sxFly6v0aZglEEEThdHaSA9Ifc4Cb
         EVwiHo+ZS2iKB8S/j1QGZ/ZocICg6yA9WDJSw//71ZRs6UCIfn74Vh7gUqeLIioUmzz6
         v12sMTZMmqK3pzlWxaSWYuXbDStQ5ut9kg4K6Jjk1Cu/x8fmRniNlhJiFNPT5vHvC5R0
         bwqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHzXMAucmJ7lH8utkgWDFv/77zIN8zozaN+gj+rF5NUKelRWI4L2KAR67R/yfOg3qh6tNh2MNyt6AcIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjn2ENvipnUfm5JeZuk8pyOFJh4zx5xZU2gjJNZpTGyPV1NX/w
	jngX/p40jdNyy6Yw3eMo2q8Vt3kGwW1v1xH9eP0AF4sl1P+1jbGk
X-Google-Smtp-Source: AGHT+IGlyStJ0g4GAO1ieaJxDs6FlD1BfC4Uze7aD5XcMPDK1viRwnVvH1qfR0BSkioqYCTi1ioWGg==
X-Received: by 2002:a05:6a00:1886:b0:70d:2c8d:bed0 with SMTP id d2e1a72fcca58-715dfc43a62mr26466036b3a.24.1725486048998;
        Wed, 04 Sep 2024 14:40:48 -0700 (PDT)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71787132e34sm667668b3a.137.2024.09.04.14.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:40:48 -0700 (PDT)
Message-ID: <29983336a7196f3efd220e7bf1ae67703f1bdfbd.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 05/10] selftests/bpf: Support local rootfs
 image for vmtest
From: Eduard Zingerman <eddyz87@gmail.com>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>, 
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Puranjay Mohan
 <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui
 <pulehui@huawei.com>
Date: Wed, 04 Sep 2024 14:40:43 -0700
In-Reply-To: <20240904141951.1139090-6-pulehui@huaweicloud.com>
References: <20240904141951.1139090-1-pulehui@huaweicloud.com>
	 <20240904141951.1139090-6-pulehui@huaweicloud.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_144050_405505_0D943E04 
X-CRM114-Status: UNSURE (   7.40  )
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

On Wed, 2024-09-04 at 14:19 +0000, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> Support vmtest to use local rootfs image generated by [0] that is
> consistent with BPF CI. Now we can specify the local rootfs image
> through the `-l` parameter like as follows:
> 
>   vmtest.sh -l ./libbpf-vmtest-rootfs-2024.08.22-noble-amd64.tar.zst -- ./test_progs
> 
> Meanwhile, some descriptions have been flushed.
> 
> Link: https://github.com/libbpf/ci/blob/main/rootfs/mkrootfs_debian.sh [0]
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
