Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12074CD6E52
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 03:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XT+tM2DhJa/Kr2TEwK9p+UpiuRbe07f825c3u4dEu5U=; b=B9w5csXTmq3BIy
	IeJZbAIRqTig3NpTVamQ+akAtPSpRMALxXv93kJ+0JkUQr3nPJqZ8fxu+K1KDRptjMWC1cJFZLKEa
	jncTDDZOy4exZLSRFUd+TVrNFr3FRvdG2kbF6gilpv7dzzu8Olu1W2aMBWXKFponLcmALnRuY592e
	U9dgeGCZ34Phh5Z2yMCauBax+Wb8Xj1KK/QsQ/jcDFJyituXPGwXZmJRJnihhbQK1HQOHczGK5FFI
	KplBRiJHG7Gs81k8y631OiRyOMj21kUuJRyqtbMfxhOJaA62bXrFuhSrE2/NtcSeypm3brP0Fnh58
	/2IeajWiMqroL2KrK+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT9ww-00000008OWX-3OTz;
	Sat, 30 May 2026 03:01:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT9wu-00000008OW5-1vLO
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 03:01:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6592341839;
	Sat, 30 May 2026 03:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB681F00893;
	Sat, 30 May 2026 03:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780110079;
	bh=56mC+ARUUx2aYOmcTLesen9tO/BpwtjQ6jTLU/506+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mzXuzZ6tb8Gh852fD+LHOO94PoVBppboU/C2ewhWqRuhvbDF2/WTpTHKtPKupaWUN
	 ISdKZqN0JaPZjCGcC4KWOKL7E2+lIs4Yr3EpeFh3tY+0ln9ft8KgDv/LAdY79ylE1Z
	 HmkqPgK6fjDmVvdVv1/g9v5vYhe4Pe51R0as7NN5rgNIglbbpY/itM13XRpMlWvZ09
	 +8cDleg9KlBmCf9hcX1me54lmxqGO+c+p/cPXcLueGHemDk93JRtC1OuUuGK9xOAb+
	 kXhhtCr5ltq9H7KnFYQI+90WeDd68GtmE8r70oku8pAdD/NJz2ncKEQsfx0THbW9/K
	 Q+eZ2ASlISsxw==
Date: Sat, 30 May 2026 03:01:17 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Guodong Xu <docularxu@outlook.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Add Ziccrse extension for X100
 cores
Message-ID: <20260530030117-GKF3748271@kernel.org>
References: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
 <CAH1PCMa_RJ0NVNyxkqsXPfrF4tz_69ZbWeqkh8xRCu7bLDkr-A@mail.gmail.com>
 <20260529062159-GKE3748271@kernel.org>
 <CAH1PCMbNv3pGNvjhr02fiibRS3mt929+C3jwreWePN-3O5eLOw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMbNv3pGNvjhr02fiibRS3mt929+C3jwreWePN-3O5eLOw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_200120_539118_633D50A8 
X-CRM114-Status: UNSURE (   8.08  )
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

Hi Guodong,

On 21:22 Fri 29 May     , Guodong Xu wrote:
> Hi, Yixun
.. 
> 
> Correct. Thanks for double-checking.
> 
> In the above test, CONFIG_RISCV_TICKET_SPINLOCKS was not enabled.
> And since X100 has neither Zabha nor Zacas, the runtime selection in
> riscv_spinlock_init() falls through to the Ziccrse branch.
> 
great, that's what I'd like to check , thanks for confirmation
-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
