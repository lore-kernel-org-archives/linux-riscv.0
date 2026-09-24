Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DF9C98310
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 06:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/QJaySbT+PyJhHBKKyf4wbufme2IqoXYk+0kYyODvM=; b=t/dPljmgbQC5gm
	oRo0rRpPpdKi5KAIYvcxtpG84SHObXVWd+v0gHRl/p95v70RF67JC5eB3lC64bAisU9MwnkxYifmW
	MQg0ryeJAOtkxtSfRmbtDuRJ2HEFCLrEclbRixrZVUF6Neou21j41A+PV5IdQQR5LXADO6V3DoNtb
	6jbItm6Hh/eLQnVxrAvhOe3RNnnFexiyH1QyNxlcpx74uB5ifISseHNbcKXRgAlDY9UWwdvO2QW+E
	ad1tEeqVU8tVnA1i28JEjclCnCAEZ0fyFizrXmlUIsGM5xtRL1os8DoO1Yo4PfC9qWDnAWsnSbnhk
	tKaZcetAQXbw42IiU2DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cjn-0000000A8It-48cG;
	Thu, 24 Sep 2026 06:15:20 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cjk-0000000A8I9-3kzK
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 06:15:18 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4885a1480a2so949182f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 23:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790230514; x=1790835314; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GvG+xICcIhp80On27TXTR8cz9U1ZiIOla7jNxC4PfgM=;
        b=VehhITVjo3bfg03oTB84zH6yt2ISOXajOzZ16DlZNRTuYUClGb22OgvndmZhOzarho
         ThgUPpG/AIJPAwMhtoYepZGsHSEUsPxeHaTeqKcoGNLCBu8FfAR+soPze2pbsQHYhX/w
         eODZJl7E0eGQKQnFiVgBhBvefw4yCCAQKTjXt89GduSVcvDmndB0Id3PCR6zSxzB2WSy
         ySYI8gxf5fzqENps8DWNMgqnUUKihnUoJQwCD94hiczzVvPMPHjMcKUA08SI1A+Dmuz3
         94m+2SaJN3ElZpGBZmAK7OLTRgKMLmpv97fZLMbEVERSNkYvIcg/hqFxyv1S40gwqrt2
         NCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230514; x=1790835314;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvG+xICcIhp80On27TXTR8cz9U1ZiIOla7jNxC4PfgM=;
        b=yg7Rs6SBT5F/ns3oHrFNIV80/arSMGvQ6j1CaDdITEE++R0cvcwyh+6OxdHCEGqhxr
         4BzPQNLLokib3AL6SHchqrJmV0AfmMAMX1qVQxi9iJ06ry5ZHK5Ga5k2R8AoyHYMTax6
         7LDb2nCO+gC1+ZH23vvfVz8DthwtwVrVe4nK8m0A0Eu34M/YsVViQzsGMcpgghws/fr+
         iJ0tzhg+Rxfjx9faMzM1yuFQ27EL7WQ8qmlke3fWEIgov4KwrbZgNFCr+2Ltj/N+1HpN
         iuqBSLb6VK7z0nEF7aamA7V6/ct21SjPKAPAMUQi7wK/CDMIvtCwzl+2E1d34RVNdDfz
         gvfA==
X-Forwarded-Encrypted: i=1; AKwUvBy2PtJr750aRTee3zl0Yk/wXVYGNqt0B1t8j9QdlYirf3ue9umosiMFUMeneGDcTLsyQSKbA5dk6Fm3ew==@lists.infradead.org
X-Gm-Message-State: AFuF++kPg9oYYO3teib7OylTLUofYGOs8ZU1j8llFgYIXAQyUV+HetRW
	WpOcDj0D5qlk1JDLo9PKSoh7bUFtTYnzJtxoO53/j21fwtWV3u8HJ3Pq
X-Gm-Gg: AYBFou33gAMYuyw16kelOCDhTHocDMndrs9ZCb9j8rqBZ1A56HZZZNFl8xvQ+EiKQpQ
	HtY98PGtlIQXL84Faajkw1B+eD8nZVTzylai20X8uPrarYdjO9brqviOeDw0AgUO0VSkt4QC7IN
	4e0IuYqc7CgFBMGqEbdC8PsZnLaUqhp5qFPDgzYX9IeYT3cti6H91pRonbNi5QGZkTy19CpnDfX
	61gcH8sXiVefph3BlupkjvI/iekxKt1aVI9O8bl+S+fWwcoUS1jhSsvkn9obWs03p44uohUMIkU
	PXQ4AkYKbzMYAtHLFfJXQVU2UoYGNgfIgq8s3vEoLIrl2KT0nwo/szeedEG+20rrTkkpERxEN8l
	zm40qE6na58nmq0coWcRwt6PTKdHFNXVBICxeAT0qIkuYZSa3v3sEouSJ40jFAPG4KJd2+7BHdN
	/j6YuXUkW3PKs+yJaF+W5Wp4H2O1SXWWY6lqKsS0V6zLSZz1oNFxnqeCI8IeAfXi8VlGs3IErRa
	cpG3wjPi/N/AzYTzIsE5uSGEDcbkB0ORtEaZ+dgBjbuKyholomobzLkRR+2mO1/gOF1BkUtg7J9
	TwmJvByeW9m8YXOdEsP6GFdir1W7Cjlvg/aey0vMN3EC2N35JX9ga5nJJ9i0uIGn/WvFAceW3kB
	obD0oBy3zqzLVwaJDmHZJoQ==
