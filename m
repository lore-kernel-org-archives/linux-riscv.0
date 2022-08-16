Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919F2C25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 15:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMXCA6i9jOLIdRAhWGN3c+1kvkQHBjUpu5LU7VP9DnI=; b=ax7qEmbDsQrkxT
	Ucm5ibnHKphRMS7hLmoJrkupoMrsedi6ojGPjVVvSLjEQzlqrcja4K5pH2TONEhEjmrpz0x0N519q
	/3k61s+AAgrGCrLdLpSRoJMpKl+6OGvAhyhdMRF+w+hp7Jk7/Z7bjH2F6ec2Wvr5cKGM2CYxEtMzo
	HR4U3m3MxXrTyCNhtURSMktLz8Lce0Z8XCxHH6pzRWB+ozoXKorPiazSNnFsGogalALvwOLmg95Kp
	cE5h3O+NO7ycTnljdFq0989UCZTn8HvgkWChZstrRefJPscYS4hON4RBmBit9Yhs7DknRAx0Uwavy
	D58NCSl5hAdaIaUvt7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNykY-0047Xr-Uo; Tue, 16 Aug 2022 15:45:02 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNykT-0047OK-DR
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 15:45:01 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-33387bf0c4aso56688437b3.11
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=IwLSrviK0+Pq9jADrUgpgFdsN8GRjOTIKav+qj76JZg=;
        b=gTIiwzUkBthrsVkhuOQJWuS3lEyBbxoFzp+eYQiKwZgg157Zw8JhvYpl3TAI+Ynrjo
         LEO+E4DUUe7Eu28yVcCG7R1VYN5Fvl5OtblpaWUMpcQp1mNdcjTM/eZKnns2suXd6saF
         iofCvhmkYzry0QYEuNmWeI1/HLv1zK2eegdFFoCuK9MhZfuY9vy+3hCthyotWfN3cifx
         obofCRIAC+9oSqeFIHCRZd6MvUIVH24EAQ9vu5/5Y4sRghJBVekOkxtapj8xScj77W+T
         tJ68FU95txz0k0S4wBribjLvrJ8El9rXxZS/fgKjD3+ex+NTuJeruSmfkjOhHRlDOV7R
         VWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=IwLSrviK0+Pq9jADrUgpgFdsN8GRjOTIKav+qj76JZg=;
        b=NxyYKPhqvgja+RX7/XRyJ+7tcjy7stBTSjZ/JZEYIHmc8VNEJNDp088D14RH8/zk8r
         VI2FlvrnXvTZvNx7ZNpYCL2EO5+6K5EAIrUkuOubZASCPK3w3kRaHTPoRadqUOQJ4U0y
         aMPKFN9AP1yIYnx2Y5zFBCTWvf62NAUE60cFeir8f5WioxK7RucGlU99/S9mxGGXUQuz
         UJrAPy3avYpSIcVoIV6qLKCne7KORikbRRg9Yo+6bgIx7iz2E/YwfF7+D7JWYUpT9ABt
         1j69Ga3T9f84xKBB6xb3qVWStcuVCySOm7pE+cLljQjjjFbknBl0HkToudqMybJJh12B
         VXWQ==
X-Gm-Message-State: ACgBeo0qiJqP93sliMLWVdO8iKZBnrPEqeIwfcDoE5KktYW6TcoeDRrr
	JMmFG5ETcWF2G8ipzNU/XQH3esTQz8VKTKBpt2YFpGL2chA=
X-Google-Smtp-Source: AA6agR7sUjrS16ND324nElMshggIwjo0g2ODxZ4TZa9qKL1LJjXG8dkI7EkzTN+JrtkEJQzNUpUUIlilC6xiBmmqCLI=
X-Received: by 2002:a05:6902:102a:b0:676:d49f:9fa9 with SMTP id
 x10-20020a056902102a00b00676d49f9fa9mr16741009ybt.619.1660664692815; Tue, 16
 Aug 2022 08:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <728ecbd5-975a-168e-efab-3c0030be21d5@w6rz.net>
