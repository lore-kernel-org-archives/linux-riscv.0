Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00B0EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 17:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4yd2CeLaqzMHvByXOkOMtBemfMqVuz7d3WEM+47TCjw=; b=NRvBqrr7ymitIRGMfESRBpiMbZ
	/kIOcrjrmd8ZmAMNHV+00gmW5P22pruyAxipaWFoPmghqcM8GBtlsDJ1gSn+qsfWzxncg+cWgtHQv
	Lm78nSHbO6oA11XdZLEJI5DlFsQDKvFw4KvtG11w9ACCqvd0JtkuCFhK4ttRg7jAVuV8zghwOq92J
	YN59WrwQ9HLzNRyRvT23YQ0bZBf4r3k0FPnAImwbFzhf1jTm7C5K3cQUwV4G5mP3uqFrzLiw7e1Vb
	93dhz9xvcP71CE6TrHyHzGrQGwljvbHtk2FfQes2TXchjH8YDAsbWQG6AqPvkZw1fE/OeBFwgFKBp
	5GuQ2YSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHTBA-002LDS-2H;
	Thu, 06 Jul 2023 17:54:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHTB7-002LCk-23
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 17:54:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b8b2886364so6790515ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 10:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688666042; x=1691258042;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoVPXyFhrz/3tFpKkXUSfY4M9kkRLIo+4XP1uakSUOM=;
        b=OpFU5zPFIVD0nOdPs4XH232Kura7xkE64rObWZuzE14+dcFD8B3MvhT0uiQ0d4aePB
         piYrounSSBWmT1M342Vqz2X0j6DoCL0KXneg6QYugWb8JJvLUj/mfv86YuS320/HHlz5
         CgrsxMgrhHZSjujNtlI2fJb95wzS/Ab7baa/JR6I93egR87AKjX9uit62LkvW08hYnZK
         YWC0sYyUqpq65b4BJni/CHPH2eifa92XdifHFVyqQaNbswbYSTHzTxycwSqvCRWRx1dN
         hvsBbE2hqs9/RTz7H8FTs2GL4cbJmuS1fxtkFbUmTd+GBSZVdfMs18X4cyDtxhOaYsLL
         6ruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688666042; x=1691258042;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoVPXyFhrz/3tFpKkXUSfY4M9kkRLIo+4XP1uakSUOM=;
        b=HZC3cPEopavzwSU9/ofZXzMKN+71Absa65YUD1C/20tl3cnv6NKbS14sMOHbNoEJK9
         81b1qzPDZ3SQtmQMLVtau9C3Mm83VDcOWEljka9nmyxK51bZRgA464GOSmDhiKT1git4
         dxrDy/7L/W5mY2nViKVdu/acs8ILDd7HVkHtxa5Xv6WVn4JzeYLfnuTjZ6C3mbEAdxZy
         +czy7avsynGehzkFE2uXV+RTmjwjrEfdvxqEuVDFzjGJly7vCGF0QbXTv/9V13a5sNQb
         xQ+MUhRIGGN7ziUCBClUhIOFaCXy2Q/s6rw9yL60c8dLoojThQwxKtmhhyquXrKnk97e
         /SlA==
X-Gm-Message-State: ABy/qLbElWqCaOGNV6zTPQn99yB9NPhppTzFlPotzgWj/efhW2NOa7G/
	we09m9woWs0OQlPrWZrZBMWdzift/DYa7d14ZBQ=
X-Google-Smtp-Source: APBJJlGQZWtNBUHEncdAdMCdzEVKvIQHGX6BdbViZIEuUy+RMpaHeX6opM6pVMqJ8L/A3eQQEG/6bw==
X-Received: by 2002:a17:902:db10:b0:1b8:5bf5:543a with SMTP id m16-20020a170902db1000b001b85bf5543amr2189103plx.49.1688666042258;
        Thu, 06 Jul 2023 10:54:02 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n12-20020a1709026a8c00b001b6a27dff99sm1704998plk.159.2023.07.06.10.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 10:54:01 -0700 (PDT)
Date: Thu, 06 Jul 2023 10:54:01 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 10:53:16 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Provide a more helpful error message on invalid ISA strings
In-Reply-To: <20230706-acutely-undusted-940bf8afcdc2@spud>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-cdc3010a-7bfe-4d5b-befe-d89a0c2c19b3@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_105405_694742_247408DC 
X-CRM114-Status: GOOD (  16.19  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 06 Jul 2023 10:46:25 PDT (-0700), Conor Dooley wrote:
> On Thu, Jul 06, 2023 at 10:28:21AM -0700, Palmer Dabbelt wrote:
>> On Thu, 29 Jun 2023 16:17:27 PDT (-0700), Conor Dooley wrote:
>> > On Thu, Jun 29, 2023 at 03:35:03PM -0700, Palmer Dabbelt wrote:
>
>> > If you are gonna apply this for v6.5:
>> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> > Otherwise, can I take this in my series? I probably need to extend it a la:
>> 
>> I forgot about it and it looks like Drew pointed out some small issue.  Do
>> you want to just clean that up and pick it up with your series?
>
> Drew's issue was actually with the related error prints that I was
> adding, not with your patch. Your patch is still good on its own, but I
> am perfectly happy to put it in my series. (I already did...)

OK, works for me.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
