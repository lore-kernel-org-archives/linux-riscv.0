Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722FF10ED65C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 12:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cu3W10P27p/Ktkjv4Dyvvt8r9UnqyXkKqRi4Z1yTgY=; b=CSRL1kyspDrOp5
	WAb9FtCxJWgb03Z79WCgDgd+1eX1SShUs6DPgV/J9/wpt6HUh2vIafwtixNcc1zYLLEhwguecGiml
	th+K9cSzMMBwx1ONuFrbu8gUnHrym/ZRGaZMNiAg8a7ILjNUhJ1B3ekLlZpOJhAvAVx+yfHagFbEZ
	BYrWJZJy5OR2X3MzYZvrP+JXFkEGd9hJyiUpDv4zdwpNmX7DU7SzI2g7hTGSxQtEzAuao+eXNEm2j
	RkRW5ezdaYkDajdW5Lkp4cDl+OK5ovX4IDDcudmqC9SUwk89clUSknmgAkH/2QCphkz6LvUWEqCVq
	POxdQ8SDo0mfSy9eW7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w666I-00000007L15-0EDq;
	Fri, 27 Mar 2026 12:15:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w666F-00000007L0m-1W8l
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Mar 2026 12:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Gt0hsKHO3Cgzjjf5L93b3hjhxYMQSZOOI4z05CSOlYI=; b=R+0jFk//w16IdW/KJtNKhzV+47
	YTL1g9g2tT+QP/JbZAhdBkrpoejYAuqdyPTduILO2JMETbIqcVvtdFUtvnby3Wu9v7Am59fGREnzk
	CCv5hXI+RYA/ywz4X+FtzQem+9RBWkdz0eRUv3dNXh/kCXnjdnOWJ2XEg22K2M0Y6bA247sHD1C1s
	AUz8p1vz8u8vH1yXmOZSTxQ74TJ1zXdoF2Gv3PNzSG829jpLef7tK+NMSwDCpNHehYhraWhfSmzXD
	+OHma03EWufCzy7+MR4foKIWK9/1HK7oM1czrIrI5drAtBRi1pw067TuXgfICSEUi/iO7VdFhxKE9
	bPeeBn3A==;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w666B-0000000ANBn-1CEP
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 12:15:37 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260327121528euoutp0136fadf5217e3ff37f25f8391ffa42c8d~gscidJa1G1808018080euoutp016
	for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 12:15:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260327121528euoutp0136fadf5217e3ff37f25f8391ffa42c8d~gscidJa1G1808018080euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774613728;
	bh=Gt0hsKHO3Cgzjjf5L93b3hjhxYMQSZOOI4z05CSOlYI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=bzAePsecg6ZhZQ+sNDeta9zk76+8Il3P2leuoF2O9uZh3mYVsBbtkmLkclN/Qh8R6
	 B4FRIPBbtlYHHgUJRbgRXS2+VS28bF7SRqA2TZJjGSY+MUP80AzxLzd7+dvGVeL8WJ
	 D9ED3fzOKikwhGmGFHRtpT1v5Kxh7xLokYF0Iwkc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260327121528eucas1p2e1c10492efc27790045dce75e5285311~gsciM5inD2033920339eucas1p2B;
	Fri, 27 Mar 2026 12:15:28 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260327121527eusmtip248d4a0b5562c627beb58483a0db4afc0~gschWzMbh0852608526eusmtip2W;
	Fri, 27 Mar 2026 12:15:27 +0000 (GMT)
Message-ID: <a548b0ca-b8f7-4e9e-8ad7-0465e463ab05@samsung.com>
Date: Fri, 27 Mar 2026 13:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] firmware: thead: Fix buffer overflow and use
 standard endian macros
To: Drew Fustini <fustini@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Dan Carpenter
	<dan.carpenter@linaro.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <acWFgZ8swY60lfDV@x1>
X-CMS-MailID: 20260327121528eucas1p2e1c10492efc27790045dce75e5285311
X-Msg-Generator: CA
X-RootMTR: 20250403131056eucas1p16076c6e4dce1f1217dc327250c419e37
X-EPHeader: CA
X-CMS-RootMailID: 20250403131056eucas1p16076c6e4dce1f1217dc327250c419e37
References: <CGME20250403131056eucas1p16076c6e4dce1f1217dc327250c419e37@eucas1p1.samsung.com>
	<20250403131051.1097423-1-m.wilczynski@samsung.com> <acWFgZ8swY60lfDV@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_121535_725891_99EFCEA6 
X-CRM114-Status: GOOD (  11.87  )
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



On 3/26/26 20:14, Drew Fustini wrote:
> On Thu, Apr 03, 2025 at 03:10:51PM +0200, Michal Wilczynski wrote:
>> Addresses two issues in the TH1520 AON firmware protocol driver:
>>
>> 1. Fix a potential buffer overflow where the code used unsafe pointer
>>    arithmetic to access the 'mode' field through the 'resource' pointer
>>    with an offset. This was flagged by Smatch static checker as:
>>    "buffer overflow 'data' 2 <= 3"
>>
>> 2. Replace custom RPC_SET_BE* and RPC_GET_BE* macros with standard
>>    kernel endianness conversion macros (cpu_to_be16, etc.) for better
>>    portability and maintainability.
>>
>> The functionality was re-tested with the GPU power-up sequence,
>> confirming the GPU powers up correctly and the driver probes
>> successfully.
>>
>> [   12.702370] powervr ffef400000.gpu: [drm] loaded firmware
>> powervr/rogue_36.52.104.182_v1.fw
>> [   12.711043] powervr ffef400000.gpu: [drm] FW version v1.0 (build
>> 6645434 OS)
>> [   12.719787] [drm] Initialized powervr 1.0.0 for ffef400000.gpu on
>> minor 0
>>
>> Fixes: e4b3cbd840e5 ("firmware: thead: Add AON firmware protocol driver")
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/all/17a0ccce-060b-4b9d-a3c4-8d5d5823b1c9@stanley.mountain/
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> 
> Acked-by: Drew Fustini <fustini@kernel.org>
> 
> Is Ulf the person that would take this fix?
> 
> Thanks,
> Drew
> 

Hi,
I think it would be great if Ulf could take the patch.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
