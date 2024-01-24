Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235A1C47422
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 05:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLAK+KLj70piHun82FTxPmQBoEF8SOFR7epZk+7taus=; b=HoKrmx/sz1fp6K
	2J93eixBPp6JlnJoQXvsayLB0TsEY9tzl3cJwa482oo+TRJnqbjTnOZabMVDvTm+dxi2m7RY3o/El
	awPyP2bQXuQ0E8HibJ5fshQBiQ/6gPPT2XL5arurMvZ73pAPNtwOgbrr36fzsCiO+w5Oe4t37JES0
	xtBNii4gW6l+PVsoyzgJYh0qwlT3upF8D8u/NxP2hI2Iq02+eoeU7NIps/bRa1Bs1VxkGqsncuzye
	ak1bT5oRtE5Zw/RLXjVWujbJKuEbVeDWcXQC6kLwo8mHHJaAqwbGn9k4xXBQ9PgmZHXU3MrkgDU04
	Djm5EujFt4ODYVAHCcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSVbo-001Y9K-1N;
	Wed, 24 Jan 2024 05:15:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSVb4-001XUR-0k
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 05:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706073285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3L4u54LHfqMXosGMqcQJnrhKT6dGGjewV9v1qvLObEY=;
	b=aZ7Dq0WtInV1iOJdIxNxbkuU1b9H1MohYVNSVWGBeF4KXz4/mZlNfzAqURIaR1FIQhySie
	MjNrY7mPVSKQ+brBGN9xTRaPCb2zAg2Ti70J9PndOCffN4a4vKKKzd/CBK9/XU1Aj2HKtw
	wFeRYCPTfHna1uEsnisSzref4cPzWYE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-aRLOfTZSNhm4Axm7wlbsBA-1; Wed, 24 Jan 2024 00:14:40 -0500
X-MC-Unique: aRLOfTZSNhm4Axm7wlbsBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2B7F85A58C;
	Wed, 24 Jan 2024 05:14:39 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21D6B1C060AF;
	Wed, 24 Jan 2024 05:14:33 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	akpm@linux-foundation.org,
	ebiederm@xmission.com,
	hbathini@linux.ibm.com,
	piliu@redhat.com,
	viro@zeniv.linux.org.uk,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH linux-next v3 14/14] loongarch, crash: wrap crash dumping code into crash related ifdefs
Date: Wed, 24 Jan 2024 13:12:54 +0800
Message-ID: <20240124051254.67105-15-bhe@redhat.com>
In-Reply-To: <20240124051254.67105-1-bhe@redhat.com>
References: <20240124051254.67105-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_211446_370924_23AB0FA1 
X-CRM114-Status: UNSURE (   9.57  )
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

Now crash codes under kernel/ folder has been split out from kexec
code, crash dumping can be separated from kexec reboot in config
items on loongarch with some adjustments.

Here use IS_ENABLED(CONFIG_CRASH_RESERVE) check to decide if compiling
in the crashkernel reservation code.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
v2->v3:
- Update code change regarding below commit: 
  commit 78de91b45860 ("LoongArch: Use generic interface to support crashkernel=X,[high,low]")

 arch/loongarch/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index edf2bba80130..57d37dd9f964 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -260,7 +260,7 @@ static void __init arch_reserve_crashkernel(void)
 	char *cmdline = boot_command_line;
 	bool high = false;
 
-	if (!IS_ENABLED(CONFIG_KEXEC_CORE))
+	if (!IS_ENABLED(CONFIG_CRASH_RESERVE))
 		return;
 
 	ret = parse_crashkernel(cmdline, memblock_phys_mem_size(),
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
