Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAB6C001B2
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 01:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yNhaVxnTTholtvK0VIPvW3XReFiKJJRNm9FuQ7cHT+8=; b=aKP2l+MYRPtRVndM8iFABDgq4B
	89ISKAreFtUAz6kS3sgrTEVD0Sz3NH1BZlgIJKXoXHd/ge/2ySC1mfnw4+0W7ESJVYpGhkG6TzKOc
	PJA7N/s2XtEUuKYzw4F5ObHxshDQu0aIwuwVxihkq/SEDt2mzqOhuhNQld7hAtHPCFO5ICLzv4vPF
	f2k+Z86P85f7Y/mrVxw2pRnKF28Jc6FbBX69TGG3tplL5VldXnbz2oG3ZouoCxny3bcRyCKyt5YzS
	q7melQR+J2k3O4T0eefgW5pnmheS6EMuZm/WhIjAsRpgq6LvtuY6lSmm8++bT73sA4erJPyxAbJRB
	t1UnUtTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3S7f-00HZB4-Ja; Fri, 09 Dec 2022 01:24:19 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3S7W-00HYy9-K0
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 01:24:12 +0000
Received: by mail-pj1-x102f.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so3378485pjm.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 17:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcLY3kF7o4hp9Qm1EsWYqsV0AQOWk7tTMzl2ItbJXk4=;
        b=5HX7yT/A0U+g8ikCK14qiGBl1bzNva9kVvv9IxG6fTvmOv9zZ6GlISswYgT0w0lJlz
         j4aBo0N2ADp5CM97l/xCjYVkAEDAVjh5yP4+ggYNhIdS6avNhA6IOIx5L2+cMho6bOp0
         1dCn9kroPQAaWjZK+QvxD6zWKGwidxpEf8nP7lXNPZ1VJs+6/FglepJLUXy33oZYU9Kd
         PDPaktK8epSW7AbnSOxBqat09ogNg/gApB+KAQspGmThHIxWPwnSAVekv8K1wfQRQSlw
         qlS6nfK8TK+r/fYjwYxrdyD9WNxuMIhknrf+34QxGGHUQnBHwMtVVEY1AdHbVST4ygFs
         fEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcLY3kF7o4hp9Qm1EsWYqsV0AQOWk7tTMzl2ItbJXk4=;
        b=f4HWRuzVDoapYPQjht4IqlsXiFS4ILicljmKdCIACU+u7SUFt9qw270T1rp9gEPFgo
         EuojKks+gXm1B3liPycAKcL66dH0CF7oUa8/9vUAldBKBAgStCAmlRq5shGXxC4hwgbD
         qOTIL3Vx45wwp0qYYmeyQ6BKGuWy0Bvf3CL/SmZtf8O4+1HtZ1QRH4TQyD6YkwiJDZQA
         KwqcBrUEp2KCcHm6fMhA8QDRp1bT8W9qYXn66xVmfnJ0qTU1765bq77aCf3exMExP4wm
         7LNQGFCQfjvnpRTL9PVAcpYlW/W5r48ratfzjBpbkZD5mLNJYI5nI6n5pxUuJmpzvV3y
         FzJA==
X-Gm-Message-State: ANoB5pngnAZz/iuM/1tm1byQkLYTcWm1TFUkzKwm9jdO33UO9Rh+x5u7
	8aK+EB4YResL9/n7C/c8DkM6Bw==
X-Google-Smtp-Source: AA0mqf42jnsETLESWtq3xZbsIv62t0abUoTLyjT2n+G+ZH+A3DcMQB11MhsEMWwuOMNZZFTvlI4K/w==
X-Received: by 2002:a17:902:db01:b0:188:77a7:ea9 with SMTP id m1-20020a170902db0100b0018877a70ea9mr5977202plx.55.1670549047399;
        Thu, 08 Dec 2022 17:24:07 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902dac600b00189a50d2a3esm53782plx.241.2022.12.08.17.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 17:24:06 -0800 (PST)
Date: Thu, 08 Dec 2022 17:24:06 -0800 (PST)
X-Google-Original-Date: Thu, 08 Dec 2022 15:51:11 PST (-0800)
Subject: Re: [PATCH v5] scripts/gdb: add lx_current support for riscv
In-Reply-To: <20221115221051.1871569-1-debug@rivosinc.com>
CC: Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com,
  aou@eecs.berkeley.edu, debug@rivosinc.com, jan.kiszka@siemens.com, kbingham@kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: debug@rivosinc.com
