Return-Path: <SRS0=iNPO=YY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D294CA9ECB
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2019 23:55:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54356208CB
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2019 23:55:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FOXdWI3w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="l3C/2pCp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54356208CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wncx69WZSmu110dEOFX7cUwuslz7GGF2YEzxc6FbcUY=; b=FOXdWI3wNC8MEd
	aGkSmr2WQcFuHO1AobGTrq89q0DoE3bwhrpYGSUe5Uez/wx2++KKpDTES+nIV+f/LKHZZQBUACL7x
	pXQYpzlFWRBOFp2i2RXoWqKQt0jDv5FU8+cQOTsiYT1icZPgVbQ4dNNauS7mM9uZCsQR68gKJheSy
	p3Lr7kN1VZsrYUw7PwfZZ1+fEev6EoAr+tkFrb+hTVDkdjLgsUOxDKJzbykdM55QiwVgasNQFjK3Q
	oJ50aH1RBw3Af2DhzcyHk1fBjE5MTjF3t55n9FGBaAUO+qCEtuJCwbGwLGhToZqfhdMuaxUB0jBga
	kQX5rHYpkjg7Xle8T1kQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQKHb-0000rC-Vz; Thu, 31 Oct 2019 23:55:15 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQKHZ-0000qC-8s
 for linux-riscv@lists.infradead.org; Thu, 31 Oct 2019 23:55:14 +0000
Received: by mail-il1-x142.google.com with SMTP id p8so7182312ilp.2
 for <linux-riscv@lists.infradead.org>; Thu, 31 Oct 2019 16:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=N5iHmlILXRbEi8EN+IUZsNyE4Ymf/VB8PmWy2Y78vP4=;
 b=l3C/2pCpaeuyWCknJRQnTKh6SlFTtCYRDRLdQ4KxJW12S9T67ROtFv1XDnteZ4c6pe
 RZMawNLPTzAJdVH58ytBFB8FjbdKER6jaVf5hBD+ZXfWPrsCt1kaeHn/kqbSdzn5G+se
 TdxXO9hz4JV8xcaq6VxA1HMHYCylImZ31fpFBx0xs1ELH7sKeePIMh9PWet8fYYcCLfr
 aNgGL3OwXekCBs5EMg/PVpVO3kZ9TLhOYd7Jm/hhnclYSHU1wCDDZhCzqM0WSDWYZg7e
 Ukv3noUisj0/t0pGlqjaNpbHhfvixS4ZMc9xkaIBaAhfDFKGbMMjAHyTcQaT4wvUMZDC
 Uvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=N5iHmlILXRbEi8EN+IUZsNyE4Ymf/VB8PmWy2Y78vP4=;
 b=eI+6peOIssUD7uXWUZrOpKW5kqN0lbZn7IZE6/TfZshUv0vd0HYRrwo32DRRucwqGw
 vyA0+t3Rtf8IMDi+dpsAOh0wrdD9/GFVR6k0nvpr4dhW0i7VpjfZcnr5cgiP5c8m0luD
 EcKuhBO1I0n1MBHv97KYhHut/nrNbdZCSw2Z1lmDZiHjU3uJ5lLmAj13imEh6b/3XMMZ
 avzVNwgz4y1PzTMus8/bgVdBTYWHq+GdzFhHxg9DYCsmtS7MNpIyKysQozbWgGGekWg2
 uh5nazj5QcChaGQTLzHNKClEWmS29Wtgv5/1e0mKH1W3yxotdiFkVvycJofXYuVZ/68P
 4P1g==
X-Gm-Message-State: APjAAAWpnaMXJMsIF1Zvh//qwCLD4CEZoW/3oefMlEJ0fZV8wYA4vtmO
 cn4Zfkopkv3TYl13JfsnT6x6aA==
X-Google-Smtp-Source: APXvYqxU4quf2N5vI+TJ+4eYesycO5XewOnq4v3en4F2cHPBfEh+mUIkSI/bOsMbiXzuQTLUnrWjQQ==
X-Received: by 2002:a92:5c5d:: with SMTP id q90mr9702452ilb.22.1572566111105; 
 Thu, 31 Oct 2019 16:55:11 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id g13sm494749ion.23.2019.10.31.16.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 16:55:10 -0700 (PDT)
Date: Thu, 31 Oct 2019 16:55:08 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/12] riscv: poison SBI calls for M-mode
In-Reply-To: <20191028121043.22934-4-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1910311654570.25874@viisi.sifive.com>
References: <20191028121043.22934-1-hch@lst.de>
 <20191028121043.22934-4-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_165513_379048_918DE637 
X-CRM114-Status: UNSURE (   6.96  )
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
Cc: Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 28 Oct 2019, Christoph Hellwig wrote:

> There is no SBI when we run in M-mode, so fail the compile for any code
> trying to use SBI calls.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks, queued for v5.5-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
