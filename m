Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CD3C4167D
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 15:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUC7cUHuDgE9EDxPiycceqPSfOV1qcTP4x035f9U3z8=; b=feXlALgKFt4nUY8i/8qF6UB5PR
	3aXou6L0zO6vyCHavGcLKI+HUbZ3ReH/HWeU24xvL1rHYWq9FiSpliAFR5q7qtCnQp7Lg+qja9IWC
	UnDC3wmf/pQ24wfk7o1Ar5nreuTJ6hU2l9tG1qafga4OkSUi3NetayGIcqGpsC7B7pd7/1KDe4ZT7
	VYYEAsHB78DoD0ph4NbxsSFOkQFY48AIU2bJgbJK1R8APnnBI7tFT38B8pxCkjwKzenqmok1+Y5ka
	2jBS9IdyhgrKxAQr5WUfJjd24/1HT6CyvXxnju+FRjfZ1k0HQpKwbpBfpOYAgPWUGyFkWg50v4zvN
	hXCiKbXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyZsv-009mT8-2e;
	Thu, 02 Nov 2023 15:45:29 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyZsq-009mR7-0U
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 15:45:28 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6ce2ea3a944so595808a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698939920; x=1699544720; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=811Wbdi3WkqjCSZVVfz56NC98wHZL/lpCPsLeMoBGy0=;
        b=WW6utJY9/0cMr2xEZcWKcZKZnnU3xiJmdgvKrhxR0AfcUsfqVEEMsVDTL+70d+e7S4
         YujC4f0u5El1gZol3FEHuIG9xEseCUz4+eBE1KIoDpT2DIJgZSHheF7o+P7uYgBjALbS
         1sfymXX0C6rpE9mQFB8f8wl80+iXAeqr/9hhTqfWtF9PCbpwjG5WrBDgsRIzWYSgkhxx
         T9Am7HOUZ7vh7TEBAsHigK3xUpP4TxFoGUjsvcVmEFNKtDpsl+knotB3B8RKpk3zQlmE
         PH+aHAl01Q+0CJ/SPHrywFntZgN3XoZHJwfSMJHUuek9CfrfopsWWuvOW5GD99nbUjTZ
         1Wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698939920; x=1699544720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=811Wbdi3WkqjCSZVVfz56NC98wHZL/lpCPsLeMoBGy0=;
        b=HrbsM6BmeoOE77a0fnPQyIItMdUWpTnozkLj91LokZZYw/9fNrf/hCr8FZGZg+IIfo
         PHGmByNJOkSU2mLlwQ6eNpgyK0yBuP8mQqD5XMwmx3VLP6vy5HYAxeal+qi0HIL6Dtjn
         C56UxmPS88Jtndrt6DAQ3MffoEZEbNS+iHqGzLfp0gdVNz6aXGj4SSiRlej6xXnVtUx/
         Yeev0+yamxskc5C6nnqPDbuTCPm3M+TKP+Ysv+yaLjF51vgrFYAF+V9XQELmc+POa0yq
         aFuPSTVB0qKg08fjEuSzt0RcLjFzhUmo5Am4LGBxQctXxGX1xHQyIC37V/InuQZLlQE9
         D87w==
X-Gm-Message-State: AOJu0Yx+Hk2dGgIWsYd4WYrglY8tOGdk/KzQ0x5ZvlMql4UeDrZ0cZz0
	615qsHzWXVwsDU3MwNGbCbErHw==
X-Google-Smtp-Source: AGHT+IG10P/+TWcEKjiYtSWM4kwAWWHLTtonpxdD387OxExmncHkv81To7NNOZz4Z98YE/IefdevkA==
X-Received: by 2002:a05:6870:582:b0:1e9:b495:bd0 with SMTP id m2-20020a056870058200b001e9b4950bd0mr21253823oap.8.1698939920178;
        Thu, 02 Nov 2023 08:45:20 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ds42-20020a0568705b2a00b001e98fa5c9edsm604940oab.40.2023.11.02.08.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 08:45:19 -0700 (PDT)
