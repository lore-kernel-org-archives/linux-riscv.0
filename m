Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B10C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 08:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5JkIC1mkFc2DBGH+nDFLEKTis6f19SZwGuempMuNyY=; b=M8R1bg28vwng2F
	gXH2P7kOyEFgqXdGKs4fSzikyiTG1jNjByJP97D5fbjHm+yQJOU62quEQFjSogdr711/5Th9fprar
	FTTSmFstRF/DGD8YS87moiMxFH/qVcQoUl7oFE6Rde2wtAw6Dfz0or3CJJr0VIUXS1aaxp/ZWG6Ze
	Ojs2rK2ToxBMT5zEDJSQzYdLRs4MNXyBPxKCCTF7HNqJP1pyvHH6BPluqeIObJPQQnLGnon5VGykZ
	JK1NralWcSAQfWoO7dUqhzZw5tRKbUrOLj2HHg+qmgeXEnefWTgIV+HO9D+gEVwheEbvNnd6sT9kU
	aZF2QYgSGLWKm6HRDnxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOV5-00BNZF-0o;
	Fri, 12 May 2023 08:51:43 +0000
Received: from m12.mail.163.com ([220.181.12.215])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOV1-00BNXL-06
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 08:51:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Iq/mc
	1EHIUqB6xRu4lMqfdubuRX8mTUO0Lg6xT8WvlQ=; b=UcblPOcIgQVN8pKpNhBKL
	sBBAwappDAcIeqPrmH28NrQpqelJVF8xoo5lJxJpACvZkSy4N4joSIQVyn76totq
	OCEvDX8WMY9YUQcyyvlmXKOabg2o8KPjE+9uGL88W55IL/fpZjeWJbKZVdXlywo+
	kSj2xLpzwgOrBith8flzdU=
Received: from zhangf-virtual-machine.localdomain (unknown [180.111.102.183])
	by zwqz-smtp-mta-g1-4 (Coremail) with SMTP id _____wAXzkYO_l1kPYCkBA--.15077S2;
	Fri, 12 May 2023 16:51:27 +0800 (CST)
From: zhangfei <zhang_fei_0403@163.com>
To: ajones@ventanamicro.com
Cc: aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	zhang_fei_0403@163.com,
	zhangfei@nj.iscas.ac.cn
Subject: Re: [PATCH v2 2/2] RISC-V: lib: Optimize memset performance 
Date: Fri, 12 May 2023 16:51:24 +0800
Message-Id: <20230512085124.3204-1-zhang_fei_0403@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511-0b91da227b91eee76f98c6b0@orel>
References: <20230511-0b91da227b91eee76f98c6b0@orel>
MIME-Version: 1.0
X-CM-TRANSID: _____wAXzkYO_l1kPYCkBA--.15077S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKFy7ZFWDur48XFykuF1kuFg_yoW7XF45pr
	WxGrnI9r15Krn7tw1SyanYvr1Fgws3tr45Jr4Ut34UCrnxWa4qqFnagFWFga4fGr9Ykw4v
	vr42yw1xCFn8ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEFksQUUUUU=
X-Originating-IP: [180.111.102.183]
X-CM-SenderInfo: x2kd0w5bihxsiquqjqqrwthudrp/1tbiMg9tl1WB3uXmDgAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_015139_486806_F1DD0EDE 
X-CRM114-Status: GOOD (  26.90  )
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

From: zhangfei <zhangfei@nj.iscas.ac.cn>

On Thu, May 11, 2023 at 15:43:26PM +0200, Andrew Jones wrote:
> On Thu, May 11, 2023 at 09:34:53AM +0800, zhangfei wrote:
> > From: zhangfei <zhangfei@nj.iscas.ac.cn>
> > 
> > Optimized performance when the data size is less than 16 bytes.
> > Compared to byte by byte storage, significant performance improvement has been achieved.
> > It allows storage instructions to be executed in parallel and reduces the number of jumps.
> 
> Please wrap commit message lines at 74 chars.
> 
> > Additional checks can avoid redundant stores.
> > 
> > Signed-off-by: Fei Zhang <zhangfei@nj.iscas.ac.cn>
> > ---
> >  arch/riscv/lib/memset.S | 40 +++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 37 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> > index e613c5c27998..452764bc9900 100644
> > --- a/arch/riscv/lib/memset.S
> > +++ b/arch/riscv/lib/memset.S
> > @@ -106,9 +106,43 @@ WEAK(memset)
> >  	beqz	a2, 6f
> >  	add	a3, t0, a2
> >  5:
> > -	sb	a1, 0(t0)
> > -	addi	t0, t0, 1
> > -	bltu	t0, a3, 5b
> > +       /* fill head and tail with minimal branching */
> > +       sb      a1,  0(t0)
> > +       sb      a1, -1(a3)
> > +       li 	a4, 2
> > +       bgeu 	a4, a2, 6f
> > +
> > +       sb 	a1,  1(t0)
> > +       sb 	a1,  2(t0)
> > +       sb 	a1, -2(a3)
> > +       sb 	a1, -3(a3)
> > +       li 	a4, 6
> > +       bgeu 	a4, a2, 6f
> > +
> > +       /* 
> > +        * Adding additional detection to avoid 
> > +        * redundant stores can lead 
> > +        * to better performance
> > +        */
> > +       sb 	a1,  3(t0)
> > +       sb 	a1, -4(a3)
> > +       li 	a4, 8
> > +       bgeu 	a4, a2, 6f
> > +
> > +       sb 	a1,  4(t0)
> > +       sb 	a1, -5(a3)
> > +       li 	a4, 10
> > +       bgeu 	a4, a2, 6f
> 
> These extra checks feel ad hoc to me. Naturally you'll get better results
> for 8 byte memsets when there's a branch to the ret after 8 bytes. But
> what about 9? I'd think you'd want benchmarks from 1 to 15 bytes to show
> how it performs better or worse than byte by byte for each of those sizes.
> Also, while 8 bytes might be worth special casing, I'm not sure why 10
> would be. What makes 10 worth optimizing more than 11?
> 
> Finally, microbenchmarking is quite hardware-specific and energy
> consumption should probably also be considered. What energy cost is
> there from making redundant stores? Is it worth it?

