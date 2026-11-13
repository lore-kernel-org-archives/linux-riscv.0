Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4B9606A880
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gslgz5Z9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=YIxnZC8p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9eC1IxJMkKBg3QfWcQNMcQmwAYqg4b8GGkqzcZuh1E8=; b=gslgz5Z966go7hyEAhZ7W7IIid
	HyWobNOh3Kt1oHfhcOAI1/3Pl+ZekGnw39sNFXvyvre0Cm5ZgjhnnkDXuirNAQCyYsMsk2p5lzEo5
	VO7cxKyWzHB0+ypYT6rF17/othTRjsgL09qwrkmyGi1qg8Gs619PyKv9Y28xcdJ4wXkdF9ioM4ro+
	VB/VWMYDoAG5B+xPkB3R1xaEvOzPZbFZV2EPwgiV7hGlZ44F39TVc9tLniF4cTkTi3XPKpJLnYxTp
	XtrEJyObtyxvHzFQ+0/JWkJDmbGcRljho9Zvvi8hqFeVUedxoKqsczWBH1vAcH0P68PqI6IlEphfo
	YNYhHF6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRr1u-0000000CqAF-2K3z;
	Fri, 13 Nov 2026 13:09:22 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRr1o-0000000Cq8b-3Jqt
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 13:09:20 +0000
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id RdnSxWRCdyb4YRr1nxX4RQ; Fri, 13 Nov 2026 13:09:15 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id Rr1mxATZcSeuLRr1mxEbc1; Fri, 13 Nov 2026 13:09:15 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6af70bfb
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=JfrnYn6hAAAA:8 a=SRrdq9N9AAAA:8 a=20KFwNOVAAAA:8 a=HaFmDPmJAAAA:8
 a=FU8A8_eJsoxy1Wi2mmAA:9 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tSkb2PWbNxaCrUril715HAPYdAX5Cw4kojWt6qrT5aM=; b=YIxnZC8pDNq20OVPYmgUw2Tqy2
	lLZy3k0/ooflpBT2nuJUS4ibYuAJ9r0Krpn2uKSstJbkXuoWOZE1WyPS2be/ba6icdWQV7bN4UeZp
	xjI7nI42PX/0sh/UrzKpntVwCIanrHVc17r3zlCP0nWn9VY4IjFn0iVQxhnStqtcQPgBqq4FwOMOL
	3WvHzCPSsrQSw4EKW4nuUeX2VUgDE4t5vOehJ5K0xTxLZb1EPOawhy5UUdod8tr47idXKirn6EtjF
	0WeXjDyv2+iU92eGsVEZpehhIpWuIiOr3FHlp35PnmRK3i5taHJ8Di5xMPk0p9y8LXRpXPnx90x/X
	ipjJ1zjA==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:46158 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xRr1i-00000004CiO-2UVW;
	Fri, 13 Nov 2026 06:09:10 -0700
Message-ID: <972e8d28-62cf-4f47-9524-5641a9ebfff3@w6rz.net>
Date: Fri, 13 Nov 2026 05:09:09 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched: move stack_canary to the start of the
 randomizable region
To: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <vschneid@redhat.com>,
 Ruidong Tian <tianruidong@linux.alibaba.com>, mingo@redhat.com,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 kprateek.nayak@amd.com, linux-kernel@vger.kernel.org,
 oliver.yang@linux.alibaba.com, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org
References: <20260509035014.2220372-1-tianruidong@linux.alibaba.com>
 <20261106160730.GJ1779021@noisy.programming.kicks-ass.net>
 <xhsmhy0b2ntmh.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <34f2ff11-8156-4c32-91dc-e4576807cf3b@w6rz.net>
 <20261112153427.GV1779021@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20261112153427.GV1779021@noisy.programming.kicks-ass.net>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.206.103
X-Source-L: No
X-Exim-ID: 1xRr1i-00000004CiO-2UVW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:46158
X-Source-Auth: re@w6rz.net
X-Email-Count: 1
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFX04G/Ji9Y1rU0nzUibTvNIIRkR6ZC6iC6+C9014soZ5jYObkzb9WujVwpwTwHLmGq2yMgGBfVHPQVBIlCI94A8YGpgQFWOfvyo5roPNZcU+2sFLSkq
 rgNhOeeaE2Xc2k/c+dDCKRaHWMnaeoJVUWW/sdCyPRnnMMZn7EdOQNjBwFv4u9f5VxCKgIf/aHx30iNjLOu3h6Dgc6lzUsUM6fI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_050916_884341_D6EADE78 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 07:34, Peter Zijlstra wrote:
> On Thu, Nov 12, 2026 at 05:33:16AM -0800, Ron Economos wrote:
>
>>> ---
>>> From: Peter Zijlstra <peterz@infradead.org>
>>> Date: Fri, 6 Nov 2026 17:07:30 +0100
>>> Subject: [PATCH] riscv, sched: move stack_canary to thread_info
>>>
>>> task_struct keeps growing over time. On architectures that compute the
>>> per-task stack canary offset from asm-offsets.h and pass it to the
>>> compiler via -mstack-protector-guard-offset=, this growth eventually
>>> pushes stack_canary beyond what the target ISA can encode.
>>>
>>> On RISC-V, canary loads are emitted as
>>>
>>>       ld	t0, TSK_STACK_CANARY(tp)
>>>
>>> where TSK_STACK_CANARY must fit into a 12-bit signed immediate, i.e.
>>> [-2048, 2047].  Once stack_canary sits past byte 2047 of task_struct,
>>> the build fails with
>>>
>>>       cc1: error: '<N>' is not a valid offset in
>>> 	'-mstack-protector-guard-offset='
>>>
>>> On RISC-V, CONFIG_STACKPROTECTOR_PER_TASK depends on !RANDSTRUCT, thus
>>> stack_canary does not benefit from being in the task_struct randomized
>>> region.
>>>
>>> Move the RISC-V stack_canary to thread_info, and introduce an access macro
>>> to point to the right stack_canary location. Other archs are unaffected.
>>>
>>> Not-signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
> Signed-off-by: Peter Zijlstra <peterz@infradead.org>
>
>>> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
>>> ---
>> I'm seeing this build failure on RISC-V with gcc 16 and
>> CONFIG_SCHED_CLASS_EXT=y. The build does not fail with gcc 14. I've tested
>> the proposed patch with gcc 16 and it builds and boots (on real hardware)
>> just fine. So for what it's worth:
>>
>> Tested-by: Ron Economos <re@w6rz.net>
>>
>> Also re-adding the RISC-V folks.
> Hmm, they went walk-about? Do they need a re-sent? I'm thinking this out
> to perhaps go through their tree, given they're actually seeing the
> problem.

Yes, a re-send with the new subject line would be good. That way, the patch at least gets queued in the RISC-V patchwork.

https://patchwork.kernel.org/project/linux-riscv/list/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
