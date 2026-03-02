Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EDDD58E46
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 01:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmfsUhmJXtCPqJ0nkLvyRX/gA+WU+BxgbvwqiDuaugI=; b=1dyrUVYl0YYAI2
	k7ItVUxAOpC1VbwPGsqQ8kzxQ0pRmrwsIfezgu2hDUscpkUJaU9TXPkfOJtSdsH2bWVa0Wo3+z9fh
	qi647AvkaRXTYzkCiMBGoWYDOOqJqb/iS7JW7jKApxcDGuboRBVwO4qZzYqZnMSJGb6N243Fp9sR0
	fLX3IkLGVar4R7UEAJVAFz+Q2CTZyBBVXcqCwLym/Yxqg54JVbJwaAz+UBcIeM1jVnsK9zlUIW1QL
	OV1AMUvwmV7gwwOQ2ltosyKj1Kg4tgEUKC/FCTOp/0cr4J3HLGYoTNkupaJqvhpXR9gnKZaBx3zCr
	nDWA1FbYfHYlhGwYjgwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsJM-0000000C4lB-37YR;
	Mon, 02 Mar 2026 01:43:04 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsJJ-0000000C4kR-1E0s
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 01:43:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1772415732;
	bh=kRDQRl2R+LRWm2HggZ4Cj1vYHy4GXuClk7m0o1am4dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=TdUlJrRe6KoS6xPDpC5kBRbyw/L7QLvDkZ3u7sTb103KPWW+/AUiz8x8gpJKwKhio
	 YjlQsoU5WuN5BNeDdoIi6Mo+ph6AI+Ub6XhcA/hWiJSgvLK9CZ9b9BTRE1KUX+y0Qo
	 QUofJeo6ADr9uUNBnRLOCXxScSqsNYBheuMm9VlY=
X-QQ-mid: zesmtpsz8t1772415723tcf6f7fb4
X-QQ-Originating-IP: w6IfNoMZkeVc0lyzIsKr9uYgMmtkBko/Qpg4ezv6sio=
Received: from [10.2.99.140] ( [116.237.103.163])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 02 Mar 2026 09:41:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4156359098192319691
Message-ID: <B8675026D2F6DF58+946ff82a-2e2e-4abb-a3c4-26fe67c43ab8@linux.spacemit.com>
Date: Mon, 2 Mar 2026 09:41:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] dt-bindings: iommu: Add spacemit/t100 features
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
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
 <CAB7A310CE95B577+5f5c0825-25dd-4035-9316-db940c00216b@linux.spacemit.com>
 <20260301-acclimate-suburb-fc46da7e0cea@spud>
Content-Language: en-US
From: Lv Zheng <lv.zheng@linux.spacemit.com>
In-Reply-To: <20260301-acclimate-suburb-fc46da7e0cea@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: NTHY/YkN8c+xXjKPQhQQ8z6eRFGBjzhi4ywoP07wySu7NtbvDlHpINhr
	Pz71ihPECjDvoVUYu4bOJShhop0qXeO/e6VWR2mxAL1OJdgg8SyQl4r89L9NDQW36IrH1tf
	9LIDObU06QeBqm2idDg5fkfpi8mcQB7amzlQ9ANNVR34Zc0UKkYDzsjfQjX1t3sakX9NMV3
	7GrTFziluMK8RXcwGIgyEOjrnhdlqLV04/4ldNa+x9XiMlRLdyBg4Vwzyt2I7PTGBBB4MLd
	FwBZMC0DWuU/7ko5WKERfFXndmdrz1ny4rIaeACrDVBG8ylt91hIr+7lEK6XkeHhn9sncJI
	PkUvLVI4qI3yi1BtHE80IJn/II1474R+ro+5hBacLeQK7n1+LErbRuoky8CXCzrA1OADUhQ
	V4hiYkwB9jiAzLTeaA78rQ+KNS2zNikOTtAAqHOv2PK24+aqs9Xmx18JwSj+V7rKIHug1CX
	ZyK0t/Z4wdhB+3uVhTzQzNo7tSfC8kmh59B79rL+ATK77H8P6kq581THWQpcQxalCj+Qq3u
	xu40K/MKx45Rumf9pe0hdNAj9Z9CZtoEx9jq42y1WE9sgyHnV6UV1DGMUrUOUXEBpgX/BZN
	CuJ23Gmw+zwNeW0nJLeGCFRDmPnlMGkM8sheofomhz//A3Wh9q4XyKPrAcXftBbrMj0ZeoS
	+LWA/0FChficDcMmeYQbO2JiVeDY8jVD1syWj0sMsrEI4o25OeQHXMSBdKfFqGCetBglK4x
	NbbvDJFwYNNduH8hINU3P5UQu9lmLpNHoAmIj9jm5WLizfBu7PpllOxeOrHFsGyK7/gfHDt
	oWnSrK3a1HpTaAy4VhEgiDqFhcZpnCEBMPRQu6aG/8PNPe2jdLJr0QXfumC37HFsVRAwI4U
	o8302hBghm68Fp6cndgbo3kTwGzraWx8VjXIn9L/Ju/vY8Pt+rKrX06qINnZmkO3tB2bVVH
	3zFj1G9owW9FlGYH120cZcBLFyhsIa1GrHCyZ8Be0Nak0vcYCRt0jOd7QuupyWMDQnMErCX
	kD0Agjj0aDeXlrE22d
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_174302_434795_E79EE4E5 
X-CRM114-Status: GOOD (  19.28  )
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

