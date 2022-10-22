Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9D3C04A95
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Oct 2022 08:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+gV6cQCiE13UVwlxMxVJ+Tk9EWr1cze6OsiKpzsg4o=; b=Q8o4CAnt6hVfPU
	m+NFalfhUWZ5dHWY2lPn70g+Scb0e6O6kG3wy7LuNa34IafehHfcnzSJbAZOK1rNsqsPDMOeoYUVW
	0reHOE8voTxIrnuUAyZnkuHgTdlpkB+X+RGHgAId1haRgBXTDMafnU8ADab9fpk3rtrQxoDPQkdOz
	WTyKjGP2R2mz3jNZpUniJdq14mc3sz1gzGoRSdf1o15X1+Y9S0QKmYSxUKP/VX3bDzXoYySTjQ14v
	UYmyyChuLF6bot9KduCam5xj3oOASptPt52qF7YIXy3pFtiHjiJZmrfIaEC+SH7TvOoupdItm5gS2
	YOackM9TnJvEISWdolfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omA4s-00Bnt2-F8; Sat, 22 Oct 2022 08:41:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omA4q-00Bnrz-AX
	for linux-riscv@lists.infradead.org; Sat, 22 Oct 2022 08:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666428113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=KtXCuJV2YNG/6rsXf4eDAEF3na7SjUO/ZNAUHs1/niFJIze/SBlhaOof/Fxcssu2ibCx3Q
	Y/fovK7hAKyopHyiKg3J8H+QYdBaG1fA7R3Iblg26r76/eI4LOnXL9NA9JpAqVVZpYyH4z
	fNGxsmqkPvAff9JFL7ucxCeEbFgDGS8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-foRoI9UCNGWH0YUdhaGeGA-1; Sat, 22 Oct 2022 04:41:50 -0400
X-MC-Unique: foRoI9UCNGWH0YUdhaGeGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD10B185A7AC;
	Sat, 22 Oct 2022 08:41:49 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 344401401C20;
	Sat, 22 Oct 2022 08:41:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: anup@brainfault.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] MAINTAINERS: git://github -> https://github.com for kvm-riscv
Date: Sat, 22 Oct 2022 04:41:40 -0400
Message-Id: <20221022084140.1726796-1-pbonzini@redhat.com>
In-Reply-To: <20221013214638.30974-1-palmer@rivosinc.com>
References: 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_014156_447515_D6C80E9F 
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
