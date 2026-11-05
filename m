Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FB2606A328
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 18:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y8WxFRWe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RsR0gdNM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ORYLK9HkbsUGOBQ5PygG7MOZXWO81sr9ftEETl/HJcs=; b=Y8WxFRWeBMIFRgbhDr3AXxD4Eq
	eo2vjsnsOiD/n0jjYbUdG8BtR9za3gyn/mCxl752UIc3wDJBrG76138loOua+sLFxj/IOi6FQYRuM
	JCrxnacmbMFXVjv21taSGMQRsUZKBUCfZjxtdqB6HaWCHqr7vdB7j+j0zXnknU/ovINO0ACj7lh69
	tgtfRUaS6KsSBxXVLPMuNL29T0CgbNWqRkRxzwjnWD9H6Br9q+HUvj3E/NyTQmZKhVOraO9q7ablB
	WX6tbp6+9jiw3nKjGWVxvVm6rgMJQ2gBil+zbtJvS8sL/TbkZgYF4s6xoYiPSOrbTE7aRQgNFBM7d
	aZGcNOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2Ts-0000000ABkS-1EjQ;
	Thu, 05 Nov 2026 18:46:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2TZ-0000000ABhU-3PkW
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 18:46:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F99240F2D;
	Thu,  5 Nov 2026 18:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4423E1F000C1;
	Thu,  5 Nov 2026 18:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793904377;
	bh=OGBXiISFQJNpXMcFIvcZoWdT1NviZwaZmLgFctGBVXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RsR0gdNMWA2+Hh13K1JImi7Ix4m6oPKIJqQKJ9musGyFXT1+Fjt7CDyVFz7D79zPt
	 0EH37aMx//RPtNbmSYG69WaA7mtvBvnG0+PCXQ1pcaebPu3mArfuUMfDvqL2fgKG4L
	 B3qKtoE/erq9+MTqV0DUbVAC1wgMn5zPUwQEDSWdd2THoDleUidgG4iyShSkRGdZGs
	 4t5ucWe7GKgSUVKAqrimm9byiFzTF6S+NiI0sYtk9Ub+cYeeXpZMlZFNnQRl3fbj4X
	 plDto4ILvOcErA7ZBG0068OrG1sr3BWbycM9sv6IvSAgHoVamFMUXB1mXqhZKBWo/M
	 pKYTa+PeFQLRg==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>
Subject: Re: [PATCH v2] cache: sifive_ccache: Enable all ways on EIC7700
Date: Thu,  5 Nov 2026 18:45:55 +0000
Message-ID: <179390433157.1480517.11122116729400118033.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023134801.108890-1-pinkesh.vaghela@einfochips.com>
References: <20261023134801.108890-1-pinkesh.vaghela@einfochips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=656; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=NuezYmKgcL2Dr2rYuLWBXyuuiVgm0TOQRxVpctpRhWo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlvzj2afNHllVJAT5djSN3c+przQqseMljFFv9Y7eO9U ZzrdXdVRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACai9J2R4WmayqN/ymr831du uj47ulmHwWqC1VZe7do3a+9OYRFOnsLIsKt87/Oy/7eC9cWdRH5kT8/JPOKkHXjuSW7sqYY3h5P SeAE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Conor Dooley <conor.dooley@microchip.com>

On Fri, 23 Oct 2026 19:18:01 +0530, Pinkesh Vaghela wrote:
> EIC7700 firmware leaves only way 0 enabled when no LIM is reserved, so
> Linux can use only one of the implemented cache ways.
> 
> Add an EIC7700-specific quirk that reads and validates the implemented
> way count, then enables all ways when the cache node has no
> memory-region property. Leave WayEnable unchanged when the property is
> present because enabled ways cannot be returned to LIM until reset.
> 
> [...]

Applied to cache-for-next, thanks!

[1/1] cache: sifive_ccache: Enable all ways on EIC7700
      https://git.kernel.org/conor/c/4d61dc7a31fa

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
