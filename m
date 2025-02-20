Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1D1C021B2
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 13:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pq6GyQmIYc0rtZV7uqbEPOqmGXJdybV2IqOqGHrDZ6Y=; b=sCecdWMlBaZUuV
	IjEwxBIS7vBdIPrwRtm+GVWeiMIi+wQeo3VwkRbQ7o358in1kgM5yBbNWNRxh+F5BHegC4EMJmcJn
	EOyWIA4nYgOHwcRSNx24rhyEvGzm62eskPwGgTUA0B7fGuv641sgH39qIa9fRfHmTWeS9iLhAZsx6
	dP6R8SLc6ClanLaL0ONkSFWVeN8F74Qs/VF0x87PWOiRFn2uTbhnbmJe6F6XkP6zX19Ztkxx6gCav
	Rzg3SF3TlP6UWi/6adzv7l0Jw8cge2+LLGs6WgqzsG7vEw+tyDnZH0hZrbpl0EboZjSVbI9RXcycP
	OyyBJhei9wcxPaTWcYgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6rF-000000017as-1l2H;
	Thu, 20 Feb 2025 13:44:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6jl-000000015gN-31qQ
	for linux-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 13:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740058628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fPHIXz4qFlnuaW8pRE68AvHHeq4G6v+Kzc0FiQTZJw0=;
	b=gABLZE8wP9wHKIsNxn43hA9pr53TGN3aKRgvz8fT/Z3ENd84oUftIXtiNRC5imYwvPExJm
	PL2H7/xkbkjmLH5cbl+PdqxOTTm1j3LgqyhFsajMsglM0TjK6QG3gfUmr4nTEMu9baampJ
	qJmAXgdt2or8Mh3lz4Oi++puywAud3I=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-38-AFuoeNjMOGqEUpfQuw1j1g-1; Thu,
 20 Feb 2025 08:37:07 -0500
X-MC-Unique: AFuoeNjMOGqEUpfQuw1j1g-1
X-Mimecast-MFC-AGG-ID: AFuoeNjMOGqEUpfQuw1j1g_1740058626
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8BF92190F9E9
	for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 13:37:06 +0000 (UTC)
Received: from gezellig (unknown [10.44.32.137])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4B88F1800359
	for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 13:37:04 +0000 (UTC)
Date: Thu, 20 Feb 2025 19:07:00 +0530
From: Kashyap Chamarthy <kchamart@redhat.com>
To: linux-riscv@lists.infradead.org
Subject: Re: Subscribe
Message-ID: <Z7cv_MguH5Hcd-Db@gezellig>
References: <Z7cvbEtIMrUWhjv-@gezellig>
MIME-Version: 1.0
In-Reply-To: <Z7cvbEtIMrUWhjv-@gezellig>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 51OHXRbm7mXnwddW1dCprYB92PYbMez6uyEl4IKSILs_1740058626
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_053709_822615_1BEAF09C 
X-CRM114-Status: UNSURE (   6.56  )
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

On Thu, Feb 20, 2025 at 07:04:42PM +0530, Kashyap Chamarthy wrote:
> subscribe

Oops, right after hitting send, I realized I made the rookie mistake of
not using the "-join" addres :/

I hope a moderator catches this before it goes to the list.

Sorry for the noise.

-- 
/kashyap


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
