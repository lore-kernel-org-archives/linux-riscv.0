Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1D3EE6B74
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 03:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NmKGDeoK1CsWn/rEdFzDzphHyL9g/h6RkohMA5AQl8Y=; b=BumiJzes+mIFbe
	mXjXqEkRUvMDFv+Blbw7LL4s+B6/ZYn2Xs+aXNPkd/1pjmaxc7lSPdLVfH8ejotUSDEDdqQ4tYbrT
	uFWLkOeodXTz+OVwtIh58RCcu7yV7ZqBr9ERpI3yjPg6cwOU/lUL6/Ux2rNJOmxNJV2zlN3PCXKpL
	oZpR3hAOhVTg4mF7C3jnc/2ekzfKbK/z0X3KH0pW0wVThDaFsOm4VB5LS41kOCLz/eyy79sIw0CMG
	SViyrH7v/WM3aRZMx5AtPkdK0EQ8tOAL9JDF4v4WPqYpsjuac5QBKF/3dw6vOkpHs9bKXIgbth65x
	KaRzZPKeHyTEX2aNqdtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voZPM-0000000C63o-1ljy;
	Sat, 07 Feb 2026 03:54:56 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voZPG-0000000C62z-2QmF
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 03:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770436453;
	bh=J5ZSE1GIfBN++3YlnIcdmmjUUZ0MWIkwDcWOs6Ub3KE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=OC0itHKeB4x9KLeiW7f1wKuggjOlM66yn6HlR2BpJOxaaGbTeLpPsyAxVOirUdMBw
	 AobJ2/yuh0rwCT2ZzDRVvYsQJNaYF36Y+qIIpTNfFt8Mn4Ubdtgscpajbu9iAfVeFF
	 /MITwCyF32HQ+A6s3tI1eBzlLZ4JuWMxFwcpcBL4=
X-QQ-mid: zesmtpip4t1770436447t033e705e
X-QQ-Originating-IP: InkARYtvTyo7byCMx1GYV0Tt+ZJOew4mqa1Uytomdj4=
Received: from [IPV6:2409:8a1e:3015:50f0:29fb: ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Feb 2026 11:54:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13533491367221936113
Message-ID: <30C7AD351DB55276+a8b03dac-c5af-4034-8631-ac1c352a469f@linux.spacemit.com>
Date: Sat, 7 Feb 2026 11:54:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] iommu/riscv: Add HPM support for RISC-V IOMMU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Jingyu Li <joey.li@spacemit.com>, iommu@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <DACC013F46A47459+cover.1770281596.git.lv.zheng@linux.spacemit.com>
 <2ca4a5c1-9267-4177-b339-e1ac28812c46@kernel.org>
Content-Language: en-US
From: Lv Zheng <lv.zheng@linux.spacemit.com>
In-Reply-To: <2ca4a5c1-9267-4177-b339-e1ac28812c46@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: NYn//GmO2LAjm1xUTRKQcHMV0bFBBVdZlg7LZHW5hdHohI6EkdPMbTXX
	hrs/7rb6N1cws7pz3N7WCTbVswMygFmf5jOUoGYmbtvJUItYNfTknQerS0N5n21LGc8r5zg
	GwxdEoYpR+bjkxAFLjDlBhWBY9MMezaE+4IB8SK5PpSRhCbvmFbyTTxA14GBGtIjj2n6sLq
	GxP5LWDwm3ZvozI2Mgo2QsA5ug2dlGPHxUroMaHj/M2UH1NXelX3XwPv/QyIz0C3+IS7oo5
	xurOHqArUSOOadwT50jFtomP+MgSie4xe+yLPhdKHMYtbLxYOwrw0y8pjA/uCaXZpJl9STI
	RXsK5PQnXBcwsFv7/uUJeCQm5nXrEremoiRenZxhtFSTzSUt8Q9R5rXnpY3ybYOM4szl2p+
	Q6SU9J/u6/vP6jdwLyXuBpF9WOaNish277MtLjVStZqAubkYOwlZn+OL7LVCQtZy9TmOyMk
	2qJHIch3p0FlfxKZ63Rs+BfF+DIWIM36m1PM60vggWJ+3pnWmNy3EzqXevh2pSCUqREjTUQ
	pm4I6yvHo1O1lX05lDqsWVrx56oPlSOrL1T4A/QZdEvCT+cAecqtcPrVqwsLPC4AT6HZFDO
	vUScCtNjvfBbhNbkYJA0oKQeVIVlMPlzbQYQKmOJTG1+GDWynQ4eKscWq4yMxz2ODd8n0u4
	7FPDpYJYvEBJpc3wWPor/w8x3DvnwXYDU9AzIEptbALG3G5QXqcLFRdgTOsstL1pxTIHmCX
	co11/0+3Q1DL+jYC2BAi1QBHZvs8cIKuiMJ6JbPxVrS+w412laqEaRha7VkZsLAzKPw0Jj/
	HnXg3B6Txotux3IL1XlieVnyOl9a/Zk9SJLA/RczLSI5g2jTjUkY7FtmrWCcaYTaN0qDT3X
	SVjhUKFJogCfvX7kVnuP4Z8lTZXLmgsVZhTEEE1hxAv1NHge1XUO+f2iq0laxX1Gg3tgG7z
	LKzc2aWudA+gUmqX1/rPdk36CQg5UUFksdrGVJcY916iqW3+vP85WWgtfJaZiD9ih29a2Cx
	lAVK7JQWC3Ton9gn5+Q/WAZXqOd+3SID9N+00/MJyOZdCmVop7
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_195451_572234_DE561322 
X-CRM114-Status: GOOD (  13.86  )
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

On 2/6/2026 6:46 PM, Krzysztof Kozlowski wrote:
> On 05/02/2026 10:09, Lv Zheng wrote:
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
>>   1. Refactor using vendor specific compatible.
>>   2. Implement vendor events with a userspace identifier.
>> v4
> 
> And now also v4 is in the same thread? This is total mess!
> 
> How tools are supposed to handle this?

I'm using the tools I was using several years ago.

It's able to handle revisions using one single thread if a "msgid" is
provided via its command line:

# Prepare --in-reply-to argument of git-format-patch
if [ "x$1" != "x" -a "x$1" != "xnone" ]; then
         echo "Found Message-Id: <$msgid>."
         GFPFLAGS="$GFPFLAGS --in-reply-to=$msgid"
fi

And I have a configuration file in my $HOME collecting all patchsets'
first msgid:

         if [ "x$require_msgid" = "xno" ]; then
                 fatal "Invalid Message-Id: $1 shouldn't be specified 
for v${MAJOR}.${MINOR}."
         fi
         msgid=`cat $MSGIDS | grep $1 | cut -f2`
         if [ "x$msgid" = "x" ]; then
                 fatal "Invalid Message-Id: cannot find $1 in $MSGIDS."
         fi

That's the old fashion I was doing upstream related work, as some online
tools was able to update patchsets automatically if the thread top
matched and then showed the new revision up in their web portal.

Will stop using such single thread style as what you suggested.

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
