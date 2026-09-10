Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44016C79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQ68tJ6c8L6DYnkCMgVQrVvIbXKSH+HRIwl/UVkdAYY=; b=iLC8W6ICdl7uIU
	oeoMbRzA0vxR+7Hm+ZdRD1djlIubu1VPyFZto65G0AX5m0SD6D2dstrIiG8BCzuysKOkAjjIqqJ0W
	UTnFarEgY5QlRFPdUf7pKzi/Ivk4XfSaKm2O4X1ro5TeJ9mqfayvDiDIMEl6LaIqT6ArF5HZ8ktSD
	+r7IVbYBV0ZVKrvyn4JCNY1px0QoEWIqvr+L64bG07LRarX72+WWmGcXOuQYEoBKK5+kfJVucamKp
	MfbVlYKma7TwsZYdKEOwo3IxXl/dCCosq+bcA1IFzMFYmt4SjC0pABmKqaw6IMzkoUVlwRL+V0xjI
	IvTolF2ISk0S1rJpxA9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cd3-0000000E9zu-0vMn;
	Thu, 10 Sep 2026 11:07:41 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cd1-0000000E9yh-07ME
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 11:07:40 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so6913656a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 04:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038458; x=1789643258; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=70Xrz5Ek18W9RLHK+PGrZl6neyZSU/LQLxpuqNmBXms=;
        b=qsALKBLuc6lRqR5oN/vSJjJYT7w7eMasGac7SBilwBbckJ02iesHaDh67Ye0NByrtw
         YGYvTT/L+zDcpLTJUt/Wo1qNINN4vzd3cHAqx0IJpsunfacx/v056DCEJetaEDiuWxPU
         0Gb+3975X8l6JAMfE0ZQAqiApcVY7SdmyNXaDriFuIFy7j5z1sSXobZtm9wVEJ5GIT9q
         0rdYjOd2CBdNqxN3H2JXXJnA4/tkmRhSn4YY77LEUdzBZuRzklRJyN3rciDPWjuAYfYU
         faM9YtPZhsrEgBZO4N1eNat242aMPsmkIdPcmF6/2f09wmP0WtKNhx4XI/N4pKa0mNyq
         xCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038458; x=1789643258;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70Xrz5Ek18W9RLHK+PGrZl6neyZSU/LQLxpuqNmBXms=;
        b=oKq+Hd7Hfj4OkwwyavyW3Ox/qEqGZ/yyGgLzDOM7zppvRIGTS9LQYdLt4qQeMILqJq
         fXjdt9Vd+/0i19tESnLk+xLl0GNQpcJQ/+gnlWEu7Me3bb3KlwJdEufRdzdWEzCoy//1
         aEj+NLlErhhFKtusvofVdRqV2/gPnerlHpQnZEQixUdbxY9WEjJqjY20HVGIOoVbHPw9
         D2z5LsY1PE7Dx9HGklZ3bo3KHN4Mv6WDvxQ5/iXSgZVlVdbPJXcGQjLdA5Z0qC6lH7Vq
         03vB7XMaaLCYUJ6t8PWfSz8+dMTmlJ5DDGrmvPwq+iXfsDuzCYaZWd6fUiQXeni1jV6n
         oUeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbWb78DSlOlD61hlL0apUOrHQkIb3EPV2Xg2jrQDgBRSx5fApP/UqzAdi1t6qKj+LhM+hV27zihWmAHA==@lists.infradead.org
X-Gm-Message-State: AFuF++kfhtt982XFLl7ed/vEb+QAdYNJ9oTLGejnSBorWVsuoEJuiU89
	8V40ddNLGSt2jDHbCNk3hecN7bX+kb3jjLh4TjlqfNUmhcjtb0+UQme1
X-Gm-Gg: AYBFou3ortEp9oIO69K0hCBY/cxMxox/VgvXiuUy5RSKaCkD0L5bldD89srrxJU3Mi2
	gTg3kE3pGq3ojm17wTLMiV5ZdnBvk0JwaLBGD69ywOF+S4UL/KYutblGfUy6kFkh77yRCVX6D47
	ApDpdVQGS81uR0alJkvIveGKjdnRpv0eLVOa8MK+vZrHOvVclEo//VU1UdhnjdPQJlrTu0349eQ
	Wu097Clhb76xnuFwbKyEEDYzkuOv4lcTjlT2j+s1ETrFfqI7EzctyrttS7TzsPQmFtznHSv+9FB
	kp0WLXN0wdoZBlQbW/tsnOMHiiqXVpKf+KcMN20TToUGIHoKqlNPecOl9vOMAi6jjDusPPEeg2m
	0kD1wkwoIEyC0Ul7GHt2/teKBMcHDalP6OlDDK5vQPYTWQakdYPfQ+MV1YDTA9T3o6rJ5ecp4kd
	RSScLbMAoAuFP6mFuc9Om8N3uOKrYV5XMcqWdbfwkxLUGOmdYvVJM8iOxTij6sA72tE3Us1hxUZ
	p8PEf7s4beNKAT9BY4uvDG1Vn3AU1j1XG20y34ueKSdzJPBuglnIW8=
X-Received: by 2002:a17:90b:1b06:b0:398:9be9:ab8e with SMTP id 98e67ed59e1d1-39b2622ba26mr58218547a91.19.1789038457819;
        Thu, 10 Sep 2026 04:07:37 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm43023781eec.6.2026.09.10.04.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:07:36 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 10/20] KVM: selftests: Add a wrapper API to allocate multiple page table pages
In-Reply-To: <20260902164123.2546762-11-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:34:41 +0530
Message-ID: <8q591i5y.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-11-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_040739_060070_178A858A 
X-CRM114-Status: UNSURE (   4.65  )
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

> Add vm_alloc_page_table_pages() and use it throughout arch code to replace
> open coded equivalents.
>
> No functional change intended.
>

Straight forward change. LGTM.

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
