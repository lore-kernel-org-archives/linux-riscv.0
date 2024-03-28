Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D87CD11DD
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 16:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pn8XfcLwEfrg2qspwI06EaiG5h4xGmqHi88Mh5XfFKY=; b=RT8euEjwNrAAEI
	oN8eplhXo7gW0XxTlxiHM2D3WjRP1RAyUWLLdnGHbowkaZYBV8i5xXXlYBo3oChtrs7O0kfUqb343
	iYLgTwckswNT9eaiOZPCTNbF2HgSHi/+D5lJr4c2p1i/p319rGgltoiLG/LHoW2cwev37iUC68SCe
	DveyB9Vi/cTybIj2C7UM4znzA3pHjHaITSp2KF0b6VbTkR6Zs6yzxQJdG5EHUUjx2ff5BmaglVtf7
	WOY9uZP8oaqYEhhYc1neNl29CX5HTF4a/ja1/cHiuU08Eur+mO2k5dbWWCELZFNs9E5vnctVgW6M1
	+fUqnyDima94dM9Wg2Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsAu-0000000EdV6-2T3h;
	Thu, 28 Mar 2024 16:00:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rps9r-0000000EcnA-2Rjh;
	Thu, 28 Mar 2024 15:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=cvGetjGl1Jkypr7IrRhEMCVIKsOv+g1/4dKs8MKUjog=; b=N//khns4T+5LWQkxWkJhzROelH
	05Dy+94GffZB2nXh6KBXI8mOeMMYy1W+oVd1pKjUdZ2ZdBjHomCKRf59Q4FnJuWOF74MjpksjMIk5
	T+xna7GpENUVcDaidz9t1HIvsFWNfw3x6yBbe8eFSq0+TRYtYSuLAV4lAdBAfhAqpECc5Ec/WTb51
	0YXFs5QLTK2vzuSjb3k9UWaXb/NkDF+66EW2ZmXCKkCZkZ0MmMkVCNLL+PofcrI/NtbDmi9vt4WHt
	D+fOjNXVfJBluDUDlI/HdYufsukl7agKEzyof/P+VaH5Gai5BdmiEqDtFYXfbli8XNeCUKSNf5htl
	bkau3B1w==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rps9k-000000012YE-17MN;
	Thu, 28 Mar 2024 15:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AD0F617BA;
	Thu, 28 Mar 2024 15:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C150EC4166A;
	Thu, 28 Mar 2024 15:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711641545;
	bh=w/CAagCs93tnwOISaREraUes9B75EU7uQd/GrX75vJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rC+cSWQaCVaIgFz+KeWgwqswKUa8HnduLtkqZzAPwFFb14jZuXZ9z7qBTzh7na9JS
	 4V+5V8bkh4Zo1vtFt6wL2mdo9OwzBhkto75XnOEIzmeixScBZYPvR6DETzowMtiLV0
	 Bom/CXB456RgDjKFiZ5VJHiLA3ZRIW2p7Tw3RPdOEaQB9vf3Bw1qOQd/OEW6BUbuBM
	 HfMUSPdl/bztabiGFkLHcIvbKgvMacaCktlmCXi9YGgQhWi0a+5P7DPZ30NpYsAv8n
	 sAg/FCFFpdhDZFJbUxFUp8sDopsYyyhRs1qa163ynn0i+CjZ+ujFMfHYzFlhQ8Qn9w
	 2Gy6wKhIFR5Yg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE43CD1283;
	Thu, 28 Mar 2024 15:59:05 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Mar 2024 16:57:50 +0100
Subject: [PATCH 3/7] crypto: Remove the now superfluous sentinel element
 from ctl_table array
MIME-Version: 1.0
Message-Id: <20240328-jag-sysctl_remset_misc-v1-3-47c1463b3af2@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=PsRDF4iHKhFg1x0ZSp/XUca2d9GI60WeSwOtfnTJcKU=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGYFk8Sn6Fir1TrXxzcrJeA20C4FmUqvYJhos
 nJVoW2ScjI/aIkBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJmBZPEAAoJELqXzVK3
 lkFPCAQL/0dpS5DBrYR+5mZqJK2pQcAA0QQqBm8y2Tq391CKvm30tew2wtkScDHoRiyul8QyzWC
 D5/YpkG8dWaCHAkj+HOhXbtB8Rfi/cf4BchHZ0+cRj41OMxCePLa+yG5/nfgar5oc2nXN2gcrYK
 ntIUgfJExh6PEDQXr6Xk4RK675RUtgLxch2ojMfz4S3qe9J4DmkUPtR+VQs52+lmteyOBMwdh8/
 DgmBLGsimvyq20RbSHwzZRPUwk7y6YTCDhKz6oLyB97eOjbuarD4FwBd1nLHwpS1su80Ul8kYu4
 OmnEs9ucp2Ne9WIybw3frLNgnmJRfjHa3nQalXpp7yFOENLnS9QK2RvrYCmjKIep2FZIA7t5Jvr
 0Iod9HPfrNohN1XK0AjqT+ihZTjhFd8fSHnf2YnS/oSYtZf1kJuljhIFoLNl3PKVsRUHhhUHlHC
 dW+jquu6DydspJi9zZEyoeHoSbs1S2+5jvkBGfrXYVn8pQWjKMpvfOWKuIw6sqQuxre2VZIjR26
 SY=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with
 auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_155908_852662_EEBCCA9C 
X-CRM114-Status: GOOD (  12.06  )
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

Remove sentinel from crypto_sysctl_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 crypto/fips.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/crypto/fips.c b/crypto/fips.c
index 92fd506abb21..8a784018ebfc 100644
--- a/crypto/fips.c
+++ b/crypto/fips.c
@@ -63,7 +63,6 @@ static struct ctl_table crypto_sysctl_table[] = {
 		.mode		= 0444,
 		.proc_handler	= proc_dostring
 	},
-	{}
 };
 
 static struct ctl_table_header *crypto_sysctls;

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
