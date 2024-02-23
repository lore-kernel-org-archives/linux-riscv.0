Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E50C48BC4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 08:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5ggsKxPyZBXB7SuF6v2+7ghhdvZ7/vVCwNA8D+7Vgg=; b=Whmkszlau8ZY7A
	bn1bFvrV3Tm4HRcUpskZxYWUsAh1eh+tbSgixSGCcwtpsgq+M9v9p3eP1Gen0FPgQ3eezGClf8Dfz
	QN7z8C3qRqVHHgGmQQH1UeVBdZJf3D2I1SktrhvuXBabD/kwE6poxha8FJKTkUIYfTqHLK4eN9FfG
	h22JHUXhOrRHZNzCdqbQJRFqXgByKyrPGaBEBRJM2/MAgyLzcNYP23m5cniIO8l1/8a02Utp87N/l
	qk//8CSY3VGLvVYGurBDLWXKTHPrO/dlLiuYaIDxJdmou3zLV2WOC1dQxveP1qWqkFB4/05Ct2arP
	TgVV1FnZFcGrzfIRueWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdRLH-00000008aA4-3m3M;
	Fri, 23 Feb 2024 08:55:39 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdRKU-00000008a0w-2YKE;
	Fri, 23 Feb 2024 08:55:17 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708678489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zrx67e+Ks02+zDid4MN+n+m4AfW7G8yFrILIPbdnNa4=;
	b=UaO4+edaAlRkEF1meSANixfmhiR1danHJMIoI4bWIlEjqMxlificuKVRiZjKRI34uK+/hk
	yov6A0AAylIj/5+xhEkh25rs/R5t1D0FnBd6XiLZHZws8ZndsF4Fx6/BRPnb9WiijW74wC
	awhDyB/C7rcWplgSzNGGRzKEdbwcmqq3WDPnGbLr42NCF1DXy7P/ggZbu6FT5xUcsNXGKG
	aWIUlN84e44uMKNJRSTu+RlK+p7CZzXgzQbdwe7UDpsvjKIfxUfXcFI+qIbJQboXX/1e0j
	DYYGgINgTShkLB7bcNMk/4SsS/Av095OpICDU2bdXJIq759Vi3dSngtB86Wrsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708678489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zrx67e+Ks02+zDid4MN+n+m4AfW7G8yFrILIPbdnNa4=;
	b=RY0/77R84x+3anj5rVqtXr7nePncBV1qdEK0MqIR9HQ97lVwGiQRJSrwrJwrBASYJ6hOj/
	v2mgwGRxCXg66LAA==
To: Yu Chien Peter Lin <peterlin@andestech.com>, acme@kernel.org,
 adrian.hunter@intel.com, ajones@ventanamicro.com,
 alexander.shishkin@linux.intel.com, andre.przywara@arm.com,
 anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org,
 conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org,
 devicetree@vger.kernel.org, evan@rivosinc.com, geert+renesas@glider.be,
 guoren@kernel.org, heiko@sntech.de, irogers@google.com,
 jernej.skrabec@gmail.com, jolsa@kernel.org, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, locus84@andestech.com, magnus.damm@gmail.com,
 mark.rutland@arm.com, mingo@redhat.com, n.shubin@yadro.com,
 namhyung@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 peterlin@andestech.com, peterz@infradead.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, rdunlap@infradead.org,
 robh+dt@kernel.org, samuel@sholland.org, sunilvl@ventanamicro.com,
 tim609@andestech.com, uwu@icenowy.me, wens@csie.org, will@kernel.org,
 inochiama@outlook.com, unicorn_wang@outlook.com, wefu@redhat.com
Cc: Randolph <randolph@andestech.com>
Subject: Re: [PATCH v9 03/10] irqchip/riscv-intc: Introduce Andes hart-level
 interrupt controller
In-Reply-To: <877civefa5.ffs@tglx>
References: <20240222083946.3977135-1-peterlin@andestech.com>
 <20240222083946.3977135-4-peterlin@andestech.com> <87o7c8dvv4.ffs@tglx>
 <877civefa5.ffs@tglx>
Date: Fri, 23 Feb 2024 09:54:48 +0100
Message-ID: <874jdzef1j.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_005450_966255_957F0447 
X-CRM114-Status: UNSURE (   8.29  )
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

On Fri, Feb 23 2024 at 09:49, Thomas Gleixner wrote:
> On Thu, Feb 22 2024 at 22:36, Thomas Gleixner wrote:
>> Palmer, feel free to take this through the riscv tree. I have no other
>> changes pending against that driver.
>
> Aargh. Spoken too early. This conflicts with Anups AIA series.
>
>   https://lore.kernel.org/all/20240222094006.1030709-1-apatel@ventanamicro.com
>
> So I rather take the pile through my tree and deal with the conflicts
> localy than inflicting it on next.

> Palmer?

Nah. I just apply the two intc patches localy and give you a tag to pull
from so we carry both the same commits. Then I can deal with the
conflicts on my side trivially.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
