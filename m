Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB88C46462
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 17:46:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A383206BB
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 17:46:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OkGaQgL1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fT1ED2pK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dYpmjNCZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A383206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=H9wmYBvvnx4XlCdTaEzhoR+1JeXtJV4Mrbsu3+NIlIM=; b=OkGaQgL1UQ/4Evh8W0RD/xDOd
	KKiiG556H+/5G93/SMvHAmGZjLrIyX0RRHUVKRpeFkJtHPWO6c4ck/XWR3FXZCfXmFMxSFq7vNyGN
	1Ttebr0CWebUlOEyTN9+sCyv+491gf4NO7JjBeCS0UO6GkPkho+65hgpXIN6aPh4mbCij+eIm/cC1
	SZ6dToegoM90JCheG5JZLiLpBQUami+ZwlJANMDxFHYgm9d18mk5BxaSDQCefLC4x86tiFMWZ01+4
	bRhCRZY4tm/b7s6YrX2PQwch8wdGr+15njV6UhJ/PpL/RvEsCdxp6KAZweBiQVozq0EIrm6Ur3J0n
	j4c0DS7OQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPA63-0000lT-HL; Tue, 20 Nov 2018 17:45:59 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPA5v-0007bO-8j
 for linux-riscv@bombadil.infradead.org; Tue, 20 Nov 2018 17:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hBX0FSFBrr0itjYxymVD88UatpyrF6UwAkthLzuFU68=; b=fT1ED2pKsWugAgsR+F1SnRQP/d
 QHdaFAhULTrW+q3pbmMxb468xycm4diY2depFYQev0KmW8nQWukZEPPIQHsNiWBVfpMSqczauselJ
 Hu/5RVDc65WK+a93ZjcXCSFPqHPCk1xGeiNWCnOLbFEbx2XmIWAevuoT1kdzE7gX5kdfPVVJOz1VI
 QFp2Ko9H9m4d2rU7GNTW6l5+tcBlNYTBnVtafUJ9I80t5qrpI2L3STFJfmYAHqAu3An7mjsXZIse8
 rjgUY+LgFuVmOq3Kbp486AM7woEu+Ot7sMqvty9jMSoVk3C0OD6UtUYT0a3cEkzV+GkJuird36Cl5
 c5/1YX+Q==;
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP9rZ-0002OD-MC
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 17:31:03 +0000
Received: by mail-pl1-x642.google.com with SMTP id b22-v6so1321632pls.7
 for <linux-riscv@lists.infradead.org>; Tue, 20 Nov 2018 09:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hBX0FSFBrr0itjYxymVD88UatpyrF6UwAkthLzuFU68=;
 b=dYpmjNCZcAjUxoepC5DGQSgmvJAc+t0fY/bM4d7JxucbcQpRJ0JGpv6REKKu+UWoN6
 S2mZPf6GPaVXod02Z0twOq5UWqI1ozVrYJGbsJVoYRxRss3O82fAvCdd0Nr9Xhk6uz+f
 Y+5uGcf+A7Nl0v2KLU+z5UU0o3AmFGj6bOC6EQGHnCUbq9F8598sc3uP7bK5jTD8VaxJ
 NMhOFslZmOq6SFBBLyWipytUdx2yudXOiMHE+JBAQWiuW/YZOpnjpJnVZWcX+9TqE8UG
 lyJ2bmfZbnaqHYeBLQEO4PntM+FVZvY/CT243tQNZKiSA9rG5C1vE6JgX05VkWWJgscP
 dyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hBX0FSFBrr0itjYxymVD88UatpyrF6UwAkthLzuFU68=;
 b=Ih9G1SZMDX+9cekUs+THVb5sIsv5ovS1McK+rTshVBUjb4024PMWzc7dzzZX8AGZ+7
 YPcpmqx9RrdVwQzTTnnd70NqNzdqYtKBeXNWNfguc9zYZCBPoCH7tNi5+cIM9BlMiBWa
 gco5KxIcf2uZwq/FjfGrVGCGH2jGEbHFS0yWCF9dV7MlYiwQ3233tyX5wNK/9ZkhYPFh
 2bAezd/1ZhMRw6af1hPOke30TRCKWpCZ0Mct1dKQhlXhy7EnSV7hvj+VCLpahwerxyne
 KIAxCGRZw1Mxb9K+dQTeeuQOQSy7NHnqQLd+KuT1chNEeewe2++74MWHY3aszdERXVZn
 zd2Q==
X-Gm-Message-State: AA+aEWZR59aBAWHv4aOV3/FtcGSj4SAUGFWSCKcZ7gqAwd2AKspymXVN
 T1UkT6JyJQ953HSDKNXw23JU1xIc9E0=
X-Google-Smtp-Source: AFSGD/W3roJF1CjfIx9ugN1SIcsgON38+IYuOOwBJHy4RNyOB1zT8+HWLKjYl9ai8Vz3aSflrVJD3A==
X-Received: by 2002:a17:902:e18d:: with SMTP id
 cd13mr220249plb.262.1542734989455; 
 Tue, 20 Nov 2018 09:29:49 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id t90sm34787531pfj.23.2018.11.20.09.29.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Nov 2018 09:29:48 -0800 (PST)
Date: Tue, 20 Nov 2018 09:29:48 -0800 (PST)
X-Google-Original-Date: Tue, 20 Nov 2018 09:17:39 PST (-0800)
Subject: Re: Kernel panic - not syncing: corrupted stack end detected inside
 scheduler
In-Reply-To: <mvmftvw9llx.fsf@suse.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: schwab@suse.de
Message-ID: <mhng-a200fe90-01a6-444d-9f76-0b00c22249e8@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_173101_720641_E6FA6126 
X-CRM114-Status: GOOD (  15.38  )
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
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120172948.FIaOIJxBOkvlq94PeQSjOF2SbclC1xgpdnGHd58qAUc@z>

On Tue, 20 Nov 2018 00:52:42 PST (-0800), schwab@suse.de wrote:
> On Nov 19 2018, Palmer Dabbelt <palmer@sifive.com> wrote:
>
>> Sorry I can't be more specific.  Does this require hardware to manifest?
>
> This was on the hifive.

OK, well, we know there are at least some issues when using an SD card via the 
SPI interface as a disk, but nobody has had time to track it down yet.  Right 
now the only reproducer is to just write a lot of data, which is a pain to 
debug.  The current issue manifests as a hang in some kernel thread that has a 
MMC-like name.  What you're seeing may be the same or a different issue.

Do you have a better way to reproduce this than to just hammer the filesystem?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
