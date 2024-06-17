Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44039C27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7octCbZLsuXHSz7iJ5E1w3edv8tAQgPq3RjkUbC/sN0=; b=33Fp2+AAtVAopn
	3VOJ63yAzjd9Mh5l7q1i5h+wmCvROhL5BXoxMKeODlGdPpj4emTojHztcz4ePu0atf1IrK21/1pc5
	xKQFRSEX4EvuAkZ9W7sFQbeKMnnZYR6eMKK1P0++95D6rEwQkOMAoIrLB/VPpiBMjLoZWbYVbSQAU
	B4zK27wcYuSuCkK6P09xqUOZhc8ILV0KxlGNIP5f+xQc7VKUHRinlY2ARvhUasLct9KTYOWnThyjI
	vUn+zmCHlSjxAScq4bHg8LTWaUGNtPXXC/N989EZaTBMsJzpUr6ZLgz5PqGaYa3fmAkUGARIiuKoL
	m6OAhnSgdag4ukVaiQaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDW4-0000000BE0w-3OrK;
	Mon, 17 Jun 2024 14:39:28 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDW0-0000000BDzE-49qq
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 14:39:27 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6fa0d077694so1947547a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718635162; x=1719239962; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V0ydNrFGcnxQcEaU5sMS6EBIm5WNR4Oj0pZJxqEWp7E=;
        b=XhW5zzsLMZfRAWEKqnsa3mZSrGYvdyOA9MAADew/CB7kLNCKrJpMa9fY1MqifiD3z3
         cgveim+5tanKvJSs0ReWB0Ene38Q+S6SK91Qt8KLlgnvSaMEehKa31cYoFSVm1oguvUj
         7zAgW98r3+EOqKyDmmnNwL00uCuw0hZXts6lzlFHWqwjgsLNE05CAvCoBNGKsx75p0HC
         +A7gV5+t2pbWW/Y5XQF36EM4HkA0CyYRW4PuQa6yjqx5NCxVqZYBhrlBr5yG3l02rrUF
         JDgCOa7R7AWU+4Lj6HKxBBAShOZraA2URVjkNaroKQDy7DPuWSjeviEc3ziHcW25fHtw
         5CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718635162; x=1719239962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0ydNrFGcnxQcEaU5sMS6EBIm5WNR4Oj0pZJxqEWp7E=;
        b=KZSnpXcN0CKvaJMVwuWMuao8Y9zxc0UVXqPwlPEFQbPAdZ8PvWyqBc/xs/klouVm9f
         P0XPv4TsvMTI9UOa8j7Op6QAa0vFzsX/HZBOcASQpHoROrmgpp27UVtuXRfsNd9MQTJ3
         BwlMcLZguU5s5GKjPYDWHuEDL4ARXxlMgS9w8YkjnsRqBvheDuzkQWWQpyTLNYOD4vYL
         fWOiKvsAPLYNzPLpGyLaNg5R58FdOKu6dxZNYhepicmx0cGD0ISt9ab2zr/2DMzRa8s7
         fdgAnoDJVeSJFAd7ars1ftu5ts66o+jpKJyHpNQ4EBVnyXqyoSVJmRK8dWoqwiSCy0C5
         AL0A==
X-Forwarded-Encrypted: i=1; AJvYcCXa094ON/sF0SjHMFqg5fciU1R8fUs+v/q5cHCHBbZygADUCgwE5pE62qmbyxZGAaqZC8ovckIKG+P58etlnkxe5y52FCw/AgRSd+IYEczQ
X-Gm-Message-State: AOJu0YzBTdmiiapgDiK+HfcRrX7wsXUbOb8h06UlMUVe9UWlDKtyyNbe
	lW8wS0GwgbCwsZUzrpya2Yd+A7EAUrIpiKcfThlLWy+4lxM/f6sZYKgx0TRUwnc=
X-Google-Smtp-Source: AGHT+IET1ur2Hbq+9cJMAg5HnRNV4tbPcm/2Ccc2KuGpX71T8/mhLJfk7K1KJMmzd/D0+4LvUiLm7Q==
X-Received: by 2002:a9d:7388:0:b0:6f9:cf25:d6fe with SMTP id 46e09a7af769-6fb939fbe5emr11889679a34.24.1718635161757;
        Mon, 17 Jun 2024 07:39:21 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5c58e31sm56074816d6.72.2024.06.17.07.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:39:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJDVw-008kP7-Ol;
	Mon, 17 Jun 2024 11:39:20 -0300
Date: Mon, 17 Jun 2024 11:39:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, tjeznach@rivosinc.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	kevin.tian@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v2 04/10] iommu/riscv: add iotlb_sync_map operation
 support
Message-ID: <20240617143920.GD791043@ziepe.ca>
References: <20240614142156.29420-1-zong.li@sifive.com>
 <20240614142156.29420-5-zong.li@sifive.com>
 <a1a99374-dc40-4d57-9773-e660dc33beb2@linux.intel.com>
 <CANXhq0pQuoriKfHF51fXUtrZLkJBNOCe6M8Z6JbDjoRvbe1nWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0pQuoriKfHF51fXUtrZLkJBNOCe6M8Z6JbDjoRvbe1nWg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_073925_052983_B7136B60 
X-CRM114-Status: GOOD (  11.47  )
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

On Mon, Jun 17, 2024 at 09:43:35PM +0800, Zong Li wrote:

> I added it for updating the MSI mapping when we change the irq
> affinity of a pass-through device to another vCPU. The RISC-V IOMMU
> spec allows MSI translation to go through the MSI flat table, MRIF, or
> the normal page table. In the case of the normal page table, the MSI
> mapping is created in the second-stage page table, mapping the GPA of
> the guest's supervisor interrupt file to the HPA of host's guest
> interrupt file. This MSI mapping needs to be updated when the HPA of
> host's guest interrupt file is changed.

It sounds like more thought is needed for the MSI architecture, having
the host read the guest page table to mirror weird MSI stuff seems
kind of wrong..

The S2 really needs to have the correct physical MSI pages statically
at boot time.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
