Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A296CCAC5B8
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 07:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjLPWrajGgTrGYaG4mAlqC3B/YHxkEe7iNBDb+/A5VY=; b=gVR+LGjPMGD3yC
	6GnZkOC5bZeYRHR+uUMAfkHrDhTZ8VXrm4ikyrEVBMqKMLHB7jyR/5oV+KyOzxDopUoLLZgyb7oNk
	bY9SBXLMRHu6BFby1Mb4KC+Z75dN+bjB7RQnG3KyQQNjVnqzfr+IO4I66JFUENHtkvDwTUBAz802y
	yA9usbsHVg39zR7p2KkfHP4fezA9Qf9523q8mcvVB5186Tu/lQszWnkvZj4GaZk/74deULRFlt0Kk
	qbGXbsUvb3Hs9U0HPiVf+I8wUw44hmr5IQEyHiXEks9D15YU+Lf1ZXWraweot+D4XDr5IKF79j4pv
	ZVjeder+nrC90uOwS3tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ujn-00000004UAg-3cgV;
	Tue, 30 Sep 2025 07:25:27 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ujj-00000004U9R-37Ht
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 07:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ORh3BEPV+WOquku+9ljKakwClSRpsC/pErO19VSvDzg=; b=KDwEpD6vP8UTF1F7qBSXLjRQ/P
	bbw3sc4d5wKGaldhM9SRUcpH00S5UdZ9TF72MKgRb44mwBwwm2vlNQhGS+a3LIVmfLvMGtS6FOtmK
	eytlNNFf5/dx88jla4D+xHczGEr7RgrwtoDSkLNPnL1+9JTXjeygQIHKY3Ala+kfWfwL8AjzCDhQ5
	ZxnE/5DqBMx5c+ghJxDXX8SEQc/m6ed8hGbMz4FzB+UiBi3BD4fz7Guy1wYy2Z6Tci+TmPqRn7B/N
	2pMbGUy91NpRbjhXCpu3Ta1G+Yb9qppcwHTPMvAXc5pzgSqPkFi4uOZxWpPj+g6etd/nuhNBnSmdh
	ATnyj1mQ==;
Received: from [63.135.74.212] (helo=[192.168.1.249])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1v3Ujd-004k1j-AX; Tue, 30 Sep 2025 08:25:17 +0100
Message-ID: <066d70c7-b0a7-45e5-9337-17901bc95664@codethink.co.uk>
Date: Tue, 30 Sep 2025 08:25:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc1
To: Paul Walmsley <pjw@kernel.org>, torvalds@linux-foundation.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_002523_784667_89543483 
X-CRM114-Status: UNSURE (   5.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 29/09/2025 09:00, Paul Walmsley wrote:
> Linus,
> 
> The following changes since commit a03ee11b8f850bd008226c6d392da24163dfb56e:
> 
>    riscv: Fix sparse warning about different address spaces (2025-09-05 15:33:52 -0600)


Is there any chance some of the big-endian work we did is getting in
for this round?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
