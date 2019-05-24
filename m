Return-Path: <SRS0=JLSQ=TY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEB7C072B5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 May 2019 08:46:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D955C217D7
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 May 2019 08:46:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qy4jc9Sy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Bfhp6Htr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D955C217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WwBCAPPWS0qQbDbEvpvgtiBgJvt99/OulJ3p8hLLYlE=; b=qy4jc9Syv5Cz0GrGPGFjI3GSBQ
	pXlvnlPA7xNu+Cge/AgJWkKZjiAPlDChVDo7CBmeDHY3hwPWGbYfyOcVtLGYkJM5JEAk9PzCzsu0s
	OwgO1Qoso0vTevaXPeISTZptHoMftU2bXl804u+Y/FQWcJh0Z8waxsQk2Z61fP0JojFasZBmJz294
	tBAowLfBtOetPTJ24k3LP5lvV2f1WAPfqP8jBjj5lmgMQZqxupkaUu/XIAIfThzjI1dSBlzxsb9MR
	gGULGj0S5zGXI3TSfYXnkuwEga4jMMjlQ7rEBq4xFljvnsj+8Ws5JGnKc4EUiT84LUeeY4tQC3nED
	UMZFa0AQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hU5q9-0007XG-Ef; Fri, 24 May 2019 08:46:13 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hU5q7-0007Ws-7Y
 for linux-riscv@lists.infradead.org; Fri, 24 May 2019 08:46:12 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4O8k6S3092885;
 Fri, 24 May 2019 03:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1558687566;
 bh=DXFEDPWPKDOFxRB075nEECWtEkWPXsJvcN4FB3Z5q1Y=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=Bfhp6HtrbU4jNqmpwALOr7PuPYMbsCKxQAY9SrbT2FRyn33xyzinHbS+fW9MZ9YYx
 woEVabr2VXFv/C4NiUl2k5nSdN1vJQHlaR/2WZbchu/o3/4R98whqTp16nuMVOj57N
 rLPDj86zqVw1fiKqm8tqzOgD8n/QDDsr/Gophvi8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4O8k6Gj087569
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 24 May 2019 03:46:06 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 24
 May 2019 03:46:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 24 May 2019 03:46:05 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4O8k1C2076108;
 Fri, 24 May 2019 03:46:02 -0500
Subject: Re: [PATCH v2] PCI: endpoint: Allocate enough space for fixed size BAR
To: Alan Mikhak <alan.mikhak@sifive.com>, <linux-pci@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lorenzo.pieralisi@arm.com>,
 <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@sifive.com>, Paul
 Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, <gustavo.pimentel@synopsys.com>,
 <wen.yang99@zte.com.cn>, <kjlu@umn.edu>
References: <1558648079-13893-1-git-send-email-alan.mikhak@sifive.com>
 <CABEDWGxMXg7RAgrUL-7W6vgC0BpCj9ys+i7myjxdBgn3vn_P6Q@mail.gmail.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <a08ce87a-d515-b1c3-a903-6777e18c87ae@ti.com>
Date: Fri, 24 May 2019 14:14:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABEDWGxMXg7RAgrUL-7W6vgC0BpCj9ys+i7myjxdBgn3vn_P6Q@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_014611_350907_910B268A 
X-CRM114-Status: GOOD (  14.39  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 24/05/19 5:26 AM, Alan Mikhak wrote:
> +Bjorn Helgaas, +Gustavo Pimentel, +Wen Yang, +Kangjie Lu
> 
> On Thu, May 23, 2019 at 2:48 PM Alan Mikhak <alan.mikhak@sifive.com> wrote:
>>
>> PCI endpoint test function code should honor the .bar_fixed_size parameter
>> from underlying endpoint controller drivers or results may be unexpected.
>>
>> In pci_epf_test_alloc_space(), check if BAR being used for test register
>> space is a fixed size BAR. If so, allocate the required fixed size.
>>
>> Signed-off-by: Alan Mikhak <alan.mikhak@sifive.com>

Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
>> ---
>>  drivers/pci/endpoint/functions/pci-epf-test.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
>> index 27806987e93b..7d41e6684b87 100644
>> --- a/drivers/pci/endpoint/functions/pci-epf-test.c
>> +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
>> @@ -434,10 +434,16 @@ static int pci_epf_test_alloc_space(struct pci_epf *epf)
>>         int bar;
>>         enum pci_barno test_reg_bar = epf_test->test_reg_bar;
>>         const struct pci_epc_features *epc_features;
>> +       size_t test_reg_size;
>>
>>         epc_features = epf_test->epc_features;
>>
>> -       base = pci_epf_alloc_space(epf, sizeof(struct pci_epf_test_reg),
>> +       if (epc_features->bar_fixed_size[test_reg_bar])
>> +               test_reg_size = bar_size[test_reg_bar];
>> +       else
>> +               test_reg_size = sizeof(struct pci_epf_test_reg);
>> +
>> +       base = pci_epf_alloc_space(epf, test_reg_size,
>>                                    test_reg_bar, epc_features->align);
>>         if (!base) {
>>                 dev_err(dev, "Failed to allocated register space\n");
>> --
>> 2.7.4
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
