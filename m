Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552C2606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 18:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kZ5eGcvF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=anZF/IJZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z8LsLJRb6Ngva4q9tNbcv2rWPYq818a1aeGgl79ky/o=; b=kZ5eGcvFQgRQinNAu+RS6UEXRD
	csNhD5EeDzhfzsvcaJuCMG0eTGAqCCga9GISrdED8RKxwTECtFvD3aRvKejpkoM7wC4fH88KW85LJ
	6fU8anIfCJbSY65WUym8L5GU2+jvL/vvePVzvpQoqUq6YsdORBM6qekQfnC/42hXCImP3K4g0I0VT
	uyD/ksWe2Uezwe04LleYxu14gVnImBERgklQkDJzJLpoHVkMu/4OFmQ6dCtHL29a7VYqEN2//bs5C
	koWEhNPw08Q+1qWRlm78uYbFL702D6uOjvD7g+yL1JfaMMISu0GRaUMExIVP2KNsQAyHjjI0nFBG/
	qGlos7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwy-0000000E9H9-2ltz;
	Thu, 26 Nov 2026 18:12:04 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwt-0000000E994-1EOu
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 18:12:03 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1b589050416so1452153c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 10:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716718; x=1796321518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmI1RLwiar2heLlFaWJ26IPV3Xx+MW05Ao+rpfa4gPo=;
        b=anZF/IJZFuUcB4ooc+yQQnvKygZILXaxBJN/0jLjvEgyU5g8FejDxSSCx9uMfhs4rU
         fJK0qMJi03j8tPf/1pdvXXtwaQtDjunW6Q9MUk5tdXdR2Z8U6d7Jf9DD41KfPkW6rxa4
         w7AfI4Xk1vY0BE1bazfkH09WrqhVGICHnfbc2EU8+SNpqZpkQTAsmBHydyWSMH4VPnrQ
         PQ2S+2jGmPyiDGIfVgtvnWqMgTMgH51r8aY7C+ClsuziagWc5KOrQhl79aK2q42mWoPP
         i1EWMBT0+UTH2RFO692rZLhE/KNfQpZdvkKU4yPoBea1Ddz9uhDfYAPEXRhNZOTmR0hT
         wsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716718; x=1796321518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VmI1RLwiar2heLlFaWJ26IPV3Xx+MW05Ao+rpfa4gPo=;
        b=YrEjTisyk6eoebowQuOOy9DBdO1mUykQkY8ilLmrOqR2VzSvuM+ZWRmTn+8SNfQhfW
         n/u/AZOR6QcOBlV2NrsxTAz0ltroeerT4NznCvYJnogK2VABIpzUESatZWfb7x5piD6G
         FKv3ky2CJ5mJrh2evvsxL6LWG6D4IcRgOeY2FLJbbnF76tcNJGtLimCv2Nt83FGzX5+q
         zUtUjgGylKarMyNqD2l8MSEJaT3Erzdlfht1K7mCUoWzeFxs1gErCfg7hpjSVILeSJmH
         i+2CeWMfxH3AfwdU7vsPl9F8yRNRk8wKjlraTNmyUXo4OiN2pyjVf7xwVbsinpLN1ayG
         DRQg==
X-Forwarded-Encrypted: i=1; AL+hErEPRt3BvTW+vy/wucDJ06B3bGFGNGz0jTZje+VjIbmasHBR4ri4Tk0NAP1XBHNzEgLgoBRq1O3wj7PQ4w==@lists.infradead.org
X-Gm-Message-State: APuU4Z/d/jgFj19VC1hQl8DKO9/REce79MhccDENcCfPen8MwcuQwe5Q
	542oPIoXrFCCw/hZDsU66wsaaPj1hxklJzoIRc4RKzpw7u4ON1lLKVQL
X-Gm-Gg: AZFdTZeebvzZ0PtPQOqWf5hhutSgYIpQyJudzMq2/otqgpQYMzOl4raTYP1KwRjMqbH
	FA4HUuZZn/D/yqfnUFHt6lEZEk9fHzeHPvDoz4lPjuSsjqCzat5SGPzJo21GaIqNiv76N7dY8zp
	AIsAbDgCZAta3s/Y8A2Y5ElZWWwWH0VVuCV/z8rqht4x5311VKlmBBHhWBmKFwCCp5RdtfsDshV
	ddhjTlM0b0EDvY8rm97wiyWbxuzar7ZGFOHb78xpT+VXj39EEQeO+FsKCRGXeBgTVkgkhkjLpUQ
	mzOV9iVPpN1x6J1cpQCxRFd47cZjyKDlPhYZWcboDZAsPN0S1/rFqQVd1tqw1sKKMRYmc0/6soX
	ZnYhewfeeOHtvqRTlv8aeh3WCrwstKlrAg4QB/UjzDfjHXF8YluNGwEljeOtjxFI1lfI2tZDV6K
	1l0dtcSzCuGLHpubEYZQR6qUALszidaKbCF7RYfVQRd8T5/VEh+wUybBfW5W7VdzXGM7SWw6i6w
	+kr8sZsTJAo/yY5hdaDMZPfAubBFPCr8UfSSlWgel2ibvNpXg6KavkXorYVsWheWO2FntD84QR1
	V7ifdVARsDZhryegTFc6XRfQ739RpXFXZLtjRteYq8EdWxZCpWzrRFvlfMc8jm+qEoe6O3/qJDp
	ehsjwPLHRUaU/253EuX/cPwI=
X-Received: by 2002:a05:701b:2815:b0:1b5:22d1:1eb5 with SMTP id a92af1059eb24-1b55693615emr22539079c88.37.1795716718270;
        Thu, 26 Nov 2026 10:11:58 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:57 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 9/9] MAINTAINERS: Add entry for goldfish timer driver
Date: Thu, 26 Nov 2026 18:11:01 +0000
Message-ID: <20261126181101.3715754-10-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126181101.3715754-1-visitorckw@gmail.com>
References: <20261126181101.3715754-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_101159_525219_82581ACD 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There is currently no MAINTAINERS entry for the goldfish timer driver.
Add one and list myself as maintainer, as I already maintain the same
driver in U-Boot [1].

Link: https://source.denx.de/u-boot/u-boot/-/commit/909f717eaf29 [1]
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d738990161bd..4e3c24b6888e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2078,6 +2078,12 @@ M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 S:	Supported
 F:	drivers/rtc/rtc-goldfish.c
 
+ANDROID GOLDFISH TIMER DRIVER
+M:	Kuan-Wei Chiu <visitorckw@gmail.com>
+S:	Maintained
+F:	drivers/clocksource/timer-goldfish.c
+F:	include/clocksource/timer-goldfish.h
+
 ANLOGIC DR1V90 CRU DRIVER
 M:	Junhui Liu <junhui.liu@pigmoral.tech>
 S:	Maintained
-- 
2.56.1.839.g22a8290db9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
