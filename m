Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FB2606A331
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 13:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CSPrOCfK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hYheTBp3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=m6n9dq9QCpNnAZWvVkuzAbvW5EHXoTSN/jnvQ8znO9Y=; b=CSPrOCfKvQoJVzxS/OX6EsILQ8
	99LbPpwU8oO8FjW6r6yChGHsD0pmEpw5I3meVmCdQu9YdrKE07m9QsB1zMn7Jc/hdPXX6lOVBkUJl
	cZJCqtDGttEL1mY1A1qZjuNWlr9gKdZ3Ok1+syjDAkjNOVJVOqvmRONOC5DKyz2j7gYn8gRxi2dO4
	4/cKmHq5Lx/OBP2UUIepFupzVT8QlqcxOETyt6ciOnMVzCLH8Kj5HEcuwl7ZLKuOV3DWOKBTTu2Mt
	YFL66nAVqVlCScFaIzBCLvMqDZDgimdNxlLP0EeaRcblSZELqVqnApnn7+SJlXcI2DqmNPz0fyh+9
	Oc+upbwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrrS-0000000GZoM-0pOu;
	Mon, 02 Nov 2026 13:14:06 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrrO-0000000GZnJ-3mhl
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 13:14:04 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-91c79f306e9so35313646d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Nov 2026 05:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793625241; x=1794230041; darn=lists.infradead.org;
        h=from:rom:in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQ6t+GMfhU5C0Rvm61dIpYM5RO8AvEBQYn2+KfQV/CM=;
        b=hYheTBp3IzfTgNhE+KBl9hokesHafIVQWqOtCsQ7TgS6YeerBNcr/5CyN285aPmRWE
         F35AaO8Yn3/YGMdDDWLfo1RqMna5FAbYTr8KZKmxFs6Br75tgm5faaEBdyeINrUrrpRc
         Moekigwv8QuQg5O6uiyzLBnc4xDmBL2ThUdEieIarIJRnYNRruz+NbN72ZRGatYbnQGN
         pn5ioY604c5ZN3hr8Etu//U7+gIw6uuOA2HtVD76ju4261WMhcDbm87X/Aj7gyPHtz5a
         wHUslbAvCEY//gd+snvMC9VY6602BeGEdnmBHv5h/N6Ml+R4X1s36UtgT8xgRdUd8Y+u
         Jlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625241; x=1794230041;
        h=from:rom:in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQ6t+GMfhU5C0Rvm61dIpYM5RO8AvEBQYn2+KfQV/CM=;
        b=VhGzDhAxEmNz4TNlT1tAiIdM2hFV0GcWqwuksGLCZvWLP9sOup7vnAF7LsojOoqYpX
         DbW8FjxhtpDiY9/p+iutb7GAshrS9xRZMT70kQ01966tVpIuruqgtSiX20nnhhimUqK5
         NnPup4BryYtb2V3YXC3WCw7p0xLqUWLlToihd3w8vhiXmG40yKNwgY3CPHPYQB02VZTk
         3WUD+5q+oC7dSkcYTlRdWBqjdjt0+IPjrwM2rlRRowF+txpWqn2OmlDprr3n0rRcDWmm
         UYQql2djRE+8ktnxVxbuhADk9U4XZnPBb2K3h6Vg+aR2TOvg/GKUxvztDfS3N/hqVyXi
         8h+g==
X-Forwarded-Encrypted: i=1; AKwUvBwvwlcn2eoMiYkIlHEClSIhGvHC+4XijK3Y/FjyNjVkXA3iFkFbEt7Pflnar8qEG0U1j+MIYxoC7nWSDg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJF0+ap4pVLc9PVAS34pkVJXm/CjcNRB4obmEuXCnL4rSl8yJjI
	qYQ3zDbRE14nl1bNjeqfLH86tm41ABCzwnH9CXwysSAfkkqatzNeh3qvifU++SrGHGA=
