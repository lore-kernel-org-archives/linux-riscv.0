Return-Path: <SRS0=DZC9=4U=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F31C3F2C6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2020 18:38:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3AEC20842
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2020 18:38:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RR8wsbhI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="E0P/BeRM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3AEC20842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ekzTDcHCRQhFhEYKFYf7vjPiVX/qteSf8RSTT6fWMV8=; b=RR8wsbhIh7zYnk
	03TM3jHv4vJqbIu4v7+CmHLkeQZC9RSGrqX7ZzIbsKES9nrI1CEc+/RsFmQfx9jqmiw+5FkTOQaHr
	+7zJp2He8PjhCnaRssT3TuCHv1SNHRtMpp8ZQ2eD0kolAW21YG09sAndCYJoIqo29C41kjQlqmV4b
	wjZ0pBCVSiP5AyM4YJQTuJ714dxqaFZj1UINZyRI9/0S1E7O2ES5pzq+/R4qgzlzVVxWNPCcUC/td
	fZ5dNKZFN7srd3i4QpeS6Bm2EfYiS0fqg239OUnjaRW2+5zPj41bJEf2O7mRWPNKfBPeRD4ukBIR0
	RBJ/eHWjy0VxI9bUyYQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9CRK-0000S3-2A; Tue, 03 Mar 2020 18:38:46 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9CRC-0000IT-NH
 for linux-riscv@lists.infradead.org; Tue, 03 Mar 2020 18:38:40 +0000
Received: by mail-pl1-x642.google.com with SMTP id t14so1708609plr.8
 for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2020 10:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ekzTDcHCRQhFhEYKFYf7vjPiVX/qteSf8RSTT6fWMV8=;
 b=E0P/BeRMMMFi9ySBFaXMuDeG0Zu3rfqTPBK4DDiNd1zMt/pXo37r4PmUZbaW9tPLNs
 Nx3WXiwPdCzB1b1+5xwZouOcnzW8V+51rujXxSUshyttDlaoPhZwV9HKU09ZscNHN4Cg
 NFSs6fn7jYsJra2ZPhfRfHHb/8V520YDgve1Q5X8YPWFQT9M/ELZrIaujG238PDxHJlC
 23NoijrCLARqwR0AGxicq5UQUW7C6ZwVJMVGucJ+YZkAz1c9MqCMYcZGFBH/StqbVAlN
 SQ4tDypULqp/YTKd2P8GVIwPQq+msow8IBM3hMWzidYlSfnnvAK/EbrQ+dUfSDH0v7Eb
 wR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ekzTDcHCRQhFhEYKFYf7vjPiVX/qteSf8RSTT6fWMV8=;
 b=YWvSVT2iyvGNm9isO44fWOVK4HIWy58oj6kQbLQvPF/KRhUNTe0gAT233wUW9/uqrZ
 TbVt+LfQSJAxyPPKKupmp+Tes6eOQHVCMmNPZ79pulb9FgHpTzhX70SNAL0fWFNYym1G
 REGrHZaYPHJIbvFe+2iW47Z9ZNzQp2E86gRnwjov/sAQ3M1aC7AkeUMBjwzGnkm26ZYT
 vtSazPwj8B6OmnQ2UNFpmCwdzR6DLuWtCoMo4Pb5DdtQXCSy/0o3xB7Oy2cXAi7Bq8MN
 sz93gZUT7cZuwKUs3ZEcZ+L3W4MTl/AqiVSSoChy9/fT204KNXasiIGG5oh3s7YqpP6N
 Ypgw==
X-Gm-Message-State: ANhLgQ1k61ykr4ytChIA5PpOTN2XHkAoRDkvbhTY93GcwcFWG9nfiuCN
 Q8OFczIyl+04HXEQYH/6wkynV2oiww4=
X-Google-Smtp-Source: ADFU+vuvDEeLJzmcNDm6nJHz+w5XGhtxGoDDZ0222x1MvF5aelTMwEJLft2q5BPD4BlAFW1AC6X0qg==
X-Received: by 2002:a17:90a:d98a:: with SMTP id
 d10mr5247716pjv.178.1583260717448; 
 Tue, 03 Mar 2020 10:38:37 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id z4sm23824824pfn.42.2020.03.03.10.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 10:38:37 -0800 (PST)
Date: Tue, 03 Mar 2020 10:38:37 -0800 (PST)
X-Google-Original-Date: Tue, 03 Mar 2020 10:38:28 PST (-0800)
Subject: Re: RISC-V: Fix the build on LLVM-based toolchains
In-Reply-To: <CAKwvOdkgpvxCfBQNDaaZ7BpGsQqwkoukp=nAUhnoLC_nZTR5gg@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <mhng-a55be814-523e-4aba-8b6d-f34d22eaee78@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_103838_792985_78728BC5 
X-CRM114-Status: GOOD (  20.21  )
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
Cc: clang-built-linux@googlegroups.com, linux-riscv@lists.infradead.org,
 kernel-team@android.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 28 Feb 2020 15:31:13 PST (-0800), Nick Desaulniers wrote:
> On Thu, Feb 27, 2020 at 1:35 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> The RISC-V LLVM port has progressed to the point where it should be able to use
>> it to compile Linux.  Unfortunately we ended up with a few GNU-isms in our port
>> so that doesn't work out of the box, but I don't think the code without them is
>> any uglier than the code with them so I'm happy to support both toolchains.
>> There are still some issues using the GNU assembler to compile clang's assembly
>> (at least got_pcrel_hi, but there may be others).  I'm going to call those
>> binutils bugs, though, and chase them around over there.
>>
>> While the first one could be considered a bug fix, I think the bug is unlikely
>> enough to manifst that I'm going to wait for the merge window for these.  I'm
>> going to preemptively drop them on for-next now, but as I haven't really
>> started building that branch they'll be rebased (my current plan is to start
>> taking 5.7 patches on top of rc4, as it seems like things are shaping up to be
>> fairly solid on our end).  If there are any comments I'll handle them as part
>> of the rebase, but I'd like the various autobuilders to start chewing on these.
>>
>> Unfortunately the kernel compiled with LLVM doesn't boot for me.
>
> Thanks for the series! In general, our approach for bringing various
> architectures online has been:
> 1. get it building
> 2. get it booting
> 3. get it running well
>
> For most architectures, 1 included 2 (per chance).  Mips was a notable
> case of 1 not including 2 due to undefined behavior we found and
> removed.  There's always a chance of compiler bugs, too. With the
> above series, we should now be able to start digging into 2.

Thanks!  LMK if you have any issues, but from looking at the bug it should be
fairly straight-forward: init isn't being run, returning some bogus error like
file not found.  I wouldn't be surprised if we had some undefined behavior
(maybe ubsan runs would be a good idea?), but I also wouldn't be surprised if
it's a compiler issue given that LLVM is pretty new and a lot of these bogus
error returns can come from reasonable backend bugs (shortcutting some type
conversion due to some instruction pattern issue, for example).

Hopefully it's just a small issue... :)

