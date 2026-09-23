Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C357FC9830B
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9/R4cb3rG/N6g7BSkJax9MremVzN3s0Qs1mBboszpkI=; b=XI6PRmEr/1bqrZ
	SHvyAPqpQ/okcJqc3OjhIVZBtzw0RNhIDGOmJpCUDQMLqOZbWejM9nPSAs4fi0SA0A8TIXRkWnYpf
	g3iGa9peE2vX5WPTybkI0LEYyJy48Fjc8Ujo4BLdyIJ7YcRbuMG7TaP+7KqDzXlauFuATY6W1wefJ
	8Q9bMeVX7UsxxPPhQqskIsovihN6Si2gilX9FsWNb+lwM++HPrch7WZ3N5x8imyo5+wXsEg1kvNvQ
	PCf0EZ6aN6YTbJ9XaZ+F8+S4P3HYYq4/3cPDTBJMjtnMjS/csdp0W4AoXWMqJEwRExupFN8Kkm2eZ
	fnp+5RfusCD3JBfpKCSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QiH-000000092GQ-2wcj;
	Wed, 23 Sep 2026 17:24:58 +0000
Received: from mail-oi2-x18.google.com ([2607:f8b0:4864:32::18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QiD-000000092FA-3rn9
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 17:24:55 +0000
Received: by mail-oi2-x18.google.com with SMTP id 46e09a7af769-7f4f1354076so337755a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790184293; x=1790789093; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zPbFyXkGlwjReheq7U40lvUG8BvJVpBYL3Kcj7fW/JI=;
        b=mRqZ5F8Utun4ZN0NO6WW33SaK4x+aPi6Q5dWA3hkPFRpvv5BZmLGIpAOnKey/HB/FW
         QdD5YUym6cM3U11TCDQ1Hk3tcET2bz/It3uI7aXCE1u6W4rG7c/ZG93YFJ6W06BubzRy
         vbf5X4rCdPg8B4zYAsb77LSZo+kw0INm43sRSwYKkGfF2X4ncvjhKcyv0TW1iqy5o+4w
         aMIMCOaC95TCXG38CA3XBuhWuX+RZ7mwzcijd3ZBOkt2LM4yadj3azLxqiIUu1Ym9X+8
         aAKe3bCvptmE4pU/yF+U501dD76QIBlIdFH+aBfKxVpTIv+bWmoStgUtrekllVo7/oe6
         uylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184293; x=1790789093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPbFyXkGlwjReheq7U40lvUG8BvJVpBYL3Kcj7fW/JI=;
        b=IaHYz2D4dKwgoa+ZPK3EK/DzSzBfX1MqyHYh5UA4ModvA7LTmMJC3YgGLhNATG0Fh2
         G5Bufz9NFsOhvNMdNv+goVA8QEue2S0aWwI4neDpiUfpu1g1MycqcUuAxQ59bh292zDb
         /7vG1FpXFKjYCahDoHOsmIrVWCzavgzm1fWcirxI8Xt5Koe4GSwth5vnc6qXtlCr3MGL
         +TvGEBIrxUVe35WiU1LSr8crLhaTcp90PHfSyrSipGUMAqE0WAckWTkEQrjjFcOn7J5f
         s9af6Ji6c7fwwg5//NHADAOVhIuNJN0Qdiacj+mESwzzeC3XrzVYm36PGGO8SD9XDoYC
         r8uA==
X-Forwarded-Encrypted: i=1; AKwUvBzKP3a3ITA1xwMFvAEOGj1vOAvFldfiW/ZtFFP8wXojmHVYXI9bF9PQva1ALhoBR6npO23aKdv7PoPFEQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lhJrIx6Zq7b22UetSM9hrKxAIATnCuDw2aGf7uMquMOZU59sds
	eFXoi4LcaXz7bQkdUMqTtN9BJmBwcGIcKrlWPjU123lLAzsJIDUIAxy8+0pJGWH+N7k=
X-Gm-Gg: AYBFou0RpPNdt7YSDUWlKqZjWtY+qO1ZgUVIMOhJUVMpaBl+RBrZKIul6s2HP+cC+e1
	95VASj5cMGt+jlpY4lw2+5oOVNu9jwdrW41C26acZ3neTOc2A2RUkQ7irw7fiqbi2c7AXbXvakh
	eO2fTpvuNPrcpDEx1nVW1WiAdyhPDiRD6St0FhIDIXgb7WCmZ7r/WTc66+02247nf4liF/AsZXe
	mFWjs4mX9kkdwmiJx8khduG+ZpUvMQWoflVJqY8tlYaKuPW+mtuWx84XaUETDjCdJfOks0iUP+H
	lh5l9WjHfW+nP7nUIAjF02YV+pkFJk9uYS2YMUP3XwiYuoegUfjyR9yjBjuYVXOw/bEtI+UG0Jw
	dG8ZxifoO+X1kB3qgJZ7N/iodeEhLWAjUUZGrs4PzmSAeigo8thcycmBTFZ4gHjdFzSVZs2+623
	lfKLerL1j2CgH+vMixjnzVNq0KszCHW0dlJ5xA1GO+qpFFJVSo8uwEWI8=
X-Received: by 2002:a05:6820:820:b0:6b5:ec3f:4985 with SMTP id 006d021491bc7-6d2cb7abb15mr2482311eaf.32.1790184292712;
        Wed, 23 Sep 2026 10:24:52 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d2ce25c058sm2994831eaf.5.2026.09.23.10.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:24:52 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9QiB-0000000EA0Z-20hw;
	Wed, 23 Sep 2026 14:24:51 -0300
Date: Wed, 23 Sep 2026 14:24:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: James Morse <james.morse@arm.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, alex@ghiti.fr,
	aou@eecs.berkeley.edu, babu.moger@amd.com,
	baolin.wang@linux.alibaba.com, ben.horgan@arm.com, corbet@lwn.net,
	cuiyunhui@bytedance.com, Dave.Martin@arm.com, fustini@kernel.org,
	joro@8bytes.org, kevin.tian@intel.com, palmer@dabbelt.com,
	pjw@kernel.org, reinette.chatre@intel.com, robin.murphy@arm.com,
	shuah@kernel.org, tomasz.jeznach@linux.dev, wangzhou1@hisilicon.com,
	will@kernel.org, xiaqinxin@huawei.com, yuanzhu@bytedance.com,
	zengheng4@huawei.com, zhangzhanpeng.jasper@bytedance.com,
	x86@kernel.org, iommu@lists.linux.dev, linuxarm@huawei.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: Resctrl and I/O
Message-ID: <20260923172451.GN1540250@ziepe.ca>
References: <arKx__kOPe4B5gDW@agluck-desk3>
 <8557363f-c051-4267-9fbc-f4cbb13ac35e@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8557363f-c051-4267-9fbc-f4cbb13ac35e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_102453_977874_ABD8A306 
X-CRM114-Status: UNSURE (   8.24  )
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

On Wed, Sep 23, 2026 at 06:13:27PM +0100, James Morse wrote:

> Using iommu_group like this may need a bit more thinking....
> If we can fall back to using a device as seen by sysfs, then the arch differences
> here could be invisible to user-space.

Please don't codify iommu_groups in any new uAPI, that has proven to
be a problematic choice for VFIO. We undid it.. Lets not repeat it.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
