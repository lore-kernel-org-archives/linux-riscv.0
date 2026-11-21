Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AA2606A338
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mbXjtMjB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=muenchen-mail.de header.i=@muenchen-mail.de header.a=rsa-sha256 header.s=r1 header.b=kpNvtQJ/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CpwuCUAZX1W21f74xAifSw/hIFTdo1BMN817k1WOagY=; b=mbXjtMjBN+CtuAJznrjVT1GphU
	3tjsq6u6CrwOGEPib87AUuYUDat4S9EekxvKxVirHL/w3Tr1+7r2jq+jPJBZjGSzUYcmcyOhJYOZD
	T0EAxKDhL2F5ycBQm06yUQyMzDXgEGW+C9RfSqT9nruweN1aEInT6ORDCVMzENy0UN/Or7J6ErEop
	MvlcICyg4QisWMoW/5cXKQmxTNVsQ9FhOh6cKtkUsP1pwZVthcIIFviWUEVphn5b8tL+rMhUOpdVx
	YKNC5eSvxjRowSoj6cbW+naR5QnEeh+0z8heU/bn2GKvkffuK3enys+I3brOXaHm7+ROBjb9tEMfa
	KzpxWbLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUigA-0000000H3SE-28DD;
	Sat, 21 Nov 2026 10:50:46 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUig6-0000000H3Re-3naG
	for linux-riscv@lists.infradead.org;
	Sat, 21 Nov 2026 10:50:45 +0000
Received: from mail-out.m-online.net (localhost [127.0.0.1])
	by mail-out.m-online.net (Postfix) with ESMTP id 4jWprr1dd5z1sRL0;
	Sat, 21 Nov 2026 11:50:36 +0100 (CET)
DKIM-Signature: a=rsa-sha256; bh=GQ+eMDXBDrVrEVn9GoLWEDNtXo7EEZLQkKakt155Xjc=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Date:From:To:Message-ID:Subject;
        s=r1; t=1795258236; v=1;
        b=kpNvtQJ/+V2Ss8c9TpaByzxGEglvqK4rv9YadtKtVOA8puInEP6QdEklI3YGq/bS
         HqUlJNaSWXobFm84GUTqczT1d/gHYCPO89uqOPPMrRa9cOjQNJ6HQ+GpmY2n2wMy
         bBccjZVyRN329VaxX8ThQrNmi1hRg5XnNIf5nDmLaHtGFWrWDjgnDYaOxu/sX955
         w/JmndlVfUM6zr5Xs5J7YtrYcBBCjJuIkT+CpJTcjQcUyhf5n/YjmBNRvokPtlr9
         uK+0D7peC3RrXcoKRHAbBj8MEyR75XN9XZTlFJ+BzsUEIUFj739d0VRrE/Othd/K
         ikgNALNupRMbtrhCrXFkqA==
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4jWprp2t3dz1sRLT;
	Sat, 21 Nov 2026 11:50:34 +0100 (CET)
