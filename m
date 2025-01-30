Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C8EC0218A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 14:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EWpsqZVYLmND7WcH8KNdFL8tY78CNXmf+c2Z2HC4Kg=; b=IEdyR5WRErEtyz
	aS19fPPdZAVem/XbB+/WBZ3FyQJ1YWw3VSjk9/hMsWJGp95lrCkNqBNmeg4LmiuGJ9IIRCPvLoMHf
	4dZyTYVM4yNQIag4QiGnvUtc5aMpUFuN7/ei6awROVgEW18JtuNvh7rQhjkoZxyw3tzVyQzqpJWGp
	zchfNG2fqBrW4K2yVBFrLDlYfT7OmYCgqlrSekOR8F+TPr1EEbYwhS4HVJiTfOaWtGw/xDZyNlqBP
	dxD1JtIJtUfNjAiMYg6ABjpsOD6C77cgRZmWWhnHCum5MDdD1pkJsdcvCVqc+qds/z7pkKClKnoEK
	vEDt8OHRg9oZ1LfSMzkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdViZ-000000090Po-2DaW;
	Thu, 30 Jan 2025 14:40:31 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdViW-000000090PK-2UxT
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 14:40:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4361815b96cso6391505e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2025 06:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738248027; x=1738852827; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pPBTtW6Kt1BXFlVK5dAgEJRX/SS7fw33DzTFtzfc1pU=;
        b=nMrvtFBnI8j7/HNmo63BzaMj9eeFK4tdDqHbxTRK+HIMAcIoYgRa3qARhgoDNXFoDb
         CHvwFcuiivqB80cyF+RNIq2Cg3vtb0yfGqkdo5KRdsQsZtjIlTfEZCpqphHDELPyR+aB
         I3UV3hFW8L8F/iVVojm9LmmOiKSU/DwP9LAgxFdPYtttLlohIZU0e5YqiQBhXg+rtjt5
         +t+YBkuuljy3lsIU8j63md3pVvc5E60fC4aDWosKTNLbv3pgOz3uJgzaxQPQzxtF1NJD
         WJ2ayU1lgtg+d2lwqy34VbIiWkSw3uwy0/6tF7pkbuFR5RTga0M+/1vWewDN4Z5+9x/3
         lRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738248027; x=1738852827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPBTtW6Kt1BXFlVK5dAgEJRX/SS7fw33DzTFtzfc1pU=;
        b=SSqXVC4wATyjbPJi1s41VGKNZi+XS/N91jbfZtr4fYrmQOSzUX8EQITUmiPPFZALGN
         NoeorJKerFfQ4S1QGYHNUiaCm1qs0uoVuuI+IKMnyrK8Zt8FKaG79sobDtB913bgluIx
         4+hDdTGnsi1HlcUhFe/azsb0x9s3AP2gREhWRQv5HP9IWb9tbTxRi0arkXElRWBOX6vb
         t5O+0s3mX4rt4uUxBVxAZ3iOcmPW20BLPsuagUWUKEAfqELQoHTVc7D4WbpkxQoWXYJn
         Zpz5lRpre9W7igjszzIVuIJ14YdWk4LHDSm/XjSU883SFHDfsd5oq9m4g1AAcTyccROO
         6TZg==
X-Gm-Message-State: AOJu0YyBkCa+JuDaNoKe4yHkwXei8ZN0rVvVQEOGBlSuLIEMwbXfvfom
	5dS/bTj5m+SYDafqoLxHR34/1kcpICMNB9LAdyAdXqKLNcuSHLw+1i8nJ+Qihsw=
X-Gm-Gg: ASbGncugEV9Zr9SCG0RpbOnKhtMvSU1zoFR09lZCsFcp+/iylrdxxB1lrWTOqy2rpzi
	TGnimVC+CS9CzX/3MjdfCYmZBsBFVqUE1GPuXSLpXhjxgtY8wM7lz0b+W0vjwmX/or9Tj8oe4LG
	Eo76eZZQeUGuLVtU7/Or3q0APmsk+LsVq1klWLoMSkFQtkTGO1YXgoD6eVdC0Shf0Np+elo+o5v
	wCIP2zQku5hqO5/oqqGJynCPVR451dv+RoEY/eravtSrDmHQpjt//F8h5oYgANXpZTjNkFFQafZ
	oyw=
X-Google-Smtp-Source: AGHT+IE9c1sUJxYYOz0IV0uwPeN3BgTxowpPJeI70581kypJPFyN9A9c1n7gfvfSwFoNCtR1uaegeA==
X-Received: by 2002:a05:600c:1e0d:b0:436:f960:3427 with SMTP id 5b1f17b1804b1-438dc40ffbbmr62574215e9.22.1738248025991;
        Thu, 30 Jan 2025 06:40:25 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::76fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc1317fsm62032805e9.8.2025.01.30.06.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 06:40:25 -0800 (PST)
Date: Thu, 30 Jan 2025 15:40:24 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
Message-ID: <20250130-603e0305dde8009a25bfb257@orel>
References: <mvmed0k4prh.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvmed0k4prh.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_064028_640105_F9BED75A 
X-CRM114-Status: GOOD (  19.40  )
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

On Thu, Jan 30, 2025 at 10:25:38AM +0100, Andreas Schwab wrote:
> Sign extend also an unsigned compare value to match what lr.w is doing.
> Otherwise try_cmpxchg may spuriously return true when used on a u32 value
> that has the sign bit set, as it happens often in inode_set_ctime_current.
> 
> Do this in three conversion steps.  The first conversion to long is needed
> to avoid a -Wpointer-to-int-cast warning when arch_cmpxchg is used with a
> pointer type.  Then convert to int and back to long to always sign extend
> the 32-bit value to 64-bit.
> 
> Fixes: 6c58f25e6938 ("riscv/atomic: Fix sign extension for RV64I")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 4cadc56220fe..427c41dde643 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -231,7 +231,7 @@
>  		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
>  			       sc_prepend, sc_append,			\
>  			       cas_prepend, cas_append,			\
> -			       __ret, __ptr, (long), __old, __new);	\
> +			       __ret, __ptr, (long)(int)(long), __old, __new);	\
>  		break;							\
>  	case 8:								\
>  		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\
> -- 
> 2.48.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
