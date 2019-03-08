Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105C8C10F09
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 12:45:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3E4A2085A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 12:45:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PBOhguCG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3E4A2085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Vg2I0NocP9HyeIcOWbcvsAZ0NaPcwsy2lvsGUKZ57pE=; b=PBOhguCGzhU1ZXmjbpBz2tbH4z
	OcqtrOghALgzqrkSpnMuZ0Uztlihhtbys7co+/viaGzigFPsU8C0IM/k0RVUJcFn9rkHsiovcjLsS
	dxpJZhtJ8ClIsLaEbi0ra14HiVxhAHGxO0HAB7y43jzAUqyfjQV0KJtRg9VuQuts9fmk2wFRR94B2
	Cnrh5iT66Wyr0UQD6K0GJ/tFo+Rqj36BihNG4QBNc8BHp0I36W11L3EGEcMb/fNr8Zn+CzBwGmboX
	GEs8xDvPBm6hAFaF5HQjmt7r2KjnHhVKjLQnYmZ/3G5YbsFKqT8CmhXeCictFZVgYtAgcpqvfddOx
	ejcNugfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2Es9-0005dY-Fn; Fri, 08 Mar 2019 12:45:09 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2Es5-0004kC-7R
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 12:45:07 +0000
Received: from orion.localdomain ([95.117.97.241]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MBDSg-1hDlSw1ZF8-00Cg1k; Fri, 08 Mar 2019 13:44:56 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] scripts: mkdebian: allow renaming generated
 debian/rules via env
Date: Fri,  8 Mar 2019 13:44:21 +0100
Message-Id: <1552049064-32044-3-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1552049064-32044-1-git-send-email-info@metux.net>
References: <1552049064-32044-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:m9Rcq3BkE+/KvFJbr9DS66OIa5+IPcGvacRTbXUYkat4jkIKp67
 jFs28hFyLa8DfHhjYnAtUkfclhzCAsDp92ihbMhfnksFK/tTGWG3WIwpMxMdV+ezYSEc7ww
 Q9D/6Da5Rkk/8MqctcZMp6+JP0DfK593YmtEPj+pPkv20+eCznPU8wnmWdGSUTW4U7N9qoW
 hfsntRIN1y/m8dcbv1kIQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:72OANdqF7Us=:Fn9cqmapZiB3bGwAR35+8F
 IHr+jgS30cSpuItHM4y0wvcNfJkfdRoDFkUdcP3jE+hjuUuX9kP3R/bTSMaYf5ESGO4CjduKi
 ENZyftorCeiw9+Zr5f+zLzLiLADsFPxY4R7wj3qYcJUvtXoAAhm0kWdVtMetiqPg0CluaLzyJ
 9Ly24m6PfxWD/tcTnHW6pYQ03YDQ78Jtr+ljXnK0pXQkrY8Jjann6MWmDeiC128e9sgzi45Vl
 acldZT27qlFYiCVC/hlEn2HTKOZRv+6GUDI9Thjbh55en0j/a5nmgbzjCbcLJaJNoPh8T4L71
 f4GaVVol2jrMvXA8wid4j9j+DPidN0CltitHI5UyAP5Er0PNqudMRcNPAH47+zhE92YsFxJ+9
 krnuM8zrkiYibjWixkZJgfVgQ3Cq/pSVGS9mdJRJgwhb+9K/UtkAghSeACeyk+BTwRL90bL1v
 QtQA1S+rI900paM4zHrpEPsgsjvnGgaPqkmbiyArZQ4CAgOF+nH0Fe845PjDaj5SECTtvtXni
 gNc8Ys8ZIV1bqG7lHtT0ThYFplkrWA/0g94oQ5QODtvE+E1hchju7lUS5nYnMhW6ANDNj9pTO
 pUzalEBM2JEclMKctevY42t7IuVcqXADqq7ypBG05ZdpyZZsQ/vrNFYgfIvMa1HCOYVEUlglc
 7lSnryzX7RZU0ozdk8r7k3HYFBMUXD3Wl0OPee9LMCRwQe4q5ggTn/hWSHMaqm+Pm8zFbC21m
 CVw9nQyCgjNp1fnji34IlBiEJqUFoFqD5Nt1tg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_044505_601735_805B5DEC 
X-CRM114-Status: UNSURE (   7.70  )
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

Add new environment variable KDEB_RULES for controlling where the
generated debian rules are written to. By defaults, it's debian/rules,
but packagers might override it for providing their own rules file.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 scripts/package/mkdebian | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index edcad61..ff226be 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -99,6 +99,9 @@ kernel_headers_packagename=linux-headers-$version
 dbg_packagename=$packagename-dbg
 debarch=
 set_debarch
+if [ -z "$KDEB_RULES" ]; then
+    KDEB_RULES=debian/rules
+fi
 
 if [ "$ARCH" = "um" ] ; then
 	packagename=user-mode-linux-$version
@@ -202,7 +205,7 @@ Description: Linux kernel debugging symbols for $version
  all the necessary debug symbols for the kernel and its modules.
 EOF
 
-cat <<EOF > debian/rules
+cat <<EOF > $KDEB_RULES
 #!$(command -v $MAKE) -f
 
 build:
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
