Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E329C87FCF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCYAePKpPjUOYMPGaZUjgXMsr7pK52CdYkWhhaq0IPc=; b=lqDuV+6JATCzDSmL8nrTfuU7/L
	yiTbq/sIE8gLbcjsPTOIkiThdUwF3vwclGa+eyWkOqowFhVcmP1dv5QQTO812TSBeItby1dokbjlx
	v1XUTUSNMRbQp4xuXFxu10bPnoo+cb1G5uFz3x4eZIuh6zZ4aOCn2co1M1N8dTWci9WXyP4e+Izgb
	23ChBPDFM6V3fV1ZkRBORwQSqSD86+eZhewG3i1m5mDEWMXVxDhWIDMs722AZ4ppFwlLs3gVRcMnu
	NnVafxeQRuN584KaOLJDBQXl8xD2f/ICIi7lQahU5TCzjROdS30D6JQGXU/tKahzKMnIon7w4UO/F
	0xyYp4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivgD-0000000Ab5h-2HUK;
	Mon, 04 Aug 2025 13:56:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivDm-0000000AX3s-3HuA
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 13:27:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E915460200;
	Mon,  4 Aug 2025 13:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1FBC4CEE7;
	Mon,  4 Aug 2025 13:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754314041;
	bh=0HpcXxVZIlcEaVB1NIukOwjT1SSDL2dg2xYzNVFQc9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4B75eB+imckBwOM7aVBIuKE25ep/01n0T6A9iHBEI1lGT/k1tOQAiro/SUYXTNOf
	 gF57RRMZmybPQDkZ5zp2UvBQhkwhkOYRdZw490b7RzSCG7Fdr/bOqwZFOVFTNMFs+j
	 H6QJxcKN4tyRNKmqpNBMM2tjUrDPMaQCrnmvNMn1QnBgD4Z9Mh6EP7YSbHRVZ20cyG
	 NYxYtSN8ZlGCat07jXLIhHEJGSZaZgHggmxBGI1ZV1slvsQc8Q6UaKy80RgKrNPsJn
	 snSzkDiBA3lPt4HGaVRkM1HmW+pCwWfB2pXj4TD68CHICZtWRJUmN3sANzvznt4nLZ
	 oIcDJhLyHCc1A==
Date: Mon, 4 Aug 2025 09:27:19 -0400
From: Sasha Levin <sashal@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>, Zong Li <zong.li@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>, paul.walmsley@sifive.com,
	samuel.holland@sifive.com, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.6 28/59] pwm: sifive: Fix PWM algorithm and
 clarify inverted compare behavior
Message-ID: <aJC1N93BVEVZjnWp@lappy>
References: <20250804003413.3622950-1-sashal@kernel.org>
 <20250804003413.3622950-28-sashal@kernel.org>
 <xgy4dio2oqwqow7k5nlbf2vgrx63ptmtsi533wad7pfa3v23tk@nzrkhb2nytpb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xgy4dio2oqwqow7k5nlbf2vgrx63ptmtsi533wad7pfa3v23tk@nzrkhb2nytpb>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 04, 2025 at 12:45:24PM +0200, Uwe Kleine-K=F6nig wrote:
>Hello,
>
>On Sun, Aug 03, 2025 at 08:33:42PM -0400, Sasha Levin wrote:
>> From: Nylon Chen <nylon.chen@sifive.com>
>>
>> [ Upstream commit 7dbc4432ea6bf9d709391eb57f1e9fb44e99845a ]
>>
>> The `frac` variable represents the pulse inactive time, and the result
>> of this algorithm is the pulse active time. Therefore, we must reverse
>> the result.
>>
>> Although the SiFive Reference Manual states "pwms >=3D pwmcmpX -> HIGH",
>> the hardware behavior is inverted due to a fixed XNOR with 0. As a resul=
t,
>> the pwmcmp register actually defines the low (inactive) portion of the p=
ulse.
>>
>> The reference is SiFive FU740-C000 Manual[0]
>>
>> Link: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8=
b16acba_fu740-c000-manual-v1p6.pdf [0]
>>
>> Co-developed-by: Zong Li <zong.li@sifive.com>
>> Signed-off-by: Zong Li <zong.li@sifive.com>
>> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
>> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
>> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
>> Link: https://lore.kernel.org/r/20250529035341.51736-3-nylon.chen@sifive=
.com
>> Signed-off-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>
>Please drop this patch from your queue, see
>https://lore.kernel.org/all/52ycm5nf2jrxdmdmcijz57xhm2twspjmmiign6zq6rp3d5=
wt6t@tq5w47fmiwgg/
>for the rationale.

Will do.

>This is the fourth mail of this type I'm writing. For the future: Is it
>enough to raise these concerns once only and maybe even make it easier
>on your end, too? If so, should I better pick the oldest or the newest
>base version series to reply?

Sorry about that. Just replying to just one of the mails (really doesn't
matter which) would work.

-- =

Thanks,
Sasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
