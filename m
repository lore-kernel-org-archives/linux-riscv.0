Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C63C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 12:45:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 932112085A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 12:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lb12ddIS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 932112085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+JKNL1nvUqgfuffZ5tG8wXCsTBdAFk99RlvMclo+4OI=; b=lb12ddIS65X2Aec8XSxR+u437V
	TkDX75zNPFkPxs17p7iQOJhjlcg3B+t8c7Mgui68T+0SStntXcM+LM6+dpL8saNAPrwfFShQx3AR7
	0GU0aWrQVzx5rgeDCpkNj/MokqWBxoYs6J2SIJP+5Ggl+BhklKuOJwkLSC0qGLiNJv6geiN7jegf1
	KbjoSdk99eLRyjxu7mh6G86xaSfJ1Tq+xxGgSMKFV5GyFEn5sj9WFqYCbx/QDaio3EF7GSUS8A7lq
	fh6g+/9I5XD4+Z47v42PgILtjzeurl7nYtadpdmZCto2WKpGjAZ2RDUergic38+KIflkxuvMlIQN4
	+vEdv4Yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2EsB-0005gM-7U; Fri, 08 Mar 2019 12:45:11 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2Es5-0004jf-6E
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 12:45:07 +0000
Received: from orion.localdomain ([95.117.97.241]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MXXhv-1hZz9T2kzH-00Z0GT; Fri, 08 Mar 2019 13:44:56 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] scripts: mkdebian: fix missing dependencies
Date: Fri,  8 Mar 2019 13:44:22 +0100
Message-Id: <1552049064-32044-4-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1552049064-32044-1-git-send-email-info@metux.net>
References: <1552049064-32044-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:OWyby/vHANVNNMYaidRl2wwWpg1kO3p0r+hXraXU1Tf2ssUBzr9
 dyd6kvrBNBzqHxakCo0LQvcZlH8oNuuanpoTRkLEDqhoKGHLBUWBBUHPewtPmpnDVpBsWGx
 A2Mc/4Oqf8j5Kv6j89BLnNndENBSOGj+64lJZ/tp1K67mk3pWOmA/KUhORhZuMo2ZPDozPn
 i09lGvD/uHC00uMFqPTyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C3yabQBAdw4=:kGWe2kRo8q+AWt4ba012Vj
 XCERP/kV+/9ZHCa5QTWgZBdOIs8G+ZhuKlKIl5746z14kYPdEwlW66W9lWryVBugwtVpbCL+n
 L3OhSeKL41CrzOPgNpSaV5xValD2ditTBFtmzHRet2zIRJ7vMaIAenNHFRe+MDMb2DSpRBtMW
 q5oWLvfNUFOSPoV0bDVgJ6Uik88MiQ+rC6rk2/LQBLHT9B4KwvVZo70oiXa19FszxjS1nuuPH
 yuHGk0aH4o3t1+LCErjj9iqAdmISOaoijCmwQmiJePUDUpRFX3UOM6C2UVQAuQbgNvDfQxzZs
 SwjwQJI1vAz7gpAW2yDkRncu3O/+N3ZkOXp5XRTRHIVHdhR3YmplAvpB1AVX7iKUCYfXMs5H8
 mWqdJtYGgWWKtpIdoQnhR+3R9xZRiRsccht5NkUgYbllXoEvyfL8YFVEesdJ2vfqXI3AK4BHA
 ackWEUsIUrFXfceF2mWUhEcvOe02afBJU3H0kK9LsUdUulfQ4EyUh6ErvW4/mBbNRCVxRd0sH
 vsR0/6YsbyeJqKkigvAMHM00uECaclJ7XuG5Bcn1csAZpAe53ajJqJYrc+7QIa1rLHgm7ApmX
 nSO+cFTM5xWQ5JRXjOo4VJLdzzDIEWXgkUrT6TRH7Btvo7z4NC7kCD2pmx7DpqLqHlAr10dTg
 9I177g1/iEv5uH0R7RiLjpU/AyA0/ttCJMqx+T5q6aNVyiBspGvyWPa2c2u2fwnA43jYbA2TE
 9NaeDj4AAEev+hcQgN10C01W2/WfyDqMmkTTCg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_044505_533863_FD3ECB52 
X-CRM114-Status: UNSURE (   9.37  )
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
Cc: michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
 yamada.masahiro@socionext.com, apw@canonical.com, joe@perches.com,
 linux-riscv@lists.infradead.org, info@metux.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

We missed some build dependencies in the generated debian/control file.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index ff226be..1caaf0b 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -173,7 +173,7 @@ Source: $sourcename
 Section: kernel
 Priority: optional
 Maintainer: $maintainer
-Build-Depends: bc, kmod, cpio
+Build-Depends: bc, kmod, cpio, bison, libelf-dev, libssl-dev, flex
 Homepage: http://www.kernel.org/
 
 Package: $packagename
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
