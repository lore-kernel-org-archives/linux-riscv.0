Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC73C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 04:05:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD08F2072E
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 04:05:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1fWOEvhW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="b1p8qScJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD08F2072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=/dbCJpy4hDidf2sbR0gnGwXDU2oHdtXsJqBaTKtVzXc=; b=1fWOEvhWygVaNwt/BFsstHdkh
	uCB/+ZYeDLuTeC3zn8CDiEu1m9F5XFPI/35mueuba8GQtQ3UwD4US7+dxGKLe+DmPWd8sHvergBRu
	8sPaaI0xE43PJEhBuJRC6andtwo6TDG0P1T4BOCXLCbwJKX7lhEhgv1Nmvpz2tq2vW35MgWo0CrM2
	CGkCPor9jqLqNWr8tzIyO0ECqFmTJP9dPq5PUltGz826PHQTxIxrRkFs4GRDmuGMMQWFrAGRqUPxU
	aXYN3yjy8yq7Qj/7ewgxcK0A27CJcFre29ELQ+6kX600Jv8KH4ln9FCiWkptncwwEgs98WaIr1MjM
	dextfTLOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxjWN-0004KH-RN; Tue, 21 Jul 2020 04:04:51 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxjWL-0004JQ-GE
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 04:04:50 +0000
Received: by mail-pg1-x543.google.com with SMTP id k27so11337074pgm.2
 for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2020 21:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8WVvQB40RK6deZ4Cy8t+mvWJCvDXakAnuO2sCFnXikw=;
 b=b1p8qScJ8GMb4ibmmM5cZtXTLkFKOD3JrCeBI1OZKIm858b3i43FB7wdkJwsC0b6NR
 iZBQBCgY9/ko7mN2IszymALJ/LJ5iXQkaE8iA01ymARxxPXFRDqEzyAS8iaE3B1eI0DX
 HTEB3LrHTCXWnXgP5O2rbjCnWowYP78cMmmCUSEfIA4712jGTww+BNEVuqSmfhzKJwMU
 0sf4DWKT0Jf+WaPh9UfcAr4/T7pNn2I2ehMEI9tI0+BLnIrOD8Qzu2NwPb/5AtEMyR54
 p6aSUNCweq1bhauXUf+xb1AOsUa5jrRQ1AAXIT34vapUZD7KNWrCRyCvRPnFtvPGYUEW
 IzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8WVvQB40RK6deZ4Cy8t+mvWJCvDXakAnuO2sCFnXikw=;
 b=lvRZEeCvSgRZ4bfOQmhgrhZoCJpn3+QoyNWBL2mBlnNsNu0s1PxY5GKoxC1TV95OpY
 HvPbr0UFFqOmWYA6/s+nQ+5c0PwoGID33jv2/apAdAK1pe7CXB+JjL8cLEYSlzkWgGGx
 rDm9cBwa1dISvSdLYuabbTxIMZl2DhLQTsAB17VhlOTBtbDF84DtwME8GS6aYoMnv1jx
 Od0ckHFgG1yRlltbYSDc1b52CKBlKHkOsfZtu/py6/a9eyumcE3MRsCpEhJZbfjTdT6k
 0Pr00nno0aXjoFk9tsk8yFXELTxHJe8oBAkk/I/GFN1R2Re9Zko7yhGqdg7vchSKbVsc
 yEoA==
X-Gm-Message-State: AOAM530bt94FOEbnUGMI9E4MX4FPYbiUMk67/VRhH1T9G6i+eFWgtovA
 XcI1dwfzGasaLmC0aeKU42Kouw==
X-Google-Smtp-Source: ABdhPJwcorN1zvHIybHoAI5GKQ95HluyT6lT3U/PXCFvcD8tDszHDeZN5LygqdAtDnq4WsM835oBHg==
X-Received: by 2002:a62:6047:: with SMTP id u68mr21561090pfb.238.1595304286185; 
 Mon, 20 Jul 2020 21:04:46 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r204sm18981148pfc.134.2020.07.20.21.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 21:04:45 -0700 (PDT)
Date: Mon, 20 Jul 2020 21:04:45 -0700 (PDT)
X-Google-Original-Date: Mon, 20 Jul 2020 21:04:43 PDT (-0700)
Subject: Re: [PATCH] riscv: Select ARCH_HAS_DEBUG_VM_PGTABLE
In-Reply-To: <0d7d0c38-5b67-1793-47d7-b8a7714838ee@arm.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anshuman.khandual@arm.com
Message-ID: <mhng-2f6b1241-9ab3-47a2-bc23-789d59a3fd8f@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_000449_588931_242B3747 
X-CRM114-Status: GOOD (  16.29  )
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
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@esmil.dk, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 14 Jul 2020 20:20:54 PDT (-0700), anshuman.khandual@arm.com wrote:
>
>
> On 07/15/2020 02:56 AM, Emil Renner Berthing wrote:
>> This allows the pgtable tests to be built.
>>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> ---
>>
>> The tests seem to succeed both in Qemu and on the HiFive Unleashed
>>
>> Both with and without the recent additions in
>> https://lore.kernel.org/linux-riscv/1594610587-4172-1-git-send-email-anshuman.khandual@arm.com/
>
> That's great, thanks for testing.

