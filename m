Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE15DC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Apr 2022 07:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dxe1qNr6cm6Fawy5UTP96HIM5PJghUZfFtmx760nyLY=; b=f2/wo3IPx19pam
	srgSEqj7a0H0aPOqQggyUDAwWRCpV53paaGh04BCbRm2fI9ZH0vJmve5zqtlEtyIf8u2o1a9v0VGn
	+Tu2vCJqrXKWxDRMZUU2w02wMCDK4aOCkuGRz5bWg3+v3kopeIsKxEgmmPjvSNloTatZ8XI1Bhtkt
	yxukFvbwF8mqtixigB8W2OfosVTPUaFskqob7prbTIelVJFMjYdlff3sk2pa8IdNDw/ckvVBVJF4u
	HvBx+63XgPsltrz28H2DryPdSNjzsuBuPH0Oye/inx9LbmHQc2d05sXbeRAuE+Scnun9ZfUlphAqK
	9gF2+lagCeH2y6RXyGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niWl6-0064G3-Ca; Sun, 24 Apr 2022 07:34:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niWl2-0064FI-Kb
 for linux-riscv@lists.infradead.org; Sun, 24 Apr 2022 07:34:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 46D12B80DD7
 for <linux-riscv@lists.infradead.org>; Sun, 24 Apr 2022 07:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CF1C385AD
 for <linux-riscv@lists.infradead.org>; Sun, 24 Apr 2022 07:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650785650;
 bh=xI1NIfvXpmPp9D3ctWwWfmXIYM7XRmpUpv+03lUnZqY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Z3YaV9tdWWy2hStE6/D5nBZ8H+tgRYDaZJuLqEMQOpdcaTA5btejAKV5nGs4FVkFw
 lztUtmGnYL7ij4B3m5usmfn0kp6+WDZwm3wV85W3giGmPvsaMI6qcSM6tkSYLBZuGJ
 F4K0ZjWW9IrtktJUZbMtT1AAO+znqc47yH1DejHSU1OHVpLM2Tfm7mP+IdGl9MBbfH
 r3HqJ7fsdf8SHeFANAll2AaNybVbsKpj85C9uZRc9QMSA26xvawE4saVHPevzSROBp
 ik352AGAWQmV7O8Ra4j8tKA8RJ+DAoNedBydzG76onwRCgpKbb1MAbN0Y+lalgPvbZ
 dP46StgCi9pDw==
Received: by mail-ua1-f47.google.com with SMTP id g22so4568865uam.12
 for <linux-riscv@lists.infradead.org>; Sun, 24 Apr 2022 00:34:09 -0700 (PDT)
X-Gm-Message-State: AOAM530mNAnkzAJcyW5k/45ucF1gTW08KoSnOWY9zQ5XokyVASL9tXyI
 6/0TlO/qAaC7ku01zPFsODZ/Fh7YAyamKnfTSKU=
X-Google-Smtp-Source: ABdhPJwjPIhNxj9bMKUtEcaBvPXsYsrvGPar68HbF3WXf8ryDmI47RVT1niIuAX7Rtzo9xZ57yNdHmTuxo5upiU+VlA=
X-Received: by 2002:ab0:375b:0:b0:355:c2b3:f6c with SMTP id
 i27-20020ab0375b000000b00355c2b30f6cmr3613271uat.84.1650785648925; Sun, 24
 Apr 2022 00:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-320b7f4f-08bf-4ee8-938e-4bf687760468@palmer-ri-x1c9>
 <mhng-d2e23c07-fd6f-4ae8-a2c7-fc1825e50503@palmer-ri-x1c9>
In-Reply-To: <mhng-d2e23c07-fd6f-4ae8-a2c7-fc1825e50503@palmer-ri-x1c9>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 24 Apr 2022 15:33:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSaAmg_-G+z7G=wea=cM_F_c17WvoDtxryxacT9wseMvg@mail.gmail.com>
Message-ID: <CAJF2gTSaAmg_-G+z7G=wea=cM_F_c17WvoDtxryxacT9wseMvg@mail.gmail.com>
Subject: Re: [PATCH V3] riscv: patch_text: Fixup last cpu should be master
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_003413_004540_E0F55649 
X-CRM114-Status: GOOD (  25.85  )
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

On Sat, Apr 23, 2022 at 12:02 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Thu, 21 Apr 2022 15:57:32 PDT (-0700), Palmer Dabbelt wrote:
> > On Wed, 06 Apr 2022 07:16:49 PDT (-0700), guoren@kernel.org wrote:
> >> From: Guo Ren <guoren@linux.alibaba.com>
> >>
> >> These patch_text implementations are using stop_machine_cpuslocked
> >> infrastructure with atomic cpu_count. The original idea: When the
> >> master CPU patch_text, the others should wait for it. But current
> >> implementation is using the first CPU as master, which couldn't
> >> guarantee the remaining CPUs are waiting. This patch changes the
> >> last CPU as the master to solve the potential risk.
> >>
> >> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >> Signed-off-by: Guo Ren <guoren@kernel.org>
> >> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> >> Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
> >> Cc: <stable@vger.kernel.org>
> >> ---
> >>  arch/riscv/kernel/patch.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> >> index 0b552873a577..765004b60513 100644
> >> --- a/arch/riscv/kernel/patch.c
> >> +++ b/arch/riscv/kernel/patch.c
> >> @@ -104,7 +104,7 @@ static int patch_text_cb(void *data)
> >>      struct patch_insn *patch = data;
> >>      int ret = 0;
> >>
> >> -    if (atomic_inc_return(&patch->cpu_count) == 1) {
> >> +    if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
> >>              ret =
> >>                  patch_text_nosync(patch->addr, &patch->insn,
> >>                                          GET_INSN_LENGTH(patch->insn));
> >
> > Thanks, this is on fixes.
>
> Sorry, I forgot to add the Fixes and stable tags.  I just fixed that up,
> but I'm going to hold off on this one until next week's PR to make sure
> it has time to go through linux-next.

https://lore.kernel.org/linux-riscv/20220407073323.743224-3-guoren@kernel.org/

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
