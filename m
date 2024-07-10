Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92324C3DA41
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 14:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2zxke82FVQB5pTd0crOSj0OTwcd73G5zGbhCtL2/XM=; b=mqW2Hpsjs1t9GQ
	xgA6aP0egfyjCk+OtkKLdvvvmw/Ah9Z/5Bgd8W7rFIMW0E+04RNsSXMpWjbxK6Q0++Ma+xh8MULBk
	EMQHDn13ZhUA13PemCvxJAuhbPB/afh7RhYfsDkWsfCS0pqjVU1zSBpfiEJ6taGwc3UBoF+PWev8T
	K/gH3LjoGk4hPEhDBFbO/kWyZ2FyMrkNvZhA17evQXlbY6kLavF9KlBQI/u379s6xgHZRhCEeAYH6
	ypIwQ7NkhPgW3vm33wYl5XojhQT2FjLKOZsEXpzhhV/aMGbCh9Jti13sR8AacKr8Qm99nMwK2WQrm
	DL7DB0VpPOnqKExhNYZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYXw-0000000ArOO-0kyV;
	Wed, 10 Jul 2024 14:43:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYXu-0000000ArNO-0WB0
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 14:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720622629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZvC/1briAqboclLx4gZNfSMQXCaqMLqhaARp61h92zQ=;
	b=jA0WR/W4AQCnsFzGvizK1Q/ByB0OV+5S5Z8WW9bscoBONeqOFT3RnsbAnoXHKIgEjt8YhA
	pUHGnIYXbtEyGsxBfmfBrOPS5jui4YTW0wWn/RDneZEQPAp8CnzQ/cTKB+dgbFGDB7GbJS
	S09MF1iTavY4RdOPssW187Rx4m6OlvQ=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-xuGuNTMLOLq9X1RdwU9Z1Q-1; Wed, 10 Jul 2024 10:43:47 -0400
X-MC-Unique: xuGuNTMLOLq9X1RdwU9Z1Q-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-25e8c18a7c8so750060fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 07:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720622625; x=1721227425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvC/1briAqboclLx4gZNfSMQXCaqMLqhaARp61h92zQ=;
        b=V3lUnSbzEHjaCIjEWMgHdfBcXqHjUFSD7mlMHzlQminsmctSRUk2Ol8f9h1ZXpIZbx
         3cv1bSNGV+rFfS0geY/xUdxZ0rrE0r+y9Y27dOse9aWjABiwM1VUaBsRgaFLPi7yWYg/
         yKFf/7pYQ0qW58X2/gd6v23qr0WJCdAmsTxUO+ksZlj5BY3bXO6QHcryw+20YRl53k++
         wWMPeeUL15hvud9n690ZzmOmlIPllUqXI7ccq2KgYTzzos2yivuqudwynA0bTvKaE2pe
         gIg31SEmF7hDCUjgtg6HW7mK7usijloF6d4Yj/ZFHOw2CSLNya3q9yZEoxdXQ92MKMCy
         WaDg==
X-Forwarded-Encrypted: i=1; AJvYcCX6wmgKBTbFluePKc/bAHDirNIHAIPQRW9AbNQQyLuEaMrSuL5ZWehJ8VUjd0SMyZIynutifGWyVq90uDYjX+yJnmSmrrXom4BiBc7pnN/v
X-Gm-Message-State: AOJu0Ywr1H8vckXFBqSVAwvGnfI77bNpl72NMCrVyN625FF0DZUj3zrc
	+IQeoTRsuAVVrspLCIv1K1Qo2Q9/bcWI7rKiAKneAYgjmZnIKzzpxM7wYr+k7s1Rvm6wEW1VBm8
	dMPL9mpi0/XFcZL83myZdaEX1SxFtufxDun6cWhmbDHKtEUCF+l9bm0BlNABHaEA+Bw==
X-Received: by 2002:a05:6870:610c:b0:25e:180:9183 with SMTP id 586e51a60fabf-25eaecbbec3mr5784208fac.4.1720622625421;
        Wed, 10 Jul 2024 07:43:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTD/gcLKLatwoODGC6PBmZLpDHOquqnlFmI5MDo6NjD0BVLxBJxqbPHflFRf/y2o8S5g+V2w==
X-Received: by 2002:a05:6870:610c:b0:25e:180:9183 with SMTP id 586e51a60fabf-25eaecbbec3mr5784188fac.4.1720622625106;
        Wed, 10 Jul 2024 07:43:45 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f19022e5dsm199404585a.57.2024.07.10.07.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 07:43:44 -0700 (PDT)
Date: Wed, 10 Jul 2024 10:43:41 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org, linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 1/3] arch/x86: Drop own definition of pgd,p4d_leaf
Message-ID: <Zo6eHVBcUyznRalN@x1n>
References: <bcd6ab8246348f18fdc77694e321ee6458f05781.1720597744.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <bcd6ab8246348f18fdc77694e321ee6458f05781.1720597744.git.christophe.leroy@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_074350_506880_2679615B 
X-CRM114-Status: UNSURE (   9.46  )
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

On Wed, Jul 10, 2024 at 09:51:20AM +0200, Christophe Leroy wrote:
> From: Oscar Salvador <osalvador@suse.de>
> 
> We provide generic definitions of pXd_leaf in pgtable.h when the arch
> do not define their own, where the generic pXd_leaf always return false.
> 
> Although x86 defines {pgd,p4d}_leaf, they end up being a no-op, so drop them
> and make them fallback to the generic one.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
