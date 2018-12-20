Return-Path: <SRS0=M4pA=O5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8131EC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 21:33:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF93218FD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 21:33:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PRAUESe6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CKIvjp3U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BF93218FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ZoSEPIuZ0491Gpb0/164UVwEp+r3JhBw6Y8shO5I69g=; b=PRAUESe6fk4VgfdRJXfzhtJuK
	gr4U//M6iDOXIfSu5mvV74zNFswpuIO+E9nyiKRbp6jIr4OpoohqUbs46RFG9Rln9y2skvYTvoVD0
	OSMkbJSwlMvcmfZ+Fveq//1rZh3aFxJuldYE/PPF+B88fjPnriN3W/CWYx8pmkZWhcGpdx9QUgXDG
	DRsNa0N7B8bCLOmDMHl6TQQq9IspocXkovtJdjbtoPznAfZHV+gG5kKMLatjQwdSacajB7IcWrCbh
	SzLL9oHWiUMOJG49FgCPe9xuTIsxmGvO0ae5v+yYzQkV9Vf0AdPZoNgscbzlLNEBEX1tkUAKlIYdT
	AZWlrl5Jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ga5x6-0006T5-Ac; Thu, 20 Dec 2018 21:33:56 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga5x3-0006SB-1l
 for linux-riscv@lists.infradead.org; Thu, 20 Dec 2018 21:33:54 +0000
Received: by mail-qt1-x842.google.com with SMTP id i7so3492374qtj.10
 for <linux-riscv@lists.infradead.org>; Thu, 20 Dec 2018 13:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=/pQMD1awRfP4564a4AxtHG8XBVqj+1mvPxXIand51e4=;
 b=CKIvjp3UgnbhvWdLPpByuL6lTw4+DxyoGKg4ZtY8ra4+D1R8acRwBA7KUBgwdOulbz
 d2PAIyerNDpMcRqvQrOBMoabSsmj6aLHcK/RYK3tPf85CjREz0XtHhNYvtgaRoMEkQTk
 JBgyL2a9FBsg/Y79yg1y97I8Q9Z8d5X3P8DhQ4Ox1oM3WX5vz+R53sBvtk1HyoTv5in0
 ROBygXP9cxSfePKvS0FoVRfT8zuPQwTuM4th22x8/IcckI63pLGGu1bkFfkDqfZPYcpG
 yQgxhJuKttFDXSbwxJ/go5SO3aLYQWmPF+OG/BN9pEb181mLJYRNjONSAIkPT8wd1z0p
 ADPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/pQMD1awRfP4564a4AxtHG8XBVqj+1mvPxXIand51e4=;
 b=YKCqG+iEQqvdgfpLH8tgiochCKwiVJY2bQdw2wg6oVmu0L+fJU3IQFkkmH9AlEBmVv
 1ZzkOOQN+2S2Vdp6xx4X2k72mBw3xRq2k70/+MIRCmnvemJ+UE9f5lKxmqv9GPW5T4VO
 ubhtBJ0SUicR/KaC1WXjFBGpZvPYw5XjfmmnSMJ9oUeYXx/GFSWDF5OXzqggkpkJYUqW
 9tRU1BdD/bx9dsFe1ha22s19KQv0GO8oVcSu7jfy7T0vTHGT+pungL1zHRuEnvJQtkZM
 vpAauRtchyo/l70AggVk9DDBewPy9EyXAHr7qGRtXZMvhmBqPVuDmvQAaqf76WpSSvyS
 s2Qw==
X-Gm-Message-State: AA+aEWagwDWNfsaebGn8ggXQeKbq3RcaQfTveIcEpQL+5ad52zQ8GYpR
 vhdtbJatINBD62pvGUr29cIIYg==
X-Google-Smtp-Source: AFSGD/Vbfi4lAcGyflV1xjJmn82kIotXR4kUohW32YwO92lrHxalRjgswvcB2aX29x65ogB/7srTAw==
X-Received: by 2002:ac8:543:: with SMTP id c3mr28369299qth.34.1545341622042;
 Thu, 20 Dec 2018 13:33:42 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
 by smtp.gmail.com with ESMTPSA id u4sm3274189qkk.51.2018.12.20.13.33.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Dec 2018 13:33:41 -0800 (PST)
