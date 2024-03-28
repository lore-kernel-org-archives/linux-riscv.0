Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE7ECD1288
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 15:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=guui0YEICKsXhxiY5E7jd+D/48cYH9WsR+1gG60cBeU=; b=RkPe0QWeNfrSvC
	yKRB8k+LjmsxYAvBeFcvZGK71KAxId4xMF3+p5jCn/qshix+6T31Ise5h2B6E9wKYAkmpcdNsN4Se
	rGPq80IUiXB5RIR9trS6Fjmj6cSsX0dnsm4RsUVYHy+9TbSpJ1u/gh/pO7GnA7BKoNiOEs4QrIK3o
	tQWlNxgq1Qf4iMiKSYFT/cENwfrCJfAmxIRbt9W/LMSpHTrD4BsMZP6/2/4u/cuFxBR/9mYwUDceR
	FcjvYiDlUr8pGJKKefE4JHU5F+Dql1U2+Yr9ciaeqYUzC+XNSK9sQx8lJlcJjLR6foFixJYULhAW9
	RYihow5Y3t6V4EeTG9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsAA-0000000EcyS-38wr;
	Thu, 28 Mar 2024 15:59:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rps9l-0000000Ecjr-4BSK;
	Thu, 28 Mar 2024 15:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 85ED5617B4;
	Thu, 28 Mar 2024 15:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52F70C3277D;
	Thu, 28 Mar 2024 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711641546;
	bh=mM06SAnSuRZUv5Kr1gQkrOle0ZVHR6HF0Jnu4nRNtL0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=O+v1+/noxeHa2Z29M0Dfz3L7XwTqiI0xSKknYFHgodqhhqIXTlgaF5GJjkqnuAv3L
	 QJxvcu3YYA1qZjmQriQPtlGiApETtmUtwQHVF/mp/WtFQk9UehvOgAJeV6PpbAWgWt
	 02/i+g/f0rWpKPeEEZakfWjZpLF/khrQ+h7tWPfJteywlTTTgyReBJobJ5ExHS2O2q
	 P+uatIB9TfpZ9YCFscfcUjEAexbVtmkvVbscVRBTU0U0R6SWjGJWmJjXG4HSM2sdT5
	 VtY1FnB+Bq7tZ4HXbaYYH7rGNOO4FPxvElyBHUboqVi1ty0+qGhl83aKm0zP/ug6uc
	 /8eNJHjxwny0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E82CCD11DD;
	Thu, 28 Mar 2024 15:59:06 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Mar 2024 16:57:54 +0100
Subject: [PATCH 7/7] drivers: perf: Remove the now superfluous sentinel
 elements from ctl_table array
MIME-Version: 1.0
Message-Id: <20240328-jag-sysctl_remset_misc-v1-7-47c1463b3af2@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=x6LKxIed1g3mBTsVnM3LyyId0GhLgp5Sc+vsy/qx9t0=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGYFk8b3d2Da02YyON9nng/oh0az7TH1At0Oj
 Klqtpadz8QDfYkBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJmBZPGAAoJELqXzVK3
 lkFPn8AL/RQuAkZvqODJOaCfSxnffeO8fIdKo3HY6jpLrbB1T2bwX+NMLubJdUp3yENm7YB8nRa
 WW22oyyDlvKBzvMdpZd+FKjXo7UBi7qchJGagofe3xiSIEGW50zF5NJDsM7ktMH5gzkhzIXDn2y
 zr/ABmufu4M7Zp2Wr9jVGv4y27IaAVDyFc4zrPnoSa0mN49bPR3NDQWuqqdYJEL6TmQnN2pKz1K
 wTPVnaqmhRdvr5Rjm7bltaHte6Bc8+h5J14i2UXK1jWSg1QYCATTJjpTGopxecIhWetPhrcfO1l
 3sSGhEU/sq2scZklB97vertazO6s46/yNljcLygRX2jL+HciVVcAOzhjZZMUQWAqUDPhCH5PQyL
 oF5sSgTDRjbTSNQpMGp+Zz4Le+f0MYjgkudGjGozgrNAA/i//Ct6jR22lj9qFmZGqe9IxsUEDiI
 mlqlj7Zr6yMfYyLS/gGgRPGvV1D6kyV9cMFEdPnBexcqwE/4lVrh9+wu+JqVoOoY6+a/ZCRcCN7
 k8=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with
 auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_085910_190818_679403DA 
X-CRM114-Status: GOOD (  12.87  )
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

Remove sentinel from sbi_pmu_sysctl_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/perf/riscv_pmu_sbi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 8cbe6e5f9c39..5aef5a8737b2 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1043,7 +1043,6 @@ static struct ctl_table sbi_pmu_sysctl_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_TWO,
 	},
-	{ }
 };
 
 static int pmu_sbi_device_probe(struct platform_device *pdev)

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