X-Received: by 2002:a05:6000:430b:b0:486:e2e8:bda0 with SMTP id ffacd0b85a97d-4887171065fmr2543898f8f.46.1790230514075;
        Wed, 23 Sep 2026 23:15:14 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-adbf-6901-6c54-85ea-c6d5-a48d.310.pool.telefonica.de. [2a02:3100:adbf:6901:6c54:85ea:c6d5:a48d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889130sm11723684f8f.37.2026.09.23.23.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:15:13 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:15:11 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Andy Chiu <tchiu@tenstorrent.com>, spacemit@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
Message-ID: <arS-yYLK8Df5knSE@gmail.com>
References: <apSYF5x1Tu7PlyL1@aurel32.net>
 <ap-SIQ9DLt-CfAx6@aurel32.net>
 <aqGNGp8PInSV4vty@aurel32.net>
 <arL0QBe_XYLO8Yy7@Tao-Chiu's-Mac>
 <arSshYwcyHjC2dh3@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arSshYwcyHjC2dh3@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_231516_985027_72F4331A 
X-CRM114-Status: GOOD (  13.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 24, 2026 at 06:52:21AM +0100, Aurelien Jarno wrote:
> Thanks for your feedback. Note that at this stage I have not been able 
> to reproduce the issue with QEMU. I guess it's very timing dependent, 
> also I am not sure if QEMU simulates partially executed instructions 
> (outside of page faults).
> 

Hello Aurelien, Andy,

I tested this with a local TCG diagnostic change. It did not reproduce
the K1 failure, but it answers the partial-instruction question.

My LLM agent helped me running these tests.

In stock TCG at 7074591d7954, vle8.v can leave partial state on a memory
fault, but the vector helper runs atomically with respect to guest
interrupts [1,2]. Stock QEMU therefore cannot take an asynchronous
interrupt partway through this load.

In a bare-metal test at VLEN=256 and LMUL=8, a page fault after element
16 left vstart=16 and a snapshot containing 16 source bytes followed by
240 poison bytes. After the missing page was mapped, QEMU resumed the
load and completed the copy correctly.

I then added a hook to QEMU vector-load which performs 16 elements, sets
vstart=16, raises a timer interrupt, and resumes at the same vle8.v. The
bare-metal test completed 262,145 such restarts and 67,108,864 copied
bytes without a mismatch.

I also booted Linux 388b607d107c with:

  CONFIG_RISCV_ISA_V=y
  CONFIG_RISCV_ISA_V_UCOPY_THRESHOLD=1
  CONFIG_RISCV_ISA_V_PREEMPTIVE=n

With the hook restricted to S-mode loads with SUM and SIE set, a checked
pipe test completed 90,308,608 bytes across copy_from_user() and
copy_to_user(), including demand-faulting source and destination pages.
The hook logged at least 327,680 forced interruptions at vstart=16,
without a byte mismatch.

As a negative control, I made one load read 16 elements and then retire
as if all 256 had completed. That produced the 16-source/240-poison
signature in bare metal, and the Linux checker reported exactly 240
differing bytes. This is an injected symptom, but confirms that the test
detects the reported failure shape.

Correct QEMU fault recovery and forced interrupt restart therefore did
not produce the corruption. Reaching the 16/240 result required
deliberately modelling a load that completed early without a trap. That
fits the observed first load/store pair, but does not establish its
cause. Your IRQ-disabled result also makes a normal asynchronous restart
a poor fit.

The normal Linux load-fault path exits before vse8.v and falls back to
the scalar copy [3,4]. Do you have the original trap PC, cause and fault
address for the second-iteration fault? Those values could show whether
an unexpected synchronous trap is involved.

Thanks,
Karl

[1] https://gitlab.com/qemu-project/qemu/-/blob/7074591d7954876951f84c15b994a43251d5a3c1/target/riscv/tcg/vector_helper.c#L403
[2] https://gitlab.com/qemu-project/qemu/-/blob/7074591d7954876951f84c15b994a43251d5a3c1/accel/tcg/cpu-exec.c#L930
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/riscv/lib/uaccess_vector.S?h=v7.2#n38
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/riscv/lib/riscv_v_helpers.c?h=v7.2#n23

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
