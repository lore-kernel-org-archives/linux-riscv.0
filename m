Return-Path: <SRS0=WRFO=IO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85212C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 16:05:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24ED064FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 16:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24ED064FA5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=carlosedp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UWJcBmWC+Y1Oj4B/wRu2HzF8+t3oWy57aLw40xXNdqA=; b=UFjTGb/7bGIBY7dMUQUA6KaKPQ
	Sd4q0MvBiojhOf4jzi02f0NEAVzqK6ojIPqd/0ZxjXbOCUq7MeKzyz7rJAUUQ14T92Ugn8XGAX8/j
	pmYar8yx7muQ7YlkKGTI+T7rdlWcCldF8TYGbkF3AXdzqwPVV4wG+3ko1JIORRrK+Bks9CGzPYLgl
	plqi8Vcg/M/4g7ApcNOkqRuMo10ahf2Vt8/t6xGwZgPo7J458vVyeTu2en1aDETbUgN/q8R2Iyhqx
	qcDlQlXM7Tgll9aAPTPYYx05uVwStQc6YWBBBr8nCrLHmjpPaFJ75hq4jtwdqH6og52xateArbLpq
	C9vvt/6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMCBT-001BdX-PC; Tue, 16 Mar 2021 16:04:40 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMCAj-001BTI-Gx
 for linux-riscv@lists.infradead.org; Tue, 16 Mar 2021 16:03:58 +0000
Received: by mail-qk1-f170.google.com with SMTP id s7so35723140qkg.4
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 09:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jn7puAXTFIhUgyhOIBysq+fpBrgiBa64dIrmZ+W414k=;
 b=cNO0HmZm2r8yDIZZLMP1U6HzMeXT+YJcmbaa0u192l9OJG/QHzLpobPJ+8D6HOxOl2
 VDcZUmn5RzUTSIhID2JsuJcZJbp0dWxntUqoLBq4SNEUU9pPRGLLXvF78ZQW/mlyLncy
 R0lziU/FqZdQsg8ijkPui5xWuWdYFQPpiAA1kI7jxYu6Os6HvtxKDaSiPHZqAYCpiY4T
 xwfewyHmIrqNrCr1Mtj+4OSi+KOVohhKvNzm20WC343YL8YlhoBSAhDqrPN7I9IqwHqU
 +eTMiN4EvEv+h+pavluBSfrWGYMdNYHRxBl6ijCO3NEFsm3zt10ac32HS2lyP9RIZ9v4
 62eA==
X-Gm-Message-State: AOAM530F5crSDvm/nGdDME/m3apqejsqU34+Ui2qEft6e3hPvhJ2Ity2
 YYABTgHvlkp9SzLF8wv4tjk=
X-Google-Smtp-Source: ABdhPJyqbY6J/1me1tmRW0knalPGMK+IS3TX+RaT2yJfiWve0JHHpTrsJdMXTcl+jVayjXVyv/EdDA==
X-Received: by 2002:a05:620a:46:: with SMTP id t6mr298549qkt.358.1615910630576; 
 Tue, 16 Mar 2021 09:03:50 -0700 (PDT)
Received: from MacBook-Pro.internal.carlosedp.com
 (201-0-65-182.dsl.telesp.net.br. [201.0.65.182])
 by smtp.googlemail.com with ESMTPSA id k8sm12080356qth.74.2021.03.16.09.03.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Mar 2021 09:03:50 -0700 (PDT)
From: Carlos de Paula <me@carlosedp.com>
To: 
Cc: david.abdurachmanov@sifive.com, Carlos de Paula <me@carlosedp.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH] kbuild: buildtar: add riscv support
Date: Tue, 16 Mar 2021 13:02:43 -0300
Message-Id: <20210316160242.61712-1-me@carlosedp.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_160355_633695_122CAB75 
X-CRM114-Status: UNSURE (   6.91  )
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

Make 'make tar-pkg' and 'tarbz2-pkg' work on riscv.

Signed-off-by: Carlos de Paula <me@carlosedp.com>
---
 scripts/package/buildtar | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 936198a90477..221aa7df008d 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -123,10 +123,18 @@ case "${ARCH}" in
 				cp -v -- "${objtree}/arch/arm64/boot/${i}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
 				break
 			fi
 		done
 		;;
+	riscv)
+		for i in Image.bz2 Image.gz Image; do
+			if [ -f "${objtree}/arch/riscv/boot/${i}" ] ; then
+				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
+				break
+			fi
+		done
+		;;
 	*)
 		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
 		echo "" >&2
 		echo '** ** **  WARNING  ** ** **' >&2
 		echo "" >&2
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
