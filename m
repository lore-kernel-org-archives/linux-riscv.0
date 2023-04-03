Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44FDC76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 12:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nSfMnDm2VgNoTBOb6021vwdheeyehjdhaOzT2rPZS0=; b=qhTh8H9uSwyVR7
	VFhl88t3qgC7NjohSl/g9RN7X8vR0pOhqrBNlUysPAQa/CpkwTBDoYdyJE25Dt/PsE6Ksdv7L7+T5
	oQlcfyH8NvoBCwxFW53MhmT8uBdl5Za6oWvc3JGa65dk56Ckm/3+xHPxp3CIfl+0T/C8x1nanb4Pd
	9wiRsThGH+1V1rmPqXvST5BwQhCP3ojIJU7KQ7aKjEET/Wx3AfcGlXs/2Wa+k+OGaaRdfc/00GRSA
	dwlBV1GNz0XnNeARTGkOm/Nyz6RgcxpatdzIrUITMfHz9NN7nR8FxF8YAz6VKClC6UCSGZ4LdPIM9
	o1S3CPfu2HhR/QZWpFhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJ8h-00FFCK-2k;
	Mon, 03 Apr 2023 12:18:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJ8f-00FFA0-0x
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 12:18:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so14263582wms.5
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 05:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680524292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0sZyqGTmONd+OiUWWgNg/LaGCmZOm5KGMk/U72UVlI4=;
        b=D9P1MRGXZC536z7u7xjW5lffWdsS3+t+jC8Qc/CwcuZltSkm4vLA+Pi0pRztpK0UaU
         R5BdMvC/2Jy4MJAts4xNkzkg7YEfAmeJ4SREriJPstsMm8jEf2P2z4CzhjhLjzCKm99M
         MOS6syZGTgFg3S+xOueXJwJlzldIt1aD15QBVjXNKlLLX66YwcJ8MfFtJG6fzJecuav7
         GS7qtb4iLXTuzAqYtZugZi3rluQwuTyaKqjTk/OXn7i9Kup/YRryND3B4+L2XJE3pj3R
         x4wFTQaAxmrD6E5MjlcAQRmj5y4gsaOiwpeIBNLffIkw16z+MROQLM1EVesASDQROnBr
         PPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680524292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sZyqGTmONd+OiUWWgNg/LaGCmZOm5KGMk/U72UVlI4=;
        b=AsK1k6XqrYkb6hhGyBnpCxziHfoGSC72A7HXVw7xvmahDqZYkX3rbYMRWqhiQKRDDy
         Gb8vrhf0OZgoq+EKBbxQkb3x7AQQDIEKNmN3+KTO5bQGCbP3y2AyXtpwIfm4kUxzPGS+
         2+/UR9snXUDtX2pFftrln/Vc/wOYlEqE1zEM/vtTpfkX402pxWLLPAy1ERPYo36JAjPn
         XiMy+APnQTl3hf/Idx+9b1easkH+t7GIYC1+gAJm4Bnx+xwAQ8C8XD22vUyEJ3WlgWhv
         tyfo4/axRZhK6cCStrNDS3woUk0n+EHeVQPW6LupUZY1XQRAlmFTpH5ikPoYZu5K89AM
         d1mg==
X-Gm-Message-State: AO0yUKUTqkQRjw+3YKDjE/9D1ZWuqmnLx8GV2oz7v7CxuWXo9osgCkxs
	8uJJKmCfWdhlL8Dm7F8nmAaOYA==
X-Google-Smtp-Source: AK7set+DP1TDktb9pra/DZHm3KlYQXRnDfWDma3weJvCWw8pMrNMdh3WQQDAT7tLqsQjUFzSNVkztQ==
X-Received: by 2002:a05:600c:2114:b0:3dc:1687:9ba2 with SMTP id u20-20020a05600c211400b003dc16879ba2mr25285632wml.35.1680524292674;
        Mon, 03 Apr 2023 05:18:12 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c024700b003ee63fe5203sm11922415wmj.36.2023.04.03.05.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 05:18:12 -0700 (PDT)
Date: Mon, 3 Apr 2023 14:18:11 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/8] RISC-V: KVM: Implement subtype for CSR ONE_REG
 interface
Message-ID: <t2xcol77el5zebqnjvigqzysiyv3w2xcc6i45f2gthr5dbntnt@eu4obey7lxgf>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403093310.2271142-6-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_051821_336861_18395BA1 
X-CRM114-Status: UNSURE (   9.72  )
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

On Mon, Apr 03, 2023 at 03:03:07PM +0530, Anup Patel wrote:
> To make the CSR ONE_REG interface extensible, we implement subtype
> for the CSR ONE_REG IDs. The existing CSR ONE_REG IDs are treated
> as subtype = 0 (aka General CSRs).
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |  3 +-
>  arch/riscv/kvm/vcpu.c             | 88 +++++++++++++++++++++++--------
>  2 files changed, 69 insertions(+), 22 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
