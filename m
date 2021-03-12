Return-Path: <SRS0=D0Wc=IK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD76C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 07:46:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D66364F77
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 07:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D66364F77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2HQu1fO5c/J1GgPYOfP1rhPS+VSE2u7ABtHfDJSekX0=; b=P3k9bs6GQsPS7X/ExKxzEfdEj
	H2nwU59qnD0dnzS57DNej+PHl60oSiCZ8YALTREcu0MyVu9uXSSqk2PVboV9QbjzJjXvEXEs+QLYy
	7NxdZCRrQdF3GOKg9L0oV76LWT4Zc2Qx1ttWLIodKYxFJkRbqZ2Y665++fb11a/fQjZVA6qEwJNAN
	6DB+ZVSOgm3MVF4O3ekL6P02lAPGldiG+nMwiLoG52Ca9a7skoWpTX9v0WAwJR6BSJnpwD7m2cCja
	tFwtm5t2pTsYksdgLSrN7dL7KHAF7ZTN2C0/Q//M/zIId1akmtYh1hwVdY9MZZ6i8PNS4CSkhL2ki
	NTVRTEf2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKcUW-00AoRq-7X; Fri, 12 Mar 2021 07:45:48 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKcUQ-00AoRD-TD
 for linux-riscv@lists.infradead.org; Fri, 12 Mar 2021 07:45:45 +0000
Received: by mail-pf1-x430.google.com with SMTP id 16so1283879pfn.5
 for <linux-riscv@lists.infradead.org>; Thu, 11 Mar 2021 23:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EURx11KPpZiWeW4pL5anAmtmLHaTc+frYwy8XtKwDcU=;
 b=NkHnlpR1o+KML90lC4MYyWd1JfKYPBmJRgA+z5e+IQhi8JtGdtWWU9tOO9YVI41wQx
 VfNoYLdkpcUGjOXH8GQw8MLCmtMi0tMrpgyvalAIvcmjsLpg5gCK8bL/pwJY5MDt3T9s
 qQ6PsFZZtfcswzTV/QY+Fmd7y1bSxMNqeCk7ByhkamDe5cC+h+kDbH1ZycobhDVH6wIc
 Zm9BzKAweLWTMT5ZctFJzIHnJo+7RzVApjQkxyrV7uSHt6okbNX5PN34HMzCpqhLMkFJ
 uhTDwOS09f2876OYSntakVGmOyuvAXJFB0HDJ+Wg0P+eR92rJKntchUC0H3fKPZAyQVw
 82ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EURx11KPpZiWeW4pL5anAmtmLHaTc+frYwy8XtKwDcU=;
 b=bhy7UX0M213g1CBKbwHIlI/nNQq++6iVfne7R9885Yhcb15HGEXtMtZDYS4CYNtUzm
 EMmnvutSjArzQIgdCXZgxoJ1dFpSdloSgvARSxNeMg8WU4G3oYVfuSNLanhhW4JuIxtQ
 RqIjB4U674oU8vcDXOxKTsumtBuW2myCAm+YTGhD2YH3QKKiEDWJ0e3m+Iyxrd9jS6sp
 my+3OY5zsGM9Z49Sk5kZCQ/wZqsYYlvpinqBooc3+AG1lmEyMbwqMYIWW4j6QZ0BKEz+
 7TLHhgCt8H+pDW27um15bSdQUbq5QpEDPlwwlrLHA6emSGXnM1DvKe6dDDSpozBd7DYx
 zG+w==
X-Gm-Message-State: AOAM531yRESoqmvN9QJ+o59hFmAtrN+LnVXwJIr3qGxuwiW7sJ2/kX0b
 qgMBm0xlHVu/Y9gFW/gW6A9LVAsuJLLtvHk1BNELdwaNoijZ358Z
X-Google-Smtp-Source: ABdhPJyMXzO00V1Qd9HHGIkvwJzccwLJnhisuvWJib4HjtRY8tn2CKcT+vACjpYgWmvfCEY5u0YMUQS7H+Rp7ko9Hgc=
X-Received: by 2002:a63:f311:: with SMTP id l17mr10839032pgh.349.1615535140605; 
 Thu, 11 Mar 2021 23:45:40 -0800 (PST)
MIME-Version: 1.0
References: <20210310190234.GB25175@APC301.andestech.com>
In-Reply-To: <20210310190234.GB25175@APC301.andestech.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Fri, 12 Mar 2021 15:45:29 +0800
Message-ID: <CABvJ_xhCZ8zT6DHXUwzvAL-Uy1CUOojD90JG_B4GhKhUPe9CGQ@mail.gmail.com>
Subject: Re: [RFC patch 4/4] riscv: sifive: apply errata "cip-453" patch
To: 1615175897-23509-5-git-send-email-vincent.chen@sifive.com
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Alan Kao <alankao@andestech.com>, 
 Ruinland ChuanTzu Tsai <ruinland@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_074543_204145_F3B6273F 
