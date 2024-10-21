Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8414D15D8A
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 12:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqREekJne3MNzllfww6oYR8mtTonn29KLajV+Hu81OU=; b=iqpPdH1eNLEuHf
	As1ADrL0AkLxgOlpo1qgdCAgTs/w04Bl+grvp4en3giKk05l9fwYQG+5Xulu5OU50XbqnMlLfJogB
	mvVKe2M9UvGkq0g8Es1dbqmKuCJob7nLqwCTuxia0YtW8mGMKUhCVxKXlnWApfhrmTjC7i3tdIGgv
	QyDCwkC+uU7OFk0G2PTw1HwcXYzb/PwsuJTW7BNRzyCWrWsMfy+aZy+LFlxQ0wywr0h/YftJsatWO
	ZaK3PSlJFv/ieG3cpkTPIiLvOx8Dq/4BZ543PKOwOxXOmdVIL2lokMNXYbrP2ytBCTQGRkxr5/9hJ
	jcVQ1ZrWwpOj/VkBue7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rf8-00000007H7G-2r4z;
	Mon, 21 Oct 2024 12:37:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rQC-00000007DZo-2blx
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 12:22:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51041A429BD;
	Mon, 21 Oct 2024 12:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE604C4CEE4;
	Mon, 21 Oct 2024 12:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729513323;
	bh=gJ2hfEV44PPxvxKXpZF+JkBcTX9tTBF4IaZx7SCOMZ8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=H7u8hf1BlS2So8vQ1TSFGFD05iAr9Ps6b4H9FJhaHFS9M+hlJmUh9+4Os2jqFP/Q/
	 bdW2TEwQ6IxHTfkeXZwOtrm+b+57z5pFqqUi7KpQsoVGrI69x9j8DQ1ePmPrWMd3et
	 RAhnxCxeEHjH3SoqZdayL+7a7ffLzisilXVatTyfXD39jrD/P8rZxi8OKIW00B/9H2
	 oUU9jI0zkAx42RmuN6Nya/uLvsYiNMKR1A5rAUCwNqvEVwJRK5JcwcQdmtgVbhuyrz
	 YAh2aD+a1EAy5H4ucA6ux8jJyITT7IkQ/ZPolYVTZGf3iI8YRWfzg4UjRGupy9Bghv
	 s1kjJbP9utYdw==
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
Subject: [PATCH bpf-next 2/5] bpf: bpf_csum_diff: optimize and homogenize for all archs
Date: Mon, 21 Oct 2024 12:21:09 +0000
Message-Id: <20241021122112.101513-3-puranjay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241021122112.101513-1-puranjay@kernel.org>
References: <20241021122112.101513-1-puranjay@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_052204_821999_BDD93417 
X-CRM114-Status: GOOD (  19.33  )
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

1. Optimization
   ------------

The current implementation copies the 'from' and 'to' buffers to a
scratchpad and it takes the bitwise NOT of 'from' buffer while copying.
In the next step csum_partial() is called with this scratchpad.

so, mathematically, the current implementation is doing:

	result = csum(to - from)

Here, 'to'  and '~ from' are copied in to the scratchpad buffer, we need
it in the scratchpad buffer because csum_partial() takes a single
contiguous buffer and not two disjoint buffers like 'to' and 'from'.

We can re write this equation to:

	result = csum(to) - csum(from)

using the distributive property of csum().

this allows 'to' and 'from' to be at different locations and therefore
this scratchpad and copying is not needed.

This in C code will look like:

result = csum_sub(csum_partial(to, to_size, seed),
                  csum_partial(from, from_size, 0));

2. Homogenization
   --------------

The bpf_csum_diff() helper calls csum_partial() which is implemented by
some architectures like arm and x86 but other architectures rely on the
generic implementation in lib/checksum.c

The generic implementation in lib/checksum.c returns a 16 bit value but
the arch specific implementations can return more than 16 bits, this
works out in most places because before the result is used, it is passed
through csum_fold() that turns it into a 16-bit value.

bpf_csum_diff() directly returns the value from csum_partial() and
therefore the returned values could be different on different
architectures. see discussion in [1]:

for the int value 28 the calculated checksums are:

x86                    :    -29 : 0xffffffe3
generic (arm64, riscv) :  65507 : 0x0000ffe3
arm                    : 131042 : 0x0001ffe2

Pass the result of bpf_csum_diff() through from32to16() before returning
to homogenize this result for all architectures.

NOTE: from32to16() is used instead of csum_fold() because csum_fold()
does from32to16() + bitwise NOT of the result, which is not what we want
to do here.

[1] https://lore.kernel.org/bpf/CAJ+HfNiQbOcqCLxFUP2FMm5QrLXUUaj852Fxe3hn_2JNiucn6g@mail.gmail.com/

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 net/core/filter.c | 37 +++++++++----------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/net/core/filter.c b/net/core/filter.c
index bd0d08bf76bb8..e00bec7de9edd 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -1654,18 +1654,6 @@ void sk_reuseport_prog_free(struct bpf_prog *prog)
 		bpf_prog_destroy(prog);
 }
 
-struct bpf_scratchpad {
-	union {
-		__be32 diff[MAX_BPF_STACK / sizeof(__be32)];
-		u8     buff[MAX_BPF_STACK];
-	};
-	local_lock_t	bh_lock;
-};
-
-static DEFINE_PER_CPU(struct bpf_scratchpad, bpf_sp) = {
-	.bh_lock	= INIT_LOCAL_LOCK(bh_lock),
-};
-
 static inline int __bpf_try_make_writable(struct sk_buff *skb,
 					  unsigned int write_len)
 {
@@ -2022,11 +2010,6 @@ static const struct bpf_func_proto bpf_l4_csum_replace_proto = {
 BPF_CALL_5(bpf_csum_diff, __be32 *, from, u32, from_size,
 	   __be32 *, to, u32, to_size, __wsum, seed)
 {
-	struct bpf_scratchpad *sp = this_cpu_ptr(&bpf_sp);
-	u32 diff_size = from_size + to_size;
-	int i, j = 0;
-	__wsum ret;
-
 	/* This is quite flexible, some examples:
 	 *
 	 * from_size == 0, to_size > 0,  seed := csum --> pushing data
@@ -2035,19 +2018,17 @@ BPF_CALL_5(bpf_csum_diff, __be32 *, from, u32, from_size,
 	 *
 	 * Even for diffing, from_size and to_size don't need to be equal.
 	 */
-	if (unlikely(((from_size | to_size) & (sizeof(__be32) - 1)) ||
-		     diff_size > sizeof(sp->diff)))
-		return -EINVAL;
 
-	local_lock_nested_bh(&bpf_sp.bh_lock);
-	for (i = 0; i < from_size / sizeof(__be32); i++, j++)
-		sp->diff[j] = ~from[i];
-	for (i = 0; i <   to_size / sizeof(__be32); i++, j++)
-		sp->diff[j] = to[i];
+	if (from_size && to_size)
+		return csum_from32to16(csum_sub(csum_partial(to, to_size, seed),
+						csum_partial(from, from_size, 0)));
+	if (to_size)
+		return csum_from32to16(csum_partial(to, to_size, seed));
 
-	ret = csum_partial(sp->diff, diff_size, seed);
-	local_unlock_nested_bh(&bpf_sp.bh_lock);
-	return ret;
+	if (from_size)
+		return csum_from32to16(~csum_partial(from, from_size, ~seed));
+
+	return seed;
 }
 
 static const struct bpf_func_proto bpf_csum_diff_proto = {
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
