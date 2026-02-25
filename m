Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF1CEFD209
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 08:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1IR9V/u7GZx2iM1D4QuwZ6zh/h+AvBvF0dGwhzqMuI=; b=DwQPUAbXsSJkh1
	RGiWszwGwv+LPKQT0q0VpGt+H/ALdwWHmtV1iboj3zWhpYeHDN2ACr/BjLk/WqkwY8O8HlIhxgtAL
	bmixPTiCadJQxuv1A8NLMhB0lOfGo8PI3yQtyL8WTJOhosVqiAbq/9cg7USCD7ZWPr4UOawG/2j17
	Y5pbcTQD6LthWnUafhXwP5Jr+boBiswgi394mTBRMvJZ2e8hEs7VxfKxIyWi0qlOnJ90egkUi9z/K
	Gca7E7HwShxENJSWwQyUgFjPZFiuP6K2Y19iKiTuJCJ6/6j18FN70Qd8HfekxB0cjCqktiDj7MR9D
	Md/ZRVg8z/MIgNl5PcXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA4w-00000003WJj-3XV7;
	Wed, 25 Feb 2026 08:17:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA4u-00000003WGW-0hc8
	for linux-riscv@bombadil.infradead.org;
	Wed, 25 Feb 2026 08:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=pa4Mok84BgrIJ096oguK0x0r8biU2FN9KdJaqHRRdYY=; b=IfT59X3BstxtGUwLasJ/aB9Bat
	vW06BighADQHyuCUCX+3eG3SxEYg9XCpc+i9eJ25okWadr+9aDM+AXyk/S+asVYgr0BBdRJ83i+gv
	kyrIsITE49ub2vB/HsvLPhQ8RV6Y10gTVXf312B8mbvk17r0/PvMuB9SdSR506PR90kJXDu86M8Vz
	tl91ss2AF1l0XATSBcyLqRUoLC7XAzrdrR8fNTXe/vjpr6HynjEiGgIJeK4HZAZVtYTHA6+WLyQuA
	1/3GGCFjKfIOU9sXWteLw1QiGa+4tDtqKwszEhzgn6C7YeMnfe9clYImzcIx8plqeOXAo0VzXhiut
	a5+imL+A==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA4r-00000000jcG-0M13
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 08:17:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pa4Mok84BgrIJ096oguK0x0r8biU2FN9KdJaqHRRdYY=;
	b=aNXAIWBLIft0QX/4DQ1f0LaIY513LGp09vdlH8IPEOVOEBgHNzdBK1aznE4/QtUaGlc6jB
	yEMMS/7MsNY4UYCEjtIWQii1ctkkHdEtiju4D6l4GZHv59zYkdnFKzvlwxF1UycmsQVOhy
	GQftVhY1V4+llcvNlL0aKHaHhU8/n3M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pa4Mok84BgrIJ096oguK0x0r8biU2FN9KdJaqHRRdYY=;
	b=aNXAIWBLIft0QX/4DQ1f0LaIY513LGp09vdlH8IPEOVOEBgHNzdBK1aznE4/QtUaGlc6jB
	yEMMS/7MsNY4UYCEjtIWQii1ctkkHdEtiju4D6l4GZHv59zYkdnFKzvlwxF1UycmsQVOhy
	GQftVhY1V4+llcvNlL0aKHaHhU8/n3M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pa4Mok84BgrIJ096oguK0x0r8biU2FN9KdJaqHRRdYY=;
	b=Ig+rRKcRmjrvPvilOR5uDqcc/ayENsEkUZ12BM+gDuHeqMnIPk/DD5x1mqek68Lf65QEaL
	drHrYS9XGnyLNAYkKs8+moAdlaMYAQKHtaH5Q5dqAzALZVEAW/kyr4DomF1syY/O7nBnUL
	JkxcZKn2w5RjxgYT8ZWIC/PHHlHz4vc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-199-nAFljNsZOpiYJ57hUOCZnA-1; Wed,
 25 Feb 2026 03:16:54 -0500
X-MC-Unique: nAFljNsZOpiYJ57hUOCZnA-1
X-Mimecast-MFC-AGG-ID: nAFljNsZOpiYJ57hUOCZnA_1772007412
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 32EB918003FC;
	Wed, 25 Feb 2026 08:16:52 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.55])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A81041800351;
	Wed, 25 Feb 2026 08:16:42 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org,
	andreyknvl@gmail.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	linux-s390@vger.kernel.org,
	hca@linux.ibm.com,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v5 13/15] arch/um: don't initialize kasan if it's disabled
Date: Wed, 25 Feb 2026 16:14:10 +0800
Message-ID: <20260225081412.76502-14-bhe@redhat.com>
In-Reply-To: <20260225081412.76502-1-bhe@redhat.com>
References: <20260225081412.76502-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: v-nmVN-_HRLSHzE891Mx4S4XUuZSdPZh0lFDjvM99SQ_1772007412
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_081701_283212_C2894EB7 
X-CRM114-Status: UNSURE (   7.89  )
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

Here, kasan is disabled if specified 'kasan=off' in kernel cmdline.

And also wrap up the kasan code into CONFIG_KASAN ifdeffery scope.

Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: linux-um@lists.infradead.org
---
 arch/um/kernel/mem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
index 89c8c8b94a79..2bf858ab35b5 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -62,8 +62,11 @@ static unsigned long brk_end;
 
 void __init arch_mm_preinit(void)
 {
+#ifdef CONFIG_KASAN
 	/* Safe to call after jump_label_init(). Enables KASAN. */
-	kasan_init_generic();
+	if (!kasan_arg_disabled)
+		kasan_init_generic();
+#endif
 
 	/* clear the zero-page */
 	memset(empty_zero_page, 0, PAGE_SIZE);
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
