Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286BEE936FD
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 05:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1aD7s3u0ZNIYAZmQBR8vYew2nv+nbV5p0QjLnYXa0w=; b=dMxdCcyeaWXCg6
	JGx5iA1Y2ajbima6jjL4iK+rC4fcvnZQSra21CxVKHiMg8XRw4BEMcsQ/6cZHUrn9h9sL1kkfTHaz
	AfUQaa8PehYs7xAq0xQMy6hyly4vSwULuRoY5IWK7AdQj6umR7IOUBjBYxxwvkz4LndbgR4lLX1GO
	m5MMIi1QECK2f6M1r1TOO/e8y3Q9Udty0134cf3TCkFrWEt214doS5caIdg9i6JR4MsNUCphSS3bq
	/lrrOtgJyWZJf/jkFD4Dzag3FChhSrpWTXvSrBAOdzU7tQfEm6JU+stFQ3SdM/30UVdTDh46OuATS
	r+v+5DMQU5iL9zNdJJEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoGvd-001S7G-23;
	Thu, 05 Oct 2023 05:29:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoGva-001S5F-22
	for linux-riscv@lists.infradead.org;
	Thu, 05 Oct 2023 05:29:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c877f27e8fso4325595ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 22:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1696483775; x=1697088575; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7J22K+kkq04iFIr8U/rDD0YSRimKRS/5/Okw8x5uY0c=;
        b=TFGVxrf9JyxlGo1Upe3esECF11WxrPOzz9XyQgZnDPkznyYWCs7Xc/zvoue43UZhp0
         gkUfm1DatLAR6qEKQT7ML+QFGLOODdfRgMSWWngAu+13ijOnASW5CE1aYYKZGSumlXii
         v0e6Ny+H3uecL3ZP6e7WZQnFfVwVdTvsURdlVi60nWcEAcw7aH3P4E6oTjSvyBPQkFXR
         E9z6uGCcNxgnhqZ2QOaVm8vbyQiw8Wl2H5YKoEEbds9+bvh423QIVpV4IPABSvgPVVL3
         hqZAoFUCFeSGiGZsuN3O8fkkiAoATaxF12hp5HTcEzXCg1zKO/bZpOCBH2cpjQC8rKpC
         HpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696483775; x=1697088575;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7J22K+kkq04iFIr8U/rDD0YSRimKRS/5/Okw8x5uY0c=;
        b=TyOdtaOt0WPWiagxwYsRK9+osK2AxDaupwAKAT1rlnJDW5rpkCoHpCcuGujgxwOvoX
         X0/sfw0aO5ae6fxL8zrlFks4nXI6p5TWqqQvzMzsYGNxY9FHZ3bVuXOO1DidTCJ5ZLEr
         7QzTEL1Xth4ZGwZNiEtX8HFq4I/Ow88r5OPheHrjZuCcbcRZ0RbrcKowh2uMtIGICq8f
         t1nj38UZMw4xvBQX9Ca5FweXHUp26MsBQfOh0PwWBSs0Ac/CQuoupSh4769RswEic8Vt
         LdaJUMyFFis12CLgLUfeakMS1kAskwfUIsoll1Bu0cmqQR6BJOX92NPBqSTl4IfEdsUS
         LmbQ==
X-Gm-Message-State: AOJu0YyqLJmmSZpYqQ3yaylRQSu2Lx2/w7xyokq4/ZJEbCbjGfXdw6Ih
	iW2uBjSfxSsoEB6MBEy8fGLK89Yo/irADBbvv7zo
X-Google-Smtp-Source: AGHT+IG2LgHniXqfqGiAoclAX5CoktHo0eFuP8765KXoQxH4N3w/aCvPlKjQ2Kbuv/+QXZlS0XWNTA==
X-Received: by 2002:a17:902:f688:b0:1c6:3228:c2ca with SMTP id l8-20020a170902f68800b001c63228c2camr5549774plg.29.1696483775226;
        Wed, 04 Oct 2023 22:29:35 -0700 (PDT)
