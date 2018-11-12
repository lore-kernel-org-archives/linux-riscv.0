Return-Path: <SRS0=EHGE=NX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91508C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 17:02:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 648D522419
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 17:02:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TM0jzGWU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gQG5XWPr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 648D522419
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=mQf/Jebd9LX1x26SYf0JoR9XIT+WYZ4SF2lA/PXwNRM=; b=TM0jzGWUnEKrOXvqAkAnC0844
	uewHpd/4dO78LFreN9rxlAy8fxANn06fjlEUDsl62BZtt8eGir7K7zxBEN+TLE9oIkzB0Cft4RmQn
	iGwyCXuiQNHXK4JLIsKsR+mRbX/rnzUGFgIm0qrkfN6YtDye8T6bl2ipeGiCiMZRmTFUwZOJ5OB5z
	hDqRXikbnP/DkmGfxtt4GieAbO7L0gD9g/wvZuwmeA8Lw1ma0gDltNO1/uRv6VGR3Ks+EIP3wf+Po
	WFHqSx7I2HKGlWbinKQ8LJcxFEkViYrWXR5m6jm4/KM0WpAH9yUfLGJ3KcgzBmSFaI3WOTxxxQQSv
	ZDl70Vt5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMFbD-0001MT-Kz; Mon, 12 Nov 2018 17:02:07 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMFb0-0001LI-Ph
 for linux-riscv@lists.infradead.org; Mon, 12 Nov 2018 17:02:06 +0000
Received: by mail-pg1-x544.google.com with SMTP id z11so1698518pgu.0
 for <linux-riscv@lists.infradead.org>; Mon, 12 Nov 2018 09:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=FlIKg5lhT269jOPYhE3sQoXCF9ftbT13Wqnr++tZwcA=;
 b=gQG5XWPrG3VCOI7EVo5Vbb8aIjHZJwbapTdR73lfiuwzckUzbk4PZnoCL8Ny9yCCFJ
 TJPQkurlv5tjnWsQ9mECVHFY043CiznhE4vhCHckWf32mNI0na7P3Hy6lP6kBPflMFsX
 wB/V8pNXMAJuKMaWEAlFw0Cb5nxVePnXPRS8tKcpSafRMGq73rUaKCxiH2zBnoopSjjd
 IdHU92PFJkKz22eDytdpCpktl1oe+w8igXqTYIVHvPGXYmPGC0R7EZjFPLDouHDD5QCh
 AvDHByNlBDgHu23cteCrs8xJscXVFkXu30GP9rxMAY3oExBy10SH3QbMZIrX6jiM76Yp
 qllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=FlIKg5lhT269jOPYhE3sQoXCF9ftbT13Wqnr++tZwcA=;
 b=RKzEGE2HEautzswDWCUPb5xQ9vps+dxHEH94Le3P/CZCDf/SLm1gPga83r489hHhkh
 wtei5RXHyQFG3QInP5FQ8UcfE9223ZxrUsAG+NMgqyt+tUnJ1SBseJ2kiXC2udBV/Hx4
 rtv5XjLPE/xc0JlWC+uwOp30tJ3+jJvpN0RrT9rrdVuQL+HQ8EJIDhN4GnAhAnixHIoA
 PTrqw0HspVdn1lrEjHqC7OXJUULLJeMVxvMP6BJny55QPT4hSH1VnbY9V5uaEh6Rnys1
 HyFz2BalxBqSc1SreeaTcAMeHlkAYMcAu0qlxIkbzEPPxt4RtLRePXta6K0IWdc5NBnu
 2cag==
X-Gm-Message-State: AGRZ1gIvdY9UUih77DYLQQhuFIf01Diiq5qX+VN2imqHcFq5aUW2xC+H
 UdL4qJcAuwcc7EeuRsKKZg5AbUV/qsQ=
X-Google-Smtp-Source: AJdET5eGGOE9AhUIv8hr9TSusDVXZYrNFlD4N5vjO5tKj4SntibiuSoHH7KOMLhzS1AvlXdjhhuQlg==
X-Received: by 2002:a63:7044:: with SMTP id a4mr1442956pgn.359.1542042104144; 
 Mon, 12 Nov 2018 09:01:44 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id l72-v6sm20339328pfi.149.2018.11.12.09.01.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Nov 2018 09:01:43 -0800 (PST)
Date: Mon, 12 Nov 2018 09:01:43 -0800 (PST)
X-Google-Original-Date: Mon, 12 Nov 2018 08:27:32 PST (-0800)
Subject: Re: [PATCH 1/2] RISC-V: Request stat64 on RV32
In-Reply-To: <CAEn-LTpXnzSG-rVVvv_2cbxqY2vTchOKn6M0isRBovoq4jpZGw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: david.abdurachmanov@gmail.com
Message-ID: <mhng-63079855-2270-4a5b-bde6-82a13f29230a@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181112_090155_789010_10973F7D 
X-CRM114-Status: GOOD (  16.43  )
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
Cc: marcin.juszkiewicz@linaro.org, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, zongbox@gmail.com, linux-kernel@vger.kernel.org,
 zong@andestech.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181112170143.-NCl71ICWI1ElIsOEiq1BnQQUl2uZy_LAo2mWxDo2ZU@z>

On Sun, 11 Nov 2018 22:19:02 PST (-0800), david.abdurachmanov@gmail.com wrote:
> On Mon, Nov 12, 2018 at 5:10 AM Zong Li <zongbox@gmail.com> wrote:
>>
>> The stat64 family that is used on 32-bit architectures to replace
>> newstat.
>>
>> Since commit 67314ec7b0250290cc85eaa7a2f88a8ddb9e8547 ("RISC-V: Request
>> newstat syscalls"), the RV32 build fail with undeclared 'sys_fstatat64'
>>
>> Signed-off-by: Zong Li <zong@andestech.com>
>> ---
>>  arch/riscv/include/asm/unistd.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
>> index eff7aa9..a4aade9 100644
>> --- a/arch/riscv/include/asm/unistd.h
>> +++ b/arch/riscv/include/asm/unistd.h
>> @@ -18,5 +18,6 @@
>>
>>  #define __ARCH_WANT_NEW_STAT
>>  #define __ARCH_WANT_SYS_CLONE
>> +#define __ARCH_WANT_STAT64
>>  #include <uapi/asm/unistd.h>
>>  #include <uapi/asm/syscalls.h>
>> --
>
> See: http://lists.infradead.org/pipermail/linux-riscv/2018-November/002087.html
>
> The plan is not to have old stat syscalls and support statx on
> riscv32, which is y2038 safe.
>
> The issue you see is a bug in include/uapi/asm-generic/unistd.h.
> Marcin (CC) already sent a patch to Arnd (CC) IIRC. Basically without
> __ARCH_WANT_NEW_STAT or __ARCH_WANT_STAT64 two macros are not defined:
> __NR3264_fstatat and __NR3264_fstat. Which is later used (without any
> guards):
>
> 763 #define __NR_newfstatat __NR3264_fstatat
> 764 #define __NR_fstat __NR3264_fstat

I agree.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
