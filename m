Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA05DCC6B2C
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 20:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkEFTsgfwDgfyaIZVE/aQnjJkOme5R/ojB7idd5AqEY=; b=0YaYOhCw1FIK5T
	Jt2pWxCBmGpOZR2AgpvhPd6MZn0Jx3YTz5rA3buFcxvr73IsW/3kABJGhJVkW4R/TuVZRGBDLETg0
	QziVVDQZmyeqyO5014arM2UJvZmIDrn0Q6yAp3kbPlOT6oGPsFPLIkREYeCknFsIQ8YOOpWIqa4EW
	4K6G1d8HYBT4PGPM1bNb0MqUzJqWCZl5/Hw/oKglHQeWVs/X5uOCBvSQ6b7CB5ZOKP6/AcSmRerQP
	m64iRejv1xCfMucLbXGnCMWDtcCE+23Zge4aqqRe43i34XQcdO6sy+bFlKvBUgpCh1+7VE9OVOxn/
	w0gwkJLeUgOg7jnPBacQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5lV-0000000GHWd-149w;
	Wed, 14 Oct 2026 20:39:57 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5lQ-0000000GHTx-2sHK
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 20:39:55 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-91b54d1e9cdso7415296d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 13:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792010391; cv=none;
        d=google.com; s=arc-20260327;
        b=oPzBkVblVW0Arn8+8cvV0KPS30IbW+pKpUC2ko5OVIavvZnVyxA5XKmHwPC1wdt0OT
         B7tQInLG8cVFUjBa1FKbBIOacAu9cS6jWj1b4EkGPW78z5+SdOLuNjW1Iq//jtV5eivj
         iUh+/mbMBxqKejYqVWUhVJIO/fZF7qblRmj/TIN+4+wY6ua1Ao9fAKeI47fZWBQF/rfW
         h91wMKfpSR3eic78MywuHYU+CE50cj2sPRwLSMJcA4+4SGP3KE4Qic5qsvkDWQLec6ox
         QU/r7zgivLqug1yXz08MjPADmWLfACopW94vszkgHQc+SexcmJCA1zVeQdUpGLo76jUA
         NevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Hvbv4h83/gh3e9PL4i/Jed17SUFA0/98By/JOQOBZh0=;
        fh=RbiTCXsbHhM/XPMJKEiRjVwhbZd/qVzeZhkd6OT0Eeg=;
        b=CwP2Qg+/tMExqAqoZb3c5vs/DhXkBWF6ZQln1DGhbzmz+KUsbEgox4J5ywUBXCW1Ws
         LSpyH+b8M3FpOU0XRxqUp0w3F9OA3BGOxJrdgvEvgwCUH3NDvV5ZIFHKSVh7kXEBPuvW
         p7m+MacWyyKmjmbZr9Hhkmk87g2k0Y2LGFTfJrt9Wy28yQSKSHuzURD4JvZTxjfEtELv
         AOZ7g7BkTTIkqAK/CGHELWsbZ6XXbzIyQ0K0Tq0rXNIuk/QAmy73elhZD264VCsZ5QRh
         kYFAwKejtg+zY56wxDIvtAWrZ9ZJwOMHWGzmIXwAnFos0YWdWICp1EsaIpHcxyFJgMG7
         is3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=genproof-com.20251104.gappssmtp.com; s=20251104; t=1792010391; x=1792615191; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hvbv4h83/gh3e9PL4i/Jed17SUFA0/98By/JOQOBZh0=;
        b=mAJYzC8wBULiwDaVXouqhQwe4u+uQ4+XwXjhTS3QUkpxI9NQOjBCrv5omFfx0ausR5
         sf9QGStuNv8cvfFUeuVzKgfdjrgbVrQbCnZ1JYGemUdwc2UJH/f/Ojt3UtOBq/Nalr/f
         H92vJ6eHDXPM/vfTh6/svTKhMYvf3ZlQwnZFSKpILJfpVH5M7Xs5mPHx67m2VapPb7pK
         N5RjgjeMUnjQP3K9YLhg0yGG59Q4k+FZOAV5zDJLkp4z4IbPv5jeSVseluyM7wrWXJp/
         pI/BUcvWls1MmVkuOMQdfHhRV0RIocuTecj5kjK5sGcepKuyCk4yFrrjl63yyi3dkEzr
         VcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792010391; x=1792615191;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hvbv4h83/gh3e9PL4i/Jed17SUFA0/98By/JOQOBZh0=;
        b=vGFnH3gVQToJQ4YcR0Ijw9GxZ9NzlK5bY0XZSkmkrQxXxWdtugkv4gkaBXXS4r2iS7
         rUFYfEbvqWsYbVBIhDnTwPBrIzrCMexPt86/+fr0q6Z0Sw3zIePl0czz7KT65ZQXv9ta
         o/w9OyL8FXgkyWkE6+dG1/FpRiDuL0/dcXv0isUgRGa1fov7k4don4dI0zzs0zP+lyX9
         nbkBJUc3v22bSL/0XikssNCwemmA6tLUdCTA9QPUBL9uxdjVa3qF+m6Clm4eVP26YnJ8
         Y5aCdk4BKYKYMhSVSA8U9RcYRYbfEC/hc3aGP2xmOjByeMyZR5dPE3+kB6rXv3ap+kDp
         rdUA==
