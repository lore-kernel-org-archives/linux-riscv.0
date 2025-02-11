Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D973DC0219E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 04:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXj8fdKb0c2q9IPeKlvpyt/gj8O5g/ve5AKIMd1NirY=; b=uXktzV8NZXhJ3QIJD55gJKlslH
	Bu1eFR3Q7pnceSW/zoeQD/bW2CSMl2A8NXwJH/ZaO04jNd9pI6isoPM0/PhlIPdvVYvjnz8LM1nqe
	sQTSXkAZVeQ8ery0eBpl8orVbH3H1J0tuX/bDklnPXfPY3zsypUC/iT1L9TKoWe1F3HWeUSjQmqQm
	piPVYnqmsafsYDkGW2QW7tw0uouoQQ8ZuYHYydkc33IktyKhLL17LQ+L8akJer5m0SZnGsw61mWMJ
	aFikT0SIpVSiA3u08OyBSZbFdRo/MhJjGtSfE0NTyfI36cYG33uduk8xoN9IpvYw/TkyHzn3txiyO
	Z9xq9C2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thhUE-00000002SN9-1M2C;
	Tue, 11 Feb 2025 04:03:02 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thhSj-00000002SBn-2bVz
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 04:01:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21f4a4fbb35so67474085ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 20:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739246489; x=1739851289; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S+zdcfJtPCvC1BH2Jp8SSo4wCM7YozlYfZJMVZB5jmk=;
        b=IV4XDJ3dsU9igRjx/nHxd7KXm6DRkiYng6jklwd0BJFpsSQL0R+99Hrawv0rfncKGD
         T+LkbdZprR0qdO8qpRONrKGoHI/uiLUC8BdgvOAR5yRAzZjd3b1cOm4nQj0sVXlsJGp6
         BOmASZ0wt3sN83rGtph+Rq3iKQCQNBkxQ5B2O3DumB2TMKxnRiHynfbBlWQryLK2YtS9
         Ia2Jmo75BS/tDPWpqBlgeLxjh/GKwn7CPG2/Xqy+MnMNRc9lycNpCKXm9QVFkfPMi3QM
         Kef4CIakd2Py0wzoHfARoY1Ti+PW2CMbHt0ntPOfO/gTW6qqyK21mcQ9xasuRekRsQ68
         t9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739246489; x=1739851289;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S+zdcfJtPCvC1BH2Jp8SSo4wCM7YozlYfZJMVZB5jmk=;
        b=VeHEpSmFzMEOs+KKVc5OiV403ONnnvlDXQrsSvqFrDtil5/1HQkRzjiP+rDOFuXyzI
         DCrxuTrf7T6PrSOwKeTF1N012bCC+0Eg4f2KUWiSDomw2C/zqqGuHxgrA0GE5MsEIpeh
         vWC+Fn5iEmqC7hlK5jvtu2FS/wN5iP+va659uwP30g6Z35Y/oCLzIpmGffL5JU5I5vx/
         6GOmDiY4X6cqJOJrnZh/sFn8UjmhRKuGvIKDJvKbF0g6flCwiGiWXjyff3p5ah+5nG7A
         C6Ky3AmD8f5gKn1/RdAzfPD89GbEnDiYeHDrtN/IyrHLpJXjnXR7cQhBUKHY9FGNbHM9
         Tw4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSpr6gUlFtJZ78jFKsOsNJ2bvmU1W3Yym7DO2Qs6OjMJGKVnyfBE8varah0G6nPZRSk3QN/uixD8ggYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2AOjvlHkuaG2TbRWFeOZPKkTlfpLZk2cs1wjC5Nzc+G0H3kw2
	ysdOEk/JpTwnDs4g3ErJM7UQM1rq1ImXSfIJnParbyJC9GWU4hJXOvn1qkQdLmc=
X-Gm-Gg: ASbGncuGEhB3n4O39ir2TnQm5i9MZ8Bc3c2ZdAgU5IHgPOghGW8q8/eGgY0d2tPbR58
	pR/9GOG2/+efpBPDlMp3qquZC2L4Lh7gt3bNuphLv9FY+DHbfo3S79G0EUCSJbpUcEC6/bu7/iC
	QdHe1rBxyUgfOjGLFAouZ2MXqPpv+olfsJwWMAEcKnrMtzJYMCuo/Fe2qptgcBSTqwH31ltcmWl
	AALE+c7hjiPtxO2KU4FbptVHK8OEfdUTXPPN/s4PgiQajmImcbqDuSIMxgryTOBbyqdURW08B0e
	SUXH8w8tSnDi3DVLpBjtdHm3tQ==
X-Google-Smtp-Source: AGHT+IHQ1bwdnVi0Eyewf84joQokKW1zoJC8VDUOsdcQJkNXtQirRClUT8g3wnWg5KqEmtasn/ZbjA==
X-Received: by 2002:a17:902:ce89:b0:21f:6d63:6f4f with SMTP id d9443c01a7336-21fb6bf60c4mr27609325ad.2.1739246488700;
        Mon, 10 Feb 2025 20:01:28 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368d51ebsm87094655ad.252.2025.02.10.20.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 20:01:28 -0800 (PST)
Date: Mon, 10 Feb 2025 20:01:26 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
Subject: Re: [PATCH V5 1/3] riscv: mm: Prepare for reusing PTE RSW bit(9)
Message-ID: <Z6rLlkphtv99+bH3@debug.ba.rivosinc.com>
References: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn>
 <20241113095833.1805746-2-zhangchunyan@iscas.ac.cn>
 <87frl0snf6.fsf@all.your.base.are.belong.to.us>
 <CAAfSe-tRFEXiXJ=tHVnXy4Kb6O7-E2Sr_xybLYxma=ypMhqz9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAfSe-tRFEXiXJ=tHVnXy4Kb6O7-E2Sr_xybLYxma=ypMhqz9w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_200129_914056_5F4B1588 
X-CRM114-Status: GOOD (  12.60  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 11, 2025 at 09:20:22AM +0800, Chunyan Zhang wrote:
>On Thu, 30 Jan 2025 at 16:42, Bj=F6rn T=F6pel <bjorn@kernel.org> wrote:
>>
>> Chunyan Zhang <zhangchunyan@iscas.ac.cn> writes:
>>
>> > The PTE bit(9) on RISC-V is reserved for software, it is used by devmap
>> > now which has to be disabled if we want to use bit(9) for other featur=
es,
>> > since there's no more free PTE bit on RISC-V now.
>> >
>> > So to make ARCH_HAS_PTE_DEVMAP selectable, this patch uses it as
>> > the build condition of devmap definitions.
>>
>> Heads-up: It seems like Alistair's series [1] that removes the devmap
>> PTE bit will most likely land in 6.15.
>
>Yes, I've been keeping an eye on Alistair's series, intended to update
>this patchset after Alistair's patch that removes the devmap PTE bit
>got merged.

Please keep in mind that even after claiming back devmap PTE SW bit, a comp=
ile
time decision to select between uffd-wp and soft-dirty is not desirable.

>
>Thanks,
>Chunyan
>>
>>
>> Bj=F6rn
>>
>> [1] https://lore.kernel.org/linux-mm/cover.11189864684e31260d1408779fac9=
db80122047b.1736488799.git-series.apopple@nvidia.com/
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
