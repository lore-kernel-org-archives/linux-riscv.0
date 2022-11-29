Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC58C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 05:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qOOzcnj2SLPGgGHA6y+vJea2gdQ9XvK5xI32MklE6Hk=; b=OuPArRh/H07VXp
	IE13W1s6VRz3q1AtgX2aIY01WwNmVfSqon7oikMr0bl911o+iajZuoQGoEp8UP+fvea6uIlZnJNTV
	ugaJ/UROlqXXectbVHx+pPzl/RG7nFSPI6iOHvSXEdP1ETkcZZ+zqtXcb+e/p2x98VkVrzAK5Ucqv
	N5jq/3HVGE/aI7DFS8r4MIODlXp7+95JPq3GFvtGykjJwpf5XMuYhS+hT6bLS8GZ3wZsCh/ft5H2r
	48YX020GuYAfF1Hj8PxruHMOnB2rKyR+Ucy4mRHmy5CW5a3gdT2EpSwtfREAi0pxn9rdPcM650/UO
	NyZd7cyqOR4zDiFiWyPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozt4a-006OII-DR; Tue, 29 Nov 2022 05:22:24 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozt4Y-006ODn-5M
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 05:22:23 +0000
Received: by mail-wr1-x42f.google.com with SMTP id o5so11301767wrm.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 21:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VX+itqdtRrB43wl3kKgpncV8GANmiBc0pfcxw2yUuLM=;
        b=bG/IrQ/Jixzo6903r9hdiDVrqSlnGMjeHDlGeazVMHCkysWbRtlm/GeJRZvt+CRWWl
         W742Q2rnyombXejTvQ7gcaZl4N7K8AJXrYys3m2CHDKY6fptemRY4xey51NIYgBfdpEV
         4vXYqPl68pOufbrcBNozppHSP9Igq+6RWmLPg+0CxBAHZWzAUB9BGnkFhjQckBmRE0fw
         CL6Utxu+ZMfHuSD1H2+5WWT+UKHPolCf3993tJi6aRmXyVnK2KTCyaBiewLdCDv91Sok
         L0PSv5bAifCxKQRiSXiBTm4amKUjVcYuQ8Dh44fDHd9vmA2MtpMTZ2dZfyq3ASyXUtAN
         OJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VX+itqdtRrB43wl3kKgpncV8GANmiBc0pfcxw2yUuLM=;
        b=I6F/Hsu1OVgekefP1ecRt2uEl100uB78pYSw/zGcxDuPKlV5zLZGytTVjdW15oFDgi
         YO4WI4wIZ22LqN4QrlnVi4D/2R8Lwi2QLFghYRWA3kEHzdYIkQFbgvRqXRFDRo19QdeI
         WZiWYFQr6lPms3iFaFspURXojPezs2dmEcjC9aw437H8xX3Cg4XqqvTD6eZ1EuoOC2pj
         NCirUtz3Hd1BWgj3q+1d2z1lSEKvdzSu9wuqS07AFxJeDivC+QJiiTqmZ4mUHIfFSctZ
         s+J1ZlpKg/68BWGtZ1dOKtfLdhdN7Ipu6ceU8LElX33GnkydsgYGZimxasO4jp4npAg/
         5SRA==
X-Gm-Message-State: ANoB5pmdZC9ZYNCeDfDR8U88Q34sfmS0Gf3Sc6Eixx8sFOV5xU9FLPqg
	fjwWZSeTCsZhYF2DDTS1yKHs+Gw0wvi8vA==
X-Google-Smtp-Source: AA0mqf5kd2rGATn4w0hFZs+L6eWBIfmaBzTGS2MjDUeIdf1p0JbHZPqT6eh18lSMKNcQd+csJcJ8kg==
X-Received: by 2002:adf:f244:0:b0:242:1da0:4984 with SMTP id b4-20020adff244000000b002421da04984mr3305960wrp.240.1669699338615;
        Mon, 28 Nov 2022 21:22:18 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id dn6-20020a05600c654600b003cf894dbc4fsm712294wmb.25.2022.11.28.21.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 21:22:18 -0800 (PST)
Date: Tue, 29 Nov 2022 06:22:17 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] RISC-V: KVM: Save mvendorid, marchid, and mimpid
 when creating VCPU
Message-ID: <20221129052217.7rpw33yrr6i6kncx@kamzik>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
 <20221128161424.608889-8-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128161424.608889-8-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_212222_303549_DD81F4C2 
X-CRM114-Status: GOOD (  10.51  )
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

On Mon, Nov 28, 2022 at 09:44:22PM +0530, Anup Patel wrote:
> We should save VCPU mvendorid, marchid, and mimpid at the time
> of creating VCPU so that we don't have to do host SBI call every
> time Guest/VM ask for these details.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |  5 +++++
>  arch/riscv/kvm/vcpu.c             |  6 ++++++
>  arch/riscv/kvm/vcpu_sbi_base.c    | 11 +++++------
>  3 files changed, 16 insertions(+), 6 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
