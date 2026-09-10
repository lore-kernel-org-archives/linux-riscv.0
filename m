Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44B7C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 06:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pr4l+2fxPTV6t74j+eXvGp6EeAuwYYX5k1LFilHjH4A=; b=182HkJi33ghHXy
	J02bHV4+UZh4Pjqy7iOhqhDjIbl/0Wi3Bgf1Ki1eZbZ6YYnZimS5GTd2fvnjKGT7Nyo0vWgb77O/X
	MdrkIzFfuCp7MTkhnI8BLG2+SZPsARIULZ64FBxv0NIeAymiCIEjvkJ/xRHqDKRJpcedwUNS7sOvq
	MjdS9Fzyu/UYSoHUSJXD4+QcZJnXgC573mqWHvEbw1MVQwXnAzF2xODWr/m6NmHzchpsDvS81k5Hl
	c2noNhQV3J7fe0ZR4gOM6Cu8SdfxX6d52w+eLj6DWsGwltL06lOzeAMXGpPaLE8PDZ4Co6f3aHM6w
	ODoicJA8OIhv1XB0Tqhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YQx-0000000DY4B-1b70;
	Thu, 10 Sep 2026 06:38:55 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YQv-0000000DY3F-0c6A
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 06:38:54 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso72264845ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 23:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022332; x=1789627132; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TP/7+E4rrU+pDYrVqTFosm4KeNM9JoqKXMfQYJNgxAE=;
        b=cUALl9sDGpTVb7tdoRnaQmA3P0fyyFdpkoC12SODCoSB1d01qIgYoYesKyZj0ckgvg
         z+Jc3h41CewM13PuW+ddnXE/W5UsBFxL5jWtONDUt2UFPfnzg55teSxPR7szjuSUr3cv
         r91pmyWBR/2PDVRHftBbvsRxxfvwL03c4pCFJGgmXWIjeAeoiMAZ9inScVrUqy4rzmOg
         9JzPFFXGmaEGDIHiBFr7hbklXvjBcqowVtE5g/b0aq6F1nmftmuwC6YIQO49r3bEekx9
         FhspB1a/97vay4AgLM2GjPRqqP4jlyoKu3ypz5VxVpL3cJjWk4kj+Aojdz/5bLHKR4N1
         MrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022332; x=1789627132;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TP/7+E4rrU+pDYrVqTFosm4KeNM9JoqKXMfQYJNgxAE=;
        b=JEBnNyT4UkANIcNsX72Tutt2/F6t4EcnAg7wfVwF1gi2ljUfJoyqoWuZV9WZdAXUeY
         qntbe/nw027T7+94doX6RrF5UAe4vKarn7dcPfMx6YmndgQT5qA5wYZDsWyagKb3HqoD
         7ydapixLrONjOQZCGkYkRiJaL/THi9UjR2PamOKn9y3VjxUfAYgKCo9gW13zInZSMRXt
         XBrIR8wVIrLgeZEw8MlItEEV7eWILxh0kq6vppKX6Cscn1Ftx/ypOF+vqo9Kd5KYVePr
         Kx55esdqlJewvHnnOQd+G9QyXxYpq5Es6Vv1J4HjvN6wbxfHKE12AiX7PYWuQe1Z6cvb
         kWVA==
X-Forwarded-Encrypted: i=1; AKwUvBwv75FAYG1v8rXYvnnONKeD48+awcZKav1iTVZJA1lHYbEsqj6h7MnqLxiXKCtJil3kBTABdeU13EOB3A==@lists.infradead.org
X-Gm-Message-State: AFuF++lOufTg/KwczR9lTUQr9ucMJKy7MIdT/iW15qxRe2OuPFuaLqxK
	pCvaypFqjjpOTeSRF6szBdGXilhbnPC8oDjr0zC0VSAhH69P7gnTwS11
X-Gm-Gg: AYBFou1wcoWXFoMs5fh+5ypAGd7Q9XLBBdAo45sP++FyRcZoHO9kcSrBU9NlMhHFHdX
	CS1mF+zUMsohYEcAiOocKWW/zjj2aHnoidGvKvlfK8C0FoKFZvm3sK0Rew/RNL7ALefDTmoDyMK
	ujhxn18UkbP+YdecYn7DPBUfPaJmJY25EtmR1t4hZMyHex4byTNHs2S9uauEqhfQYjiEkVU6OrF
	/3ofieCraNq7lRKZL460YkI6fYIsaBCet5TWPLO7lCrZoVU+7WwiAhHBhiLL8/QtGgk+76fSAoR
	0/dKYLFd/S5cQwvd6T4zJXp2alpTsK19eEJDlY8G78LzdSlnkhgEVXJ/YUegKZGewzbG0hJW7Ot
	sV156AW3JJgauhNoFYWLsJZTRJOgzWioYa7MMwkWpVC/YcBTEbJrNapb6Lz46nqXCulx4Y9rBMj
	ETCsWBqv3qmqA5FTxB4+o3kT4/NnwTHmb5KeVeclniJ0jwcveZurDOW4V7EF2RPpH3bZBhWbGDD
	0PEwtuSeSBcdxRfq+A0AOqoQuom5p8FX9Lw//rkodo8ERnQjbM6ZtjJQH+yxy9weA==
X-Received: by 2002:a17:90a:2c9:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39b2b5a9b24mr38222127a91.6.1789022332072;
        Wed, 09 Sep 2026 23:38:52 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm10464300eec.20.2026.09.09.23.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:38:51 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 07/20] KVM: selftests: Make the single-page allocator APIs static inline
In-Reply-To: <20260902164123.2546762-8-seanjc@google.com>
Date: Thu, 10 Sep 2026 12:06:11 +0530
Message-ID: <ecf11ulg.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-8-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_233853_178051_FEDA8DB6 
X-CRM114-Status: UNSURE (   5.39  )
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

> Move the single-page allocator APIs to kvm_util.h as inline functions, as
> the are trivial wrappers, and unlike __vm_phy_pages_alloc(), are expected
> to remain that way for the foreseeable future.
>
> No functional change intended.
>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
