Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CE2D29C28
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqlRyi55TjOyfyjPRdjvXNJvrDRGntwzLYFfKS+5nwM=; b=15tJecqDB2VCY+
	and1fZyPAbOTDr11iWyoPYpldv+uXeIpPl4EDEHiSXWXSSk4FOKSQQANSsP9DKyt1uRe5Xy9TE7K6
	F+yTFVoLRIXXKVQV7kqE+Po8IMfH38mKxM92L9z1PPkrIWo7T0oQklfP3uNUR4BGEEHlxnrTFdGCv
	JnyG7s7Va5bimhGPLi51Gc0DPobPVBn5M7J4MP3z2yue0RstEvP7k/iOB+buGx9bwCsUF59kbOXli
	3/1qB6olFNd9irboecCSfbimFP/AvaTwj5PprNRQ2opCg/CTbJ4gmYbN2/I598Xss2+Nx4EA+4Cy+
	1haohuATf4Sx512IjAVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpk3-00000002C4P-3FgF;
	Mon, 19 Jan 2026 13:56:27 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpk0-00000002C3z-2iHq
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 13:56:27 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4dvsSK1z5dz1r3F4;
	Mon, 19 Jan 2026 14:56:17 +0100 (CET)
DKIM-Signature: a=rsa-sha256; bh=x/NsdYWF6Usv07w/heyPAaqtE4oFMOQZjTU3wQvEz2s=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=From:To:Subject:Date:Message-ID;
        s=r1; t=1768830977; v=1;
        b=TeX0z9yY4Jq9GLy8La6FMGQwSxqYEdXPhz25AnHqTsX8jDUa5Wu3fve5Ttnz50mv
         oBREn+c33WcigCI3hZ55sstPge04KvmJnvkauzCAdkYmYO5hyTmEZ/W6sCqIj1ii
         avRbE0R4OAIKENhVVaw3Hkaq0GjJgirUrcVENYHrQjeWb4N332eQdgOvvi86ZOTo
         wNUmz6k32DuNhn1TcZKrhtY1tf1/rgI3zxudfExWJQYbMA39meGup0VcXP8y31XR
         P2OkZ7gddEuXaBGFdR8JJk5cWPgdgi8GgKm9hPUOZWL4vSR4p1Kkjv19FubFL6Rv
         b7Sfsh4qi2NyDonY1CXmkg==
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4dvsSJ2SMVz1r3Dw;
	Mon, 19 Jan 2026 14:56:16 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4dvsSJ1kWhz1qqlm;
	Mon, 19 Jan 2026 14:56:16 +0100 (CET)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id RuRd8Dv9diFG; Mon, 19 Jan 2026 14:56:15 +0100 (CET)
X-Auth-Info: PxxzS2w4Yg53RevxuRyb0fSmHYShreJiWIwAYzRCMCom56Vs8OWj9AZYmfWGUmJ4
Received: from wiesel.intern (aftr-82-135-82-149.dynamic.mnet-online.de [82.135.82.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 19 Jan 2026 14:56:15 +0100 (CET)
Received: from murmel.intern (unknown [IPv6:fdea:9b79:8984:1:7c62:722b:b9a7:1b50])
	by wiesel.intern (Postfix) with ESMTP id 6526479A0621;
	Mon, 19 Jan 2026 14:56:15 +0100 (CET)
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
To: Linus Walleij <linusw@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org,
	Thomas Gerner <thomas.gerner@muenchen-mail.de>
Subject: [PATCH] Re: Typo in pinctrl-th1520.c
Date: Mon, 19 Jan 2026 14:55:53 +0100
Message-ID: <20260119135553.145092-1-thomas.gerner@muenchen-mail.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAD++jLkmeEoynOurZoSB_sz0XfJupiJcLPyWqbTe6fQFpYJotQ@mail.gmail.com>
References: <029e5e79-ae9c-4d31-b75f-8f48f359d539@muenchen-mail.de> <aWk59MT8yWcxiYKr@x1> <0733e741-ec63-4419-a08d-50b70210361b@muenchen-mail.de> <CAD++jLkmeEoynOurZoSB_sz0XfJupiJcLPyWqbTe6fQFpYJotQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_055625_848559_E43FE4A1 
X-CRM114-Status: GOOD (  19.61  )
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

On Mon, 19 Jan 2026 at 10:00:06 +0100 Linus Walleij wrote

> On Thu, Jan 15, 2026 at 8:16=E2=80=AFPM Thomas Gerner
> <thomas.gerner@muenchen-mail.de> wrote:
> 
> > I'm new in working on the Linux kernel because of my BeagleV-Ahead. Next
> > time when I send a patch I will use git send-email.
>
> Will you send a proper patch for this?
>
> Otherwise perhaps Drew can send a proper patch to fix this bug
> so I can apply it?

I hope this time the patch is proper formatted.

---
 drivers/pinctrl/pinctrl-th1520.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index e641bad6728c..83e9c9f77370 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -287,7 +287,7 @@ static const struct pinctrl_pin_desc th1520_group3_pins[] = {
 	TH1520_PAD(5,  QSPI0_D0_MOSI, QSPI, PWM,  I2S,  GPIO, ____, ____, 0),
 	TH1520_PAD(6,  QSPI0_D1_MISO, QSPI, PWM,  I2S,  GPIO, ____, ____, 0),
 	TH1520_PAD(7,  QSPI0_D2_WP,   QSPI, PWM,  I2S,  GPIO, ____, ____, 0),
-	TH1520_PAD(8,  QSPI1_D3_HOLD, QSPI, ____, I2S,  GPIO, ____, ____, 0),
+	TH1520_PAD(8,  QSPI0_D3_HOLD, QSPI, ____, I2S,  GPIO, ____, ____, 0),
 	TH1520_PAD(9,  I2C2_SCL,      I2C,  UART, ____, GPIO, ____, ____, 0),
 	TH1520_PAD(10, I2C2_SDA,      I2C,  UART, ____, GPIO, ____, ____, 0),
 	TH1520_PAD(11, I2C3_SCL,      I2C,  ____, ____, GPIO, ____, ____, 0),
-- 
2.43.0

Best regards
Thomas


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
