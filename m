Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8880606A328
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 07:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YA+Lp54f;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=QXVlEXpb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=szC9dChuy0839mlubL/WrkslNeWYL2uwtuKrdHCo8T4=; b=YA+Lp54fjLWc2UxPxWRaj/T1RJ
	R7yUV16WANRUBIeypj7eCWJNgQjKCs2xDifoKDq1ZbGsNq7epQKvSFnuChpjZESFwwoXYjkU6H2w0
	/BGoQoJCu3X/6OpgL4RVhTZA68klnz86nlSg0RUblSiQeuTUeddFfg5ThpkyYDXvawmHbODBs5Zi/
	R0iyahlXpzhOKqEBgdTwxOIhlLE02s8eFqF2InyNVqAO0zqdTn+niUTMxD/aK9q4lKA8d7dMoOCoC
	sYPbfXtj7cyMhkM1Sn8A/9wOQ1BXoXunlTH0SsufcfG0HOXjEmTfqg6DWujXPoQjTOEU9KB3It0cl
	NMNjZsfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrT6-00000007zp7-2a4G;
	Thu, 05 Nov 2026 07:01:04 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrT4-00000007znT-0tcG
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 07:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793862020;
	bh=MXIuh878KbS0qTfh1/i+lplkSClQwh04M6y9YYPiFcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=QXVlEXpbOCjRQE5V9pDOZVsW5dH0UzL+CVeWnmW4/3NRMj8xujVyP4aKs7CUJfW8j
	 OJ5gjibJ+N1m1iaZ4h3lkXLTD9KxTWnbf6j+ikiaRQ0IAdAoUC+VgBWAVBE9x9C6dx
	 Cj/DZxNCT6uQXDjcreSwmpN43keZrhuKHjY16S4A=
X-QQ-mid: zesmtpsz6t1793862018t2516ac74
X-QQ-Originating-IP: MTeUKjwypxYcnyqmTJBobIe+FEl3TfB5eQ4OtFO434A=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 15:00:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3473592725829115131
Message-ID: <41B3F89514935AAF+5c08fd7d-1cfb-428c-9ef8-035fa3910bd6@linux.spacemit.com>
Date: Thu, 5 Nov 2026 15:00:15 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/14] gtrace: Add RISC-V Trace ramsink driver
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup.patel@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-10-mayuresh.chitale@oss.qualcomm.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20261001052243.3042627-10-mayuresh.chitale@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OBUGnm9pFasA0Y95VdBqDLkfHFQ+Hd+x2d4AB0Ev0Dp/a54JZmZ8PMr/
	BHThQC2vFvNTKHF/Krs1Rnatbn3C4KHHMAc5EPY/NknNj8qMron5fuusRp/RL48r1aNzAWk
	BHTqDINPRqFLCg1S1MrTzN4JaPA+SSQy6hobimWF7OOsrmHuly70R66qAHHX6Bajy7moiZC
	RZF7H0HyP4NlcoGnxxquUCExuTph8F+0Dqxza2SWdtJgzQSrR1Y3urGlo5eavwyEpVspyX0
	q0Vhc0+bzoekC5Dj526ssXfnthCuAdgxvLOWzn1aqoyfr0mzk5D6tqu3wGEnNCUjIYc8D9R
	2/Ld2ia2zmjH1kFO4JDubXGZ+XoGGU19GorSkRIZffXE/5waa0KA3vaumWp6whpGXvNP+CF
	mFFzODmpgTqRXaopI9xF0mc8OPn96Uch9GTSEptfyM9oYjaAf15kJETJTUIgRsqUsJnfwKA
	IauJp9dNpxXKmclOhR50BJR3R4qOd2kRUIhBTBL5mG/9ZOX6uu0HTPXap5FG24HBuzrxAjd
	Do8dUobdWh8RIhd4O8Dz38kNQYt8gN2GgPHnO5SOyLtYRvxoLsiJCV3QNdE2D2lsG/FSMtl
	yTK8blQMKWHEKdvJIf1MeTm9znUJloqJAsLNIBwYAgVMsx/gPtNrEBALAcvp5hW0DNb+zEC
	fVsASd16UPNzct//0Hou9ipBucVyXdoGjN+k/mSaf8mQoLar2frX3nE4seQAP281V+yNlXo
	FlWMAbaEKZjLBhqFeWz7Mjb2/5eL6jEr1g6qLQQfu2iYiL5Ez+dwrLV09qyZDpTZL0E5Tmb
	GDqSD4Mkyzr4jrUbl6MZz9R2FC0+TB5vHszC7qVzq3Vv0OrJG6jgwqrTBZ+1L9iAZnsw3qy
	jfcZFNy8o6nPEdUzOdR7FBVyadkVrZPJyIVsQk7fRxS+HDOKtJIjdCZNyeCaZnFVlAS4Vom
	2n/PPmHj+bn4m9pvAqMo6Fp6KUvPZGDatRXikjAbg/GPK2H39EmaT34U+AuQBpc58OAgObp
	qIwun8jSwQ/vP/zNfJF4YzUY3SiuzU0/Wdfq/tsw==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_230102_699426_63038ECF 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
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
> +/* Helper to access start, limit, wp pair registers */
> +static u64 rvtrace_ramsink_read_pair(struct gtrace_platform_data *pdata, u32 low_off)
> +{
> +	u32 low, high;
> +
> +	low = gtrace_read32(pdata, low_off);
> +	high = gtrace_read32(pdata, low_off + 4);
> +
> +	return (u64)high << 32 | low;
> +}
> +
> +static void rvtrace_ramsink_write_pair(struct gtrace_platform_data *pdata, u64 val, u32 low_off)
> +{
> +	gtrace_write32(pdata, lower_32_bits(val), low_off);
> +	gtrace_write32(pdata, upper_32_bits(val), low_off + 4);
> +}
> +


Could you move these helpers into "include/linux/gtrace.h" and implement them as generic APIs
(e.g., gtrace_read_pair, gtrace_relaxed_read_pair, gtrace_write_pair, and gtrace_relaxed_write_pair)?
This would allow them to be easily reused by future components like Coresight.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
