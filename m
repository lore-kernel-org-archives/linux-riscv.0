Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE81D2ECF9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 06:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5RZA89TK3BdbBwA/wfamLbjPQCF0lBhBNmwzRab240=; b=B1Letpg/vqWg2a
	nJhVtOU1W5aDL3JoVW2thnbUWUvVXw307eoHQHHB4gu7JbSV+yudVACaxRC+CKJanTz0S8mnio/lj
	G7WZpfcASABcGRMBviRZVXqJUnNiAn02wadqzkLD0X4trEOE6POQEX5nBwvvKGZVPWtXtwngQNG0+
	5X8VjFfV5zsnMMLNGFbGzl67WxCAQZqcCdi8kBMjLFQJtBc4KBK48YaUuD5HqbmyWEGhDN0qHiylb
	ayA4eGo5j681x1NcW51jiwJ6an3cTjKFjhLP6F41G4dAVB9OvxwqIG2SOIo2iPM7SJLLL8pV1XL/N
	7efGMZng7FF7MrOgRVYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi4tJ-00000003FSr-1ohd;
	Tue, 20 Jan 2026 06:07:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi4tH-00000003FSS-3Vbc;
	Tue, 20 Jan 2026 06:06:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF92160008;
	Tue, 20 Jan 2026 06:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1294AC16AAE;
	Tue, 20 Jan 2026 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768889218;
	bh=AW+aE37obwp3A1GgOzZiGMpco2DQYMgZHyi0+bPmQMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DwZ0pvo9Z+DCbBKCfNMiyZb4T0yM/92bF2Ntf8mksTHGF3Rt0ZT992h+lyt6ArZAQ
	 sVzeeGLYB5FPRwYnj6ZNdQg298QDZIpi7kwFnNrNb3oopmCv6lkVzRhO3RxRK1t14J
	 abPnz2sSdINM+4oXf2ObJXG7VP2FOud9ER9j2oaE=
Date: Tue, 20 Jan 2026 07:06:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: vkoul@kernel.org, conor@kernel.org, neil.armstrong@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add USB support for Canaan K230
Message-ID: <2026012036-refuse-reply-a363@gregkh>
References: <20260119093836.316007-1-jiayu.riscv@isrc.iscas.ac.cn>
 <aW5WyizgDyQJaKLQ@duge-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aW5WyizgDyQJaKLQ@duge-virtual-machine>
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

On Tue, Jan 20, 2026 at 12:07:38AM +0800, Jiayu Du wrote:
> On Mon, Jan 19, 2026 at 05:38:31PM +0800, Jiayu Du wrote:
> 
> This is series is the RESEND of the series here[1]. I resend it
> because I mistakenly sent the wrong USBPHY driver code.
> 
> Link: https://lore.kernel.org/all/20260119093836.316007-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]
> ]
> 

I have no idea which is which anymore, sorry.  Please send out a v4 so
we know which to look at.

confused,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
