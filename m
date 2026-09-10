Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694FDC79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QWi13AbGFS8RdWoq4Mph/Ep/qkvasDnMx+p4mHZl9E=; b=lCNAAGSu59BoxN
	k3Lq5xQggBoZEvVt6mH6X0wDIbYjqifpHhivLA5I04oOHfw9ayUAWHmw1Hu9FsKm/4B8UxkO6AIK4
	ABQi6fTAB1rP4Myu1fb/+rdUe9BMlUEJS7Ot3yXd4vCgVSUdctPpRhZ9yuZJSitnKP9a33HOl+ogo
	ZgnwS2+Le/41N0fqgFUTLh0WbRRjTgAMQGQcdihZ1QHBY1B5XGxcUHngvCusC/AaT2/ws+9mo13/d
	P414eeibrzxttgqL9A6NpqbbS2AHV6thTTIjTvuDPD9hxYekx7pTGIuhQJBklw8NRNMlrCPfKfGsf
	vTLbDxVuWA8uGWiMbrpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cfA-0000000EAVJ-0N24;
	Thu, 10 Sep 2026 11:09:52 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cf7-0000000EAUN-1ces
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 11:09:50 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4bfb6so640466a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 04:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038588; x=1789643388; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8QbTTWk563brFKzUulM5hzJdIlUHhbe3RJ1vb+Th/iE=;
        b=B9mcoRAQhWIwRX7RI9CgEp10CcFbvJDMX9yeGOC0wYT8WxLGuhuofJa8uxKwD14xuI
         ZL/M6QBpeqFuVrj/RFUngEz9sV2xP2vFoII7XMjfXS2pnr0I6+xXgQkKynXoJZBP6f2P
         n4V79XYAllh4LoPPOJxcKQA3Pbr4u3pe4zL+7ComYBlUbpn+9GrLfHxnh4AZkWqbZN1S
         O5FLfo1hJ3jUgK4BYpf6U0YtsN9Gt7aie8VgeWR4LDg/kUGdaA9TjhUpXIz4m4aZ53al
         Qa1lKWVIY9xRkHtVZCK1MlhuZOeXXiodvv9tEvCLQ3PZBSJMhi0GRqh6vAVU2W2oQWii
         d94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038588; x=1789643388;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8QbTTWk563brFKzUulM5hzJdIlUHhbe3RJ1vb+Th/iE=;
        b=p6yQ8GtDyHhHtrzpuZsQwSSeUJQStruAIy5vgXHBURD+kYPcXLey9NJhotctbe4UUF
         eXtn7GL1DC0QsEjZI3glFInn8MHjw9rLnZv1GNNEepSQEEwEi7vsKoEiM3j0W+Xvxozl
         ZVJA+JQw164WA0aYaQoB7nYwms3wTkzpLkLnuwH7xguFS9f7A3pUYQgfzqz1d3JI1UII
         mwIChxG8sFPEA7jx6eLKXAaJyZqi/NowSMTE4YDEb7Jh7k7sYNLGRpcFCR0JZTmHDBLo
         xZr191dKMN5lIm33xpsba5HVf1cVbMRvGBBe03nOKdWvOyo9CFdMoiq20ng92Qh+/YAR
         OHoQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6piRn2qGu5OkzDAjg6xo6nOpBm5xNeWlgi74N53X/ZcpknYHkhUN4gw6dlChgAQE7xfbkaYwH/H9CmA==@lists.infradead.org
X-Gm-Message-State: AFuF++mIprl9Rlb+P7W9p3uGQYjrQPhZWkMJHXxAgI0Kwai6nPq0smrZ
	D/PWOkrRYOeFzttAUIEtOBH+eSpm71eQtpcvYUFLx05vst1dk3C9z+yV
X-Gm-Gg: AYBFou17q0PWl8WK95AYQSvvA9VLU0At6KEvBroX24yESqzmXyOjh5HOm/owlIsOonF
	9FshvxgjN0v5mQ1u3iQtv1h9Vzt8Ik9LaJUyJTc8DaET3cPn7cekn6Uzbnk3y/6jg2vf9oacI0L
	3ASfh5iZuy5MFohFIXypaRv2Z+vCY7rf943QDQJOzCYBc8jhHmdMfIqoDMU9H/hxDuGloiFlIcI
	91OHq3fdCWQPIhwDea1SCW2KMxXP1ljzEfo84jHGwCWwdqNLp0PzN7tNVlZ1b7s4HW4MR/HWBXO
	FukjdQ79mjZzNx04Owzbk2TPrhXpqruAq9N17hPTthnl+iocbxcDoV+nXZ6xDsonGb2r107d29i
	zc617P/CNYcn3BO6OEnBbDwfDcIluEGvy6uV0oJ3ipRGSKoN8v0+T2szMe8jVSjYTojyzBLCxDw
	qY0AbM6rNTIe0rua892451uO2SofIPBXyPl18C+z/Z7McNz5qIkRWJ7yayBTg+Mm/z9Ve7hCDrG
	fYCkaglYcvYIhruK/ZlTRTvVCM2w1Qvfvl+HETNCSbJFI8H7rcofnM=
X-Received: by 2002:a17:90a:ec8b:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39d70bb1bd0mr11082578a91.19.1789038588475;
        Thu, 10 Sep 2026 04:09:48 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm68881202c88.2.2026.09.10.04.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:09:47 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 11/20] KVM: selftests: Initialize vm->memslots[] with invalid memslots during creation
In-Reply-To: <20260902164123.2546762-12-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:39:02 +0530
Message-ID: <7bkt1hyp.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-12-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_040949_425423_5484CBD6 
X-CRM114-Status: UNSURE (   5.12  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> Initialize vm->memslots[] with an invalid memslots value during very
> initial VM creation so that failure to configure the core memory regions
> generates an immediate assert instead of potential weirdness, e.g. if slot0
> is coincidentally valid.  This will also allow hardening the region APIs to
> guard overriding a region's memslot multiple times.
>

Sure. Looks good overall. Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
