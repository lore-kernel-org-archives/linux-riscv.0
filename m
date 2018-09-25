Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04336C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 17:15:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53342086B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 17:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cP/KHduw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="A3nIokxA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B53342086B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=BXOn0p2zi+hVEt5OTC+dVkOPGHxvA/FL1i3sLTy0AZI=; b=cP/KHduw0Fx2AL+EMkpqbd2in
	sladczhSNhqST8b0IHKOpbAwYCpug1kjLdRWpk9weAKUZvO161+y070xFeXlYWTZX34XJW76E7Aew
	8KJgij4LLsFA5cjUPKmvI4lvRA2FLIsr/IvNxlxFS6BGpP4efjT4Hpf6d8BZMCIzDqZG7vlMSruEL
	uIQZLlyVpUNCY0+I0PuhBBS6XaiP5m4prXgTJ1XoEpfX3QiEkB0efv3De6rkz85U7BEbt1l+++y/k
	4U5K4T/LpaXI34dAkm8SMg+NEiywYqmcvcz7POQW9xFxTG+iR53b8LDEQzCZHigGl3IeGTr5OVk8Z
	zqdhbCfsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4qvy-0004Vw-7R; Tue, 25 Sep 2018 17:15:38 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4qkw-0005jo-4M
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 17:04:36 +0000
Received: by mail-pf1-x441.google.com with SMTP id s5-v6so3879656pfj.7
 for <linux-riscv@lists.infradead.org>; Tue, 25 Sep 2018 10:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Nqwq16Q7LQxf+wL9ZlsvKIL3tzWSkHJMNq+NYLf1TYE=;
 b=A3nIokxAhKkR0zCjC5M3XSlc1gUvwDSW8Eojho+EJqgVXdH/i2xNUvbTceOKJR5Ert
 4HMWYogGRtQx85ka5dwChSB1Ji5Jmhj1tYF3FkpvzZJnHjQ7nxiyVE87Lee2qncMBtdM
 KE5NTCt+EoKRQ6JWQkooYu2eyG2V6MQWVJfKCT6Fj+EuqiUYRUSM7GPRyDPNvOcwF6Ni
 7wiYTesHjGyAQ2gVjj0kClVmTCEy/WtFh3USjvWItVH7gmrnJl2B7J4zNceaMk17K/aJ
 NCDKBLW6CkD7z+RaBmaJJX6XLxyARBbkX+BKKZZYWuSJVH+fxP7GtH6e+lNmWN8o3p0b
 x6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Nqwq16Q7LQxf+wL9ZlsvKIL3tzWSkHJMNq+NYLf1TYE=;
 b=MuUU1RjsUspkRLj5g9QWgJu3H0o+cu3z4rDKdW9qtlBJQat8uqrEw1vB2eBrRfhI3Z
 vG2Vnli6/Jp7Tl4alB/hK84dVErhoSyOIz053ddBZ9h7AcKIzh7buNQtyUu36d5k8aMn
 /wdNaq8GYEPuVowR/nQEaDtk8vdd3k/xljI4unxQs7QDEsrqcjVotlWyygrBIakB7WAz
 5wKP3aMHW5B0IOiQppWaxG2Ev3Nw82Qx/OIAGdIeHN9A5RW1cZyf8Jh6O3PA7K+GrSZS
 WhpmP7+BTyyABGWMrxnJHVTfl/mkMGXbTEOEQSAiubMASTFcMBEFqkCuTqulsqGLId2U
 /zeg==
X-Gm-Message-State: ABuFfoiy9yhgCcDwJCa3c9ThvCRV9VWPNDVR9ENN4+5WeMj7Hsw+GmKj
 ax5a3w1nMN2i37W5UvuzWL5SBw==
X-Google-Smtp-Source: ACcGV61gQtUE1qqx24YnRTX+9OhomVq0kzD3+KISfcF5USdbis4H+MeRCw5EymGr/Hg+gNgf23r4ew==
X-Received: by 2002:a17:902:8481:: with SMTP id
 c1-v6mr2133192plo.158.1537895024324; 
 Tue, 25 Sep 2018 10:03:44 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r12-v6sm3818159pfh.79.2018.09.25.10.03.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Sep 2018 10:03:43 -0700 (PDT)
Date: Tue, 25 Sep 2018 10:03:43 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Sep 2018 09:57:57 PDT (-0700)
Subject: Re: [PATCH] RISCV: Fix end PFN for low memory
In-Reply-To: <50f35396-9e2b-c177-6a96-9c450c7abdde@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: atish.patra@wdc.com
Message-ID: <mhng-133e3d9b-f580-40d4-bb7a-9cafa72fbb93@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180925_100414_286737_C8074F9A 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: Damien.LeMoal@wdc.com, anup@brainfault.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, terpstra@sifive.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925170343.DPUZlThattMvhi880wyOPq50lYzVIqRJzC3bwWtFTN0@z>

On Mon, 24 Sep 2018 13:55:04 PDT (-0700), atish.patra@wdc.com wrote:
> On 9/17/18 7:08 AM, Christoph Hellwig wrote:
>> On Tue, Sep 11, 2018 at 11:30:18AM -0700, Atish Patra wrote:
>>> Use memblock_end_of_DRAM which provides correct last low memory
>>> PFN. Without that, DMA32 region becomes empty resulting in zero
>>> pages being allocated for DMA32.
>>>
>>> This patch is based on earlier patch from palmer which never
>>> merged into 4.19. I just edited the commit text to make more
>>> sense.
>>
>> Looks good,
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>
>> Palmer, can you queue this up for 4.19?
>>
> Hi Palmer,
> I did not see this one pulled into your rc6 PR.
> Not sure if it was intentional or just lost in heap of emails.

Looks like it got lost, sorry.  It's in my branch now, I might re-spin the rc6 
PR because it looks like I may have screwed it up, if not I'll put it in rc7.

Thanks for the ping!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
