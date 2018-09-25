Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB208C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 16:07:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C41920867
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 16:07:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OMb8nfhI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZYV7BJ+V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C41920867
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=4ZlZs/n6WtVAJTSSxCC95ap7jJfvEy0v0W1Vw7dlwP0=; b=OMb8nfhIFWFPk0XpSiBTiqvKd
	8Z+AgpfgwIfrSkifFlqZyYh+jGNs7wvmWB6SduXOzUHjbeFljY0/CuLWKR1Xzj6LQGLIS9rFC+oZR
	YIJk0/jrE7p/YHQf3ae23vXCbxsyVfEpFR5MqBQJIWb1zOwfee8d6iDxto6aLJFpgyDx/9tQmgo4E
	asSlLddrWssyZLhbHh1elbgs1/DBiMi2RojfM5Pqs9qNh1/6LkyGpEgaiDSGUssXbwBetq/SAjqPG
	HRSWAHYZ4LWGUtsg94lxvIE/KXUlpUzM7P9Qn90AOAh3c5vWWuBpj+xPg93hLOB+6sKDJijIYaJCU
	JKGEgTOFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4prb-0000m0-UJ; Tue, 25 Sep 2018 16:07:03 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4pOv-0004Mn-Af
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 15:37:27 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d4-v6so11512575pfn.0
 for <linux-riscv@lists.infradead.org>; Tue, 25 Sep 2018 08:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=KyXEcIjcx2t+CMAk6OGvGx2dtYhztu13RuMVVmWRmFc=;
 b=ZYV7BJ+VA5uDKv3KArdBWzJVUO8pOEsUpfX86sPCgGg2QyY4sMXTfOl9EME66fMiCV
 TJ5x00o36WbmF67JtReQoQ9Qr4zHA/bwZsccjLq+ZJXJA4VImqYZ1f8+g+caMVb0lBwx
 vmdZg8OCUGXN/DgweiFnUmnnCk79vnF1drzGl/rxDkZ4mJEw/d3LFFBE/VdutgVNtqQp
 B7hOse7Q99t91MT4U2nyliA/QI+Uz/TUkxl6a759XMeQ+pRfYCOWCFqs9ppANA9So8rN
 gk80QoLk318NXKzT2tLIE7dgRG/uXtzQQxZc/pzp4Ymto8F0UYeOXcCkjuOdWIp31Yg2
 P7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KyXEcIjcx2t+CMAk6OGvGx2dtYhztu13RuMVVmWRmFc=;
 b=V4a8azUDRvLri2CsRUP9GNOeoBgnrZnTXiKsWsHKdlP8FCzJh5aX8zTsoIqBkEHT4i
 PIrZeSpJkujxb8gufy2jKAjvOqAlPbroXFu9e2H/CZzxX5VB01j6n0Db4qRcIq+qdFpJ
 rWgkiZtADeAYJ4w+YwLDfhLBNWV9djqGLjKx9erZH0XpCbGjYE4aP31XkAemfbe3ajBw
 Fk3jWswt2IP+WdWoX9T52LjnbauAbv4WQv4wgz9GQNHbkf23gxXiHc5Yhoz6q2optMme
 x3B0D4ME+EwohAZS+oZ8DVOnkO9q5BLqGIdm42dc8aqJ0W168sTqa604zSmU5uMNvCCy
 iWhw==
X-Gm-Message-State: ABuFfogZBJQN33Ku7HcwB/pRXJSNMakuFagIlTeIjO1bBkH5swhKkHD9
 ESUiICCHxneEK5BlLsu4RUyEVA==
X-Google-Smtp-Source: ACcGV63e4rOIN3EJf9ggh9IHlPGXx2iyxO/81t2EIKBQm8VFUC6bjOueQjnGJHXmS7lVkphmTNLsMQ==
X-Received: by 2002:a17:902:b182:: with SMTP id
 s2-v6mr1838652plr.84.1537889820656; 
 Tue, 25 Sep 2018 08:37:00 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id d10-v6sm3291529pgo.2.2018.09.25.08.36.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Sep 2018 08:36:59 -0700 (PDT)
Date: Tue, 25 Sep 2018 08:36:59 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Sep 2018 08:36:24 PDT (-0700)
Subject: Re: mmcqd/0 stuck at 100% CPU
In-Reply-To: <q3pnx2kspy.fsf@armitage.lysator.liu.se>
From: Palmer Dabbelt <palmer@sifive.com>
To: marcus@lysator.liu.se, Paul Walmsley <paul.walmsley@sifive.com>,
 Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-9789543b-ece6-4f92-b4f6-ec6ebc258baf@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180925_083725_372535_1DDB0035 
X-CRM114-Status: GOOD (  13.89  )
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
Cc: linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925153659.0QPDRac1-JQdGqOY9y-G4ovNkYGDHU2Sg_0PmQECdik@z>

On Mon, 24 Sep 2018 23:15:53 PDT (-0700), marcus@lysator.liu.se wrote:
>
> Arnd Bergmann <arnd@arndb.de> writes:
>
>>> I'm writing this mail to inform about an issue with the SDcard driver on
>>> the Hi5Unleashed board running Linux 4.15.18 (riscv-linux-4.15 branch
>>> from git + patch-4.15.18.xz from kernel.org).
>>
>> Can you try a newer kernel version?
>
> Only the 4.15 branch supports the H5U, and there are no further patches
> to that kernel line.  I can try this unofficial mix between 4.15 and
> 4.19-rc2:
> https://github.com/atishp04/riscv-linux/tree/4.19_fedora_success_sep11 
>
>
>> This part of the mmc stack was completely rewritten in 4.16
>> (after many years of not changing much), so the results will
>> be very different. If there is a bug in the driver, it may show
>> in a different way though.
>
> Ok, worth a try then.  Thanks.

FWIW, I'm pretty sure that we see worse behavior in the newer kernels than the 
older kernels.  Paul or Atish might know better, though, as I haven't poked 
this in a bit.

In other words: we know about the bug, but nobody has actually tracked it down 
yet because we don't have a stable enough version of all our drivers.  We're 
working on that :)

Sorry you got bit by this bug!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