Hi,

I added a test from 1 to 15 bytes in the benchmarks.The test results are as 
follows:
Before optimization(bytes/ns):
1B: 0.06  2B: 0.10  3B: 0.12  4B: 0.14  5B: 0.15  6B: 0.17  7B: 0.17 8B: 0.18 
9B: 0.19 10B: 0.19 11B: 0.20 12B: 0.20 13B: 0.20 14B: 0.21 15B: 0.21
After optimization(bytes/ns):
1B: 0.05  2B: 0.10  3B: 0.11  4B: 0.15  5B: 0.19  6B: 0.23  7B: 0.23 8B: 0.26 
9B: 0.24 10B: 0.27 11B: 0.25 12B: 0.27 13B: 0.28 14B: 0.30 15B: 0.31

From the above results, it can be seen that the performance of 1-4 bytes is 
similar, with a significant improvement in 5-15 bytes.At the same time, it can
be seen that redundant stores does indeed lead to performance degradation, 
such as at 9 bytes and 11 bytes.

Next, I modified the code to check 2, 6, 8, 11, 14, as shown below:
'''
sb a1, 4(t0)
sb a1, 5(t0)
sb a1, -5(a3)
li a4, 11
bgeu a4, a2, 6f

sb a1, 6(t0)
sb a1, -6(a3)
sb a1, -7(a3)
li a4, 14
bgeu a4, a2, 6f
'''
The results obtained in this way are as follows:
After optimization(bytes/ns):
1B: 0.05  2B: 0.10  3B: 0.11  4B: 0.15  5B: 0.19  6B: 0.23  7B: 0.23 8B: 0.27 
9B: 0.23 10B: 0.26 11B: 0.29 12B: 0.26 13B: 0.28 14B: 0.29 15B: 0.31

From the above results, it can be seen that when we modified it to check at 11,
the performance improved from 0.25 bytes/ns to 0.29 bytes/ns.Is it possible to 
minimize redundant stores while ensuring parallel stores to achieve optimal 
performance?

Therefore, I modified the code to detect 2, 4, 6, 8, 10, 12, 14, as shown below:
'''        
sb a1, 4(t0)
sb a1, -5(a3)
li a4, 10
bgeu a4, a2, 6f

sb a1, 5(t0)
sb a1, -6(a3)
li a4, 12
bgeu a4, a2, 6f

sb a1, 6(t0)
sb a1, -7(a3)
li a4, 14
bgeu a4, a2, 6f
'''
The results obtained in this way are as follows:
After optimization(bytes/ns):
1B: 0.05  2B: 0.10  3B: 0.12  4B: 0.17  5B: 0.18  6B: 0.21  7B: 0.22 8B: 0.25 
9B: 0.24 10B: 0.26 11B: 0.25 12B: 0.27 13B: 0.26 14B: 0.27 15B: 0.29

From the above results, it can be seen that this approach did not achieve the best
performance.

Through the above experiment, here is my conclusion:
1.This optimization method will inevitably result in duplicate storage. I cannot 
achieve the optimal state of each byte, for example, when I add checks on 9, 
the performance of 9 will naturally improve, but 10 and 11 may become worse due 
to redundant stores.Therefore, I need to make a trade-off between redundant stores
and parallelism, such as checking 9 or 10, or something else.

2.Storing parallelism and reducing jumps will compensate for the cost of redundant
stores. Based on the current multiple test results, regardless of which bytes I 
modify to check, its performance is better than byte by byte storage.

3.From the above experiment, for the detection of 2, 6, 8, 11, and 14, its overall
performance is the best.

Because I am not a chip designer, I find it difficult to answer specific energy 
consumption costs. Do you have any suggestions and how to conduct testing in this 
regard? I think although storage has increased, there has been a corresponding 
reduction in jumps and the use of pipelines.

Thanks,
Fei Zhang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
