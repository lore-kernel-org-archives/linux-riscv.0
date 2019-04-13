Return-Path: <SRS0=1PsB=SP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5DCC10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 08:15:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A06A2075B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 08:15:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C6I5f9ID";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="VVVdSsSL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A06A2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ChidM2eoMu2+ji6M4GBeBUIsDM05VGk7bDUORItCQP0=; b=C6I5f9IDauwtvB
	e2as25Mh3QH4JqGcJD5DDcPgRf/yG9FRVS8BYHc02T/s3BAnS3/CWQ7YtSc5PhLV2oEk0iyzNo5cT
	1Eg6ctz0qQJJ56i0f7f3W6vmm8AP+D18EpOpiUBDGQLzjokioPnK8/wMQFOiUA55JX7yN9iGUbzY2
	xCJlLfwSXkCYhclG63+1AE1fa4GexV8KP1JAMYhc2qwnKAChi0kqWBnOOfiw9zQEv5Pdi5WKtyb+8
	elwY9LF78Pf3l4bzEpnvFsPAY/5MRgXWK53ROtxEDSfh2nY4QJp4Mi/8drEfrvD+pOsXRYkEQhpFZ
	sYe1CR7S+qsAmv8anSqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFDoV-0005yR-F0; Sat, 13 Apr 2019 08:15:03 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFDoR-0005pQ-Iz
 for linux-riscv@lists.infradead.org; Sat, 13 Apr 2019 08:15:01 +0000
Received: by mail-wr1-x442.google.com with SMTP id y7so14844250wrn.11
 for <linux-riscv@lists.infradead.org>; Sat, 13 Apr 2019 01:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J7iUcd5GfDnBPGNrzJN0CVYNv1oHlO8JYhgGPK1a+HI=;
 b=VVVdSsSLBrmbeo3thuXRuZG+SvbtF0Cw26oGfuk3jEWjFv1UutcWuoMduzh7ke5fZS
 CFBzyNWzF71y+81Y4CAePqjl4w1N1rw5sW+s7sGwPdU97eYDy0zacpmnrCzOfbWddYBG
 UL0diZBw+cyh5X0s9QqMWMHmgSRK//VFJTNBzOiL3mTOVtuGB8uZ0s7XUcqWRkTznShw
 AWkKY8urkEJ3+Mk/xh9pjxOmTIe6bkOez+xyqvZCnzk2a9GRDuFC1M2mNSQJy4jJoOYl
 Oi1UEdP/91cydFZmKBYwsk47NYUzhGWhSS1DTr1lV/gsAJlP+yaS6lCE5Nu1XcUsSG80
 cTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J7iUcd5GfDnBPGNrzJN0CVYNv1oHlO8JYhgGPK1a+HI=;
 b=uYn3v36bmw84SlmQzxpYPdxuxAMaiKJu7FGvBqe8SaJTaKMIMJb/yzRXJVyZk/UPhw
 7al/XiDWxjV4TZZj3z9ORkxosvLkZNY5MCdFI8Eap8y/gHsvvxuIZbcNoeIMlv6SftzF
 ChBfeXFJjEnqOw6CCY32/s2HKYrIWlawcbQhnNthDJio0r/CrMy7j/35f/ffOPlOrd0K
 JxEMgOxJ2cJ/LUdRZ9e8nN6vj3xcyVbqqSGS4iws4aVRQYfTWmbG9IOK7o8owggzmeoG
 FJj2p50YCiGTinWR2Ayf3f32lstf9JeD5j+DeQkPHlpS9ziJwz2u/wDfBVXnmBT+nmT9
 bqHw==
X-Gm-Message-State: APjAAAV3DzEsCEQUlpVpdFIdOSJhCIJmORA+Y2ksBkvn3tSkMoFCQAMO
 HlmBX7ispadMdaxIAP34M8Rzs0xleHqN79VQbpxGXQ==
X-Google-Smtp-Source: APXvYqx5ds1pvx+nNW7dS9zI3DITTE0TTvRplQQnnXuaqeB4m0q4usNA+JuYmSOzoNhG04SSNM0Ce2RUwa2pYjLe690=
X-Received: by 2002:adf:e610:: with SMTP id p16mr38501808wrm.64.1555143297772; 
 Sat, 13 Apr 2019 01:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190413073906.53676-1-anup.patel@wdc.com>
 <20190413073906.53676-3-anup.patel@wdc.com>
 <20190413075433.GB30428@infradead.org>
In-Reply-To: <20190413075433.GB30428@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 13 Apr 2019 13:44:46 +0530
Message-ID: <CAAhSdy2icapbjYc-VEaxM7CT_YA5B9p5ut9DMj1mdmTxDX-H7A@mail.gmail.com>
Subject: Re: [PATCH 2/3] RISC-V: Add defines for CSR numbers
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_011459_620616_FCE41247 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Apr 13, 2019 at 1:24 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> I think this should be merged with the next patch.  Also please
> only add the CSRs that we actually use.

Sure, will do.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
