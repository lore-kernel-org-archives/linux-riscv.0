Return-Path: <SRS0=1C2h=O6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E1CC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Dec 2018 19:13:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBD4121928
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Dec 2018 19:13:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I2eQtOQK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SYRvioeC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBD4121928
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ygMXkWfVQOV23pbf/rcyRgjj5GvicYtApnmVOreSAew=; b=I2eQtOQKOgeGzM
	nywhviSLkH02+u9EhDbWAmgflUIhxnoJOI2DGEQeB+HTHkb3Kg4N7dZVIlby925RBbRgeXB+l1UsJ
	weYni1d75GhkGU6Bv/7YUn3MfGKM8PNDu+PFkacVCh0ZMv4eAzIRrr9O75fy8t3M8dqA0Eut9TIRr
	s+qqe32J25+0TAKjvJ0ojtowYLe8fTgYjvKYWvHGsmPoGmtaTRV3aM3OnUlDPZ6rS4IA/EH5lTvhl
	wYQnRpcRjTyKOaEa8R6q3ZRZkwVLznwYAzKIRnWqjfYttihGLM+2x+E7JQH+J8BP5zJgywruYwxNB
	QmQRu+Gfu6Z3/rSak0Dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gaQFA-00072R-H6; Fri, 21 Dec 2018 19:13:56 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaQF8-00071Z-2x
 for linux-riscv@lists.infradead.org; Fri, 21 Dec 2018 19:13:55 +0000
Received: by mail-it1-x143.google.com with SMTP id g76so8411303itg.2
 for <linux-riscv@lists.infradead.org>; Fri, 21 Dec 2018 11:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=j2oAUt4jyL6e37+Xbe+JP//F9OOKtUzFXnNxZVSuIEc=;
 b=SYRvioeCOHSqQdroUeSCNlhNj23L9EU68HxCBxen2jDNlUPLHe9EtjIq6tY28LtLV8
 ars/vw3fVO4E9ptp/OI+8FDblbD0xp8FSyCl17fjZZBsCgqu8JhAPG87p6eN7VYfWHZ8
 Fhe6C2hliVZmo7Pic8WvvkUb56vhRPcwR9XKeAxentdRATB6SbmhkuT5T9rqLOmqpIz4
 HLRjwxMwWENJrkJhlUsT7dXlvKQ1pdhKZV/beBFuLt2bnHdta3A6UP7CaExVq+HoXJKv
 ctHUFUjgvQEnpIm+o+IIgaUaMoFhY2jWxU/ENJWEk/muEHfWPsw9IhiLb+YjuqGW4kHO
 dXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=j2oAUt4jyL6e37+Xbe+JP//F9OOKtUzFXnNxZVSuIEc=;
 b=NnK5BdbrWv+tYYor04bRRVZZO9xK3owpOdUxoyH4C7Zq0xEQbBmJ0sWkCttzKMZM23
 Gimm8j8D8o+Ed4NlsaJ2YhgwQDm6doq1dnGQlqWS7iV4uJXTZcEIKQKYOZRvHQn+WvhU
 Ugk7IGsPJqF1v5KfClcX8lGpU5WgQBixt2aJkhYbve3c5rURcapfe/lzmNWdhtKpSyYI
 8ckWsW43bp93OMw8SsxG1+rKyICKGPFZH8GYoZum1IE32pe2Ov9ur5vb4gYbaGO0/Ce9
 2xQz/NEaaW6IjTHgD7UexAhAbvCiPFQ4+vHMg/LJMrak2jwNjbjBSxU84TDaLbXOd6yg
 ZRgA==
X-Gm-Message-State: AA+aEWZ+mYwyax+cSHMo7kMpTQqP9GzVANRgOplElPUXiDKFvcGuiyfV
 iSiL/kjlHvMOVZnspl2ikvAHoaPYJeA=
X-Google-Smtp-Source: AFSGD/XOUbC+fklxz9aFaTEUJi7KXttkYU9LHbXJgdEi9NwNREdsCnB5BHM5zK45C328S8rmWMYV3Q==
X-Received: by 2002:a24:41aa:: with SMTP id b42mr2677320itd.148.1545419622477; 
 Fri, 21 Dec 2018 11:13:42 -0800 (PST)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 g186sm6420614ite.39.2018.12.21.11.13.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Dec 2018 11:13:41 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Fri, 21 Dec 2018 11:13:41 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [PATCH] RISC-V: defconfig: Enable Generic PCIE by default
In-Reply-To: <20181221190615.19003-1-alistair.francis@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1812211110260.777@viisi.sifive.com>
References: <20181221190615.19003-1-alistair.francis@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181221_111354_144969_3BDAF4A3 
X-CRM114-Status: UNSURE (   9.22  )
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
 "Palmpalmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Alistair,

On Fri, 21 Dec 2018, Alistair Francis wrote:

> Enable generic PCIe by default in the RISC-V defconfig, this allows us
> to use QEMU's PCIe support out of the box. Also remove the Xilinx PCIe
> support by default as this is rarely used and conflicts with the more
> commonly used (out of tree) MicroSemi PCIe root complex.

There are many folks working on FPGAs who use the Xilinx driver.

Also, we should not remove support for an in-tree driver because an 
out-of-tree driver conflicts.  The right approach is to get the 
out-of-tree driver upstream.

Enabling general support for PCIe in the defconfig should be fine, though.


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
