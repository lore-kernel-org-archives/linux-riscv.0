Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A3CC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 07:08:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA19B2173C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 07:08:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FBwb0N9g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="h3fWBhxu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA19B2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=pXfiIRkJbz8VldSoFxv1iywbU94nu9Wy6s6xXraQJNk=; b=FBwb0N9gYPlBLowvjgQNfP4bS
	l2ivUkV3EdUyH8tCOnPCDmOrKj1DgX61u8/G4VQVMH90Ww7U79v/NMYbRpSsLYHjf83Z9JkMVl4Ur
	mJ9ytbO1UEDoSTqEvDJiYqe7z15vJufYwnWEeLP1nLEv3f57g+HMggHYePlTGww492aJZSICWbP+w
	sxwTYs79zuIOGkgikZPtEQOZEuuUMkCPoWLck8TuiQGSnBUUgbfReNl9U8Jg0hmeR53XOc7Cm+JoJ
	+CbcsIwMN3Sez1wV7HaaMEQq8ttTX1nYG0u7iN+4ojSC2ioUb+3Fl7QHUkdXWYBaX8gqQESBlYZ0m
	iXApobUJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9lcu-0005wO-Ok; Fri, 29 Mar 2019 07:08:32 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9lcr-0005w6-7j
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 07:08:30 +0000
Received: by mail-pf1-x444.google.com with SMTP id i17so607330pfo.6
 for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2019 00:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=gfPi45QJJqhIIedzCy1HlV3AEmusPO9AnxU7G0DFItg=;
 b=h3fWBhxu4bWiy4yWklLvntlw4Mqi6SOUlJDQEI0d12m5cSYthJOFXxVrmus6jlRhhG
 PQh07+fVVy2bnmg5jKuL/KCjkwBK7wuuVKkItkGqyf9a7iZjjbKu7fBq4FGz0I+4sQSX
 +zsN/anlq2Vx4KntOjJC5sCfvqO74BOG47yFlggOukLekSJVZBL6hIQPUBp8WtcvvNDR
 +9DrNMTqEAftw25oeB9Hj55obvEwgbGycN5YptRiNXZpqQmZ+FHYH0zVa8VAPOsDPEL0
 rQz2WKXp67EgN8/Ini0msGOJcYKMIkF3T5w2UN/LITONwgBWuInIkFG1zZ9X6FqDJAYL
 efYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=gfPi45QJJqhIIedzCy1HlV3AEmusPO9AnxU7G0DFItg=;
 b=mdG9ssU25JYimQlP3WcVCd+K+9UZnKtc8DpuT0Akl+zr/+GU9bgIuwNTQAkwV5Zbg3
 YurGBdnR7dQ+efbkPoHguxzGt6sj7IhfsrFZ4K8iv3gnOcGS96IFDcW2qIZ/QAbuo1WL
 reUmBsFQndMAsjKpOGdSzLLwkul/cq8KjMGpKKeYoQ3kSqmhEc5H1J2iMbVi8D7/n992
 mERF+Sx12m7LQZZ/roU+GawQF9aaxAIcZE6a70sv9/boLNXpKOH4AnuR+JvIaujmkLyd
 EYzulG92VlVJYcY5oZ+bxm/ko4cNSLzmfIZnhhmgSuOrPYbC6lV6jmUpV6RMld62mCxi
 b8VQ==
X-Gm-Message-State: APjAAAWp40L4EOTCeyECwwguVas2/WxHDcDCVhzTu1RUR1llnF+a6BWr
 tnCq8U1m3I3UsFYn1XzlVmbUgxSaM2SnHw==
X-Google-Smtp-Source: APXvYqyLjpVx2ol8AiHQuAtuxjQyU1nSiPHyDLXOeKhkW7sV6ELDQ2W3QmY62I2gspLZWnDZbgCZCw==
X-Received: by 2002:aa7:83ce:: with SMTP id j14mr17881639pfn.57.1553843308440; 
 Fri, 29 Mar 2019 00:08:28 -0700 (PDT)
Received: from localhost ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id i10sm1421927pgs.26.2019.03.29.00.08.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Mar 2019 00:08:27 -0700 (PDT)
Date: Fri, 29 Mar 2019 00:08:27 -0700 (PDT)
X-Google-Original-Date: Fri, 29 Mar 2019 00:08:19 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Fix FIXMAP_TOP to avoid overlap with VMALLOC area
In-Reply-To: <CAAhSdy2pqVS7LPfiaQzw90=kvaJDL63KbMXEiqHg_Raa_LiNxw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-e96d098b-3a74-4d5d-86f8-f46f2e81e5e2@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_000829_308176_26C375DA 
X-CRM114-Status: UNSURE (   9.41  )
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
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 28 Mar 2019 23:50:09 PDT (-0700), anup@brainfault.org wrote:
> Hi Palmer,
>
> On Fri, Mar 29, 2019 at 11:48 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Fri, 22 Mar 2019 06:25:09 PDT (-0700), Christoph Hellwig wrote:
>> > Looks good,
>> >
>> > Reviewed-by: Christoph Hellwig <hch@lst.de>
>>
>> Thanks.  I've added this to my fixes list for the next RC.
>
> I have another RC fix as well:
>
> "[PATCH v4] RISC-V: Always compile mm/init.c with cmodel=medany and notrace "
>
> https://patchwork.kernel.org/patch/10870605/

That one is already in:

    https://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git/log/?h=for-linus

I just didn't have time to get an actual PR together for the RC this week 
because I didn't get a chance to properly test everything.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
