Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D4CC47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 15:09:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C4B61408
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 15:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10C4B61408
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlsdNTMJztmnkB7hEsdq/q2gAGn0myJFQBd402ODq0I=; b=PUt2hjuYrd7Rb1
	5cgNAk6l0/KTbi6HfBsAth4Ntm0dyBmTZLUp5NaNDFoOtqBjE+kM+VDsF37q45j5gZReiViHLJFLT
	85RT6Ivj6IAZpsiSvMHC1/Y2xJySJOaLvid9EsyNXjohJ57JK7MPjsw5d9kgHr+QpkglrnxTfnkS9
	8jNlt1OY0+TAZEldWH/IQtOqp7bRkrYyZqCPxn/CvmxEN9+kFivvRrfM6WbCQ4N8QMAkqeKZIaA2S
	f4C4JmpwW4qzDpwcJb+h9UTwbtlgJTc3buCxlm/9fPEl4i8OQns9WQIgC8Bn2f1Kf234aGusmQXwu
	PQwPMTGQ36nigH7xYXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpuOQ-000Sya-NZ; Sun, 06 Jun 2021 15:08:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpuOO-000SyI-QK
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 15:08:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D82E61430
 for <linux-riscv@lists.infradead.org>; Sun,  6 Jun 2021 15:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622992128;
 bh=AhywmWO1uW2jDKsvU3KSsBf1Kkmtd2FEg+HllYogrIM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ajFGntH12SxVgKVVKpzQeZtSpkiTjX/QOPxqJYBiMexhd5GBqSgTszMH8SPS4i6YN
 wgLvCDNsKhQ83MOa9Q0ZTF2sD1n5g9o8qx+95bkODxsQLVnjPZUVIvsTJ1DGNTPktQ
 qRz98HVhIJLcZj1Qbh/SWHQ/lx+QyL2cgOyPXjyVqVMPEeAxSyvPn4B2wVV3h/5Ajc
 +htUD8GYTn8/3GZt+IagSizbjFJTt4L2y7F2UuKYVQO2oI4qwRvEU7fEk16km9GzW6
 HV8cgiXd4fVe8GPdRaW1MijdYbrWgGi6bfdmA6Z/AAGy+sHIi2SOJdykyz/BKKVS4X
 59gXs3u86+qSg==
Received: by mail-lf1-f44.google.com with SMTP id f11so21683361lfq.4
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jun 2021 08:08:48 -0700 (PDT)
X-Gm-Message-State: AOAM531/W0wDJWq/B4xjwF4bf5XK6dbfTachHmIcfYGaggzMjxU26Tvd
 vwP9tDBRy6v0zP9RDeBjPkTtZ7pyn+OuYjr6iO4=
X-Google-Smtp-Source: ABdhPJyN4zk4ZVANOV7l1jrNmtOScbBae+ijxon/C5Plq0iSayaFTJMxmyxUk9u52Aevqlf99inavVPw73IheJW5qYU=
X-Received: by 2002:a05:6512:3f02:: with SMTP id
 y2mr9426858lfa.355.1622992126503; 
 Sun, 06 Jun 2021 08:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-10-git-send-email-guoren@kernel.org>
 <20210606143941.GA6032@lst.de>
In-Reply-To: <20210606143941.GA6032@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 6 Jun 2021 23:08:35 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSCqQkVEdGDuc3z_4XpDu0iSX-PZH-kYYUrVCMP7zuYcg@mail.gmail.com>
Message-ID: <CAJF2gTSCqQkVEdGDuc3z_4XpDu0iSX-PZH-kYYUrVCMP7zuYcg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/11] riscv: pgtable: Add DMA_COHERENT with custom
 PTE attributes
To: Christoph Hellwig <hch@lst.de>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, wens@csie.org, maxime@cerno.tech, 
 Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, wefu@redhat.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_080848_892208_B404DF11 
X-CRM114-Status: UNSURE (   7.49  )
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

On Sun, Jun 6, 2021 at 10:39 PM Christoph Hellwig <hch@lst.de> wrote:
>
> NAK, no SOC must ever mess with pagetable attributes.

I don't think it messes with page table attributes. _PAGE_BASE
contains variable won't cause any problem.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
