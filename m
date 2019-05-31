Return-Path: <SRS0=cwjh=T7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D96C04AB6
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 31 May 2019 04:37:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11AD724D07
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 31 May 2019 04:37:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rriBwkxv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VZQtV7CV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11AD724D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8tuQI39QZLxBJmoGrb9A0z7CjDHI0GPWQSHkQphZAjw=; b=rriBwkxvJSWV77
	0kwfK9rzkJDu19HuYYIqIM2LLJ8PS1K0iLDD615m6QkuzFCoDQa2ucqUwKKihtKNTdMbiQ5mDYN1b
	UqadsVHVNlmq9P1wOkFmj/jzO+cRZU+vbuyo+2guqoVi+1oSldbZ7ImX7STASbuoXncPD5xI1SAHx
	aDJmxeYM+/uvLdWsac6XK0QjJsppQQQSWrKmZGB0ltBXC9EbXFYbkHD/o8ax5Af9mWZWAT1GZVejj
	VX+Z7vum7y0rKQWCoRWbwDlKTpzoR1Exx4a1zOyw9to1LrdHSbVrq6mPwMiW96zFr/5XwPpt9XUR+
	nBcyPB/AWvdGO59SLK2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWZIB-0003zP-Jk; Fri, 31 May 2019 04:37:23 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWZI8-0003yw-IX
 for linux-riscv@lists.infradead.org; Fri, 31 May 2019 04:37:22 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4V4b9V1008149;
 Thu, 30 May 2019 23:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1559277429;
 bh=WmWlIV0MNd4gzmwUDi38bv+85fSO0B2C0fC2Y7XqFgQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=VZQtV7CVk40P+SqfrjetVBWMBXU6OixEQsfU3qmxzTwLFEfnjJXVl3K7F9KUyetYy
 4khN71oykyO2SuPwRhDNeTTtQbtuI/l//WYiQ+Mc2ZVetGdPd8ehUQmegEEL6GqeXk
 tzGn2V0573j25PmVruYlQHiByUK3kC7S7E5KazOI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4V4b9Ja019839
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 May 2019 23:37:09 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 30
 May 2019 23:37:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 30 May 2019 23:37:09 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4V4b4So084582;
 Thu, 30 May 2019 23:37:06 -0500
Subject: Re: [PATCH v2] PCI: endpoint: Skip odd BAR when skipping 64bit BAR
To: Alan Mikhak <alan.mikhak@sifive.com>
References: <1558648540-14239-1-git-send-email-alan.mikhak@sifive.com>
 <CABEDWGzHkt4p_byEihOAs9g97t450h9-Z0Qu2b2-O1pxCNPX+A@mail.gmail.com>
 <baa68439-f703-a453-34a2-24387bb9112d@ti.com>
 <CABEDWGyJpfX=DzBgXAGwu29rEwmY3s_P9QPC0eJOJ3KBysRWtA@mail.gmail.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <96365941-512b-dfb2-05b7-0780e8961f6c@ti.com>
Date: Fri, 31 May 2019 10:05:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABEDWGyJpfX=DzBgXAGwu29rEwmY3s_P9QPC0eJOJ3KBysRWtA@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190530_213720_714157_D4D59739 
X-CRM114-Status: GOOD (  22.66  )
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
Cc: lorenzo.pieralisi@arm.com, linux-pci@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-riscv@lists.infradead.org, gustavo.pimentel@synopsys.com,
 wen.yang99@zte.com.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Alan,

On 25/05/19 12:20 AM, Alan Mikhak wrote:
> Hi Kishon,
> 
> Yes. This change is still applicable even when the platform specifies
> that it only supports 64-bit BARs by setting the bar_fixed_64bit
> member of epc_features.
> 
> The issue being fixed is this: If the 'continue' statement is executed
> within the loop, the loop index 'bar' needs to advanced by two, not
> one, when the BAR is 64-bit. Otherwise the next loop iteration will be
> on an odd BAR which doesn't exist.

IIUC you are fixing the case where the BAR is "reserved" (specified in
epc_features) and is also a 64-bit BAR?

If 2 consecutive BARs are marked as reserved in reserved_bar of epc_features,
the result should be the same right?

Thanks
Kishon

> 
> The PCI_BASE_ADDRESS_MEM_TYPE_64 flag in epf_bar->flag reflects the
> value set by the platform in the bar_fixed_64bit member of
> epc_features.
> 
> This patch moves the checking of  PCI_BASE_ADDRESS_MEM_TYPE_64 in
> epf_bar->flags to before the 'continue' statement to advance the 'bar'
> loop index accordingly. The comment you see about 'pci_epc_set_bar()'
> preceding the moved code is the original comment and was also moved
> along with the code.
> 
> Regards,
> Alan Mikhak
> 
> On Fri, May 24, 2019 at 1:51 AM Kishon Vijay Abraham I <kishon@ti.com> wrote:
>>
>> Hi,
>>
>> On 24/05/19 5:25 AM, Alan Mikhak wrote:
>>> +Bjorn Helgaas, +Gustavo Pimentel, +Wen Yang, +Kangjie Lu
>>>
>>> On Thu, May 23, 2019 at 2:55 PM Alan Mikhak <alan.mikhak@sifive.com> wrote:
>>>>
>>>> Always skip odd bar when skipping 64bit BARs in pci_epf_test_set_bar()
>>>> and pci_epf_test_alloc_space().
>>>>
>>>> Otherwise, pci_epf_test_set_bar() will call pci_epc_set_bar() on odd loop
>>>> index when skipping reserved 64bit BAR. Moreover, pci_epf_test_alloc_space()
>>>> will call pci_epf_alloc_space() on bind for odd loop index when BAR is 64bit
>>>> but leaks on subsequent unbind by not calling pci_epf_free_space().
>>>>
>>>> Signed-off-by: Alan Mikhak <alan.mikhak@sifive.com>
>>>> Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
>>>> ---
>>>>  drivers/pci/endpoint/functions/pci-epf-test.c | 25 ++++++++++++-------------
>>>>  1 file changed, 12 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
>>>> index 27806987e93b..96156a537922 100644
>>>> --- a/drivers/pci/endpoint/functions/pci-epf-test.c
>>>> +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
>>>> @@ -389,7 +389,7 @@ static void pci_epf_test_unbind(struct pci_epf *epf)
>>>>
>>>>  static int pci_epf_test_set_bar(struct pci_epf *epf)
>>>>  {
>>>> -       int bar;
>>>> +       int bar, add;
>>>>         int ret;
>>>>         struct pci_epf_bar *epf_bar;
>>>>         struct pci_epc *epc = epf->epc;
>>>> @@ -400,8 +400,14 @@ static int pci_epf_test_set_bar(struct pci_epf *epf)
>>>>
>>>>         epc_features = epf_test->epc_features;
>>>>
>>>> -       for (bar = BAR_0; bar <= BAR_5; bar++) {
>>>> +       for (bar = BAR_0; bar <= BAR_5; bar += add) {
>>>>                 epf_bar = &epf->bar[bar];
>>>> +               /*
>>>> +                * pci_epc_set_bar() sets PCI_BASE_ADDRESS_MEM_TYPE_64
>>>> +                * if the specific implementation required a 64-bit BAR,
>>>> +                * even if we only requested a 32-bit BAR.
>>>> +                */
>>
>> set_bar shouldn't set PCI_BASE_ADDRESS_MEM_TYPE_64. If a platform supports only
>> 64-bit BAR, that should be specified in epc_features bar_fixed_64bit member.
>>
>> Thanks
>> Kishon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
