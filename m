Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD62C52D7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 23:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Svl/S2lf+2aXxN0rlqRcnl+mo5qfxlJ13w71owquu3s=; b=n/ZIwFtQtBuI+D2yxn+6HR4yMJ
	Tk/YWLfsX6OblKifdFGykSPI80dWm4GsAXwQaBQcYx3stgpqIozTTYqfS8CAKCmsiFHumaOPoUSpe
	pH0rNwhx0BakHvx4I/8KzEnszDfjwiPvJ14NSidywIO3gLMtPtBzupEiIJkmlm2Uh3+vzn6HtLCuj
	NtUTP6bseK9qosR49ygBzihHuXI9Jg4Gy+7kRpDdxnrC2jFaCyUdy/tQW8e4Zhwvdx71DJNabFoD5
	wTNLbJbuAnPagTXNSwgKq5Cozy4RhuM/rjCMI4nrFIjnaoBsTpzH5IQV6D+yrxK3ocSA9zvriiR2h
	io29B8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sejYn-0000000BGPE-29D4;
	Thu, 15 Aug 2024 23:07:13 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sejWJ-0000000BFpd-0tl3
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 23:04:41 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7afd1aeac83so1741774a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 16:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1723763078; x=1724367878; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iX+LsvVh+pS0eXJpm+RAssvfTKz+ILUKR5VgTsl+lRY=;
        b=wlekwLlxpxZAF8AMG57Niy+sP5p+n74pH2Qkm3zhp2gNE2RX8rP0guLMKF+bhC48gC
         UBvC2T5FKWOHGrokLlIwwAEsZGE3QVcHOxLS4v+75YZZ4RAl1W6UYCpDsiGpvLL6uL+T
         2w0kjbwr70536NVBuHnsMxgRBCC2zsJ6RlToXO9yoDu8LfmPIXhD+03QVUycryRDgEM5
         NWQL8AHpR1M81bmP2Ugne0QyTnvf9h2sJsbHrAsypvReg0ngGmWK0AEauYnC5GlT+5Hs
         Ji+s144Vviy+wqC1iH9vFM6IV4d2oxufnJGwvERlOeYxzE/RhO04Eb7YNmoqf9HFQ1bA
         Oofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723763078; x=1724367878;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iX+LsvVh+pS0eXJpm+RAssvfTKz+ILUKR5VgTsl+lRY=;
        b=qDObSig/pjAq8IYHKV0wFetwZLCRyyMRZvnPdcLjmZI+AMIAs5UeGZYd06XB8eWVTP
         /QHg4uPnhG+mtPHHSLXMnC7U/d/zs1vND8RQOpsYjN2WZStS0FHrt8IoU8eQpheJSkc3
         un5RKnB7euQnRI8E7KoCUjcfK6bPtHGhmfbt8kLJdqVchuHu6YftbRBrSPwCfsDaB2Ll
         wTbn69LmFQEiDdLTtIoQ3wI71UAJU9XSnGo95wInJKQAdYLr1bvAagZj5dW2YtPEewwj
         Gfrd0aOZmOrGeoZSTmz3Xmt3nFgiOF0viloeXrfxXG6D5ooTT/5hOudRgTTom/befA3H
         jItw==
X-Forwarded-Encrypted: i=1; AJvYcCX/9dJAJIlWBovF5/jKzDMQJgnxsIG+OPv0QibJvU86S8PwrK+yyqDQdf8o0s7H/DHsDvTjTlE/wfo1mhl7hI/HBdgrYYCl5qNDKuRntEAP
X-Gm-Message-State: AOJu0YxSVfZbuykrX35eNQOxWM/ZP0s0BR5Vot7n3ro2bMXRcwOM2U9r
	h8Q0dN5X8fSeCUn6DrKnD7C9qofVIznxSDxFcafj55ZoK/RFDga80ij2KShH2Ls=
X-Google-Smtp-Source: AGHT+IFhxZ7NAK3s2WpweiweY2yeckuFL2Dz8Wu4zsfzGp3owFSCW3UI/IA1hRZ30CcIlSfJ7C9y2A==
X-Received: by 2002:a17:90a:b00a:b0:2c9:6d45:8187 with SMTP id 98e67ed59e1d1-2d3c3a919b5mr6378489a91.21.1723763078062;
        Thu, 15 Aug 2024 16:04:38 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e2f633absm380677a91.23.2024.08.15.16.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 16:04:37 -0700 (PDT)
Date: Thu, 15 Aug 2024 16:04:37 -0700 (PDT)
X-Google-Original-Date: Thu, 15 Aug 2024 16:04:35 PDT (-0700)
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
In-Reply-To: <8734n5mzce.ffs@tglx>
CC: Renner Berthing <emil.renner.berthing@canonical.com>,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, apatel@ventanamicro.com,
  Paul Walmsley <paul.walmsley@sifive.com>, samuel.holland@sifive.com, aou@eecs.berkeley.edu, daniel.lezcano@linaro.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tglx@linutronix.de
Message-ID: <mhng-ab233e0e-973b-47d2-b0ca-4675f7967977@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_160439_523535_B87F3D2F 
X-CRM114-Status: GOOD (  18.94  )
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

On Thu, 15 Aug 2024 11:10:25 PDT (-0700), tglx@linutronix.de wrote:
> On Thu, Aug 15 2024 at 10:51, Palmer Dabbelt wrote:
>> On Wed, 14 Aug 2024 10:30:48 PDT (-0700), tglx@linutronix.de wrote:
>>> I'm very much inclined to take the reverts right now, send them to Linus
>>> for -rc5 tagged with cc: stable and ignore/nak any irqchip related riscv
>>> patches until the next merge window is over.
>>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> if you want to take the revert.
>
> I'm happy to wait a week and see whether someone gets that CLINT hack
> working or as I suggested the D1 PLIC early probe quirk.
>
>> IIUC the patch above doesn't actually fix it, that's what led to just
>> sending the reverts -- at least reverts are better than breaking users.
>> I'll post over there too...
>
> Right. We figured that out by now :)
>
>> And it's no big deal if we're in the doghouse for a bit.  Regressions
>> should get fixed faster than this, so we deserve it.
>
> For a week I consider you probationers :)

Works for me ;)

>> Probably also another sign we're way too focused on getting new features
>> merged, as that's coming at the expense of making existing platforms
>> work.  IMO we've been way too focused on getting support for specs that
>> don't even have implementations, and not enough on building real working
>> systems.
>
> RISCV is not alone with that. This whole industry is nuts about features
> and forgets the stuff what matters.
>
> Thanks,
>
>         tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
