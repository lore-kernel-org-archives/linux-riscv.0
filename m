Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D36BD1D88B
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcclD6QefzQSHC/udn2dgJe79fJiJS6oIDsYqS4uFJY=; b=UBlUQq9kpmVDIn
	tbne8TjgqBL5KTTGSFnQD7dXU0d4uzcKa1vKp9LylxGCDmW60pH+NUHKi8P/vAkF28VB2o9bCQlP9
	c1zK4AQbDFKjbf8mBGGMhUk5Pcug2KIA/FxOf8tsk4sdmkAmLkZhCCPOZm96/vk231ulhDxzTuNTm
	RKCNWKeMGc4UtOIQWtQM88D+2bYROJqBZmzMk2ImxNemlmeFCJeuXdjPqG48bl1H5ZVRm+n7I/J3Y
	gDKSg5z0SknEnKm0/hhKpRr1CXtI/lEhm0Ej0fe60WS6fkl7EJzv9N0yugtHUPn53tHsXTp8L5E1Y
	4hgtJ+ywEP3NqCzn24IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kHy-00000008rCW-22ey;
	Tue, 15 Oct 2024 16:20:50 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kHv-00000008rBn-3pv6
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 16:20:49 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6cbe68f787dso34860476d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 09:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1729009246; x=1729614046; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DtJ+WCcZlnqJEtBJ5ahUedtheIBoZsN5YCfn7xZAGeE=;
        b=b8SOCHGiEBLiGIqI34Pa8zjfy53ixVn7IR3Zp00j+Ka7U1RfpCeOxe50GD55/+wCsa
         DZHzQlWWBur/uRWDiCGWbZnVwLW8pK2Ou28Pjb4mGkwky5FCFx9bmHCJRzGS5sla8hDM
         Ma4YqS7aWR+Bhk8YbFFZY7e/ApKikyeuWrphUhEQ2NkBvXnZ+fSqX4u53Kt9vZ94I4vB
         5jlbfshhw8URAdiyq4tOEnG+yMovRU/nKKtNWynrUMCkWZ4BsPkSZ501oLPvqvhE/9xA
         WyAjd02E40a4ji35cKLCwhr4sC5IhFwiyhZLlVefCxdGGEkaDBcoSyrv1f1tzR69Zny0
         8u2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729009246; x=1729614046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtJ+WCcZlnqJEtBJ5ahUedtheIBoZsN5YCfn7xZAGeE=;
        b=BPnD/C1l0qiB7224h1sUc+Qz9cl+a5GY580GXxlyjBYLAVnhOnu3endEh0xIuIBd0B
         pJzaoyjcKc0zS6DQyd5WdB1DRSXYm4VIHpcCjwOoO144TM64IScPExFm3uoBsAXmJFUB
         +0V6sfMYs+wiiCQdcPSPoouGmAO7hicv3B/kSBEa+cuQvnCwTk9ZF/6vadoeqdLsghba
         snrVaxzH/mL+aONQYhnIbEIf312qJUdXtc8CP6Gr4P/qwSv5gq1KS7V7I0RSxbtncYle
         D8mdpXhw/G4BViWGSnwbhtCp2Z2WiHl6vw3oqt4VFC6XDLxyPbEhwUXBpDKM8YBQklOu
         BpPg==
X-Forwarded-Encrypted: i=1; AJvYcCVRslMa6cYKxTunLSmJzl/yN7T5RjYyStTF8YzgV6hJTf1kcjp3la/qI9Y+H0POiOOsDie+oJMmB4bZaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7xvD6JIzM398rNWf8tFQrdaL63ehrOAVZVGJU004kqXLvCrg6
	U0YKbvBa+yzdnGWdNZdSm0HodTCP1JBDA5vPLk26+2T1P7NnZz5chiTuuYbB4kA=
X-Google-Smtp-Source: AGHT+IEOm3RZ0qr3XQeoZ584E3gMolo8dla+rxJiMl2IgTVjvh9zKfMlP0bSl5xGgTacD1zRpQZ8Zg==
X-Received: by 2002:a05:6214:4345:b0:6cb:ead8:c53b with SMTP id 6a1803df08f44-6cbf009b929mr198694786d6.31.1729009246110;
        Tue, 15 Oct 2024 09:20:46 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cc2291da47sm8321016d6.48.2024.10.15.09.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 09:20:45 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1t0kHt-00Dw7g-4A;
	Tue, 15 Oct 2024 13:20:45 -0300
Date: Tue, 15 Oct 2024 13:20:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v9 7/7] iommu/riscv: Paging domain support
Message-ID: <20241015162045.GO1825128@ziepe.ca>
References: <cover.1728579958.git.tjeznach@rivosinc.com>
 <3d0f71ee9178c9fcb9d62db135776895a91c3d70.1728579958.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d0f71ee9178c9fcb9d62db135776895a91c3d70.1728579958.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_092047_974568_3B2CAE41 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 10, 2024 at 12:48:10PM -0700, Tomasz Jeznach wrote:

> @@ -856,7 +1445,7 @@ static struct iommu_domain riscv_iommu_identity_domain = {
>  
>  static int riscv_iommu_device_domain_type(struct device *dev)
>  {
> -	return IOMMU_DOMAIN_IDENTITY;
> +	return 0;
>  }

Remove the function please instead of returning 0

> +static void riscv_iommu_release_device(struct device *dev)
> +{
> +	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
> +
> +	synchronize_rcu();
> +	kfree(info);
> +}

Just call kfree_rcu() ? We have a variation that doesn't require the
rcu_head now.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
