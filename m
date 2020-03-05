Return-Path: <SRS0=aH+X=4W=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F48C3F2D1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2020 18:49:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4822720801
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2020 18:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yt01S24j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="eFhT6Jm9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4822720801
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=yeojKfs+DIF50e2z9lTK1rV3mSPm2muGlf6W6Jtrj1M=; b=Yt01S24jQBc4ut
	w/SIUQoV6h20J2lcbWkCcmniyLpa4NnqIiFvhtG1psCtx9kbkMIcJE03QEBZ/tkwfOaUCrRLsz9LY
	7+0XD31ywfy2C2RWkrkHOPtQAplMkgBqtqilUpAUbFA+H0BMVbVsm160T6/lbSipmlgHvCEWIUnoK
	kwZYMzKEZzmZwayQIDMyvlxkDdHoz4d22QPDxgEF8cmUNRVFeIhLI5g5fCf3ELhBz4dJcCgIbD47D
	dIhE3y8ulz57zvPKcXlxoE662jFT3hlGKLBVQqLEEU0gwnuGJnkIC0jbjkgDUxb8RrXu/4RQK34nT
	xjNjGqe6uI9SRnPJzpXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9vYb-00049u-43; Thu, 05 Mar 2020 18:49:17 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9vYY-000494-Px
 for linux-riscv@lists.infradead.org; Thu, 05 Mar 2020 18:49:16 +0000
Received: by mail-pf1-x444.google.com with SMTP id y21so3198156pfp.1
 for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2020 10:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=yeojKfs+DIF50e2z9lTK1rV3mSPm2muGlf6W6Jtrj1M=;
 b=eFhT6Jm9QiJjGvszIGgJU3LDtokueYoMPRdjkC4rIVdm766aIAyJLb1vBcI+JHOdd5
 TDvRUT3ondUtbv7qt7iVldnJYZSfv1SPjQm8Vwg/BIOnJMIq+AihYTSLfvrFNNNteFTr
 pfi2HIQxFdIUmP1WPSCTfwaoAAliKwqpbavd+Lar/l740YUkc0EPwWnDxzgFxH2UQv2P
 enk3Xqw22u979l+2jfKnx2CRF9++vHtbGLiKEsQXZDJpulzGfX/kYd56aZSsNCZNyHRI
 SeQD9vm79xLe55VAcChoYgtIXGIlupDEWzu4aB7itSqsVD/QfIVRPn8QDuaHHPacM1+E
 W8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=yeojKfs+DIF50e2z9lTK1rV3mSPm2muGlf6W6Jtrj1M=;
 b=TO1qc765Bk8vMfOWK/Me4673zO621fJH4H7sx/csvrzLaGQSGs7ZaOmxwbZ2Gnd46g
 WrVQ24vQXyxwTSJNyrWZyhzoPZeuN294ij5OoSvMQmKOLeUm6xzYvbbWzHRzJxWnGn+g
 S6x5fCKxPsRduaOwaHlKe6uPua81I++SkHF/FyXrnrfiBpn4vu0T5PV6WcC86LOALx/s
 MLqgvVQK9i/ybvLfBenXPc0SCJab8fxgd09r8tdEHhbk9dIYwqR8H1LsRBwVUIcDBKp3
 a6MIVlkUBUqN3LCGgx0zMqZgQ0h5Ki0+aYzKoQpsrUC7zOnVfoUpbwf0WO6cf/qDP3Yf
 iILA==
X-Gm-Message-State: ANhLgQ0HwtsxpRQTzh/ehAnErLn/OT18jf77CS6ATJmi+OeRpwT5NmTX
 SquZtgR8u8pN7xuX8Ww3yB8UOw==
X-Google-Smtp-Source: ADFU+vu71eFAcd4Zsz7IMC7zWPkXrM15Q1FhzsmI0GUizf4IaBEDEviTpSNDLaciV9H85v91pCe7Qw==
X-Received: by 2002:a62:3808:: with SMTP id f8mr9823447pfa.30.1583434150025;
 Thu, 05 Mar 2020 10:49:10 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id q30sm4159690pjh.5.2020.03.05.10.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 10:49:09 -0800 (PST)
Date: Thu, 05 Mar 2020 10:49:09 -0800 (PST)
X-Google-Original-Date: Thu, 05 Mar 2020 10:49:04 PST (-0800)
Subject: Re: [PATCH v2 0/4] QEMU Virt Machine Kconfig option
In-Reply-To: <CAAhSdy0=NHHVvJed733nK+FkprfQ5j7puw1RtsD3Xtg4s2vQjQ@mail.gmail.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: anup@brainfault.org
Message-ID: <mhng-fd0e8412-09d7-4662-aa90-c6ece9bf4b31@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_104914_868419_CFF36A27 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 18 Feb 2020 19:22:38 PST (-0800), anup@brainfault.org wrote:
> Hi Palmer,
>
> On Tue, Dec 3, 2019 at 9:19 AM Anup Patel <Anup.Patel@wdc.com> wrote:
>>
>> This patch series primarily adds QEMU Virt machine kconfig opiton and
>> does related RV32/RV64 defconfig updates.
>>
>> This series can be found in riscv_soc_virt_v2 branch at:
>> https//github.com/avpatel/linux.git
>
> The corresponding QEMU patches are now part of QEMU upstream
> master branch.
>
> Can you consider this series for Linux-5.6 ??

They're on fixes.

>
> Regards,
> Anup
>
>>
>> Changes since v1:
>>  - Fixed commit description in PATCH2
>>  - Rebased series on latest Linus's master branch at
>>    commit 76bb8b05960c3d1668e6bee7624ed886cbd135ba
>>
>> Anup Patel (4):
>>   RISC-V: Add kconfig option for QEMU virt machine
>>   RISC-V: Enable QEMU virt machine support in defconfigs
>>   RISC-V: Select SYSCON Reboot and Poweroff for QEMU virt machine
>>   RISC-V: Select Goldfish RTC driver for QEMU virt machine
>>
>>  arch/riscv/Kconfig.socs           | 24 ++++++++++++++++++++++++
>>  arch/riscv/configs/defconfig      | 17 +++--------------
>>  arch/riscv/configs/rv32_defconfig | 18 +++---------------
>>  3 files changed, 30 insertions(+), 29 deletions(-)
>>
>> --
>> 2.17.1
>>

