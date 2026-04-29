Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344F7FF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 07:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6Z64KKmh2p26i36H8a2fWZu3AGNRRhwM2T47BEk7T8=; b=zpJYKat2ormwHm
	9peTgy1WNh476PRgkHvViLWmFfNV3nH6kTec4rc4YyiVYxn5+mxwAIg5YHACCY2xdnVj7XrpNj697
	5sSaAQzFSr906T5H4kJJVIJV0Nk2YeJPv6JuKOHd2NsQlr7JcNbILBMPRA9l6DFVamKXUn7fuihKc
	if4NzrjISyHqkykE/MJRNojvKesJ8Ia0ixJnrMB53ZPLCyKSzxf1/BBscZ1oI845sOOukiu0n/qIE
	v2C6SWbR0rvFsrftQxZzWLoise2SCN9A7ebqWlUT3/6v2tVFtuzGDMYroRVaixpZ2TgTIpTmzlr92
	uJe+C5KmKWM1K+LfVplA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHznW-00000003CR8-1sgd;
	Wed, 29 Apr 2026 07:57:30 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHznQ-00000003COa-2vDU
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 07:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777449417;
	bh=BJ49DOwjJR+WskeXhiKnY23XN8YKPK13S13MmrbKwMI=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=DlfHhjgIlHENkjf5MIfspnSmMsP+C0g9jIGEq8vq0kPNG55bSBLlbOVVwqeXJ3X57
	 bplq4cKIl3cbkuH1/g+ns4KDv5AaL+/F9+aI/vPzjc4ssbQ03A3s5ns56rGnXlmI6k
	 7NLXsHMluwHg8QjAUfwR77uiYT+nORHXMINPPHSY=
X-QQ-mid: esmtpgz16t1777449409tac12cdb6
X-QQ-Originating-IP: DkWHvUEwJTe71CZ7AGA68Q4lc/p1h5yY4D/tlreyZvA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 15:56:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 729058513551534686
EX-QQ-RecipientCnt: 15
Mime-Version: 1.0
Date: Wed, 29 Apr 2026 15:56:47 +0800
Message-Id: <DI5H899DW2NZ.P89S1L5KSOO9@linux.spacemit.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Yixun Lan"
 <dlan@kernel.org>, "Jinmei Wei" <weijinmei@linux.spacemit.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/7] ASoC: spacemit: fix RX DMA params not set when TX
 is running
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Mark Brown" <broonie@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
 <20260429-k3-i2s-v1-1-2fe99db11ecb@linux.spacemit.com>
 <afFsyiSHrVBapQ9V@sirena.co.uk>
In-Reply-To: <afFsyiSHrVBapQ9V@sirena.co.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MaP/HMsInhq9J49gMW7EIxQ//3dDlCTN83yVplryoP3AVIG5jtxkkuPd
	ysMPgzFUCuktIYRg2Zv2IXL+GTMWwfYV1V/0CgL8Ovc4TraRFlVBPJn7Vpmew0gW/vXR5si
	YqTuex3Q4+K5bhjqBFcYCEXrKyBebMjWQzsa0goquWpMNJWPuJUFtCcBYJWM4IzXItg5sdw
	YnuDPGMxgMjjp3S8P0bAXYA/DN7Ye11Ut15i2pJLXpvD90AonN0TimrqLYqck+25DrJL0bP
	h3BGH1tKqmsZH7x07eg2tK30pBtRC1I1g6ZTYp4GfXaw/LHnF+78Roffc4GfZPKBBIEm9R6
	pwP5CeXiTPnTTxru+Yru2Ku2LmOc6S5knI0BBWxwP7ZVSmpc/P0ff1e4A/sEw9r7OqU/frk
	aemMUfIR0Q0Mak0qmo/Vbposm7g3GqkW4BVNgo02Pib+03K6KplTlYplg+i4ziyGdafR+Pm
	ji/+Cthu8/49M/kY52nHX02tocHk0Oe19HDde4IKnpCMZ9RjD0wfVi6eJdVbS1bzD9Pv6z1
	Vc6M1GGB+zncuuMCSCq986eT5J6aveHW+Z7dVDt5YsBIDV/JJWzc20Hvf3yDxAwvzR5OTR5
	dwFjZ+lHZs7ewyn/9RBEpY9WaD+yUmaABngdMirQWiwd1SS7xCAKLWL/TMP+p7s4KghEl79
	dIRWT1nQ7VgwWUwSjbfs0L+uLzpHeC4ZU0k9TXRlffznjsk/lMAZ/VKHrZZXS/+QkpC8gp4
	S2ASeXGGFJ4gnBYOQKupieWFwbhWcRwvAwLryrEIIpwjPZoPrfbOIYXpgAFcKvHWXlfyZu8
	AcEQCANK/tw/cfqmFlGpE4la3XFPwoXOnoDwZApM4VRTYOpIgo2nqxK+3FHukc/2zr8QHef
	4WhvbWDHUpF1M5t4lKwedq2nVUg39y7f7lpjXbH37V9ct36SDC4OssCd7AYv9mRFHEXqsMT
	TGsIf1LbQHvPpM6d0uSYmN2+Ghc0PFGQv+yCDQO1VXjibVU912aNYahFfviQ0JMdmsLoPqQ
	//U/t0YBkVneUItYjYEQRATM4xpgy4aIJ4uNjfbQo3zaXGu4kABpVBWRhHUTPDkKu4OG/gu
	oV++260x+aTS4JAd0J6Qqp+uTTl6iJxuw==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_005725_205012_D72B194B 
X-CRM114-Status: UNSURE (   6.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed Apr 29, 2026 at 10:28 AM CST, Mark Brown wrote:
> On Wed, Apr 29, 2026 at 09:38:46AM +0800, Troy Mitchell wrote:
>
>> +	val = readl(i2s->base + SSCR);
>> +	if (val & SSCR_SSE)
>> +		return 0;
>> +
>>  	val = readl(i2s->base + SSCR);
>>  	val &= ~SSCR_DW_32BYTE;
>>  	val |= data_width;
>
> Very minor optimisation but those two SSCR reads could be combined.
Thanks. I'll fix it.

                   - Troy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