Message-ID: <mhng-bdcd75a5-e6d6-4090-8292-a32eb46e4464@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_172410_871410_CBCD9EB0 
X-CRM114-Status: GOOD (  29.22  )
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

On Tue, 15 Nov 2022 14:10:51 PST (-0800), debug@rivosinc.com wrote:
> csr_sscratch CSR holds current task_struct address when hart is in
> user space. Trap handler on entry spills csr_sscratch into "tp" (x2)
> register and zeroes out csr_sscratch CSR. Trap handler on exit reloads
> "tp" with expected user mode value and place current task_struct address
> again in csr_sscratch CSR.
>
> This patch assumes "tp" is pointing to task_struct. If value in
> csr_sscratch is numerically greater than "tp" then it assumes csr_sscratch
> is correct address of current task_struct. This logic holds when
>    - hart is in user space, "tp" will be less than csr_sscratch.
>    - hart is in kernel space but not in trap handler, "tp" will be more
>      than csr_sscratch (csr_sscratch being equal to 0).
>    - hart is executing trap handler
>        - "tp" is still pointing to user mode but csr_sscratch contains
>           ptr to task_struct. Thus numerically higher.
>        - "tp" is  pointing to task_struct but csr_sscratch now contains
>           either 0 or numerically smaller value (transiently holds
>           user mode tp)
>
> Patch also adds new cached type "ulong" in scripts/gdb/linux/utils.py
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
> ---
> Since patch has changed a little bit from v1 and I didn't include
> changelog earlier, here it is.
>
> v1 --> v2:
>  - added logic to locate task_struct irrespective of priv
>  - made locating task_struct agnostic to bitness(32 vs 64).
>  - added caching of ulong type in scripts/gdb/linux/utils.py
>  - added more descriptive commit message
>
> v2 --> v3:
>  - amended commit message and source line to fit column width
>
> v3 --> v4:
>  - amended commit message and remove whitespace in source
>  - added Reviewed-by for reviewers
>
> v4 --> v5:
>  - changing the order of changelog and sign off/review tags in commit
> ---
> ---
>  scripts/gdb/linux/cpus.py  | 15 +++++++++++++++
>  scripts/gdb/linux/utils.py |  5 +++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
> index 15fc4626d236..14c22f82449b 100644
> --- a/scripts/gdb/linux/cpus.py
> +++ b/scripts/gdb/linux/cpus.py
> @@ -173,6 +173,21 @@ def get_current_task(cpu):
>           else:
>               raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
>                                  "while running in userspace(EL0)")
> +    elif utils.is_target_arch("riscv"):
> +         current_tp = gdb.parse_and_eval("$tp")
> +         scratch_reg = gdb.parse_and_eval("$sscratch")
> +
> +         # by default tp points to current task
> +         current_task = current_tp.cast(task_ptr_type)
> +
> +         # scratch register is set 0 in trap handler after entering kernel.
> +         # When hart is in user mode, scratch register is pointing to task_struct.
> +         # and tp is used by user mode. So when scratch register holds larger value
> +         # (negative address as ulong is larger value) than tp, then use scratch register.
> +         if (scratch_reg.cast(utils.get_ulong_type()) > current_tp.cast(utils.get_ulong_type())):
> +             current_task = scratch_reg.cast(task_ptr_type)
> +
> +         return current_task.dereference()
>      else:
>          raise gdb.GdbError("Sorry, obtaining the current task is not yet "
>                             "supported with this arch")
> diff --git a/scripts/gdb/linux/utils.py b/scripts/gdb/linux/utils.py
> index 1553f68716cc..ddaf3089170d 100644
> --- a/scripts/gdb/linux/utils.py
> +++ b/scripts/gdb/linux/utils.py
> @@ -35,12 +35,17 @@ class CachedType:
>
>
>  long_type = CachedType("long")
> +ulong_type = CachedType("ulong")
>  atomic_long_type = CachedType("atomic_long_t")
>
>  def get_long_type():
>      global long_type
>      return long_type.get_type()
>
> +def get_ulong_type():
> +    global ulong_type
> +    return ulong_type.get_type()
> +
>  def offset_of(typeobj, field):
>      element = gdb.Value(0).cast(typeobj)
>      return int(str(element[field].address).split()[0], 16)

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
