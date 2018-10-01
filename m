Return-Path: <SRS0=MPT1=MN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9403CC00449
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Oct 2018 22:19:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 454D42089A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Oct 2018 22:19:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SGy7NcHZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="H7tBktMd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 454D42089A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=YN9WyJtzpuWIVf2WjRLyBegMNqUj5kQdBve80Vrl+Us=; b=SGy7NcHZkkRHRH7PXDJ7Gv4tm
	FYWubcY6cGpe2GvcrYFpEwHqmxY9+FlGRZGEgU2yeN4gjkVO1TUdL3aO5mAAlVEIPEptSP35uhlIs
	VSqd1fuH39UxuUGbR9ssTiFfYeEK6vK2i3i1kBtuC7xmjz5bYelFkar+goD5RoMjFiY7maTypCrG3
	NVF0iPhXwSjim5t3fwFiWEhmkBa9HUjN3a4DZO4+Izfmp+yZWxycOWaLA4biaFOH8ab32/zoD/O2W
	vLmIS+W47vVaH/8LyLdgKco63bY5DgKE6a7nu/Vp7kKD9ypX05oPtiho/fyeetM/d8FsFhkhIRAAv
	XBThu+CKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g76Xf-0006NM-IJ; Mon, 01 Oct 2018 22:19:51 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g76Xc-0006Lr-SS
 for linux-riscv@lists.infradead.org; Mon, 01 Oct 2018 22:19:50 +0000
Received: by mail-pg1-x531.google.com with SMTP id c10-v6so10440953pgq.4
 for <linux-riscv@lists.infradead.org>; Mon, 01 Oct 2018 15:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=gsbiz8zM5DYQyMEMQBX+ScAnMLEvd89Pk3UR1UbkCL4=;
 b=H7tBktMdAU+tVURVYZjqFsbqjvB+muFKr9iB9IX4OHppNqVhZCpzZVOWwSPEOyHUap
 FwiPBIekXvRkTsFeSaKfA/pt0PLI1jpqFYGuSlnctUpurNgIfwLdEeTvCQDYJyNJqR3G
 sUYJbjyHDtwSBx+MnTMiCsevYq82ZWSwYCTLyjS8Q2R1cXvfrINXX+2ZLF06Kc+7ppda
 tStAxR0RT8TFSRB51GKPUbUPCQKSV2b7jJRxstpugM+RbrOcv8o7CFkr7ZpowTP9wv9j
 uC6RKPVrxDlP71NTMqaULzJnP2A5rpJ4C/Ks2mkyHwIZ42k2KnbHjLc6K0T4UymDclyC
 mlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=gsbiz8zM5DYQyMEMQBX+ScAnMLEvd89Pk3UR1UbkCL4=;
 b=DXV1/Xby3OFx7McZRjCPuuAfz4x5xgPzJld5MkULngBL0uMQIufPy8dAtexvRKkxOl
 wYtq4omfb+/jeRGhplywEvzBzipVRdkF2iuSC/EfIDS0A0ebdnvNRm3HBy7rzglFQvrO
 Os/TroTFLvjyyxlbp+DzWgo5VmlmFZ0hJ3YyfBOc1lfek5pD0LQusMdfAA/iBvhPH317
 YfAvsetl5qUYmzmAV38V4+k4efNQgUkeXIqiMRs0z/Jsr+2IEOOo9wJImP/ZE1+PZM/T
 gdmDV/Z7vDN7QGMtkhScYHilfnZw7oNy1EFMp85rf7RXCm4rSOuF0yHYZQIVYnXPT2FC
 jcBg==
X-Gm-Message-State: ABuFfojgeX19b3cCAcqHZjb7C2hGYXnEYFHEwbIOK9oh+5wDR/UHoUBa
 JFVkzmflN2MVnYsH6JYyIl2AkCZGp68=
X-Google-Smtp-Source: ACcGV61XeVqNvgOzgYHYcjf5iAXtSx4PTu5i5caCrVzCJgT/1AY2vLN4Pc8GjwEwMYUqTre0rpj5IQ==
X-Received: by 2002:a62:6f87:: with SMTP id
 k129-v6mr13348136pfc.26.1538432376806; 
 Mon, 01 Oct 2018 15:19:36 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id w127-v6sm5992107pfd.112.2018.10.01.15.19.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Oct 2018 15:19:35 -0700 (PDT)
Date: Mon, 01 Oct 2018 15:19:35 -0700 (PDT)
X-Google-Original-Date: Mon, 01 Oct 2018 15:08:16 PDT (-0700)
Subject: Re: futex_atomic_cmpxchg_inatomic is missing
In-Reply-To: <mvmzhvy6t79.fsf@suse.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: schwab@suse.de
Message-ID: <mhng-177982ae-3ff1-4e5a-a553-51c5cf1f2710@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181001_151948_943657_31557A1B 
X-CRM114-Status: GOOD (  11.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181001221935.PYMmlOKM6cqVJTDIWIArJ8aPYL1WJ3bRK8f3IKrXtys@z>

On Mon, 01 Oct 2018 00:07:22 PDT (-0700), schwab@suse.de wrote:
> On Sep 28 2018, Palmer Dabbelt <palmer@sifive.com> wrote:
>
>> Christoph published a simple Kconfig workaround a while ago to turn on the
>> generic support for non-SMP systems, which might help you work around your
>> issue.
>
> What kind of workaround?  If you disable SMP this should be
> automatically enabled.  But of course, being non-SMP, this is also
> useless.

I think we just need some sort of 
CONFIG_WE_HAVE_GENERIC_FUTEX_CMPXCHG_FOR_NONSMP selected by default in 
arch/riscv/Kconfig.  I punted on it because having this support only for 
non-SMP systems didn't seem so useful.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
