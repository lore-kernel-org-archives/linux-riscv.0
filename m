Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F34CD8C8E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 07:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfUGq1rLfRzCDRpMRdd+DRMtMdTi6IwVWZRExHv5gzo=; b=jCD/12gjIQgoJ8
	yp13wJwrI9kaOJ3G8YEW+YwlVS9pvSEG2I9KHvPBNoCBDkVW0hPQ15quCf4edILn04D357JQckLbQ
	EzfB7UpF47gzt4GRu4499z3i4/Ia75OB6G/HCghhoiH3KF2TwUskGY9VPWldnHW42w0+2gEw1XGG5
	gVrMiajkJyPyQx0lM1H/A+8N4/Kgk2Ng4HuJYP0J0+B9SR9tdpB2j8r9kJsyaIsAKwYN0XKlceYS6
	wUhN+chVU0uhkd4RsFG3qsDq8HHmRxgk34X4dM0MtxM3Few7rstQ11Mx1gQ3PJYgLLPZNQF24BT/c
	ekNAm4naMq7FxdxadAVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUPU-00000002yhY-3OGP;
	Mon, 08 Jun 2026 07:28:36 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUPO-00000002yg6-43PB
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 07:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1780903696;
	bh=YRxEs7wKiqRBJ3TzHh8zfI1hjIUUljuWBmJPiK37GXo=;
	h=Message-ID:Date:MIME-Version:To:Subject:From;
	b=mYxCjkQsrCuylMwnRPE6DnQAzgGPka0SKkmKjNODdCnW2ECWAw4YLnESMtNhHRvWr
	 bjg8ZWXFvyJ+5h8tRITWOT+KdWz+CsdGHWdaQTNjwLSKp9ET9mL+vYyc9S/SUVcLXG
	 XDd0A1N/YQaM6ZbODjyJ9csbFsuw/zjRoLfLUUms=
X-QQ-mid: esmtpgz15t1780903694t5b45206f
X-QQ-Originating-IP: AaZNpuSktHh8DwCVhQ4nK9VMvK/D4vmaEGq3cCOt62g=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Jun 2026 15:28:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4561199684526648779
EX-QQ-RecipientCnt: 30
Message-ID: <5C63EC7A33D2DA48+643f07be-c1e1-4527-9d4a-17faf646a8f5@linux.spacemit.com>
Date: Mon, 8 Jun 2026 15:28:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: liangzhen@linux.spacemit.com
Cc: adrian.hunter@intel.com, alexander.shishkin@linux.intel.com,
 andrew.jones@oss.qualcomm.com, anup.patel@oss.qualcomm.com,
 anup@brainfault.org, atish.patra@linux.dev, conor+dt@kernel.org,
 coresight@lists.linaro.org, gregkh@linuxfoundation.org, irogers@google.com,
 jolsa@kernel.org, kan.liang@linux.intel.com, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 mark.rutland@arm.com, mayuresh.chitale@oss.qualcomm.com, mchitale@gmail.com,
 mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com,
 peterz@infradead.org, pjw@kernel.org, robh@kernel.org,
 sunilvl@oss.qualcomm.com, zhuangqiubin@linux.spacemit.com,
 mike.leach@linaro.org, james.clark@linaro.org, Bo Gan <ganboing@gmail.com>
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
Subject: Re: [RFC PATCH 00/12] Add Linux RISC-V trace support via CoreSight
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NPR7uEA6bBhoVW0BXuFQUHFAdw6nqbRdyxSlSO1Eh3eDdWrfTm4Kq2iG
	5L3vAk8bNya94gPSGIqq3YcbaG4VDCznXq1Df2zAE+qELaDKXgQNFY+U0dqzeAJpuIY+hzi
	B9cwgIuGWH59nYdtlVxetOAHJDud1VWGNREkXuPB0SA+z7pQ/e6txixwcE7OrVo6bLvA6Wb
	EoUcm0NK6kA0PGCJJHkl63Coh1s3gqTLC/RIgtOaRy0rb3x5R/OG59ULtE/LHXFQjwb0p7m
	fsav1VHtkrooUHHRUPM0g1MIkLSfxHDOWm2iEZTK6is/ZjBgv9Shdyny5l5KXRMTJsoSJ7n
	/C11TvScKKwYItWG3ytmaF6Z8h8tG1YD0YYhefE67RKrpXeNYuAXZLJDh+a/QGLG3hYVG03
	fzlKpcyCjU1RHEc6pQbaqvJVJjuMUkPJwU/z2BSF9iIkqsgoga6FcKKwEucNEkaXo6xEZ98
	/nc80mKVR4SEGBJhM04ZZVRvqc6rXpUeeqhMBqXbPjFccmjb8kjlZZzUih2xXUQwiogMIRd
	MRO0AFUEw8YIiMurPtb9Rzq0RV9E3MDP+kasKwhTv4j9oMuy3wHvNkLNOYmwyEGEahPvMBV
	9n3Bt8MGgkjEug/GyaDO96AOPTnA6Nvjr/GlseBexnpfuL/GQdpt/dT6wzAA1BSsGHI8Bp6
	3KUwitwgGfIcgWDp8V5oR2VQBcZDQllGTbS150dIyOMstCleiz0NVBekArE4rtsCbj9ba7I
	oV9PS21OjnM5TulRt/hW1lpbEkpv8ocOj+qN4Hoc9BJosFlArj2fMZlesfoBT2TTfbUvLdL
	JFMkHTWRb9lYB7KDtaGd68dsb18rd2bWA2c87o27/m4pg3bRKwOPwfGMmnTVbNE1cv0hfCF
	gCX1/O9ByNFP4q9pToNJvJpb9ZwMTC8jbgbhSpn/3+4BlINbSu7GZYlFSCS3tCKyOjWMnXp
	w22GrJn+A0ZIKaq7L+sf56ykH2+ll4bCgmatrt6v/M1ohIB4UEawOjIuBEojKvr5ldV+fPS
	7/8wx4djrtgX8s+KHVcAw3bEJFjSU=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_002831_973720_A83F7289 
