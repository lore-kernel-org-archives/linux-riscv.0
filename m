Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37AAC5DF81
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 18:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUQN1R+h42XNJLZGwT0YlaXrXJG4b376bmShxlnURec=; b=i2pL1oYaOt/OtB
	wSVQkgKYzV4k6nM5IW73C5ktJmhfHteDv1SuO2ZFcZR9An2TazTDEgStAxAKJ5ptZExKil0HZ6J/J
	bUmdQMIeAle4n1QUAydhuxq8BtGL1ZGpZZtAXIIWj5e7zCKLpAlNY6I03m2pi9cfC6IZ9uwmBJ5Sb
	ZAS5ZDXtwqc9hytSRX7vFp7NBkA1rtszu+yKE/75lK/YBm+S5Ughth6Swtag5WQA3ON5/I6kVg85D
	mbzQrzoQmP+XQV1IkIMw9jfi/s1DmYqQrnS7JH2TAFWO5A2E6wMcglYP3uqr2g5gQDms82SDyRXih
	bJci6u1TFwY4WpIrCpAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkqf-0000000ALYD-3LJb;
	Wed, 19 Aug 2026 18:17:13 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkqc-0000000ALTi-2t7D
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 18:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=tQqqNi/yFOJx7LxHx0ugW5QhRFDQCKpFVzx/5PXbrcs=; b=lYzkzf1NaKmAELu1yafK3W+x+V
	oGdrM9zBjAFWyqADLV6q58FDgLa4N219iK9fDvirIdC8ydA2VwVGS9zgacLmIbHxVDRHAe5TMHYLX
	VBTQROh7W10FE7EQz7noq9hTrlsn2tOYtJi6OpYPnuHx8NVeeepTMv6uLNdVMRnAiv2ahKzFbtv7d
	uTuIgLQhMnoH4USfXP/vGV3qvU/heEOAfGXqmluLU7H0THUvhXRbVxPQB5Tx/S1SjPzu5sN6qivET
	0ZEGng167tVdBnv8wP8WHH9uv0XzNxyZjveSnpe15MZZhi90rufObQunqfUnPnDiz4++88ZzVCEGR
	Qfdd3kfg==;
Received: from 186-249-147-181.shared.desktop.com.br ([186.249.147.181] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwkqR-006ENH-Jd; Wed, 19 Aug 2026 20:16:59 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Wed, 19 Aug 2026 15:16:23 -0300
Subject: [PATCH RFC v3 10/13] sysctl, net: update register_net_sysctl_sz()
 edge case
MIME-Version: 1.0
Message-Id: <20260819-sysctl-module-aliases-v3-10-aab90569365d@igalia.com>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
In-Reply-To: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
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
X-CRM114-CacheID: sfid-20260819_111710_752190_DE6D3665 
X-CRM114-Status: UNSURE (   9.39  )
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
index 7241dbf7eb81ce9f906e33645d03944671c5e6f1..b808fbc1d964f453db8e354825fd8800db1eecd3 100644
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
