Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB07CF8854
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 17:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zNmDY4Ayh3SA7fTtm8YSbk/Km9vSCX4/DtVm3fcrGo=; b=E9Re1KTCq8p+TZ
	ZcSP87BQMv1+aABgvPVtfEoluGwI17XUDwOOcau0fzv+MVBFDJKHWl4vtlOEV/Upu0Fbvf1TSbQvp
	TwB2cZKekEGVgbc3vOnSAl2l4YZb1aOE3DpEEuVCJ8NFNbaD0K5ga6UNn2l4A5heMtWfRvyofBuyc
	C6cCyg5aVabYmi1qs03PiBWBV92DWRqKj9zyh+DevTiLJjV1YyHaFLJkEmsTMjoEZ9/csVTtxarSK
	arpJo5es5YaW2v0B6EYu33qPOS8kZrV2DwPGWEQA0yRD9USsJqGmRq3zcRbduoRWP0RwxydALRoKW
	89OuNq8Bua0ZnIxzzW7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swmXU-0000000DbFj-2ZOV;
	Fri, 04 Oct 2024 17:56:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swmXS-0000000DbFC-00su
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 17:56:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92833A44C40;
	Fri,  4 Oct 2024 17:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D5BC4CEC6;
	Fri,  4 Oct 2024 17:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728064584;
	bh=vxJsSscfbkhGfqh/a1LftC8GagvzaxuC7AKK0WsARrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QN2j9NzwihP8e5kTgemkYpDRjSqBnRuTGr/yTnNdce7nYr6rQBjAS76uHE5d3nWUE
	 JdKCWQ4cTTC3RQcrItXG2MdWY7lQzGfzMy/R2pM/Ln/hcaiyJrjlC08MhYva9MgWfp
	 x/+qQn8zOLw4LknyYJSYNIQZx6gQxbHpv+INnqBb+ft34oL8nfPbBfjtFxl6B2wGKd
	 6bYzxvljhKYLoPnGfketL+CK/3thYsBJqZu2PPCUUxx+HMLllNKIrfpYCEhlC7IS0f
	 oCkOJ/n2HKQD20ptXkVUv8R9N5CETcuRZW5NvE8gDS1ZJfzuFCEKuzEIDT+XE9eYXB
	 Uz8JaWYhrwaeg==
Date: Fri, 4 Oct 2024 10:56:21 -0700
From: Kees Cook <kees@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Jason Montleon <jmontleo@redhat.com>, linux-hardening@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-riscv@lists.infradead.org
Subject: Re: [REGRESSION][BISECTED] Cannot boot Lichee Pi 4A with
 FORTIFY_SOURCE enabled
Message-ID: <202410041050.42575499F@keescook>
References: <202409221511.9AF49BD@keescook>
 <CAJD_bP+6qCgseo9of-cKW3+nH_UbGFwPo6WRbqqcneOZ+EEtOw@mail.gmail.com>
 <800CC050-E858-409C-A565-A6EF430E1B25@kernel.org>
 <CAJD_bPKNbKo5tj4OV4MpgtSN6_FXfmQtBFgVFzZeZapCPNT6PA@mail.gmail.com>
 <eb7354f6-98bd-45c6-a616-733637848a14@ghiti.fr>
 <CAJD_bPKHA5+Ta1vzokN-TXJU4bk4OA5QTXEEvAwmzLzmW8YtTQ@mail.gmail.com>
 <f9d17698-0c74-42b7-acc8-3ca3adf3ba4d@ghiti.fr>
 <CAJD_bP+ZYKFaeZ2hQXjAZda=RhLkfnXfGLW-ZYTrOV4GfNRzpA@mail.gmail.com>
 <202410031417.A5AB8BA5@keescook>
 <0c9371f2-e8e9-479f-856d-408a81213747@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c9371f2-e8e9-479f-856d-408a81213747@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_105626_122101_7BB2F29C 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 04, 2024 at 01:37:44PM +0200, Alexandre Ghiti wrote:
> I have a question though: should we do something about the following
> warnings? Is there something wrong somewhere?
> 
> Wanted to write 8 to a 0-sized destination: oldptr at arch/riscv/errata/thead/errata.c:185
> Wanted to write 28 to a 0-sized destination: oldptr at arch/riscv/errata/thead/errata.c:185

I think it's a problem for fortify, not for the errata code. I'm
still looking into it -- they are unexpected warnings given the types
involved. I haven't been able to reproduce it in a stand-alone context
yet.

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
