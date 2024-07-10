Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165B3C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 14:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tv5qHNgK+xQTUhTHpM28901EJ2vLMxx+Iw16jaDYa6w=; b=0YunUIPIBYs4bT
	omOZ5lOsRIk1gHNGUPKDQMPQKjJVIpl1SdrKqGSwC1LmndHhdE2vwRhoU8LGnP06YpySfnPBvhBmY
	aLz+hKGH8PNAB6Vq4nL85hAUmRxrZxlhJB6+jTHdZUyJ4nmijQ7pIzYPhZ6U7TefAKO9w3pRNXv1k
	JT3WdsIrJv0j4K9s+Q795cgwknXEenGvtUo/fgbEGVpDPPkNVIa2nnrLrBb/+vVs0D9a3ONUhuwL6
	McBUt4R8GGeXY/hfz7uCLg8ru9s/h2hISVJfAFNNiE02Y2nuARWaycnxhvICc+biIG1nIj1fD3fUR
	2Ksb7t8T604XCKkMz7Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYa6-0000000Arip-3u4P;
	Wed, 10 Jul 2024 14:46:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYZu-0000000Arew-0kui
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 14:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720622753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vuZByBoQ1AErbnDxFMqwKYDz5/nj+PfxoenuXb+QI3g=;
	b=QATPHmBgVNiz6upotSvwdSVS9ZSWl+JNZjcs0tsrAis0l2bcca1oXynXalw3ZsjazLJRxf
	jJJkFr02oPJoICUG7DODBDJplHlmSH6o7m4bzEG04NeI7FaR2GwJS1SWb4V/o+TDHVu0K+
	fI4yGfW4LMAmPnWfbyd1Cyjzh3VaxjA=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-rVqylusNOUKQQmD2-02_fw-1; Wed, 10 Jul 2024 10:45:51 -0400
X-MC-Unique: rVqylusNOUKQQmD2-02_fw-1
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3d92e5d767aso591392b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 07:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720622751; x=1721227551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuZByBoQ1AErbnDxFMqwKYDz5/nj+PfxoenuXb+QI3g=;
        b=moobTxDKG9pPkRr6arrHiv/FKtM6GgapUNtkfQM0M4/r+NEsLsTTY8Gv+MsIjiSXoI
         Csoyz/pY2weVZlnRAlirKRrFmFNxKi2/8rlfpHdiA9nthYjPrvOdclYhudfsXMek5dCR
         +0BdXYKmGcB0Gv5SDK1NYHbbtmFj9BB3HUfDdqJiTaytRjLuWDG7kuOgrO3lPUInsym2
         MgjrdcZ/hcSVLLrwpVER8yPDEj6YI63v+BKpajkuXkQ/uBeBg6JBDY3LW5zbFkDwfy5R
         8TJJqKy7B3WGqcEZ1qPEVRnvxlPEuox69OdkJsQdnIFJO95buH7V/+Xoyos2B7yQC+pc
         Pdbw==
X-Forwarded-Encrypted: i=1; AJvYcCVYuQktF+dJf1DK6v3+Y2wwNHF42enzhUVT+bl4FMicBX7lDrCUusp+pF2jxE9mdTNFNQmk3U8cl0klCrviSjcnrNb74LtantqGaaw8jGQQ
X-Gm-Message-State: AOJu0Ywr2LOj5+Pi/b6bLv2oSE35V3iDIMW5IjRBF81g9/rYVhhGCAA0
	Fxqosw8zIqfpet1SjQQ6+HZM7Z8zlXZK2jc5ggYVoY5Qeu+ouAX6rIU4+BuYfx17DDLjtm60GN7
	kZjRHDEvh9h/xi+6TVj58M5m1WlhK+wUaXRLWeUuQoAueQ2dypEJ6h+5V8TrTuIo8Ig==
X-Received: by 2002:a05:6808:2386:b0:3d9:33c1:29ef with SMTP id 5614622812f47-3d93c07c3e8mr5459839b6e.3.1720622750842;
        Wed, 10 Jul 2024 07:45:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYFNo60WHX386FdDYkulq2RlUHLqK6H506/igBHtgzdpVY0R4HJ/zDzB+r5Z2zD/uJfYuagA==
X-Received: by 2002:a05:6808:2386:b0:3d9:33c1:29ef with SMTP id 5614622812f47-3d93c07c3e8mr5459824b6e.3.1720622750528;
        Wed, 10 Jul 2024 07:45:50 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-447f9b5a662sm20972631cf.54.2024.07.10.07.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 07:45:50 -0700 (PDT)
Date: Wed, 10 Jul 2024 10:45:48 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org, linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 2/3] mm: Remove pud_user() from
 asm-generic/pgtable-nopmd.h
Message-ID: <Zo6enCwreppncIel@x1n>
References: <bcd6ab8246348f18fdc77694e321ee6458f05781.1720597744.git.christophe.leroy@csgroup.eu>
 <c31a39463929daba6c91917598ec05cf47103af5.1720597744.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <c31a39463929daba6c91917598ec05cf47103af5.1720597744.git.christophe.leroy@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_074554_317989_7FBD6BBA 
X-CRM114-Status: GOOD (  10.92  )
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

On Wed, Jul 10, 2024 at 09:51:21AM +0200, Christophe Leroy wrote:
> Commit 2c8a81dc0cc5 ("riscv/mm: fix two page table check related
> issues") added pud_user() in include/asm-generic/pgtable-nopmd.h
> 
> But pud_user() only exists on ARM64 and RISCV and is not expected
> by any part of MM.
> 
> Add the missing definition in arch/riscv/include/asm/pgtable-32.h
> and remove it from asm-generic/pgtable-nopmd.h
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I assume you double checked the riscv cross-builds on both 32/64. It looks
correct:

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
