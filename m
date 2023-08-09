Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E922EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 06:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2Yxc9U3NzzjfkXMd5ZS5hsj+nzwhvP7mmukRtmecXo=; b=DMsoWJgvCzruOW
	R+/wK22dCMFki6gXElLPg1o1GTZrcYegrw7vOYU2LPmxu4FsCsyqVhJbv0IXCElqEh162sXZXi6li
	a84iYeP5itnqVCdbadEu2NcNE3GuZm0CBa+hlxqwezryiyBlDhruTciY3Li2EANGvE2Soo/6Odnoe
	l7hUKVjnIWsZG2zuJf1GUhL8whMGSnvTCP++NsWGNy1wZI8hy/UvGroCmpPCXXcTSzq/3iWwqOZ6o
	OvBw3yy2LUtVWNzusyjhnpdcVrVtSIdCh028L9p1WV4JjkPQuBbkifSdkezQMKjsZxhAMcTcPF8zX
	S+ncZWOc1RqmSjBUGV4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTcPt-0047tE-0l;
	Wed, 09 Aug 2023 06:11:33 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTcPq-0047rI-0O;
	Wed, 09 Aug 2023 06:11:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1691561467; x=1692166267; i=markus.elfring@web.de;
 bh=CR6EgYDQptplQppD4a1pbnT+XzeFXpCisAKzauYQ0D0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=JXDzXJ2rTTu0Reu5cHlqUUJM0RV4+Ht+WfEdGpG3DGCWhkuS15ZJc4+/xO9GXetWrv0tyTI
 OIVHTtCfaEYo0U+8hGp8eyYqR3csGKhleoYEBE9NYZj8bqkPg1mcoBvCGc4+sO8vhvhO2wbP0
 46fpDl4ojeyqOjSGy/1JcykBkcsvWb/tS2SsCeiakuiRpwt5mfhwVoT3tCYvBoRWJzsqGYaPZ
 7D44GcTa0pcv+fyvtworqrhdanE//B8/ywp7xIozD7jOK7gZdMCILHWim0mV7wBxnsPsUGttO
 +HEuDIJ8w4JOl3JcHCRLPhO6nFK3hP7qW37kNmcNLq6RQDTz3qeg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.86.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M1aHx-1qUzBY39Kd-002ocN; Wed, 09
 Aug 2023 08:11:07 +0200
Message-ID: <23c9ff53-82f3-491a-91f7-131cba6c607d@web.de>
Date: Wed, 9 Aug 2023 08:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3] riscv: dts: allwinner: d1: Add CAN controller nodes
To: Conor Dooley <conor@kernel.org>, linux-can@vger.kernel.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel-janitors@vger.kernel.org, John Watts <contact@jookia.org>
References: <20230807191952.2019208-1-contact@jookia.org>
 <49ce2d9c-eb38-4ceb-bae1-0409df876e9b@web.de>
 <20230808-swerve-tartly-07140c59539e@spud>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230808-swerve-tartly-07140c59539e@spud>
X-Provags-ID: V03:K1:vc4RSDTSTk/fGcfShTXLNUrXlNB2Vyv+JJiK9m6Dmn7E3oKaYqX
 s8kfD84BD37Oy3oPBza9KmRtT184K5+XIFHnL9VIEwQKnx605ahNg2Os4hpm05g6fWS4g7k
 J4iXwmDrcwWPJ4J/qWtlBa6/hbaDtB2nGwxCzSXkOiOXlOSzHADiDpMFKJu95uI5nC7USsR
 f+ThR86lqZqtvOCxzwHSg==
UI-OutboundReport: notjunk:1;M01:P0:/CtHlBkDZzw=;lOvXretq27LFIYsb8VR2mgdVUFB
 V/7/wUwBnKCHLZ5Dqm5pZkPA3CQra3vGSBSyGeDm4/7iBHKg1ERyIM5WwTn2thmHmxpfyiTUO
 RdzI+lAIdeoNWiwmW6U7X+hjqgAgnfGZW/1zlfu01zmDh3Ho7R++I8VzknWcycgeEKN4+nlt2
 33/7zA5VAzH8N4IYH2RxNdqizhh4fXGE8Bovu9JWpq4E2oyBm4M4LCfqLf7CVJYovW+D0K+Ck
 nKE/svY0VORit/ro07sv9IxJxhQjtM3zlNvA2NtoNydfLrCC4UhkJybr4lAPlEV0C6ops11A4
 oIl05wyw5n6dQlFCNf+bQcqzOY436eAc7sTFd5pkG/S428rFpTqyToUR5HClt2Y0MOfZrVe0I
 x/aWuETLSkx0TeDPL95WZyWOGFjmwxkWB/iEntHBsc8tHFxywx9tmV4wdpT8Vd9mjQGUDT2Mx
 lcxgD3IDQAsPFfW4vAKs+XQkHnjySmOB0+Zh3nQiWinkDC2G3wvmbwurrTL7/OcwlAq+Enu7i
 OWztCZ9mQwpu6lG0uEFne9NzP58HrnAvhvxfMpSSiP8NPMkwTS993AarqivjC3OGURpjMrqYt
 E3gwfLBG5o/4A9qX6bywiMLVeLnw1d9HWQB7Cs1RQJQ9WvQPVvI9qPlGaaAIOjLmuBbRMBXa2
 LHhhLnEqMo7R1hPStKPdgxouwc/EhIt0rndigxxZ5O981nkVx4GxWX/25c7e7+CCgexwi8gZf
 fpD/vGc5QVwgi0Bi0dOiX2+oCMvUoguDwNnnC8G7U4PqMd/p1wc2mGdKu5CA4kk07DbDAVhBP
 JQTJZItiUu0nbrDyX9G0PsTvNbzPDfXzxl1blAGozXdOZ2kc28A8cYeDm2Ohfo7Nt8wRs8+6h
 RWfxJxY/L4yoLnZuCS7jWoLyG44Hdm03WR02MfbdtGiRxKqpKQYMvLkx+0eKEgNdVc5JO0FvH
 jjnFMQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_231130_596533_9CF7BDC5 
X-CRM114-Status: UNSURE (   4.23  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> Markus, please stop bothering developers with nuisance comments.

Why do you interpret a recurring patch review in such a direction?

How much do mentioned concerns hinder the integration of the discussed patch?

Regards,
Markus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
