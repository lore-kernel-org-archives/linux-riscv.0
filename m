Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33712606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 21:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cc2dD3jG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BOK0jA69
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PlrzFkI1PRKuDaAEJdgNjwX5hgUGfyf84TGIAlQHz/k=; b=cc2dD3jGXzA7RPrDLHE0htUOML
	sCh+nGn7oejwN2+pL5PQXbcc1Hl4i7NJWlNg3WTYQgBCT7wP97NqWlPCCKmv4qA5PSa+GzIKfgr6K
	CFcnhcwTICRopmbK0YDdqJ7yVkDznQbUFrMOadj1cNYZBlbWh/IY/VF9AirXRdDebCMxWgabVTnPj
	/Vjw9eD5TS8lGXs9htDgS7BA8YBD3DARtD9up0SShxCj4sdmBEeHr6l7tw3deCL2sqTha/Fb8xVaK
	l3JB/8yYtbSO9CkLx0LoKmo1JWSYa/MFFwSlIDym6vBgd3TTqQ7v5JwyxgH2/+PRtR3Cbh8rRLDC/
	kh44Qjig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMa6-0000000GyZ4-3ncd;
	Fri, 23 Oct 2026 21:13:42 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMa4-0000000GyYg-2C7p
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 21:13:41 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so12312721fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2026 14:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792790018; cv=none;
        d=google.com; s=arc-20260327;
        b=N1niYOm5+3Nb7oJrz4GpxL4W0/W8HlACElpza7V+gWImGJOm0WCWeVtlz/4Oiu2Ihk
         P2y07fopFHfxsb6Iy7a+WtDKbBV/sYVCXH/OQbmOXbjeFycoqMRBeflnPn4Qxzmf2Wsa
         i+Uhta3PaMq2cStTIyNKrDIwi3594G8fKqX+C0JjV7Krf9v198lP+2mdp/8130WSRUfx
         VaAGMmqglLoM/Vf31LhQTN6FhaeG/5nbpeJjskZYiPduDACYYUHYW7UFI6jobyR8i2Bs
         1IJPgyDoIyIpynggKJj7xBNSNElhoVAROIpE1fhD7M/kcStrY1hYLgv4PdOo32AkXwLi
         YLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JUnmhWE/6nuKeVluLworAnQepkBWhUtRWFlIO5F95AY=;
        fh=ByGmLcseM4MNmxwD6VeEpp9iSa+798i7K76ys2Z585I=;
        b=lbc92KZaCF+yBnB2odX+vxDHj+ctuRU6HU5QW7A0eFw0wXdQ/Etidbr/Xu/d6ZBNDL
         q0gW65dcOT/sPFNruHtSpBLVf2iw+nlXUsMmDg4LFu+bwKOm8BnI1+6Gow5u8NN2AD63
         0rCGw+bcvFJP1rNJ+ieAGNYozTPfKj2jJiG+6tqGlXAuXaxp+ek8unl0ui+AJvIGjOT4
         XQCJ0nsjrRXFRrv2KUqKggzQng5bVuJTDVwmoijptsHIV//FPCwjH/8Q8e/v/rhkRvPM
         ssN1H5sn9hLtFC51gvhnZ1A+Tokk36wpreE02qNYEeiZUGf4A5Ey92V9cnAUYKjHmTQs
         2iFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790018; x=1793394818; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUnmhWE/6nuKeVluLworAnQepkBWhUtRWFlIO5F95AY=;
        b=BOK0jA69r1+2DKMEcscKr3um9xgvfJ85C57MMuILS3DP3bmgwGn+FDVJcgdjxrn2pl
         sfKcRC/a5ZJFuFWp+zHZrS67xq/8hW3GotjQkkraK0urVn4VpmdCThotrQX2CKKLFcfd
         DWvrK7A2U2oZmJUDHo3f18OgmjITxBo5+IvcKbZiFKA/AT70PQ85EmjEbcBZr4db6h6w
         4M7ZWrvT/UGmbf+usqT/jvgDYf0HTz/YqAkgA8cQ+HE36yJ7e/U5AVvX7zz8leav92NM
         lqf5zXzZED4s71EqpOQ54Wt/WDtpurfWM2dQiVkGco3eI1Ubo3LdfQxQk26/XTILlq7J
         NQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790018; x=1793394818;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JUnmhWE/6nuKeVluLworAnQepkBWhUtRWFlIO5F95AY=;
        b=QCPkrkPmymd/AFjTZKpbFKmGpCOiVKzyBT/yQno1x0v37fwxhkmuHq5OQH0RMH2hmO
         8kUovmDbL6wb5VCHyCDd6W5zK8WvZf+37fpZAk0DUrr9py6qZ6S16WTSAHrSZ+diD8/l
         V19/eL2pw8TdYfMIP2gT+iYN7P7v/zWS2bjPmZ0fB8YYPoTzD8lW6X8lRa4MrMicr6of
         XYNU8/zqN5oMEYHOrcvj2HH5XGP9Enh+IgTU7wbI8u3Ud19YT9o6J2QjTEaUP5Dv3ntf
         lg+pLVDJxS9VJc89xyrjdiyNy44d2XEuz4zQ6d/xLCw38PcfCD9H6FEJSv59GXKimoUc
         fEqg==
