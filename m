Return-Path: <SRS0=Dg2R=O7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C74C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 22 Dec 2018 00:25:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FD392190A
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 22 Dec 2018 00:25:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vDibbOKu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LIj2hCrD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FD392190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBG1jQ4jjNKfAI9v7avi2NFCU+RXq7yb2YoIyPzEj5M=; b=vDibbOKuXRCEbD
	F/Kv5zhg4C3i9Y4X093kwFvGxo2ORha8XASwT6Ju5OeWUD/+19aQ5O2hm0ctbSltu4icLByoPkahn
	xRDT7zNoRLaBW7LXwx3sl/8SM50B+kJdhbmXNVwAP6Pva/HGZnAXzoUwUFAzyFh3TbTxUYnnGxgPa
	TCR/KImpc92jQ0ICPdCdtzJIs+hv7KKOrcOKh8ip65NKCajSNjw/1q5d+aapcGu8qg9dwFCXwssnv
	pJfduqY+qko4siR8OUa8iHrCnz6pX4404UMArekvTFtLX0ryviX9m2qFpHiAU3WTs9gK1GxoX+m42
	40VlWn8VzcHIN+3jmeYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gaV6z-0002Qr-N9; Sat, 22 Dec 2018 00:25:49 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaV6x-0002Pr-5v
 for linux-riscv@lists.infradead.org; Sat, 22 Dec 2018 00:25:48 +0000
Received: by mail-it1-x141.google.com with SMTP id g76so9431801itg.2
 for <linux-riscv@lists.infradead.org>; Fri, 21 Dec 2018 16:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=iT/tXq7UPR5qw5hExf6QS7jdNfGxlfSoq52Q8RIOUNc=;
 b=LIj2hCrDP6kJVThG+aUUG8nIEttg8iaRK54iuZHLStxdil5+ThTPyWUK6zK4MpONiZ
 qd3Jr7NaR4mQYWezaLjOgOfWQgEJ8kyk4OfzZLoL/rPs9vKEAzeuxMkQeYx9VRdeuHU7
 kkVxlE/Vo/KL/rHl2qTxKQLSstm9LK36wFPFCFcTlJlWbfRurlVMcQzxv01+k4EZQcJL
 CbDgHg/oHS0YDHkiAqWgoqKYKOahIYm8z67omrRi40FaNQupEq0pVGftDD4G9RP4g4JL
 QpZpTN32Lg4zmW/zG/DX4df5D++Co3ojIAfmD3Q77NPZ4Q6cppOdAItJHti5MuzB2J51
 bgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=iT/tXq7UPR5qw5hExf6QS7jdNfGxlfSoq52Q8RIOUNc=;
 b=ABXKul6S/51K8MYOqbVUXDK7mGtpsPnz/LhkuCOZynTyLy25qh/juG9seRe+0zJbD9
 FDsjZfP8qkxgcy9W0kmsMU88bx5Y43n9LRcdsB1KMmDs5XIOe6U6hn+29bSMdGfVMjsu
 7mzwnokypdLAR/tsrgyATBCR2C+xMJJMcUUvZDwo7wM3yaRz06Q6krVP+CwLKe8o1poh
 JDny1+yrDAuzJDJ2xj94Uj89vdU940xuQy7ECBTUkruXJEBpCBJPIxfektVyOyGHtFmA
 gklJMP9yYicMCH8K/xnoPZUuc7yG+BH+SjLJMOEkASz6kkEZrv6QZObZElDEgtm9wj7s
 mPHA==
X-Gm-Message-State: AA+aEWbNIQZkIEGHvComYsiFLbCOFYgB+6gkqRhhmGyT/qHkgSf7ZRqw
 C9rUFIEYS8Xtqgzzwn/frrKBeg==
X-Google-Smtp-Source: ALg8bN44kBLNctfTcjxe1uLUkXINSfWS223kl/nZPk2Xv+5Zq2grXUyU2Y1od0ZfnzMVEDjSf8TflQ==
X-Received: by 2002:a24:7094:: with SMTP id f142mr3403994itc.90.1545438335644; 
 Fri, 21 Dec 2018 16:25:35 -0800 (PST)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 g21sm1107156itg.44.2018.12.21.16.25.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Dec 2018 16:25:34 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Fri, 21 Dec 2018 16:25:34 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [PATCH v2] RISC-V: defconfig: Enable Generic PCIE by default
In-Reply-To: <20181221220555.13679-1-alistair.francis@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1812211620030.777@viisi.sifive.com>
References: <20181221220555.13679-1-alistair.francis@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181221_162547_225364_9C67BC42 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

(fixed "Palmpalmer" again, might want to check your script for sending 
patches)

On Fri, 21 Dec 2018, Alistair Francis wrote:

> Enable generic PCIe by default in the RISC-V defconfig, this allows us
> to use QEMU's PCIe support out of the box.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks for updating this.  

I tried applying it against v4.20-rc7 and running "make savedefconfig", 
and there is a delta.  It is better if there is no delta.  Is this patch 
based on a different commit?  Or, is this patch not the product of "make 
savedefconfig"?   If the latter, please do:

make savedefconfig
cp defconfig arch/riscv/configs/defconfig

to clean up the diff.

thanks

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
