Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677CBCCA473
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 01:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=RDGe4l7RR/gtrQ3Tj2u9FGwf8S8YUVfosQaxvOZ20ac=; b=PcQSk2C2RARHz9
	4S9B5d26+JkhHZY/LhkpBwEcpiSpc2IJwAxYHBvOjEuXB0dUcr6+wTzVOa2fzVr4SpKcyg7C03JRf
	2WfZpoeNbYYXELblu9YrBnzvP4rAo1OPK8TMWgzg7J3sy4D0ue+ecKnK9pJUbYoIAZyNtjYiD/5kl
	71uHyXvdUBK1zNX6USVMapnWsiv/0Dc32et29zY5DEkVyd4uHk0tTfX5lh1U6MGen1Ahde+ONMY4K
	58xECsRxufoD+8Sglfe3ZEfcOjvcSy/UKMk/qrK1ue4AIp5NmLWz2bH76Sj6AVhsjLvaJH2qfLctb
	HP9xptlQS+O5I5sqzNNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwa3v-00145G-21; Thu, 02 Jun 2022 01:55:47 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwa3s-00142d-AG
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 01:55:46 +0000
Received: by mail-pj1-x102f.google.com with SMTP id u12-20020a17090a1d4c00b001df78c7c209so8011702pju.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jun 2022 18:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id;
        bh=KOVDOxCVI4vVBCH6b+W62sk58si7BFfHeJ7dzn6m1vc=;
        b=s5yKFAmmriDWLb9h6EkYjcAfxSCrlFCB35p1b62Cj6EhSyMkO0a2ehkmVZTqrdGeQM
         vZBKwmCQN52iGZ1q0NcueIW2C3yI4Wv8/lw3qm/VWUwwvkcNslirtCRrNXGgtt9/cArz
         PzWx2JaMcKxDceYpg8ybaD+ZEqxXu50PQIkrSQLdvxYPjd2U2m+5U41nHzh7CoUCET1u
         r+BjZNF0TdnAsc8gJbJSfHA3SfdkR/2CCuGX48L88U4BaSzdghoJpkoxySrgG2ombI+3
         8OwzNEGaguj4dRBXfrgx0C8ReqAbMj/qzq04FUx9OirSe0NpdDFwxU1jB1R11orJiQVK
         aB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
        bh=KOVDOxCVI4vVBCH6b+W62sk58si7BFfHeJ7dzn6m1vc=;
        b=0OS0ocn+QxrbUuOaGndcMURNayZaxEGKfXP+GJZPoop2ugf8e3vAY4LY+/bC86Aqcb
         TJNSt0yI/9Ufh85Pm5nKk9lAv+gE7GF7kk6a/mPhMlfhbNBuTZYfKBVoQVRjN+PXHhyD
         JBdpXIWUCoRkotewT9hsEA1lzXQh2eXSnuUUJJYqbF46drAy7yBHRZUZySQCNut/Dkri
         n7HLE36/vj8f3kB3D9n04NjCMJ/UJ6ybqGByEIn4O2b1g/R/cXTXfY8xmxD5M05qEcWg
         4nSQbR+gKV7CGIgcmMjvtiD5rPsxeWJI1dKZdw5WOaUqvG6q09LjivKA/dpIuD1+lOBk
         /DpA==
X-Gm-Message-State: AOAM533SuG4cu3LvPCPci3czjcFjbc0x5CSV79S33OFkfvWofbi3GlyE
	03+EmIPPwrR1hUSeeGpK3suEeg==
X-Google-Smtp-Source: ABdhPJw9CKiAFJKDrfs2v3vrViEDs0+jyFmtV+AptTS5FG62SVVtIE8OyHHDCh8XJ7scvP8oNp3r1A==
X-Received: by 2002:a17:90a:6941:b0:1e2:f37a:f889 with SMTP id j1-20020a17090a694100b001e2f37af889mr21009905pjm.160.1654134940921;
        Wed, 01 Jun 2022 18:55:40 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id w1-20020a1709027b8100b0015e8d4eb1c1sm2182005pll.11.2022.06.01.18.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 18:55:40 -0700 (PDT)
