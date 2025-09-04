Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B29CA1002
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 02:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFz9/9APuAxDkNVo8lmdzDioyMLwFWKRGxpZZIQ1juI=; b=UwxC0pQUTDn3i9
	eV5FsHkmvEZ8nFso2CwEuj5Mq7wt8cNoRbWNSYd37sg5iceLpY6hnOWJYaeGmVN7nVn4mHcOfym1g
	a5fXXG/rGH+jgsTwEHoAaM8rZHG6tN5ofv3gVkMUoiNEYSrDIiF1bCf20fs3L2fM1g+EHkz2Bqvf6
	39BkhF2q1uQCcqZTwF6fHqqXo2OgNvEiEm4jtYF5z2OiafAIRgXinGrFy8AxZ7QAsxs/eXyZa3LjJ
	vTz9Kld/MaBVU3V0t0aa736Z7btCFZfcR4U4H7D54rXejATUTxCQaS+icgaF7JdRoGlbMds/+YVOs
	pQYeF6TZNCkL2cjlgYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM4M-0000000G3hJ-1QwC;
	Fri, 05 Sep 2025 02:20:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuHfC-0000000EcFK-0csZ
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 21:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757021915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9rHD7plJVEZkv8PkFJEx5BeBVBt5QFBtzvV5bLJfU1s=;
	b=e9AbxpzukcoKaOXSeXcp2w3w7k2MS+2IyhSpbfnhUREQ0UIZ7BCE9qj1yqrtxOdSrvzjTC
	YPGkhDyA76fdqF+amJQ3SE2d/QTdtu/tmsliab5J2tRhxI89SVzLzsByv5Ijve04EkS0du
	meZvvHlh2Zv+1cNBUPG2Y5DjPFA8Y5c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-L7NG37iPNg2iys1IFgTXlw-1; Thu, 04 Sep 2025 17:38:34 -0400
X-MC-Unique: L7NG37iPNg2iys1IFgTXlw-1
X-Mimecast-MFC-AGG-ID: L7NG37iPNg2iys1IFgTXlw_1757021913
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45cb5dbda9cso9151295e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Sep 2025 14:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757021913; x=1757626713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rHD7plJVEZkv8PkFJEx5BeBVBt5QFBtzvV5bLJfU1s=;
        b=lL/87aUR48fosWzyCOZIjtDRykP1xNsvtAa7vOOSW6plYYOwuCtbHhocj9wQyaracv
         RglfSJBiz7nDdXChr7SO1lP2UguoaTSz58OjKWcUlqBuAxb9u7fG+U87mEwwlegfJLNy
         6DOdq4ygBJ5DoFt52TLk5R2E9wpyynbDp7gi6ZvkLrzSJwDZqmTF3A8FPS6xwXAKa6re
         tw33nYr5Gp+l5TEctw7oyupyBwCOjqfkbqrrA2h7saS3ur3M6CTlWZ90kL5TgUOmTNwh
         Ge+0+vNwSJgclutnools29I2HkecUcQsFpfiTwBPcbmiZBYsBrp8nxNMoXKXfPWYV3L/
         p/Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWOW36YXwr2PoiDOsFvsJG6/bG+PAYTVnJAUI+2lUegJDreASpeP4fkmc8w43wubUQqBZSEC4l97xMxSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyCTVUlEUOh6PR5bW9HTg1g8OzMOivF06YfdnXMZXYWUPQFior
	+VBrfMLQEOIzGbOfWLNoGBjDqwghE5jI9LOQTalieyKSMFpbJg2DvloC7BG7FyK3z0VG0+irkHs
	FCnqGqB90gfc9mZ1keCWB/XmvEdtcMCQKSt2+LmDwu5k3PCPs1D6fzXAgp7URti3wI9Ji3muGpu
	zrXWsZ
