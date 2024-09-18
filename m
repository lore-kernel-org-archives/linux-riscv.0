Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6A7CCD19D
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 11:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gh8UjfjKIRbsc/vzgUQX3YZrPGAgkPiacZ+PQDRWjk=; b=FZRe1EPGahN8k2
	6JHZWY6OgvDF7vofJiVKLa7H9CbpDcNQf2NP/M+RGRBf7hDY5oluP66KWl259W321iGz6L80w+IBv
	1oK3wOhhObwKYArRxaKe1a6OvRUpGM9B65gvHQOxoGTt9oJe1TpcsfioXHYtqUUJCdpCQGUV1yfwK
	ZaQ25kPO7SOyepgm8J/36el4FfcmmLvr/ytkuSyi6dAW6cTLJNzpXz3qqz/XSDSmy2S7qZULGCByF
	bGht734N5/Fv4hinN9d6O08d8e+cJ/UTvy2l3cNZBfhx/XmDDCJk5hRtgsM5oi2yBh3Nm56v/ZOBX
	waICl/MMaKjPIW9XzjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqsZy-0000000862g-0p4U;
	Wed, 18 Sep 2024 11:10:38 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqsZu-0000000860t-49H2
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 11:10:36 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5c40942358eso1202090a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 04:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726657833; x=1727262633; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SRZbVG1IhzLF4gQfRB4AzzHyFJqyHn5f75uQWWvm/bw=;
        b=AzHnJRtHED9w7S2mtVMwYAAhc5DdZ+QXvw7NqtL3Afu65PcC7C/N0Q2e9nAuGeVl/c
         TsVwK3vO/aR1pIwpxqb+Sdp3krWan1R+ak64zMMgFBTV911ErQ8DDaIwQr8mH5fkVTzB
         lHnOqKNo0kHvju4rtM9107yKnoieEQFoud1RYX7sZAEmxYb9/0e3VPh6DjPrWkHiLDJt
         tAOVsARuJ+TnBspWCEAMbS3dLbKufb2qCPKFmebHUfnk+ayeGpIDlO6nDmzKU3EEx2AO
         W8j4hW5UAtoR0v0YLyIjDxZNFyyXe2LEQ+rDWRF2TgGsZ6q9qK8OUB45nA4+eJsElGRN
         YfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726657833; x=1727262633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRZbVG1IhzLF4gQfRB4AzzHyFJqyHn5f75uQWWvm/bw=;
        b=Ls6xrC9SQ+p9l1fjjfKNNwoD1yWYKM2IXvm1Bkt6LeGdGLNt4eNOh61HukZKf4ft5v
         iPU0N55tB0zdV89KAtRSMOyM0fDNIBq23ZVOU0/wwv8c5uIdRERtDHu1PXXAlEdFqy0C
         euT2HBwvUEwUrSZD0ARrtcCJRUCWUfvXt4GAF5YGLdOksNOeLBemTdpLStbpYIkbIAW1
         g76wLOtix1ockkaQmU8OG8zNPU9LnwbEiNfih4LXcbseKphOaTLl+bLvwS2TCSVbhFkE
         ErM5nwMCgD0Vg8BoriZUY4vK+UpO+pgn9LeZEtQdywu01CDGo6BeYG2ZdvMRCDHE1frb
         NrUg==
X-Forwarded-Encrypted: i=1; AJvYcCU0AZoCXpTopIA4N1XcKpuB+X+ZVSSOqbslWgUeO39YUJI0raqwBrjn/b0Z7iappuVDP6xWyonc3n6t7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwuyCUF6/2VdQcuEPVNq1ztTBx7qSI+iQd/+vgmhbzc0s/FSxE
	wU8lOsa+RFtSvkBYuvVpUqSCDymJ/Iv3L90kDeojVkK2djfmZPCUYIgm3zG18aVQCSe4vNpg/9R
	WO6hHIdgB6Ym84j4KKhD6sBMe2AOfUpFAIEc4UA==
X-Google-Smtp-Source: AGHT+IGBXJ07Gt78CUwOdJRwkknc9yCkL5BLIwG3FEocWciml96gp0ZI/zuYvW05MNno9h9wE8tMmu/6bWIym7WiaKI=
X-Received: by 2002:a05:6402:520e:b0:5c2:5248:a929 with SMTP id
 4fb4d7f45d1cf-5c41435c3d2mr27093336a12.7.1726657832550; Wed, 18 Sep 2024
 04:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel> <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel> <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
 <20240918-039d1e3bebf2231bd452a5ad@orel>
In-Reply-To: <20240918-039d1e3bebf2231bd452a5ad@orel>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Sep 2024 12:10:21 +0100
Message-ID: <CAFEAcA-Yg9=5naRVVCwma0Ug0vFZfikqc6_YiRQTrfBpoz9Bjw@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: enable floating point unit
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, 
	Weiwei Li <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_041035_082472_0E7AE42D 
X-CRM114-Status: GOOD (  16.93  )
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

On Wed, 18 Sept 2024 at 07:06, Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Tue, Sep 17, 2024 at 06:45:21PM GMT, Heinrich Schuchardt wrote:
> ...
> > When thinking about the migration of virtual machines shouldn't QEMU be in
> > control of the initial state of vcpus instead of KVM?
> >
>
> Thinking about this more, I'm inclined to agree. Initial state and reset
> state should be traits of the VMM (potentially influenced by the user)
> rather than KVM.

Mmm. IIRC the way this works on Arm at least is that at some point
post-reset and before running the VM we do a QEMU->kernel state
sync, which means that whatever the kernel does with the CPU state
doesn't matter, only what QEMU's idea of reset is. Looking at the
source I think the way this happens is that kvm_cpu_synchronize_post_reset()
arranges to do a kvm_arch_put_registers(). (For Arm we have to do
some fiddling around to make sure our CPU state is in the right
place for that put_registers to DTRT, which is what kvm_arm_reset_vcpu()
is doing, but that's a consequence of the way we chose to handle
migration and in particular migration of system registers rather than
something necessarily every architecture wants to be doing.)

This also works for reset of the vCPU on a guest-reboot. We don't
tell KVM to reset the vCPU, we just set up the vCPU state on the
QEMU side and then do a QEMU->kernel state sync of it.

-- PMM

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
