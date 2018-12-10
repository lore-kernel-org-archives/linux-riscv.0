Return-Path: <SRS0=uc63=OT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DB5C5CFFE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 20:44:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A09E20821
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 20:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SoOS3cNO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJln4k22"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A09E20821
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WOCyQAeREbr3q8Ps055ntb4k/k9FZwuVLwsKlkVpRNA=; b=SoOS3cNOJgYmtj
	St50wO62UjLs261Bn7UIQYvBanpvwMxrQJXLcaAjJLLm4wa7w75q1W+igq27ks8RD7nomK+WC1hhV
	FVrwATfmm0nP85RRMVTUfYz80s+3x+ox6z2Wv8U0+1jL0uI/ryXkxyHsUfqh6grpQ7ffejSeJ/A3Q
	w/VOQyRaLAQn+IYrGHYCr5Qg4WFn2OCycf6mioSabM4rrQTdmDHz19SINn2Ydh4vXIu7zqFT7HSfM
	cz4hb/F8+NLTU8pjifkk9xjmhW6UaGmqjASJVaUa0X4Cnd3iXl2pZSdJLX1gqRaI4Is5O3uIE+4v6
	qPOkDSLEIiUB+o4quWJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWSPY-0007F6-BE; Mon, 10 Dec 2018 20:44:16 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWSPT-0006w2-W7
 for linux-riscv@lists.infradead.org; Mon, 10 Dec 2018 20:44:14 +0000
Received: by mail-wm1-x343.google.com with SMTP id q26so27612wmf.5
 for <linux-riscv@lists.infradead.org>; Mon, 10 Dec 2018 12:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uefm3ZE9lw/agzNbChLhzjwz+i4T80hrw7kvV4xOP9E=;
 b=lJln4k22QxOVNrMkpYbevGyfZyglumjTz5gy0AEk/ApQB8DI3Tg2PlayvsyFYeobhS
 LexeFZvkj9vENTHQa/Zi88EOwK9VxCCrVCt5pTEnxm1QDSK5bLBcy+cl0Xol3oGTjT7X
 9eBpTkx8028ZiKhbgxO25YXzL9Ck565csW37RW5ofO1yhp3C9ltb5jFPjRx/Wxgfofyn
 McpoC/odSpp2fJ0gOwC04u7ZQsmrV717iyaJvQW709Tq8p37Oq/OGxJ1Je38R7p6IKhj
 DKNPUznvEKSDTJzT8VjHBjUVP16vr70k96kQJk1JzGdQ8i6+KkHqgLiN8qXV+D7MW6Ws
 lCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uefm3ZE9lw/agzNbChLhzjwz+i4T80hrw7kvV4xOP9E=;
 b=sd055C6Ted2QkjCbRjuI0OWj/toG7LlGN3zpJgXC18gSP6NsGE/L+oImk4mj2Bgnoy
 rd277ckjLAWNimF7oDpzS8ddjid2PkKYcF34xwEecZskgGCYkG+Lk9b+c8fzKwAgOiWs
 HQWM3SuMtm48bKPL7fWGzy9E0hi3oW/4413r+SaYM3Cwjr0d4dFPgIyHptNCuC0tT4e8
 WN9s2QruzBZtAlo11M2QySzgTsRoDFxjCr4CdbypL+nXkWCiRjTiwuAfDPFIH1eDbAHx
 Z9Mp5CeVz5N9gD+V0dWDTbUeDFk+IdRDlE3LDvTCLtHmYPPTqJmdUtBcldM3HL33SIPQ
 SvBw==
X-Gm-Message-State: AA+aEWbhglxJ5pxoF1ThSJr+kZKYz5HeAok9kFONlmu09vS0xFxIeOm5
 7Sb3iYnr1cjjo85OB4TaD/8=
X-Google-Smtp-Source: AFSGD/UQbKAhV5/68hQccEBYNGPUjlBY6TQUD6heUBa07jLg9Y/PANyeWS3oTL9fp8WXRMYd1Ix3pw==
X-Received: by 2002:a1c:c483:: with SMTP id u125mr11622133wmf.14.1544474639748; 
 Mon, 10 Dec 2018 12:43:59 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id b131sm26985wma.21.2018.12.10.12.43.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Dec 2018 12:43:58 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] Fix next-audit branch
Date: Mon, 10 Dec 2018 21:43:53 +0100
Message-Id: <20181210204355.3483-1-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_124412_833719_C2BEB16C 
X-CRM114-Status: UNSURE (   6.67  )
X-CRM114-Notice: Please train this message.
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
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Intel kbuild test robot reported on Dec 8th, 2018 that next-audit is
broken. This was with riscv-allmodconfig config.

There were two issues found:
- We don't generate functions needed for trace events;
- We are missing NR_syscalls macro used by kernel/trace.

David Abdurachmanov (2):
  riscv: define NR_syscalls in unistd.h
  riscv: define CREATE_TRACE_POINTS in ptrace.c

 arch/riscv/include/asm/unistd.h | 2 ++
 arch/riscv/kernel/ptrace.c      | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.19.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
