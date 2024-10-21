Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B75D15D89
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 12:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdsM+rQ6Js9UDapAaxYrWkJ1U9RxGPBGET3pUyU057M=; b=TemTghwOrj1Vos
	U6cVhsMp0teqMSl8axXDGIYwuR6VHzpsS8+ngHY0FBmaaM9lR54fVknssqZKlgdtZam9edd9F9p7R
	RdXSnkt5IZFrFNTNzv97lLsChzdR3ual3/oRsAup7AJd+92bd36Wapv0GMdqxBYFX3mM1lAJPrj9r
	Q+ikH64cJ/cfG9RUpCs9Y7Ld9jXs+xo+e7segaiuHknPUYw0Zlim0YgV9dymr/osNz/j+LmZdP5lw
	q6AEMYYjb/Hy+eR9Vq3kQWK7c1o7XSJYC1xrGucypO/mYGk5rEYdcLnHAYbDQoNbrxMH8Pb5Bs+L8
	uN152ghewo0Dj7DPwmcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rfA-00000007H8e-3HF8;
	Mon, 21 Oct 2024 12:37:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rQG-00000007DbX-0daV
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 12:22:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D5D1BA4297B;
	Mon, 21 Oct 2024 12:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A248C4CEC3;
	Mon, 21 Oct 2024 12:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729513326;
	bh=q9r41TUNdBdaXSTHRnEB4GOxd1xBEVJa+omNwYCjQ9g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=K2s47iFpNxrXBD19bu1MVAodC8qAnRBq0DYV2+zoAoelVjDzHq34KIcYHkvE/jHWi
	 CDiDHlRCjvOZqIIjIZO0MEQCQZFiVIb63p7V8pfIRpzXQHXzM62S0hGnJMqmVhgQQY
	 LuIVyNVIuMPtcui6PykJbw0VJs6Tg5+OpAldA/XTxeLVTvLcu+KkTXYNwGroOypmLJ
	 AqHAzWmluEL6R1UHGwCvc7yAxP+XivHBshqAG9qRft8BKEwcwEwmKqMLJDS/6Zov3R
	 GimBTQLOAe7/H/QRhRZwfgM7ha0qmbdQotEtL7otQ9AZOQRJRJYhcrtm0YW8ae7DeB
	 +2rGIQLxsS3dg==
From: Puranjay Mohan <puranjay@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Hao Luo <haoluo@google.com>,
	Helge Deller <deller@gmx.de>,
	Jakub Kicinski <kuba@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Mykola Lysenko <mykolal@fb.com>,
	netdev@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Yonghong Song <yonghong.song@linux.dev>
Subject: [PATCH bpf-next 3/5] selftests/bpf: don't mask result of bpf_csum_diff() in test_verifier
Date: Mon, 21 Oct 2024 12:21:10 +0000
Message-Id: <20241021122112.101513-4-puranjay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241021122112.101513-1-puranjay@kernel.org>
References: <20241021122112.101513-1-puranjay@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_052208_295133_BD254105 
X-CRM114-Status: UNSURE (   8.38  )
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

The bpf_csum_diff() helper has been fixed to return a 16-bit value for
all archs, so now we don't need to mask the result.

This commit is basically reverting the below:

commit 6185266c5a85 ("selftests/bpf: Mask bpf_csum_diff() return value
to 16 bits in test_verifier")

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 tools/testing/selftests/bpf/progs/verifier_array_access.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_array_access.c b/tools/testing/selftests/bpf/progs/verifier_array_access.c
index 95d7ecc12963b..4195aa824ba55 100644
--- a/tools/testing/selftests/bpf/progs/verifier_array_access.c
+++ b/tools/testing/selftests/bpf/progs/verifier_array_access.c
@@ -368,8 +368,7 @@ __naked void a_read_only_array_2_1(void)
 	r4 = 0;						\
 	r5 = 0;						\
 	call %[bpf_csum_diff];				\
-l0_%=:	r0 &= 0xffff;					\
-	exit;						\
+l0_%=:	exit;						\
 "	:
 	: __imm(bpf_csum_diff),
 	  __imm(bpf_map_lookup_elem),
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
