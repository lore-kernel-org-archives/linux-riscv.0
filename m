Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3216CECD9B0
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 01:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40RoWlYd4NlRcDl6LXy/oFADdw83kYsxOW/8HuczQtQ=; b=l4oS5czX4w+zVI
	i9kyNwb8AUU1X7ODNx5B80FS6iOLtyepWe73I14w3wtpw1dPXVj7CQe3RnjOibxt4E0h/u6u7UdMu
	VQLwcY8WV8HpiULQbTjWA0wCPjM1kHVRj8Q2NGBrtN4KTtaSGhYenanh+uG8q9AjFRu9l3Sx/NL2H
	MqapmiKW9RMmp9d2BgBRwCXVewnX2XBVdrMNGQowX02KRosYlcdxT8+bBs4+3T3hNOPt2yXvRJh5i
	X+CtwZkOwvtTZSyIXSaiOErdTDLZtxOs3b/CEghTQs5TMUvT5YAbnqw63/PiCSR5qDi2DsLehVxP+
	vGHl+NmlHvWdPn99lKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voAmu-0000000AidB-1R3t;
	Fri, 06 Feb 2026 01:37:36 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voAmr-0000000AicD-2rOM
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 01:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770341830;
	bh=u66lDzn3W+s9lLSBjCrJQz3iX/gWLeceviCCn8xnhQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=o7FOpGgvbX0PXyChaED76RZzeiQ+/8zcCtx7IfhWZhp6y77Ilgp4g/zIEItxdwDmU
	 czrJOl+77F6gCpZQYY1TgYg60PZDfPuteadl32mITjL2sFEtPghYMGtwke7UYMKBNJ
	 pwX5TOjpZ9Vr3iPxRvZntppt49IB7Nsv4EyietG4=