Date: Wed, 01 Jun 2022 18:55:40 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jun 2022 18:55:30 PDT (-0700)
Subject: Re: [PATCH v4 1/1] MAINTAINERS: add polarfire rng, pci and clock drivers
In-Reply-To: <d50f506c-92fd-39c2-d5d9-5eb9c60b1de6@microchip.com>
CC: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  Daire.McNamara@microchip.com, Lewis.Hanly@microchip.com, Cyril.Jean@microchip.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor.Dooley@microchip.com, Greg KH <gregkh@linuxfoundation.org>,
  Arnd Bergmann <arnd@arndb.de>, mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
  lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com, linux-pci@vger.kernel.org
Message-ID: <mhng-5c57560e-a00b-4fd8-95ee-5e2fc0dcd34c@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_185544_392081_89A09E2C 
X-CRM114-Status: GOOD (  21.06  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4997932134130505837=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4997932134130505837==
Content-Type: text/plain

On Mon, 23 May 2022 13:00:01 PDT (-0700), Conor.Dooley@microchip.com wrote:
> On 23/05/2022 20:52, Palmer Dabbelt wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> 
>> On Mon, 23 May 2022 04:42:53 PDT (-0700), Conor.Dooley@microchip.com wrote:
>>> On 05/05/2022 11:55, Conor Dooley wrote:
>>>> Hardware random, PCI and clock drivers for the PolarFire SoC have been
>>>> upstreamed but are not covered by the MAINTAINERS entry, so add them.
>>>> Daire is the author of the clock & PCI drivers, so add him as a
>>>> maintainer in place of Lewis.
>>>>
>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Hey Palmer,
>>> I know youre busy etc but just a reminder :)
>> 
>> Sorry, I didn't realize this was aimed at the RISC-V tree.  I'm fine
>> taking it, but it seems like these should have gone in along with the
>> drivers.
> 
> Yeah, sorry. In hindsight it should've but that ship has sailed. I sent
> the rng bundled this way b/c I didn't want to end up a conflict.
> Obv. there's not a rush so I can always split it back out if needs be.

I'm adding a bunch of subsystem maintainers just to check again.  I 
don't have any problem with it, just not really a RISC-V thing and don't 
wan to make a mess.  I've stashed it over at palmer/pcsoc-maintainers 
for now.

Sorry if I'm being overly pedantic about this one...

> 
>> 
>> Arnd: maybe this is really an SOC tree sort of thing?  No big deal
>> either way on my end, just let me know.
>> 
>>> Thanks,
>>> Conor.
>>>
>>>> ---
>>>>   MAINTAINERS | 5 ++++-
>>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index fd768d43e048..d7602658b0a5 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -16939,12 +16939,15 @@ N: riscv
>>>>   K: riscv
>>>>
>>>>   RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
>>>> -M:  Lewis Hanly <lewis.hanly@microchip.com>
>>>>   M: Conor Dooley <conor.dooley@microchip.com>
>>>> +M:  Daire McNamara <daire.mcnamara@microchip.com>
>>>>   L: linux-riscv@lists.infradead.org
>>>>   S: Supported
>>>>   F: arch/riscv/boot/dts/microchip/
>>>> +F:  drivers/char/hw_random/mpfs-rng.c
>>>> +F:  drivers/clk/microchip/clk-mpfs.c
>>>>   F: drivers/mailbox/mailbox-mpfs.c
>>>> +F:  drivers/pci/controller/pcie-microchip-host.c
>>>>   F: drivers/soc/microchip/
>>>>   F: include/soc/microchip/mpfs.h
>>>>
>>>
> 


--===============4997932134130505837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4997932134130505837==--
