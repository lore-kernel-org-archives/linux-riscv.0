Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F79CCD11DD
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 17:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GlpQQqlYor1XoIjcCxXRXvO8s3Rl/7gcGwM9j+HtBqY=; b=Hz/YIPDMmU53X8
	fwLqJJ3doe1+rVX3/I2VKzC/3afMiiChkE098PPsEZgD8nFAHN/4Q0+D7SAJF51d+i18n8REtX5Aq
	qf57oJEKGjirqiCSN+tM/oaFexqOzMa5G7jM98gWzH2CGgZxoIcS7X3/3QnkQ8FswM0MbQMeX+N3u
	qYO8NOicrVF0kn0Hw1W7nONFr5Sj7DwtmY37jXPCCSaRmUOLEoLZcaBGnr8+edlWC+r+NP7fj/qEV
	lVGQPm01XgGKjcxekLTaIpJVwDyKSO8CmhVi/543VgudFaRvB3zgRjIT97FfImOdyRyF++kDp2Z++
	Go8x3vAGSRTBbOBDy8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptAO-0000000Esqv-3kFt;
	Thu, 28 Mar 2024 17:03:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rps9i-0000000EchU-40A4;
	Thu, 28 Mar 2024 15:59:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE47C617BC;
	Thu, 28 Mar 2024 15:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86BCCC43330;
	Thu, 28 Mar 2024 15:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711641545;
	bh=8Q9bngJpVYFNnjYWEtmsJFuk+cZjVn0lFU8F/+2wGYs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YmrzuH3BliTwE/0aMbEF+2VcX2UHLIx+m0/yWXRyIVMZrUgJcl1YJw2PyjUdmHwH/
	 ya+t94hVgDN6IgMudg2SFgzwY/QkWU/c5PyvAs3DJONRijbiNBdkjWrkrS9vITZJqV
	 4s04RYKI92TvN21zTvtB2gcOBkXQhkvtli7vl6GfIUBYpv79m9cOqJfIAc3avYKsR1
	 et5Ln3Fn7tFgf9EBh6rMXYqfbPYlOC4GV90FtOQv8ksO3NFUmX7aoGpXg35HgC+Vha
	 ym1eDEIT+a1xQaLkltBSuLe9+BSHO9hWQEAyYw2P80euDWTYPSyoWKKhYEzU2zRol+
	 iXCI1G6AfuRrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7384ACD11DD;
	Thu, 28 Mar 2024 15:59:05 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Mar 2024 16:57:49 +0100
Subject: [PATCH 2/7] security: Remove the now superfluous sentinel element
 from ctl_table array
MIME-Version: 1.0
Message-Id: <20240328-jag-sysctl_remset_misc-v1-2-47c1463b3af2@samsung.com>
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
In-Reply-To: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Muchun Song <muchun.song@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <naoya.horiguchi@nec.com>, 
 John Johansen <john.johansen@canonical.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, 
 Pavel Begunkov <asml.silence@gmail.com>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Luis Chamberlain <mcgrof@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, 
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
 io-uring@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-2d940
X-Developer-Signature: v=1; a=openpgp-sha256; l=2166;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=MMRfTm4NsPGzunc+jLCBGXNs5d6MSZ7h8iaXBibxUBo=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGYFk8R1UXVA6OVx01bpEwxUOhfTMICbrVR2h
 1f4SggspLYarIkBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJmBZPEAAoJELqXzVK3
 lkFPOkcL/iL3V8wwR26L9QEsybs3FPUiCWjpFGJI5kszPVk0Stt5Whqa6ZRa3moK5yHXtROXmvH
 isu58CfDXlwnMMhjVDwBIJZd3E2mAxRS9baf5sTt0gDgfa0r546kRS/vV46bg4zIffFfucqpDvg
 0fbbU/XhggxQ1E6Q2Vx19634oyUaqMW6dcA8Eb+mcpWiNtSXYJE7P54ZWgiJ+2+Q/k9nz7bCClt
 sEf6hL/2xqZg+knPxHu9eD/l1KgNVEmSCLGALUzExhRUHlM0pbydHbqK2OYALSMv/PdEgBKs6Gc
 bcSJHtuhVAopg7QCAi5uPSAsV5kKgSCCSBm2lPmOMiK16fx+3Cjhbr6h8H6SHMOYdFj4mbWCd45
 LuweyC40jgWA9KA9AWJ5GbTqKDsNDBskuxjTGdV56ullhWNEauQL28puh5SoCK+byTFGBI4C3Zk
 idQbenpimWdJS+vXICzHjVOiMZZZeDcJN+nBisWSI5knBOJJhnflKNDQ1lTTBr8PkMV24lIia23
 HQ=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with
 auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_085907_108623_DED50E86 
X-CRM114-Status: GOOD (  12.86  )
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
Reply-To: j.granados@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Joel Granados <j.granados@samsung.com>

This commit comes at the tail end of a greater effort to remove the
empty elements at the end of the ctl_table arrays (sentinels) which will
reduce the overall build time size of the kernel and run time memory
bloat by ~64 bytes per sentinel (further information Link :
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)

Remove the sentinel from all files under security/ that register a
sysctl table.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 security/apparmor/lsm.c    | 1 -
 security/keys/sysctl.c     | 1 -
 security/loadpin/loadpin.c | 1 -
 security/yama/yama_lsm.c   | 1 -
 4 files changed, 4 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index cef8c466af80..6239777090c4 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -2064,7 +2064,6 @@ static struct ctl_table apparmor_sysctl_table[] = {
 		.mode           = 0600,
 		.proc_handler   = apparmor_dointvec,
 	},
-	{ }
 };
 
 static int __init apparmor_init_sysctl(void)
diff --git a/security/keys/sysctl.c b/security/keys/sysctl.c
index b348e1679d5d..91f000eef3ad 100644
--- a/security/keys/sysctl.c
+++ b/security/keys/sysctl.c
@@ -66,7 +66,6 @@ static struct ctl_table key_sysctls[] = {
 		.extra2 = (void *) SYSCTL_INT_MAX,
 	},
 #endif
-	{ }
 };
 
 static int __init init_security_keys_sysctls(void)
diff --git a/security/loadpin/loadpin.c b/security/loadpin/loadpin.c
index 8e93cda130f1..93fd4d47b334 100644
--- a/security/loadpin/loadpin.c
+++ b/security/loadpin/loadpin.c
@@ -63,7 +63,6 @@ static struct ctl_table loadpin_sysctl_table[] = {
 		.extra1         = SYSCTL_ONE,
 		.extra2         = SYSCTL_ONE,
 	},
-	{ }
 };
 
 static void set_sysctl(bool is_writable)
diff --git a/security/yama/yama_lsm.c b/security/yama/yama_lsm.c
index 49dc52b454ef..b6684a074a59 100644
--- a/security/yama/yama_lsm.c
+++ b/security/yama/yama_lsm.c
@@ -463,7 +463,6 @@ static struct ctl_table yama_sysctl_table[] = {
 		.extra1         = SYSCTL_ZERO,
 		.extra2         = &max_scope,
 	},
-	{ }
 };
 static void __init yama_init_sysctl(void)
 {

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
