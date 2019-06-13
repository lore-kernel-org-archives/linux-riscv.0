Return-Path: <SRS0=HRsY=UM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D600C31E45
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2019 07:07:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F015E20866
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2019 07:07:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HRuNnw6g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DELSMDQe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F015E20866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Raj3/16QTIPvo7GQcUFe+R7DHlaVPLK/zdj0dj1sYJc=; b=HRuNnw6g8NK/7K
	JIT+bwzYrOAqg0gME/r4/pQAKr+0wmbHQgzuu+h/At0pr4Znk0PtLDKWAXBKMuyT3NP1QOfeVoJcQ
	+iwQPGxUQ84UEqo5uVtYx5wp9wOmlPTDZi9lNNoZZjsqFjImxmEOPzc5qVm/7PfRw5Sd/qTe4N7k1
	BcVxe23v+q/MamJJQrAoOOtytlw9fMpz8APChRgFQaf4IE870XdhNlVTSenj84Pap8VvfwrquZNKZ
	ekkTOWZAFA4qGXUNpuSMFhfYz8dzuEJm31SFfDJB1qGOMlzOIm8PGxBgEQjP2E6Gnpnrzw8TgU5vI
	3VD/RrWVeg4LNWl1ZB8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbJpZ-00042G-BW; Thu, 13 Jun 2019 07:07:29 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbJpV-00041n-F2
 for linux-riscv@lists.infradead.org; Thu, 13 Jun 2019 07:07:27 +0000
Received: by mail-ed1-x541.google.com with SMTP id d4so6303345edr.13
 for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2019 00:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3XH+XvSSdt+0M6n67F8uO788uZlWAtnvxIXQiaw/IR4=;
 b=DELSMDQe7XJ0TMJ6DnlL7AW8Brl4v7z7Y0Q+xvU5Ivd8ijh98pvN6mWR5TIpo6T9pR
 6EZvcsHpt/j2NMRM9Xz/kYDzUGw7NFXyku81YdVCy9C++GvT/b/t3V1/rCd7ptrRwQKe
 mnCKEE0lBPYwioRciPNmpOZxSzSw246ydf5zK2QwxTMu+2FR22ogFse3RJ1AZsPOSSxP
 iZHxqjIJN0H85XJSr0mSmy6BH1iwAXJoOKAeosA4y2WqMVQi4hh/ZEZloBmbkm4iqdxl
 wCUsNRb4pn5U0T71n/Lgst/h+wZ3P7NaAb6AAF5gRksrQvZuJa6GZVbvXflbaZAwpPNI
 vFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3XH+XvSSdt+0M6n67F8uO788uZlWAtnvxIXQiaw/IR4=;
 b=drl2xqXnfG8iq+UF6tYctR9buWcS50KtS6IYFZ6L/gUk9LFXTtNVt8nUGmcGhp6NbL
 dy/LXwdvDD4LRaYC24HxvPkSTMeOEOQK3Y71KXXjrFkfkznici7v14eIrzwq538dRKrG
 NXwcsoIxk2++l96H8vvKQ5BTmYrbUFz3G/0xsyNVjJNqa8jQYO1Rc7E+3PauzfFLtkOn
 eAhvHlZoAkbI6nEOxIS/OBTVWneIq5/+9zVCsjwzqbwf6hA+Inl1mt1Sb/ggD6G6UORa
 xCu5f+VTW5tnBPdqoxZae2qDL6QchxNftbyX52xb3rFq9U8denE4NkTVKlcQbSBsGsw4
 173g==
X-Gm-Message-State: APjAAAXhPjKwXbECbwKYJ11L93kgEOAPHWbh+hQn5HnTwKURIhaPkOD/
 82xKe3VEShCRKUrdtfz+g5DRGw==
X-Google-Smtp-Source: APXvYqzr2SStLNdfff6Ri34lOVzhgnk6X0VViA/E/OlTxqB7DK5t8gFHo7O2fVrIoWf1NQJawd8iTg==
X-Received: by 2002:a50:a205:: with SMTP id 5mr8215024edl.211.1560409643481;
 Thu, 13 Jun 2019 00:07:23 -0700 (PDT)
Received: from viisi.d.ethz.ch (mpp-cp1-natpool-1-013.ethz.ch. [82.130.71.13])
 by smtp.gmail.com with ESMTPSA id
 b53sm641976edd.45.2019.06.13.00.07.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 00:07:22 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: change the arch/riscv git tree to the new shared
 tree
Date: Thu, 13 Jun 2019 00:07:21 -0700
Message-Id: <20190613070721.8341-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_000725_751205_2D7A6D29 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, palmer@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Palmer, with Konstantin's gracious help, set up a shared kernel.org
git tree for arch/riscv patches going forward.  Change the MAINTAINERS
file accordingly.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 57f496cff999..290359a46bbe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13476,7 +13476,7 @@ RISC-V ARCHITECTURE
 M:	Palmer Dabbelt <palmer@sifive.com>
 M:	Albert Ou <aou@eecs.berkeley.edu>
 L:	linux-riscv@lists.infradead.org
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 S:	Supported
 F:	arch/riscv/
 K:	riscv
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
