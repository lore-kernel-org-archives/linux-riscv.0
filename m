Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049C1606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 02:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zJiqm3fS;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=qYpt+RJw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ovBJYV9vtCtRv8urMNFJDyj1Nq7VGEK6QJrOanNpAo0=; b=zJiqm3fSiOmu/AySlKlmgYRoBT
	i/snLBmWs5f99R6aT8FNKxPnsKVorFIYqNBUYhLwhZjXkGbX1pSrXlR3qVM2VoUaoG/VwkI+Iuslz
	pRSAfrBx84oDXZEoM3h01h2P+d1STnYP7PEIl6d2umx/EHrKSpN+hGwKWK5OiltA80wEIKaeLGogK
	3xld0pmMiYweIfuO0IwbNhKmf/LR/9diYlZKGlD4F/sPEx9qV1qS0dxPGb0hR0dcrL4eGmFtFCF+M
	npAQQa2WKx3ddBCn/AjY/HHjUiFZ4VxQPfJSIKcd56CRiljnH8+qpyCd65daiOUD0Nu0YmEREyJGZ
	tNkAeRJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLt8F-0000000654b-3TCC;
	Wed, 28 Oct 2026 02:11:15 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLt8C-0000000652b-1iCN;
	Wed, 28 Oct 2026 02:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=dRf6oI9OjFWY1cb4Veae1z+HSgCdbz4ogw7DjgHpwGM=;
	b=qYpt+RJwRCF0KX/+Je23SE2RJtdg8sWfRlTJBYkgQjazqIosKZrPy7BmiKqm9R
	lMeSBT6H/smy5N567aYskw3soxO2lZEjFu6+3moV22mJgNt2lfVoA1/U+RSmdIP+
	eNPBKt+kFxH/QXb7xPiQMm1mkDGc1IgvPyHBAIFAj2h4o=
Message-ID: <9a761c42-9edd-48f4-b3a4-c275b603cc3e@163.com>
Date: Wed, 28 Oct 2026 10:10:33 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/16] PCI: dwc: Cache PCIe capability offset
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, jingoohan1@gmail.com, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027231534.GA520774@bhelgaas>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20261027231534.GA520774@bhelgaas>
X-CM-TRANSID: _____wD33x2jWeFqyfNqDQ--.48494S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4DJr17Xr4kCw1xZw47urg_yoW8Xr4kpF
	Wjgrs2yF4kXrn2vanF93Wj93W7AF9Iy3y3CanxG34avr90vF4IgF40vrW3GF9Fyrs29r4a
	yFWjq3s8Gas8AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4UDXUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7ASSNmrhWaRq6QAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_191112_872996_4122C16C 
X-CRM114-Status: GOOD (  10.38  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/28/26 07:15, Bjorn Helgaas wrote:
> On Tue, Oct 27, 2026 at 08:28:11PM +0800, Hans Zhang wrote:
>> Hi,
>>
>> The DWC PCIe core and its platform drivers repeatedly call
>> dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to obtain the offset of the
>> PCI Express Capability structure, including in paths that run more than
>> once such as link polling, suspend/resume and interrupt handlers.
>>
>> Add a cached pcie_cap field to struct dw_pcie and a
>> dw_pcie_get_pcie_cap() helper that performs the lookup on first use and
>> caches the result, then convert the core and the 14 platform drivers
>> that use PCI_CAP_ID_EXP.
>>
>> After this series, dw_pcie_find_capability(..., PCI_CAP_ID_EXP) no
>> longer appears in drivers/pci/controller/dwc/ outside of the helper
>> itself.
>> ...
> 
>> base-commit: 4352b8aee98005853aa63f57d6377282de17a33f
> 
> This does indeed apply cleanly on 4352b8aee980 ("Merge tag
> 'i3c/for-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux"),
> but that's pretty old and not really useful any more.
> 
> PCI topic branches are typically based on -rc1, but of course v7.4-rc1
> hasn't been tagged.  Until it is, you can use pci/main as a good base.
> It's currently 17bb0e2f6c80 ("Merge tag 'pci-v7.4-changes' of
> git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci"), so
> drivers/pci/ in v7.4-rc1 will be pretty close to that.

Hello Bjorn,

Will rebase on pci/main.

Best regards,
Hans



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
