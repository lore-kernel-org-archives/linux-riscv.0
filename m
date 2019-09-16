Return-Path: <SRS0=O4lQ=XL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67306C49ED7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2019 10:21:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38C3E206C2
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2019 10:21:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bSkkV0HK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lU3fehKz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38C3E206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SXkzDfzSy1+fCiJv+1fAoOEaLCHXzqvVDQjO43Fqk8=; b=bSkkV0HK46y0Y6
	Gh3+jH7q7nDqr09p49FZxStNQwue927T6klslS423Qv/mNTZdlPPz1+1dMUvnaEwaX+/uwWRfZvk+
	3+Y1Q/Wi+aTmRFW7ZmNkSHIuhEmDxNUrSrZ9NFJ5tv8ACmY5TCTF6lOFgzXpwZnUWx26+CCEbL6F1
	BSEe9bC6Dhz6IV/JyfrIZ1oOR+4TVyIeqkmCydkXAswWxMoDEGq/GKWdD9IUXrl8pWk9W69cocQk5
	1Xx1BCTjhN5SVQ0yYkW4aWiUyl7tjESSudGtfp5a5ZhwKpBgxATocX3nXHgASFWiuMuuM4FzoSSat
	ZDPMQGEChdYJi2UrNF+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9o8B-0000nY-Cw; Mon, 16 Sep 2019 10:21:15 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9o87-0000mo-PK
 for linux-riscv@lists.infradead.org; Mon, 16 Sep 2019 10:21:13 +0000
Received: by mail-wm1-x344.google.com with SMTP id r195so9599526wme.2
 for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2019 03:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=s8jNMO99LalgIB0MNN5n8ucLI6Yy712UQYizzmnW3WM=;
 b=lU3fehKz5Rq4X9MmWZdW0i8qsX0bulnAdihulOyBBydleMItW3OD2SAcjI594gFSyn
 mlkqBfaGmUHStfoK/330byFtNFjOBKYek4XrcO7r7O2rHY9ayeFhesnGctcLaa0jj0Yy
 PQWoHRAcxSWd+qu1T/odVdmLosyOzTPOQQ6CS0Pe2zJDSTHBp2oIhdv+us1lQIyC3h8n
 tpWXIioy84lYoFWX/kfil+rO6lq3d1Hc8dbM+BSEN3y6vd4yEAb3Hx/sKS4GL8WxqrUU
 Kdvt9vfjfAE0eO1nsh8eHNO6zqQOzK/9CuG0kmqDMpJoY5TihNO2jSPhc5DlDsCRNWhi
 hxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=s8jNMO99LalgIB0MNN5n8ucLI6Yy712UQYizzmnW3WM=;
 b=Gw0qpxdx4DlYzIuO8ZRgAS+enIvxaobUZCVsmjqKQojGyHhhHwIB7FaXNxa2p7phRr
 ULWvyYgNhfn6t6/pzJeHx0jgf4i/G08IK+O0DGXPs5+qbjUhYEQ158Ze7RyRm/seOqDE
 I138zOAXRkOc6X2vHuJvT7m7GR/z7mNEH5GQn85Tk8S2aLPeGF86dOabThyqq39g+rKL
 arQUhHOmbJpaMWzJwHOSRg1soQuaxvm/iHcjsK3aKCYjzz5h26UthYHqhEts/vzSYQqq
 hPL/7UdTFImLWwUPZ58CRuPvkuH5rWK+thfFRDDnyv7k45OtX+Lg4pMgGDOH8AMAeLat
 7aFg==
X-Gm-Message-State: APjAAAX3CbxqqU0/ipkedzg9s8UcFXOFCxDBepxTWVIV/pp4uXyIHsVo
 AqycVssb3oRu+sXKMnCzH9/XXg==
X-Google-Smtp-Source: APXvYqzsTu55mbfMPQKaK1c0o/x2N47IuQtcU2zQuc6VY5VF1h0PhASxZpXnGQ9FqoBFF5/LJP04VQ==
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr13024512wml.157.1568629267100; 
 Mon, 16 Sep 2019 03:21:07 -0700 (PDT)
Received: from localhost ([195.200.173.126])
 by smtp.gmail.com with ESMTPSA id a7sm43545756wra.43.2019.09.16.03.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 03:21:06 -0700 (PDT)
Date: Mon, 16 Sep 2019 03:21:05 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] serial/sifive: select SERIAL_EARLYCON
In-Reply-To: <20190910055923.28384-1-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1909160320540.9917@viisi.sifive.com>
References: <20190910055923.28384-1-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_032111_852040_2E2254A8 
X-CRM114-Status: UNSURE (   6.56  )
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
Cc: gregkh@linuxfoundation.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 10 Sep 2019, Christoph Hellwig wrote:

> The sifive serial driver implements earlycon support, but unless
> another driver is built in that supports earlycon support it won't
> be usable.  Explicitly select SERIAL_EARLYCON instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
