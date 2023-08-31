Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5E8EE49B2
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 22:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0ocG+9YToFZ7cOVzxcvrSVtS/OIHbx5pylVAZkk+yo=; b=cgzmHv2tzsxrZ7
	ibR0dPIbkhHTuxzOFfFQ0Kmy7+9Jph7pxThebjvL5xOf5AYrw7GcUSDIJecituQtMQSiGJXsThI2Z
	Wo+T7VRDisd8WOJ6gSy/iif2No/V9dVdOZgziye4xHGD3EWQkQGlJcNTqrwuGIkv1C+EZO4l2FQWZ
	UQ3TjO1dtPeC8mNiYNfTwRIoglJDncxZHaTXhu5QVA8uCneFry9jiKFI+FFGevOE3AnTIsMBYTbuf
	HXvhuX4Bs+MPqR3vo4UQKnGgnvnFIpcKuwztYnBKqpjaIWvvGrwy+3uMVLn7ONv3oPLi1hwT8vvbo
	gYh1imXQxkIwNBkHH5Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbpkm-00FsFa-18;
	Thu, 31 Aug 2023 22:03:04 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbpki-00FsD5-0Y
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 22:03:02 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bf1935f6c2so8684005ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 15:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1693519365; x=1694124165; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwjO4oxreLqhfjau8jiXC7Ebs6ni8GTGFdE3UjExNes=;
        b=Gu676Aoulbd4fjLurmGMsQMcVYVwcq2+7A7ps6JodCsk4j1KU+ZiYBhAlLB12Xh5UP
         T2eKnaH3HiDu1cg2UiviVWWOQ4U9QcSUWMn2f0bv/KoTcbXQlQs5AqgW20qWtq67AuDi
         UlWskZvzsYFm0bD+E6vp1Ci1AML803WWYPx1pjkxImQmaUeXf1d8AWEl+j/Gn6jvIC30
         AvupNsfoiUtupeuIMcQT6bJFXGPUeFDorZwdsIleQxHbOHewehxhK83+ikfep1OhpRYv
         SrV+HrYXHDL6YpDXUsJIPiVAbbLXUtFHn95mtvH7z+W8S7rPT0gwfosGc1Tel1qhbG1l
         AA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693519365; x=1694124165;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwjO4oxreLqhfjau8jiXC7Ebs6ni8GTGFdE3UjExNes=;
        b=j7q6vX/xdqp3DbULVP/kq6RbOzXKw+riQBr1ihqPNeG/CpMoWUcIXR17QGXiFYPV4g
         BrHFwO9FXheYoVnUDBKuKQRqeHeIr997NIsIDay53dD+0VMmKDTev5qcJKwbkL7H9P94
         1YRMj95TfQkKpjCqKX6VnmajkVv8geBMZyvBtb4SVH2mrZt/0eiQtyq7zkSF7e9nsc9k
         sF2ay9JAss8P7nuytkVNxMJ2LhkArcBuSiqVR3rGCwnbC8ZZtpsIpDcUxYtvPmMxsjL+
         FJ5PgtJ3EK0zC8imrfHGuqfQO4FwI2U2lIoseOfw7d5I+3/lnZ/HMP6WRUwoX569t6+j
         bGJg==
X-Gm-Message-State: AOJu0Yx6BOd+6zi1DAJe57Zcuq80/tKYTvXEJIH3jhz3qxyBjGyDUdAQ
	C/ndHFOXJ4MAC00KggdEqWTakQ==
X-Google-Smtp-Source: AGHT+IHFH61fOV1WciTe+7xJMyVRVs7OV/TsLWIe6gvmkkQnJc5SsQRK5Tx19S/lKGALa1ShHtP1ig==
X-Received: by 2002:a17:903:2347:b0:1c0:bcbc:d66 with SMTP id c7-20020a170903234700b001c0bcbc0d66mr1046293plh.7.1693519365356;
        Thu, 31 Aug 2023 15:02:45 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id p21-20020a170902ead500b001bc6536051bsm1675447pld.184.2023.08.31.15.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 15:02:44 -0700 (PDT)
In-Reply-To: <20230825050248.32681-1-andy.chiu@sifive.com>
References: <20230825050248.32681-1-andy.chiu@sifive.com>
Subject: Re: [v2] RISC-V: Add ptrace support for vectors
Message-Id: <169351910646.23657.443642645929304308.b4-ty@rivosinc.com>
Date: Thu, 31 Aug 2023 14:58:26 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: greentime.hu@sifive.com, 20230816155450.26200-4-andy.chiu@sifive.com,
  bjorn@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
  Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
  Vincent Chen <vincent.chen@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>,
  Benjamin Gray <bgray@linux.ibm.com>, Qing Zhang <zhangqing@loongson.cn>, Baruch Siach <baruch@tkos.co.il>,
  Rolf Eike Beer <eb@emlix.com>, Guo Ren <guoren@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
  Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_150300_406378_82F7BF2A 
X-CRM114-Status: GOOD (  11.43  )
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


On Fri, 25 Aug 2023 05:02:46 +0000, Andy Chiu wrote:
> This patch add back the ptrace support with the following fix:
>  - Define NT_RISCV_CSR and re-number NT_RISCV_VECTOR to prevent
>    conflicting with gdb's NT_RISCV_CSR.
>  - Use struct __riscv_v_regset_state to handle ptrace requests
> 
> Since gdb does not directly include the note description header in
> Linux and has already defined NT_RISCV_CSR as 0x900, we decide to
> sync with gdb and renumber NT_RISCV_VECTOR to solve and prevent future
> conflicts.
> 
> [...]

Applied, thanks!

[1/1] RISC-V: Add ptrace support for vectors
      https://git.kernel.org/palmer/c/1e4e7c306d52

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
