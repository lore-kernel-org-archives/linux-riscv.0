Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CEA606A333
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 07:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iQ4H9bWu;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=JGHA59W+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QojdPNmIAMb0MXYdKrPlC48JrFNqtwh2m8OvGFaYv6s=; b=iQ4H9bWuVtvFHArifju24pmV3p
	XYbz2AN4eyoiNp8M32sTTOX3y+/+uA5YKWOeQkdHmaMeFWUSoCez+9+gpUsX2jYJCFw5ZJcDw5uHu
	HJyeb8noL5ffmXVNn5Rr3SNEXwQFJ+Vci/ZMXP3lf1AaE78PPNfh/uF9jHONj7wgW7tRbmT/hkh++
	23XOfB7l+88XlTI2so/ebhgxRY1OFFSrejDGtXZqSlekHot387Iw1y8NHmDHMPpoIgXJWdB7M9i1f
	mR/Ee+tgAHEiMwAshRkoTxrhv7olc4kYR5uagTx26yioH1As5qSD2Zy0LubUlQAXHd1HMf78B+pQu
	s5V9sBag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrbV-000000080HA-29Oq;
	Thu, 05 Nov 2026 07:09:45 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrbR-000000080G7-3qGI
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 07:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793862542;
	bh=2wjAopW76cs/UHZAfdI5EmAbrGuClnCkHqmY5dgSxS8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=JGHA59W+ZTmItwd8n57ZvWi3GIFWqBsgvz4X/GvgbApeAUprIJvtAoBORHyraX1e2
	 kdgsLl5K8s+fQP5dNdf6WfxMUFUYuAYBeNIzGJu3x7r0I2O0K4tpOJexEuxSFcx4xw
	 /+9BAfn/fV0YHsJKXHrMF41o8kz2l5qfX1GHQHf8=
X-QQ-mid: esmtpsz19t1793862540ta706a2a3
X-QQ-Originating-IP: Q9P8Ls0lg0KstabeEoyvHdwuqg23mI8mBT4P3m+pgGY=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 15:08:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17593752035460933751
Message-ID: <17FBF8B3DEC33669+55643c4c-b5ae-4ac3-bb2c-a1653c3a6972@linux.spacemit.com>
Date: Thu, 5 Nov 2026 15:08:56 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/14] gtrace: Add RISC-V Trace ramsink driver
From: Zane Leung <liangzhen@linux.spacemit.com>
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
 <41B3F89514935AAF+5c08fd7d-1cfb-428c-9ef8-035fa3910bd6@linux.spacemit.com>
In-Reply-To: <41B3F89514935AAF+5c08fd7d-1cfb-428c-9ef8-035fa3910bd6@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MvyKdZyVtFx3UoBxCzEhtd3ZIhrR6mivOCJZvRJoAIRb5gEqlWoOp5Wb
	L/4WCCS11rjVxKQtfJTBfIhGYemQ98+KT2lbt0LaTn7ChnqFuFWk0eq0SaoiB/X2GyQFjbd
	4ZbgsHklzZS0Uh1VJeDR8ZBLFPojkMsMrEfEoZ2ofX6RwYKEZUh77dCLv6RMhgpo1SUZD0Y
	gQjF0NbjtfX3qLSjBad7NH/7UCUV50awbosBtU5cUzX4V7ZOiiZzag4u12e4J3U7dMDc9e7
	Z9pU9TcqxwgEolCoXdMIrPxK2WSXmmsrfQ7SPxEYOLI1yUwHRsBkLQDxzhEcpdc+u1yn9WY
	E4JoZshG0e9vf0iudwcLmKPFRnKMrz46I4XDi9pv9nPQRYYXPvYhm1lR8mN3twHSZRkSgAs
	++0aHcAGL9IczROPOgGmlV4eTs+bUM5e1YiRpYp3wmn32QupqXw054RHqlR3dlsscHSuFco
	BOkmKvmTPCXjBHJ4Vt49Iis9Jliy14FPCcEtXMRycfuXxlowtOsnmGo9w6FOgBU+pe19QGM
	TUDLkJnFko48OqoUEacxOxooAwfbxZLEtLRYkIREhDDK453YsG6z7u0BBYOjgTuzv4HToSG
	Lce+W1K64whehFZeJPoOzZMyGWS7uAtAXvQtE/UvonUbkH79RySQ4kdgAfNGARIkPoyZV5z
	vIF3Q8ncxDfRiS/l1XYlqqCJQEIqZu1ou9bxrnTy/Ga6f5lCa+lm4SI62Y3xHfG+OT+pQuw
	v+XyFdzQ7kmBzECv1qj3txHzgBdaUfZ6Dsnr8sE540gE6rXiqGaFeKzaWZQTOTd/m7xNxXe
	KGLalOKfRjljhswT+MSNZRuWpwKVwYjvOPmVT57oBwRgvMVqfUxKpiv/w+sRzc4zRSajYjZ
	Vx5T3kNzUQjP7yFunLW4vZSY/xEVWGNLDFpggOnjbOzetpAehf0oRY4How+nZI0u+wNADpM
	23DWJKtcskNPJy5qV280U9RWF3eBsnZIeUlhi1ywxDCtw/dgrKrJFoT2Kwt+rt05L0wO/oR
	nlcYuh1b6NiNHLBG6wpAgqSOzWTOSp37lp/8yIxea5OMqwRIWA
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_230942_272476_38360E63 
X-CRM114-Status: UNSURE (   8.41  )
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


On 11/5/2026 3:00 PM, Zane Leung wrote:
> On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
>> +/* Helper to access start, limit, wp pair registers */
>> +static u64 rvtrace_ramsink_read_pair(struct gtrace_platform_data *pdata, u32 low_off)
>> +{
>> +	u32 low, high;
>> +
>> +	low = gtrace_read32(pdata, low_off);
>> +	high = gtrace_read32(pdata, low_off + 4);
>> +
>> +	return (u64)high << 32 | low;
>> +}
>> +
>> +static void rvtrace_ramsink_write_pair(struct gtrace_platform_data *pdata, u64 val, u32 low_off)
>> +{
>> +	gtrace_write32(pdata, lower_32_bits(val), low_off);
>> +	gtrace_write32(pdata, upper_32_bits(val), low_off + 4);
>> +}
>> +
>
> Could you move these helpers into "include/linux/gtrace.h" and implement them as generic APIs
> (e.g., gtrace_read_pair, gtrace_relaxed_read_pair, gtrace_write_pair, and gtrace_relaxed_write_pair)?
> This would allow them to be easily reused by future components like Coresight.
By the way, please pass both |low_off| and |hi_off| as parameters to handle non-contiguous register offsets.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
