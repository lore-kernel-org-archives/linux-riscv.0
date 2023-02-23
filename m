Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48303C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 00:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wRcsw+42qC4IHxqeeczEeOVqihH/+EcX309b6i+OtLE=; b=p3rRa+U4Y6Bf2V
	z6MXjjmq9fzcm+1sDvpIuNt6S/Jka3INN88cp7YzCPCPGNqXU97u2C+9zzhtaYCFzbTZW/qfZqHi7
	0PquDUcBKXc7x75Lb5hqrkOEh3U3uZ9R41JErOEOxKvYk1xysT8yDv+RQcM7C31SyKkSppHn5S3c7
	jbN7xNLaEwkKlXFesznHoij1L6tmETdGr7TCRxaWgkkVspsGgCGpA7EkxfYFbvtkfCaj3FXBESnnX
	Qltla35OBySiDnPP3vWhrhZ1jt0tVXppqODfCj3mWtAY6sknZMghtBfF/q2z4CY7/oIla99aocFIl
	NRJIepNrSaeJMwemnCrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUzTk-00EXaw-2i; Thu, 23 Feb 2023 00:28:56 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUzTg-00EXZs-JF
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 00:28:54 +0000
Received: by mail-pj1-x102a.google.com with SMTP id pt11so11642970pjb.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Feb 2023 16:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WO6JN/lm3lqcQUnXcLoikkeEf2tkfRdlWGJSxQRLbXY=;
        b=F82qGBR6+LJm7hgQrtY1K9rv0f84ccQwl2P9aVuk3adqaJXZb4qRmdhXYeXAuWZcQw
         9eIsELi6Zifxx/0gWK4pSECx6ypFlVV0pIDbrFGxgXwxU8N2XYR3VqYDRTcvef+jjprR
         z6sH3x1QwlrRaeO/9R5wENE/GLujCk8qs3UTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WO6JN/lm3lqcQUnXcLoikkeEf2tkfRdlWGJSxQRLbXY=;
        b=iReN1Wc4lw1DjmsuoN6HKvRF0BbpVLS/DMVR2dMMtJTGDnyl18tId+inO3aqoWfI+I
         gtV3yrpVpJan/bsC+LzmxehnArYRKoNjN18/gmB2ben9Gtqe8iIvHjUYdneOm9qKQCa6
         +fyJI4Q/ADeM6OKqfbmot5cvt2HUWqF7kbzd19+fFbTG77UFRsa8YIpC1osbNZxSywHM
         An7711MSvb9QBvzlIXgDpSfNqBMpVYlZf0peouuYsSWzLI6D3GUCQhqdPtr4EG+zEmjb
         4XyDz+qzNOCNVh+nQM+00x3E24s4UJnAPW1JIa94dXC6sXMd9LRYIRerra2376fcma4V
         I/sg==
X-Gm-Message-State: AO0yUKVZvDlk4/kX/MaE8ZzM/VdraBqbEfLYH9BHRi7FWv/gq9jw5uqv
	WJDbsyV5xW4dRC5JKrqkWLXrJKzUBJ/tdY1uFJvk
X-Google-Smtp-Source: AK7set/XC3/Aa7hXy/PABBf/Y0Z6F8a+4tSvCIQ4QT2fhxgwWrwkyx6sCvKWNMWyowSnBYt4xOIDVtO9q0vznwbApGU=
X-Received: by 2002:a17:90b:3e8a:b0:233:c312:47a1 with SMTP id
 rj10-20020a17090b3e8a00b00233c31247a1mr2193217pjb.81.1677112127857; Wed, 22
 Feb 2023 16:28:47 -0800 (PST)
MIME-Version: 1.0
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 22 Feb 2023 16:28:36 -0800
Message-ID: <CAOnJCUKHq_8msJtU-H1JvWJ8nY94J0tcarQMBsPNpBZO8sP6HQ@mail.gmail.com>
Subject: Perf event to counter mapping question
To: linux-perf-users@vger.kernel.org
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
	"mark.rutland@arm.com" <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Beeman Strong <beeman@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_162852_934693_CA0A30AC 
X-CRM114-Status: GOOD (  14.83  )
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

Hi All,
We are trying to figure out what is the best approach to define the
perf event to programmable counter mappings in RISC-V.
Until recently, all the programmable counter/event selector registers
were writable in M-mode (highest privilege mode) only. The firmware
residing in M-mode
would discover the mapping from device tree[1] and the perf driver
relies on SBI PMU[2] interface to discover the mapping between event &
counters.

There are new ISA extensions being proposed to make counters /event
selector register in supervisor mode as well. Thus, a pmu driver
can directly program the event selectors without relying on firmware.
However, the kernel needs to be aware of counter mapping to do that.

AFAIK, ARM64 allows all-to-all mapping in pmuv3[1]. That makes life
much easier. It just needs to pick the next available counter.
On the other hand, x86 allows selective counter mapping which is
discovered from the json file and maintained in per event
constraints[4].
There may be some legacy reasons why it was done in x86 this way[5].
Please correct me if I am wrong in my understanding/assumption.

Here are a few approaches that can be used to solve it in RISC-V.

1. Continue to use device tree bindings
Cons: We have to define similar entries for ACPI. It makes
virtualization difficult as the VMM has to discover and update the
device tree/ACPI as well.

2. Mandate all-to-all mapping similar to ARM64.
Note: This is only for programmable counters. If the platform supports
any fixed counters (i.e. can monitor
only a specific event), that needs to be provisioned via some other
method. IIRC the fixed counters(apart from cycle) in ARM64 are part of
AMU not PMU.

3. All platforms need to define which subset of events can be
monitored using a subset of counters. The platform specific perf json
file can specify that.
This approach provides more flexibility but makes the code path a bit
more complex as the counter mask constraint needs to be maintained per
event basis.

4. Any other approach ?

Any thoughts on what would be the best approach for RISC-V. It would
be great to repeat any past mistakes in RISC-V by learning from
experience from the community.

[1] https://lore.kernel.org/lkml/Y6tS959TaY2EBAdn@spud/T/
[2] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc#function-find-and-configure-a-matching-counter-fid-2
[3] https://elixir.bootlin.com/linux/v6.2/source/arch/arm64/kernel/perf_event.c#L899
[4] https://elixir.bootlin.com/linux/latest/source/arch/x86/events/core.c#L876
[5] https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1978937.html
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