X-QQ-mid: zesmtpsz7t1770341822t19d1032a
X-QQ-Originating-IP: iIAeuwskNV4ojOYuV3Noln3ZDwxd2URhMw6INSSJBQ8=
Received: from [10.3.91.191] ( [101.70.125.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Feb 2026 09:36:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18048956717111257135
Message-ID: <6139284F36497822+1b579565-0f44-46b8-aa46-00258b40e0e4@linux.spacemit.com>
Date: Fri, 6 Feb 2026 09:36:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] iommu/riscv: Fix WSI mode IRQ number handling
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>,
 iommu@lists.linux.dev, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 devicetree@vger.kernel.org
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <F77F878EF7C59BD3+a9078997d97dacd05d1271a5390dfd08a402b325.1770195980.git.lv.zheng@linux.spacemit.com>
 <2ueryrki7uzpjn6rbqz7scy46sjhw76jjilddz2naslz3eyfdp@ycwf42eaw5yy>
 <927D288E956D61AD+d1488c72-afff-49d2-bb6b-5ef5ea08b627@linux.spacemit.com>
 <qlnntgtoaatvdpyvusjhe2y3hickopigwf3sobtnsfwpfhwjiu@zi4auf65eepa>
Content-Language: en-US
From: Lv Zheng <lv.zheng@linux.spacemit.com>
In-Reply-To: <qlnntgtoaatvdpyvusjhe2y3hickopigwf3sobtnsfwpfhwjiu@zi4auf65eepa>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MFZ9kh0LMtuH0AU9pAK9/PazOypgIKoQg76nLcge23gYkiXS8HdxXEce
	xTe3LiYcAFT9/BtDhydb42SrASmK84yFYudwg0EftdMHoO1+xfE2+Qd+NwpOysRJzkGUgNK
	DgrFwkzTC+Z5hnW2yRrA4vNmQ2WRJ4VlmjUUXlatjnOHHkG6ol9Fmlo5yGcRb/vvRxbNH+F
	nzoCsbbv2lnEvLMDUwr1luDeDmlMThOjBreO6zriEX2cwFaL0OBqsYRMnkB8qvKRnzkN37+
	FOCYXjeX+8EBYutxLfIl1H7OYOgVM+9nTMzXn6B9Z6QhKO/OfVDvTWbFz2ELqUaTQjJy1XD
	Ok92U/YCMZLcBMKxBuVgsZWpDOL3O4hEKQKAnHYr0mncz1nqezJ735nMOHiv9odNYM3G6Kg
	MhxwXqG8XG7mM7sfj8jBzOafce4WkQKhKuqTe2rBi+3hHAD1OAVzdrourSs+u1kVp/aIGjv
	IReVBIUD575mw3J1zpjePh6i2feHzzhxDJZxnYlJD01X0CXr1VwkMQ17RK3QoL3Zp3bYJvl
	M9rF0XRAdz3ub/JTb2sHoYyugjGcLqpGF/dkGl49nrFoZyJ39lC9HgREwiDUhDm9bY8fYC4
	oPVA2d46sHgMTutJkJI06TdOpri6Vztwjz1sflTrYIzGmcphgzyUlZufCo2MEoskXQQRrz4
	YshVPH3eMvPyXs13PkaTVfYAvIVSO/AFkgWLJAIwQg8d5CcS7CirnnQHFOsS6C36zdZpzEz
	KevYGs1tgRC5TRbzIheyf1sEitY02OIe08z2cTDzUqHKns3rarqmrbzYsOFvL7XoeeqtgLl
	u6vl3Tj/yyqwyVGt5iP59rNGU0hExuos43NcclhqrebJhSj9U+8WxKw5gx3o38ufF+UFcR1
	qBgCdxXzSX/4sFJc5Ci2+we+i+4kNNTtmvm1UBfUtDqUvTB01V0tDFmDpu//JqcI9UsR9v9
	iIUKvjaJTTkcKRdPu/urRLGoi00jp4xPzg+TTzkvI9mZf6rWTBbqQOF6Qo9CgT379OQUcl6
	8oq/Utqo9w71/prjkm
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_173734_463756_D5352D05 
X-CRM114-Status: GOOD (  21.33  )
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

On 2/5/2026 11:04 PM, Andrew Jones wrote:
> On Thu, Feb 05, 2026 at 11:52:57AM +0800, Lv Zheng wrote:
>> On 2/5/2026 1:20 AM, Andrew Jones wrote:
>>> On Wed, Feb 04, 2026 at 05:08:52PM +0800, Lv Zheng wrote:
> ...
>>>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>>>> index d9429097a2b5..26630979473b 100644
>>>> --- a/drivers/iommu/riscv/iommu.c
>>>> +++ b/drivers/iommu/riscv/iommu.c
>>>> @@ -1593,11 +1593,26 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
>>>>    		       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3 % iommu->irqs_count);
>>>>    	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_ICVEC, iommu->icvec);
>>>>    	iommu->icvec = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_ICVEC);
>>>> -	if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
>>>> -		    FIELD_GET(RISCV_IOMMU_ICVEC_FIV, iommu->icvec)),
>>>> -		max(FIELD_GET(RISCV_IOMMU_ICVEC_PIV, iommu->icvec),
>>>> -		    FIELD_GET(RISCV_IOMMU_ICVEC_PMIV, iommu->icvec))) >= iommu->irqs_count)
>>>> -		return -EINVAL;
>>>> +	/*
>>>> +	 * In WSI mode, ICVEC may read as zero. Only validate if using MSI.
>>>> +	 * Check if FCTL.WSI is set to determine interrupt mode.
>>>> +	 */
>>>> +	if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {
>>>
>>> The behavior of ICVEC does not depend on FCTL.WSI
>>>
>>>> +		if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
>>>> +			    FIELD_GET(RISCV_IOMMU_ICVEC_FIV, iommu->icvec)),
>>>> +			max(FIELD_GET(RISCV_IOMMU_ICVEC_PIV, iommu->icvec),
>>>> +			    FIELD_GET(RISCV_IOMMU_ICVEC_PMIV, iommu->icvec))) >= iommu->irqs_count)
>>>> +			return -EINVAL;
>>>> +	} else {
>>>> +		/*
>>>> +		 * WSI mode: ICVEC is not used. Set to identity mapping for
>>>> +		 * riscv_iommu_queue_vec() to work correctly.
>>>> +		 */
>>>> +		iommu->icvec = FIELD_PREP(RISCV_IOMMU_ICVEC_CIV, 0) |
>>>> +			       FIELD_PREP(RISCV_IOMMU_ICVEC_FIV, 1) |
>>>> +			       FIELD_PREP(RISCV_IOMMU_ICVEC_PIV, 2) |
>>>> +			       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3);
>>>
>>> It's certainly not correct to set iommu->icvec to anything that can't be
>>> written to the IOMMU's WARL ICVEC fields and read back again.
>>
>> Indeed.
>> It looks I can keep icvec returned for WSI and keeps the write-and-read
>> check logic only for MSI.
>>
> 
> You shouldn't need to touch this code at all. I don't see anything to fix
> wrt the spec. As I said, if iommu->irqs_count is known to be greater than
> one but you're getting zero back from ICVEC even after writing 0xffff to
> it first, then ICVEC on your IOMMU is broken. Once you've confirmed that,
> then the best you can do is add some workaround for your specific IOMMU
> here.
> 
> Thanks,
> drew
> 

This patch is an approach trying to give PMIV a standalone wired IRQ#
which is required by pre-silicon spacemit T100 RTLs when it is
configured to report both MSI/WSI caps. However there is no such real
product on the market, I just drop it it in the next version.

Thanks,
Lv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
