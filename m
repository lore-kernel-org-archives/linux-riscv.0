Return-Path: <SRS0=cwjh=T7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB57C04AB6
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 31 May 2019 05:22:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62FE426406
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 31 May 2019 05:22:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hz4JaYhG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WZsYambQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62FE426406
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zBOofJAkbIhVFWmY4Ke6jqzGBBxbUBjLzUyNiPtSsEY=; b=hz4JaYhGGFyabj
	gFc1uda8rwYK9m3QiwZ21bXVsH9elvBL498xH57USKQPlT2MCJv632LlBOIYueMoM/lwhU00MJq7d
	JALwwwn19qwUB2/0D5lijYjVRN2Um2S+PpB9xeSar8ZliFkH+bElyBRut7NgYzH30BDGM/3kB1vJr
	GSKpzO1XFSPqsAKLi2D7ZHqIOJ0Sug2Lh9R73zqL+o7MI/7BAvTxJ3s8kQShqWOsaEmiYNY7XM0tC
	AHh5EDLkQh1/OhOCJVtaw8fV0/shsTa6N8kcK1AwGmn5ze7ZVrZLMu4rAsrlISs1DZv74EH3M91Kw
	dw7VyH/gHy7x7lPc6Y0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWZzN-0000X7-Kp; Fri, 31 May 2019 05:22:01 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWZzK-0000Wl-Fx
 for linux-riscv@lists.infradead.org; Fri, 31 May 2019 05:22:00 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4V5LmBK017777;
 Fri, 31 May 2019 00:21:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1559280108;
 bh=wEaJhMMubWFkpq8YfzgR85AF7zR7zSlj50b9HPP93n0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=WZsYambQ3Wns9Fyeq1XUDuXwId7RYlTK7wN7jTga3/YcBXkiBjKqxLAOumbeIs5h8
 7e+P2PekR1//92dJ9N7evrTBdh1J+Tuy+A84ZguFucTRViwGgogvzdCNSgl7ftefl3
 lo0G4+GOIF8vKQoWrgdcP22RM+eNC4jAPTBaz1NQ=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4V5LmMA069860
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 31 May 2019 00:21:48 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 31
 May 2019 00:21:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 31 May 2019 00:21:47 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4V5Lgln015283;
 Fri, 31 May 2019 00:21:43 -0500
Subject: Re: [PATCH] PCI: endpoint: Add DMA to Linux PCI EP Framework
To: Vinod Koul <vkoul@kernel.org>
References: <1558650258-15050-1-git-send-email-alan.mikhak@sifive.com>
 <305100E33629484CBB767107E4246BBB0A6FAFFD@DE02WEMBXB.internal.synopsys.com>
 <CABEDWGxsQ9NXrN7W_8HVrXQBb9HiBd+d1dNfv+cXmoBpXQnLwA@mail.gmail.com>
 <305100E33629484CBB767107E4246BBB0A6FC308@DE02WEMBXB.internal.synopsys.com>
 <CABEDWGxL-WYz1BY7yXJ6eKULgVtKeo67XhgHZjvtm5Ka5foKiA@mail.gmail.com>
 <192e3a19-8b69-dfaf-aa5c-45c7087548cc@ti.com>
 <20190531050727.GO15118@vkoul-mobl>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <d2d8a904-d796-f9f2-8f4a-61e857355a4f@ti.com>
Date: Fri, 31 May 2019 10:50:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190531050727.GO15118@vkoul-mobl>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190530_222158_616768_8FB41453 
X-CRM114-Status: GOOD (  18.99  )
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
Cc: "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 "palmer@sifive.com" <palmer@sifive.com>, "kjlu@umn.edu" <kjlu@umn.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 Alan Mikhak <alan.mikhak@sifive.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "wen.yang99@zte.com.cn" <wen.yang99@zte.com.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Vinod,

On 31/05/19 10:37 AM, Vinod Koul wrote:
> Hi Kishon,
> 
> On 30-05-19, 11:16, Kishon Vijay Abraham I wrote:
>> +Vinod Koul
>>
>> Hi,
>>
>> On 30/05/19 4:07 AM, Alan Mikhak wrote:
>>> On Mon, May 27, 2019 at 2:09 AM Gustavo Pimentel
>>> <Gustavo.Pimentel@synopsys.com> wrote:
>>>>
>>>> On Fri, May 24, 2019 at 20:42:43, Alan Mikhak <alan.mikhak@sifive.com>
>>>> wrote:
>>>>
>>>> Hi Alan,
>>>>
>>>>> On Fri, May 24, 2019 at 1:59 AM Gustavo Pimentel
>>>>> <Gustavo.Pimentel@synopsys.com> wrote:
>>>>>>
>>>>>> Hi Alan,
>>>>>>
>>>>>> This patch implementation is very HW implementation dependent and
>>>>>> requires the DMA to exposed through PCIe BARs, which aren't always the
>>>>>> case. Besides, you are defining some control bits on
>>>>>> include/linux/pci-epc.h that may not have any meaning to other types of
>>>>>> DMA.
>>>>>>
>>>>>> I don't think this was what Kishon had in mind when he developed the
>>>>>> pcitest, but let see what Kishon was to say about it.
>>>>>>
>>>>>> I've developed a DMA driver for DWC PCI using Linux Kernel DMAengine API
>>>>>> and which I submitted some days ago.
>>>>>> By having a DMA driver which implemented using DMAengine API, means the
>>>>>> pcitest can use the DMAengine client API, which will be completely
>>>>>> generic to any other DMA implementation.
>>
>> right, my initial thought process was to use only dmaengine APIs in
>> pci-epf-test so that the system DMA or DMA within the PCIe controller can be
>> used transparently. But can we register DMA within the PCIe controller to the
>> DMA subsystem? AFAIK only system DMA should register with the DMA subsystem.
>> (ADMA in SDHCI doesn't use dmaengine). Vinod Koul can confirm.
> 
> So would this DMA be dedicated for PCI and all PCI devices on the bus?

Yes, this DMA will be used only by PCI ($patch is w.r.t PCIe device mode. So
all endpoint functions both physical and virtual functions will use the DMA in
the controller).
> If so I do not see a reason why this cannot be using dmaengine. The use

Thanks for clarifying. I was under the impression any DMA within a peripheral
controller shouldn't use DMAengine.
> case would be memcpy for DMA right or mem to device (vice versa) transfers?

The device is memory mapped so it would be only memcopy.
> 
> Btw many driver in sdhci do use dmaengine APIs and yes we are missing
> support in framework than individual drivers

I think dmaengine APIs is used only when the platform uses system DMA and not
ADMA within the SDHCI controller. IOW there is no dma_async_device_register()
to register ADMA in SDHCI with DMA subsystem.

Thanks
Kishon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
