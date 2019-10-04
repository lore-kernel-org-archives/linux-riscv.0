Return-Path: <SRS0=3PXF=X5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6750C4360C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2019 18:26:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A15232084D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2019 18:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="urrI5BBc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NbrR9cDX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A15232084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZQehrW/tm3+bd+qbDbukBHSofXhZZt3M6Esfep+EFo=; b=urrI5BBc5t/BCE
	dxUiLH95Y24NI6ubR4oKf4nM0K2m9dtA8pC9qVecOR+1YOCImEjsxe6BqlmDJqdL9d4xRGb+YFV+a
	P+RDQ+3ynkb2VtTUrWVOJQj33sYPlnYE9ACFA4SdsKVL2zuChhDGkEKDjqEoRELK3XXttXfRKLMKA
	unMs+VolP/84EHxptZSknuwXD+1u1sKFYapnwuYad9nAM0+6n0I1du3D+5h1FLv8isDbpXE1diBJG
	ap/X2s0pBcfGzcnFANncAvrP6hCEa6TU6MHj3XgNO/OZdc5TijCsbj1Nzi82nkGjdEtYFRfFFawtx
	QxXM/qC2qZY3AD5LlePA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGSHU-0001U7-82; Fri, 04 Oct 2019 18:26:20 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGSHR-0001Tg-Ld
 for linux-riscv@lists.infradead.org; Fri, 04 Oct 2019 18:26:18 +0000
Received: by mail-io1-xd42.google.com with SMTP id u8so15613666iom.5
 for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2019 11:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=zZ6KISfo14kOEL5Ieq+NQ6dxv0EXjT7PvLg26kcxeKI=;
 b=NbrR9cDXdXXj8NLCbdZebA/XHymI2ZV8JNrZi82vyS6yNX64HDkBmL3dHU2O9pMZXd
 3LLoGfU/NkijXnsJuEROqNWsrS/DXjNbrPh0ZxItTdN7JNiCTJIdvi6yQJWxD7lgKLga
 3cIEYvmCSebCu1xfIcZiWmgbyh3AEYy58zrQyurM5PTA1ZLsgMRD6tp7BY9nKy0RLb3g
 kBLxjv8BEFrmpOqqIkoLo+D/2i3QRiYMtiUQQt1z0baBpLuXXgSGHnr4ZH9wX88BzFiV
 fRME8q8VKZRI8oi8yZ2MvvHHV6itWhxAVqUh5+bqWGjxTx1xeOvNVUKF1eSv2otoL4LS
 G2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=zZ6KISfo14kOEL5Ieq+NQ6dxv0EXjT7PvLg26kcxeKI=;
 b=ly5mcZ/PLLhWaakU2V7OQD7dUr+wnmXoFhHk5+RMyhuFq6d790L6yw60AyJZKbEGQw
 MYWM21KwUzCcpDkCj8hNPf9ymBSNo9HGWFQ0niRSpl9EZazIPZeiJj3syAgf3q39WrKT
 w4T/uJKvRAgr+rY+E/0thcXtQ1JuMUH0S2GsoDQGrG7P0fyBeNL5HU0zkHsYg39geIUo
 vYEeyxE8Uo7F0Hp2f1VN7BqIDxOkk8hMNvYdAfjqS+OSU3SxAJKKtcENqROh+9/EJpCX
 WCl1GLEeQND1FXr/AnJP1cFVNvQxlE3wW+oa02B+eBCZSe6hSJvi/q77QLGwkvTeyeE9
 bnqg==
X-Gm-Message-State: APjAAAVyS+ffc8hg+Nd1WdzF2DMEp2Xx6yEMkWUfhmc9mS6G97hs//fZ
 zst+thGha2yBgC5MgRUQpN/J/g==
X-Google-Smtp-Source: APXvYqzlMOzXdKo6exiuWQJn4vxBDEZZE+59ZX+HRMzh5GgIqvHwN308u9wUqqNwO23xAYGepTM41Q==
X-Received: by 2002:a02:93e5:: with SMTP id z92mr16325106jah.8.1570213576916; 
 Fri, 04 Oct 2019 11:26:16 -0700 (PDT)
Received: from localhost (67-0-10-3.albq.qwest.net. [67.0.10.3])
 by smtp.gmail.com with ESMTPSA id i18sm3602473ilc.34.2019.10.04.11.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 11:26:16 -0700 (PDT)
Date: Fri, 4 Oct 2019 11:26:15 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [PATCH 1/4] riscv: avoid kernel hangs when trapped in BUG()
In-Reply-To: <1569199517-5884-2-git-send-email-vincent.chen@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1910041126030.15827@viisi.sifive.com>
References: <1569199517-5884-1-git-send-email-vincent.chen@sifive.com>
 <1569199517-5884-2-git-send-email-vincent.chen@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_112617_739118_DA873C78 
X-CRM114-Status: UNSURE (   8.77  )
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
Cc: linux-riscv@lists.infradead.org, palmer@sifive.com,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 23 Sep 2019, Vincent Chen wrote:

> When the CONFIG_GENERIC_BUG is disabled by disabling CONFIG_BUG, if a
> kernel thread is trapped by BUG(), the whole system will be in the
> loop that infinitely handles the ebreak exception instead of entering the
> die function. To fix this problem, the do_trap_break() will always call
> the die() to deal with the break exception as the type of break is
> BUG_TRAP_TYPE_BUG.
> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

Thanks, queued for v5.4-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
