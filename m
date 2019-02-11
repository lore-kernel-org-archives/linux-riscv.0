Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F482C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 19:55:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D07EA218AD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 19:55:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NdKY4MH2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KgIKmN2c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D07EA218AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=aqPW6t66LRHN6AO2L4uhGM2rMmQA/UcF/DFapIDcXRo=; b=NdKY4MH2CrbOEXAy0YYfLCDll
	A1vYp5nhkiH+avwAd+tzjzm5qwZd3c6Wk0kaN7CABdodt4KBUBoLP1PUkHIkWuVQx+/Q5dF6Ahdqq
	y3WQpDtbfirPr9I3Q3s3SXdosnDC9YjhfOawZqGm+uSiU7nnN3px1IuNYQ95rZxarUb0N/DFQy1nU
	M+VT4DG/qCWKGs7cW69NJSPUzkGgeN3Xs4qv/ssbAFSHXvy8Lc4sMz9+I9EovZMWItwcIL7aLB2FL
	5h9oaVRJePhqCRAiNPljcbJv0CvXE7ndJk4jp7XXEIeBdMI3FQIS3APRuAqWjuPeYo9bD/pP+E8kE
	USFol574A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtHfc-0007gy-7V; Mon, 11 Feb 2019 19:55:12 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtHfM-000787-Uc
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 19:54:58 +0000
Received: by mail-pf1-x42f.google.com with SMTP id f132so57395pfa.6
 for <linux-riscv@lists.infradead.org>; Mon, 11 Feb 2019 11:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=WBWCiv+kZ4xqppj1XFi5RNxWwkyMUd90J0z0vH71iho=;
 b=KgIKmN2cqY458t8dWH+ym2aikrA6eaJk5aAzs5BGSMs0UMMA91WjwgY60DjUGi9qUl
 MFZFV1MMMiNwc7UZ/8P6JcD4ufIv6DjsEnb/Dg5w2s2ekHuuR7WW/D8z0xDy1OyMUUgT
 0HJINelcipdyTOEAn/3gVBt4btb9v1jEPu0vA5XmZjMeG3xN+6PH7/scAjEi5SY9Eo1k
 VoiSA0VqvcG+JZlLfN65cc+NF/Vs6ZMeMaDqd6LTXdJAfoKmc1zwGgEUT7X9roYdhFEh
 +pPMQrMZqXzZyLI603vghHkOOk6z521gLsGQi8HKc+zRGUufb+ZpcbBSl9fd/5xqVH7k
 vJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=WBWCiv+kZ4xqppj1XFi5RNxWwkyMUd90J0z0vH71iho=;
 b=ofvsHKj59/EIgFu0NBFz596z7fbS66wFNq/TP5F0aXSZzqh9rygpGzrQVIEsAIz3Ms
 dXEPwGn9jAjAvwFGs5bYVyJjBEGf9wxU16/kE33EC36MkEnqrdmTY7/6I7EURxFY8DSl
 phRUkKEyY1Jlu0Q6V5MeGiOsX15ma3fcHL+w7CpfXcGMJ7NLP9o4Ve/rMRU2Y/jMNozM
 7Bf3UuZTUtrRHKtXGcjFrMhT2Tv9ubfUy78RrEDJfUjp/BeHW8l+6LvS0TDuPUgl46Ks
 s3JxWpyBq4Q9CZQAJ3fjM3zcboe4v5YwU2iFB3kL53jd5rzf6RDoVHBT0uRl191aNJzZ
 Ex+A==
X-Gm-Message-State: AHQUAubz1TBIpeEWAGPVgkOm0an6EpIGmVdFd7b4LY8E1KJ/eJUHx//z
 2iWC6G7GXlOsKKq57xa82AYdow==
X-Google-Smtp-Source: AHgI3IYh+atfV0r0modIVvj2Vw6ZS4jyU0erUEmNBdpd9Hcp5MMyWgfnYCJ3VM/WSHf+G8ru+NRCig==
X-Received: by 2002:a63:df50:: with SMTP id h16mr14287644pgj.421.1549914896090; 
 Mon, 11 Feb 2019 11:54:56 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 128sm18391827pfu.129.2019.02.11.11.54.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Feb 2019 11:54:55 -0800 (PST)
Date: Mon, 11 Feb 2019 11:54:55 -0800 (PST)
X-Google-Original-Date: Mon, 11 Feb 2019 11:52:39 PST (-0800)
Subject: Re: kernel after 5.0-rc2 may not boot using BBL
In-Reply-To: <20190211082506.GA13103@infradead.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-5eccb799-c5da-4bfe-ac1f-b8d0aaa5b1fc@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_115457_010136_1EDF16AA 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: anup@brainfault.org, Anup.Patel@wdc.com,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com, schwab@suse.de,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 11 Feb 2019 00:25:06 PST (-0800), Christoph Hellwig wrote:
> On Sat, Feb 09, 2019 at 09:00:27AM +0530, Anup Patel wrote:
>> IMHO, best solution would be to use mature open-source bootloader as
>> payload (i.e. U-Boot or similar) and always boot Linux from bootloader. Using
>> Linux as BBL/OpenSBI payload can still continue to exist but it can be more
>> of a developer usage.
>
> Yes, that is a good long term plan.  But in the meantime we should not
> gratiously break the precious setups people got working..

I agree.  I don't think anyone wants to move away from BBL more than I do, and 
while the OpenSBI+u-boot stuff is progressing well we can't just instantly 
deprecate every other boot flow -- particularly not the one that I use :).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
