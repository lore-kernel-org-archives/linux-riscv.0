Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602FAC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 15:51:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33D202086C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 15:51:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jcEtM5ou";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="E4zu7wm7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33D202086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Y3VvvnowwoU6LvmaUW2W5eFVgEECqzdvSH+I29l2cTE=; b=jcEtM5ouekpxEs01KZgi6/0pM
	TxHRyU3ZnqTqHapsJQZ+BBbhtPafJk5kEt/3tovnXQlpWLXVgNcg94SroYgIyOpTvCWMhUx8/KYCI
	sCmR56oLTvFRL441MxAMYCmLSx2SvmP1nQuZ0PUtQHQvRS4Kts+NRHmU006A0TtISTYVJmohsmqIL
	ES374gZeZZP/4Y7qptrMP4CwcHjQgR9496LRRr0X+Hpkth1x2KA1u7jwFIX+NQPyli/yIw7nzt72q
	nZQKsr8Iyo12+OWrcJeTGeoGicwEO/BTWv1q73hD1pXtgJnryBcgDhUXxWdX+70v9OJEnn3ZckhPQ
	ls2iSrCwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKQ7P-0008No-Nf; Wed, 07 Nov 2018 15:51:47 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKQ7M-0008NN-3u
 for linux-riscv@lists.infradead.org; Wed, 07 Nov 2018 15:51:45 +0000
Received: by mail-pl1-x635.google.com with SMTP id b5-v6so8037928pla.6
 for <linux-riscv@lists.infradead.org>; Wed, 07 Nov 2018 07:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=xJpzvwut0k+q2A+Nw6MrOxYocHY5VcH9qHpyIB4MGNI=;
 b=E4zu7wm7PASm5Gvp6H2Z2a18rJcaKQJ4LCZZKuAT4rrzbjklfKz2lpktNwZX+I5FWq
 Vgf0rA1NxicrU1ku3s2hFZ1ZFhloW9qIIeuJ6WUTd+hrZhRg6dS0wE3nVsEpM0Lr8ifM
 eRxnliXFYqPIUpp3bJ5UnCWqqi6P39NEwm+iDPkQKfAPyWlKMXWvGYA1NYRsBNIH+aUW
 c0pidd+GFy7SHzm5BOwdc2xpt9MgEsFv0w/al+AH9PPoV2K8j4/EpTSil77ACHnhSwRw
 swl94nrkptjqtTLajhRJacT6yqLzNVbGkAX3CYoas8gjp0AQQ1PmYjK71PehkxD7zT1z
 q4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xJpzvwut0k+q2A+Nw6MrOxYocHY5VcH9qHpyIB4MGNI=;
 b=FSoYXSVOXP155yqapoLR3HycHFJMSEtTpdaVQz4+WjlyAzMXnKOBCvItQWZE0sKr8Z
 E/tgn7wHxwUL9GM7n6MhwpT7iiBrYzh2StmneVcwS0iJjW/5xQBKU87Hz6J9XKGjNHMw
 iiQNEfscpYu3It3e+HWivaiSY7k8V8GfjOFQgkN8HfOxiFbIqUqGuzCvWgxQKTcu74h3
 CRuJniVc7vpW8qSelADVyM7HHodnAy5pzvCKXWMtmlvsLzVc4ciHhVXYrOPHBD9oQzTI
 WPed2CArt9UG7Ld1t54o2DTzhOxbsWk59o/Clh1INz/88rieOVTbgFTRyCEQ4Qx7bTDu
 dn3w==
X-Gm-Message-State: AGRZ1gJe2OWewNnWOh+tomaBk6av8Dhip7LlFM5vSGbxW80K4BNIwPUv
 LF6SbtWICi29oEnQE1nvLzx7kbfGee4=
X-Google-Smtp-Source: AJdET5fcvDV3wizYAHUfUNbm+7RH09KrNfSUCjpg+ZqufNsb9Hs1VkpOPDrDayqJ3wp4EzGpORrF+Q==
X-Received: by 2002:a17:902:7108:: with SMTP id
 a8-v6mr751816pll.290.1541605893153; 
 Wed, 07 Nov 2018 07:51:33 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id u6sm1053800pgr.79.2018.11.07.07.51.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Nov 2018 07:51:32 -0800 (PST)
Date: Wed, 07 Nov 2018 07:51:32 -0800 (PST)
X-Google-Original-Date: Tue, 06 Nov 2018 18:35:57 PST (-0800)
Subject: Re: [sw-dev] About the Use of sfence.vma in Kernel
In-Reply-To: <mvmk1lqk4zc.fsf@suse.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: schwab@suse.de
Message-ID: <mhng-950be55f-c014-4dc5-bff5-dab3f27456c2@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_075144_161758_A6712926 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, sw-dev@groups.riscv.org,
 alankao@andestech.com, greentime@andestech.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107155132.Hy36sjee6XTfvis49cOlLv_rnEGbIRjainwvOvdJ-4w@z>

On Tue, 06 Nov 2018 00:03:19 PST (-0800), schwab@suse.de wrote:
> Perhaps that't the reason I sometimes get errors like this:
>
> [303420.500000] swap_info_get: Bad swap file entry 2000000000df09b1
> [303420.500000] BUG: Bad page map in process struct-ret-3.ex  pte:6f84d8c0 pmd:8f579001
> [303420.510000] addr:000000008a1610cd vm_flags:00100173 anon_vma:0000000036036fc9 mapping:          (null) index:3ffffe7
> [303420.520000] file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
> [303420.530000] CPU: 1 PID: 2054 Comm: struct-ret-3.ex Not tainted 4.19.0-00040-g2d5ee99e76 #42
> [303420.530000] Call Trace:
> [303420.530000] [<ffffffe000c847d4>] walk_stackframe+0x0/0xa4
> [303420.530000] [<ffffffe000c849d4>] show_stack+0x2a/0x34
> [303420.530000] [<ffffffe0011a6800>] dump_stack+0x62/0x7c
> [303420.530000] [<ffffffe000d55942>] print_bad_pte+0x146/0x18e
> [303420.530000] [<ffffffe000d56df6>] unmap_page_range+0x33a/0x5ea
> [303420.530000] [<ffffffe000d570d4>] unmap_single_vma+0x2e/0x40
> [303420.530000] [<ffffffe000d57278>] unmap_vmas+0x42/0x7a
> [303420.530000] [<ffffffe000d5cb92>] exit_mmap+0x7e/0x106
> [303420.530000] [<ffffffe000c872aa>] mmput.part.2+0x26/0xa0
> [303420.530000] [<ffffffe000c87344>] mmput+0x20/0x28
> [303420.530000] [<ffffffe000c8ba24>] do_exit+0x238/0x7c0
> [303420.530000] [<ffffffe000c8c006>] do_group_exit+0x2a/0x82
> [303420.530000] [<ffffffe000c8c076>] __wake_up_parent+0x0/0x22
> [303420.530000] [<ffffffe000c83722>] ret_from_syscall+0x0/0xe

From my understanding of it, this should manifest as an infinite loop:

* The implementation will raise an exception due to an unmapped page.
* The trap handler will then go fix up that exception and attempt to re-execute 
  the offending instruction.
* The implementation will raise the exception again because its translation caches 
  haven't been updated.

This requires an implementation that caches invalid mappings.  IIRC we don't do 
that in QEMU or in Rocket.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
