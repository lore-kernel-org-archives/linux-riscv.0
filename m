Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DC4C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 12:50:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4110520823
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 12:50:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XVGLpsc4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="VHy58OKL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4110520823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVuOQiFXN/ibFRqSqZyUefxNEYUPs/bdb5qmQ8dHPyU=; b=XVGLpsc4+pf67i
	ArerVwSRwWTwHaUAH5+L3oMFcM5+q9P5/o16xyA4pVTQpAxAGxwOqpJuvgWsNAQyZqmXfAo16uypL
	9Y4uYTPlSwYO/Mtb/xwNAq0C2/LcFTkhCUoSPLaYSJ+gOCuZOzRuEd8rhju7DRiMhkWAIFAFeunlS
	QfDOPTJTKEAYMCiWqKl9g2Fv9sj2yXkdtezVWOZPi+dfw+FjTDtq5AF6ojgQEkvVpvyFK4aGsbI5V
	crWdiDuHuMceNqi+IHBuOiImtipdjb6vsFwyRxIp3+ZYZSEfahIRfnAhNFJ60TDhF5/R/nuhQP0SZ
	kgsY9G4XbhEuBznu1kbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8P36-00018N-8m; Mon, 25 Mar 2019 12:49:56 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8P2A-0008KO-MC
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 12:49:04 +0000
Received: by mail-wr1-x441.google.com with SMTP id y7so5869149wrn.11
 for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2019 05:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nmYmF1rE18fG3Rlx04uuJ/vHCzEwQZmoDYft6UmHsgo=;
 b=VHy58OKLgp+OKOD3PlGUO9Dayq94gLzcy46KSCSIgdzQg7RkOwxW4LnU9n4zA7RpTd
 tWzoY8LgsYExSLWq48c+D9+TAxOGi472iHmRb11VBKY+wiRlGJE5E6AHVMKegsAmAdHU
 l9Pi0rwitMHjkYjEZIx9MPvb0cKuQIZrm9GX5rNzkBhiHhd3mfkbXU7RFBOofXg8I3ap
 u4CArOCkneMu7SJ0nKU4phz/tpxZER0KMmcU0p7oIPYrv8UrEbyYVZJFK/NCZZb6eFtP
 hUNnMkxft6hEhwo0qQudhrfkmo84LhW68KSCZaUZHN83PCxu3SLNZoCQm4MT1NnLdFmE
 i5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nmYmF1rE18fG3Rlx04uuJ/vHCzEwQZmoDYft6UmHsgo=;
 b=AfFXGD4db0qnHVCLcbVFBCHd4oweDkljCV3l7YLO8wthvOL7Sn6mX/7YKNxeOiqbeu
 U5XyZ9Wn2kmmLFBfyOt56DAhNQHWp7MF12eit9iK1jVQ6J4mTPuEkTiS6XnvvHsUbXWB
 53hgCvNRNzCKGSUWcc0ejtTpWTqN/SQmO9YFy71EP7vUqb9fz1qfnADdqAq96PvNZya1
 OuN3ehBa3wrCD/ze6jlAdXOH+LuKv7NcsnBXCUikmm4OpFrqKRsGFsYjOyPnpCSRzH11
 0eWt9wVJMeo/dB/y+OvVzkxE9hggGhiGueHwB/vHhENrdKl1HlsXrTfSYXVdjqrykTMm
 hZCQ==
X-Gm-Message-State: APjAAAXNH6i3dfZESvwml/UL6irNuiWj1QHBWmeeoORlqtNjO5qfaXR1
 633tmb+xNu1pe5aFX2OaHReiqCGUYNf+mlGkax7uVA==
X-Google-Smtp-Source: APXvYqxg01ImCE822MGGI0rIgz8Ae6A/LRFHbW+pCoCyB5tVDcH0f2I5D7+B3ZtTJMOirALfWs8DYtBEcNedPlkr+yE=
X-Received: by 2002:adf:fe03:: with SMTP id n3mr3360051wrr.59.1553518136709;
 Mon, 25 Mar 2019 05:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190325092234.5451-1-anup.patel@wdc.com>
 <20190325092234.5451-5-anup.patel@wdc.com>
 <20190325113935.GD27843@infradead.org>
In-Reply-To: <20190325113935.GD27843@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Mar 2019 18:18:45 +0530
Message-ID: <CAAhSdy2dds7pp8=XX+zbKbMoWbgjPxP6r4aMZJeHyqHV2MP4CQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] RISC-V: Allow booting kernel from any 4KB aligned
 address
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_054858_887532_09B8CAA9 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 5:09 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> I'm still not sold on this at all.  It is a lot more code, a lot harder
> to read code and all for a very narrow corner case that isn't even
> going to be enabled in default configs.

In case you missed my previous response about why its not just
about a very narrow corner case ......


We trying to addresses following issues in current code:
1. The current setup_vm() maps all possible kernel virtual addresses (128GB
on 64bit system and 1GB on 32bit system). The amount RAM present on
real systems might be much less so we should not have kernel mappings for
non-existent RAM. Of course, we don't know amount of RAM available in
setup_vm() so we have to split page table setup in two parts and do minimal
required mapping in setup_vm().
2. NOMMU kernel requires a swapper_pg_dir with identity mapping (VA == PA)
and without it we get boot-time crash so we cannot skip it for NOMMU case. For
NOMMU, the PAGE_OFFSET will typically be 0x80020000 (or 0x80xxxxxx). This
means swapper_pmd array (which uses -PAGE_OFFSET) will be over-sized
causing compile errors.
3. For both NOMMU with tiny memory and MMU with tiny memory, the current
setup_vm() is not allowing us to place kernel on non-2M (or non-4M) aligned
addressed there by causing memory below kernel to be wasted.
4. For MMU based kernel, the current setup_vm() is hard-wired for fixed 2M
mapping size. It will require more changes if we want to do 1G mappings.

The above issues motivated us to re-write setup_vm().

We are trying to make initial page table setup more flexible and robust so that:
1. We don't have any unwanted mappings pointing to non-existent RAM
2. We can have any value of PAGE_OFFSET for NOMMU case without the
page table arrays becoming oversized
3. We can create mappings of best possible size to get good performance
4. We can boot from any 4K/2M/1G (or just 4K) aligned load address

Also, the end result of all this is a much more readable page table setup code
shared between setup_vm() an setup_vm_final() where the differences are
abstracted via mapping ops.


Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
