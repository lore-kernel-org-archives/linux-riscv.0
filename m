Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDBFC7EE2F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 15:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4lR5rFaWpQHfMjtgjXcLriPFRngVnNoruNIw68CpVMc=; b=Nr1eJIbIjPvzjD3gTpXiZJlKsI
	fJX1JfqRVWGv01YUrV9+g/PNMY5a0LRGPkhXTmgvwFNukEqHuIQ6eklGU4A8jq/WFLfr7x1l9YWJe
	eIjXZJDeem0YfQzi45gvhqRaokmHd8IQFMvnEH2NNurTo45XneW7BPxA1Ba5Fxe/ukqyZ/k3wvSlp
	euUaFfI3aA/dx88wK8MQ7dVXIfnSzCHYj/TTvEf3+DDdslnKTnCvOGkqjVCEfDLme48fmv9y+EOQ9
	T1CStwnCnkk7VxP4OlG9o4icXArHoJmvdsKf8QVH75INSHD1KCjXzBAPTjxLn8Nmq950EaleIBj3h
	LIUsQ4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8jUR-004U19-33;
	Mon, 12 Jun 2023 15:29:55 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8jUP-004U03-0J
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 15:29:54 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-39ca120c103so1364223b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jun 2023 08:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1686583791; x=1689175791;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+L3sNBGkEDm+nY+O6ThdBKE7WdymZq4deKq6djroJ+4=;
        b=go09bCif4ImXiCWgjVptfkS9gXEy0+VB5/+YiVIIRg/UaF0J/xL24VDZEuptVDNfL1
         TrKC73Qm8r/vjS4Dp1y7404UdPFirmviByLME8pnKRyqb4YDCW63IpUOf642JoPHe6bj
         APrd9Nse/u+hCdTqF61XybXoApKjTARMyWt8tjlL6fu6estIpaQhGDh0SEmtdRd2Ja88
         c5kKfKXmD3BKOwYJlqaYos0cL435spWC59lFgnIQbC2gpYTnhA+qnFMw3cfyRwK0Q48p
         ONlTAEDfPvkyMx7opPf3w0a7TeNZJ3ePeKlgU/Fc/GmQfGTlA5fGoxqFZ78zyQ0sRjQp
         EYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686583791; x=1689175791;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+L3sNBGkEDm+nY+O6ThdBKE7WdymZq4deKq6djroJ+4=;
        b=CDe9y8kA2ex8b12xQwgLGEbLkHu50bFIkLEvq5dp8FNOlg1O9tjmijm4UzsfWLsUnW
         J2zQr9HEOQ8vYoblbCpHEoFDLXnsNPjs9S5pu7/UqlHYYdxmxX4anYrlq90+Vpvd9VOV
         xLDAipim+K5rdSjHNrdyIvfwIJTFH7dwm4QDmozZxATr/V4JX2RVT6XOrKfRlk+DcLv3
         jk+aVnFfmB9faH2mEcuT6k/RBMoVZ50UPMmDx2qL6Vm4kTSm3zDH+RtZnB06uo+9R5j2
         vGWlFDqeb42mrI0X0kbLQ3xPfFhzPQutgUuDDLoIMutFshStDjC6fNFArmAEchiw2ebf
         AlwA==
X-Gm-Message-State: AC+VfDz240zcGSsgGugs567wvX5ZuKdc0MUvfhdoBPl/CMWxngpKLwjz
	dCsH8V356aQ4GGUsXTa1un2Gmr7ec/SD9k2Gbpw=
X-Google-Smtp-Source: ACHHUZ57XwJNmqydEfIp4zrTcUdo5NXQTs9MhZtPtZpjHailChIEu86ekE94sWUuxvP9d3aojoVRKQ==
X-Received: by 2002:aca:230b:0:b0:394:4642:7148 with SMTP id e11-20020aca230b000000b0039446427148mr4426563oie.48.1686583790671;
        Mon, 12 Jun 2023 08:29:50 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id rj6-20020a17090b3e8600b002599ef80ab9sm9418417pjb.3.2023.06.12.08.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 08:29:49 -0700 (PDT)
Date: Mon, 12 Jun 2023 08:29:49 -0700 (PDT)
X-Google-Original-Date: Mon, 12 Jun 2023 08:29:45 PDT (-0700)
Subject: Re: [PATCH RFC 0/2] RISC-V: T-Head vector handling
In-Reply-To: <mhng-6d6a325c-4adb-4d9a-98a0-012c75b4562e@palmer-ri-x1c9a>
CC: linux-riscv@lists.infradead.org, samuel@sholland.org,
  christoph.muellner@vrull.eu, heiko@sntech.de, Conor Dooley <conor.dooley@microchip.com>,
  linux-kernel@vger.kernel.org, heiko.stuebner@vrull.eu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de, guoren@kernel.org
Message-ID: <mhng-ca852a2c-a1c7-4b14-a9a2-f2bd4541d6b7@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_082953_401364_27AE9558 
X-CRM114-Status: GOOD (  22.00  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 14 Mar 2023 22:29:41 PDT (-0700), Palmer Dabbelt wrote:
> On Tue, 28 Feb 2023 13:54:33 PST (-0800), heiko@sntech.de wrote:
>> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>>
>> As is widely known the T-Head C9xx cores used for example in the
>> Allwinner D1 implement an older non-ratified variant of the vector spec.
>>
>> While userspace will probably have a lot more problems implementing
>> support for both, on the kernel side the needed changes are actually
>> somewhat small'ish and can be handled via alternatives somewhat nicely.
>>
>> With this patchset I could run the same userspace program (picked from
>> some riscv-vector-test repository) that does some vector additions on
>> both qemu and a d1-nezha board. On both platforms it ran sucessfully and
>> even produced the same results.
>>
>>
>> As can be seen in the todo list, there are 2 places where the changed
>> SR_VS location still needs to be handled in the next revision
>> (assembly + ALTERNATIVES + constants + probably stringify resulted in
>>  some grey hair so far already)
>>
>>
>> ToDo:
>> - follow along with the base vector patchset
>> - handle SR_VS access in _save_context and _secondary_start_sbi
>>
>>
>> Heiko Stuebner (2):
>>   RISC-V: define the elements of the VCSR vector CSR
>>   RISC-V: add T-Head vector errata handling
>>
>>  arch/riscv/Kconfig.erratas           |  13 +++
>>  arch/riscv/errata/thead/errata.c     |  32 ++++++
>>  arch/riscv/include/asm/csr.h         |  31 +++++-
>>  arch/riscv/include/asm/errata_list.h |  62 +++++++++++-
>>  arch/riscv/include/asm/vector.h      | 139 +++++++++++++++++++++++++--
>>  5 files changed, 261 insertions(+), 16 deletions(-)
>
> I have no opposition to calling the T-Head vector stuff an errata
> against V, the RISC-V folks have already made it quite apparent that
> anything goes here.  I would like to get the standard V uABI sorted out
> first, though, as there's still a lot of moving pieces there.  It's kind
> of hard here as T-Head got thrown under the bus, but I'm not sure what
> else to do about it.

The V-1.0 support has been merged, so I think we're good to go.  Does 
someone mind re-spinning this against for-next so it lines up with all 
the new user interfaces?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
