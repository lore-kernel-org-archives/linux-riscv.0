Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F90EC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 01:48:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0745A2343B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 01:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0745A2343B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gvSYe/QUBiUfoMB6TKOikHEhaB5dbrebHkiZA32Nbp8=; b=3GXlKOvZEE6NRCBKZSN6b8B8n
	80oGQetBIUDv/oWh6EbhZRtkY5WOyn5cwalGIbESWp6ib6jNpKuwJVzJ+i9mfGzb3AzksuL0xeWXz
	D0SNLa+aNBL6M4u5q5W0cZrVn7he2EYbc787uiDEujkOX8yW/OpD17PS6e9kv2w4WHMQ9neQ6hc4W
	j8SZKdPF/gXek5rPH+3Ja1+Bn2C9nLBGLI6Ty8W51+WD2VemSREtdfOf+27Sn7Vl1MgJ1Mh0GDiVs
	QQDJhjGo6elYFmG0mW4GdN3exs5NvzTz+itCC+CmO4vwSX0SiV0yDPTtbeR8RjgcjpKwCstitW4Nk
	PygC30eCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzrkn-0000I3-ON; Thu, 14 Jan 2021 01:48:49 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzrkk-0000HV-61
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 01:48:47 +0000
Received: by mail-io1-xd34.google.com with SMTP id q1so8218022ion.8
 for <linux-riscv@lists.infradead.org>; Wed, 13 Jan 2021 17:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L8QvwvUhud/Q+2LPdzjKUM5l1LRzUmNPYEOr4FUbNZg=;
 b=K74SmuAPHGiY1Xm3OEROEniQQzbLkjg8ihHiyDupkWPIMxXS1i4P49cGGswD+7TLdP
 fSeXchnpxynysbbldGRrqi2b+8lAi3CntMnl7z2b+2lHM7VQgSRsPr5kDzBFX9cIclx6
 9r31EpMguv5rndoN2TEo04LcbEYLywB+9NchI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L8QvwvUhud/Q+2LPdzjKUM5l1LRzUmNPYEOr4FUbNZg=;
 b=Ep/BMBYOWr/7AW1ODvZat4L2eiOuPc+U5vrP1ckQj/F0IY/vdAssY2SreznQ4UpUNA
 zoHrYAbl1CvRSoJo0TY0nLfDnFEBAE0dJMIhxQSiVfRPN0rSHAag1tkjXAPCc70d5d8W
 egE8Pkiul5IivzidvQAofgZPHVAePBebCh0js/lIIeM0ZwSqeFu+2wEc0/TckSF2QSYQ
 N7uWLv3XMniI32Ax2ApcKDGn5onhUiZzsOjrFTHSL6EiAGoLhG/TXqSwBlI6r1PQBrBY
 LHNAzDUOZrOL1ubT3N0iDV/KUNWZjtI/XA5vj3SS9A5yZXUmaYD6XTXxS/BA7rBvd9/H
 FeAw==
X-Gm-Message-State: AOAM5312z38MQMDvR7JzqUuBITgEiROtMOT/Q8UJwrexkJtl0eDl1EsH
 oy9GxG8EbxvurFMpxFMOVNJo8w2H1YaDfS5Irf+DeZRyaEdi
X-Google-Smtp-Source: ABdhPJxRh4p10sHVUvelmknlQZKChH/dCz0+aVzwkIDrG96kmYQO8I5iVw8sphqkRKnsbjTVDpxM/SJ+UgalkSh1ZwE=
X-Received: by 2002:a6b:2d4:: with SMTP id 203mr2642557ioc.0.1610588924508;
 Wed, 13 Jan 2021 17:48:44 -0800 (PST)
MIME-Version: 1.0
References: <mvmk0ssu8yi.fsf@suse.de>
 <CAOnJCU+JmDaU1f3hAbyjR4__TVHJbjnZZ8th25i5Q-et_UxXeg@mail.gmail.com>
 <87im8154r2.fsf@igel.home>
In-Reply-To: <87im8154r2.fsf@igel.home>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 13 Jan 2021 17:48:33 -0800
Message-ID: <CAOnJCUJg+-4RTz=6JQDU_c90W1KpNkvNN=riLfHmtwtpHAh0yw@mail.gmail.com>
Subject: Re: EFI booting crashes
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_204846_366074_D49C2421 
X-CRM114-Status: GOOD (  10.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 13, 2021 at 5:46 AM Andreas Schwab <schwab@suse.de> wrote:
>
> Looking closer, the fault address is pointing to the GOT of u-boot,
> coming from loading the address of efi_var_buf in efi_var_mem_find:
>
>     80200338:   00078497                auipc   s1,0x78
>     8020033c:   9e84b483                ld      s1,-1560(s1) # 80277d20 <_GLOBAL_OFFSET_TABLE_+0x80>
>
> I wonder how this is supposed to work?  Surely the GOT isn't mapped in
> the EFI runtime memory.
>

You are right. The code snippet where the fault happened is
efi_get_variable_runtime->efi_get_variable_mem->efi_var_mem_find->efi_var_buf

efi_var_buf is at 0x200b2338 where the regions that are mapped are

[    0.181783] Remapping and enabling EFI services.
[    0.182923] efi_create_mapping: virt 20008000 phys be738000
num_pages 1                                     [    0.184485]
efi_create_mapping: virt 2001c000 phys be73c000  num_pages 3
[    0.185068] efi_create_mapping: virt 20020000 phys be740000  num_pages 4
[    0.185692] efi_create_mapping: virt 2003d000 phys bff6d000  num_pages 1

efi runtime services doesn't have mapping for that address which
explains the panic in the kernel.

efi_var_mem_find code was added during the same time as kernel EFI
patches were merged. Most likely, those patches caused a regression
which was never noticed.

It seems that during allocation efi_var_buf was allocated at be740000
which is mapped correctly as a runtime service data. However, the load
address during execution is invalid(0x200b2338). I am debugging this
further.

> Andreas.
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
