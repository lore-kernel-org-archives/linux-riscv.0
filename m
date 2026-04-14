Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB283ED7B82
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 08:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6XnJej2MhsBl20AtQ6uv7fV+0U7Dvzd71f2ynn6veU=; b=x92qEF+BM79Fkx
	2uzbhARCeza7wBaOhEUu/WW5De1+g/qQKhYfQBgAgUQxoz4IjIIsys6hqcgwROV29fTEVS9SuTLi8
	ctgdgHnqdD3zpxwnN2aFXapwCFAuJRP5gYMWXrr74gYMqkSPGB6s2LehCZnBLVSQzzVGoA3OtDuBT
	D9+AwLplAT+tafYxtYv2FD3HM8W9SsYwHMSVD2bBQUJCdHc+OKH3VQey5DKiYtJnfzIoR1cz5hWdn
	1zUBy01j01Wj+PeWNEG95p5vF+YiUyEAjzKbim8OyIpxYHSTR0ss7hrvwlq4jMTClyFMDUjR4PhAv
	HWKHhvAYh15hsMiZdbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCYq6-0000000Gwx3-2HSm;
	Tue, 14 Apr 2026 08:09:42 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCYq3-0000000Gww4-0Fcr
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 08:09:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776154107;
	bh=BTYplK9GGhoinNQT9VhXjQoQvc5SlJd4W5ADYeW0UxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=cyc3r4bcBFLNnK8nzJi916xXH1BCnMHuc7I/p38a4yixnEvcP8g2xzYaRgM1scPzA
	 iouFR8fwK9bMgLpErcfbvCXb6S/vAIvSEe7tQRF6YBa+ysWRpSIi6nKnTPLgbj2TqV
	 pngh3qJbL52NTHIH9qtVbap5pOtotp5bSCXxIg7M=
X-QQ-mid: zesmtpgz1t1776154097t3073e212
X-QQ-Originating-IP: w0Lo6ucD/mHRTXX0uvaSazr2ceTlCNmmrUi+mGoBsD0=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 16:08:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15117195102044116077
EX-QQ-RecipientCnt: 27
Message-ID: <DB9B936FB50060B1+19a080df-69bf-47a7-ac9e-16dee5e966a6@linux.spacemit.com>
Date: Tue, 14 Apr 2026 16:08:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/12] Add Linux RISC-V trace support via CoreSight
To: Jie Gan <jie.gan@oss.qualcomm.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, palmer@dabbelt.com, pjw@kernel.org,
 gregkh@linuxfoundation.org, alexander.shishkin@linux.intel.com,
 irogers@google.com
Cc: coresight@lists.linaro.org, peterz@infradead.org, mingo@redhat.com,
 namhyung@kernel.org, mark.rutland@arm.com, jolsa@kernel.org,
 adrian.hunter@intel.com, kan.liang@linux.intel.com, mchitale@gmail.com,
 anup@brainfault.org, atish.patra@linux.dev, andrew.jones@oss.qualcomm.com,
 sunilvl@oss.qualcomm.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, anup.patel@oss.qualcomm.com,
 mayuresh.chitale@oss.qualcomm.com, zhuangqiubin@linux.spacemit.com
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
 <d7c5e64b-967c-46a0-875a-43bc592e1b69@oss.qualcomm.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <d7c5e64b-967c-46a0-875a-43bc592e1b69@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MQPu5pFEJFN43z07ajjwzgqGeYy7mXiGElK4wQ18RuT09CB559Ys/oBA
	Mjo1pxIGZC9iURczPeB4j9D3gZ4UqPok3QxdqNECWYJVURLlfTtx1Ox2S2SqrRe00xOwI8w
	MgmwFH/nmnjR30AqwztoWzjM0CTcWHT3ntvohzBekaerp+IY2DOdbFRTbgOxkA/ATpJMzXd
	fatQNaV64jzoX3jtwD+jn1t0HG5ZhuN5oOQi61SsJrBdV6oDs/PWg8WnTlAuo0HbN4cv8tE
	Z3xJnyvcSjlEDdsTmoCF7DokYMI0Dy8NJjX6DYR1PW2gWUoS+vsIPgIW9m05okHTLyyGuO+
	IqLs20f0pQeVxfWWqCkgoOePUXId702yw5uKj3ojqR+VnXkgAN8dSdgH/2l2eavW7pCRCee
	EiBSnQUZ6LFR3dJXlYtziZlvdOLKmIft0vVv55UY2iPPgsck6lqw2nR0z33Yg2oEq7nou1W
	v4N4BpXNX2dA/ucPA2NhuKAHO2bajObeRYK1R/mGH35n5XPEBGPFPU8SO1SKUpqTtAegIDp
	siIGx8ifbfuxUbwgiHuFVmc+jgDzpIdnW+6jt/yeeg3+uM/Ts8ZzjrkX9TkqvdxfOZE+U6y
	hs4jzZpJjksWy5hmKcnA9ykP2Cl3vopOBwA0xNt/5q0NCghutRdY1OfUftUeWJB/wE2imdl
	9vsfIWhmLrLYmnSE6F3P0uSFasuEGTZn5BuFLtmZp6GHG39F/VtuaxXnYt9w1fY7A9NdrcX
	s+LMTLTOkOKifuntdsgDDWAf3N0O8pqeD/ARcAoa+BgdKa3Yvs+dZFWTTj0bzjZowCWr7zV
	eOcBuZp/T8VCDbDdPA2drNKRTywMg3vlzx0+kZ9QYPxmadVJJAk5+4BqdhJffRQ7ocNiy+l
	HgUkwCwy+OJwh3gGV6yTmJBpeo6rN4DnzKbvb2ZBoG5sn2kJIpXvlE3CMZ8zSp2l6KpSvBn
	4GxHZPxUQDClbSdYXkBdd+5OcUjQy93nwkr7oALqmlZstbORNZemT716OR3Cwgg0fE4ouCA
	zg9alSrUzmXmmLvW4c/RdTQAnymaIJQhstUmTCdYuZNgaVJwBg
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_010940_020157_1A0F9D81 
X-CRM114-Status: UNSURE (   4.93  )
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

Ck9uIDQvMTQvMjAyNiAxMjoxNSBQTSwgSmllIEdhbiB3cm90ZToKPgo+IEkgZG9udCB0aGluayB5
b3UgaGF2ZSBsb29wZWQgcmVsZXZhbnQgbWFpbnRhaW5lcnMgYW5kIHJldmlld2VycyBmb3IgdGhl
IENvcmVzaWdodCBzdWJzeXN0ZW0uCj4KPiBUaGFua3MsCj4gSmllwqAKCkkgd2lsbCBzZW5kIGl0
IHRvIGFsbCByZWxldmFudCBtYWludGFpbmVycyBhbmQgcmV2aWV3ZXJzIGZvciB0aGUgQ29yZXNp
Z2h0IHN1YnN5c3RlbSBpbiBuZXh0IHJldmlzaW9uLgoKVGhhbmtzLApaYW5lCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
