Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E4BCDE009
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 20:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhRvtUvmwVEe3COArKbVXH0NsoXETm0Z3zHIKqVMLLw=; b=XkHkMMVeUWQvST
	AExx2f88357ctH+VuJ1HDUmFajkmw167ZFRX+eNMvPi/R64Pz0rt37OamPDovDmDfcNWLiLavaDOA
	RXktmt8sVtDSCt65zIXMPEIlAcUeXFqLVha74HkuH2DFcr3duCAhzFrZ6pDvl00s5d7A3AYoMSup3
	TQuSd0BVxxkW1zMCMPouVSgcw0f6yv+Fk3jslU9jVg5WLFN7zV/iWfVaKgPK3UwCx4H3TMZHxmaVR
	DBKy2H9lEk0CN0c9/7qYAz+CyeSKviFqNc5exbd1IQQcRttEcQ+zQUere0jLiAtfAmQS/P1vWWPit
	hDApCE8NWw/PcdALM4ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcqkS-00000009naV-1wJu;
	Thu, 25 Jun 2026 20:32:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcqkR-00000009naN-19WP
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 20:32:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C11F60098;
	Thu, 25 Jun 2026 20:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6531F000E9;
	Thu, 25 Jun 2026 20:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782419550;
	bh=ANr0CGYD/qbVbHjHBh/VGOXxEdxm178HUoue3X1UOaE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=QBfCGY+uHwyY8Q080ZSPRjTv44K665c9f9er912Bi6gflo0G9b4POa3u3MXdWgUco
	 mKWM9Y+ORjylHnS9Y7yBcC/2AdovvOxzUjvIakMdsnFO/9AxmNHlct16dA0Wp0Tuej
	 oqCSUZmso5Q8wmWvv7i3009P+VAS74HywwXGxb5CVgVyNBuLIaK/AwCYjqlq+fJv7c
	 dGvJHOmQz9rjHAl4dwwtUfhx0Rem8OZve8rsyC/TZqWNgwkuc3cMViar/n8b9odUdo
	 F6uBGuV8JzxpBGlVW32jY61Gh3kXHhNoB3q1gZGWsCML+aHPeL6fB5enmCTPdZ5QiK
	 XpoqhKGt9ziqg==
Date: Thu, 25 Jun 2026 14:32:28 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-acpi@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/2] riscv: acpi: Enable ARCH_HAS_ACPI_TABLE_UPGRADE
In-Reply-To: <20260616-riscv-acpi-table-upgrade-v1-0-45902d2dedf9@iscas.ac.cn>
Message-ID: <e3fdacef-5277-a0fb-f8c6-da2221d55eab@kernel.org>
References: <20260616-riscv-acpi-table-upgrade-v1-0-45902d2dedf9@iscas.ac.cn>
MIME-Version: 1.0
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

On Tue, 16 Jun 2026, Vivian Wang wrote:

> I did end up using this for something, so this is probably also useful
> for others.

Thanks, queued for v7.3.  Would assume that pretty much anyone 
working on RISC-V systems running ACPI right now would want this...


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
