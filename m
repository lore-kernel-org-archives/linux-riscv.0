Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2711C388F7
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 17:28:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA3B720A8B
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 17:28:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gzJ0lzkl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA3B720A8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZM6IKrcevZKFPQvWyhGXm9f+vgMuY8DPReqLk3zipp4=; b=gzJ0lzklWlaOO38l79Rj8Agro
	Dwh7L/ASxnI8q7c8pWX4QEtio6liTGOiTHJPFaYmwwnc22/E5YDH6aMqKIVAkq/87YTfxT5p0bB2F
	0i9OJAs7aqiXStORtAecCRksLOiFl2e0EYuuQFe7vtDGTKy0uoJnfehURbYtca0Xj19+pTqMq1qUr
	DmZZllAIflBfRxINaVWKVap2PiuXyODefISF5rnHNaFpHhNh/mFcvDFpUdrsvzrJSJv6tXSEIZMko
	w7vOH43i2LqWhZg2bwiw/YoiXWDN5ZpHKiFTPADcqlJyoRGlP/nxWKtjusRZn1wwjLV0HM2C00S60
	1nge6P1pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdcsJ-0004bN-OS; Fri, 13 Nov 2020 17:28:39 +0000
Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdcsH-0004a1-2l; Fri, 13 Nov 2020 17:28:38 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kdcs8-005FWW-C7; Fri, 13 Nov 2020 17:28:28 +0000
Date: Fri, 13 Nov 2020 17:28:28 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: csum_partial() on different archs (selftest/bpf)
Message-ID: <20201113172828.GK3576660@ZenIV.linux.org.uk>
References: <CAJ+HfNiQbOcqCLxFUP2FMm5QrLXUUaj852Fxe3hn_2JNiucn6g@mail.gmail.com>
 <20201113122440.GA2164@myrica>
 <CAJ+HfNiE5Oa25QgdAdKzfk-=X45hXLKk_t+ZCiSaeFVTzgzsrw@mail.gmail.com>
 <20201113141542.GJ3576660@ZenIV.linux.org.uk>
 <f634b437-aa51-736b-e2f3-f6210fc6a711@iogearbox.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f634b437-aa51-736b-e2f3-f6210fc6a711@iogearbox.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_122837_918398_00A5A2C5 
X-CRM114-Status: GOOD (  19.54  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Tom Herbert <tom@herbertland.com>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Anders Roxell <anders.roxell@gmail.com>, Netdev <netdev@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 13, 2020 at 03:32:22PM +0100, Daniel Borkmann wrote:

> > And I would strongly recommend to change the calling conventions of that
> > thing - make it return __sum16.  And take __sum16 as well...
> > 
> > Again, exposing __wsum to anything that looks like a stable ABI is
> > a mistake - it's an internal detail that can be easily abused,
> > causing unpleasant compat problems.
> 
> I'll take a look at both, removing the copying and also wrt not breaking
> existing users for cascading the helper when fixing.

FWIW, see below the patch that sits in the leftovers queue (didn't make it into
work.csum_and_copy, missed the window, didn't get around to dealing with that
for -next this cycle yet); it does not fold the result, but deals with the rest
of that fun.  I would still suggest at least folding the result; something like
	return csum_fold(csum_sub(csum_partial(from, from_size, 0),
			          csum_partial(to, to_size, seed)),
instead of what this patch does, to guarantee a normalized return value.
Note that the order of csum_sub() arguments here is inverted compared to the
patch below  - csum_fold() returns reduced *complement* of its argument, so we
want to give it SUM(from) - SUM(to) - seed, not seed - SUM(from) + SUM(to).
And it's probably a separate followup (adding normalization, that is).

commit 1dd99d9664ec36e9068afb3ca0017c0a43ee420f
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Wed Jul 8 00:07:11 2020 -0400

    bpf_csum_diff(): don't bother with scratchpads
    
    Just use call csum_partial() on to and from and use csum_sub().
    No need to bother with copying, inverting, percpu scratchpads,
    etc.
    
    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

diff --git a/net/core/filter.c b/net/core/filter.c
index 7124f0fe6974..3e21327b9964 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -1635,15 +1635,6 @@ void sk_reuseport_prog_free(struct bpf_prog *prog)
 		bpf_prog_destroy(prog);
 }
 
-struct bpf_scratchpad {
-	union {
-		__be32 diff[MAX_BPF_STACK / sizeof(__be32)];
-		u8     buff[MAX_BPF_STACK];
-	};
-};
-
-static DEFINE_PER_CPU(struct bpf_scratchpad, bpf_sp);
-
 static inline int __bpf_try_make_writable(struct sk_buff *skb,
 					  unsigned int write_len)
 {
@@ -1987,10 +1978,6 @@ static const struct bpf_func_proto bpf_l4_csum_replace_proto = {
 BPF_CALL_5(bpf_csum_diff, __be32 *, from, u32, from_size,
 	   __be32 *, to, u32, to_size, __wsum, seed)
 {
-	struct bpf_scratchpad *sp = this_cpu_ptr(&bpf_sp);
-	u32 diff_size = from_size + to_size;
-	int i, j = 0;
-
 	/* This is quite flexible, some examples:
 	 *
 	 * from_size == 0, to_size > 0,  seed := csum --> pushing data
@@ -1999,16 +1986,11 @@ BPF_CALL_5(bpf_csum_diff, __be32 *, from, u32, from_size,
 	 *
 	 * Even for diffing, from_size and to_size don't need to be equal.
 	 */
-	if (unlikely(((from_size | to_size) & (sizeof(__be32) - 1)) ||
-		     diff_size > sizeof(sp->diff)))
+	if (unlikely((from_size | to_size) & (sizeof(__be32) - 1)))
 		return -EINVAL;
 
-	for (i = 0; i < from_size / sizeof(__be32); i++, j++)
-		sp->diff[j] = ~from[i];
-	for (i = 0; i <   to_size / sizeof(__be32); i++, j++)
-		sp->diff[j] = to[i];
-
-	return csum_partial(sp->diff, diff_size, seed);
+	return csum_sub(csum_partial(to, to_size, seed),
+			csum_partial(from, from_size, 0));
 }
 
 static const struct bpf_func_proto bpf_csum_diff_proto = {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