Date: Thu, 20 Dec 2018 13:33:41 -0800 (PST)
X-Google-Original-Date: Thu, 20 Dec 2018 13:25:09 PST (-0800)
Subject: Re: [PATCH] RISC-V: Add CONFIG_PREEMPT=y to defconfig
In-Reply-To: <20181220014511.GA24845@roeck-us.net>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux@roeck-us.net
Message-ID: <mhng-fb11c2f1-4631-40f8-ac44-5ee265cc7b89@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181220_133353_156637_62ECCCF9 
X-CRM114-Status: GOOD (  20.20  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 19 Dec 2018 17:45:11 PST (-0800), linux@roeck-us.net wrote:
> On Wed, Nov 21, 2018 at 10:58:05AM -0800, Palmer Dabbelt wrote:
>> I don't remember who suggested this, but I was talking to someone at
>> Plumbers about all the horrible bugs we've had lurking around in our
>> port despite it still getting to userspace and they suggested that I
>> enable CONFIG_PREEMPT in our defconfig as it'll help shake out more
>> issues.
>>
>> This patch enables CONFIG_PREEMPT in the single RISC-V defconfig.  It
>> still passes my tests (ie, booting Fedora on QEMU).  Maybe I'm too
>> paranoid, but I still don't trust our port enough to just pull the
>> trigger on this without at least accumulating some "Tested-by"s on it.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>
> I can only give you a
>
> Fails-miserably-for: Guenter Roeck <linux@roeck-us.net>

Ah, perfect -- I get a lot more worried when things like this pass then when 
they fail :)

> Not the new defconfig itself, but the new defconfig plus a variety of
> selftest options. I don't know what exactly is failing, but here is
> my list of enabled selftests on top of defconfig:
>
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
> CONFIG_CRC32_SELFTEST=y
> CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
> CONFIG_DEBUG_NMI_SELFTEST=y
> CONFIG_DEBUG_RODATA_TEST=y
> CONFIG_DEBUG_TLBFLUSH=y
> CONFIG_DMATEST=y
> CONFIG_GLOB_SELFTEST=y
> CONFIG_OF_UNITTEST=y
> CONFIG_PCI_EPF_TEST=y
> CONFIG_PCI_ENDPOINT_TEST=y
> CONFIG_PROVE_LOCKING=y
> CONFIG_PROVE_RCU=y
> CONFIG_RCU_EQS_DEBUG=y
> CONFIG_STATIC_KEYS_SELFTEST=y
> CONFIG_STRING_SELFTEST=y
> CONFIG_TEST_BITMAP=y
> CONFIG_TEST_FIRMWARE=y
> CONFIG_TEST_SORT=y
> CONFIG_TEST_SYSCTL=y
> CONFIG_TEST_UUID=y
> CONFIG_USB_TEST=y
> CONFIG_USB_EHSET_TEST_FIXTURE=y
> CONFIG_USB_LINK_LAYER_TEST=y
> CONFIG_WW_MUTEX_SELFTEST=y
> CONFIG_TORTURE_TEST=y
> CONFIG_LOCK_TORTURE_TEST=y
> CONFIG_RCU_TORTURE_TEST=y
> CONFIG_RBTREE_TEST=y
> CONFIG_INTERVAL_TREE_TEST=y
>
> Tests pass after disabling those tests (or after reverting your patch).

Great.  I'll take a look when I have time, and I definitely won't merge the 
patch.

Thanks for testing!

>
> Guenter
>
>> ---
>>  arch/riscv/configs/defconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>> index ef4f15df9adf..8869471af0fc 100644
>> --- a/arch/riscv/configs/defconfig
>> +++ b/arch/riscv/configs/defconfig
>> @@ -1,5 +1,6 @@
>>  CONFIG_SYSVIPC=y
>>  CONFIG_POSIX_MQUEUE=y
>> +CONFIG_PREEMPT=y
>>  CONFIG_IKCONFIG=y
>>  CONFIG_IKCONFIG_PROC=y
>>  CONFIG_CGROUPS=y
>> @@ -77,4 +78,3 @@ CONFIG_NFS_V4_2=y
>>  CONFIG_ROOT_NFS=y
>>  CONFIG_CRYPTO_USER_API_HASH=y
>>  CONFIG_PRINTK_TIME=y
>> -# CONFIG_RCU_TRACE is not set
>> --
>> 2.7.4

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
