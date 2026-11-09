Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EE3606A321
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 18:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UyjQfOU2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=HrKUftKN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qZLj30uws9ccQMF9duvm1NCfpoXNB0s9gpvwizWl0y4=; b=UyjQfOU2AXzg4C6WR+pXKqNzMo
	rd5AcF9lBPqVsNLC8J2wTFLEYhzERjguhF6l4kHVtaTkGEPToUxAbVvM7tGjC3y4UtaIlTGVL1lGS
	6r9Smj+bQCxIq4mVH+Qr4uaOdhHfrdyzpBLGQpYeaN3ab3QzDSFDqgMYuI2x8u5chs0XHUm6Z9+HS
	hbsegEs7QkGqWKgz0U515RBS3Ld3v6pgrh1a2Pxs/oDXQ9knyt3VO2rZwq2whMkEmdtFHJsEEqGWO
	j8eFOr6z7VpZxaVclrLUiT4dM+KXyQYhQUXPq5Saxp+/A3UTmvzu0k7pJipxK7miKd7x0qdVIJz0H
	D/1VeKwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQThP-00000001Qk3-1xyg;
	Mon, 09 Nov 2026 18:02:31 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQThL-00000001QjH-2omb
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 18:02:30 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id BEE3820DB5DB;
	Mon,  9 Nov 2026 19:02:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id A100920D7CEE;
	Mon,  9 Nov 2026 19:02:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr A100920D7CEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794247345;
	bh=rq/gVRzc6NYvKxcKfEXgG66peSZidPjTyfqE5LKg8gE=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=HrKUftKNuljCyYVA6RIMTgWRhey5UTmylQbgazqyHFKGR7bKLES8B5c5p1nAxu8JL
	 fAZMCOmIy5exdfkuWQDQM5SPU1tK+ll5G4+PfvQ/jnzSrgb+2oErzQkmfYQ6OyE6Pr
	 19NsW3aJWorciwF4CpZcHP3LAse/d1P0SMBBpW2RAvmpVDkr66oD8f0MFfuu6CRTJ+
	 oxdgYFzAfxBtSjObN7/cd4UZgxA08AsG/eTfI0qRKBKK5UgTrNf81RB2K/gB7GgU/p
	 yrwxB8/0NSzClzGE/fTVINvXFh3ZK6TdIjPPBT48yObfOUWZeaj/SWAXVC/0XRy1Pn
	 eBLUJYdExP15w==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id 6P_hqUnXJV0x; Mon,  9 Nov 2026 19:02:25 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id B881320DB5DB;
	Mon,  9 Nov 2026 19:02:24 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Bruno Banelli <bbanelli@gmail.com>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Conor Dooley <conor@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alex Elder <elder@riscstar.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: defconfig: enable dwc3 and the SpacemiT K1 thermal sensor
Date: Mon,  9 Nov 2026 19:02:05 +0100
Message-ID: <20261109180206.323394-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109111155.293849-1-frederic.mahe@cirad.fr>
References: <20260825052233.66850-1-bbanelli@gmail.com> <20260825224905-GKD631715@kernel.org> <20260826-ought-tableware-73678af4dd1f@spud> <20261109111155.293849-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_100228_977279_83EC50C7 
X-CRM114-Status: UNSURE (   4.67  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Note for the USB-A ports of the BPI-F3: dwc3 alone is not enough, the
VL817 hub also needs USB_ONBOARD_DEV, which I sent separately:

https://lore.kernel.org/r/20261109175555.323067-1-frederic.mahe@cirad.fr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