X-Gm-Gg: AYBFou3JXdBs2db6/nZlyVH1qnY31yrrQ9U68TzGyFyTLlQXrYqPWJV7mPshcatzZ+L
	WhshHQ9faq9f0nNIu0zBLYYOONR7O98VVOZ0j1FTrr8ezJ5yRWXIgrlKASx4H168jC7Zk61d6mn
	WyA08/Fj1m0PARdFAw3Mpbgc94uQjjaJuvDVYUVCatgSvmUlSEGHrBDHVV2Re2WcvXpj96HkILJ
	p5gTeJ8G94fN4Yuh8bu6ANjcp76xnxmLcn1SCPpAkCv5Xfwhzyp2AYTynr54Yt2YTyrkKQDHKxx
	A4tRR2IqADZt5SRsjTghurklqUXupVqdbM/RPahX/C4e+0j+mb9EfQDmFttVVQDqhgbEcUx7MNY
	la+lvK0BAJU4l2J2GcSDWz/eE5nVd7muuCUA9qGbvQRrhxVMB0X7X6UOfXA86Vma8Rgoy1spA6k
	M/3z+2SbDhdXOQOIqbc8DEM5ULPn8AnLICVfoP3Rlt47Uj69RLx76F48E2KIZQZ7H/AfGg8933Y
	M3U8ChB30SpF9NrqNMFqa9USmKthBvWbkW5tjHBs8Nev/C1FoJ7dVELt+sp2GHtRUtayvvavRZ8
	Ddad9n4xkYv+xSbU1B9/qQfotHJyXwBo0kuKSJDJA6RqJKvc9Qlq37UHNoji/gnksDLULnAdHKn
	iSlVHq6FLTqm0Ax2f6XRKKrmHHOMVM+4=
X-Received: by 2002:a05:622a:a07:b0:533:3fc2:8b19 with SMTP id d75a77b69052e-542b658df3cmr161864101cf.20.1793625240711;
        Mon, 02 Nov 2026 05:14:00 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5431246c7basm85036611cf.18.2026.11.02.05.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:13:57 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xNrrI-00000009is5-3yQf;
	Mon, 02 Nov 2026 09:13:56 -0400
Date: Mon, 2 Nov 2026 09:13:56 -0400
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: fangyu.yu@linux.alibaba.com, alex@ghiti.fr, andrew.jones@linux.dev,
	anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev,
	baolu.lu@linux.intel.com, guoren@kernel.org, iommu@lists.linux.dev,
	joerg.roedel@amd.com, joro@8bytes.org, jroedel@suse.de,
	kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	nutty.liu@hotmail.com, palmer@dabbelt.com, pjw@kernel.org,
	robin.murphy@arm.com, skhawaja@google.com,
	tanchi25@mails.ucas.ac.cn, tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com, will@kernel.org, zong.li@sifive.com
Subject: Re: [PATCH v6 09/10] iommu/riscv: Add dirty tracking support for
 second-stage domains
Message-ID: <20261102131356.GA274202@nvidia.com>
References: <20261031083014.15040-10-fangyu.yu@linux.alibaba.com>
 <20261102091823.54287-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102091823.54287-1-gong.shuai@sanechips.com.cn>
rom: Jason Gunthorpe <jgg@nvidia.com>
From: Jason Gunthorpe <jgg@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_051403_114954_013D4621 
X-CRM114-Status: GOOD (  13.88  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 05:18:23PM +0800, Gong Shuai wrote:
> >@@ -1439,6 +1454,9 @@ static int riscv_iommu_init_domain_s2(struct device *dev,
> > 	if (domain->gscid < 0)
> > 		return -ENOMEM;
> > 
> >+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
> >+		domain->domain.dirty_ops = &riscv_iommu_dirty_ops;
> 
> This sets dirty_ops based on whether the allocating device's IOMMU
> supports AMO_HWAD. As I understand it, the domain/HWPT is not tied
> to that IOMMU instance. A later attach may target a device behind
> another instance without AMO_HWAD, and the attach can still succeed
> with GADE disabled, potentially causing guest page faults.
> 
> Shouldn't we therefore revalidate AMO_HWAD cap for domains with
> dirty_ops and reject this combination?
> 
> FYI, both AMD and Intel have attach-time dirty-tracking checks. See
> drivers/iommu/intel/iommu.c:3195 and drivers/iommu/amd/iommu.c:3221.

Right, need to check on every domain attach that the domain is
compatible with the iommu instance.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
