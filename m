Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2216CC47422
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6qO8lfY69k+4Vtjg/GwzRTKzkOlB4ZuYLVvgP4puhs=; b=AumXqQssYb+dEeRm1MqoxVo5i1
	qGpSqPy7/cW5zYaxyjRSiyYv1YlIUAv2vHznpZGXdLrsfYdXtwJvOCbIfYo9DI1R7SmgKRwPGeUIF
	9zXzSJfVz7nrLHabi38IOFQoSxA962FM2qFavGdmXnC5y0d8SmdEqtnkzwDAoqXUUgWgjMgiSEqA0
	fbSvtEIWZWOdjPhfx0ZRVDfp6WSaXygOnqU/s3GwW3QxkpQkyFzgH4B5boSyf9SxFOAlJSYdr87Za
	/Cabzcv0Ite9ixK/sLTii60PVetaFV8x4DrXWJ7EO8AscHF2WhFZmI2PKjJRcCT24OWdvePy93wWX
	qkVWP4yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3A8-0000000134A-25CN;
	Thu, 25 Jan 2024 17:05:12 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3A3-00000001312-2xDn
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 17:05:10 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6daa89a6452so5091854b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 09:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706202306; x=1706807106; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0M1FGpzVNcThtLlc0xGfB6RVNT85al2FAnsQAblSAe0=;
        b=q+SroSqeBozcyxwmVXugF7pGELAkYnu5nm4rhihaYoTAHYiuCJovocf061tcu8D4iP
         R5NHNK2aVLnTM0ByZpPbF8DDNdmUQ+6GhIkemkdfknB5iO6QP7qtKpd78E99JvfHBxS0
         JCewaFc+G3uKEs5If7MQQPRmqr90izu03Kw0LvBMkTGYfKXdl6lwW9xuA4pnbIk2/oTa
         TwGUaaYKwezcCePfqbh46ixAEj9LlCdH5GxDC7WZl4hzTqEAYk7L86cXqw6ToVNApVBa
         2Gg8Np6Ve2sKIN8iRqRAk6GvD9VsZvzU9UWMQ61vLPSB7onyASPp8lEinbVsYW6S5KmO
         SBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706202306; x=1706807106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0M1FGpzVNcThtLlc0xGfB6RVNT85al2FAnsQAblSAe0=;
        b=toW0aZBSbmr3zbm3bdvW7twIvfoI7Zx6tFKLf9n81Pyo9bGZ/58iKqN/+JT/g798EG
         UMcLwaBt4zOucY0Mxd1O1W1L1W1vrBYSGx5R5IipS+l//77AgsMtyWESYPWqETaJUTQ0
         gnsWROFzfCs3n+MJY9NHHw6fXNNS1D9cWLe+sudtVGTW4rKjsFZYwz2HSpLeWteM3KIb
         +z4SoU3UqgklIG8NH63vnMs1WHgW2XU1Q9X+JcpSWBgc5sNO6GWprB1C335Qzi400/XL
         Bfw0h1/45Z79jKez+sdJxyAsXm/K2JN3Vwa1aPk5ZLlxM8O1G5EV/tpewZVi28s+jCw/
         aCyw==
X-Gm-Message-State: AOJu0YzOG1W7Q59aGsoUBVBAvDmbL11ZtZTGnxPjpjssLLWsw9eVLPVT
	cetC2CgaNMhqZkkmpvDqjpDarTqiWT2vjwskE+OoNzDgOZx1YiUJNecS4sUOHTc=
X-Google-Smtp-Source: AGHT+IGut0SQXr9AbScsdtYRLtI9Q1u0TcXDVvdxEucMFGumMjEZ81k2C95PoDlDDNCwCXrQvmnyWA==
X-Received: by 2002:a05:6a00:1a8a:b0:6dd:892f:e2a6 with SMTP id e10-20020a056a001a8a00b006dd892fe2a6mr2044pfv.23.1706202305670;
        Thu, 25 Jan 2024 09:05:05 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id s19-20020a056a0008d300b006d9a6039745sm16078660pfu.40.2024.01.25.09.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 09:05:05 -0800 (PST)
Date: Thu, 25 Jan 2024 09:05:01 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: David Hildenbrand <david@redhat.com>
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
	ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
	baruch@tkos.co.il, zhangqing@loongson.cn, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com,
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 08/28] mm: Define VM_SHADOW_STACK for RISC-V
Message-ID: <ZbKUveOKsT/bdd+a@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-9-debug@rivosinc.com>
 <a6f3ccf5-26a0-45f1-adaa-56a8df569548@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a6f3ccf5-26a0-45f1-adaa-56a8df569548@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_090508_269333_B08C1167 
X-CRM114-Status: GOOD (  14.84  )
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

On Thu, Jan 25, 2024 at 09:17:01AM +0100, David Hildenbrand wrote:
>On 25.01.24 07:21, debug@rivosinc.com wrote:
>>From: Deepak Gupta <debug@rivosinc.com>
>>
>>VM_SHADOW_STACK is defined by x86 as vm flag to mark a shadow stack vma.
>>
>>x86 uses VM_HIGH_ARCH_5 bit but that limits shadow stack vma to 64bit only.
>>arm64 follows same path
>>https://lore.kernel.org/lkml/20231009-arm64-gcs-v6-12-78e55deaa4dd@kernel.org/#r
>>
>>On RISC-V, write-only page table encodings are shadow stack pages. This patch
>>re-defines VM_WRITE only to be VM_SHADOW_STACK.
>>
>>Next set of patches will set guard rail that no other mm flow can set VM_WRITE
>>only in vma except when specifically creating shadow stack.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  include/linux/mm.h | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>
>>diff --git a/include/linux/mm.h b/include/linux/mm.h
>>index 418d26608ece..dfe0e8118669 100644
>>--- a/include/linux/mm.h
>>+++ b/include/linux/mm.h
>>@@ -352,7 +352,19 @@ extern unsigned int kobjsize(const void *objp);
>>   * for more details on the guard size.
>>   */
>>  # define VM_SHADOW_STACK	VM_HIGH_ARCH_5
>>-#else
>>+#endif
>>+
>>+#ifdef CONFIG_RISCV_USER_CFI
>>+/*
>>+ * On RISC-V pte encodings for shadow stack is R=0, W=1, X=0 and thus RISCV
>>+ * choosing to use similar mechanism on vm_flags where VM_WRITE only means
>>+ * VM_SHADOW_STACK. RISCV as well doesn't support VM_SHADOW_STACK to be set
>>+ * with VM_SHARED.
>>+ */
>>+#define VM_SHADOW_STACK	VM_WRITE
>>+#endif
>>+
>>+#ifndef VM_SHADOW_STACK
>>  # define VM_SHADOW_STACK	VM_NONE
>>  #endif
>
>That just screams for trouble. Can we find a less hacky way, please?
>
>Maybe just start with 64bit support only and do it like the other 
>archs. No need to be special.
>
>When wanting to support 32bit, we'll just finally clean up this high 
>flag mess and allow for more vm flags on 32bit as well.

Noted. I wanted to give a chance to anyone who cares about 32bit on riscv.
Will fix it in next series.

>
>-- 
>Cheers,
>
>David / dhildenb
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
