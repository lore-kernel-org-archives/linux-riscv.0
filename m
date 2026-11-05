Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B759C606A331
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OBPTdSh/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FZPLVsf1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezPSIOUY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3GLk9i7mG/Vgx2okZC52Lz8GCKgYzXYBiM7taKLNglY=; b=OBPTdSh/5ixWouCll0QciIQyPd
	cP2nlh/sWXa1T7HaUF5V1Ji5QGxhSpkGm3UdKZjhxqOpndclPGpeSEOSRrhY8n2daoFLaI1Ls58H3
	bT/D5j3MhRqyPOvfN0L/un23Z9lkmabUfZV4/Gxza04I3LZTDFUS2LhhIzIHARKHgwxaC6Kb7EpPs
	Yuqj2p1OzjF4/s2hH1KqSisi7LAJsGKBQZYtjJKNb7fmqszhZZQv6vb3yVPCLuTi8UkhmlOzWmV4a
	44QCVXJ2rfHL6pSYzfnD41T7xmrF7gWBXObTw/sKSPDjn57/x47GQ/JRawyP4YutmXuPjL84+rzbI
	9GZoprfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Ao-00000009ZXa-18Ir;
	Thu, 05 Nov 2026 16:18:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0AP-00000009ZNd-2wuN
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Nov 2026 16:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ikLnWdGJaSoPH/U14jM7TYXHq4I/0yZY+vfKoep/y3s=; b=FZPLVsf1VCJeOKcuAKb4No26yp
	FmvuLhUyC9bOlld8Ib0hzy8uss+YNnuznBjZjh3fH8avazEwbjVQ6MGQ4qVwhT3rNBjvDaxh8cZk1
	72Gq8FhfDD2J+URIeXHQrKuwVAkBuplzosXiiqTs7gxA8ukdR6V+o2Qt+/9hM+UkWT4BVq6Ty6b0i
	qVNm5nX+2Hu2tzsn5qs/QtuPJMeRH2iBT8uW8D6pOrR2IXv9aSpNWeoUu0xmnXPo+BgthwapbpuMs
	m27/NpUkcTFsunZ0uNZYn8n8kkQncGg5qCVyQ8VnjC8Q2Br40yfxrIQzVv22lG7AkKNlJ9oJUoIrR
	xfnWqTWQ==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0AL-00000003Eur-37q3
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 16:18:20 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1281871a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 08:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895495; x=1794500295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikLnWdGJaSoPH/U14jM7TYXHq4I/0yZY+vfKoep/y3s=;
        b=ezPSIOUYFri7/ct5S//W5xvnfm3idAUf24pVszj/1o8z50VPgGIJ2u40W6dLL05c4H
         I5171OMTnb/5uo59Pt9kmGOYE/eeb9UNGyeQOvjIRTUc4klyUaI9Z+iUnua3eRmyIoVe
         06D5LoHaJCKzv3lkzJbfqZeKng5ooqXMdNrGI4mUL/VbCFIjavNq0ycpuoGUWtd1OokY
         CYAQI0tk8hlSeIUfYwZeCMnC8UdWsPDSTxUYdTKg7j23yYn8tCzOjq03Uk1kcfCf380y
         7ZmXu7qCO3ICsv3qQKbbs+KMPxbokh16EpU+eWp+BceMDfpcijTq9eGNeWrJTFR0Tafw
         s6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895495; x=1794500295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ikLnWdGJaSoPH/U14jM7TYXHq4I/0yZY+vfKoep/y3s=;
        b=A/ZHjDe2zY6AWIySVOCDebbde0/2QwIBTjoiAXrRL4ZGQM/yFlkPZ4gqg3gx5HpiT4
         x4aBJTHeJyDZBR06t6FEYvl0y7wdtnj+hR+6snc6pkuC/GXG+mEOkyreshd8Tiq/2M/E
         yLPSYM9jlLLq13xMXogYvIyyUKmkWqrFQ3bxo6scxYaCV3BZXQXmuet0p2F0Sm+/1Pi7
         /HmkZLaeGgWXJW0pEwFR5vGp5n+AR+A8d8pYGxaIkBf5XAXWR/W1yPqByHU7nAonEdUD
         X2xz29mINd0eCkrbtrAJCcQxTM4OifhfgrgUo/chMVVaatdUR4TSVIq18ImuSp3B6SqS
         1XTw==
X-Forwarded-Encrypted: i=1; AKwUvBxuZoqQGIFF1OUOElAuDPQpEPY69HoIEDjyGyB8+9ysynIOfdgvPUPBVWUAAz8l+Idx/Q2rLzsY4lkfSw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8eQWFkhRXhEEIQfP4oSqNjNRoen2wrpYvMcivacr0I4EXks7Hx
	M9W5m6BWkY8l34ggKqQ3z720uNas3/z8pwTgO1GxoMf6s2dFRhUozfBI
X-Gm-Gg: AYBFou194X3n5vPyDrn/jShFKpAvNN4mWSAZVI3IgovzTgk0xvgtZKJKsrZ+26mtDtG
	OfcBUqgI8aQv/VF8Oh9vjR4JADA2Qj4yaN0HRaj3Nl6rp2jXA/RaZguuER+xQG+qLvhgtzjXVvm
	NWZDYHUUW6j1iWYzGG+Iz+E8j9p7JP9yHNOLVtqf1h+1EuRLYFZLlHzIqxvL2Z3kjhzXIZTBfTK
	3oLubz1dl7eF05gcdm/lr1hqfUl3EjF2y26fFlKBFBfQIHje0iTJCCTQzJ2HRARlf89vgK92sPQ
	ELMsQBBWpAgzia+Wa4CO393li+IIffsYRh3KC8YfLb9QdsWzpX8SJQiI6fauLjDAV2fXf/dJNmG
	2sCpQkugfJCl+kqlkFAxG28uQL5u4OxsP4IiL5XN6s+yD2dcfdJL1OEnN8rjW38yb4GKf717jM+
	83shBflSXvWI0xBiCcG8z2nfT3FszAk9z+NAhGaSHOfauxy4uJBXTZ/IEODAPCP0tLvNUsOrTmn
	tiqK2qxsvJhTI4xNerdLM5PGUVZ+Usexx75aJ65tFzC0K01L4hv3Jgr8byyDCEX/IHg33lX5ENy
	qwPYxOvepE6HoEhytrPtTLadj1yeehVQt43OugGfHZYsltGZPdj196KojAxLrSLBWsXyixmNPIY
	ol1uSfZjNTZ1Cdf2/8em4bTNnCrkh6fldWXuBOyAiiI6v
X-Received: by 2002:a17:90b:1d45:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3ae897eb4c7mr16890646a91.58.1793895495413;
        Thu, 05 Nov 2026 08:18:15 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:18:14 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 8/8] MAINTAINERS: Add entry for goldfish timer driver
Date: Thu,  5 Nov 2026 16:17:02 +0000
Message-ID: <20261105161702.3515900-9-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_161817_602849_FC9E9FB8 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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
index 93abbb315065..13688df0e060 100644
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
2.56.0.398.g882cbad275-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
