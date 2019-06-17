Return-Path: <SRS0=4kCy=UQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3076FC31E57
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 13:34:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 021F6206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 13:34:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lnln4nfq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iiyPz4/u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 021F6206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/hKDExrTDJr6iUbA3ZtTjUiODDjLpGYcruaqwVpzUk=; b=Lnln4nfqb6C1vf
	rUwK6mslzNJkB84HCfXKYUuoIX+LbmAwr+ftgyDm9G9uI3IqyulqmVMo3RepX9W+ZbQ5D8VV877b1
	CTKctpmG26QhMdPhrFhjLu29yKQbQzj1Co/l+iLsH/l/PXQnqEMStZJJWKusDDVNrkzPavPG2GETe
	MOntihqYCD7xJKpWgm73knZLDpWe5C8zzWu8kGHlgNVPeLjYaXABia+zuxMajse752fZeOuifsxX6
	F465JpZzNZ2NsWyrr7y+gAmB4Jvkc4akmtLhQlLv0OzuH6Wya2+POQdbTG5fJgYSKx0cnK7xoCkv9
	mXAvUwAKPrWS3YSv5FSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcrmD-00031Z-3D; Mon, 17 Jun 2019 13:34:25 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcrmA-00031I-Dk
 for linux-riscv@lists.infradead.org; Mon, 17 Jun 2019 13:34:23 +0000
Received: by mail-ed1-x541.google.com with SMTP id i11so16249193edq.0
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2019 06:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=29y3Mgtng5aMUJDC4H0qMm2rRqZ9I4Tab60HsoifBKE=;
 b=iiyPz4/urirl6pn41b6+fYYB4+HK+KjFEVg+rcP96Niej9XW8ggbYknVlA9nvjw/Gq
 W7Z/jsyCEdY45CVamvC1Q6gxfEeq8JDC4Zq6lzp9F1M503d5Aid5+MRdLwD7zLnIyAKO
 rhDSU2dBRxFdkviYOder9e1WQXNAC50lAOEcpVn1jDupmrA0xzSGzCzvpFPTQrF80GSl
 UjVVWckuZmLKWAzg4m2y2GSk3bjEUPfIbkh/sWL2u1QeyYSgq54P4KlbH2tg9pTdiupx
 zA5byZAsAicdngREVaKYV7V7FJr7gEnuBhiY4pzJsvvwsS1vtloGd0P9DlM7g3219Hgc
 aDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=29y3Mgtng5aMUJDC4H0qMm2rRqZ9I4Tab60HsoifBKE=;
 b=hcGw5OGr4ClBiVF7VqMMU7jQdciUqePdYilR3o7qshtMK3QXoTB5JczE5nI0lMYS+4
 LT64kSNtN9QKexDegkIQEhni76EnDU9AtC9ry78WtItUNHPLxEwAIXoseAog3z6uFFNP
 u2O4fGtof+PshyuUBLEpVO+wJ+UsjWR0SI63cltkAw3dA0e8Zpfmj3w0d+Rh/WspTBFD
 EOrOjL9Vrrde/BxvfZAcL6mBGkHMu8U5YRq7fIia75G8H6GXfua9NkY+E3KBgZYx1NwA
 kpsgo9G1yaSfx9pH66yt3s4vqLqmJ5IJvuxEYbb+DalVkDRRnbKK+b/tjlKeS7dYb6AU
 0nEQ==
X-Gm-Message-State: APjAAAXL0rqN4OJVMZUkOi6aGCgu4q46frHYX/AVnHQ7YoH9ga/5aGe3
 /2ba+A2b+bHRgtLPny1cGcGH8Q==
X-Google-Smtp-Source: APXvYqx3hw2/cUXjwgExW3X/oUc8Z8K5NIiFF2dS+eLdGSmH21KhxUE5NC7CCNvDNSXVIxx5wAtf7w==
X-Received: by 2002:a50:9f81:: with SMTP id c1mr22631151edf.140.1560778461271; 
 Mon, 17 Jun 2019 06:34:21 -0700 (PDT)
Received: from localhost ([81.92.102.43])
 by smtp.gmail.com with ESMTPSA id q11sm3719648edd.51.2019.06.17.06.34.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 06:34:20 -0700 (PDT)
Date: Mon, 17 Jun 2019 06:34:20 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Andreas Schwab <schwab@suse.de>
Subject: Re: Working device tree for the HifiveU
In-Reply-To: <mvmzhmg49z2.fsf@suse.de>
Message-ID: <alpine.DEB.2.21.9999.1906170633110.32654@viisi.sifive.com>
References: <mvmlfy05xjm.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170347460.19994@viisi.sifive.com>
 <mvm8su05rqc.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170546100.4549@viisi.sifive.com>
 <mvm4l4o5qdd.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170625480.32654@viisi.sifive.com>
 <mvmzhmg49z2.fsf@suse.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_063422_475938_14B70C75 
X-CRM114-Status: UNSURE (   8.49  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 17 Jun 2019, Andreas Schwab wrote:

> On Jun 17 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:
> 
> > We can't add the Ethernet data yet, since it hasn't been approved by the 
> > DT maintainers.  But of course you can always add it yourself to your own 
> > kernel branch, along with the driver.
> 
> Which driver?

This one:

https://lore.kernel.org/linux-riscv/1560745167-9866-3-git-send-email-yash.shah@sifive.com/T/#u

Note that Yash is planning to post a v3 with the CONFIG_MACB_SIFIVE_FU540 
conditional removed.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
