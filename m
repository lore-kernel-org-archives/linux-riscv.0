Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9979C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HbhKR+1GmOHtsOyyNfMcDkv8DOYQaz1LsE8xKwm45mM=; b=iyF51LFKNikZCh
	GaUWxHe4sfreCVzION3lBbfhxoYGaCfp90h/1zqIAEQjMMufVzBmUR2fUrdYlHWS+AHNDuxZJMVYW
	LI2vScjQSi6EowWUeCVwYqDTWaD64Dcu5zwZ2DEHVc44NNliRktvlg610Gx761akFEU4+QIk2VBpH
	GOqofJlKrP9ngvj0CqryZpoyCvj67hkicSM5IyNxpWZtwi1iyu44zINAiKZhewVtV26fED2HXvrE+
	ZkzbMsIN02DrWLrtAP7U2hxtIE4jcitGpNRStmO0OviWn3fWz5GySiHq2ixhOuCqqY/c/t2BMV6j6
	7OtqsRWFPzsJIH+5h0+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUSM6-0000000HJ49-0v2I;
	Thu, 18 Jul 2024 14:43:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUSLi-0000000HIwS-0ev1
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 14:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721313793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gJrnZFWbEYDfYCgkGw1MmmGbtaUVBD+dZ8bSRNzGKmo=;
	b=cw1dgBqBUuQO0L/Rt8oi3gAzRiWDfQHJWDYrJr1ODFPscU0PayRYtm3tsPu9DaR/krsVj0
	SGAbaFRnzX23JC4d3OCA35dLXwjnDNppIt8C2h7vo1kOwlBCwVxviiQUyz1Wu60gxiiGqn
	TKC2/abPROYbApGz4M19kDxUpKOA8xQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-41-wwEfdrw0NfmVBBmg15EUHg-1; Thu,
 18 Jul 2024 10:43:07 -0400
X-MC-Unique: wwEfdrw0NfmVBBmg15EUHg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 553071954223;
	Thu, 18 Jul 2024 14:42:58 +0000 (UTC)
Received: from localhost (unknown [10.72.112.39])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B42773000185;
	Thu, 18 Jul 2024 14:42:53 +0000 (UTC)
Date: Thu, 18 Jul 2024 22:42:42 +0800
From: Baoquan He <bhe@redhat.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, vgoyal@redhat.com,
	dyoung@redhat.com, arnd@arndb.de, afd@ti.com,
	linus.walleij@linaro.org, akpm@linux-foundation.org,
	eric.devolder@oracle.com, gregkh@linuxfoundation.org,
	javierm@redhat.com, deller@gmx.de, robh@kernel.org,
	hbathini@linux.ibm.com, thunder.leizhen@huawei.com,
	chenjiahao16@huawei.com, linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] crash: Fix x86_32 crash memory reserve dead loop
 bug at high
Message-ID: <Zpkp4iF7quCOq7k0@MiWiFi-R3L-srv>
References: <20240718035444.2977105-1-ruanjinjie@huawei.com>
 <20240718035444.2977105-3-ruanjinjie@huawei.com>
 <Zpj4+G5OwTYBQGIA@MiWiFi-R3L-srv>
 <aca0795c-f1a8-20c1-3daf-7f39d2ebf1bc@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aca0795c-f1a8-20c1-3daf-7f39d2ebf1bc@huawei.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_074314_277844_4813A1F9 
X-CRM114-Status: UNSURE (   9.19  )
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

On 07/18/24 at 08:10pm, Jinjie Ruan wrote:
> 
> 
> On 2024/7/18 19:14, Baoquan He wrote:
> > On 07/18/24 at 11:54am, Jinjie Ruan wrote:
> > 
> > I don't fully catch the subject, what does the 'dead loop bug at high'
> > mean?
> 
> It means alloc at [CRASH_ADDR_LOW_MAX, CRASH_ADDR_HIGH_MAX] repeatedly
> which corresponds to the crashkernel parameter of the "high".

That may mislead people to think it's a crashkernel=,high setting and
the corresponding issue.

Maybe "crash: Fix x86_32 crashkernel reservation dead loop" is good
enough.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
