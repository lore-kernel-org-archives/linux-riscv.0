Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E5AFD0053
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Mar 2026 03:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VtToSSHu73/G8SvAgockLzIA4wkdqCH1wrEZBcp5UwI=; b=49XlX8oFZc7Tjg
	3jlw4F/TVm0IFHAhbBk6hb6tZs4/3tMsTlHa2+dHm4GO3r2KJX/fJK43SXqijoo34sbS0HNMUtzEg
	Bj1Dgk4s6+Llo4f1ooxQdBJicBBSIwwP50R5es3+XdEIMINzCtIMSfMJIN93mwEZLSWEe5gIddJxr
	PNJq2flbiRyf0vJWBFO1n8GLXg6EePLYR1YP8dBbvsl30cB89nxYwTw+JjJcrBLZCCCMzWnD2dme9
	apVtEfnbfTQZJKdV6SFyqviU+wkTBpFLAiDJ2asWhcJmkd7eVqyzWziHpsCd7ofcknySEC3Rgn3yR
	tw/MjEr7p0lMgrwWbx8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwXo3-0000000Ao0k-3B3d;
	Sun, 01 Mar 2026 03:49:23 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwXnz-0000000Ao0B-0RIo
	for linux-riscv@lists.infradead.org;
	Sun, 01 Mar 2026 03:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1772336933;
	bh=+5paHRPZZrBh/NKD6TDbxyoYm3rv+54rwhY/Og8SU+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=eD1/LXtfe3Cen80ukqTkFd7ujacjfmC3VaTsMJTD1LPGJX3RSaypP2Dc+LR6AU4NN
	 hwRYbxLDP+MR9qXiFr98UsMezjvf8jUZnoqqXvFGU6r6w8+u4OH6reXa5Atd3wFxzg
	 3VvMzE66lXFnETHClOJWTyWh/y67zPGulJHFN6fE=
X-QQ-mid: zesmtpip4t1772336923tc5040b5f
X-QQ-Originating-IP: hkJyYHD8Fmt2mknEqNTEkP9Ut4PKZmIXRumoHQA1hJk=
Received: from [IPV6:2409:8a1e:2ff0:1c00:c54c: ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 01 Mar 2026 11:48:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12201496879087410398
Message-ID: <CAB7A310CE95B577+5f5c0825-25dd-4035-9316-db940c00216b@linux.spacemit.com>
Date: Sun, 1 Mar 2026 11:48:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] dt-bindings: iommu: Add spacemit/t100 features
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, Yixun Lan <dlan@kernel.org>,
 Jingyu Li <joey.li@spacemit.com>, Zong Li <zong.li@sifive.com>,
 Yaxing Guo <guoyaxing@bosc.ac.cn>, iommu@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1772289741.git.lv.zheng@linux.spacemit.com>
 <D8CE6E5B1001D797+a6f36da0272ac18fff2a992976b1defc3bb01af6.1772289741.git.lv.zheng@linux.spacemit.com>
 <177231592262.848068.18080490567217057666@spud>
Content-Language: en-US
From: Lv Zheng <lv.zheng@linux.spacemit.com>
In-Reply-To: <177231592262.848068.18080490567217057666@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: M+DG/l9YxNXYmabmMRMls1lbrfJ4T+/KYUogo7rrBzWN1EzsTJENjweJ
	sToqhOMu0z+KnyBg+FPGqd0857FgapFn9F0mZW4hl1C899Q/dy5n9WyYcCe4sZXOZ1c7UrF
	PbHBimn5ACcOIc9Nu9gSVAx2v9mj47mkniUq/1lnUl9vglG/CuF9YRoIOZCMh/nl3hxUmrd
	C6fo985s6yI9ZwqngDDEqkeLvj4m/iS7xGsJPssVZRamFkfu2pr7up3995hNiYJMamGkthY
	YXEJ0T0kjH7Nlx/XJQE1pLfNUz4XL4kpy7gAc8srCglzgyFCSxipP0TPOGeHTDPb8k++q05
	Pd6zUq4Tf7jhYXEWciODD3PjDpaKf5e8MbuvRMZpP8fMHRYXR2OUi+abE75zc6MkmaVmsf7
	SPZ6+jljyEHkNztoy2lP0Ar0YXQBz3e4qbGbXGXw2OfBfzOvfpRPKXzk6Rgwklzgju6IglP
	ljMZmC9C9C4iHgThR5Vq7jHmdClGFz32MLL0uFEinkhJ1QuPaW0MwiQPFiEcsAYC7Os1iHU
	wSJhmWFmAp0FVOK2RgYR9TsnV5MSD02w6MrLDXYEOyXtaulhfzozq5Q874VfF5rnwMb5r/H
	oWHY8QkIyank5gH7JGwSbEJvn3hVQcHVZOnIjoC34iXv4cyyt5vFq6N8pWe8McjCIYXnLZL
	zeGoNE2NL4UvO3yG8nnpnduRZ5FX0vsaQ5qZVygwh8lZ1+C72UXoZLiF+qqDhxW+2eqznnP
	3gsyz3fEDJK5tBT6DPjcpMn5wXpx1IWoUOFz911OpbRVbPvUUgJVb1EJoC0ktZRml8+Vb/R
	76tnd9U7vr9smo8iaZJVTBFS0DXXofoaueeG3xbj5bYoLQbWglliMpPmRD1EiBJrHOhRjoe
	aECSqjpWyQc8TnpuNB8ncCxsv0Qy4IwoQZcSLbIEG6zulNf65MChFO1Bf3fUo4cirL/IoBx
	19Vf4Z0bDAYM9I9tSkklzM9HsYkm8u60yLETCiVed3tDQ85psNLiJmVZSXmxQ46fckQLur2
	/hrhlmkhk7usGJSZxxQlLC70J3QxCmST4DItZEA9gAVryEAtiEMGFNNZB0Sxk=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_194921_164137_3431E34C 
X-CRM114-Status: GOOD (  12.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/1/2026 5:58 AM, Conor Dooley wrote:
> On Sat, 28 Feb 2026 22:44:49 +0800, Lv Zheng <lv.zheng@linux.spacemit.com> wrote:
>> Adds device tree bindings for SpacemiT T100 specific features by
>> introducing spacemit,t100 compatible. T100 contains distributed IOATCs,
>> each of which exposes pmiv interrupt.
>>
>> Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
>> Signed-off-by: Jingyu Li <joey.li@spacemit.com>
> 
> Patch content here is fine, but the signoff chain on this patch is not
> right. What did Jingyu do? You're author and submitter so either Jingyu
> did nothing and should be removed, or is a co-developer which requires
> attribution via the co-developed-by tag. If the latter, their signoff
> should be before yours (the submitter is always last).
> 
> pw-bot: changes-requested

She is responsible for the common HPM part, and I just gave my comments 
to help to improve the quality of that implementation.
I was just focusing on enabling and maintaining the T100 specific features.

Our patches will go each other's local repository, leaving such tracks. 
That means the patch from me is Reviewed-and-tested-by her.
And I'm responsible for sending the whole patchset for upstreaming.

Cheers,
Lv

> 
> Cheers,
> Conor.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