X-Forwarded-Encrypted: i=1; AKwUvBzKAD68jgLRRB/KGbaBP5Xw4XQ6qXQS+f/ecuj26ZBxDvdSUkGZVwQga5B5ONCx0aBGoUgNZx8fVRQYlQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJHH7HIjIKt/OQknAGN7Q7jup/Mzf/e7Xc0b5XsDUX5nYCh2oq7
	ve1tiVEyWWcKdfnIXJsqoMs7MUoU99nehUEAOesSUwOARJr5jg8YHMvoFJJugmnmwys5YNXYMEp
	U5/OOxuHF+SIOAtkB7hgsX+uwXSd1WQg=
X-Gm-Gg: AYBFou234ymxVzsWeS9mQJ3oKYidZpdgIjgKzgiWWdjAPrY3lgyoSBal0YV7OqMfVYg
	6uJ4N5/ZW1cC1kB8XVyMcvkO4iW1GP9xHKlB8AU5/6kiHqdBiqgVAgcd4sE/owGOVEXVyJV2DhF
	adLsGSJT9hvKszUnNBvgcfIw+GP8gVdD5Avgvt8Xf5wKBr53MZkxu3wrvOCs75IeXL45D14Sbdr
	O39JKkvT6IIrH3TzR+0BnKJdof0FZ/FydKY4kIDrqSfdEW1JFp4rZkZNuT1CDMXQOMdoCPmvSJ0
	SPiPihLmN6xprMef3zAqi7WncTMIQz7EMLpGA/Ky6vvoMzUlXusVSr7wbLTGM0DiplrlwR+7rjP
	bAy24bxn9reQadYzDktdh1LwTuV4MUYO2F4c=
X-Received: by 2002:a05:651c:31c2:b0:3ab:1dcd:934c with SMTP id
 38308e7fff4ca-3ac6fde7f59mr807181fa.1.1792790017198; Fri, 23 Oct 2026
 14:13:37 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020053435.1179054-4-oss.patchbox@gmail.com>
 <20261020053435.1179054-5-oss.patchbox@gmail.com> <20261023133546.GK3381610@ziepe.ca>
In-Reply-To: <20261023133546.GK3381610@ziepe.ca>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Fri, 23 Oct 2026 17:13:25 -0400
X-Gm-Features: AclHuK-BL1qI8bRaWELf_dQ7T0J3FzJ5N6gMRBUwAUZwcBedJJGHcJxZ4v19rv8
Message-ID: <CAGG=RgB9QziCsSXxqY0ZLYGyWhDhoqhOzxRx-W8Jomw=kCrb9Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] iommu/riscv: Keep page table pages when IOTLB
 invalidation fails
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Tomasz Jeznach <tomasz.jeznach@linux.dev>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Fangyu Yu <fangyu.yu@linux.alibaba.com>, Zong Li <zong.li@sifive.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_141340_592553_7FA010C8 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026 at 09:35, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> Invalidation is not allowed to fail. Drivers always have to free the
> pages.
>
> The system is irrecoverably broken if the iommu driver blows up so
> much it cannot invalidate.

Thank you for explaining this, Jason. I'll drop this series.

Thanks,
Yuho

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
