Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A0AC79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkPzzqrJvekyKqglCq6sH86rKOjiq/UPBkJ+s0j5sdI=; b=DoQinv5J2Gw0K8
	KX3FGlI83w3v+yf+/XUPVjGADmSnxPfvRg2TxNYZsssVzSwGiYj6XsuJZ+z/lsFaEWRi9UfJsURHs
	l1IbIxv6kFw3SLJffdYSPICbGi/PO2oPqGEXLF21dKZGxXyjE33jHjrlqbDABW8nl5UfrpIpV2gwd
	cr9xSzX2bIPwxShTK/5DrvPbV8JIdiIQvVddsWBlbQUy9ZzCN1QRvedUUlpZSM+wan6jqty17X17P
	7iSrDzWWY40oT2wnLmf0FecDCnfXixqTVBxdDruTOF+aJp3ATNAjd2r2OB9rgr2BP19DG8umo5AFA
	yNV3EEkNf2rxm/nW/AuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dEa-0000000EFu0-0fKr;
	Thu, 10 Sep 2026 11:46:28 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dEY-0000000EFtO-2Ae3
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 11:46:27 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6aca0f482e5so7509921eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 04:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040785; x=1789645585; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4oV1R7Sem2YZktphiH9OH9k3wSSCyVuVuzldh1QWGuY=;
        b=VZ53K6v9vY5ZHQp15jqRz4bSYPziex4fES5/64jiABnKFPRuPnXYILefpI1hx9lhmk
         MQZJG0q1oJsoHXWEKsVjctnhjRB5hCOjXcNcSXDZaICzYU3bB0o489ZdMKz1fSwXhRNo
         gwHZ0RnOgFer4NQ4VeeUt0IgZy+kY2ngVeXJiSWYERf1u71Y0I/EluduYWNvBys8vO5t
         hGpR8rnRQh3QeAB6aMBla+8+USk9NYO1/lUIImk/bBnGrzXBZKq1I/I3IdBncxAu4JzR
         TrA9YWq12O/9pZrWksgk969D654bsYYdZZVqAxdh9+LXCX5Q0XvQLWKpKSPK/tKynhPa
         laKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040785; x=1789645585;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4oV1R7Sem2YZktphiH9OH9k3wSSCyVuVuzldh1QWGuY=;
        b=RBBg6zilsTKKoHInG9cMAoqyhmt+VJcAvYEfgTJElc++orjfOpaBbzuk3/PjFU6bJ6
         WYeeO8nhZuqJwAzBAyKsY9dMcs2WjztAN1cATIffXFrNFZTC55Wm/py5KnK+p74KvL6j
         9eE9jf0S8+8NNvyDwjCCgQISgOVlOBPur7BHacNRjNfI4DLWpjuLRsnYL1E4DKikoSst
         9Zgg+Tg2KhUwkZdTWC/jAjuwhkt4DW1gfVz8aLlTu/3udLJxTzBnlWoB0TcifoVk3otE
         rhytrx8mUQY+wVUlhfGftmsPx53pwtsYq3RgHBIL70CDzT4jkBxTVVvCJlCB7wj4JWK0
         YzeQ==
X-Forwarded-Encrypted: i=1; AKwUvByWA19Rmqjrm3nGT40knvSooahIm8Xm23gG8xNOozZ0CGqneKS3+WendVfx92Ce900vX2AjpZMVQTc4cw==@lists.infradead.org
X-Gm-Message-State: AFuF++mdZxj7JpWQFOoxcwp4dgDZTCxLtjRj0gPVhk77Mud99SJpeBhp
	wrkVrq45k8YNhtPfTtehWH7557Km2nYhkqgWkviWH2EW+nuHf5fI7pa5
X-Gm-Gg: AYBFou3T2B5GNvI+ms1wbn/olIg7mhPQ1QN+1kArzTYeTEbzuNtSsCkP/HKIigkpcK3
	kwlOjgTGtc+dS/X1GhyC7XaCa1pGqpLI31OaFcCeEgwvUFmQF5Y3UYRzjJ7lHiM9W1tFL4KsueC
	SzW15RJTl/q/JAiMmLddQxrRtYk5jVZ6jUaKK4ImoBI/KhcHwl/2DCdRHGdFAh8RkKR0qunTEzg
	3EBnvaMe27jr1LDCiTmGrqB49Fyft9SoTyO8E4pOr9z/+8BaKubp/SjHduz/hLHYJRxcxaj2nCB
	7tDcl/3luc4CbfWIuZn451GIf8Sca4Fi/eVqOL1A0uBzqlcoxqkKdK7Vdhz9cbXTxaJ/WaGEmJ3
	+LP+Q3YXDmM6MCBLMowwY2bijg5ltSKjt4DocZmZPJcL1zyn1kHITdI73HcSIHvpA6lsphK4dHU
	Qyo7dWymXQf+m/DVVUnuoKIHQ6OkSc+ZQDmlY8fNGlcJM9OY8IpRkADy8UQ5Ramcic8SRhj7tu3
	3GKaopVsPi4ceFSPHb+umXcHKB0o4JpN1AIraWRXhN7ABK2tV3rlPI=
X-Received: by 2002:a05:6820:180d:b0:6b7:8415:d78f with SMTP id 006d021491bc7-6b78415d8bbmr19129181eaf.58.1789040785360;
        Thu, 10 Sep 2026 04:46:25 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm46857652c88.0.2026.09.10.04.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:46:24 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 17/20] KVM: selftests: Take the memory region type, not memslot, in page allocators
In-Reply-To: <20260902164123.2546762-18-seanjc@google.com>
Date: Thu, 10 Sep 2026 17:10:56 +0530
Message-ID: <33vh1ghj.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-18-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_044626_556505_DDF69E67 
X-CRM114-Status: UNSURE (   8.23  )
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

> Take the memory region type instead of the memslot in all page allocator
> APIs, except for the innermost quad-underscores function.  This will allow
> automatically selecting the minimum GPA based on the allocation type, which
> can't be done using the memslot due to all regions sharing a single memslot
> by default.  PowerPC support will also leverage the type to ensure that
> page table allocations are naturally aligned.
>

yup, PowerPC can leverage this.

> No functional change intended.
>

Sure, even though the callers are changed to pass type instead of slot,
the inner page allocator is moved to pass vm->memslots[type] to
____vm_phy_pages_alloc(). So no functional change.

LGTM.
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
