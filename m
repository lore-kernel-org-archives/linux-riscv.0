Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F89C761A6
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 15:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+gV6cQCiE13UVwlxMxVJ+Tk9EWr1cze6OsiKpzsg4o=; b=BufqrEn/zM4vvV
	GCVDQHHu7pZoR2yzw949YkuaeLm0ueRkpkdp0PN0ObRNcT30tn/NlCHDv3MKYMNtz3bqJHye6dvka
	+pUljObnIzo+MMSAcbJrIvGWQzVtwJR9fJS01B9ELpngSvbPnK2ifnPM/K2WAtqbFS1NwP7f4Zmvw
	mUoPw22oH1l8lmNhjMK+Vk3nRdPrrkGIja58fJxeQZbOWt45s57Fmsm0MMyI9sLzCaj5qxLadNqUY
	YtRSlAZwEoHXs643wGefDVJfUOuxZS1U95PDRFKqXw1lNgQyFA9cdt4zKUCVRzPwUc03urXGdRwat
	sukjHC45i+VvN26Up5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piGVY-007tBS-1n;
	Fri, 31 Mar 2023 15:17:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piGVV-007t9W-2y
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 15:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680275855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=SmOBBeTGGb1Re/qAX5XiPsLUsGI9tDNpD0XHIY4wNhATv1au2HDOdTXZsRrn++mM3tSFuj
	Qnub+rfpk3ICrSN6ZyqZLZhizDRX9akVv+8tzrIt46dMjOhWgsngQ35w1nGxKQS1IQbgUO
	1tvujoX1EGZFe1xt891G7maXBvnlvrU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-KYLKgkf3NweN5pB71c5vQw-1; Fri, 31 Mar 2023 11:17:31 -0400
X-MC-Unique: KYLKgkf3NweN5pB71c5vQw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E11F285A588;
	Fri, 31 Mar 2023 15:17:30 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 61FB01415126;
	Fri, 31 Mar 2023 15:17:29 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: kvm-ppc@vger.kernel.org,
	x86@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH kernel] KVM: PPC: Make KVM_CAP_IRQFD_RESAMPLE platform dependent
Date: Fri, 31 Mar 2023 11:17:24 -0400
Message-Id: <20230331151724.359934-1-pbonzini@redhat.com>
In-Reply-To: <20220504074807.3616813-1-aik@ozlabs.ru>
References: 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_081738_059327_E27ECAAF 
X-CRM114-Status: UNSURE (   4.67  )
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

Queued, thanks.

Paolo



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
