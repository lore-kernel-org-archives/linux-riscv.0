Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9748DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 20:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQcyhUpvZwPJm/+EadJYfbl4aixd8tEXum0xLgl4JFc=; b=EMWaR/ETM+UJPF
	M1gJbex5hvkQpc6LuK5Ces/Rpqeuuxo75EAFRx7gb/wdwAaI1LZvVPUJHuCarherkeCZHxbU01LpL
	8gchM/j9sXOmZCy/QSiUnEfKUCIVhE3Jxu1yKkUEJvZ0mqAcQuaWFS0vlOIRF1hVjJkSIDNGlIn00
	HrsFXDiEtQGuQCsyIBad3dylw7GRkPLA0PzdVp1tMtn7h3NKwKRYMw4EEc3TJRy+1YPu46sTkObK2
	IPndsoTY/b0FECfp1KW3iJlbjM3BX8DwX9d2V0K0s/2YM5rtIYHrtw0Kdbslwu1P4Gsu8FV+sSRd2
	s1BSVc2NdDUF9SAegubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dJN-00Ee1D-0r;
	Mon, 13 Nov 2023 20:13:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dJJ-00EdyN-0H
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 20:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699906408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=BTAMur/cBw2cWs7noaCA7jACSGU6/fvCxXI4GJgjtzQYKK2uSIjJubLxewIvr1eKap3KxK
	okVLNJjrjh79wGXuQUJU3CJDv2c8C3wHRnDIMnjE7dvjZ80shYOXX5AV8C16fIIsH0ZUWh
	jVvWHxvR5bZzXFBHvR2B3c+tOforPGk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-MwjojmrjMJKYVmplwa5f-g-1; Mon, 13 Nov 2023 15:13:27 -0500
X-MC-Unique: MwjojmrjMJKYVmplwa5f-g-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6717027ac96so54720376d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Nov 2023 12:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906406; x=1700511206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=SeCzqhTNDatf5nXQQ8FW6RaTpgL9f1DLGtbnUQwB69mFXOzBx2YkX6rfaWQ0nL/JjM
         +lbjcDG2AYbFPWEi6NGE97cG8mV8SGDI0AkUgDQhIGWX3offz2S1VnvO/rf7qFLIUleG
         IGZAyfHkh56Bl8+UK+IomIREO17b7kG2s5Eu+BBH63wnY0hEF5ysKvzQI9qELHxw5Ndu
         SvkgZ6bY7YgukiLmOz+epBgqO5TZrkePlXFGuE07Uj7SbVoB1vbgUx41057eYhbnXSOm
         zyrfJIuPOYFznsCxnMMr3IrcvX3Yx60ELd9+1vV1PRpUKpSZlD1rsZqHFNR3V0tEj14Y
         4n1A==
X-Gm-Message-State: AOJu0Yzop3X1Yyw76CRA6K8RKdU4mIurgynJYI2UtRhzuxvswzSXEBFt
	AcErLRrQP4svH3cKWPdzLW/3TdhxQqeJIcMaq5rMJwRMIHwtBB7ZtbuzTl0ZDGqFx0QRF9U8IT6
	VBbi3O+yvS8Hl1fVOq3L/Dhrzoycy
X-Received: by 2002:ad4:4bad:0:b0:65b:2660:f577 with SMTP id i13-20020ad44bad000000b0065b2660f577mr248795qvw.3.1699906406577;
        Mon, 13 Nov 2023 12:13:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsDIxiixJLIxKwkxODRjUhycdO5JesTQ8JOYTeYOzxmk+ReEPp+gf8876uIJbrOmvoudG57Q==
X-Received: by 2002:ad4:4bad:0:b0:65b:2660:f577 with SMTP id i13-20020ad44bad000000b0065b2660f577mr248760qvw.3.1699906406355;
        Mon, 13 Nov 2023 12:13:26 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id c4-20020a05621401c400b006754772bfd4sm2302000qvt.21.2023.11.13.12.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:13:25 -0800 (PST)
Date: Mon, 13 Nov 2023 13:13:24 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linuxfoundation.org, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Lu Baolu <baolu.lu@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Frank Rowand <frowand.list@gmail.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hector Martin <marcan@marcan.st>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Krishna Reddy <vdumpa@nvidia.com>, 
	Vineet Gupta <vgupta@kernel.org>, virtualization@lists.linux-foundation.org, 
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: Re: [PATCH RFC 10/17] acpi: Do not use dev->iommu within
 acpi_iommu_configure()
Message-ID: <aqbuvpgu577fdpf4ndhoghfgewki7lg4hf2yewljonxf6y6oxv@xisq2p5bi3kb>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <10-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <10-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_121329_195377_7DB673DC 
X-CRM114-Status: UNSURE (   6.71  )
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

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
