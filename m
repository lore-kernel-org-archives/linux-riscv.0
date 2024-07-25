Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C22C3DA61
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 03:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yINIv/PqS/be7vByIJjM7o1oMr518RCoQZet5etOvdA=; b=XHzRKPiuaCLC6q38ght/yGw/1X
	nKcNo47wYhuc7Q4V0P92wP0gV/hZ0HEN6zb8tITqbehWJmLWGzIJrryV54SO3uTwqOOAyNKtnpHV3
	4EDHVu6Tm9caL4+I3gSPzYgdRI45I5zsUfDekfSzDjmk3Azqa5fhObZSB+OzQB9aNVGwd2TZsw1Ki
	Gyc/OaSl2t+yLo7bJfIZrsiy8zN0u1gLA10cd2gQfvxxv3907HWC4GsoC+MhabZ/iqhZgsqg/L59E
	R0jNTQ8Ltb4i1dQUExKATQWqBotdNH7VNMEDL6ztqkAwcDxU7Z+3PY3nRAVblSzjWRB0mIayyLbGx
	+ybSiRbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWp4m-0000000HCqf-2ZPU;
	Thu, 25 Jul 2024 03:23:32 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWp4j-0000000HCq8-0iJh
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 03:23:31 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fc4fcbb131so3957185ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 20:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1721877808; x=1722482608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTE8k4Xtav3leE527QlrLLpsREQH2LrAwQwbgSK195c=;
        b=wb1nc7AKvs26uC8OzYNAtHDrzSh1SwXvb5P+zQDIXaaGW9PVpfxnr4D8ny0GAhzrcl
         xqDntR2Jw+4G7boBOChslhkCnZU/STp7PTTqeCYD8ZJEIP+02GpTHQcfgArYu4bXMSp/
         yD7u6Jern1fF8F/6H7IQG8KR65lpwZGsh+f8wtlHSlhjLIkoaL1TF+zDfgc8ero7ux+8
         X/WRoz6iJNWKr3jX6T3jv5QkUKKp8Jl1qrtJ/nLMf8+WJNKAN68H5TsG9GzF4BJNT9YE
         N1zW7p7QmgF+99ma35kGfqNqOdC+WKB9R4Go3eC5Vjv7Mfpe7yctfZ5AHZVxDR6ZpzOe
         2brA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721877808; x=1722482608;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTE8k4Xtav3leE527QlrLLpsREQH2LrAwQwbgSK195c=;
        b=ChgV8SQZ6GOeZljYQRM+6ETYuaKDuJqnKrvzleaLdSwj2ofVluE8wMnptTjzb1jKNl
         o+efkf6Q+17QBn59ittZapW8gaIKmoxHiQkJb3UQnRTVHPVVQKMIB4r7kWLpDtDdSvAi
         nSiQHh7wTK+ys7chi0NSuWRb0H0cVKcEmY9SDa/WZBS6raEuVFykOWe2KyLQpx5YoYt0
         NSr97kvZzMqCnCZS7RrjDlQqxH7x1tjtWqYMgVBoUvS6Do1xxOoIZyQvQK9tTyrCThul
         FF2beiKS775D8YVeUphXIUHPyMzYSq/fU28rWsooiS8Fn8mtWEKQOzJj1CnHcxj0xsQ0
         MV8w==
X-Forwarded-Encrypted: i=1; AJvYcCWED7SeEY8y/HzvkGduNqhyRnPFnHyJSTxruDcRA2v58UML707oMJBZRr+bx7ny743iyvaqdo2ybHNzsliehpTue84EJ0og8Ywl9xH0Q18M
X-Gm-Message-State: AOJu0YwNY1qTlm8lb94omw+XWqg//+p4EHWEARhYdUYmrIGj0V+1SDEx
	bkbnnUlw/u6rENJv6MhcLKuNIR22NK6P564f7Z4P1zjGVhiOklVzhLN1P3V7G1A=
X-Google-Smtp-Source: AGHT+IGKdmVEgqPrldLhr2mxPHSbU8xFGw3cUdaIe+udwlpFod7DeQVhk2V4YNFDZRSHwo5qxGrUnQ==
X-Received: by 2002:a17:902:f68d:b0:1fb:8e98:4452 with SMTP id d9443c01a7336-1fed9262e28mr7130605ad.15.1721877807944;
        Wed, 24 Jul 2024 20:23:27 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee5734sm3134035ad.135.2024.07.24.20.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 20:23:27 -0700 (PDT)
Date: Wed, 24 Jul 2024 20:23:27 -0700 (PDT)
X-Google-Original-Date: Wed, 24 Jul 2024 20:23:25 PDT (-0700)
Subject: Re: [PATCH v7 09/13] riscv: vector: Support xtheadvector save/restore
In-Reply-To: <20240724-xtheadvector-v7-9-b741910ada3e@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, jszhang@kernel.org, wens@csie.org,
  jernej.skrabec@gmail.com, samuel@sholland.org, samuel.holland@sifive.com, corbet@lwn.net,
  shuah@kernel.org, guoren@kernel.org, Evan Green <evan@rivosinc.com>, andy.chiu@sifive.com,
  jrtc27@jrtc27.com, ajones@ventanamicro.com, linux-riscv@lists.infradead.org,
  devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
  linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>,
  Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Message-ID: <mhng-28424e23-c9b4-407e-97d8-9dbb09101781@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_202329_494006_59C3C27B 
X-CRM114-Status: GOOD (  17.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 24 Jul 2024 12:14:00 PDT (-0700), Charlie Jenkins wrote:
> Use alternatives to add support for xtheadvector vector save/restore
> routines.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

b4 isn't applying this, either on top of your last patch set or rc1 -- 
the base commit in the header isn't a hash I have, so I'm not sure where 
it's mean to apply to.

Also...

> ---
>  arch/riscv/include/asm/csr.h           |   6 +
>  arch/riscv/include/asm/switch_to.h     |   2 +-
>  arch/riscv/include/asm/vector.h        | 225 +++++++++++++++++++++++++--------
>  arch/riscv/kernel/cpufeature.c         |   5 +-
>  arch/riscv/kernel/kernel_mode_vector.c |   8 +-
>  arch/riscv/kernel/process.c            |   4 +-
>  arch/riscv/kernel/signal.c             |   6 +-
>  arch/riscv/kernel/vector.c             |  12 +-
>  8 files changed, 198 insertions(+), 70 deletions(-)

[...]

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index bf25215bad24..cb48092fdc5d 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -845,10 +845,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
>  			riscv_isa_set_ext(ext, source_isa);
>  		}
>
> -<<<<<<< HEAD
>  		riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
> -=======
> ->>>>>>> 0f260ac829ca (riscv: Extend cpufeature.c to detect vendor extensions)
>  		riscv_fill_cpu_vendor_ext(cpu_node, cpu);
>
>  		of_node_put(cpu_node);

This chunk isn't applying, and it's got a conflict marker in there.  So 
I think that means something's gone off the rails?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
