Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E302EC38A02
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 09:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5keKFJ8QseKqWT5WEIrIpng1oK6jpwJHZajhtfuWwY=; b=A4+Of+ccEf7ik4
	tDVCK8ShaHUBFq7x1XBWzkiwjVJBue53mTe/Wyxb9XxArnpohWvz23eu6EXeJeF8GajFTmjAOhKH3
	MMcqaHXVATRJpvcCyBqaU8+XPr/IjbWvK7yFDgRgwNRXAeZp8qZgw1zz60tAOyz6DOBS28iL6FAOo
	FLT3N57hMNAhYVh8b0FWf2flHT+poCRjzTyTJNSZOEUzDzbvArTa9oF2vimCyijwPjJflf3gPryc4
	y4e5LB7fpzx0D2FAeV/26wVCSNxz8MbrP5/Dlm0heQSFu0MKukjYLA85W5qodMCFc2f6mj3+BTEN9
	FZYbv12wmY9afbh9K3+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opQvt-009xfN-GL; Mon, 31 Oct 2022 09:18:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opQvq-009xc5-37
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 09:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667207889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aLHvMkuWIJwngK3NBqM0wFdXKT6mSNzSHXzmL6Bj96E=;
	b=K4JH3UpN9KB4SNczvgJCRiElTOVkOGHPyhBtE0YgVQgKj1zya6UltWx7edOqZisvCjbBhV
	hBTKSLvrzjoBK6bgJfA0ZhA4ydVXdsA2JfGn4EzAf0HDn/8ZVJSRbhozf1JQLpEJNqREmv
	trLoOnkDK/5IS5KHY6vKJqcc/vpb8h8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-OGUxiIqqPTmXZzuAWZ_2pQ-1; Mon, 31 Oct 2022 05:18:04 -0400
X-MC-Unique: OGUxiIqqPTmXZzuAWZ_2pQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33625882828;
	Mon, 31 Oct 2022 09:18:03 +0000 (UTC)
Received: from localhost (ovpn-12-152.pek2.redhat.com [10.72.12.152])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 600E31121320;
	Mon, 31 Oct 2022 09:18:02 +0000 (UTC)
Date: Mon, 31 Oct 2022 17:17:58 +0800
From: Baoquan He <bhe@redhat.com>
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	anup@brainfault.org, heiko@sntech.de, guoren@kernel.org,
	mick@ics.forth.gr, alexandre.ghiti@canonical.com, vgoyal@redhat.com,
	dyoung@redhat.com, corbet@lwn.net, Conor.Dooley@microchip.com,
	bagasdotme@gmail.com, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, crash-utility@redhat.com,
	heinrich.schuchardt@canonical.com, k-hagio-ab@nec.com,
	hschauhan@nulltrace.org, yixun.lan@gmail.com
Subject: Re: [PATCH V5 0/2] Support VMCOREINFO export for RISCV64
Message-ID: <Y1+SxuC8qFWQStSe@MiWiFi-R3L-srv>
References: <20221026144208.373504-1-xianting.tian@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221026144208.373504-1-xianting.tian@linux.alibaba.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_021810_261970_BAC819BF 
X-CRM114-Status: GOOD (  11.27  )
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

On 10/26/22 at 10:42pm, Xianting Tian wrote:
> As disscussed in below patch set, the patch of 'describe VMCOREINFO export in Documentation'
> need to update according to Bagas's comments. 
> https://lore.kernel.org/linux-riscv/22AAF52E-8CC8-4D11-99CB-88DE4D113444@kernel.org/
> 
> As others patches in above patch set already applied, so this patch set only contains below two
> patches.
> 
> ------
> Changes:
>    Fix commit message in patch 2: use "Document these RISCV64 exports above" instead of
>    "This patch just add the description of VMCOREINFO export for RISCV64."
> V1 -> V2:
>    Remove unnecessary overline above header text in patch 2.
> V2 -> V3:
>    Fix commit message in patch 1,2; 
>    Use 'space' instead of 'region' for vmemmap description in patch 2.
> V3 -> V4:
>    Remove unnecessary kernel space export:
>    KASAN_SHADOW_START ~ KASAN_SHADOW_END,
>    ADDRESS_SPACE_END
> V4 -> V5:
>    Remove IS_ENABLED() judgement for KERNEL_LINK_ADDR in patch 1.

This series looks good to me, thanks.

Acked-by: Baoquan He <bhe@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
