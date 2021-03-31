Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E72FC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:28:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D469460FF1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D469460FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YNHi+XTgIS4OPW4zCFEyaKml++L7b7QL0381F9TeBQQ=; b=pM8NNyxHAPc2cOdsGaeL1iCol
	N1wXrrG+etADuCNFrkAby4afptr5PK1T0ciyQKW/mwimdFm7Hzuih3XKKeojandMy/Vsj9j2EuiRX
	igz5rakEYrEYMKF5kXnvLYvZT1qWj+cTqMvzBkfANSgTfm0Q7T6rtyjToDvZf9Qb/OFLVawx016Dd
	lpcg/6MKRjXjiPmcd5BsxqjpgdqiOqK/y5VKuIPAjpP/aVU+LhE6aQZQP02GZnUwl/Xd9oeLxepfQ
	g6eTWbDxj4ZzAQyG9AuJGjPUldNFOiG1CMYLtuyBFjTyrCqnommifKNca8aHcP6AN0jzaOAOgh1Me
	BSwykwfKw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRbpb-006oAd-Ga; Wed, 31 Mar 2021 14:28:27 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lRbpT-006o8X-D8
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 14:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=/USMBB5tdJb798E3Ew+mE5e8OfVTFhQ2z3
 foDoJoUxw=; b=V03ymP6pvnQl1qX46eZ14aIGakYtv+5IJZNJFW6EIktV+S3RsY
 VleDki0NiBju0UdGeqd3BUNwj1vMSZ8Gq0TkabCTbxr1jUaIbdASKkZOj/YxNUbp
 eKBkCS8WNWB+xOEEHI+lg3cbEOuZ5/+JF6q4AXlovSfZq1OCftnYMSBXg=
Received: from xhacker (unknown [101.86.19.180])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygCXOpnohmRg0xh6AA--.15607S2; 
 Wed, 31 Mar 2021 22:27:53 +0800 (CST)
Date: Wed, 31 Mar 2021 22:22:44 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@linux.alibaba.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: keep interrupts disabled for BREAKPOINT exception
Message-ID: <20210331222244.45a5807c@xhacker>
In-Reply-To: <20210330183316.942215efe8e6e8455ad14113@kernel.org>
References: <20210330021624.2b776386@xhacker>
 <20210330183316.942215efe8e6e8455ad14113@kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygCXOpnohmRg0xh6AA--.15607S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWrGryrJF1kAry8Aw1rCrg_yoWDWrg_Ww
 1jvrZxG3yYyr4Ikan2qrn7ArZF9r17WFWxXw1fKFWDKa4Ut3yYqFsavFy5JrZ7tF4ftFZx
 uFy7XrZ0qry7WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbrAYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
 1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
 JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
 W3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
 JbIYCTnIWIevJa73UjIFyTuYvjxU2rcTDUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_152822_446900_80D14C19 
X-CRM114-Status: UNSURE (   8.46  )
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

On Tue, 30 Mar 2021 18:33:16 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Hi Jisheng,

Hi Masami,

> 
> On Tue, 30 Mar 2021 02:16:24 +0800
> Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
> 
> > From: Jisheng Zhang <jszhang@kernel.org>
> > 
> > Current riscv's kprobe handlers are run with both preemption and
> > interrupt enabled, this violates kprobe requirements. Fix this issue
> > by keeping interrupts disabled for BREAKPOINT exception.  
> 
> Not only while the breakpoint exception but also until the end of
> the single step (maybe you are using __BUG_INSN_32 ??) need to be
> disable interrupts. Can this do that?
> 

interrupt is disabled during "single step" by kprobes_save_local_irqflag()
and kprobes_restore_local_irqflag(). The code flow looks like: 

do_trap_break()   // for bp
  kprobe_breakpoint_handler()
    setup_singlestep()
      kprobes_restore_local_irqflag()

do_trap_break()  // for ss
  kprobe_single_step_handler()
    kprobes_restore_local_irqflag()

Thanks


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