X-CRM114-Status: GOOD (  27.14  )
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

On Thu, Mar 11, 2021 at 5:58 AM Ruinland ChuanTzu Tsai
<ruinland@andestech.com> wrote:
>
> Hi Vincent,
>
> Thanks for introducing the alternative mechanism to RISC-V, with which
> vendors could provide fixes for each erratum in a more elegant way.
>
> Somehow, I'm a bit sketchy about these parts of your proposal :
>
> >     /* Exception vector table */
> >  ENTRY(excp_vect_table)
> >     RISCV_PTR do_trap_insn_misaligned
> > -   RISCV_PTR do_trap_insn_fault
> > +   ALTERNATIVE(__stringify(RISCV_PTR do_trap_insn_fault),
> > +           __stringify(RISCV_PTR do_trap_insn_fault_trampoline),
> > +           SIFIVE_VENDOR_ID, ERRATA_CIP_453, CONFIG_ERRATA_SIFIVE_CIP_453)
> >     RISCV_PTR do_trap_insn_illegal
> >     RISCV_PTR do_trap_break
> >     RISCV_PTR do_trap_load_misaligned
> > @@ -461,7 +466,10 @@ ENTRY(excp_vect_table)
> >     RISCV_PTR do_trap_ecall_s
> >     RISCV_PTR do_trap_unknown
> >     RISCV_PTR do_trap_ecall_m
> > -   RISCV_PTR do_page_fault   /* instruction page fault */
> > +   /* instruciton page fault */
> > +   ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),
> > +           __stringify(RISCV_PTR do_page_fault_trampoline),
> > +           SIFIVE_VENDOR_ID, ERRATA_CIP_453, CONFIG_ERRATA_SIFIVE_CIP_453)
> >     RISCV_PTR do_page_fault   /* load page fault */
>
> As far as I can tell, `ALTERNATIVE(...)` seems a bit like a mixture of
> ARM's version of ALTERNATIVE and `alternative_insn`. However, ARM's
> ALTERNATIVE takes a vardatic macro and yours here doesn't, which makes
> me wonder if another vendor needs to patch the same location as yours,
> will they be able to multiplex the same probe ?
>
This is a good question. For this case, I think the current
ALTERNATIVE(...) can not be used.
In my thoughts, we need to define a new MACRO like

#define ALTERNATIVE2("old inst", "vendor-1's new inst","vendor-1
id","errata_id","CONFIG_ERRATA_vendor-1" , "vendor-2's new
inst","vendor-2 id","errata_id","CONFIG_ERRATA_vendor-2" ) \
       "886 :\n"                                                       \
       oldinsn "\n"                                                    \
       ALT("vendor-1's new inst", "vendor-1
id","errata_id","CONFIG_ERRATA_vendor-1") \
       ALT("vendor-2's new inst", "vendor-2
id","errata_id","CONFIG_ERRATA_vendor-2")

where ALT is defined as below:
+#define ALT (altinsn, vendor_id, errata_id, enable) \
+       ".if " __stringify(enable) " == 1\n"                            \
+       "887 :\n"                                                       \
+       ".pushsection .alternative, \"a\"\n"                            \
+       ALT_ENTRY("886b", "888f", __stringify(vendor_id),
__stringify(errata_id), "889f - 888f") \
+       ".popsection\n"                                                 \
+       ".subsection 1\n"                                               \
+       "888 :\n"                                                       \
+       altinsn "\n"                                                    \
+       "889 :\n"                                                       \
+       ".previous\n"                                                   \
+       ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
+       ".org   . - (889b - 888b) + (887b - 886b)\n"                    \,
+       ".endif\n"
+
By using ALTERNATIVE2, vendor-1 and vendor-2 (more precisely, CPU-1
and CPU-2) can replace the same instruction with different errata
patches. I will create a sample code in my next version patch for
vendor reference.

>
> Secondly, I think it's a bit intrusive to patch directly on exception
> vector table here.
>
> I'm not sure about whether it's possible to introduce your alternative
> probe inside do_trap_insn_fault() & do_page_fault(), do the inspection
> the reason of trap (e.g. instruction/load/store page fault) there and
> then, perform the software workaround.
>
> If that's not feasible, maybe we shall make a new macro with a name
> like "RISCV_TRAP_ENTRY" which encompass the alternative probes ?
>
The do_page_fault() will deal with all page fault exceptions such as
load/store page fault. However, our errata is only for the instruction
page fault. Therefore, not only we need an additional if condition to
distinguish the incoming exception type, but also all page fault will
suffer the performance impact from the if conditions. Therefore, I
decided to replace the exception handler directly.

I think your idea is good. I will follow your suggestions to create a
new macro for them to improve the readability.


> Last but not least, is it possible that in the near future,
> `alternative_if` macro family from ARM could be ported to RISC-V ?
>
No, it is not in my current plan.


Thank you for your feedback.


> Best regards,
> Ruinland
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
