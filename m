Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE871CCF9E3
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 14:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcvQ+yHwPBPpo38e77cEwwQyC1ym+qbIxuWi3PK9BFQ=; b=fL+gc+9Oh+s2/W
	6WcI4UGb/OHy5KM8ARcU0VJfNCbyYTmqE05qfrwMHBfrqdw9t3AhelexKR7ETnHkaGzvNd8knc3JB
	l1W3XvZWXG3Afr+VgQBj4Hx3xApESifHhESHMFCdAHdfSD3NG0+U80HUBRupJ4DC9jQwi9CR6naE7
	Fjwu6EUWtqeZbSYNFPrdvxkQ8heEFUmq6mUyWs3wO8A7UqqSErwjWrU1iVtTnWElF5+zb9qmNQ3v6
	EnOvge6U4wHclccBD5k4vgbx3RAFaHZuwgkd9Oko1LU1PRSZn+zQT0pml+0RS91cRUXpnBUSbDljI
	3iFg1/R755nmvBbghDeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCfdQ-0000000BMoU-2Und;
	Sat, 25 Oct 2025 14:52:48 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCfdN-0000000BMnc-158Y
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 14:52:47 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-63e12a55270so4429598a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 07:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1761403963; x=1762008763; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rxkH9HqQp8MJpuSr9SUPPrL1eIBYUI8t2HD6mPry1gY=;
        b=Vy25KCytI091Zo/MWoaEy1H5Ivedj/U0Feh9HXKlTZWRqwQwQUz3nuUqLGMwrGvwtB
         UVo6RU8ZtmiTOgUaOv1reO1vAvBxTlN0uukQdYQnp/y/jWAZSGyhzHHz/8BuP0AzOqOm
         rODQk9ZS+Iv8nBE1sUF9vuXp6HgkZNtNltMKaB4zkADmuNk23aQZDR0nlEASohSTziDp
         qVhRVWi0rpYt3rAYsDbpdi/WhwRYI09L3BkN+/ajAQMohbJdtDFJ8zg8hvJsAPiZkXPE
         FckA/VTP6Dzq7/s69qHwQIEIEvPJHe+JatBYXsehMpAEmQriFEtshfBugKinhjUJbn9N
         ZRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761403963; x=1762008763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxkH9HqQp8MJpuSr9SUPPrL1eIBYUI8t2HD6mPry1gY=;
        b=kjDUKCv1rXxi3W05/tUnA4H2W5NgISuq45ZekVE6YzPvgPkb93Oym6aQc/IXqeO2r4
         ugZqvekPQpMIT2uwH3MOLALknk/zhnUQ8gY9rqlqf0RPGSX08kZm0yzgGj3nT4YhtizI
         PA6Xqw3xFNLKJE9mUz9VQ8ODTVTVi37sNbwVrGchvGxfclZQqr+Am17ozMo66OqHpI8G
         u3wQ4YdsJPc/Q4p6pczuRxNJIZr0id89WMNiRyN0MDYdAAPosbllhyXJytSnq6lAjvt2
         tLKeXKsOrDpBP9r1QPNo0B5io0uM95buuyOoPOcAXI1o2CIlVhN1yznnna/UeYwQ+1qv
         VkuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVign/ZEJR5UvMu84TILKZcErd1s7tVEBbnmwyViy+XwuL+EOj8xFQsPjzEn6NCij1FHXOoI530JBqN0A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2v0Q9a7Fka16w4p1ATrLdYiWO55Mv6D40N9dJY1GT6UvC403L
	rxfBGTnQ5xcl0Mc8XFGTF4qvw8jU62ECJbsuEQfsPVe6Sm5m+wYgh75t+TrQDVNRl/qCIsMzTcc
	f1j1Ov5kmcmqizlfvBBXDVxbt4WXD/KVxg8jSCSLIng==
X-Gm-Gg: ASbGncs39328bvEfYEwI+0ihVMa6twH59vAtwBhRUzsUbAoqcqjPwQT5Rx5CHRmcxrI
	3UdlOGfmAY4IBY4L3jdwF0o6CJeZ9n8WfivDlJPGfWYitTj1Lv+xqYuhqHki+m4H3VEPZJgDwPl
	3LUJY0FBfoL/KYnDIT30xc6gti2NTD51glj9euvnk/TGQNNrvcnaEhU1nHDvKeKd1EVdhB6kdsq
	q2f+X7Ra4io31ssxxy7UXcPlsoCSymyvM9UiIwqrbQXZAzMhnP7NM0dI8ZdppnJaMk83O4ZB95O
	P+jKJjTPSk6T7qbnb+SzBmZOrPne
X-Google-Smtp-Source: AGHT+IEEmtC5AP/1Gyl7o28TLb62A6fjQmpgJI/nFlghPy3b8TZfgzFAjEpwZUdPvlcd5pyK5S+BLKOml0q59+GzhB4=
X-Received: by 2002:a05:6402:13ca:b0:637:f07d:e80f with SMTP id
 4fb4d7f45d1cf-63c1f58c0d3mr30957969a12.0.1761403962844; Sat, 25 Oct 2025
 07:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 25 Oct 2025 10:52:07 -0400
X-Gm-Features: AWmQ_bllNz8YycDjixpyqg8hZuOQcw77RRZ1nqOvRZhBjS1lHQKHtPcetSr4uhE
Message-ID: <CA+CK2bBvCytQhJ-DbgBDUo-MT0xtuXNW=yzX3StwaNUj=JfnoQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] Consolidate iommu page table implementations (AMD)
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Will Deacon <will@kernel.org>, 
	Alexey Kardashevskiy <aik@amd.com>, Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, 
	James Gowans <jgowans@amazon.com>, Kevin Tian <kevin.tian@intel.com>, 
	Michael Roth <michael.roth@amd.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_075245_322965_393D6FBF 
X-CRM114-Status: UNSURE (   5.38  )
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

>
> Cc: Michael Roth <michael.roth@amd.com>
> Cc: Alexey Kardashevskiy <aik@amd.com>
> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> Cc: James Gowans <jgowans@amazon.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

I tested this series via iova_stress [1], on Intel, AMD, and ARM
machines, no regressions were detected.
Tested-by: Pasha Tatashin <pasha.tatashin@soleen.com>

[1] https://github.com/soleen/iova_stress

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
