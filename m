Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D32C36011
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 11:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uf4GB8N0XHO3hCIF35GdkCJYTagA4oXTOmDKGcUmids=; b=47n7ENSBJKh6n+
	csK51u7aS07m5K1dXOglfQuHS5DdVZj8wZXx1g8kU2Y1zn3mMVaU9uKZCtjYJ2+2JOa0QkOaHSjPk
	WnCeymS0GJFPwi4VJyqg4sZ33DEkXhe+TVuyW8z3sqDiP2roJBywreM2Qp9u8Iw9ZTgjOnvxYUWVR
	Y4dSkQ90+MbsLojJntVFNMkJuIrlUJYH0QJ4azNUBeY7rn8AzeqRn/hBFW9855G7JEcKdaZYJ9DZj
	lZ2gADHyuDLw0LAkhevtX98J7cVtYRMPf71Vm0BQ5Y7HQBJ8yc3YA43wpbbs51CZEcdZC83yBEPm1
	nnIxh5lQDySq9CiTuxTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyqYf-0000000G7dH-2I5z;
	Sun, 30 Mar 2025 11:10:29 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyqYd-0000000G7cs-27Lv
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 11:10:28 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3035858c687so4911795a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 30 Mar 2025 04:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743333027; x=1743937827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KF09n6ohxZVdfCGussuOtctoxzw/9z0eF08JQ8zCyw8=;
        b=Os4N/T8LnOl1LqLShYGJzhauu4AxnieMQOkjz2I4xoIfXIFR8f06j99abY1douT1df
         Gb52wcHCPhB84OS8jFxEa57Mpsqhgib4OanjAiWEy4ELkeE3kWxst+Rd8c+WDVfI9R/a
         q/HFsxr/18uw/0dyW8EzshX2w2Ed0hpw0VgApiYtFz5LFUDL1uvYpVsAP9O44P6iRZvD
         soa1teO1EhuyVVJIsVLXZ1qk9N7BGrYc1Ek02q/s4gLeOnc/Qw5Z7s1m0awCd2BmKbqJ
         2b1igACHetip4mMxV95SMzyo+Ww3N+8v0fcfsF1kV4RXe+Vtd7oU3Zlx5YR9+QJqgwCA
         v3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743333027; x=1743937827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KF09n6ohxZVdfCGussuOtctoxzw/9z0eF08JQ8zCyw8=;
        b=tbXlgkrP5x3yM7D9l2CCSMJgZmp+1UUxP/czNZXV/GJfs5bToIPCVNoPVEg1j4PzLb
         bxwrRr0jr2G3v8Bx0vbdTxbXQe58WghFSaOs3I0ruEmiHvEbTJBeihsh8Of0X6atL+6J
         GAU6vIrtx0d50NM3Qnhpf4Da2TibiiWYLr7/HLbJQujjM2PEtgYUJfMbI4J50E21T8H5
         E1AqCCA9bO3RlY9mPjrWpC0uZQGqHm+WJUw3wDGYczHLrGNkQZ6BlxIU6hyZIHFjMBmc
         2pIQcIw7jDd/tyx5wIAgV9RBNdhxo5i+82G5ztozHpCjce31EmyM3h99h0TO3779/s/H
         xgrA==
X-Forwarded-Encrypted: i=1; AJvYcCUzIKOYCJ+MzlGV+15RESPZwKvAnG7ZraQxsO1BSLxJm4HT/RQbDNuzey4/swhPk3uRW66eZKCoZV8YkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuS0U3QuCZu8wfso4qXoKHrGOt9GAMyxZxYwQtrDodCA5evtXj
	3RDfu/BaI/APiHzPqcxPKJcsYjZWk+G3TWgQzL6bxTDYr9uxG3+2
X-Gm-Gg: ASbGncsQw8MfZIyRguO7XzyXtTbRGM5XZpvuecGSgOQEdXM6i3txg7A8IC+bSgQzPMq
	wgS0nfIKeBqHcDv3zNI2y0TVl88G7I3EAJaWev8sGUPWu4EnEyUHcnQeK14Yng2kQ6ICQOXakq2
	hcoNYdTG5Ffu244ArGakJsRi+N3quc7M4jMWKcHyASsx4RxbsWZD8sv56S4z5XBqfn1Bl9J6/Ig
	NSB23tXX6WXK8JMH+Ld+RJFr/9yNcT7bKk0eiNl6fuqJSQ4zrV6oKOQDlfRy7q6KVy/yI5Vv9Z7
	VWpmy4sAiWGC6IQj0uTuU0tiYUQ6qwZiVmKfEo6F8nXfAT2V5fQE8yRblrIONxNz0RmMU2xrFj2
	0roVpj/0lHlKpT8bDoO/OT2PhSyx+2vGAwlUYjXcG7g==
X-Google-Smtp-Source: AGHT+IFnbzl2epOSt90H01aDeUm2b0dBQj1iJ1sf8IFO6dYHI0OIszwKM41B4LCe7IBBHP62GqRyjg==
X-Received: by 2002:a17:90b:3b85:b0:2ff:6e72:b8e9 with SMTP id 98e67ed59e1d1-30532154023mr7903936a91.25.1743333026761;
        Sun, 30 Mar 2025 04:10:26 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.flets-east.jp (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039dff0529sm8367069a91.16.2025.03.30.04.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 04:10:26 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	samuel.holland@sifive.com,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	u.kleine-koenig@baylibre.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Ryo Takakura <ryotkkr98@gmail.com>
Subject: [PATCH v3 0/2] serial: sifive: Convert sifive console to nbcon
Date: Sun, 30 Mar 2025 20:09:57 +0900
Message-Id: <20250330110957.392460-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_041027_548543_4C4F297D 
X-CRM114-Status: UNSURE (   8.81  )
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

This series convert sifive console to nbcon.

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
