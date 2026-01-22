Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED75D3EE6B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 14:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tKxbboia0k6dd83noDOXhMbvWen5KtAYZQ/CllolmY=; b=BWdAxNnMyOhSMF
	mTQKgynRENMpnf4epsgRkdTHR1XfcRxD/79agyUUpx8lWEOfNHuIJUcA/p7rJWKKGGw7lk6sBMbL2
	fHZNX7iiBSKrGq7HueuQdnGPDoIo42CKSY1gksDlqNjDXNTe9zCy8Uz/52UGe1TiH0D1oT/uthbWG
	OeV77GPVL97RTrpB+OVUWwgytMeNoxXRbmOL7R4VL8M0kepHVTlNNwfSOq87mnL2aZiihBPYNgmDs
	QdpGGPKjA2N4yesOd86Y0joDAJGetf5cvcn6lgCRIYAf9phW/oExjCH+gfhbBYHq1iFFGzja1whI0
	ZumaYcUNma1kxDYj+PUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivrs-00000007FlT-1Q6y;
	Thu, 22 Jan 2026 14:41:04 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivrf-00000007Fiu-3wKL
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 14:41:02 +0000
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 60MEHqi2005208
	for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 22:17:52 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTP id 60MEEGmV004846;
	Thu, 22 Jan 2026 22:14:16 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from ANB420.andestech.com (10.0.12.111) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 22 Jan 2026
 22:14:21 +0800
Date: Thu, 22 Jan 2026 22:14:20 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 0/4] Add I2C support for QiLai SoC
Message-ID: <aXIwvACl3sQuYLE0@ANB420.andestech.com>
References: <20260115145244.435890-1-ben717@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115145244.435890-1-ben717@andestech.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.0.12.111]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 60MEHqi2005208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_064052_441114_D5A83590 
X-CRM114-Status: UNSURE (   5.75  )
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

Hi all,

As Krzysztof said in patch 1, this series should be the version 2 of
[1] with detailed changelog, not a new series. Thus, please ignore this
series, and review [2]. Sorry for the confusion.

[1] https://lore.kernel.org/all/20250207021923.2912373-1-ben717@andestech.com/
[2] https://lore.kernel.org/linux-i2c/20260122-atciic100-v2-0-7559136d07cf@andestech.com

Thanks,
Ben

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
