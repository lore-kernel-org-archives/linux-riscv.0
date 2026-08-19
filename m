Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDF6C5DF81
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 02:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6G6EUwTOuRcOGTdkedA7CKVgg3ukw36HRZCYEOeVwk=; b=rel6AcV1Wk1weZ
	QhDHqMDW4pAgs+4rKZztlaK2uZ48HVq1ltRubUaLd6Tx7Xk4Y741ffXlqtsvAAmT0dRpWrLrv9xul
	bGEfFe6LZDKEMSgT40rPC/MhOA5UBDCjKo4JnXmdHYqQPbgUma8bbfeWBXwbOC84HnrAY9+UJ3PyM
	a3T1u/lrrWPSMkxGEIKjFtGJoUnb+wS+2R0FSruXLzVFXvc4BzJUfC0dN60sM6997F1CO7uJiyEWI
	VXjOwU089BUbCQXhXEb8IMNMngVl6A62SmUmOQiXbmPzlG3hNtKNb/64631YfJWUYYAGOegPaLdFD
	m68TKWDQYodgntxgJX3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwW4U-00000008sa5-0vST;
	Wed, 19 Aug 2026 02:30:30 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwW4J-00000008sRN-1Qix
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 02:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=IuE38fL6h7PEmzt/UNWdPfgVu72Lk4CiXzTD+qO+pWo=; b=GNwOgvD1AZmUImC0F5BHb4J4CH
	J4W97Eo0NkLvb5hoXYMflby0Bjo1H2wBsJFdmKWDTh869qriEPgapAimR58yHbMEIt8eAU8WIdMFD
	Beq0RuAkALqd6jSDkwAmeC9JafZ037OIGKKfczG4HnQqy0lP8dLDffdZ9n7Ooc+wmWeKZF7rdicud
	keGSVF7hEkO2GLVq7tToxxmSj/Aq6vkBYY4UvPxBmpZTbjlyekrRFJC5axfOKE3VLoF40QnFI31Aq
	nvlFuRiaeB/SLm0R1MVCeEVWlvSFEW6CkHiRr7MqI+ah6buGMEfc6jhXXFHXKHmiWazlZai3FLQ77
	Pr1VBPQg==;
Received: from 186-249-144-28.shared.desktop.com.br ([186.249.144.28] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwW4B-005tfG-0q; Wed, 19 Aug 2026 04:30:11 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Tue, 18 Aug 2026 23:28:09 -0300
Subject: [PATCH RFC v2 10/13] sysctl, net: update register_net_sysctl_sz()
 edge case
MIME-Version: 1.0
Message-Id: <20260818-sysctl-module-aliases-v2-10-d5a69dae5798@igalia.com>
References: <20260818-sysctl-module-aliases-v2-0-d5a69dae5798@igalia.com>
In-Reply-To: <20260818-sysctl-module-aliases-v2-0-d5a69dae5798@igalia.com>
To: Kees Cook <kees@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: kernel-dev@igalia.com, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, fsverity@lists.linux.dev, 
 keyrings@vger.kernel.org, bpf@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 netdev@vger.kernel.org, linux-wpan@vger.kernel.org, 
 lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
 coreteam@netfilter.org, linux-sctp@vger.kernel.org, 
 linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org, 
 bridge@lists.linux.dev, mptcp@lists.linux.dev, rds-devel@oss.oracle.com, 
 virtualization@lists.linux.dev, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_193019_432080_2FF7C7E7 
X-CRM114-Status: UNSURE (   9.46  )
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

Handle the last (edge) case:
- nf_log.c: ignore sysctl table with template set at run-time.

And re-enable the macro.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 include/linux/sysctl.h | 3 ---
 net/netfilter/nf_log.c | 9 +++++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index 9e00a086ff1d47ab18021b3d79b0e8a93037cb2d..7e05fafd5544e1c4a3283dc13b0692f39515d01e 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -309,9 +309,6 @@ struct ctl_table_root {
  *
  * Define the macro SYSCTL_MODULE_ALIASES_DISABLE to disable this.
  */
-
-#define SYSCTL_MODULE_ALIASES_DISABLE
-
 #if defined(CONFIG_SYSCTL_MODULE_ALIASES) && defined(MODULE) &&			\
     !defined(SYSCTL_MODULE_ALIASES_DISABLE)
 
diff --git a/net/netfilter/nf_log.c b/net/netfilter/nf_log.c
index f4d80654dfe6ab6abd886e224f400e4444bcd29b..ed4a5a6b8d95b82676397f6747ef5d988c9060ea 100644
--- a/net/netfilter/nf_log.c
+++ b/net/netfilter/nf_log.c
@@ -518,10 +518,11 @@ static int netfilter_log_sysctl_init(struct net *net)
 	for (i = NFPROTO_UNSPEC; i < NFPROTO_NUMPROTO; i++)
 		table[i].extra2 = net;
 
-	net->nf.nf_log_dir_header = register_net_sysctl_sz(net,
-							   "net/netfilter/nf_log",
-							   table,
-							   ARRAY_SIZE(nf_log_sysctl_table));
+	/* MODULE_SYSCTL_TABLE(): template table's .procname set at run-time. */
+	net->nf.nf_log_dir_header = __register_net_sysctl_sz(net,
+							     "net/netfilter/nf_log",
+							     table,
+							     ARRAY_SIZE(nf_log_sysctl_table));
 	if (!net->nf.nf_log_dir_header)
 		goto err_reg;
 

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
