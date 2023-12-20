Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64786C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 23:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLyuQDJ4+hptgerCzNBa6Fxs4UqBAg/YWbCb083rxe0=; b=WkOayjSdkpQ7+Q
	EYQXXlj8+upPc7IvTpLALDZI6CA9t+Y93e4PyR0VDUh5D9EwMrbf9si/zMzG8npCX1Sq7t+u9cbP1
	nE8m4Tbz7oB/fCJOEujohk8VdyT+z6b/oLm7uqImSny+Hx5Wv/kVCg9SbaAto5V5kUOhng6XwuFuQ
	h/aiX7IdqckG0QDhaeGosLzVF5mJFMWFDA9tVKNvD3oTm2I0YfBWBfrRVhXDp/s+u26lslSyP+4u9
	c73POX5xOe2PdgBxh8BjiNhv6mJ6/RS/XmNQRg6YrDCzaMqwDlpuZVDiogZli1wCiEPvthfWRbOLN
	0kFlDPHfm+yWlBAgfVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG61o-001Fcp-2J;
	Wed, 20 Dec 2023 23:31:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG61l-001FbT-1N
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 23:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703115055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NpHzyetdfnFa+em1B7GLhPjt2d/LNwN97Oht9kcvxy0=;
	b=FxNvs+04immZUgpwM6QT2kiFSPF3rQpMhzhLubZZJnds21EzyVw2BH6N3/1eISukH/BM2G
	UDqp1A7MQg39hMSo/aqjiU7SCsCew8rxI7b8sZkyY/zKvx2pwFQw8k/47dzF0h7aBPb+QH
	zT+2oYlwawfPmFcq2q7M1g7EeySkujw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-320-si85M4twNxiIF802LZPQqA-1; Wed,
 20 Dec 2023 18:30:52 -0500
X-MC-Unique: si85M4twNxiIF802LZPQqA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54B173C00094;
	Wed, 20 Dec 2023 23:30:51 +0000 (UTC)
Received: from localhost (unknown [10.72.116.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96C10492BFA;
	Wed, 20 Dec 2023 23:30:50 +0000 (UTC)
Date: Thu, 21 Dec 2023 07:30:47 +0800
From: Baoquan He <bhe@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org, joe@perches.com, nathan@kernel.org
Subject: Re: [PATCH v4 5/7] kexec_file, ricv: print out debugging message if
 required
Message-ID: <ZYN5Jy4PVh3ghbxN@MiWiFi-R3L-srv>
References: <20231213055747.61826-1-bhe@redhat.com>
 <20231213055747.61826-6-bhe@redhat.com>
 <20231219-twitch-many-ca8877857182@spud>
 <ZYJsBW0Y7Y+XhSgf@MiWiFi-R3L-srv>
 <20231220074634.cd736ec567cd7adf1e4c6d7e@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231220074634.cd736ec567cd7adf1e4c6d7e@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_153101_554070_76E25E1B 
X-CRM114-Status: UNSURE (   8.95  )
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

On 12/20/23 at 07:46am, Andrew Morton wrote:
> On Wed, 20 Dec 2023 12:22:29 +0800 Baoquan He <bhe@redhat.com> wrote:
> 
> > Could you help fix the typo in subject?
> > 
> > [PATCH v4 5/7] kexec_file, ricv: print out debugging message if required
> >                            ~~~ s/ricv/riscv/
> 
> I made that change.

Thanks a lot.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
