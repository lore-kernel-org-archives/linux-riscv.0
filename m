Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7C6C4727D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 16:40:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80E7F2076E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 16:40:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XBkzXRWD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="l6LKrMfj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80E7F2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=TR2EWZJLFvHjQr1KoKp2iKJKNcam3FLcM1ThIubOd1s=; b=XBkzXRWDdYvCdnUUzuG/ZfyHS
	xuUvDkLLIrGnnss4t8ZMPqBfqd34w1zxbkDK3J5W3tWmtaJykgwsapOdGJip32poFDMpmJH8rPTen
	ahjMgm3A0XYP9jGNx91ixcseYMBACxVxiBKvsh0n+KnSKmjEsBymzPZG0WB63kphVHwFfn6yEsGT8
	os+RMIJUAJnyVA/1Qgi3s2wZ2YX0Tmb7UGBL/hAiZfhONxw3h6lrCEpGGwBxj2jRvDxzcR25VyL/R
	Ob59tk5+ijCPgnYQFTehGW9cvRI/84aAoxEGeY4repnUfhkjLAgAm8zSMJdXpuI/yChA0PkQwT1BJ
	4LHoDNmhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPTWm-0000x2-5B; Mon, 05 Oct 2020 16:39:56 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPTWk-0000wP-NN
 for linux-riscv@lists.infradead.org; Mon, 05 Oct 2020 16:39:55 +0000
Received: by mail-pf1-x442.google.com with SMTP id e10so6726227pfj.1
 for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2020 09:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=bgKuiZru+fzYOW+rknHpx1Qb/5rCkL8zdBgqBiopZMo=;
 b=l6LKrMfjBVohHwxF9jv9cqtVCwnHkEr5vlQIuvPbeEgaOLBzDUY+wRtP25s/t70Hhk
 5kWV73hIpokOwi1l3tHFPB2vRCReQJOQ4ip2SfbDgwGkEVVTeChIsI38ZzqFLsIBYJ54
 Co2LtOtfJKXU4ezUVwnCkRZlXHoLRNgYZANjYnRB2g2PAYqQGWe+iLcKStDvNMwo9wl4
 2IEPUjd/4a30CwRyaXqR5Y/7BZTsWDS/rqJ5l9ENklSFMXLNAF4CIFlDSZ3Q4xVN9M0O
 H3omOE7p1NxvhbLbxwFC1f0wKnxwTlqnG1HOfQuubft5h5kKaYf0aCI7hgPx+yG0l8YJ
 X32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=bgKuiZru+fzYOW+rknHpx1Qb/5rCkL8zdBgqBiopZMo=;
 b=Bq0nzhW5Kgl8eh5xqxvz00uIi3zkzEhArdb54PF1H/PRp5V4TxIm7RkZnKVnz4BOIP
 EOsbLND0YGXUV/uete/KLH1gIyjq/g/aJX0wKkKw0SdvA82IJUMRyw6BBh/AOIdoF/jw
 Hf617TgUc3kfj63xpJ3cK3WEB7TtFNYoob63Un3r1IZh/937MW8RMW3/G7jTBsn8TIST
 d0hJYaM/7Gi35mULEGWs9Q2vU53hOckZPNYewamhUeOabCX+dGJFoCTanMH9U3wea7On
 iH6R9dcAmXWswjNCwDLCStNMzxu2HtrML10lAAAcgmfHLB/7rgjm05isyjzpCOvAzc7b
 7ddg==
X-Gm-Message-State: AOAM530ovg+NpwSgDNtAItYnQJLeyxMtenrsQCKAXWw+xq/aUUgak241
 V1y04ZVfFwJmufw1gpbqYbaL0A==
X-Google-Smtp-Source: ABdhPJzscDCmybkxTYMeNPHRJvgED0ZxQ648JzxM13dAod0j3fjEo4NfbnuwNAzcN1JII0PYa0oCnw==
X-Received: by 2002:a05:6a00:1356:b029:13e:5203:fba3 with SMTP id
 k22-20020a056a001356b029013e5203fba3mr565585pfu.3.1601915992319; 
 Mon, 05 Oct 2020 09:39:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z9sm418686pfk.118.2020.10.05.09.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 09:39:51 -0700 (PDT)
Date: Mon, 05 Oct 2020 09:39:51 -0700 (PDT)
X-Google-Original-Date: Mon, 05 Oct 2020 09:39:45 PDT (-0700)
Subject: Re: [PATCH V2 1/3] riscv: Fixup static_obj() fail
In-Reply-To: <87lfglt6z1.fsf@igel.home>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-847e71cf-64bc-464b-8d09-3bcec40aa491@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_123954_780157_109669FB 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: tycho@tycho.ws, aou@eecs.berkeley.edu, nickhu@andestech.com,
 anup@brainfault.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 guoren@linux.alibaba.com, guoren@kernel.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 tglx@linutronix.de, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 05 Oct 2020 01:25:22 PDT (-0700), schwab@linux-m68k.org wrote:
> On Sep 14 2020, Aurelien Jarno wrote:
>
>> How should we proceed to get that fixed in time for 5.9? For the older
>> branches where it has been backported (so far 5.7 and 5.8), should we
>> just get that commit reverted instead?
>
> Why is this still broken?

Sorry, I hadn't seen this.  I'm not seeing a boot failure on 5.9-rc8 with just
CONFIG_HARDENED_USERCPOY=y in addition to defconfig (on QEMU, though I doubt
that's relevant here).  It looks like the fix is to essentially revert this,
which I'm fine with, but I'd prefer to have a failing test to make sure this
doesn't break again.

Guo: I don't see an actual patch (signed off and such) posted for this, do you
mind posting one?  Otherwise I'll take a crack at constructing the revert
myself.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
