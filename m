Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55410C27C5E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 12:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2QKocn9RC1xBbjcChHH9Fv7+9sUEXIaq1IXonNoxko=; b=v9j6uoWE0xBppC
	Iq7pyHeyZ0ixE3VlzTkVRKth5nlWbMVLe2oJ+SUh85YWckyuOtT/PfrVnr8o2RHe/MWlctULR8szp
	WUQ4TydhIgTXiLSOY/Awb5fw9GiiUWV2fkMYMaedQacTanm9AmLIY3OCrWl1sXB/RnWyETAYPy7cY
	cBYcq8KiGsvPFf6H3U0x+r4/iU0L8MmZbDu6xjLmE4bZ/ghDIuddTYKZqkJa70UEe1RnBPH4g8I4w
	Fgbkcahays2ZhobS6NvnPMKJ8ermYD9C9FC6WHY7Nb9f/5Wpqa2RZ6DxHMEzdf20d70gsiVWDAo/R
	hwdXUGY7Es7jcBIkJEGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH0MY-00000008nRH-31G9;
	Tue, 11 Jun 2024 12:12:30 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH0MV-00000008nOU-1oVH
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jun 2024 12:12:29 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7955c585af0so64877285a.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jun 2024 05:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718107941; x=1718712741; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sIbNJUSxjDR6r4OKpjG9oJgb7z911EUrOwt9KL6BXgo=;
        b=TioJILY8+htPr6mi0vwSNo5BjgKSrJ6SsL24M9ynC+fI3CRB6WvDd69+jHflT7GUb0
         bWs6TEDnrLiPNWCCZhn9QZrWsLyonWocgtxZiouHNgkbEGqw4YNdt0PqX20Udiq986ZS
         DPu0sHwYEJR06ZCcvsqtOgGmsVIMm0Fw5Wvh1DTGCCvUaG9F8LRuILzEL0N2bzPd2RIe
         aGC7t3sjJYmbhFVjNcshkUP2U4a0oFZZOxE9WC5mbH5NihzKMy9TNnU6IHynfLQEKd4m
         vY70qi2ZO0GarPIqfVDaA3o1V2Ar6YZru+menVcqPTUDxlhRUwp8766IoHu18tbJDdiu
         cJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718107941; x=1718712741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIbNJUSxjDR6r4OKpjG9oJgb7z911EUrOwt9KL6BXgo=;
        b=m9pkakhgvQmaUY9qsiCQ7tIdExG6ypBmwPZFemR5zG73zS9C+Lsblz+lXg1oP6xcg7
         8HRSRJX+dmpKEtJ7TxnhEJePA46r8cBPN8B0AGTuq++rIfAN8ZKKWgiokoNm4xVLLDu4
         v+s1rNlPPYiVJ+S04X8tN0+gEPuUBWrZ6T859AWWpxw+ZRAu8d9uJNkQuMcr3CZKG8K/
         yD0qI7oE76xdEYXq1tVN0EmGtRlIMRbSqhVoQyWZkVmGWdWR43ZT8L/r/Jcyv0gtNV2+
         Uq/63wZyL0l4v7s1cj4DC2A1tkNSxuSe7PK2oXEezM0v/YKrbh2KGcRBVqFeOJj4k6KC
         8QSw==
X-Forwarded-Encrypted: i=1; AJvYcCUIeOifqGZSdAARXiRXi8IjhjYs1TzNn+jguRyB0N82bPFeEGDaRkeSSVeGXMZ6LssEtw+tqqWLbJSBMcqhoIUkSxinZCrnYNL5VyQ//Vj6
X-Gm-Message-State: AOJu0YzhVH47z5GIWrfIbQQcAWqJErRplhc7bZTk//LfTs0kkn8pio6W
	4cHuJy09XE1Wq/HKK1lOSrdlEXidyCbV0spfKTHI7p1NV62UfhBfEOfES4Cx3to=
X-Google-Smtp-Source: AGHT+IGrA5stCDnRo1H5n9Y5w5ElO81oVmgd60ewDFQ3Fm5sCDbN4V5n/Tt2xc1pS6BW64I2SfmIhA==
X-Received: by 2002:a05:620a:24cb:b0:795:4cde:3b1c with SMTP id af79cd13be357-7954cde3cf7mr1271288985a.6.1718107941369;
        Tue, 11 Jun 2024 05:12:21 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.89])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79556b3ac83sm292416485a.127.2024.06.11.05.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 05:12:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sH0MN-001OhE-1j;
	Tue, 11 Jun 2024 09:12:19 -0300
Date: Tue, 11 Jun 2024 09:12:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v6 5/7] iommu/riscv: Device directory management.
Message-ID: <20240611121219.GP791043@ziepe.ca>
References: <cover.1716578450.git.tjeznach@rivosinc.com>
 <e18ec8ac169ae7f76e9044c26d0768e6469bad19.1716578450.git.tjeznach@rivosinc.com>
 <CANXhq0p4gERQeROSCSKqxnRZq9-fGfmROGV8JZyqFaenNpnsLA@mail.gmail.com>
 <20240610174934.GM791043@ziepe.ca>
 <CAH2o1u4c6ttUWTb1zrc8DScDMuDJJYR-tTHCPYW_3FV4uuQDtA@mail.gmail.com>
 <20240610222051.GO791043@ziepe.ca>
 <CAH2o1u7X2zu42ZYA9wBe4bmCXN9v+d6j9vo5DMifJA3BUew91w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2o1u7X2zu42ZYA9wBe4bmCXN9v+d6j9vo5DMifJA3BUew91w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_051227_696611_F4B1815A 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: Zong Li <zong.li@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Jim Shu <jim.shu@sifive.com>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Vincent Chen <vincent.chen@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 10, 2024 at 07:00:34PM -0700, Tomasz Jeznach wrote:

> For now, I'll change the implementation to assume negative caching for
> DDTE and will follow up with device tree / driver updates to make the
> invalidation optional when revised specifications will be available.

Is there a reason to make it optional? It seems like it doesn't have
any performance downside to just always invalidate, attachment is not
a critical path operation.

I could see making something like negative PTE invalidation optional
as that is more performance path..

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
