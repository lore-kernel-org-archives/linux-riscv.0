Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80124EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 19:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ixzuhPz1vGX9E4felqx63bG57tNY/cQz30TdGit/MBc=; b=TKaTzbKAomjEaz
	Q+QqjLK5v4pH+LPjMxHB/tcuXTDjK9afkidEAC1L7G/7vnRwOsjJYzqRyf8L73XPLptdzFlbwPRHP
	pPScmaSUqTAbQ5ldLpYiMUuBGqjeEk/3RvqpYDccUaosZp+xbU49GA8XJhJDsbHaTQVO+fNH+KJ91
	qcjY7WWXJkqqU1kKfVPImND/Jz7Xl3CStAUJEDnNFzsV+s/a4fD9giKKgT9OHVjTMJkwxBle+irS+
	yEzGKmW8gEFGV8MtHqlscHQT9u/oOxDUrau3j4gJREQBkCyUL3gWPTmR89hruyLS7PpAx4JrNVO9N
	qLjgaUN/V0+kJwZPy3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBKyi-009Mn5-1d;
	Mon, 19 Jun 2023 19:55:56 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBKyf-009Mm4-3B
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 19:55:55 +0000
Received: by mail-lj1-x244.google.com with SMTP id 38308e7fff4ca-2b4826ba943so13556041fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 12:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1687204551; x=1689796551;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y/QFg65RpGTyfTu8dm0MuAGrlhx6RjLEM2hkZVGqrm4=;
        b=DYiIUEph+/RIcToCSjd6p8oBXwd1aBeL9UtvqH0pHl0/Itvh3BEOGPUsozqv1SEVBX
         zXPhSN2bgEl/w4g5YF/wdtrz2q2TauVUdooxvimc+7SWmUEHpfNbYYitKcEfxbhLVrhn
         T43tciuS65yTkK65umt/RkkgEcZO6Ftm5cYrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687204551; x=1689796551;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/QFg65RpGTyfTu8dm0MuAGrlhx6RjLEM2hkZVGqrm4=;
        b=fB4rfv+R3P5TqKuQ1ZcGMp5qQqw/tIBRqUEZig1xsYf36/RKNhTzj7Ib40agNNTkAo
         Qhazd2CUdy2rcrZ1TxmtseWpfAlB/VayIXRla33NX57p9zkYlhszHaSqTNA1wfGvRFty
         L7Q75rd4QZ32bsp6Bm+vWglEqcmXydN8v9JOxlRUFfFIvLmKOo5s2LeyE787B7+L9wuZ
         1m4hdCYrtVXu16etunrMf80HZ5TDMemlrj5Mzq6gtpnSoz4L/uDEW3sqiTFZrtqNBYg5
         uGbSw8LoLIr1Zoh9LL5AaCZKIfdoNkZgXogSqAotTYRB0O6pbvkS/va9tD7UbWhnTroS
         1Pnw==
X-Gm-Message-State: AC+VfDyll29RefQiK2t8bx5eQYaHXl941Gbgia7a3GPa2uL3U9BCPN2W
	d+u0oiuNOfCTjaGwZ5GFXM3R+Vqddf8PH8SjeJ1Been9bivF9kMW+KqkVz0=
X-Google-Smtp-Source: ACHHUZ69oBOCqKXI5GLDQUg4xZzhi6Avhk6e8F/zI4CFOhx48HK8SL7dXBiqtQbJiB+GyRCHphe/9K31ovX+Mw2Jq8o=
X-Received: by 2002:a2e:98d6:0:b0:2af:3141:a52b with SMTP id
 s22-20020a2e98d6000000b002af3141a52bmr6808924ljj.22.1687204550895; Mon, 19
 Jun 2023 12:55:50 -0700 (PDT)
MIME-Version: 1.0
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 19 Jun 2023 12:55:39 -0700
Message-ID: <CAOnJCU+uMF-brnyjA1HLhupYPqL0ebOVu+ivrSn2AewuSrhtBw@mail.gmail.com>
Subject: CFP open for RISC-V MC at Linux Plumbers Conference 2023
To: linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>
Cc: OpenSBI <opensbi@lists.infradead.org>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_125554_029568_FA5DAF1A 
X-CRM114-Status: UNSURE (   2.73  )
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

The CFP for topic proposals for the RISC-V micro conference[1] 2023 is open now.
Please submit your proposal before it's too late!

The Linux plumbers event will be both in person and remote
(hybrid)virtual this year. More details can be found here [2].

We will start accepting proposals after 15th August 2023 to avoid last
minute visa/travel hassles.
The conference registration sells out pretty quickly too. Thus, we
would prefer to sort out the schedule sooner than later.

The final deadline is 15th October 2023 though.

[1] https://lpc.events/event/16/contributions/1148/
[2] https://lpc.events/

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
