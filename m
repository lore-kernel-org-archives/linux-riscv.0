Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F7CFF885D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOz7HWoTfdtuCgQEV/qR8Q5Bs/Yw89WbjO84y3q2rpQ=; b=MJFymba8OPn37j
	zQwS7qnZRxhTOVAcZ2UaeE6fGeMtG5SkugGxXA7AoiipjmB0sIidNZvSG2FN0mCrcqhfLK8FS9UIZ
	KOhkMTkxjVOCqw8W7O2iP2IYyA5NK8HrvSov4A5tkshneuskQNRD3edxreOnoeplclE0P76G8sYau
	sUazZq28andLCVjKxREuBbPH5gbiO2ADg3LgsVjXZ4sS1wEynMBYoxTEbS0VdwGxtNoKPJCYtX9bB
	ahLFUxgbIcXRccocy+R8cESqSKTFS1LAA0hOlION+ecZ7E8dsANCy9nvXRl0g45xUgUfBiDkBhHNG
	TDZmOu+tCtjaBptVOOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHicK-00000001YrS-0VE2;
	Tue, 28 Apr 2026 13:36:48 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHicH-00000001YqO-2tsw
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 13:36:46 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8ec37d52c0dso1181058385a.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 06:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777383404; x=1777988204; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZ19NsW5fr6ajdZR5D4lYg3z8k9sQDPcT96d4+jJChg=;
        b=eRm08gVyBhZm/Xtru/+cHNU5LitwwknRsofeZlhh4WfuU/ud0TK1L7Mce0DN1z2sql
         5nFimdy+ELICD0skGynK4nEbY1/i5HTtgE9G9DqWvyjzWTlFrwxLiqCZj3RF6vQ8FYBx
         3ADW1+O75PiYyTMaXWMaNQ/qd+l9nux2QIllTh8ZE49A/N/y9bMTK+PvrrCrqiHLaS5l
         l+qDfURqwFI6QWzQem7v/AmLJ6l1th/EvN16AkrZEM6ephTCjh3ejwmXhdhM/XpskKE2
         CxSjz6cxNSErud1cBUVk2jLiKUSU5YJ/e4gELrwuOy35g1XsBMy61QlGCVJ9rw9UxvOV
         0aXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383404; x=1777988204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZ19NsW5fr6ajdZR5D4lYg3z8k9sQDPcT96d4+jJChg=;
        b=lsFtfI+gevg+LZDehEFHnO2yn0xnItroqQKGUepn8bJ6Ee6zJvguThETAzpWyDjePU
         f+0Aq1r59haiba9fm9tkMZJA7GWmRk3+Mp084EPh/FvfYo2ajszrD/WX5tp6XnqN3Gwj
         IMtqEjz5+vKkp4JU+P02X0SZgVBDkBtz71yHWKhUCrHVKMUFIhK9w9HsEyosTUKablvS
         TJiF/K4K1msOrrYgqPxB/S5rbtPHpKvjDh/gntzxQlXebOfJv7cOSBMSX/SqAY8uOpO1
         WbkRqv2BBknSpwjjyL0WrDCELqLgw9gXq+JP589+GVSuZjTfQS4SI7UQt1I6AAA9IS3t
         WBDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/A/g/B/GdRjr2DN8fl/hgh7dXD+2/ToaA+f17m9/580jfpePhfMmlDHqZ9Hf3IfIl5tIh+zSV0o4EMAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgqtfMwGorOs67GHmYi2l0vqcqdh7aYtMG1iTVihb9Sr/iqAen
	SczmGcsSj/tnAj0O88nOeHlsv4qpLE2QTOd8eOFpKbxDmqnXGkgp2OxG/gtbo+r5x2k=
X-Gm-Gg: AeBDieu1QB6xZtQ2U5CUhc8sx9kslOTpdKcu2cFlRAHfpSSxHddfRu0xgiOg5ibglcg
	IzbBBImScryqx4kCL+qEKyvXC7N2Z7wBngXOe14ypD8xARXYPCddgSy7S08L146P5p2LdYuslEb
	JFiexMZPB/l7trKsNpLoBBrswDth07bKREk1NqICgddAYDsb4b5cs/LBhsbk67oohwWwdAhxNfK
	5HDAPaetF2PzIDWclandwia9EDazQcKWPQyNA1JkhHJU6UqxcH1qe4KeVZ8mpcUt00inzIYLHvc
	5VBa/wA6gqXIBLgHbXX4tjBJlMsBXUMFTvtrA17/68P70L/0tZKDodlwVgEj915tWaOXG0bF5Ah
	Jrj6AgxG2mkBz7ZXcyspTu0t7K7r9X2J25qFuC/LyUUpcS+qjosOqzV8oIWC8rrS4JPiXxPzBII
	BILUE+EJOzRnFJu7snxRHSALBIOCWNRhEo5PFCLqEx4Rpl5I2l1YJfUUMdfxShPiJ57z2a10CNl
	3davfoI56jFRjEr
X-Received: by 2002:a05:620a:4002:b0:8ec:a621:a3af with SMTP id af79cd13be357-8f7d7d17f49mr430093585a.27.1777383404115;
        Tue, 28 Apr 2026 06:36:44 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c7cd2becsm194526285a.29.2026.04.28.06.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:36:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wHicD-0000000Aii6-3yTF;
	Tue, 28 Apr 2026 10:36:41 -0300
Date: Tue, 28 Apr 2026 10:36:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tjeznach@rivosinc.com, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
	atish.patra@linux.dev, skhawaja@google.com, guoren@kernel.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 07/11] iommupt: Don't preset D when RISC-V IOMMU
 dirty tracking on
Message-ID: <20260428133641.GF849557@ziepe.ca>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
 <20260428131359.34872-8-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428131359.34872-8-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_063645_737870_E103BA46 
X-CRM114-Status: UNSURE (   9.00  )
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

On Tue, Apr 28, 2026 at 09:13:55PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> When mapping writable pages, the RISC-V format code currently
> pre-sets the PTE D bit unconditionally.
> 
> If hardware dirty tracking is active (DC.tc.GADE set), the IOMMU
> sets D autonomously on the first write. Pre-setting D makes every
> new mapping appear dirty immediately and breaks dirty tracking.
> 
> Introduce PT_FEAT_RISCV_DIRTY_TRACKING_ACTIVE and, when set, leave
> D cleared for new writable mappings so hardware can capture the
> first write. Keep pre-setting D when dirty tracking is inactive.
> 
> Only meaningful for second-stage (iohgatp) page tables.

You shouldn't need anything like this, the D bit is managed by the
iommufd core appropriately. It *should* start out pre-set as that is
faster when not tacking. Only once dirty tracking is started does D
get cleared. User space is supposed to assume that everything is dirty
prior to its first D clear.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
