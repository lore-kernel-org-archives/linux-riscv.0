Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85443606A32C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 02:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aSOFmz6E;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=dG7Zq9oZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zBxMNX53STRribnGhNGvPBJafrThOkrqFViU9eBnBoU=; b=aSOFmz6EmH9Jd4J+7PTSgYDpLX
	rJHOcra+Hn2NyjR22SAo0J4h0pmoP8XeaP1bm0voJJJmNwl3Q02vOr5rfrffQzZMMsXC5OaGP4i+M
	WyLRZ8N0Kons6ZI2bTH5Lh2ImqSzGCQjzN6q+7mQ27bpfST0+9GR+OTiF7858Oy9J1B2T8kUTQbJ8
	MstU1lxR3aawGVe8U2w2iW+93CSRA5FXxAk5ifkqo/Veo2WXujBw55L2kjib4VCDLrrLGPsj207Ph
	9DLVZHczzpbMVR2wV/VdaH/774HEXZj9e6HpXt3WeoP8RTCjx89FOliYAIt3KLKfcwXCsuiYzZjYK
	LyP16Ybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnbr-00000007dTJ-3uVA;
	Thu, 05 Nov 2026 02:53:51 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnbl-00000007dPH-0UVo
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 02:53:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793847195;
	bh=makHNIiYLvU4q0uL7GjudiJJsJnjWba7FoFQaU2CjTA=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=dG7Zq9oZA0ud7MBYBH+jyazqhIvywclr/H2PHUIWbLqQtgC8ZftuNbA5f/kRf8fQG
	 viEqytWRUhYALIER5ShHmLYL8H71SakkLFi++21zm+bo4NWPdIfr30Bt163GFGsr0V
	 paN26fNUWLJLvDZByfK8p/ZLddlEsMip5GoCE0JI=
X-QQ-mid: esmtpsz18t1793847187t057bf204
X-QQ-Originating-IP: izYglXd86ZAHYwcrBOKCmCQvXih/anefE6LCbO6xayY=
Received: from localhost ( [8.218.183.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 10:53:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13090883998075243027
EX-QQ-RecipientCnt: 12
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 05 Nov 2026 10:53:05 +0800
Message-Id: <DMMXR8IGD585.1QXMWPOMI19UL@linux.spacemit.com>
From: "Encrow Thorne" <encrow.thorne@linux.spacemit.com>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Encrow Thorne"
 <encrow.thorne@linux.spacemit.com>, "Lorenzo Pieralisi"
 <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Yixun
 Lan" <dlan@kernel.org>
Cc: <linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: spacemit: Ignore link partner PERST on K1
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20260924-spacemit-k1-pcie-fix-v1-1-002b5c1ba9fc@linux.spacemit.com> <DLN6TV32A766.2BWYLKQW9ZYG5@linux.spacemit.com>
In-Reply-To: <DLN6TV32A766.2BWYLKQW9ZYG5@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OVxgrqsLORmRqorTkuJKvGn06tCDXz/QWhYmxmB9XDSmlKYv+Ro0IKB6
	HZpp3NjZy7ys73+jQrpPyCL/vA4h/LuBy7/fvZlNqNGquqG76Sjicf5JwMMyaedwuD/wHG2
	/F7blEh6v+bBoZpqmvJlaSbFsz5qUOxherz10lPaYNfyW4wUuhR5jqyy7vhUl96CtjCTzYt
	tS8vAYAF8QS2B0iR7D4isZAZp7G3o8vLgxe8VutItplbcGjySNj910CkSUcL1j8nvdRJCRG
	D7x125ElwMe9QegU0++f9QXZ1M3YZMSaJ4FoJHTrYCcMy7/3uClUt9ao0wp/0Y0qMsKLsKM
	CvEIuq5fVi0jbFVI53sN+Cl3g1Un3urFE9X+/cqmB6dgjwEyKGpuSaGIpUW950ic+VZE3kA
	VcKXt9tb6XrCdad7q/KlMWIPJ+V+263StKLiFJerXmQ5fqZlqSfDOz119lrPpHvNtRl9hus
	mSY1rrKmHv3030SGBvFt5LE1QSbOXdITCRx2diC2NHde7Cqjh3UWqy80e3JaqjYLUbM0Iyk
	Gsf1uIOOUZmzMah2P8S7JJaMqy7v6VqFlR0RH5VyrbZgoIF8Sl7gEqtorEC9oLi0lksI0x8
	sHqCV4nnC/jgI6GAym6TATUGWojJp6dj3rN4nXISfsb41ERYhOTigV4xaR6KV6qqDiXp699
	OEUnty3DS4H30X22KOhjxMeTsiTQzPhi0ZZ562Kcqvr2ZX8KKIQMnfP7d6fX2VTW9lBqX1x
	yw4JTz4vaCy/FpUznLTsxwx/od1ClDNv2dzEdUaJt6E+QKbHK4xF+CAdzUwP+FshddH+x/8
	icjJesqvjvMxwG3xVl1DpPBYYM3Ss2OuX+IG0+bEoGe9vXzkL7WubK5VKCWj6+0P1VYgbib
	uhesW+qBN7VI7D7sCo+H/Bjwyp1oUNGaKc75lJpRs2w1k5YYC3BxIteGfJz877UyJEJh1uc
	kJ0ZbYU0adrs9OGbvqdGSxBdFdSXn/BJPpheKDKWzfRrb7X2xaHnMJx26O9aKgXvLX6xE9G
	IWa8dcs/MTzh4fkCxhDSS4V0ano8n7wLN2IZJfJg==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_185345_528583_840CE549 
X-CRM114-Status: UNSURE (   6.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu Sep 24, 2026 at 10:23 AM CST, Troy Mitchell wrote:
> On Thu Sep 24, 2026 at 10:04 AM +08, Encrow Thorne wrote:
>> The K1 PCIe controller and PHY are affected by the PERST signal from
>> the link partner during initialization. With some devices connected,
>> this can prevent host initialization from progressing and cause the
>> system to hang while probing the PCIe controller.
>>
>> Set PCIE_IGNORE_PERSTN before accessing the DBI registers. When set,
>> this bit makes both the PCIe controller and PHY ignore the PERST
>> signal from the link partner.
>>
>> This allows host initialization to complete without being affected by
>> the link partner's PERST state.
>>
>> Signed-off-by: Encrow Thorne <encrow.thorne@linux.spacemit.com>
> Fix tag and reported-by tag [1]?
>
> Link: https://lore.kernel.org/all/20260825052249.66921-1-bbanelli@gmail.com/ [1]

Thanks, I will add it in the next version.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
