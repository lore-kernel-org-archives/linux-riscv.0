Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B174606A328
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 06:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QeuWiI+a;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=xO0yIJpw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cQpFvsKT42GP4x93uYQ4bMyL7VlGVflJAJJp4+4XKa8=; b=QeuWiI+auSdxgaCN+rHA8E+P7/
	ah1hxBGGcEPui1pBMLb2cKT7DN1KlHw4jeUdiH24a1u4MSc9XHrnZXuo0P6BhwUqOVa0Pubmco3f9
	+2hP61Ci1p95K0B9JDBmsfMw4IiUf8Ki9BAMvRcuiZTsd0RxAOVWClYLZMRdMq0CbqKmziYH+gVUw
	c6NGGXpJ+IyDYTNcVY/rZil1MI9KVFYBOFkv/4xCKJ90ApG88Y0I9wckfyB9l5JCMr0PCxIGcUW77
	ToWMYo212ED5tRxVsGocqv+UY1DUX53zUQ3nDOct0tZCPT9NobO+6ejIqeuYFojEDn5roGBRVX7F/
	F70ul9Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrGl-00000007yy8-1pVU;
	Thu, 05 Nov 2026 06:48:19 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrGg-00000007yxP-4APG
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 06:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793861237;
	bh=y8vL7kxoR7SzZztx/rZLqHDEEm7PeYDs33h2gMA1c9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=xO0yIJpwSl31rfU+maDi4+Z7UWjq2wnsglLv84FL+/cT80gL+TKbbFCYi+pVLWv7I
	 7w6J9UjLpq/SyAi6mrofOA39vhJJARbKOcz0U1EmggqGj/e83w06iSH5MHssVaExUx
	 fZwNWNYOnQBNvVn+KCESRm6Uo3HiQpczRy2axeVU=
X-QQ-mid: esmtpgz16t1793861235t37038cbf
X-QQ-Originating-IP: InQ75TYjDrWjVR1HZK+vsqw7EkBc6FPy3QXlMoZVjZE=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 14:47:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13246700401697265975
Message-ID: <BC03A4A81DF1016A+99de9ff1-0e4e-45ad-a8c2-1a65a6d96afe@linux.spacemit.com>
Date: Thu, 5 Nov 2026 14:47:11 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NE5JZmi0+KQuSulpwSo8843Vb3RZC/d8VCQF61aLAMxLEepOs6Vg5OK1
	KQhHNoyJLZZjk/FTlpgCe6TCPtKDxLZxA+IOOcLOHaZLvTfOsF7Xo8lO231C/H2j3qpml/9
	ELRk/223cXjdWcNffdjnS+exrfY5MNluvv7mFfXzkI+Qnkske6SMMzsVePZdJvK2jmIxaYX
	KbDZHShvMbVSfjaYSYqnBgwWXy27cf/g2EQQzmaCnNqYsK6zcJ/DQjLjwf6P1c3YVgp35tl
	2Ppe++8HJjhHmmzwgNw6UhXeT09ERTz/tWfSKjz3enIaLB/1J+BRKyR1bh3cA+0YISJGlPO
	hOv5CK/NE19r5ehuAoZuUUM7OqC2Pr9tX/NnNnE2m27raABqbN1wFvW2Q0g0+LvX+Rm5Wy1
	+nAgEOp32TUWMBAUgRkLaTCPM2Vlw0N/qatZ9xqvFvOYWLi770kNtNfpArGznSvJ7CVvBfi
	6vI5zWHDJCZVkAm/SxfIKt4n4Y7LvATfLnSvz6VFNtofjvEhIi4eI/YqyeNqDmXvsCkgz2c
	4PTm/8LLwgVGYjDJxd3j+NO6Y83lvczqB56bG9VIYb8N2a+k4195pneOLbkCy/PPw2kE6nX
	8tkRRXSkhFQuR9vU1xYwsdjtxM4pR6EdeVdSb02JvtcMkTFtVt35adhDA0fDlL4gLzcbBiX
	P9ZUg0C3miN0tVKOe76xLXAjiRKUTkTuWu2xanvtYLVlRmSxOQcJkKuFswCa3Cy27Id1Mb9
	6cI2h7XktxCMbuYVSKbNJfN52cMXAjlFwcfAgAPx6Pw5HiS7hmzsEQsXWY96W5oUacswBwA
	4A1m7z51eJ47d0Fk8iyANsOZPj7jJVx/RNScq3bSTkXisuciBky4mny3lt83EncBuM2d8Ut
	Gt5dIK7SdrCwgQF3zhKi5G1oExuzSkZOyZdRH1ZWjRkrT+BfUQUhtrgNyXGVP/VNZxzCDYM
	ytf5DfG6ku8UwjwJR7I4MwUyv14z2NJN5Ff+4yHriDqdwNSURJnJV5cvrUWTeAk1RoRjkT6
	S4M/kDvt+voAf52CljfSfMyGjieOE=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_224815_779737_ABFBFDC9 
X-CRM114-Status: GOOD (  10.33  )
X-Spam-Score: 0.2 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
> +static const struct of_device_id rvtrace_platform_match[] = {
> +	{ .compatible = "riscv,trace-component", .data = (void *)GTRACE_FORMAT_ETRACE },
> +	{}
> +};

The current implementation with hardcoded .data = (void *)GTRACE_FORMAT_ETRACE prevents RISC-V N-trace
from working properly without extending the of_device_id table in the future.
This directly contradicts what you stated in the cover letter:
"The RISC-V trace component drivers are designed to be agnostic to the underlying trace protocol hence both
RISC-V E-trace and RISC-V N-trace should work fine. The discovery of trace protocol parameters are left to
user-space trace decoder."
Since the kernel driver is intended to be protocol-agnostic, and a specific in-kernel decoder is not yet implemented
at this stage, deferring the trace protocol discovery seems to be a much better approach. Once the sysfs interface is
introduced in future patches, the user-space trace decoder can naturally query and obtain the exact trace protocol
from it. Therefore, I suggest removing this E-trace specific hardcoding from the match table to keep the driver truly
protocol-agnostic as originally designed.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
