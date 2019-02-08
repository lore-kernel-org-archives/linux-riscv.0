Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233A8C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 09:17:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C72AE21917
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 09:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ncvt1TUn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="xQUNhlvG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C72AE21917
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mEka6h62l4FeQq7TRHctSBK+4g7XoGIfo0EEetTgsB4=; b=Ncvt1TUnosnyKf
	YVoR1MZaCsF6gHYQ/E/z4gx+c+AuJ+H08PlkL/s5F3pumAtt/FqGKP6kRG+7tT1gSVuvDLlX+Shh4
	k2JuC7A6A0ngCF5wDUDWhy6m5EfzOQCcNyYG5UJTd7+y+r1Bxr6uBWp1m6anATMkb3s/wF7nEqwD3
	QiTe5M+k42n7s3SzctsvfyE4I1J13WH8IzlsOi4WzSoEZ/d+OvFRmz8eKqaxTszsbfYlWv38nKwIK
	T1skoR8cMMlaIdeleTDaSkCU0YaCMRQ2U7SyzEInr4n7OpiSOwoG+eK1hIIwxo/RVdMuB21HT0CjI
	Y3CIh3MLITg8jpRBjp9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs2Hc-000202-Lh; Fri, 08 Feb 2019 09:17:16 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs2HZ-0001zb-Tf
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 09:17:15 +0000
Received: by mail-wr1-x441.google.com with SMTP id c8so2759007wrs.4
 for <linux-riscv@lists.infradead.org>; Fri, 08 Feb 2019 01:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fy8v8VdfIBbsHmkhjFWnZwncUL5ifYoAU6yv+CzH7jg=;
 b=xQUNhlvGrT5RkIs84886ZbQAX+OkBpL7wKHq8lg+Yxnjw1Rmk0wQnilGJtcu5AqMmH
 A8wderp+49mOe2nMMccxB0Wz4ckMlAJFKGYfA4GTOVNqJu6IcFgDSAzJEWB6Iov300ec
 DutFRqF6dRS9d8hFEHd1iz+io90105hMASEgAl8SlvWa3L01xv+pl6YT0CZ3Ag3ICPzZ
 ONM6rW5IxaRoB3KVDmFzF9ukl0AX+Hdibw4LQkBczBDlVjK7SCnj9r1QCesg5K9MwMTx
 MgN0rLs9RDdk/vUWGOfO/ahga4nCGOdbTXiQjR+es22oz1IWiUwLdGDTX2UteDI9zd/P
 fcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fy8v8VdfIBbsHmkhjFWnZwncUL5ifYoAU6yv+CzH7jg=;
 b=QEHIkcYTqkbgVwhipfA9UiqTqRTiqxWE2nd9GUm2I0rG3qlxxAC9qOUQg8iG/flJ9G
 5Sh57Rkbx2vbVQuy8vLwdtMUm4rIbN1Bb9fXSZV4cqWNdalrbs99xjTE8IWibkHfvn2S
 Zpg6vfSALaRY4yU63hFTf/j1+q+OgK/fN3cLlJqym9nUpSjgZzYnmvg0nvbtWGNbYqQf
 pEQ/bxvPPeyomvxvSbRzreAqu3nrL6xvbhY4f5+8TfxpPh9AuDKuHQ4jXGXOd+nw1uaA
 9gt6Vx4cMAcnBnd1vij+2T5nzSSFb9ugiRvKsyd0ISqfNcFZe+esOb7N++G5ZSjUaXXo
 WeAQ==
X-Gm-Message-State: AHQUAuZjt3Il4E2sSZI0AE4GzCuuucpWSEFcBd92jfHcJX4Bw9axDR2k
 dIdvQzdublG0a4uc/1yRj3ffM0laN0tB5XEv/NUTDw==
X-Google-Smtp-Source: AHgI3IZzrFAwuiegxVpBw9f5b7d7Z4m3FGIQ1R6TxuJkWPvYTWf1v5VAzpmIYTk1eZ1JY/XmLFLCgCu28ZZjC/8q7u4=
X-Received: by 2002:adf:8506:: with SMTP id 6mr16543899wrh.128.1549617431850; 
 Fri, 08 Feb 2019 01:17:11 -0800 (PST)
MIME-Version: 1.0
References: <4b647c0d-86de-fed3-aca6-d248b9aff762@wdc.com>
 <20190208083206.GA4699@infradead.org>
 <CAAhSdy3GZHn9k7VvcUkM4s2SpU7SjtW3HmWcHVD342arWHYZLw@mail.gmail.com>
 <20190208091305.GE16932@infradead.org>
In-Reply-To: <20190208091305.GE16932@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Feb 2019 14:47:00 +0530
Message-ID: <CAAhSdy3im4i0PJvKqDAfq2iDFvTA2O3ZsxjM6wSgdnFUU1eVcw@mail.gmail.com>
Subject: Re: kernel after 5.0-rc2 may not boot using BBL
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_011713_958838_939CE1BF 
X-CRM114-Status: UNSURE (   8.94  )
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
Cc: Atish Patra <atish.patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Andreas Schwab <schwab@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 8, 2019 at 2:43 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Feb 08, 2019 at 02:32:51PM +0530, Anup Patel wrote:
> > It is a bug in BBL because it is not keeping sufficient gap between
> > Linux kernel end and DTB. The change pointed by Atish actually
> > reduced flat kernel binary size by almost 1MB.
>
> And that is all great.  But it breaks peoples few existing RISC-V
> setups, which is the best way to frustate every single of the few
> users out there.  And that is best way to lose any interested in this
> already hard to use mess.

There is no issue if you are building Linux RISC-V defconfig.

The issue starts manifesting only if you more drivers enabled.
Again, with growing kernel not everyone will see this issue because
it will only show-up only when gap between payload_end and next
2MB aligned address is not sufficient to cover BSS section.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
