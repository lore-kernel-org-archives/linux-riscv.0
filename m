Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB746C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkbWrmP4WYrxvY4eWSOgJTyvbxHc9iKt8cC00cuScmU=; b=LFnMTDhxNALEeT
	IfIKgsy+/EESho1mNvznM+Q3JCaO+fHbyNAWvPWPATHdTKQRCiPBQLL25NMRWv2GHEifkzV95GNMs
	vVKLfZ7e+gh4PKPGTu9b29xWobV6KQjxO/pPD2Z9jgPdmuGp8V4+4NyaUVuLa4QkY/cDoYgmWS888
	Y91dkvaXdkLHQ5UpsRVlBiOsHguUnp2UJ/TijuAL/Ni99chfcfz0ImNL4BG8Sy+6hAY+TsIowBbEV
	GS5IV2xFlUHKAUt4MteK2MQWMs/5Hg+QloN5m+ZKFWnQ+A+H0Z/t+p7Cca1TG3Xm3uOgTVwSwL/Uw
	iEAu06mAeVw+EJx4/XdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNedr-00GzuY-BR; Thu, 02 Feb 2023 18:49:03 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNedo-00GztA-D1
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 18:49:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so2181201wms.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 10:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hyIuku1DLw3Kq70v/GpC6w5pbvVSADLCrJO9Kfo6jnE=;
        b=B+hTTsIpPXufuh3YNnn326L0bofkR55sUD2C8YR4wnrOd/T1pmzVKMOGZ2CELwjlPN
         +XxqxDdGE7UKGrlA1VOtX5E9ROQUhY5tg0i9lb6iqcfoRnbFieEPHMoHuP+MFQ2M/fz2
         /KJ7/CM6DXm8xHX2Vxeq3pZ9fbyPAkWPmw/FfqCgM45DFRIv6gkJZ18TmzF6UKyfuL9Q
         8RzM18wxGX7Z6cvhzE5QsQ1qZpRqQPpO2NhxWleXS73tkmWPhhhpkRY0A98ULGmcg8fF
         /Y3EeZdihnRtEzs/XWNudPzXhTK6eQ9beFixFwDTWVhmhhtjb/Q5VCO93LxiNG8GqVt2
         ZBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyIuku1DLw3Kq70v/GpC6w5pbvVSADLCrJO9Kfo6jnE=;
        b=IuSyVSW2+Swjm1GGHPNLPb+N/lQkKDPfHKqaQoAEGhzRYv3F+hIINqC/bjgEZ61SmN
         4Nh2b0QpMgqqm48kZ+JvzAALlnvYhQQSe3rS6JZtH+7tu/8ajZFRTAttfJdt/2EIjEu6
         txo7tlOivwioovAbJm+0/h7zRGDZaiNs2kfHwlVJM0lUqCFvb/e6IUvxTXW3Gfl4HOLj
         XAkIKsgzaQqR4TXFpyGrrYywjyH7WC11XZCV0JptN4rP5ibsR+06b0W04LC4ANHksYEA
         YXJaYEmEH/ZZN0tcstWrUVMB9x8UN4TRtVP27Wgsm5g4QH+gANkulkU8Qu76tEf4+gEa
         oQIw==
X-Gm-Message-State: AO0yUKXpJ7qmVA5y75ueThGUx65ReZubsykltXMelLe4zHQzcXCVjvbW
	/i8AZseR+iUaffBS/UGzemNncA==
X-Google-Smtp-Source: AK7set9DkB6Y38JyS2pl/dSssNbOlSVrKpDPsMqQqNpIhqkiEvGOx+L4qp0KckHTYsEBBlDSUGZFBw==
X-Received: by 2002:a05:600c:601b:b0:3dc:443e:4212 with SMTP id az27-20020a05600c601b00b003dc443e4212mr7330912wmb.1.1675363738367;
        Thu, 02 Feb 2023 10:48:58 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l21-20020a05600c1d1500b003dc59d6f2f8sm655370wms.17.2023.02.02.10.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 10:48:58 -0800 (PST)
Date: Thu, 2 Feb 2023 19:48:57 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>, Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 14/14] RISC-V: KVM: Increment firmware pmu events
Message-ID: <20230202184857.knf3cle6j2cd7a4n@orel>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-15-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230201231250.3806412-15-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_104900_462652_4E104FBD 
X-CRM114-Status: GOOD (  10.10  )
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

On Wed, Feb 01, 2023 at 03:12:50PM -0800, Atish Patra wrote:
> KVM supports firmware events now. Invoke the firmware event increment
> function from appropriate places.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/tlb.c              | 4 ++++
>  arch/riscv/kvm/vcpu_sbi_replace.c | 7 +++++++
>  2 files changed, 11 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