In-Reply-To: <728ecbd5-975a-168e-efab-3c0030be21d5@w6rz.net>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Aug 2022 21:14:41 +0530
Message-ID: <CAAhSdy2T8txKiDYYfwR3NpK+0jR1oHnaU7ZX5h+g+0y9obHxjQ@mail.gmail.com>
Subject: Re: Regression on Linux 6.0-rc1
To: Ron Economos <re@w6rz.net>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com, 
	palmer@rivosinc.com, daolu@rivosinc.com, heiko@sntech.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_084457_705584_5034C9C2 
X-CRM114-Status: UNSURE (   9.89  )
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

On Tue, Aug 16, 2022 at 6:29 PM Ron Economos <re@w6rz.net> wrote:
>
> The following Oops occurs on Linux 6.0-rc1 on the HiFive Unmatched. This
> is with gcc 11.2.0 and binutils 2.38 (from
> https://github.com/riscv-collab/riscv-gnu-toolchain).
>
> Begin: Loading essential drivers ... [   14.774748] Unable to handle
> kernel paging request at virtual address ffffffff813cdc90
> [   14.781976] Oops [#1]
> [   14.784163] Modules linked in: raid6_pq(+) libcrc32c raid1 raid0
> multipath linear da9063_regulator
> [   14.800763] CPU: 1 PID: 248 Comm: modprobe Not tainted 6.0.0-rc1 #1
> [   14.806747] Hardware name: SiFive HiFive Unmatched A00 (DT)
> [   14.812307] epc : jump_label_module_notify+0x1bc/0x270
> [   14.817430]  ra : jump_label_module_notify+0x19a/0x270
> [   14.822555] epc : ffffffff801b804c ra : ffffffff801b802a sp :
> ffffffc80424bc0
> [   14.829766]  gp : ffffffff81a2d7b8 tp : ffffffd895ae1980 t0 :
> ffffffd88067e20
> [   14.836975]  t1 : 6f1d98585898183f t2 : ffffffdbfed19e58 s0 :
> ffffffc80424bc0
> [   14.844185]  s1 : ffffffff813cdc88 a0 : 0000000000000000 a1 :
> 000000000000000
> [   14.851394]  a2 : 0000000000000000 a3 : ffffffff01c77000 a4 :
> 000000000000000
> [   14.858602]  a5 : 0000000000000000 a6 : 0000000000ff0000 a7 :
> 000000000000021
> [   14.865812]  s2 : ffffffff01c73000 s3 : ffffffff01c740c0 s4 :
> ffffffd88067e80
> [   14.873021]  s5 : ffffffff01c73010 s6 : 0000000000000dc0 s7 :
> ffffffff813cdf0
> [   14.880230]  s8 : ffffffd88067e282 s9 : ffffffff01c73008 s10:
> 000000000000002
> [   14.887439]  s11: ffffffc80424bd50 t3 : e26cb9592a0e8a69 t4 :
> 000000800000000
> [   14.894649]  t5 : 000000ff00000000 t6 : ffffffd8819ac4a0
> [   14.899945] status: 0000000200000120 badaddr: ffffffff813cdc90 cause:
> 000000f
> [   14.907853] [<ffffffff8004055a>]
> blocking_notifier_call_chain_robust+0x72/0x8
> [   14.915061] [<ffffffff800a1dfc>] load_module+0x17bc/0x1e98
> [   14.920531] [<ffffffff800a2718>] __do_sys_finit_module+0x98/0x100
> [   14.926611] [<ffffffff800a27a4>] sys_finit_module+0x24/0x30
> [   14.932170] [<ffffffff80003ca6>] ret_from_syscall+0x0/0x2
> [   14.937680] ---[ end trace 0000000000000000 ]---
> Segmentation fault
>
> Manually bisected to this commit:
>
> arch/riscv: add Zihintpause support
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8eb060e10185cfc97ef0200d197ec246ba0f9f8c

We see this crash for any loadable module which uses
cpu_relax(). In fact, KVM RISC-V module loading is also
broken.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
