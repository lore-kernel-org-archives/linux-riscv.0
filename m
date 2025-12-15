Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE81D5B175
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 15:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScH+CUqHJ8zNR7V0z2AOXz23yHtnj1rdCuj+Z5k7aMI=; b=xt6talq6FJN5tmJO4db9qCTSFP
	yCU48WjAxgFfsGbfVTJvSvxDrwF9b9LiKK8v+ln4ZHMTe5+7t27rPu4KIVXZamTsLYkYsU1xzDs+o
	B4/UnJXAFaW/uZbSXXVdjR+Y/42KsHOhpkx1dAJfJZJFBh2yE7SI+H2YDNBQ8wjRxPGwXMWvESBVV
	NxqZAwSU2pcO2Kc9E5Ia+OxC2lnx8w5MgEg7QfHkiK+KZ/Ophd56zFJh/NmcKAx3RnW1euIfo4xx8
	Y2mMjLBIMMRdGf2fyryY+E1CFmBtxXUAO4CWYX6Xyxaq2qQv2lpyJtcaY7AEtIxzhB9rEENqhq8NW
	lbw8u7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVA4P-00000003pyq-0YBw;
	Mon, 15 Dec 2025 15:01:05 +0000
Received: from cross.elm.relay.mailchannels.net ([23.83.212.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVA4K-00000003pxq-0PyJ
	for linux-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 15:01:04 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id DE581222509;
	Mon, 15 Dec 2025 15:00:56 +0000 (UTC)
Received: from fr-int-smtpout24.hostinger.io (100-109-2-65.trex-nlb.outbound.svc.cluster.local [100.109.2.65])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3DFC6222301;
	Mon, 15 Dec 2025 15:00:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765810856;
	b=A0cX/+1tXrlSr2ElemWFGBvfEz98FdtQJtiEt2GtfSifA6zO+E3ZUoplQXoI+UnonhYu6G
	SqgM5RevHRo+1b1DzBV1W+nuDKevJ2zGHQYN85pIoobwgQT+WzWPqkCx70pdnJBOr+UT99
	ulW1E8JHzFI6GCzWbCsoJdnGcl00wIplPimpc0+WX1Ht7lW24PnBqsSCp2/4LXjCEOLoKe
	uRw2DGMl9l1m4L04nipzZByrfWKab+8Cr5A4SHQ02nRc0g+jT47MviQqSUQqJ7xjz2Q2B/
	Lfkg6Q810vWHUkg2DMvLh0haJQSTfw0HXYsE+WDaY0fSjI7tFOipd+RJ7CC4dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765810856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=VX54jGJhAp746Z3Nrw5llPoeuIEu/ZFyKQgJmCUpMRA=;
	b=2eAX22oAVeZL5uI3F19p6JBKM8ea4HYcI6QShirqjGCShDNaW9D7wt3Fb6gTO8OqDpSjeu
	lWjvZwJ7TU8cZ+jjye6HWY2qJEb+k5kcKLBk/wr7k1sgEOd/HvNJYA8MmVfGhUhuxQjB1a
	h4ph/9QOQAMdXwNAdO4n2213T2gBiQ5FUaZoOr2T4Tjk4lB7D5BMH8GchrUpE2qR7dUvEL
	PClllyA0Kb1eRMnNdH8N/lOvSErdJjdWF9h+bhKSV/EuI/ZqUZZL/lOOfHrjrDrOiPh5/p
	pcVYkNQ/d/8ordRRijw0kYsQDBPGuK98RrujxJhs15UirkbLzmaoBgD5teD4SQ==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-h5lxv;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Reaction-Imminent: 7395bcc65682b0dc_1765810856674_2300230336
X-MC-Loop-Signature: 1765810856674:2219938387
X-MC-Ingress-Time: 1765810856674
Received: from fr-int-smtpout24.hostinger.io (fr-int-smtpout24.hostinger.io
 [148.222.54.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.2.65 (trex/7.1.3);
	Mon, 15 Dec 2025 15:00:56 +0000
Received: from [IPV6:2001:861:4450:d360:6864:9326:2fe9:fe2] (unknown [IPv6:2001:861:4450:d360:6864:9326:2fe9:fe2])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dVNY05gtKz1y1d;
	Mon, 15 Dec 2025 15:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765810853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VX54jGJhAp746Z3Nrw5llPoeuIEu/ZFyKQgJmCUpMRA=;
	b=HHUjiuhhNQTmbq2DBQv4OMR/+yB7CNQ83Ik1r+nuof6XrCMuIMvUI+wL7hBz9N6Z2WTDXP
	1v9gXbSO7udNOFSgYmDrTr3GEkIpaO7qRgNpxzGuKsjFaa6KSw2HnO0I5ohjNlGyJ6IYA4
	fASlOi9t/I4b41uWxKb1klc7da/xm2ViGTqPEe5JYlwGAyzL5SNLwP6I2mAzksJ06R6JyN
	tOcWqnE0aLt5ZkM8FwbCsKxZWL+CEmsnVCbOW02BphBHIOQdoXCglRD9F9S3aBHgfx9vtY
	8gDfBxGInTOxc6A/ujJ9XM5HYkAv4IR3O/7b+WvtFeg/VUWq/6fzkQHzVOfq2g==
Message-ID: <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
To: Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@gentoo.org>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <aUAF4iNjuP5AWJaf@pie>
Date: Mon, 15 Dec 2025 15:00:52 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=GbNFnhXL c=1 sm=1 tr=0 ts=694022a5 a=w3a6Hyo9sJ87gWsMspevqA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=SAbbqCSLk9pJ1dRvB6kA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfFR5ZTrYsnaoVfFrnnokoA6EtN2YWmtTZiL7zIY7hohUBC0vuazeCMZZakxyFtPOK4YkeJBGv4JRVzjcE/ESmlmQoXxoRZoX+hqJ3jB7Ds5rLajKBMzj zbycn/uOfyKC/ocaY1r7D4MeRpYqu++lHfCxX/pveoIojEjwLOtWkjuTr1XG8vwS0m7IIh7nAHc+0HEXEg92p25xKiRJWrF5P4z3O8wtFPk43AzGYuUlOe2o peEklKw8OqABsuJVmXtngQ0OhSJKWN9Tn3VA/BanGgTcXlSAlL5UkIjoIWqqRxIl2doLLP7YeJpHkVwc249WtHLWa8/kdDYMrqCb+37fV+By1DRQFGuneA6f MRQhDqpgpss78mkRxRzxx4+nYDfFqQqzdXwdtRn27ABBrTa0ZLNb0A48fjKm+TlDr+jUq6gOa+5FsNauMEtP4hcr/+yod0Pp4uWnliJYF7+e5zagHltSSK7N 4UnrWXq4GRS3LLKknsPO+BDyCIFADOPvANZr0TydgZIW4jArSSCGTkSVQY8=
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_070100_385795_11D3C0A3 
X-CRM114-Status: GOOD (  11.31  )
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

Hi Yao

Thanks for your helpful questions!

On 12/15/25 13:58, Yao Zi wrote:
> On Mon, Dec 15, 2025 at 10:10:14AM +0000, Michael Opdenacker wrote:
>> The OrangePi RV2 board exposes i2c2 and i2c8 buses
>> from the Spacemit K1 SoC.
>>
>> This declares devices present on such buses, in particular
>> the at24 eeprom to store MAC addresses and the regulators
>> attached to the PMIC on i2c8.
> This series is named as "Attempt to enable MMC on SpacemiT K1 boards",
> what's the relationship between MMC and PMIC/I2C bus? You didn't make
> use of any regulators in the second patch, either (which seems wrong to
> me).

I expected that declaring the regulators under the PMIC on i2c8 was 
enough to enable them, but I'm happy to be corrected.

>
> vmmc-supply specifies the card's power supply. And if you want to enable
> SDR modes which mandate 1.8v IO level, vqmmc-supply is also necessary
> for switching between 1.8v and 3.3v.


I was thinking to get started without the SDR modes first, to make sure 
basic operation works first. Would that work?

Would you have board examples to recommend, with an MMC controller 
operating in a way similar to the one on SpacemiT K1?
Thanks again
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
