Return-Path: <SRS0=aecs=ZR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A1DC432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Nov 2019 20:15:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2BB020659
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Nov 2019 20:15:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a4tGfdTI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="sBdkVkNW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2BB020659
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:In-Reply-To:Subject:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=hFnTRF22csUPdnYYnBjYVGhMXf/OuR5veQGABJH2VYw=; b=a4tGfdTIdxi0SkVZ7DGgElhRj
	ZEM8zWwo//r4FbsbzXAEsZlv2nMUgc/uY9sz3SEZZmH4ASl1ClC4Wi0vCSP7KJSqzKsNjtJud3YLZ
	6DVPRz4DBKkZFO5iRBr8uwzLWuVnMmxsbVbfBxbcESy3HzR11udSBjB58gXIureWhIY8utTNHwyWh
	kpM8szEp3V1sLH8fqj9au5Ty142MsDXCamH8waX94bqnkgehHE4ahh5jB41E5NCwL1Jj735stESX0
	u8po+inJprShogXCmx41rfTvpeT0iYN9I4PU+8t0bC31dK8qxz32+BQ34CQALR9gIkfYEZC031dgM
	eSct2zcHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZKlO-0007iW-G6; Mon, 25 Nov 2019 20:15:14 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZKlM-0007h1-Pv
 for linux-riscv@lists.infradead.org; Mon, 25 Nov 2019 20:15:13 +0000
Received: by mail-pg1-x541.google.com with SMTP id b10so7734006pgd.4
 for <linux-riscv@lists.infradead.org>; Mon, 25 Nov 2019 12:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:in-reply-to:cc:to:message-id:mime-version
 :content-transfer-encoding;
 bh=llUK3i1niv16cdWbDXAJs5ExZTAv/m6WEktgyyWhXFY=;
 b=sBdkVkNWGS2oMMZ5VHQnxSumwiuiFLL9lafIAOLv0iKt3GASV3WSq0rYT/uebrKX63
 qdzz8PRq2Nk9UIULE0VshuC0AcNzDrEKtHXjj9PNcAWwmzrT5TUoecZ6P8+YVWTEfw+a
 mm0uVpP15wLODSCrweSFajEWRHyQT3qFEWm7XpteFURSS1aG6N1ILzXBJAhoGey64ezS
 CCKT2jEtLahenEfKXt4dnwmxvLx/Xj4wQuWK5LGg7ZLZ4ox19SrZv3rvz1DNqY3KbCcK
 qMX9bVzWMDi8krT/hyScSsMnGw6DpEG4cb3jpR8hdBI1VcK+NnyRgIqvZzW9pMOn3Nf3
 TaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:in-reply-to:cc:to:message-id
 :mime-version:content-transfer-encoding;
 bh=llUK3i1niv16cdWbDXAJs5ExZTAv/m6WEktgyyWhXFY=;
 b=rg/luetAwe2sL23BbYRNNwBCFMudOSxJ4PEs0BRTmn2cPIZwyqFLczecSpRBkpAnXv
 7g9kaMHrQEZzPAkljC5e2dE0u7QzqQ+fL1ssdeD7fG19RgeC5uAMEiVtvZG+j2+hdeuF
 sDJz+An2cgLNDsGpNTVaEkUkYKH2GoovjSM6dvxdXIuj1ZDjOOyZEWJv1iVsLRr7mDsU
 AT6TaFEsYWFO3AAHcSnViuNP+MT1Az9bg5zVgEmhxjmsw2Qrhmytsv8UUaKgx9yc7IE6
 ekUfW96ORwxKBzrnJUY1RJv5486afUHGULjayHN8CI9CEgMgL3IZL3F6vYuEZnKKRlF4
 RWOQ==
X-Gm-Message-State: APjAAAXanqpl1G0ZC5f6HTj4P7Sv/eSTnp9cOT4uH4pxEit+RndwGWMJ
 K+j7nZnYo2jxwSszPAaP1D5kVA==
X-Google-Smtp-Source: APXvYqyZPq2SCYgm5IpPqo73rjzD2UOI94gts+jmIlldOuHcEpGsyKoai6uHV7RRYwrToJ34bPSUxQ==
X-Received: by 2002:a63:561b:: with SMTP id k27mr34910392pgb.253.1574712907967; 
 Mon, 25 Nov 2019 12:15:07 -0800 (PST)
Received: from localhost ([2620:15c:211:200:12cb:e51e:cbf0:6e3f])
 by smtp.gmail.com with ESMTPSA id x25sm9734258pfq.73.2019.11.25.12.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 12:15:07 -0800 (PST)
Date: Mon, 25 Nov 2019 12:15:07 -0800 (PST)
X-Google-Original-Date: Mon, 25 Nov 2019 12:03:38 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2] riscv: Fix Kconfig indentation
In-Reply-To: <alpine.DEB.2.21.9999.1911221853330.14532@viisi.sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <mhng-c0078b00-1f6a-4286-bb43-404f17574494@palmerdabbelt.mtv.corp.google.com>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_121512_839828_47021B6D 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, krzk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 22 Nov 2019 18:54:28 PST (-0800), Paul Walmsley wrote:
> On Thu, 21 Nov 2019, Krzysztof Kozlowski wrote:
>
>> Adjust indentation from spaces to tab (+optional two spaces) as in
>> coding style with command like:
>> 	$ sed -e 's/^        /\t/' -i */Kconfig
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Thanks, queued with Palmer's Reviewed-by: (which I believe would apply
> equally to this version)

Ya, it does.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