X-CRM114-Status: UNSURE (   3.17  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksIGFsbApJIHBsYW4gdG8gZXh0cmFjdGluZyBDb3JlU2lnaHQncyBhcmNoaXRlY3R1cmUtaW5k
ZXBlbmRlbnQgZnJhbWV3b3JrIGNvZGUKaW50byBhIHNoYXJlZCBsYXllciAoZHJpdmVycy9od3Ry
YWNpbmcvdHJhY2UtY29tbW9uLykgdG8gc3VwcG9ydCBtdWx0aXBsZQp0cmFjZSBpbXBsZW1lbnRh
dGlvbnMgKEFSTSBDb3JlU2lnaHQsIFJJU0MtViB0cmFjZSwgZXRjLikuCgrCoCAjIyBQcm9wb3Nl
ZCBTdHJ1Y3R1cmUKCsKgIGRyaXZlcnMvaHd0cmFjaW5nLwrCoCDilJzilIDilIAgdHJhY2UtY29t
bW9uL8KgIMKgIMKgIMKgIMKgICMgTmV3OiBHZW5lcmljIGZyYW1ld29yayBsYXllcgrCoCDilILC
oCDCoOKUnOKUgOKUgCB0cmFjZS1jb3JlLmPCoCDCoCDCoCDCoCMgRGV2aWNlIHJlZywgcGF0aCBi
dWlsZGluZy9lbmFibGUvZGlzYWJsZQrCoCDilILCoCDCoOKUnOKUgOKUgCB0cmFjZS1jb3JlLmjC
oCDCoCDCoCDCoCMgUHVibGljIGludGVyZmFjZXMKwqAg4pSCwqAgwqDilJTilIDilIAgTWFrZWZp
bGUvS2NvbmZpZyAoQ09ORklHX1RSQUNFX0ZSQU1FV09SSykKwqAg4pSCCsKgIOKUnOKUgOKUgCBj
b3Jlc2lnaHQvwqAgwqAgwqAgwqAgwqAgwqAgwqAjIE1vZGlmaWVkOiBBUk0tc3BlY2lmaWMgb25s
eQrCoCDilILCoCDCoOKUnOKUgOKUgCBjb3Jlc2lnaHQtY29yZS5jwqAgwqAjIEFSTSBDVEksIGNs
YWltL2Rpc2NsYWltLCBtb2R1bGUgaW5pdArCoCDilILCoCDCoOKUnOKUgOKUgCBNYWtlZmlsZS9L
Y29uZmlnwqAgwqAjIHNlbGVjdCBUUkFDRV9GUkFNRVdPUksKwqAg4pSCwqAgwqDilJTilIDilIAg
W2V4aXN0aW5nIEFSTSBkcml2ZXJzXQrCoCDilIIKwqAg4pSU4pSA4pSAIHJ2dHJhY2UvwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAjIE5ldzogUklTQy1WIHRyYWNlCsKgIMKgIMKgIOKUnOKUgOKUgCBb
UklTQy1WIGNvbXBvbmVudHNdCsKgIMKgIMKgIOKUlOKUgOKUgCBNYWtlZmlsZS9LY29uZmlnwqAg
wqAjIHNlbGVjdCBUUkFDRV9GUkFNRVdPUksKCklzIHRoaXMgYXJjaGl0ZWN0dXJhbCBkaXJlY3Rp
b24gYWNjZXB0YWJsZT8gQW55IGNvbW1lbnRzIG9yIHN1Z2dlc3Rpb25zIGFyZSB3ZWxjb21lLgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
