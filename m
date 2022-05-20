Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2B1C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 14:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+gV6cQCiE13UVwlxMxVJ+Tk9EWr1cze6OsiKpzsg4o=; b=2ST4I17CmzJ7Yi
	dSqM2wB25J1+/rhcX9IyutLlW15CPpScfqJ2zc9KFSL4mXUytJWp5AB68NFN4GiaJ0IS+1tapnZ7A
	vFcQyYgsaBIJR0GOOIh4+uU7Ki6IenrSHzpZ51HHpTAqoD+JFwM+abA+xffcpKp1Kiw1eBCPTnvHM
	dDrDntRKbrSM45I3zTopRsOpY308ms3Cqq+RdKDzRbieBJcC5/j3tOn1mNpINgr1Uj2/wLFqwrr5h
	g+iCvvyvRJLg8ov9ztCzkv8sVk1S8ms4BwIs8HzLzgrKyBpU11X6+2h8wpDy3fccTKimwSnmRb6UX
	yRWcGK5KPEW2vJNWvBmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns3Tv-00CsnJ-3C; Fri, 20 May 2022 14:19:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns3Tq-00Cskw-GA
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 14:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653056386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=V8d/MMBZWVbw8xfym9SnWoCH2ZGFp9yJtMtkGVq2cuORLDLL26lgrDiwiXw/tHXwdePi7t
 DcB5KEhgEk45F45uwaKnmpTy93n/Rz2Uayzph+1pgNgloQXJalkqNG261Fk69eHV9boEtM
 uYtrZUScP9KMjd/XJ6aPgnCR7wfWT1o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-bDEdnVE2OyO_DX39ZddBzA-1; Fri, 20 May 2022 10:19:44 -0400
X-MC-Unique: bDEdnVE2OyO_DX39ZddBzA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88B92185A7A4;
 Fri, 20 May 2022 14:19:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E1A82026D6A;
 Fri, 20 May 2022 14:19:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update KVM RISC-V entry to cover selftests
 support
Date: Fri, 20 May 2022 10:19:43 -0400
Message-Id: <20220520141943.3330909-1-pbonzini@redhat.com>
In-Reply-To: <20220509060634.134068-1-anup@brainfault.org>
References: 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_071950_654518_8E2C4C9B 
X-CRM114-Status: UNSURE (   5.72  )
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