X-Gm-Gg: ASbGncuWWeMKUON2mYp6HOnJBq98h54+3kn9XxTl+dVedY6WUTsZD6+/sl5ry4Kj7mm
	udat6a7ngKqsfa/khvAExtkQNbWEI5sQlPpsZSOa07KH1nF6jYNtzWJfoRtoJmiYAmW3QMGItfj
	8Go0q+Eza3DvOAI2EkeZQJ3nYlKk0QsdBJseQyye+2B9kUadLLTrJvWM+YG8FRfdu4onHy9VRUG
	fbmugZQFYRhts83IEGOKXuIeaFEqgw8rFWguhLHa6wWPYA9H5JMZNRHCnWXmAWhMAfLxL8N+/6l
	9BmL1/JF5BDjFDILATLlcR1avExL+s9A8czMGScZh+WV/QwfZM0BA+HdDZhsztdY/w==
X-Received: by 2002:a05:600c:1d10:b0:45b:891f:afcf with SMTP id 5b1f17b1804b1-45b891fb24dmr144597855e9.27.1757021913368;
        Thu, 04 Sep 2025 14:38:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWbBDlkpyRRxeIt/+qH4VagktWDBCJazVbSXDHRMhx/diXSZUFSBaQ6M24PtRDNYL0yu7m/g==
X-Received: by 2002:a05:600c:1d10:b0:45b:891f:afcf with SMTP id 5b1f17b1804b1-45b891fb24dmr144597725e9.27.1757021912965;
        Thu, 04 Sep 2025 14:38:32 -0700 (PDT)
Received: from redhat.com (93-51-222-138.ip268.fastwebnet.it. [93.51.222.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf3458a67fsm1872200f8f.62.2025.09.04.14.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 14:38:32 -0700 (PDT)
Date: Thu, 4 Sep 2025 17:38:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org, virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 7/7] virtio_balloon: Stop calling page_address() in
 free_pages()
Message-ID: <20250904173824-mutt-send-email-mst@kernel.org>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
 <20250903185921.1785167-8-vishal.moola@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250903185921.1785167-8-vishal.moola@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JPjE57oWaw50vHh0Z0j4cOxPyGwquAybMFatCIoK89Y_1757021913
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_143838_263758_DEBB891E 
X-CRM114-Status: GOOD (  17.73  )
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

On Wed, Sep 03, 2025 at 11:59:21AM -0700, Vishal Moola (Oracle) wrote:
> free_pages() should be used when we only have a virtual address. We
> should call __free_pages() directly on our page instead.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/virtio/virtio_balloon.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index eae65136cdfb..7f3fd72678eb 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -488,8 +488,7 @@ static unsigned long return_free_pages_to_mm(struct virtio_balloon *vb,
>  		page = balloon_page_pop(&vb->free_page_list);
>  		if (!page)
>  			break;
> -		free_pages((unsigned long)page_address(page),
> -			   VIRTIO_BALLOON_HINT_BLOCK_ORDER);
> +		__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
>  	}
>  	vb->num_free_page_blocks -= num_returned;
>  	spin_unlock_irq(&vb->free_page_list_lock);
> @@ -719,8 +718,7 @@ static int get_free_page_and_send(struct virtio_balloon *vb)
>  	if (vq->num_free > 1) {
>  		err = virtqueue_add_inbuf(vq, &sg, 1, p, GFP_KERNEL);
>  		if (unlikely(err)) {
> -			free_pages((unsigned long)p,
> -				   VIRTIO_BALLOON_HINT_BLOCK_ORDER);
> +			__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
>  			return err;
>  		}
>  		virtqueue_kick(vq);
> @@ -733,7 +731,7 @@ static int get_free_page_and_send(struct virtio_balloon *vb)
>  		 * The vq has no available entry to add this page block, so
>  		 * just free it.
>  		 */
> -		free_pages((unsigned long)p, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
> +		__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
>  	}
>  
>  	return 0;
> -- 
> 2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
