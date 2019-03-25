Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685AEC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 04:17:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E998F20879
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 04:17:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i5N5cnL7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="oxghoU3B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E998F20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ObDjnpJHbFuTI2p+xxpPGgyrTi4dSYzjPe0QJGINVA=; b=i5N5cnL7TK4lmo
	OH/QTHUKFkmAaAXzj4VdzBuKQvazFNiSqiMogrGagp+B/3Ktw7mjBKJl/8U7QCmUMOj0Ijlg9gz0v
	A2gWtJ6qV/p2Y1mHnwT/YNnmX/hnd0FyTNFM02Xl4x4G9TsosnbK0+fb0HiSErLaeIrgxk2XuftPz
	9sjvq7FmtCNv4SYmds+kTGiGuPW60vJnImuSmnpIzyPf4XqOjykToraLzBmCWvLx+Sx1gkshf4lK2
	J1gJ/tNAWopH1T1dcx39UDusgrCzwxQn08HSXSGSnG3zfeCCQsb1cRIJAtNDQkGxMjuDtPqg4RtX+
	ChZGs3A4eCrcAHGEUJcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8H3Y-00075M-G4; Mon, 25 Mar 2019 04:17:52 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8H3R-00074K-36
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 04:17:49 +0000
Received: by mail-wm1-x344.google.com with SMTP id q16so7364158wmj.3
 for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2019 21:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cmheFdWc1bDfDYTvQE/RQZvBHzMvLSWVjStZrxNss3U=;
 b=oxghoU3BsgelThxLKRNK4sWPtgiqP/FIPAi/imbQyu660GemIu3fEgxNxjeTIRJPW/
 5ta0AY9ZJXSpl/tl17QSTjbRkU4POrFCqv4iRbsrzASNyPS3XbgMpa1HFbhKxEuEktQR
 pTqqlEUlxblf3dr+bPOjuDq2kAloq6LICLrQ34mSTtIWNFC7dQnxwOQ2aKEKKFbFRpav
 aw0iaDtPqxz3rRHg6+E9yVZQSWUx903D0Xr0DhHim5LvKYcwGc/DsxjOWk+cM5SQu+iS
 v2Ocwujgh2mazGTeUn2zUx23FZXZk6lSp+YN3RJc8t3ENDd1DKs+86i3lc7hT93H9tn/
 3SmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cmheFdWc1bDfDYTvQE/RQZvBHzMvLSWVjStZrxNss3U=;
 b=WmjU77ak9dvTJKSdu2wY5Fo7EzdOy5SFo4sg34zL9K73Npv+41IX3s217kEIe5Bg2J
 ofqlCPvX3pS1Djlp3MLfx4wlb7XFgbLuSv/5f17Xeo20NWFAJZsVDoOkzW4jDCxfPaHP
 xa3J5VdGl2Erd05M1zijAbdprdDmjTuwXqV5V9WhfuwgxXU+LsGpufLvYmBbDt0bRVqJ
 pdjLNEt5A5tVqLAYktDVdBRFBKJeQqhALyY/+xIdr+ERBQJNtyfWT+AIQFabXFFLM0xw
 IK+VojQvG7w3KeSOCZWWbj+yg+n0xY6v/WIcbjLCNFJ9a2pH7oYc+goBdwle6tLK3Zqn
 q5bA==
X-Gm-Message-State: APjAAAUgfhRdLv+5b8V7yoHYxUwG2ZUNyhTl/rE4fqGZLyt1x/+CnSeJ
 aNkKgKJA01qXhYkWvFzWHFG6vHubG5PJNGTWMtgEYA==
X-Google-Smtp-Source: APXvYqybFx/kXUFhCGsqWtMHK+exoArZmnLJ/lclI8sdgwaIZt69rS75baC/qiOnvb5rkPZG4kjw0pkCwq+hj39qPzw=
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr2088991wmg.132.1553487456191; 
 Sun, 24 Mar 2019 21:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190321094710.16552-1-anup.patel@wdc.com>
 <20190321094710.16552-5-anup.patel@wdc.com>
 <20190322133330.GB32464@infradead.org>
In-Reply-To: <20190322133330.GB32464@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Mar 2019 09:47:24 +0530
Message-ID: <CAAhSdy27fGCiFc_g06Q3AnaVEJ_P6GeOoEFw5vA6tkN++4xRTA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] RISC-V: Remove redundant trampoline page table
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_211745_136517_78BD6605 
X-CRM114-Status: GOOD (  11.66  )
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

On Fri, Mar 22, 2019 at 7:03 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> >
> > -     /* Compute satp for kernel page tables, but don't load it yet */
> > +     /* Compute satp for kernel page directory, but don't load it yet */
>
>
> >       /*
> > -      * Load trampoline page directory, which will cause us to trap to
> > +      * Load kernel page directory, which will cause us to trap to
> >        * stvec if VA != PA, or simply fall through if VA == PA
> >        */
>
> If we want to nitpick comments I think this should take about the
> page table root or something like that.

Okay, I will update comments.

>
> Otherwise the idea looks good, but I really think we should do this
> before all the changes to the setup_vm code.

Sure, I will move it before setup_vm code so that setup_vm code is
further simplified.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
