Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04ABDCD128D
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 16:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lyd7pG9DDHHmsOQFr0bY3hKbDNdQeYm0lPIpuB3yR4I=; b=Wi+9zfEONhuzEX
	fSuizuwJ16yIGep21CETYyOhvyP286puMGZnYNcLYFBtJcBfLW1j0dAet3wvoj3C8i/1kUzFodPV/
	USqKGSEZSdFfh4U+M/B4zhnNHtI93yoVfpbqwwrhxvEtpk/S0SOYlOO5Bgs/HAOMXcE9HRPUlvsYk
	ETKPtnWiI2IbqlnfClUcdSHssm+2JHgSnvlYnV7wy1Amw53+lQXkQk0BjKgTOlpLfN795gEWzCHU9
	emO+8x1iULd4byCdaAeiOxU+bzVH4FDbuDJTe+QBVY+L0RcteN5gcB4DA4L6FP+BqPzcZTxhv1ymS
	NEMUEGVOIgKIrc++Hifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsAZ-0000000EdFF-2T2J;
	Thu, 28 Mar 2024 15:59:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rps9r-0000000EcnK-31oM;
	Thu, 28 Mar 2024 15:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=6hGjIZWH3D0GQlvswERh+7cRPJG9WTb3O61j0QNYFaI=; b=b0MhLMc2RbYr0Afh4KU0rCjBYN
	eGMKo3X4lZm1m8bR8JKBaz/Mr5mYCTTnxQdQvYltT1R1VijMSCCtVYSc6IrDvQ8wytKSOQQnCenic
	k6tFflnm6aUG/ljuFHg9Y+lQOiqjmDmcE/mLDG1wGBvmu7TJOzULOP3kQmuapWKmfTrCcKwGo8d8p
	+ZUi/S0IWzlUDiDwPoh8AgdUVf61z+MfJC3NRcCjrFxr1M/9JsR3s+QJygM3jyedswyYAkKFqF78G
	OEesb//XR/kcHtqHvznWESd+f3r9K8aPJqY/Qq8HXkXPuSgRqIZ7/XpvoSmX+dpJGmacUeojoH76q
	pSKNxEFA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rps9l-000000012YG-13ln;
	Thu, 28 Mar 2024 15:59:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B2FF617BE;
	Thu, 28 Mar 2024 15:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1804BC433B1;
	Thu, 28 Mar 2024 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711641546;
	bh=HnkZYSjKPCIyg8WyvmAEoZfloM2q2PjF9q/5pIFpJNI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A973XSxYI/ju15z6W6S+Zrm/5kMUYhxyRNOSEa8BISg+xhHNJ21AhLrRci5V3ezt5
	 G4PNLZaWFIxsggTvEAUzr7l8LgXJZrWARcEwxW+RWbPlxy6NPkYhtZn5WzSQdYEd32
	 2k6vtXt0rxSgNCak/8O3BpjQjaz7zyokbzRdMdeby3m/iZtBDRnqpBVJAYnH0T2YEk
	 S5drgQu716KnCTqX92wTBXKAmLVGguA1A3N3NDZVnH5MvpxA/aAyn9e/KWFEno6BbG
	 0QiuiOTFxrdrskTyW4XxYOTzWCFNfZLvIT7jtscR+Uq232aXtXJlEDxAwXPiJjqEVP
	 uR+bpimr8TZog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06266CD11DD;
	Thu, 28 Mar 2024 15:59:06 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Mar 2024 16:57:52 +0100
Subject: [PATCH 5/7] ipc: Remove the now superfluous sentinel element from
 ctl_table array
MIME-Version: 1.0
Message-Id: <20240328-jag-sysctl_remset_misc-v1-5-47c1463b3af2@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=JOrcDebyPdeQyVF1o8hVyIGZcNOEUHOhqgwA2b/7KxA=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGYFk8WY7+nF4T/aynBPi+a0SWAqJw+C58bGs
 dIDFmbETTURK4kBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJmBZPFAAoJELqXzVK3
 lkFPtKYMAIWyicivuHYgLcu7kcoKi4dh5VzhBVmU1d1+zzEnR2f4BqPMWMLwExZKwt0v0rPf/iU
 VZqwFLCJUE4M6vX+VueRURT03H99gHyLgGMHwe5rlh/JUKiqlLQVzwaWCGrg4BG8jkIQgCXfv84
 gAArkvSzOc8a35wOKAMKVRINK7w4fuDO5JFG7WGw90+v5WSY50dXGOmigPWIbA7P+EsriFvVDlf
 N7UHpuSG0nytDxusQM71WHX2MxSQ+RTJgscogj75JzJehbmXTDZMtP/iGBTDfeaBRx0b7ETHJfh
 0a0bG+JnXuG4kxqxIV9k8fY5uQ94V09mvexhYMDSoOwKKWEHkwf7t26SYW4VgFtIFSEUyemvxmZ
 tf3YlaL8wMsdBYj/4fwIlc1m9N3DOPv57ze5SEt8ileyVjKISuOlfRioVbFCF+fqVHKqi9zScRs
 kqPhFL/gsIIeNp2Qv4tfJFyeHcFT20yhcmYz5E1RFipwOOD9XwQG8aCNvTZOZ00zy2zfSAJ8yU5
 s0=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with
 auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_155909_799308_87DBF40D 
X-CRM114-Status: GOOD (  12.13  )
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

Remove the sentinels from ipc_sysctls and mq_sysctls

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 ipc/ipc_sysctl.c | 1 -
 ipc/mq_sysctl.c  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/ipc/ipc_sysctl.c b/ipc/ipc_sysctl.c
index 45cb1dabce29..0867535af96f 100644
--- a/ipc/ipc_sysctl.c
+++ b/ipc/ipc_sysctl.c
@@ -178,7 +178,6 @@ static struct ctl_table ipc_sysctls[] = {
 		.extra2		= SYSCTL_INT_MAX,
 	},
 #endif
-	{}
 };
 
 static struct ctl_table_set *set_lookup(struct ctl_table_root *root)
diff --git a/ipc/mq_sysctl.c b/ipc/mq_sysctl.c
index 21fba3a6edaf..22ec532c7fa1 100644
--- a/ipc/mq_sysctl.c
+++ b/ipc/mq_sysctl.c
@@ -64,7 +64,6 @@ static struct ctl_table mq_sysctls[] = {
 		.extra1		= &msg_maxsize_limit_min,
 		.extra2		= &msg_maxsize_limit_max,
 	},
-	{}
 };
 
 static struct ctl_table_set *set_lookup(struct ctl_table_root *root)

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
