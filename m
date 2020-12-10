Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF96BC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 11:08:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B87823CD4
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 11:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B87823CD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TDiT9herzicdaOPQJJENtiBekhMNiwYArn4q4Ig4UI0=; b=H5YF2i1XZDlU10JnqC0UCblLy
	HkU9oZLyPfzT5aGLudic0Og7+7cWOK1NyhIdqmNpN84U+KtAONRfIfPBLas/OoDnhLc/gO66akl0I
	gJyRDSv78nOakZAG801Zocan0Jqtl9WztTzTkObvIVMFkPlXZbWJLH9Tvz2A1s8Z7U4iqQvnTN0LH
	egM5h5z8P9cQsj7gZ8/KL7F6N2lXbB2wkMEygez/+q1EKnFfZRr6jy8oKMmIYixP0D+1TzMgZNz01
	MZP1lS73Ev9TD4Gry1E5jGy11V5tLUIY0ilpeY1JEIjsyS/60DwsbN+ZcEJC/ewulvLYRSscxpT0s
	s1hqW4dEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knJo4-000836-Lt; Thu, 10 Dec 2020 11:08:20 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knJo3-00082L-4Q
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 11:08:19 +0000
Received: by mail-yb1-xb44.google.com with SMTP id w135so4309601ybg.13
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 03:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TMRZYbq3/YGGQqCtm0ztggAEksDLbdNXFqO3NqcBf7o=;
 b=fHRJRDkrFJ0b2hAIm/OBhL4fExu4aI4qM5Q6YkBYURJVyCOQdxoHleTqdUmbO/ENwK
 xG5XV5zl3c9gbSiBSt+wmBweD2R8feb8cMvRauhTQqYFnYT8MY2XZvB9TjY5cmVFUfVu
 I37K5GA7tpUlZL7llHaZMl6Aaqmr7JRfBFItzdeGKcGrEyXNi5gNpuTr1iwsOUMMtvSo
 n5u0VKRkb5wnZFFp3fduENxJdqZ+FR6W6rsePa88w08XGe61RXlkNIMqGP0mf+THKAnB
 qQc+UhfjTnm8jabD+zOm58qaxRytBkpTHEqE2E3P4hiIKdIPq3fSCWniWWufRSC+GP23
 1DmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TMRZYbq3/YGGQqCtm0ztggAEksDLbdNXFqO3NqcBf7o=;
 b=OA6ahiJ1y/EcDqqT02e1McSI39Wz/KMxJYAOqE7sglIQ3x7Wg0FP1MRbMnFhh8j/DS
 ku96i9aykGSn7S9sYZm+jvJaHSTSFj7tkn+fgWTtgxPMGRh5xNmcvlj0Sg4a1nIwaUVx
 G8Q5zG4wbxfsgkKoZdR8fH7g7evMVW6b60UTmFOj4a8QUwL2O0yh3I1lS/Qru0lHkgM6
 l6pFCqhvI8/mJ5Vw40ePxB7xxGsZNI2lSS6pVLemQzT/ht1yCW8ooef58KwLVtJyOF+Y
 ZEqXyKLFGhHMMeOhH/jrhGaAfIgtdDiwHD42uspLfEj9Hg89qPQIAW8G50WNtPJNAegT
 ZHhA==
X-Gm-Message-State: AOAM531MR3m7Ui2/VKJGV7S662KBSg88qITUzUx8SbXOlvpmfcNC40zn
 Y7rcNDg0OOOFz0Lhmy8HzOIsnJvNaNQmn8v7Rkwe65KoQ+0=
X-Google-Smtp-Source: ABdhPJzhmyM1kStq1dHTTkK8Ne310hXwRuJi6G1CWZtXEXfrPVV1Y0OP/tZcsRT3RL7X8v5m/YbCiyBI4pK+a3ohHHk=
X-Received: by 2002:a25:ec5:: with SMTP id 188mr11136242ybo.387.1607598497708; 
 Thu, 10 Dec 2020 03:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20201204085835.2406541-1-atish.patra@wdc.com>
 <20201204085835.2406541-6-atish.patra@wdc.com>
In-Reply-To: <20201204085835.2406541-6-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 10 Dec 2020 19:08:06 +0800
Message-ID: <CAEUhbmVZwW-KNcbTp-59wyu-0ia0v02cXy4vxFoYAUH2dbx4-Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] MAINTAINERS: add microchip polarfire soc support
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_060819_211044_F84E26EE 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Bin Meng <bin.meng@windriver.com>,
 Anup Patel <anup.patel@wdc.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Ivan.Griffin@microchip.com,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 4, 2020 at 5:07 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add Cyril Jean and Lewis Hanly as maintainers for the Microchip SoC
> directory
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
