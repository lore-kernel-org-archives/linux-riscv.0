Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C27C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2db0iDPoIfijF6SdwqcjbQEoGaNFTT+6PMeTqWP3Z1g=; b=QWuVWBYwqHln7M
	UTgNmDHUKZSdttQKFCa6OGoR6xqSJV4ozw5kvpRDYCQYiQBJh5MhvcgX6KJoVHtpH9B7dI9BiiGCK
	6sZ3g+3qBQ+CB6Pii9oZAs6ELP0wvU4pSptRPmfn8wcTS2Sjtqj9uq7s1FOq4xeLVp7c5zPNE2nd/
	ilY2hDWr3SVB6ddL9izRLL+iK7lSuwlr/bAe7Ce3qV+DSKCJzlGdXZTlcNXM3bW6BzOUuIhF/RwYR
	h4pAHimmY+8/dacdWkJ7pv0/kx/dDy9lkc5kcJ9nbF5s5FfktzByV1i2oX8iSrGHqq/Jm8wAIOO2h
	ksVFMDmG0thkQ0cSQ4Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFXDy-00AVVz-SN; Wed, 11 Jan 2023 09:16:46 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFXDw-00AVUy-BD
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 09:16:45 +0000
Received: by mail-wr1-x433.google.com with SMTP id bn26so14396244wrb.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 01:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ftqEwgsQx+Wr330xhw1G1bKw3eOs4rI31igTGI/vxag=;
        b=TOwfWdNulfpITn6jnGrARRGCAWQH8NHfGNO9i4ZJaJyZ30HcMxs/WlFaNHcog8O+4Z
         VP8hZ7VF8EfevGLRw6wa6rov+y8ZRhn9DSfiNvSF+8wF/Y+Jr4UzMBvV35CWCyzsNhKV
         AjRhY1CmDNHcrSp0hp7KDFyKCenQmd0w0cmK0jsC42I/XR7kGcwxMEqm3Z/qVTFebNkF
         jr9ZwA1dHp28IY+AuMqSdsqnawDYz1JXndxOIVErhTHCDsQlSWDJWc1ssS37CrksDmki
         F0sjHlsXAwIjxP2GWzNOpjOvHocNFj2rOTU2TSCg/KRJq/B3mzQfG/LoHyaSCegjq6Yo
         GN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftqEwgsQx+Wr330xhw1G1bKw3eOs4rI31igTGI/vxag=;
        b=b/Aw1I3RciWIDTanUxGgSd5pcUwxi8gGU3tLuXhoUWcYwb4ppJv+b5HgCtccgsksXi
         c58XF0QAhaopATlxdlMTPIYi7RavdqZM+Y/LZ249aUeisp8082O5p/xwttF0M2dZuG3H
         2qM02hYNuXfUZ9Twkak+Gmhf+npvKYDJFDNJREqUXTZMzXSklhcLolj2/MddiEYedahO
         CfKi6eTeex8nk3tK+vPxVMAz20B1pMswnFrkeYJ7AtQbt8D9zRJriHJCPx5VceoUOamD
         8K2sx2IqolT2IaH2ei4pkrqbwQwdUV8Whza0mGjBfDSmZIGJax1JFQnNuPQcNmD3DseI
         jFdw==
X-Gm-Message-State: AFqh2ko8tzu3xBCXoafRjaL54OLu+SjoWMi/aLul7arLi/cqYmTZJD/V
	T00TRlNmuvDgwsI1pZEs9SSnQA==
X-Google-Smtp-Source: AMrXdXvrX0Wk8EVEAPlj6RngH5p1TykZNJtTtWLgkgYVj9oPN4GlEcOQa/GAe2r6xVdvhSXnvxvDCg==
X-Received: by 2002:adf:d0c8:0:b0:2bd:bae0:8de5 with SMTP id z8-20020adfd0c8000000b002bdbae08de5mr3272467wrh.58.1673428602327;
        Wed, 11 Jan 2023 01:16:42 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d62c7000000b002bbeda3809csm7682773wrv.11.2023.01.11.01.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 01:16:41 -0800 (PST)
Date: Wed, 11 Jan 2023 10:16:40 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Sia Jee Heng ' <jeeheng.sia@starfivetech.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Ley Foon Tan ' <leyfoon.tan@starfivetech.com>
Subject: Re: [RFC PATCH 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <20230111091640.lukxm7ips3trfl7t@orel>
References: <20230106113216.443057-1-ajones@ventanamicro.com>
 <20230106113216.443057-2-ajones@ventanamicro.com>
 <Y73lRNHDstKHL3vn@spud>
 <20230111085211.wdsn4tnpsaxblxhm@orel>
 <Y758Fq/2jIX6eKmJ@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y758Fq/2jIX6eKmJ@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_011644_403584_3AAE4B1E 
X-CRM114-Status: GOOD (  23.85  )
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

On Wed, Jan 11, 2023 at 09:06:30AM +0000, Conor Dooley wrote:
> On Wed, Jan 11, 2023 at 09:52:11AM +0100, Andrew Jones wrote:
> > On Tue, Jan 10, 2023 at 10:23:00PM +0000, Conor Dooley wrote:
> > > On Fri, Jan 06, 2023 at 12:32:16PM +0100, Andrew Jones wrote:
> > > > When the SUSP SBI extension is present it implies that the standard
> > > > "suspend to RAM" type is available. Wire it up to the generic
> > > > platform suspend support, also applying the already present support
> > > > for non-retentive CPU suspend. When the kernel is built with
> > > > CONFIG_SUSPEND, one can do 'echo mem > /sys/power/state' to suspend.
> > > > Resumption will occur when a platform-specific wake-up event arrives.
> > > > 
> > > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > 
> > > First things first, anything SBI depends on !m-mode, so you've gotta add
> > > some sort of gating unfortunately around those ECALLs. But I figure you
> > > may have already seen the build failures on patchwork for nommu?
> > 
> > Actually, no, and I think I missed other emails like that in the past. I
> > assume I'm on the To: of these messages, so it's odd they're not showing
> > up. Can you forward me this message? I'll inspect the headers and try to
> > figure what's going on.
> 
> Oh my bad, I assumed that you'd look on patchwork. I haven't made it send
> emails as I don't trust it not to spam people with build issues that are
> not their fault.

Ah, OK. I'll add a patchwork check to my patch submission workflow!

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