Actually, looking at this I'm not sure it actually helps us any.  This changes
the behavior of two functions.  Pulling out the relevant sections, I see:

unsigned int __sw_hweight32(unsigned int w)
{
#ifdef CONFIG_ARCH_HAS_FAST_MULTIPLIER
        w -= (w >> 1) & 0x55555555;
        w =  (w & 0x33333333) + ((w >> 2) & 0x33333333);
        w =  (w + (w >> 4)) & 0x0f0f0f0f;
        return (w * 0x01010101) >> 24;
#else
        unsigned int res = w - ((w >> 1) & 0x55555555);
        res = (res & 0x33333333) + ((res >> 2) & 0x33333333);
        res = (res + (res >> 4)) & 0x0F0F0F0F;
        res = res + (res >> 8);
        return (res + (res >> 16)) & 0x000000FF;
#endif
}

and

unsigned long memchr_inv(unsigned long value64)
{
#if defined(CONFIG_ARCH_HAS_FAST_MULTIPLIER) && BITS_PER_LONG == 64
        value64 *= 0x0101010101010101ULL;
#elif defined(CONFIG_ARCH_HAS_FAST_MULTIPLIER)
        value64 *= 0x01010101;
        value64 |= value64 << 32;
#else
        value64 |= value64 << 8;
        value64 |= value64 << 16;
        value64 |= value64 << 32;
#endif
	return value64;
}

GCC optimizer the multiplication out of the first one:

__sw_hweight32:
	li	a4,1431654400
	srliw	a5,a0,1
	addi	a4,a4,1365
	and	a5,a5,a4
	subw	a0,a0,a5
	li	a5,858992640
	srliw	a4,a0,2
	addi	a5,a5,819
	and	a0,a5,a0
	and	a5,a5,a4
	addw	a5,a0,a5
	srliw	a0,a5,4
	addw	a0,a0,a5
	li	a5,252645376
	addi	a5,a5,-241
	and	a5,a5,a0
	srliw	a0,a5,8
	addw	a5,a0,a5
	srliw	a0,a5,16
	addw	a0,a0,a5
	andi	a0,a0,0xff
	ret

__sw_hweight32:
	li	a5,1431654400
	srliw	a4,a0,1
	addi	a5,a5,1365
	and	a5,a5,a4
	subw	a0,a0,a5
	li	a5,858992640
	srliw	a4,a0,2
	addi	a5,a5,819
	and	a0,a5,a0
	and	a5,a5,a4
	addw	a5,a0,a5
	srliw	a0,a5,4
	addw	a5,a0,a5
	li	a0,252645376
	addi	a0,a0,-241
	and	a5,a0,a5
	slliw	a0,a5,8
	addw	a0,a0,a5
	slliw	a5,a0,16
	addw	a0,a0,a5
	srliw	a0,a0,24
	ret

so that doesn't matter.  The second one is really a wash: 

memchr_inv:
	ld	a5,.LC0
	mul	a0,a0,a5
	ret
.rodata
.LC0:
	.dword	72340172838076673

vs

memchr_inv:
	slli	a5,a0,8
	or	a5,a5,a0
	slli	a0,a5,16
	or	a0,a0,a5
	slli	a5,a0,32
	or	a0,a5,a0
	ret

It's unlikely that load ends up relaxed, so it's going to be two instructions.
That means we have 4 cycles to forward the load and multiply, for a cache hit.
IIRC the multiplier on the existing hardware isn't that fast -- GCC lists it as
imul as 10 cycles, but I remember it being more like 5 so that might just be an
architecture-inaccurate tuning in the generic pipeline model.  This is out of
the inner loop, so it's probably not all that important anyway.  The result
isn't used for a while so on a bigger machine it's probably worth picking the
smaller code path, but it seems like a very small thing to optimize for either
way.

I'm actually a bit surprised about this.  Do you have benchmarks that indicate
ARCH_HAS_FAST_MULTIPLIER is actually faster?  Otherwise I guess I'm going to
reject this, as it's really more
ARCH_HAS_FAST_MULTIPLIER_AND_FAST_LARGE_CONSTANTS than just
ARCH_HAS_FAST_MULTIPLIER.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