On 3/1/2026 10:01 PM, Conor Dooley wrote:
> On Sun, Mar 01, 2026 at 11:48:37AM +0800, Lv Zheng wrote:
>> On 3/1/2026 5:58 AM, Conor Dooley wrote:
>>> On Sat, 28 Feb 2026 22:44:49 +0800, Lv Zheng <lv.zheng@linux.spacemit.com> wrote:
>>>> Adds device tree bindings for SpacemiT T100 specific features by
>>>> introducing spacemit,t100 compatible. T100 contains distributed IOATCs,
>>>> each of which exposes pmiv interrupt.
>>>>
>>>> Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
>>>> Signed-off-by: Jingyu Li <joey.li@spacemit.com>
>>>
>>> Patch content here is fine, but the signoff chain on this patch is not
>>> right. What did Jingyu do? You're author and submitter so either Jingyu
>>> did nothing and should be removed, or is a co-developer which requires
>>> attribution via the co-developed-by tag. If the latter, their signoff
>>> should be before yours (the submitter is always last).
>>>
>>> pw-bot: changes-requested
>>
>> She is responsible for the common HPM part, and I just gave my comments to
>> help to improve the quality of that implementation.
>> I was just focusing on enabling and maintaining the T100 specific features.
>>
>> Our patches will go each other's local repository, leaving such tracks. That
>> means the patch from me is Reviewed-and-tested-by her.
>> And I'm responsible for sending the whole patchset for upstreaming.
> 
> Then you need to either fix your email setup (because it's not inserting
> From: Jingyu Li <joey.li@spacemit.com>) so that she is marked as the
> author or actually set her to the author in git if you haven't.
> Currently it looks like this when applied:
> commit 872978c875731be43e84bec38798cb8ecd42b7a0
> Author: Lv Zheng <lv.zheng@linux.spacemit.com>
> Date:   Sat Feb 28 22:44:49 2026 +0800
> 
>      dt-bindings: iommu: Add spacemit/t100 features
>      
>      Adds device tree bindings for SpacemiT T100 specific features by
>      introducing spacemit,t100 compatible. T100 contains distributed IOATCs,
>      each of which exposes pmiv interrupt.
>      
>      Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
>      Signed-off-by: Jingyu Li <joey.li@spacemit.com>
> 
> In both cases, you need to change the order of signoffs so that yours is
> last as the submitter.

OK.

BTW, since this version of this patch has been worked out all due your 
constructive feedback and suggestions. Now that it has functionally 
converged to what the community requested, can I add "Reviewed-by: Conor 
Dooley <conor@kernel.org>" for its next version?

Best regards,
Lv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
