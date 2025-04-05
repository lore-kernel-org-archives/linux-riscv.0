Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77490C36010
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 04:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d04vSJovvYwvNgF/MbEXU4awcB0fxsLUUaxIeu83Tuk=; b=f0g81ivU4gmDu8
	JI+W/tWz6DlWERYnhutnb0iraA6QsNJ8Bx1xscObP2zkusJDkAeYLLbP3lRRZPSKj0fuuun/vGRKt
	PfbNsKukZ8Yd+HhZt/BfDt7ibXtaP8by7zmvCSzN7sUGFJU90UXd8andqqZHII0OJliaVeZv3BtXG
	wy4cP5I06Amobcb3/4I0ojGt/kVDTXep0/ZXWgNIHs7y0xTLFLWjUO/zpi8SmvyP3XvDOXBJlZlep
	YJcd6eY3mLeWv1Z9ICMWGBV8gRq33MrkesMmu3kPnUybBKC0rEKhCciSirfPN2RSWT3mwWRgleAsI
	YzIOp3oxVtVTfdEYvhcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0vJQ-0000000DSQh-3diu;
	Sat, 05 Apr 2025 04:39:20 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0vJO-0000000DSQN-2UiG
	for linux-riscv@lists.infradead.org;
	Sat, 05 Apr 2025 04:39:19 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22423adf751so27301305ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Apr 2025 21:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743827957; x=1744432757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PrWZGwWQGkVkJ73F/kcmRnf0IHKJhsNVWipXcUGTA3M=;
        b=OjvC/T9E0BXrwS+2n5tgZ4PJYImPlzS1MViL9OnjdeSj8oiPmjw158kBDOQ8ky5X3H
         wP0uiv3MFzw39UuaqrO9Mbb73ArYou0BdxaQSLxyT7M3Hxg6Z/dZScpKB3K3A9SMpJan
         FqwZq98kVYWksQJcFkfN4sLgioBR62IvMSuLf+ohXE77AcBSmMJmKuBnVsVYVjzdTEqL
         0H0dc8PWYy+2xbC9Wa5WDhI6Gl3jieXefIpl2holCWHBHffvmpdVn3IV5qy00kHd8kMD
         H+bu8PKKiTkC3u8ifjkL/CO3yaqJPkJvNDItv43nlGnV5hX4qi3UPt+vyDsv7YqfVQKL
         2I4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743827957; x=1744432757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrWZGwWQGkVkJ73F/kcmRnf0IHKJhsNVWipXcUGTA3M=;
        b=Y4NcJ8QphH6xh67Uq43HZXVaEdUJuZmnDvp5dL/96FqFn87MOo2ps7+BJoodnCvt3r
         Xdu1Fi6MZ/5lMTfjp8rILjc0rafO9xkoIbTuOzkaBqB/pr7BKRtJyOkyHoBb/C8PmsVy
         kmu2IBvFAdSJ8P9n8VOzrYhYjYC+Frm3Z+tC4QJNWt5dy362zpW+0pE/VnG8mc6ylIqD
         bhhLI1kJmNGWBvzgGiYrsp//WHn8oohcn5wQYe1dmlc3udlzc1RmVJyQpCjzDcN9f2Ie
         y8hehoqyPCDiZHcxRgDDgNjwB1WPwC2f/EMYD2U3hwxWPAreoY/cGgSBTJ7a0dpTDT19
         w/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9drFDxB7kNbAIWHHYVCGrN1xoUdOvHWeYOvksjUcoglsbvtN4fEqWZRJAhDfBVM2mQcZH0mBi6i6T0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCO5WW3FBmd+m/NI2yZdioIBpGQfFtM/w1q7LxrNH6gGosRSsi
	l9aREYaVrPexOqd0noWhlJeOo914bMLZ8iBxcxZbfpyjqEK7hU3B
X-Gm-Gg: ASbGncv1RHn765fJRZ2RH900DTmUMP4kv43PKZKI6xVvKdcc2JRwXUDPBDeeoTm2uhC
	ppO2t3MJHqyO5vKZ07XJnI2inwSEukV5GFmLlqjLA7gizVuwMvLo91FgbwglZfIlWJ0SBpQdNeZ
	rjJu0PIal9pPQ5MbzP30nDPpM/889dgokfvQGzoeKEw64EzSZMs6blVx9nUsEsQxfgRnCK+LdOJ
	z8k5DZGinr+BTbj1cKQSQqed3ZUEpUhTBTBLDje+oPW5s2CDvtFK7tdbJWJ9WCUtXnRseHLyifK
	nDcdZFCC80xymjGHi6Yw76l4Tn/UOwRA6RFow6Dh22M3xfcb80y1x9wIxJI7qOZE+iJy75ynvj6
	n3eG//QsmdFZ7kRaF2cZqwA2VGAGShsw=
X-Google-Smtp-Source: AGHT+IHVf1Jyf2BIztCcwsxW1K4NHjTJ2Z2WJWU7kqHEvmpDKO53+ZaFJC/SwIG7i3Th3My/VqCZfg==
X-Received: by 2002:a17:903:1209:b0:224:76f:9e4a with SMTP id d9443c01a7336-22a8a05b5cdmr77779355ad.14.1743827957269;
        Fri, 04 Apr 2025 21:39:17 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978771190sm41441795ad.211.2025.04.04.21.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 21:39:16 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	samuel.holland@sifive.com,
	u.kleine-koenig@baylibre.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Ryo Takakura <ryotkkr98@gmail.com>
Subject: [PATCH v4 0/2] serial: sifive: Convert sifive console to nbcon
Date: Sat,  5 Apr 2025 13:38:33 +0900
Message-Id: <20250405043833.397020-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_213918_640686_73FD6F1D 
X-CRM114-Status: UNSURE (   9.36  )
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

Hi!

This is v4 of series converting sifive console to nbcon.

The first patch fixes the issue which was pointed out by John [0] 
that the driver has been accessing SIFIVE_SERIAL_IE_OFFS register 
on its ->startup() and ->shutdown() without port lock synchronization 
against ->write().

The fix on the first patch still applies to the second patch which 
converts the console to nbcon as ->write_thread() holds port lock
and ->write_atomic() checks for the console ownership.

Sincerely,
Ryo Takakura

[0] https://lore.kernel.org/lkml/84sen2fo4b.fsf@jogness.linutronix.de/

---

Changes since v1:
[1] https://lore.kernel.org/lkml/20250323060603.388621-1-ryotkkr98@gmail.com/

- Thank you John for the feedback!
- Add a patch for synchronizing startup()/shutdown() vs write(). 
- Add <Reviewed-by> by John.

Changes since v2:
[2] https://lore.kernel.org/all/20250330003058.386447-1-ryotkkr98@gmail.com/ 

- Add Cc stable for the first patch.

Changes since v3:
[3] https://lore.kernel.org/all/20250330110957.392460-1-ryotkkr98@gmail.com/

- Avoid using return statement on return-void function. Thanks Sebastian 
  for pointing out!

---

Ryo Takakura (2):
  serial: sifive: lock port in startup()/shutdown() callbacks
  serial: sifive: Switch to nbcon console

 drivers/tty/serial/sifive.c | 93 +++++++++++++++++++++++++++++++------
 1 file changed, 80 insertions(+), 13 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
