Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2253BCD343F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 00:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Unsb1AI0dlMuN1jO+cds1yIb64Ao87gAvS7PVNIXnPY=; b=PivmS3+5TywY854XvSYsw4xoqv
	T7nYsGBoBL4c2/WVgniD98SA7CLmUnMVVjZL1cdmCDXulzbq3iB5UOBicPm5jzSiAdHx0vKWY4GET
	nWMXuAAHIdsn0CqLkYUIGvI0U+xzrIh6QN7I/RyC7zNdd4kSnxelvveGO783JSOPGQGwDeI0Bf4oJ
	FAFECnp46J/ESSbijTID5QuNFpf6CJt4gkFVyqXFiktOid6a0sRBciAmclSw7kAyiACqJnljPTudo
	SgP15eJxTropOYKsr8lZMAfKeATLHC68i+SYAaW/FjeXpO7IDS2V7YLeB/UDPfTSWDa71GGEOqDcV
	B4+1SsrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMx4X-00000000kSA-3lUV;
	Wed, 13 May 2026 00:03:33 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMx4V-00000000kRJ-42Ti
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 00:03:33 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b4654f9bb6so65219375ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 May 2026 17:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778630610; x=1779235410; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DwPr9KzMTwvYnVjMUfpiwh1INt0dAKct26Q2oFZfRtE=;
        b=qDwY+sa4lQYK1dmMI2vJcSLA7ulITV7JH8GjOCiWnr16mgEerPRIl1pJccV0MWs3PH
         vyagQ5H1JidR5oyoess+8nlnKi7eo+9+8SLacXiSxPPvMiY4k+SN06qoK4gMBcyaPniy
         DeeVQSFKccEq/XxXCp8bX9Vj5gWoHthG0BsPPMEcIdwQ2BZYads+TrLKgur6lRJv+wjG
         U3BdnGchEIt8v69s91fvjdwbAi0FyzTxNqI66uWlOsYMLBqSmTMKRbTHaLN21CSAS610
         M7/xWilE24s0ztgU8TuYcZ1JSj1Plns+riFTcpMuKA6198JUWqTr8MaqcG87d9rw57ak
         sWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778630610; x=1779235410;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DwPr9KzMTwvYnVjMUfpiwh1INt0dAKct26Q2oFZfRtE=;
        b=A7E2lR7qTe0nkpchOLS10U3qg7IfwR12YapS2v5lLq5qYuB8B+RvXy/63Zf5GFFpWZ
         ZFbh+QuTEzOktlUpoxKmnU3eapOSvGxLv9Yb/vBY+eP6n0l/Bft6ouB23Cse2Pen+EYM
         cNqBtuFWIlFk3ikg/PUVAkif2d480vaHyytpaN8X2fbN43qjDuxpxDigIO6y59FpCiN3
         fWx4kT1a6ZADCPFnyjGGwE+oS3Giwg0CGPzL7i0x1SlNv/9SdMqqYBf6Whw/dUeDpwwD
         JT9S1N0BPj9jQ6DgEl9k80BVebitCV+XcLN1ZEG58lFOOVCLCZkzJf4Jcg60WMOFLfSu
         gA7w==
X-Gm-Message-State: AOJu0YyNvuFvYm+FShN2eMJU0A66E4pKwue4jthXmHZHLlxH7G1tAl4z
	O4hfh/dAGpm8vwypa4M7l9vv7kTyGFz+B7SsAp+QiQ7w1qEEApJPKWLC2Ix2ksCgGNaAiREHga6
	nRJV4pg==
X-Received: from plhs10.prod.google.com ([2002:a17:903:320a:b0:2bc:bb08:92dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3b8f:b0:2b4:5cb8:99eb
 with SMTP id d9443c01a7336-2bd276d98d1mr11087365ad.27.1778630609922; Tue, 12
 May 2026 17:03:29 -0700 (PDT)
Date: Tue, 12 May 2026 17:03:29 -0700
In-Reply-To: <202605111130.64BBUXDN013040@mse-fl2.zte.com.cn>
Mime-Version: 1.0
References: <202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn> <202605111130.64BBUXDN013040@mse-fl2.zte.com.cn>
Message-ID: <agO_0ejKd0x38_-E@google.com>
Subject: Re: [PATCH 1/3] KVM: selftests: Add unit to dirty_log_test
From: Sean Christopherson <seanjc@google.com>
To: wu.fei9@sanechips.com.cn
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, anup@brainfault.org, atish.patra@linux.dev, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	pbonzini@redhat.com, shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_170331_995237_28B87253 
X-CRM114-Status: GOOD (  11.91  )
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

On Mon, May 11, 2026, wu.fei9@sanechips.com.cn wrote:
> Currently dirty_log_test hardcodes usleep 1ms in each interval, which
> could be too short for guest to write and fault in enough pages, then
> there is less chance to test the write protection mechanism, especially
> in the case of (log_mode != LOG_MODE_DIRTY_RING).

But when log_mode != LOG_MODE_DIRTY_RING, the individual sleep time is largely
meaningless, because the test won't reap the bitmaps for iterations > 0.

			if (i && host_log_mode != LOG_MODE_DIRTY_RING)
				continue;

>
> Unit is introduced to replace the default 1ms if specified in command
> line. The following test can't trigger failure on my riscv vm:

Failure of what?  And does the failure really not reproduce with a higher interval?

> 
>   # ./dirty_log_test -m 21 -M clear-log
> 
> By enlarging unit, it fails every time:

"unit" is way too vague.   Even looking at the code, it's not clear to me what
you intended a "unit" to be.  I'm not entirely opposed to providing the user with
more control over the innards of the test, but the interface needs to be somewhat
intuitive.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