X-Forwarded-Encrypted: i=1; AKwUvBy6H1OGHf/niq+9QHcLTtrYNfvySbMxId5obHAR/7qPIkMeSfRFl83xWELjMDyWUpZkdeNco/Jeh9p8Cg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLrxVQ7lJtDtaOu+U6Jn8f+fo0ZiFCyT4NpAKggxPUgZUULez4O
	G3pUx76UpxVck4lX5une7HMlxq1Q2gqKbYSYNjDIM3P+Gk4JRPEjini1Prelq05pwShsW3gbWNF
	YyBKKnKMreXJCFvC2b7TGlKwZCIGfyeNph2psVKDiiRA=
X-Gm-Gg: AYBFou2qVUtBoF2z0KT/7MYHqDX1vHAAgjmrCcDFEY+vXDaz/2Tw8xKsf8oKfWrtUzl
	AAAFnwGGNz9MgXn7bzUbTy5QcGqaCBr5tBHrs3gpzLcOL200Lv7w+syVyL7SQiH6ijsTku4sPxs
	VBtkugX/0S3IqcVqTGpLm8l0q8Jg4dUOt+ieFggsaTxqFysM93aJeKz+HV5GJq2bGCVjOWxG26O
	jzk4UcBeN/QRZWAzhuCR3btMYXT8YHnzIyoq+KxNCIC+/51eEYN1Ru8dOXYPQzAi3CSVKrnFdov
	RGmJE8a53pC4A4GNhNOtvE2JVVFRNfJr+jpGSY87nD0Pd0mznODznd3YY43zhHCo4Q46Vm97uZi
	tcPpJWGX6WEHZ
X-Received: by 2002:a05:6214:5082:b0:91b:80ac:66ea with SMTP id
 6a1803df08f44-91b80ac67d2mr172010016d6.24.1792010390916; Wed, 14 Oct 2026
 13:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20261014152604.323310-1-ebiggers@kernel.org>
In-Reply-To: <20261014152604.323310-1-ebiggers@kernel.org>
From: Vladimir Kukharenko <vladimir@genproof.com>
Date: Wed, 14 Oct 2026 22:39:39 +0200
X-Gm-Features: AclHuK9hyj4qEGknIGYgSBtc9GBfZkkTP8Pl6YErh1Uue02KgFYR-0JbdSeWHNE
Message-ID: <CABB2QaKKvuTFt5fHa6+=n3siom4TFYCqZ67bcHyHTrD+PogojA@mail.gmail.com>
Subject: Re: [PATCH 0/2] lib/crypto: Use size_t lengths for Poly1305 and ChaCha
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_133952_914303_3B405CCB 
X-CRM114-Status: GOOD (  10.18  )
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

Hi Eric,

Sorry for not replying to your question on v1. I was already reworking
the series in that direction and should have told you.

Thanks for doing this. I tested your two patches with the lib/crypto
KUnit tests in QEMU on x86_64, i386, arm, arm64, powerpc64le, riscv64,
mips, mips64, s390x and UML, plus temporary tests with buffers over
2 GiB and 4 GiB. Everything passed, except for two things that fail the
same way without your patches: the POWER10 Poly1305 interrupt context
tests (I force-enabled that code, which depends on BROKEN), and two
Poly1305 tests that crash under QEMU with AVX2 because of a QEMU bug.

Tested-by: Vladimir Kukharenko <vladimir@genproof.com>

One gap remains on 32-bit arm and MIPS: the ChaCha assembly there
treats the length as signed, and size_t is 32 bits, so lengths of 2 GiB
or more are still handled incorrectly. On a Cortex-A7, which always
uses the scalar code, a 2 GiB + 4101 byte in-place chacha20_crypt()
changed only one byte.

As a suggestion, I've sent two small fixes on top of your series:

- arm: use unsigned conditions in chacha-scalar-core.S, and
  DIV_ROUND_UP_POW2() for the block count, since DIV_ROUND_UP() wraps
  above 0xffffffc0.
- MIPS: the partial block code also relies on the sign of the remaining
  length, so a small C chacha_crypt_arch() passes the assembly at most
  1 GiB at a time.

Feel free to fold them into your series or handle it differently.

Thanks,
Vladimir Kukharenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
