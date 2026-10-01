Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257CBCA5FCE
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 19:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrWLUk3g/pTT/IFhe091CF/TKcIRRqAVUfAAgXDUyHw=; b=cIlNZKVshIK9hx
	MqFA26VutazSVidYivp6NOkZhqHgB70sP9xAF/fqmHEubkfgYsUhB2OWqxBD8SZc23m/iIYabwC1L
	FOw28ocKruAKX1n4Ng3PxTYqeF+2TMcGCGeRbZtN3rTrr/oBss5o7Uil6z5QFcPQLiLKwjY1dDNW5
	8vA3bpvdpjyQyriFf0t2MDWRQ7E1m8xHHiszow0raDDVXEcMRfN9kCdYWRnMAC56mruqewVzCqglr
	bdOftoedtZEYsZ4eEXTm3y8msaKsWWD5QB7CAFxYCpbrRxiJAdkhWu2lLr+zlyQGJcF1W/kDUCmTQ
	MS3DeTdmFalSKEyQBBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMpG-0000000A6u8-1XWW;
	Thu, 01 Oct 2026 19:52:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMpD-0000000A6sy-0S4f
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 19:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790884330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZAjwzoaRE8Y0fVtRj9ggGUm+tsvlfR3rs7Rqyg10Y00=;
	b=hgVXO3nbgIVyMPld2yTWymNwO5bgL9tGnR0CsXuuudwNUj7vmVw5p0oumcY6Qebrho+6gP
	ydaa0vmungWhsJ89XjkXpaIqz0WyfslV56csgfWNU8WcAoICOjKAUB0ZIyuKp0rskAq+SB
	s/aiioVKLPJiJVNu60IKEOgGOuTUtRY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-237-NmxrzEmPOeiHp6eRNC39Vw-1; Thu,
 01 Oct 2026 15:50:28 -0400
X-MC-Unique: NmxrzEmPOeiHp6eRNC39Vw-1
X-Mimecast-MFC-AGG-ID: NmxrzEmPOeiHp6eRNC39Vw_1790884227
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9063B18E7558;
	Thu,  1 Oct 2026 19:50:25 +0000 (UTC)
Received: from kchamart.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 564E91956044;
	Thu,  1 Oct 2026 19:50:24 +0000 (UTC)
Date: Thu, 1 Oct 2026 21:50:21 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Development discussions related to Fedora <devel@lists.fedoraproject.org>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: Wiki resource for Fedora RISC-V + KVM on the Spacemit K3 Com260
 board
Message-ID: <ar65faZP8T-4FOJ4@kchamart.csb>
References: <b143791b-7bba-a6a4-64ac-9c6dc0735ff3@namei.org>
MIME-Version: 1.0
In-Reply-To: <b143791b-7bba-a6a4-64ac-9c6dc0735ff3@namei.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UxQwdSv6gW4mDXVKHu4GezFjs47zXAcscLT1p1VMGFs_1790884227
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_125215_224185_25D02FAA 
X-CRM114-Status: GOOD (  12.87  )
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

On Tue, Sep 29, 2026 at 04:52:18PM -0700, James Morris wrote:
> Hi Folks,

Hi,

> I've been playing with Fedora RISC-V on the Spacemit K3 Com260 board 
> (which implements full virtualization per the RVA23 spec).
>
> I've captured the bringup process as a wiki with the help of an LLM. This 
> supports a native KVM host running an F44 guest image. It's current for 
> F44, with F45-beta a WIP.
> 
> Wiki: https://github.com/xjamesmorris/k3-com260-info/wiki

Thanks for sharing.  I don't have a K3 CoM260 myself, but some folks on
the Fedora RISC-V Matrix have it.

Looking through your wiki, I see you have an elaborate script for the
KVM part.  At first, the name of the script tricked me
('k3-run-fedora-guest.sh').  From quick skimming, I see it is handling a
lot more than just "running" the guest. It handles the entire guest
lifecycle management with plain QEMU, w/o libvirtd, QMP socket
validation, `flock` syscall handling, qcow2 backing file format
validation (a good security instinct :)) and more.


[1] https://github.com/xjamesmorris/k3-com260-info/blob/57400da095e944c75e63154b1c187e18a3ac3359/k3-com260-fedora-howto/scripts/k3-run-fedora-guest.sh


-- 
Kashyap Chamarthy / Red Hat / RISC-V and Fedora


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