Date: Thu, 2 Nov 2023 08:45:17 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: woodrow.shen@sifive.com, Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Glenn Washburn <development@efficientek.com>,
	Jeff Xie <xiehuan09@gmail.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: akpm@linux-foundation.org
Subject: Re: [PATCH v6] scripts/gdb: add lx_current support for riscv
Message-ID: <ZUPEDWofcqgzsgMS@debug.ba.rivosinc.com>
References: <20231026233837.612405-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026233837.612405-1-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_084524_396512_40F449B0 
X-CRM114-Status: GOOD (  21.83  )
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

Ping

+ CC: akpm@linux-foundation.org

Who should I ping to make sure that it lands up in mainline?
It's quite a trivial change to support lx_current riscv arch.

-Deepak

On Thu, Oct 26, 2023 at 04:38:23PM -0700, Deepak Gupta wrote:
>csr_sscratch CSR holds current task_struct address when hart is in
>user space. Trap handler on entry spills csr_sscratch into "tp" (x2)
>register and zeroes out csr_sscratch CSR. Trap handler on exit reloads
>"tp" with expected user mode value and place current task_struct address
>again in csr_sscratch CSR.
>
>This patch assumes "tp" is pointing to task_struct. If value in
>csr_sscratch is numerically greater than "tp" then it assumes csr_sscratch
>is correct address of current task_struct. This logic holds when
>   - hart is in user space, "tp" will be less than csr_sscratch.
>   - hart is in kernel space but not in trap handler, "tp" will be more
>     than csr_sscratch (csr_sscratch being equal to 0).
>   - hart is executing trap handler
>       - "tp" is still pointing to user mode but csr_sscratch contains
>          ptr to task_struct. Thus numerically higher.
>       - "tp" is  pointing to task_struct but csr_sscratch now contains
>          either 0 or numerically smaller value (transiently holds
>          user mode tp)
>
>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>Tested-by: Hsieh-Tseng Shen <woodrow.shen@sifive.com>
>
>---
>Since patch has changed a little bit from v1 and I didn't include
>changelog earlier, here it is.
>
>v1 --> v2:
> - added logic to locate task_struct irrespective of priv
> - made locating task_struct agnostic to bitness(32 vs 64).
> - added caching of ulong type in scripts/gdb/linux/utils.py
> - added more descriptive commit message
>
>v2 --> v3:
> - amended commit message and source line to fit column width
>
>v3 --> v4:
> - amended commit message and remove whitespace in source
> - added Reviewed-by for reviewers
>
>v4 --> v5:
> - changing the order of changelog and sign off/review tags in commit
>
>v5 --> v6:
> - rebased on 6.6-rc5. dropped changes in utils.py as they're upstream
>---
> scripts/gdb/linux/cpus.py | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
>
>diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
>index 255dc18cb9da..cba589e5b57d 100644
>--- a/scripts/gdb/linux/cpus.py
>+++ b/scripts/gdb/linux/cpus.py
>@@ -179,6 +179,21 @@ def get_current_task(cpu):
>         else:
>             raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
>                                "while running in userspace(EL0)")
>+    elif utils.is_target_arch("riscv"):
>+        current_tp = gdb.parse_and_eval("$tp")
>+        scratch_reg = gdb.parse_and_eval("$sscratch")
>+
>+        # by default tp points to current task
>+        current_task = current_tp.cast(task_ptr_type)
>+
>+        # scratch register is set 0 in trap handler after entering kernel.
>+        # When hart is in user mode, scratch register is pointing to task_struct.
>+        # and tp is used by user mode. So when scratch register holds larger value
>+        # (negative address as ulong is larger value) than tp, then use scratch register.
>+        if (scratch_reg.cast(utils.get_ulong_type()) > current_tp.cast(utils.get_ulong_type())):
>+            current_task = scratch_reg.cast(task_ptr_type)
>+
>+        return current_task.dereference()
>     else:
>         raise gdb.GdbError("Sorry, obtaining the current task is not yet "
>                            "supported with this arch")
>-- 
>2.42.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
