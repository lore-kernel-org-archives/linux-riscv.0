Return-Path: <SRS0=MPT1=MN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B5EC43143
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Oct 2018 16:43:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC23421477
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Oct 2018 16:43:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XakMW2wG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NOp+V4Pt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC23421477
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=A9Xdub9jWX2MBhM138pxsfMaRcErckpkFAc0Ubi5gb0=; b=XakMW2wG9+XTzGOK3gRg7XpHF
	JBlxwVnMocg60D40vo24o5Rywm0Yb3rP9pNFUba+LCQcbhmadN+haWNpFRFbJ0rgWzB0UXZLEGhxs
	DsWtVh4ICePxGLJzw6fN76taB4Ho+5VVsAkoTFn6wJDEmIKsZ+FIldN+b8giD1m8DAUKORfWdcHiz
	FTh3BJwvVfh7zTG99KueI5MQRfKHTjl+iAccGDGoSIn8vedXW7+o6gQ0RmBYG9EWvOrqS5070K9QX
	STv/D9To+r+SM2+wLLvYuE/viM02oRGhdWODL9wDe/wtLAE4PcFTy+j7j6YGoiC+NWxCrtQJbGWH7
	k9Vs9IIIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g71Hf-0008Hs-Km; Mon, 01 Oct 2018 16:42:59 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g71HY-0008CR-FM
 for linux-riscv@lists.infradead.org; Mon, 01 Oct 2018 16:42:54 +0000
Received: by mail-pf1-x443.google.com with SMTP id b7-v6so9641833pfo.3
 for <linux-riscv@lists.infradead.org>; Mon, 01 Oct 2018 09:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=h3bEcrrSNY9f1REFsb0jumY0i0qy9sSG5USvLnAw73s=;
 b=NOp+V4PtclyvgDhPQW9NPO5Bq5ixy8wY+UjexDsznNmUWNdmuU+Xup+waWfeG8s2KU
 0zBXCBGXywCP1CkhqAdtzbPg5ljAJeXFgqw5+oEtpwDhqOLz1ZNE76gxQVJashBE+YrD
 la85iF5E+Xf8Ug7VpPIYBYddR+QO71B731X+/cXGiXxYTkkte6xQ4DWYSD891YWwzsXd
 NMUOpA4t9QPZLVqi1ePFmlZSRIT1iAc6eSTTphlFCCjtEtnc77O1e/sRRvOFbyUKGdNp
 9OaxRKVrK6+J2Xu4J1/qV8qAH130aHA+GNF34WY4jebKnmp187Bua0XAV34SAA37TYa7
 zBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=h3bEcrrSNY9f1REFsb0jumY0i0qy9sSG5USvLnAw73s=;
 b=LPqfIpzgy/snceTMxG+/1DjSCzp3JJzYijlwcAdSTARrV+zH/BknHoR950DE9GfpHC
 ALs/wT06FhJoIXxd7oyZJwKo6V9rODZ4MhNH7siT3mi93mguY58Wb2bybhAn7DeVkwOz
 ShOmgKrlbhpQRwfXBKal2vm5tTe5VoDtZ4fw7ExmHEVTfab2J27GbVa7Sd8Soi/300gI
 hC6z7BeFCh6vctwtvdek7iyKgrytyL5LCQKjDeOap/MJAOn3VvzvvQ2U0XBXpyjF4zJw
 bCpvRhWzc2r1FddgeSKkNb4pk0C1GOLF20Mw39/qStaJterc+MrOQIcqR3ExUP5TovG0
 I00A==
X-Gm-Message-State: ABuFfog2kRGTKdXn2C8v3YGQjLO8UcZ6QRuGz/5W8hBOVmb819cTdNe4
 g1Bi/6YNSIGpObVcDScu1nc4ng==
X-Google-Smtp-Source: ACcGV60OtZS93tI03Kl5kXcs4fazktBpuZrpI2z6q+7nHqo87BRF7aJr6+7a5GiBB8+Kh2yjTRO2WQ==
X-Received: by 2002:a17:902:f01:: with SMTP id
 1-v6mr12752281ply.8.1538412160897; 
 Mon, 01 Oct 2018 09:42:40 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a2-v6sm16322337pgc.68.2018.10.01.09.42.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Oct 2018 09:42:39 -0700 (PDT)
Date: Mon, 01 Oct 2018 09:42:39 -0700 (PDT)
X-Google-Original-Date: Mon, 01 Oct 2018 09:40:12 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Show CPU ID and Hart ID separately in
 /proc/cpuinfo
In-Reply-To: <CAAhSdy2gC15j9zW+_rjBQzofGyhBjcNVWSYCbBtrAmQtDogBqA@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-d37b6a32-c6d3-4736-80f4-cb814dde9fed@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181001_094252_555890_1E591A92 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181001164239.6UNUjM42rFg_EWjPAeXsYJCryg3m4frzIxrMU6uLsrE@z>

On Fri, 28 Sep 2018 23:12:47 PDT (-0700), anup@brainfault.org wrote:
> On Sat, Sep 29, 2018 at 7:16 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 12 Sep 2018 07:38:22 PDT (-0700), anup@brainfault.org wrote:
>> > Currently, /proc/cpuinfo show logical CPU ID as Hart ID which
>> > is in-correct. This patch shows CPU ID and Hart ID separately
>> > in /proc/cpuinfo using cpuid_to_hardid_map().
>> >
>> > With this patch, contents of /proc/cpuinfo looks as follows:
>> > cpu   : 0
>> > hart  : 1
>> > isa   : rv64imafdcsu
>> > mmu   : sv48
>> >
>> > cpu   : 1
>> > hart  : 0
>> > isa   : rv64imafdcsu
>> > mmu   : sv48
>> >
>> > cpu   : 2
>> > hart  : 3
>> > isa   : rv64imafdcsu
>> > mmu   : sv48
>> >
>> > cpu   : 3
>> > hart  : 2
>> > isa   : rv64imafdcsu
>> > mmu   : sv48
>> >
>> > Signed-off-by: Anup Patel <anup@brainfault.org>
>> > ---
>> >  arch/riscv/kernel/cpu.c | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>> > index f0f0ec2737b7..7c1342e242e6 100644
>> > --- a/arch/riscv/kernel/cpu.c
>> > +++ b/arch/riscv/kernel/cpu.c
>> > @@ -87,7 +87,8 @@ static int c_show(struct seq_file *m, void *v)
>> >                                                  NULL);
>> >       const char *compat, *isa, *mmu;
>> >
>> > -     seq_printf(m, "hart\t: %lu\n", cpu_id);
>> > +     seq_printf(m, "cpu\t: %lu\n", cpu_id);
>> > +     seq_printf(m, "hart\t: %lu\n", cpuid_to_hardid_map(cpu_id));
>> >       if (!of_property_read_string(node, "riscv,isa", &isa)
>> >           && isa[0] == 'r'
>> >           && isa[1] == 'v')
>>
>> I like this, but it doesn't appear to apply.  Do you mind sending something
>> against Linus' master?  Then I should be able to sort it out.
>>
>
> This patch is requires cpuid_to_hardid_map() added by Atish's
> patchset so I have requested Atish to make this patch part of
> his v6 patchset.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