X-Auth-Info: gZR21gORsY69QSjr0ULjndmUbiQCWC2CS/qQJCc8xGJFaSKF6dOb8giB328fqP7N
X-Auth-Info: gZR21gORsY69QSjr0ULjndmUbiQCWC2CS/qQJCc8xGJFaSKF6dOb8giB328fqP7N
Received: from wiesel.intern (ppp-212-114-181-207.dynamic.mnet-online.de [212.114.181.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA id 4jWprm3rb6z1qqlS;
	Sat, 21 Nov 2026 11:50:32 +0100 (CET)
Received: from [IPV6:fdea:9b79:8984:1:7c3b:4612:a548:c3c8] (unknown [IPv6:fdea:9b79:8984:1:7c3b:4612:a548:c3c8])
	by wiesel.intern (Postfix) with ESMTP id A79B479A0818;
	Sat, 21 Nov 2026 11:50:31 +0100 (CET)
Message-ID: <fbaa1ed3-6e59-430f-9ce5-26020591bceb@muenchen-mail.de>
Date: Sat, 21 Nov 2026 11:50:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: disable read tx power for
 BeagleV-Ahead
To: Drew Fustini <fustini@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20261020132604.90708-1-thomas.gerner@muenchen-mail.de>
 <20261020132604.90708-2-thomas.gerner@muenchen-mail.de> <awDdetFNaeuxKkbp@x1>
Content-Language: en-US
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
In-Reply-To: <awDdetFNaeuxKkbp@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_025044_132164_1D278319 
X-CRM114-Status: GOOD (  30.35  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 21.11.26 um 00:53 schrieb Drew Fustini:
> On Tue, Oct 20, 2026 at 03:26:03PM +0200, Thomas Gerner wrote:
>> The bluetooth module of the Ampak AP6203BM is identified by the btbcm
>> driver as BCM4362A2.
>>
>> The firmware of the bluetooth module on the BeagleV-Ahead reports a
>> capability of reading LE tx power. However reading fails. To get
>> bluetooth working it is necessary to disable reading of LE tx power on
>> the BeagleV-Ahead board. The disable is implemented in a similar way as
>> for several Apple boards but uses the board compatible identification
>> from the DTB as there is no DMI.
> Thanks for sending this patch. Do you know if this is a problem on any
> other boards with the AP6203BM?

Unfortunately I don't know of other boards with the AP6203BM.

> Also, is there an error message for the failed read?


Without the quirk I get this message:

Bluetooth: hci0: unexpected cc 0x204b length: 1 < 3
Bluetooth: hci0: Opcode 0x204b failed: -38

As a result the hci driver stops initializing and Bluetooth is not working.


>> Signed-off-by: Thomas Gerner <thomas.gerner@muenchen-mail.de>
>> ---
>> No changes in v2
>>
>>   drivers/bluetooth/btbcm.c | 19 ++++++++++++++++---
>>   1 file changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
>> index 463d59890bef..2d02cc1863d0 100644
>> --- a/drivers/bluetooth/btbcm.c
>> +++ b/drivers/bluetooth/btbcm.c
> [..]
>> -static const char *btbcm_get_board_name(struct device *dev)
>> +static const char *btbcm_get_board_name(struct hci_dev *hdev)
>>   {
>>   #ifdef CONFIG_OF
>>   	struct device_node *root __free(device_node) = of_find_node_by_path("/");
>>   	char *board_type;
>>   	const char *tmp;
>> +	const char **s;
>>   
>>   	if (!root)
>>   		return NULL;
>> @@ -550,8 +556,15 @@ static const char *btbcm_get_board_name(struct device *dev)
>>   	if (of_property_read_string_index(root, "compatible", 0, &tmp))
>>   		return NULL;
>>   
>> +	/* disable broken Read LE Min/Max Tx Power on first board found in list */
>> +	for (s = board_broken_read_transmit_power; *s; s++)
>> +		if (!strcmp(tmp, *s)) {
>> +			hci_set_quirk(hdev, HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER);
>> +			break;
>> +		}
> It seems that btbcm_get_board_name() only looks up the board name for
> the firmware file so I think it could be unexpected to set a quirk here.
> Maybe this would work better?
>
>    static const char * const board_broken_read_transmit_power[] = {
>            "beagle,beaglev-ahead",
>            NULL
>    };
>   
>    [..]
>
>    if (dmi_first_match(disable_broken_read_transmit_power))
>            hci_set_quirk(hdev, HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER);
>
>    if (of_machine_compatible_match(board_broken_read_transmit_power))
>            hci_set_quirk(hdev, HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER);
>
>
> However, I am not very familiar with Bluetooth drivers so I am hoping
> Marcel or Luiz can comment too.

My idea was to use the board name at btbcm_get_board_name() as it is 
already available. However, this suggestion looks is it is more common 
than my idea.

> Thanks,
> Drew


Best regadrs


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
