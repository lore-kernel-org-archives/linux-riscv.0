Return-Path: <SRS0=Ne9D=OW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E592C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Oct 2021 16:18:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E363861A6F
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Oct 2021 16:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E363861A6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=v1Te4tkc6BJcm75sb3gFoux9GvAtYq89CmTifETM9Sc=; b=azY4Ab4HkBrG/2kJRdi6PwNfRC
	TXK8lgLYt4+kuezaps/aDVqKFpj6myG4ad73XSLtyr9k07TQvkm3Zfq29ZZj9j91XF4eKiwZxumCE
	eOKsj8MevKEChkFUcJ/Rp6QP8oheb2Ym9FoTw4EwiZCZVmVDpZcez4dj+BaJZrHuoyE+CNtMFn7ki
	7/YwY6VWRA38u32te8rsC7xZvboI1d3HuF5RpQTIoy2UxIM2MZhlgQakx7lE0IsmVh4qKXynNvc9C
	ntDD8FlEcn1Qb8tSVlP4yfsGs1R9wG1iubC9PX9k63fyDlygde9k+OqyRYVfTIIiv9OzLmu21WZRD
	odpUiIsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWhiD-002R0Q-RI; Sat, 02 Oct 2021 16:18:09 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWhiB-002QzE-N1
 for linux-riscv@lists.infradead.org; Sat, 02 Oct 2021 16:18:09 +0000
Received: by mail-pg1-x533.google.com with SMTP id 75so12389648pga.3
 for <linux-riscv@lists.infradead.org>; Sat, 02 Oct 2021 09:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+VB9FstnCFXy8utS9z2gbROEzR/mAbwOOQhx18Q89e8=;
 b=VaNDVLL3oXpnrb/yNCNsNthIFxDdM6MBjQsIBAZR9r8zF4iPdFhGoLAG8OUDZa2qiQ
 iORY1rvWAdqhCz4GLShFjVSoJC2Dak1DV3ygFUumVe3tlx1/JbE+AcQmGQ0fJt+S90YH
 j6B0Jfx+fZWn6rtHbgCggKOY+OJdqnpV6JCmcPnGleGOv+RBuVFq1qQL01IkmlbGZzD8
 AnWF/iqMcxdwR7jsIyCOWuC0ldsZyyypB5eUaDlsxZWjFjekqh8jxWuRRRtrqly/1YAg
 Bb5WoyOU7JpvylYT+w1thN+zPqiLnOxz39TU0phYEtIGxk76gd8x2DJ9UqJeLBf37yUH
 6kOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+VB9FstnCFXy8utS9z2gbROEzR/mAbwOOQhx18Q89e8=;
 b=ZmZZ68lq9ufU9DVq609fF+APmSzloBqlfKq6I4cPx2iO21neLwIDd6GgyNGzpFxfl6
 ItkzpxTz4AWgCN+hGleqN0ovCiHq1rmtParLpD0BkncVP/6TIRrmyxZbNhueVIAhULGc
 QdV8YvB4StMC4tXWQQsH5yVENtaDUKhwdlu0ZF+e8yCVbTSWG5DTx7NbEXromoClih4i
 aFyAv1cP2nVJySyriefUw7W8RzGkbQC5+Uv3UR2mrwLpKevnU1ti4GGq8cA0uDsy8RCW
 00PFZwUAZ33FEoW+aw05zg9bst+35lqdb06VWdCFE5lyEl5T9jWzVdoToTBZAGAZdRI3
 GBTg==
X-Gm-Message-State: AOAM532R1wBfxdM3p9Xo79/xDAHDbT9So2GCY6rSwmj+5x0rESywtkk+
 bmzoos+eEXHAtzS1vF/7droiIw==
X-Google-Smtp-Source: ABdhPJxASmljlbJlAX1NyPTdQFN+RGGenb01Tv1j5ftB6+Z4G4f+YlLcOCD7S5Fk5ggg1J61DVMxTA==
X-Received: by 2002:a63:1262:: with SMTP id 34mr3429401pgs.356.1633191483204; 
 Sat, 02 Oct 2021 09:18:03 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j9sm9324464pfi.121.2021.10.02.09.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 09:18:02 -0700 (PDT)
Date: Sat, 02 Oct 2021 09:18:02 -0700 (PDT)
X-Google-Original-Date: Sat, 02 Oct 2021 09:18:00 PDT (-0700)
Subject: Re: [PATCH v20 00/17] KVM RISC-V Support
In-Reply-To: <CAAhSdy1yZ11L=A3g06GXM8tFtonBX0Cj5NDyGHQ1v44vJ8MqSA@mail.gmail.com>
CC: pbonzini@redhat.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, graf@amazon.com, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 Anup Patel <Anup.Patel@wdc.com>, philipp.tomsich@vrull.eu
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: anup@brainfault.org
Message-ID: <mhng-b5a035ae-a545-4c81-a8d9-301c6f7e6982@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211002_091807_763085_47D1E4F6 
X-CRM114-Status: GOOD (  12.14  )
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

On Mon, 27 Sep 2021 04:58:41 PDT (-0700), anup@brainfault.org wrote:
> Hi Palmer, Hi Paolo,
>
> [...]
>
> The RISC-V H-extension is now frozen. Please refer to the latest
> RISC-V privilege specification v1.12 which is in public review.
> https://github.com/riscv/riscv-isa-manual/releases/download/riscv-privileged-20210915-public-review/riscv-privileged-20210915-public-review.pdf
>
> Currently, the RISC-V H-extension is on it's way to being ratified.
> https://wiki.riscv.org/display/TECH/ISA+Extensions+On+Deck+for+Freeze+Milestone
> https://wiki.riscv.org/display/TECH/ISA+Extensions+On+Deck+-+Ready+for+Ratification+Milestone
>
> Here's the announcement on twitter from Mark (CTO, RISC-V International)
> https://twitter.com/mark_riscv/status/1441375977624375296
>
> This means the KVM RISC-V series now satisfies the
> requirements of the Linux RISC-V patch acceptance policy.
>
> Can we consider the KVM RISC-V series for Linux-5.16 ?

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

IIUC the plan here involved a shared tag at some point, with most of 
this going through Paolo's tree.  If you still want me to merge 
something then I'm happy to do so, just make it clear as I've mostly 
lost track of things.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
