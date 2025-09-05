Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BF4CA1010
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 18:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Deyxn2UiaAHEw9Nc8GnW43u+3gOLs/db0JySQy6Eg9c=; b=d2B+dZUYW4Ofp6
	Dt2CNu00j96WyFsVHF/n3igFINSICmhuqSjaKAzkYU9z4nexlYSlDtbSIx1WMRZfF7iLa2jWSjgf4
	cCqcOUJm79V7CwYk4RCAtHLxS/ihS6fJxqYB5REh66tVjH4ZhOZ/0TUwehJ01xbkMBkbprJAQ7HYd
	gtu/dgXDePAr8HQop56/und9gjWe++qUgxf0i27GYdqMJBeOXKUB1S82NCcUwJpzonNU8FIFB97z3
	cS3m0js3uW6YsZKEeqh2v9wMG8ROs+LT4BJY1SZesvjzm8mxT+shXxE9nT2TCltKkIE2QNTfFIGFP
	Fq0IVgfhebC6UJ98Mf9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uub4Q-00000003l2P-3tWU;
	Fri, 05 Sep 2025 18:21:58 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXK5-00000002FPB-43FL
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 14:21:55 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3f665603584so14380905ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Sep 2025 07:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1757082113; x=1757686913; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WAIXNF/yhxj3WIda95HMOmBhnbf7MpGftHHpVlcqDy4=;
        b=UwF9Fy0pC/W9M2qcGRMy0CeYBm6WO2gWKUp4xPd+DGvf/CZVOz5IDZIDwV6IsAfq90
         0Tj++FNdhZzU3A8xHUVmclV50Nj0FIxKTc6wxl9CPp9hM3RsO7NCMSR6FHUrL7diq5ss
         RHjtHpih9XEe7UiblJc03wBnx43WRCxxAsGTLmy/3j5Gd90U7hwRfm54hPfliXyPw9SR
         tg4oRT5X20EXaX6KixDY4+rRUiuInvtcysG2zT4u144qPYPARU2xSXKviOPGDyu22wK1
         bb3tMQ/ewjlrZd7+hMATJECz19jwbUmSHRjUKpvxbgrmIXEIAyRxe+oFvVkm3EqnkNZ2
         OMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082113; x=1757686913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAIXNF/yhxj3WIda95HMOmBhnbf7MpGftHHpVlcqDy4=;
        b=RpDagiLzhDv38IxZngDK0yWCHGjqHKeZspYjXli0D8QUl5QyAk0t+ydvkIPZORY+a6
         pl+nPKEEcpKny7DIh6FUlIifDg/8+SdLxaxg7RRMUzMQ8jkd2Uj87bnkxKH9b8FcvajM
         bCcqkxcE5JtwMFx+VZFbji5vUO/huhawCo2NaIdJ0L68P3n3HMob5nl9zLMDeEdKZ/RR
         ak7lMnole+R8AOMaXShinpyZyarXZ2S/4QUZLudra5JP0gkqGAP9JsQnSovxnRP51ZFH
         BNE9lAukDBILXAwYqQi9cdw0KQGq6QzNykY5/tI3cko+uwetA+XkOICNaiiSS3its6j0
         QnEA==
X-Forwarded-Encrypted: i=1; AJvYcCVtbTgsejQcfBmw3ox+U+wWfmAAxL444srdQPzI5RkzbOu3HJB+g8yVlNETLp0Y5m/mJrAzUEIrnamV3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqnjWaNUOiy9mo7M15usLvR6coyQlXLm5vBit5JS8LVqeBotpm
	BntdgcEBHBHnAOrgm457JvnZYEaMf9Xp9yoDlK+dNCej7UmP7sc/c2yJic9RhO9tJrY=
X-Gm-Gg: ASbGncuzC9cDZPAMcx0yN0xpOoZcLlsKtxsWc/trYRzIZ0Fpoc+NHHv8+aoBea4ultV
	+YvapGyzTP7+7JqdalIcxIN6fzcYQWTqvSxT0G8g1sZNvhFGV3Q8+8d0BsFjHiPbj4wdfhWfAdm
	w02AxK+tmWpnEBEYcf9Elb3w1zreTu7Gmsc2FPBX5y+eexsylvz0RQQfglsiT09Tq9tbgpkxPsK
	k9JeMOrp8NXVadZFTQXyzIpbp91/FgGMtNZ92mrLsE2UL8ALcn+iuq8DZ6sRMopUMXgBJ53obTc
	rRaP5JBa9t9xO9QQ/6pLlxVYh0A0yXP9yTIniJa4A99IpUaB4LC97RnPahRsdMu8ZvzCYE1RM+9
	GINwbDl5yZultsQdBbpieTEic
X-Google-Smtp-Source: AGHT+IGf4qxxSXO6iewjkiZTlmr4yvaEZFX/IytJuUl4Nj32J40fOreM/84N8MX0m+sgaZr+dqFiDw==
X-Received: by 2002:a05:6e02:240c:b0:3f6:6198:b39e with SMTP id e9e14a558f8ab-3f7b6808028mr57130415ab.0.1757082112699;
        Fri, 05 Sep 2025 07:21:52 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50d8f0d594fsm6185353173.23.2025.09.05.07.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:21:52 -0700 (PDT)
Date: Fri, 5 Sep 2025 09:21:51 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 5/6] RISC-V: KVM: Implement ONE_REG interface for SBI
 FWFT state
Message-ID: <20250905-005c0bc3e16e909c5d91eef4@orel>
References: <20250823155947.1354229-1-apatel@ventanamicro.com>
 <20250823155947.1354229-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250823155947.1354229-6-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_072154_004748_5D56DB55 
X-CRM114-Status: GOOD (  10.02  )
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

On Sat, Aug 23, 2025 at 09:29:46PM +0530, Anup Patel wrote:
> The KVM user-space needs a way to save/restore the state of
> SBI FWFT features so implement SBI extension ONE_REG callbacks.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |   1 +
>  arch/riscv/include/uapi/asm/kvm.h          |  15 ++
>  arch/riscv/kvm/vcpu_sbi_fwft.c             | 197 +++++++++++++++++++--
>  3 files changed, 200 insertions(+), 13 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