Received: from localhost (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902ee5500b001c3267ae317sm576756plo.165.2023.10.04.22.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 22:29:34 -0700 (PDT)
Date: Thu, 5 Oct 2023 13:29:32 +0800
From: Hsieh-Tseng Shen <woodrow.shen@sifive.com>
To: debug@rivosinc.com
Cc: palmer@dabbelt.com, ajones@ventanamicro.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, jan.kiszka@siemens.com,
	kbingham@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com
Subject: Re: [PATCH v5] scripts/gdb: add lx_current support for riscv
Message-ID: <ZR5JvCSDZwTQAucC@u-NUC7i5BNH>
References: <d65bddf3-c58a-1420-bff9-8333c10edb56@microchip.com>
 <20221115221051.1871569-1-debug@rivosinc.com>
 <98eb5bc7-dee4-b36e-a219-17b1e08d85f6@siemens.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98eb5bc7-dee4-b36e-a219-17b1e08d85f6@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_222938_712540_3304F963 
X-CRM114-Status: GOOD (  39.51  )
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
Reply-To: 20221115221051.1871569-1-debug@rivosinc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 02, 2023 at 10:09:01AM +0100, Jan Kiszka wrote:
> On 15.11.22 23:10, Deepak Gupta wrote:
> > csr_sscratch CSR holds current task_struct address when hart is in
> > user space. Trap handler on entry spills csr_sscratch into "tp" (x2)
> > register and zeroes out csr_sscratch CSR. Trap handler on exit reloads
> > "tp" with expected user mode value and place current task_struct address
> > again in csr_sscratch CSR.
> > 
> > This patch assumes "tp" is pointing to task_struct. If value in
> > csr_sscratch is numerically greater than "tp" then it assumes csr_sscratch
> > is correct address of current task_struct. This logic holds when
> >    - hart is in user space, "tp" will be less than csr_sscratch.
> >    - hart is in kernel space but not in trap handler, "tp" will be more
> >      than csr_sscratch (csr_sscratch being equal to 0).
> >    - hart is executing trap handler
> >        - "tp" is still pointing to user mode but csr_sscratch contains
> >           ptr to task_struct. Thus numerically higher.
> >        - "tp" is  pointing to task_struct but csr_sscratch now contains
> >           either 0 or numerically smaller value (transiently holds
> >           user mode tp)
> > 
> > Patch also adds new cached type "ulong" in scripts/gdb/linux/utils.py
> > 
> > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > 
> > ---
> > Since patch has changed a little bit from v1 and I didn't include
> > changelog earlier, here it is.
> > 
> > v1 --> v2:
> >  - added logic to locate task_struct irrespective of priv
> >  - made locating task_struct agnostic to bitness(32 vs 64).
> >  - added caching of ulong type in scripts/gdb/linux/utils.py
> >  - added more descriptive commit message
> > 
> > v2 --> v3:
> >  - amended commit message and source line to fit column width
> > 
> > v3 --> v4:
> >  - amended commit message and remove whitespace in source
> >  - added Reviewed-by for reviewers
> > 
> > v4 --> v5:
> >  - changing the order of changelog and sign off/review tags in commit
> > ---
> > ---
> >  scripts/gdb/linux/cpus.py  | 15 +++++++++++++++
> >  scripts/gdb/linux/utils.py |  5 +++++
> >  2 files changed, 20 insertions(+)
> > 
> > diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
> > index 15fc4626d236..14c22f82449b 100644
> > --- a/scripts/gdb/linux/cpus.py
> > +++ b/scripts/gdb/linux/cpus.py
> > @@ -173,6 +173,21 @@ def get_current_task(cpu):
> >           else:
> >               raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
> >                                  "while running in userspace(EL0)")
> > +    elif utils.is_target_arch("riscv"):
> > +         current_tp = gdb.parse_and_eval("$tp")
> > +         scratch_reg = gdb.parse_and_eval("$sscratch")
> > +
> > +         # by default tp points to current task
> > +         current_task = current_tp.cast(task_ptr_type)
> > +
> > +         # scratch register is set 0 in trap handler after entering kernel.
> > +         # When hart is in user mode, scratch register is pointing to task_struct.
> > +         # and tp is used by user mode. So when scratch register holds larger value
> > +         # (negative address as ulong is larger value) than tp, then use scratch register.
> > +         if (scratch_reg.cast(utils.get_ulong_type()) > current_tp.cast(utils.get_ulong_type())):
> > +             current_task = scratch_reg.cast(task_ptr_type)
> 
> Why not if-else for the assignment here?
> 
> > +
> > +         return current_task.dereference()
> >      else:
> >          raise gdb.GdbError("Sorry, obtaining the current task is not yet "
> >                             "supported with this arch")
> > diff --git a/scripts/gdb/linux/utils.py b/scripts/gdb/linux/utils.py
> > index 1553f68716cc..ddaf3089170d 100644
> > --- a/scripts/gdb/linux/utils.py
> > +++ b/scripts/gdb/linux/utils.py
> > @@ -35,12 +35,17 @@ class CachedType:
> >  
> >  
> >  long_type = CachedType("long")
> > +ulong_type = CachedType("ulong")
> >  atomic_long_type = CachedType("atomic_long_t")
> >  
> >  def get_long_type():
> >      global long_type
> >      return long_type.get_type()
> >  
> > +def get_ulong_type():
> > +    global ulong_type
> > +    return ulong_type.get_type()
> > +
> >  def offset_of(typeobj, field):
> >      element = gdb.Value(0).cast(typeobj)
> >      return int(str(element[field].address).split()[0], 16)
> 
> Looks good to me otherwise.
> 
> Jan
> 
> -- 
> Siemens AG, Technology
> Competence Center Embedded Linux

This patch had been pending for quite a while, and not sure if it's
still acceptable to be merged, but from my testing it's working fine
for me. Nevertheless, the v5 patch now has conflict with the current
master, so I've slightly modified for reference. It would be helpful
if Deepak can send v6 later on.

Tested-by: Hsieh-Tseng Shen <woodrow.shen@sifive.com>

v5 --> v6:
 - dropped cache type "ulong" in scripts/gdb/linux/utils.py as it
 already exists in the current upstream
---
 scripts/gdb/linux/cpus.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
index 255dc18cb9da..f8325cab5f1b 100644
--- a/scripts/gdb/linux/cpus.py
+++ b/scripts/gdb/linux/cpus.py
@@ -179,6 +179,21 @@ def get_current_task(cpu):
         else:
             raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
                                "while running in userspace(EL0)")
+    elif utils.is_target_arch("riscv"):
+        current_tp = gdb.parse_and_eval("$tp")
+        scratch_reg = gdb.parse_and_eval("$sscratch")
+
+        # by default tp points to current task
+        current_task = current_tp.cast(task_ptr_type)
+
+        # scratch register is set 0 in trap handler after entering kernel.
+        # When hart is in user mode, scratch register is pointing to task_struct.
+        # and tp is used by user mode. So when scratch register holds larger value
+        # (negative address as ulong is larger value) than tp, then use scratch register.
+        if (scratch_reg.cast(utils.get_ulong_type()) > current_tp.cast(utils.get_ulong_type())):
+            current_task = scratch_reg.cast(task_ptr_type)
+
+            return current_task.dereference()
     else:
         raise gdb.GdbError("Sorry, obtaining the current task is not yet "
                            "supported with this arch")
--
2.31.1

Thank you

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
