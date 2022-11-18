Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2E6C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 00:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBo4sEk+fYwIUsy5DLCExmFXQ3J8nq7YYrtmm7yiT0Y=; b=EsHQYYwl4HVAWC
	81LO61MGhqW0XcrFqafgtZXyYvjGeweV/HqxOr855izXj7jXaJREi6BqNrVdzaz62uI1J9qQGOqNd
	P8LrTWgW8xNpBZy5hn6Ng/PJitjWkxi4ZVdbIjkL43B/+uJ3OhQYAKjP8lwI3Md/s8bK0muoj7qYX
	XeJBKzx/FCXTE21YqbRoP+5uGmMq2Um2gb/qJCusrPE6FDPi3A7aW85zwmdg9lhM+yTwukRGOttqB
	WADaN+Z92Pt7Npv0Om3dVPFbTRmqhjjlkFvOSYc8mUoI1Jatc+zJRpDnGMaIr+kqt1du5b7ZQ9VkD
	nEW0CX8wGs7KKjNXg4Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovoyz-000qvY-RO; Fri, 18 Nov 2022 00:11:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovoyv-000quB-Ek
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 00:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668730302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t75IuiAQcMlm4oCjhALxycpb3Fn6D89zCbLbH8xoMhU=;
	b=RZcU4J8/NRVL5oMka86uKBamtnu9yaG6aFk5SsE9We4SOmaETV3qgrHQgbELjM8qwIWjfi
	LqyCeYI6/4sYYf1oHFnzGvkzjcbHkNuSiqkQBrc/DfeHpU+ZZKLT8nPMv/3E7UfqW5Loa/
	n/Tg+atdPWgclgCG0/554EGjQOHjZs8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-gFkoYcibN7O9y4IdUg4itA-1; Thu, 17 Nov 2022 19:11:39 -0500
X-MC-Unique: gFkoYcibN7O9y4IdUg4itA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6114B1C068CC;
	Fri, 18 Nov 2022 00:11:38 +0000 (UTC)
Received: from localhost (ovpn-12-17.pek2.redhat.com [10.72.12.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DDC1492B04;
	Fri, 18 Nov 2022 00:11:37 +0000 (UTC)
Date: Fri, 18 Nov 2022 08:11:33 +0800
From: Baoquan He <bhe@redhat.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: Xianting Tian <xianting.tian@linux.alibaba.com>, anup@brainfault.org,
	heiko@sntech.de, guoren@kernel.org, mick@ics.forth.gr,
	alexandre.ghiti@canonical.com, vgoyal@redhat.com, dyoung@redhat.com,
	corbet@lwn.net, Conor.Dooley@microchip.com, bagasdotme@gmail.com,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	crash-utility@redhat.com, heinrich.schuchardt@canonical.com,
	k-hagio-ab@nec.com, hschauhan@nulltrace.org, yixun.lan@gmail.com
Subject: Re: [PATCH V5 0/2] Support VMCOREINFO export for RISCV64
Message-ID: <Y3bNtRekTdzVMMdK@MiWiFi-R3L-srv>
References: <20221026144208.373504-1-xianting.tian@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221026144208.373504-1-xianting.tian@linux.alibaba.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_161145_584732_BBD8B659 
X-CRM114-Status: UNSURE (   8.43  )
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

Hi risc-v maintainers,

On 10/26/22 at 10:42pm, Xianting Tian wrote:
> As disscussed in below patch set, the patch of 'describe VMCOREINFO export in Documentation'
> need to update according to Bagas's comments. 
> https://lore.kernel.org/linux-riscv/22AAF52E-8CC8-4D11-99CB-88DE4D113444@kernel.org/
> 
> As others patches in above patch set already applied, so this patch set only contains below two
> patches.

Could you pick this patchset into risc-v tree since it has got acks
and two Tested-by?

Thanks
Baoquan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
