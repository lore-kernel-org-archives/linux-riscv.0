Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80331EE6B70
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 03:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7Xqm/yqy40fS4Om8Gbp2BjR6eMNGxSYtRy2FSHIA8A=; b=Tqfs4XfQ4DX71p
	P6A+Z4qgT47CCvU7R6JnvFCnZ9Okm0xHseelkgNZV0doZza3SVo2e/qlFQPE2k8SXt1OBghmnVcCh
	sv/Lf3+XMwV704G2Fw1SlMIvVC7IFesy08vM7vJFBfJA3/tL6jPuiCh1TnMhpKyn9HQs6UWg/VZ4J
	ZkOsQZ/QpsmsxM425rXvLCfE/W6CoxFTvkqEgmIiB/U/802LIUEDjpsD3V2uIafPg6vHKRzbtWDQV
	02lsO4IheEbhD9D8ANgRPNRNKcZl71gK0NUgJb1TlwrkK7N7tkbSLLppej33cmdPJUmQJq83NoTaG
	7I4z5qC8aTdCUqhrQjwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voZCl-0000000C5WO-0usa;
	Sat, 07 Feb 2026 03:41:55 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voZCh-0000000C5Ve-216g
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 03:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770435672;
	bh=iGGdXTkXE6iLSkpjLauckmQd6kdrYyp6XyWgqtLiuXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ilx+NB2Ctd64IhEkBmabs9vCn7jxR/2yB4dG49Kp0t6l1uHqeWBUDCFEsUg5oND1q
	 Pt0WX21N4lcaz3eMe9Pn71y9sKbnZwdLv/+2g3jgsstd6pOrInMPCa0BqBD3NlRJlB
	 fUcB1xbqempE8Bt6XwUixk+Z+aPN8z4M5j1XlI88=
X-QQ-mid: zesmtpip4t1770435665td6aedc24
X-QQ-Originating-IP: nptEyNvWLFJDvHVJLzL8/o3VAW+0403HpSPcPAlvcls=
Received: from [IPV6:2409:8a1e:3015:50f0:29fb: ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Feb 2026 11:41:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3470539334872340848
Message-ID: <605D8D5AE96AEF8F+31d65ad3-3956-49ae-8d9f-589747a5086c@linux.spacemit.com>
Date: Sat, 7 Feb 2026 11:41:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] iommu/riscv: Add HPM support for RISC-V IOMMU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Jingyu Li <joey.li@spacemit.com>, Zhijian Chen <zhijian@spacemit.com>,
 iommu@lists.linux.dev, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 devicetree@vger.kernel.org
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <F9748E3984D2A6F9+cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <a9d9f43a-edf3-419b-bdf7-dbd6bf9e978f@kernel.org>
Content-Language: en-US
From: Lv Zheng <lv.zheng@linux.spacemit.com>
In-Reply-To: <a9d9f43a-edf3-419b-bdf7-dbd6bf9e978f@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: NUTz4BkILuKLi/q/CGWmd+WuVu2I1QFgAtIGv0spdb41cjP4s86/8ggY
	zTzLtoGTtLMbLcCH+vdEe5ym6la2GVy5ayXqbJUVAO0+0nfB358xwXVezNWmyf6ijuvdpax
	h/mQFwFQuRMgMaFDUQGkTs+t3u0D478M+mLmfF9I4IZH6EdhSEuAsZkk/6Jbw77o35rR10c
	5ah+JzQvz+6iPI9u7fOXSy1PLtxARJCXbQ96U2ia5kmQgtfdhsAlwqJfwtKodr+GnvY18xK
	Pq2nrkTMtyLL3DP0VnDaEpUyI9tegZextVD6i1AFYUd7y6kyfQ5L3dlGFfp/EV4rsx93w01
	y7rR1/gjKYa879PaA+57BfllYl1G4R+TwO2s4UAbD1gD/eCYufkjBoXI92zlSSRtGtgkJhS
	HSrwwK1XOl2agtGzTrc32LXRdWfiKJBmPAgH77any61Qht9YvneWZ0PwKv8JQcf9msm6Cye
	WE36J6ShrtcICgyQ850v7cgxwElHREx3lXooIf7fr/oszB3D67+1OPKWWt0l/l4YzKXVQ/8
	9lomUl81CsXfsmjiT809l+FjNfGPNdxxrsdyNqYA6aKUCmFJEaKiSYj/bbG7cD+gOAthsqj
	C1C4BSWW+JG11L67D9ZsREYnetl7Z/z+/N4YsnDzdCqV4OnW7kCzp+lPJBf4U/KkiAr1GmH
	A2JfVhmMP4jg2aP987V2xL/JV6LMFNZNxiPzcQSKD5pTnk8sHLD4M4e7rwvcU0464+95dgY
	LS8MMPeyEM+9KGsZE3qUe9ji4dsoqqKpTJYJnC2uttzxXMP6H7la6fSrApGLrUd299Xkz0b
	U0jT0Nvt+2Dn0Yi6hv0i+ye2T1JFgSO+qyIBCKlJpSUC4/6kKZO2a8YGD7Hj+HQPZ4BadyX
	04VaIGmjQ0eF10s9bYl+KEd6uVER6Rpqu5e9I505RSd4U+nBwYw34JNkt3XBafMs2+7gXv3
	W0NZssOcpwhwCvq6yisJIcTD1CIHCaJwYcrc2oacyl0wwxp0fRmwS8eLRgfTRjnAocHw60b
	xx+GxOwoLHkHRkF9/nAT4tiRggS1M1SBBwoiLkiWMB4/LfzwpA
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_194152_309624_DBEAF3F0 
X-CRM114-Status: UNSURE (   8.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/6/2026 6:44 PM, Krzysztof Kozlowski wrote:
> On 04/02/2026 10:08, Lv Zheng wrote:
>> Includes HPM support for RISC-V IOMMU. The HPM hardware mechanism can be
>> found in the recent announced SpacemiT SoCs (K3, V100), where T100
>> (SpacemiT distributed IOMMU) is shipped.
>>
>> Revisions:
>> v1
>>   Initial release.
>> v2 (sent as v1.1)
>>   Split and cleanup DT-bindings.
>> v3
>>   Refactor using vendor specific compatible.
>>
> 
> 
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

Got it.
I'm still using an old fashioned upstream way to collect all revisions
into one thread. Will align to the preferred style.

Thanks,
Lv

> 
> Best regards,
> Krzysztof
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
