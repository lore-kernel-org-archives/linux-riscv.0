Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04FBC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 12:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+gV6cQCiE13UVwlxMxVJ+Tk9EWr1cze6OsiKpzsg4o=; b=v+iia8HaAVLOqV
	pP1f6HT7qZ10iWa6WkztQ//xtcTbcMMr0k06aUCZrA52O715oHOR0HDpZUOiHlnecAPt2SJ/23e0T
	xwXjBD5hT3WWngkJbTq8hPGJkw+pXGap1h59fytrYpJlOQHUPxN84FLdFHpcWDf0b3solc5ZFZmW1
	Y0i7owD2P4mS9q8J5cS4K1l4RfQJm/B9OFBlsOvSIo5vcSGp4rpjOz15UDOrJzR2IK6PSwofR778Y
	MeW66O/MQa26pitoTiqFxrz7p0cRlIU8E3qVN23Af2Zd01SEhiznZyx44KaemBQOH1fKmV7BAJIsl
	PnYHQkROPhib6J7qs2GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh9Ie-008wrG-22; Wed, 20 Apr 2022 12:19:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh9Ia-008wpw-O7
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 12:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650457147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=O7hDaCbtQRDTv4+C0wp3S8wcw0nFCe5/Dq2Dbnn8uM1MCpH/AHmMD8+Q8gj8WU3I+eXM0y
 6hK8GD38nXnmzY8wPoCHM2bk5XGkl+BKBPs+Rv0NK1vOF6+Z+e6qXRejfRzGR2GbR3/4EF
 Rdy9CSQBV2EyKk0IEb7xL07zSDUloSc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-c57Y8JUANKiI4K4YZsNEHg-1; Wed, 20 Apr 2022 08:19:03 -0400
X-MC-Unique: c57Y8JUANKiI4K4YZsNEHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BA648047D6;
 Wed, 20 Apr 2022 12:19:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3F7CC53523;
 Wed, 20 Apr 2022 12:19:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-doc@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 KVM <kvm@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] Documentation: kvm: Add missing line break in api.rst
Date: Wed, 20 Apr 2022 08:18:58 -0400
Message-Id: <20220420121858.1147650-1-pbonzini@redhat.com>
In-Reply-To: <20220407123327.159079-1-bagasdotme@gmail.com>
References: 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_051908_884704_E8658E01 
X-CRM114-Status: UNSURE (   6.38  )
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
