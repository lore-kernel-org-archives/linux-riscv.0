Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46B7C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 12:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3p/E2Src3rK2k9PtBzA5McXZIiSFA6o6NvwNl3i/18=; b=0VrN9XgSUzw3rK
	Y9fEgGdTPK/GUYm21vJ8xwVV86h5ogygH2eaNYAL+SRmrnM6PkC6ofpqV2Yp9IHhhp15L3SCa68R9
	2+2yX88KrysJgCotAmAZtCcmOBRE/O3FO5+vPTqnoqopi14rToXR3WzLmPqGE4GpF1KyXBm4j/94u
	uEC1B4xI4uD6V4zeI5LX5FrYHEc2x21UGHpU19hE0QlW1HxwdcY9f2guhpkQ6gvUgzYA76fGaGPan
	REehJmEuB963x6M7Atkd6egpEpO9uggBzFR1xh2W9wswwvMCr/57PRW2r7To9aZlzcCyHamPYAp7u
	v6Q46Pzugl66Uld+46sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbi2u-000ve0-Ok; Tue, 05 Apr 2022 12:12:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbi2t-000vdc-5o
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 12:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649160745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=EYHTFWojD+gc7Jfi33McYWYnyHKo3CLPOBQLvkGiCn6ScsGUlFBDAGciK2m1zB0A7B4rtp
 36uVrQSrWxJKx7c6M7VXvRtNVPswtDrvVOcvy9TcQqS+oZ64euax3pwOjygj1opiNKhvn4
 4RzB1MR4ZsHZpITkyErclilWvInRBzQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-NishBBujPcuOqY_jJyppfA-1; Tue, 05 Apr 2022 08:12:21 -0400
X-MC-Unique: NishBBujPcuOqY_jJyppfA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8724F100BAAB;
 Tue,  5 Apr 2022 12:12:19 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29C514021A6;
 Tue,  5 Apr 2022 12:12:19 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-doc@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH RESEND] Documentation: kvm: Add missing line break in
 api.rst
Date: Tue,  5 Apr 2022 08:12:12 -0400
Message-Id: <20220405121215.605894-1-pbonzini@redhat.com>
In-Reply-To: <20220403065735.23859-1-bagasdotme@gmail.com>
References: 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_051227_326138_5D2DE2A1 
X-CRM114-Status: UNSURE (   5.63  )
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
