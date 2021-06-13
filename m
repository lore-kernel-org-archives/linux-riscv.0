Return-Path: <SRS0=q/zc=LH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841E9C48BDF
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 09:32:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35CF461107
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 09:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35CF461107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KAYnQuldUu15+AGbnk1qkhbLudamzylQcsB4OBEGHbQ=; b=NTuQChwg0SiFX9
	0/bj62214Yq1vOI+6Of13sFc3BlML5LzUkpBg/1fnhqNOv83v2Q02JtVeJu1b0lA20rmCkvqr9S4i
	tHbP6+Mmxsc5pf5RszEs3p927Owk2ezx2eD8vpOCU3oNnEmFWMDOGU7n+SpVIY3FUJ8GJj0MghV9D
	252HHixNUgfmqex6Eyv59mRGEC9dGcyxYMGdrylAUH2rD/wIfzANtwB8nFBOnGeZAtuqiJt2hdPov
	wnEiKkYDFew/2T/FG6bxJP9B9RUZSB5YcZlgmmUgv3tZGyh0R3cbO/MSLfDTKOOTJ6QdivFhatajx
	T9+/x/3bYReU9OcEzKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsMTE-00A5A2-Us; Sun, 13 Jun 2021 09:31:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsMTC-00A59B-AF
 for linux-riscv@lists.infradead.org; Sun, 13 Jun 2021 09:31:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0342161059
 for <linux-riscv@lists.infradead.org>; Sun, 13 Jun 2021 09:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623576711;
 bh=S5AAXxYhkZ0ry/hfoH84WZGid2O7VIImmwGmKoIoDdk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZfPDZXFUc3sXuoj3VtmqAK8+TCbmoY1xmLtMq8DrdFTQcS5MgKNdeoSpeyxt1i8AL
 Tog1zAb2Ta63XYKhZoVdf3VdANysvmHxYr8lXAzppWljiIZpM6WlLjI5+HyQInPzRw
 thqZ4a+KlUxTui9tBLWZWpseuJsCP3F9SXjLbj87O/kfhv2F/qFb9GDX6pr6dMYyU4
 zxNXhqsdjbEYaTbHlzXqu4ONNJD/qgvsE5z3s1KaDORbNbn3o9qAdlJkdheH1DzK24
 helADFE8RvBJsThB8sDkdmdIxpx8dVNjDoYAEfQZL/KW5pUzdTq2lsLj8A80HUFk5Y
 75KXNhxe4hV7g==
Received: by mail-lf1-f47.google.com with SMTP id k40so15828807lfv.7
 for <linux-riscv@lists.infradead.org>; Sun, 13 Jun 2021 02:31:50 -0700 (PDT)
X-Gm-Message-State: AOAM533rY3uAOZJ8Ew3PIpkSPKyPqhaaNYyGVILOcO0wA5bO+fEn2tHk
 jta/QbOFoT8lmgqLH2LpxyJqzGot6VOKI3YcPSc=
X-Google-Smtp-Source: ABdhPJy4R27l326NTu0rb7yRKC2p0UQRb3k6XWwd/OyarRietY6Eg93K0rOKNCDU60/3a35cNXz4FUOpyHP4IFTDQvc=
X-Received: by 2002:ac2:563c:: with SMTP id b28mr8370219lff.24.1623576709354; 
 Sun, 13 Jun 2021 02:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210606152050.636038-1-hch@lst.de>
In-Reply-To: <20210606152050.636038-1-hch@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 13 Jun 2021 17:31:37 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTPQKS70WnwLT+6uQA1ciHq_1q_=XUd4bMn6f66JPh0GQ@mail.gmail.com>
Message-ID: <CAJF2gTTPQKS70WnwLT+6uQA1ciHq_1q_=XUd4bMn6f66JPh0GQ@mail.gmail.com>
Subject: Re: rebased ASID-based tlbflush
To: Christoph Hellwig <hch@lst.de>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Anup Patel <anup.patel@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_023154_394335_489EDBBA 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

On Sun, Jun 6, 2021 at 11:21 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> this is what I think is a resonable set of patches for the ASID based
> flushing, largely based on the work from Guo and thus attributed to him.
Thanks for the review & modification.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
