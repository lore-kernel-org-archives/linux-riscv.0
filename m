Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E92C5B572
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 06:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZYnybDixHAs0fDw/R/u6hIwnuPtBt1KundUFpqbbsR0=; b=ChR
	Mr+K9h1IDsfV8dh04uwOo1NbVeD4ippElxs3BovZ8v0Ewal0tsyptFOtsIgxlrNqjJz1MIzIPxCVG
	n2zUiyL/ojM2MnhxJRNBMidJMoZEt4ZAqVCpE/Jyc4XhfZF2FIX8BgwrxZ7j1hyzJAp7HCn8mKiHT
	RLrC3Wm03pWHUN7JR4U5CAYtJhC4t2grYPTXtWncDHvPPn8eKzlCgQ1/MHYKTQwWtLZfqReFtXNCS
	FAAAPiXTiCmWlfWpOQZT+rTOHoA0qaso7B7YK5frhl+5dKU9FVIjTVONmINJ4CkYqN2+3OwPGj5Ru
	jmKF+M29QiFqESw6zY/84gSrwwhvrAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxeuX-0000000EJRL-0mar;
	Sat, 22 Aug 2026 06:08:57 +0000
Received: from mail-ed2-x0a.google.com ([2a00:1450:4864:33::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxeuU-0000000EJR0-41Z8
	for linux-riscv@lists.infradead.org;
	Sat, 22 Aug 2026 06:08:56 +0000
Received: by mail-ed2-x0a.google.com with SMTP id 4fb4d7f45d1cf-6a14f2e937cso899590a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 23:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787378933; cv=none;
        d=google.com; s=arc-20260327;
        b=V1bOCcOqBHaHw24HsPsvWTZSv0NPDcOHnP61g+KkUIenLa3Zqs5UgRETkP/YTX2LWz
         OFyTPZYnQVSVgurvx7dEpYcYLbhDr9lamrkZdUoCua87BoKMutQ7wSkPXmlhY4cUEUDC
         cem+y3ZcKpIK3r3bICjZYQSEqkkjcG1Y7TuYta5EovUrkWd0WSy+0YPpsdhm/tt3VSgl
         +vk23X4MRlT93WhjQNYwQu3oWUvOq4QafO4AvuoRuHwZ/c2D2VhPd3+KpT3j6rGasdD1
         B2AHWeAJJS2gC/RD/a2q8Q2kbmToILGKyfbXlRI1YPOo9OQGnhgKIuNVaTHexRkTN6Oh
         EWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3MSpWqleVc+oTG1Z24e4udqd/mlnq4ZhRulqHsFjniQ=;
        fh=74Mq1Xx4STYqpqU1Ef/51O6BfKYnRl9S7UnEub4nl/w=;
        b=dZLeb/9sb6XFDgReixrETiqJd7HVuUFAKm2UjzYaTsk2dQmPXshaEMqkTLR+4NyEZA
         6ysIveNn8X6qDfOcKEB6iZJ3lxESphyRfPAeP3KUM6iVeUhYgmdE/KAPf8t0zwJ/j6ex
         FNbAmCc/dg/k+U0OOo0hTdfsE6JVuwrmKE409G7uymcqopytmts4eCY4e0lUwhk7uW8V
         rizCNnzSC2ROLgJ/W81+nARtVn3bCnRZBV1O+AkFK+hylEopwTcp2jaX02eRPquvKE/5
         qjaxAyK16merJIcugl1YeMFx9aHYxYnnIK6gAB/6TwPrM/CT41/UHst9z1rXbp4utDF1
         7xLA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787378933; x=1787983733; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3MSpWqleVc+oTG1Z24e4udqd/mlnq4ZhRulqHsFjniQ=;
        b=H1TfAYeST1zoIFAlQW51MEq5j32M9Ps6wLNSAhd8KT+mlIfhWnBmfuxVDb6jPDVrs1
         76Ct47yw8Ub3xlnzN6AJk0K9guDZN51kSUVaEhk3wBTTu7k1LAqF16/SVVDs2bGcr7pg
         7hFpX6i6f7MDyFJEKrXapX5twtAma52zrRH4xCeapFw//r5OiPsdLN3H4XiOvebnvI5P
         9fqvpHqrrji07aSO3g+glV1YUXB3WXEYeVZoJkPdZsiAjUJjMLF6npPAXlR9xvXgKYCv
         XOa8Oou9jHEDD1ePe3ut89ZCfdWFfiRitzqYJuR5uIOXQN/MFlwv9H8Z+mEmFrPGd1NZ
         XUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787378933; x=1787983733;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MSpWqleVc+oTG1Z24e4udqd/mlnq4ZhRulqHsFjniQ=;
        b=LTceaMGmjnk62JfJREexSoJHFkXSgHAkg1R/7mJv/EWnxCnFoSnqNWz0jx5auO/Y3h
         QvfTrjY8KQt+i4GUj30VGSAyp53DTMWNgtMiQdk7yMz2WVlWsog6GX+ob6UbC9nRtP/p
         O+iV/NTvTwA58LbPfT0wSbeki3/bbCdnT1psQbp4fLqLxEn5r2SLtpmzY3XwjTEMFoma
         vk/FBUpealVLDuoc3Fl6Qg5bC+P5U6qfZYSnldSy/VJzyZuox7TpsCJGhAuQrXCPkPZS
         aMMBEUpp2334IQf2AIjIoa+otqzqjOYAz/RwzQBVY0OAvoNuARfNywamLegYjiSOeJoD
         UDeg==
X-Gm-Message-State: AFuF++lUE8uBYR+vcqqEZlB0z4o3rGmPx+FiWjjhqwodSd2Cw0iVrWNl
	vKvHnF+miUuBLyRY3k2vFrwdPWwaQ/rVLcil4dEFbn5k5l8UlLgESLkmWVO7tSrULesGw7MJJes
	vrwg5nRYOVkfBiPGy13yzs2EeE5uy42bLk4eslD7wEA==
X-Gm-Gg: AR+sD10XYpKIU0fmFJG/D4NJhbAHIw3rybTh1buX6w5ws+F7eF62cAgjDrE4Cd9X5a0
	ZEKL5zzYw0Dhkiq9Z71rsOPHdJjqp+cCnRq7ULod9v54Uzwgvmyg5dxcmb7eusv2B9Qv9+ppR0O
	jBXAS+K/HL/h6OjMYwtW3WCp2mYfzAgZn1lY9biaT1ZydtX1IxrhVXr/24DiYpPgRu+DpcV7DI1
	5Ji3+cUMiE5txjK0gCkFZB5iLaddKvGvHuCjeMKK1fMvkn/skYEdfUkJsEC5KzwjaCO2W6klTyl
	JoJSg4iRBV+muHyJLgb0KDzkj8v71s8iU6pZMMUnWOae
X-Received: by 2002:a05:6402:5042:b0:6a3:eb58:dcfb with SMTP id
 4fb4d7f45d1cf-6a42f1ddad2mr12271094a12.10.1787378932766; Fri, 21 Aug 2026
 23:08:52 -0700 (PDT)
MIME-Version: 1.0
From: x jys <xjys2017@gmail.com>
Date: Sat, 22 Aug 2026 14:08:41 +0800
X-Gm-Features: AcwNN1UD3HWRDtz8tZY3_dfJLmtGyJLIPinusJQgVME3VsciHWVBkRQkgFw8xGI
Message-ID: <CAEi-r96d2vvZVX8pATt0rDPu+jbBumNos81HQirNziZEAqHEkw@mail.gmail.com>
Subject: riscv: abi/pointer_masking kselftest fails on ZPM-capable platforms
 (test expects PMLEN round-up without PR_TAGGED_ADDR_ENABLE)
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_230855_021011_D3EBB39D 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
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

Hi all,

I am an intern at KUBUDS Tech, a RISC-V International member
organization. While building a local KernelCI-style testing pipeline
for RISC-V (QEMU virt -cpu max, kernel v7.2.0-rc7, riscv defconfig),
the tools/testing/selftests/riscv/abi/pointer_masking test fails every
"constraint" assertion for PMLEN=1..16:

    not ok 5 PMLEN=1 constraint
    ...
    not ok 23 PMLEN=7 constraint

while the "validity" assertions pass. PR_SET_TAGGED_ADDR_CTRL returns 0
for every requested PMLEN, but PR_GET_TAGGED_ADDR_CTRL always reports
an effective PMLEN of 0.

Root cause appears to be a mismatch between the test's expectation and
the kernel's semantics, both present in v7.2.0-rc7 and current master:

- test (test_pmlen): sets only the PMLEN field (without
  PR_TAGGED_ADDR_ENABLE) and asserts the effective PMLEN is rounded up
  to >= the requested value;

- kernel (arch/riscv/kernel/process.c, set_tagged_addr_ctrl): when
  PR_TAGGED_ADDR_ENABLE is not set, resets pmlen to PMLEN_0 and returns
  success. This comes from commit 3033b2b1e3 ("riscv: Reset pmm when
  PR_TAGGED_ADDR_ENABLE is not set").

Why upstream CI does not see this: on platforms without the ZPM
extension the kernel rejects the prctl, so the test takes the skip
path. QEMU -cpu max emulates Smnpm/Ssnpm, which exposes the mismatch;
most real hardware lacks ZPM.

Questions:
1. Is the intended semantics of PR_SET_TAGGED_ADDR_CTRL with only PMLEN
   set (no ENABLE) to remember the rounded PMLEN, or to reset it to 0?
2. Depending on the answer, either the test should pass
   PR_TAGGED_ADDR_ENABLE, or the kernel should keep the rounded PMLEN.

Full details, reproducer, and the failure tracked as XFAIL in our CI:
https://github.com/xjysiiau/kernelci-riscv/blob/main/docs/findings-pointer-masking.md

Best regards,
X Jys

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
