Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DE6C54FDF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 10:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vrWR4LPhX5jH9QSzOqMpMrht+JDJLn7TEoS1FC6RdZY=; b=eGaQ5sv2DDDEch
	sqnuy/PWmyqhKRoO9Nxg7GrtfEaCB01qmbPH6i54D8ApSHaYSbRkpZZefHKDIPI2qkrlv2UtDgbie
	ous6podDJRR0Hq7bjy+hvGUvHFnCIQMZ+c9CSIOsbmF3iEyXnn9saeGcC6PrCVmE6MFGYAQgV9DJK
	rVyXK5zgY0SoW3wpFwGQ6SRN/7+aozrRsrW0p3fFLuzl4YDYvtuvP7DLqjag4lFYruHpcSnZ04uND
	cwFnBmBmDr5XeVlpppCWYV+IMjDjHPXd49tg4dlicJXSfa8oaO83jukotbd3WEUa9qMe83xT4c2nt
	fq1Br7e0onBP7F+/whRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNf6-0000000A8kI-0QFX;
	Thu, 30 Jul 2026 10:06:48 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNf3-0000000A8e6-3iOi
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 10:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=KcmLOWVvN/7d541vlBTEHuDWksSNPbRNgmm7FsDP6Ps=; b=zA/UEhuyC49HukyX/QWi6RfN0S
	TiEntt5ce/y3OkGxjcq/Q80zmQ7qx4vUEkkrJLcnj+W/vfRZP0vlELl45svTiZTIMqucP0pE0EZnO
	jdW75WxM7lB73avjKRRT99ToeTmhKVCntPGW85y0/hmqh+ArVW8Ot2aHaqDuXaPD9hrTqXirXAoo9
	OpMiDeEbeWQSjieScvhEqBpgzF13ucW/5gxbQw5jrN/L211voBKa77fe/IET5qghBTXPmc6cQtDpR
	4tIeoF6l+liA1vD5OjLRZ7oQLSMSZvyvTPJ31LHXbInqmUq8z+ANLYkvRDOR502163NPEjEIALxkR
	a7KHi0nQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wpNep-00000003zU5-0sJ4;
	Thu, 30 Jul 2026 12:06:31 +0200
Date: Thu, 30 Jul 2026 12:06:25 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 3/4] dt-bindings: riscv: spacemit: add Milk-V Jupiter
 M1 compatible
Message-ID: <amsiIVakPFWGwcTM@aurel32.net>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260729160749.1621415-1-aurelien@aurel32.net>
 <20260729160749.1621415-4-aurelien@aurel32.net>
 <20260730-unnatural-spectacular-pelican-1c21db@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260730-unnatural-spectacular-pelican-1c21db@quoll>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_030645_931951_260FE4B3 
X-CRM114-Status: GOOD (  12.76  )
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

On 2026-07-30 09:26, Krzysztof Kozlowski wrote:
> On Wed, Jul 29, 2026 at 06:00:30PM +0200, Aurelien Jarno wrote:
> > Add a compatible for the M1 version of the Milk-V Jupiter board, which
> > use a CPU with a different packaging with improved cooling performance.
> > It enables the CPU to run at up to 1.8 GHz instead of 1.6 GHz.
> > 
> > Note that the K1 vendor kernel doesn't provide any compatible entry for
> > the boards, so use "milkv,jupiter-m1".
> 
> Looks like should be compatible with milkv,jupiter as well.

You are correct, I'll fix that in v3.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
