Return-Path: <SRS0=1C2h=O6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B47C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Dec 2018 22:34:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E588E21927
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Dec 2018 22:34:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hKUtXOf5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="TUrGM0Lm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E588E21927
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rlzYOYNtjtw6yYoSN7/EDZ85n4OkwSp00bIC9lwn71o=; b=hKUtXOf5VF+d/9
	DWdGsRR7ORE7K4eP9wYlkgQJuDPsvdL59T8a1K6PDVUp1P4RODEAAG/dtPrp5IanaJaqoCmI82NFN
	3zSh6Uks2a/hXTtdN2OIjTlM33VoORY5KDCEzXuT9N6ZuHBf6Q1/q6u6uiFyygarCFEAfVUhoyI1i
	inoXeuDzZxaDdx76xtvrSypWij4o83I0V0iV7hG5I53e0jC7CzaOW+Cz2I0w9XnXhJLBTj7B5r0Y/
	2v2FS/ItvFj467VvvSI02nUZQiJfFtYkGxF1CcDsSx2Wn0zaAsW3piT4+mkzG4QGJyeYZ/r9LV8rB
	gD+xnxnjUiSsvwgt+SKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gaTNK-0000kO-P4; Fri, 21 Dec 2018 22:34:34 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaTNG-0000ja-6p
 for linux-riscv@lists.infradead.org; Fri, 21 Dec 2018 22:34:32 +0000
Received: by mail-io1-xd43.google.com with SMTP id v10so4868285ios.13
 for <linux-riscv@lists.infradead.org>; Fri, 21 Dec 2018 14:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=dapPdIq4NKdTh83FqnhWp0jd26+pQIFL0Exxw5JzCR8=;
 b=TUrGM0LmrTxQhfbOcdK3KDEG5tlXmracmSOB4bf5C5gLT14ebG7o2mIPBBjxSO8KTE
 ZHGpdMoGkz4pMmHrQXjSuzOSS9EMJ3YdRGo8jMXjnlV+U6j1zoq7oDay5sn1zEaxv0dZ
 SeV+XXjQlyrr6kSCMVtJpV26mLO6+fQ7OwTqc0b51oPMRrG3NcAq/san+Vk29m3AjqSw
 5oG6EBU8FHK9Uil2bGk17J60tm6bcZcHFnuyziQ8EntwFOZWoiopkXqSgplygaGViNTI
 LKIOZglDl3hiSz8OiJLP7057iRGtneqm5RR1mEn0whL87zOHwXd/Nk1NQih0Pn0C1Mlk
 fdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=dapPdIq4NKdTh83FqnhWp0jd26+pQIFL0Exxw5JzCR8=;
 b=KRm8Sw1NLBzBbkyLHxH3chDLSyanM5cr2TskZnNdwOVD0Oq783clWkKxp5PiJ4qSzJ
 9k1IMaP2jHMTICZEfHWq9BgN2uSdH/6OL6+mO91MoEuyW5LaHx5GUCQ/v1NSqo2XNDGA
 Nr2pgGMerr6loFd2BPX+kP9wfDwrTtN+yY6jcjchpNM7GEUUmnD3jhwz+628QNpuZ4L2
 AjTrOynmkE9LGxw4yp5KUsjrHcwjX9jrNI53XqPnW5g1Q1hzF4MeqnzfSKKduG2KK/oI
 AMSEcet9YghqYuJJd28oZhYs/mHpsji++x+rI0bch74/qCUkajlQWv9K+wR5XtzqsdZZ
 fxzw==
X-Gm-Message-State: AJcUukeyfvaGIYjxGqzX6C2Gi8cNq8e+SVn0+ikTIzJKu4gmb3bbUfpT
 QqBbjNcqcfcvpk4A1k/0+dDzYTvmctQ=
X-Google-Smtp-Source: ALg8bN5INRrfwIN7FYvGklwMugKzphGmDxv32z6zCKDkr9zI9EirpQLrlby0YwCSYEzfJ/yYPjXt/Q==
X-Received: by 2002:a6b:b443:: with SMTP id d64mr2954767iof.227.1545431657200; 
 Fri, 21 Dec 2018 14:34:17 -0800 (PST)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 c21sm10987266iob.22.2018.12.21.14.34.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Dec 2018 14:34:16 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Fri, 21 Dec 2018 14:34:15 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [PATCH] RISC-V: defconfig: Enable Generic PCIE by default
In-Reply-To: <c51c125f40a12a3afdd8272bbbf0670673a15349.camel@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1812211433290.777@viisi.sifive.com>
References: <20181221190615.19003-1-alistair.francis@wdc.com>
 <alpine.DEB.2.21.9999.1812211110260.777@viisi.sifive.com>
 <541e8b85bc2d3010741daadddc71ada52b847b8f.camel@wdc.com>
 <alpine.DEB.2.21.9999.1812211124180.777@viisi.sifive.com>
 <c51c125f40a12a3afdd8272bbbf0670673a15349.camel@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181221_143430_252029_143C8EC6 
X-CRM114-Status: GOOD (  13.85  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On Fri, 21 Dec 2018, Alistair Francis wrote:

> On Fri, 2018-12-21 at 11:27 -0800, Paul Walmsley wrote:
> > On Fri, 21 Dec 2018, Alistair Francis wrote:
> > 
> > > When the MicroSemi driver does eventually go upstream this will
> > > probably have to be discussed though as either the config or device
> > > tree will need to be edited to ensure only one PCIe device is
> > > present.
> > 
> > The right way to do that is to have two separate DT files: one for the 
> > HiFive-U board alone; the other for the HiFive-U plus the expansion 
> > board combo.  There shouldn't be any problems with keeping both 
> > drivers enabled in the defconfig.
> 
> Agreed, the only problem is that the device tree comes from the boards
> firmware at the moment.

The switchover is in progress:

https://lore.kernel.org/linux-riscv/41dac7a1-3f66-6a3f-8a68-206688e5bd9e@sifive.com/T/#t


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
