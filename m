Return-Path: <SRS0=2lO5=O3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3373C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 00:10:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82EBE214C6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 00:10:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RrPpeug4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="VLm5OZtM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82EBE214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzhMxCWL9GWtv71lzjkee/e0QiwxVG+8Yi0A4Keh9r8=; b=RrPpeug4nwkJvM
	GkebzE5kCyPDTpfUxb6B3sfhKBia+VvBFrsqtdyRy84p5dgaID9Ydw8XqXYm6/MaUYr8JSd95cKzg
	uY9AkDwv/ySvZEsAkdTMpbrJ6dt51TuBfaiUQvofeaV+bMWx7XmOl/q8gToDHzlDXj/xeGic8nYzv
	QGnYZL8hNo2jFmBGKAacEyF8sglZLM4hmHTgPmCcf6MEZQZ98jAxn6YnpVCV42Lj/Qx48qATN+W0V
	1Xs/UwzyIxgYDHad4fOycyVPQcwjWS+B+qhRr2rTSlQ5qFTUHHTudfMi7FRi1196zkE2w6pJtgheX
	9f9eJE8Vy6hsdPeojjCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZ2xn-0003A4-Dy; Tue, 18 Dec 2018 00:10:19 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZ2xj-0002qw-Um
 for linux-riscv@lists.infradead.org; Tue, 18 Dec 2018 00:10:17 +0000
Received: by mail-pl1-x643.google.com with SMTP id g9so6900871plo.3
 for <linux-riscv@lists.infradead.org>; Mon, 17 Dec 2018 16:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+xxpTAjzTNqqNaFYU9Wyu+uP/lSy890ha1exRAWavCw=;
 b=VLm5OZtMkWQ/pMzVbrc49sZ6PvDkO2XPQFe/fs3gvWtJEW/jhCdq6Pfkl8e36DkTuq
 cd6rEFakFg9/axu+4ub8GYUG2TusFfGw4GYt3YjVfdBKYXBqCWlLnqIGpsFdnyaS8Fnv
 np2iERdSEoxG491VynQDJh/wAh3BHb/PRYIzBLKumJaCGPXetYpWKvhPVv9v7Vl3NlGF
 yT/cMiM5kb2gQpLHPoQWA77KiV7heJcO+nf3nKgo8uRAsaBdpJu53FiGIBaTvD7uV7NJ
 QPJW9iIecwD/VOnDi2sUSiXrKfIAMpFuNae75t9xXVXjULOcO9osUr+eHpUo+dIzRKMw
 +oKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+xxpTAjzTNqqNaFYU9Wyu+uP/lSy890ha1exRAWavCw=;
 b=SFNp1sRsmSKY7gzVhuvI9PWCkdRmzgBwPi4hCWuZG6AT7sPG8XGOcJiaMubFVmxGNw
 63UvVcDvApfQbKTigG3yT22Pp1aumdM1cKZMKoIHt6I8U7oy1BkZs6Z1qops9Al6lgk0
 8o88h9M28Y15qYREbHqdrj4FV4kSiSy0C3Tg5DX2rnVWsF6+A6WADKvcmxBMlW0oJl+n
 Yayr1u3gSw04lPXqhmStnUe97dLpCFYW8VE1nQ2gKfjs3W2buZaxJfZeLKqkaMsZYSw6
 BtPrdFhRKExiDROJkEWsbX/LaYXC5rRm24COw4i9KpFQfiz65ljaqtkOjumZYYZUslWj
 FITw==
X-Gm-Message-State: AA+aEWaohtU6sMyvAQYFFCIj1eZk8qwXhjwswsPiLVc+xlPckQLywxGD
 1GySl1mtttUl/AhM9/FjWkrh9g==
X-Google-Smtp-Source: AFSGD/WlraVBlHzckQEn1dhauv4TW0MKPRrgrD1BS91EV6LDT3JwZB+TCPzJGN3rDpuSGOL1+pZL0Q==
X-Received: by 2002:a17:902:28c1:: with SMTP id
 f59mr14475737plb.37.1545091808554; 
 Mon, 17 Dec 2018 16:10:08 -0800 (PST)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id d25sm20878535pfe.40.2018.12.17.16.10.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Dec 2018 16:10:08 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MAINTAINERS: SiFive drivers: add myself as a SiFive
 driver maintainer
Date: Mon, 17 Dec 2018 16:09:59 -0800
Message-Id: <20181218000959.31352-3-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20181218000959.31352-1-paul.walmsley@sifive.com>
References: <20181218000959.31352-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181217_161015_996929_145C88B8 
X-CRM114-Status: GOOD (  10.14  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul@pwsan.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

I'll be helping Palmer review drivers for SiFive-specific IP blocks,
so add myself to the MAINTAINERS file.

Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b48686f02516..a8e5346023fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13622,6 +13622,7 @@ F:	drivers/media/mmc/siano/
 
 SIFIVE DRIVERS
 M:	Palmer Dabbelt <palmer@sifive.com>
+M:	Paul Walmsley <paul.walmsley@sifive.com>
 L:	linux-riscv@lists.infradead.org
 T:	git git://github.com/sifive/riscv-linux.git
 S:	Supported
-- 
2.20.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
