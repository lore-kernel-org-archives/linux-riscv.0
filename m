Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38265C77B7D
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 09:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2vWx56KmHyV3B4Jnz27GvLPr51aIWz2Gx0PnnfR851E=; b=jIXl2ZIKFSvRTW
	nWrIkRwo79wdOVwQkRw8rs9hV1vzhPvdCHts9zQuoG8bfSbB5nJ0lVDkWoj1+xD/hS2OSXbyUiyZ+
	6xUk4YyPKvt4xZu/ECOt5hHboVq6brj0uk74z872p3zVI6eVrMIEfttpAQtV0la4vqMdy/C7KSFOb
	sWynYjKMNp3K/mLHGIsUHq0HAk4zQuRqc7KOxLR2mM+VNfSuLYeW08SWXg7D6HltsFxTUPvjqxPJB
	NkfuqGHKbs0MPJn1B9WmmMqhyArH/ug4UrI/YZ4Kt7TfJWedpoTjMvtwO3RkUpq4Rq4PuhXmYZh+t
	VZpri+AoD7tw2bCfmTgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0IdG-0016GD-1F;
	Sat, 20 May 2023 09:12:10 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0IdA-0016Dk-28
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 09:12:08 +0000
X-QQ-mid: bizesmtp88t1684573905teirhxww
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 20 May 2023 17:11:44 +0800 (CST)
X-QQ-SSF: 01200000000000C0V000000A0000000
X-QQ-FEAT: c342PQuYFhG7xMw63XFqL+acIplrGyQvFi0NXKujRXri9joL6YtUbT86pgfUv
	AuUQKdHKx/FXPQxWniGP6Ir6zfwjOZJWFcEi7s/ZsPZxapfi/LiNDtc9zseCsfW2qXUDJTS
	kSwLKr8TygqKlTQsTyTEyU0hQLDg9Nz1+pw57TUOUmF4/aAEN7tVapiDqbZjG1KOFos2Dg0
	0VStJv2DWl6CobJrJDoTqJ4uhpGMQtF+J4c4LerhQKFKxkINosfFhXPeGMiV4TPtnCWzfpM
	PV4htjs7CPpQ92OwPpe2xZ6UKgWvDZnWkjpCRPUhI73cQdpjKrGuRs98JDdObdLl/moDh3V
	XDsO1kreOVBwNQEkcxejOni7Zp0KA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9067829943763341093
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: aou@eecs.berkeley.edu,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulmck@kernel.org
Subject: Re: Re: [PATCH 1/2] tools/nolibc: riscv: Fix up load/store instructions for rv32
Date: Sat, 20 May 2023 17:11:44 +0800
Message-Id: <20230520091144.30599-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230520085052.GC27206@1wt.eu>
References: <20230520085052.GC27206@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_021205_023171_593DC73F 
X-CRM114-Status: GOOD (  15.39  )
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

Hi, Willy

This is a full commit message for this patch:

When compile for rv32, we got such error:

---

nolibc/sysroot/riscv/include/arch.h:190: Error: unrecognized opcode `ld a4,0(a3)'
nolibc/sysroot/riscv/include/arch.h:194: Error: unrecognized opcode `sd a3,%lo(_auxv)(a4)'
nolibc/sysroot/riscv/include/arch.h:196: Error: unrecognized opcode `sd a2,%lo(environ)(a3)'

Refer to arch/riscv/include/asm/asm.h and add REG_L/REG_S macros here to let
rv32 use its own lw/sw instructions.

---

I will send a new version with the above full message for you, wait for a while, very sorry ;-)

Best Regards,
Zhangjin Wu

> Hi Zhangjin,
> 
> On Fri, May 19, 2023 at 01:02:12AM +0800, Zhangjin Wu wrote:
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/include/nolibc/arch-riscv.h | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> I'm having a comment regarding this one (which for now I've queued so that
> Thomas can rebase his series), please provide a real commit message that
> explains the purpose of the change and the solutions chosen. Feel free
> to copy-paste from your cover letter if that fits, it's just that I do
> want to see some justification for a change in the commit message itself
> (i.e think about the poor person seeing a bisect stop on that one).
> 
> You can send me a paragraph or two and I'll happily copy them into my
> local copy of the rebased commit.
> 
> Thank you!
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
