Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC8FC5AE59
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 14:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZjfmvqCX4Bi9AeaLDfd99HUlTRn4sztvttt9bM05oE=; b=Ce3eFTWuOlJkFI
	5lgTy3z4dAAQQkSQq67lrvl3qePSQh3K4bcSrq4hvUFL2oPyMy0Wtr6c8Wei5uVK8JFVBYmSXu9SC
	Cxz1YueSzd+pl8sftJGvhEp3y69qvrR8J39Uze1I7F2YMiit2nezN88Asi1osDro5mVhXJPkleVLd
	EVvp1wvuwszPXQEU+Uw2ENGXwcww9sxAcD8kBhxrxjpkdy/1GoSwxKZtBD9gRIQXbj8T4I3rZPjXk
	jcM4NjtKXMXxa0PN1aR6TD4Ez48cciPsfPB7d1yR1tRCyn0OZQP1rd2hSH4q3MKV6A4MevB6lbD7R
	xyjLWGwyucL+Ux7pKxPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSNf-0000000B8yJ-2jUE;
	Tue, 03 Jun 2025 14:12:43 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS32-0000000B62p-2yju
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 13:51:26 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-48d71b77cc0so65881541cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 06:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958684; x=1749563484; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VzY+cZCL0448RY0GID08t4arF/zf+2+XaBNqbHYkIpY=;
        b=N5xviOmG313kcD4OglnXOUTK/FF6Ai0vY30PeNj5HhkGushOMMhI9uQtYYp4f2sEZo
         6wSF+5Wh0k9/JY9ywaC7/jwCDboQal8HRE79ubWBY5e+WuRWrkzuwOZLY9yfaB1u91Gk
         n/zfhTGyfdoteCTizx4i+BHY9pEyfDWVFyvUnSjhOinREAqtp3k2ZqCLL82duI040mxC
         tM1T+BqaQh3U/ZvU6nZC3sej0nnccWgiGpK0YguONqUsVfdg1MR2nd1M6sPaRcZv9LQC
         A/xx4WRiLnfoxafHv8vohw8zrwVxf7KXs9IMjyNqeB5DtD7/zj8bPBWnyOce0LWVf5t2
         pm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958684; x=1749563484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzY+cZCL0448RY0GID08t4arF/zf+2+XaBNqbHYkIpY=;
        b=tYhHVA/hEJwYCuTrq7LMkwC83HWz0JsQt4vm9YWxbi+wYnAob/HF+DjRBGHpRorM7c
         kstC8LvM8D5WDCZkfCWJ12s4VzqBnd1/CTsd4Tse7NoLN4+3Kwdu5DVkKgYYEuUP89su
         2iK4lcA4JWfmPCzMc2FqrRMlIntlAAgeZxCy8UzsjWNhf9bczdQxSAfqB3/FWgWyU7KY
         Y/J9/8ylKaS8QcbbI3PZh84/EYrJIW4wf8Io9UOPwpN/HeMsu09tsdJl55uf0sl7gEdy
         LaHLuBJU1TbkP+18gxmb5557H4+wfvmvk9KDI1lbcv7MeoJKGXlB2off2A18/S6mlag4
         WIuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT8YKYtiwSs7JFB6OfWJJ0GyhsnyjQjpjzLOKMPBDYT5DH5EiRmC2pti86vVYSxUbkrcvCPXVYPfMWnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFWHYDir3x+Dg7redR9VeSWvG4ClXQHFwLeYXvF1FLLQeP03+I
	WXR3y3z1+AhVnLPHda9Gi8FDy2nznwWlEXgIpn/vAnYwbmdVMgFVBq2RCkZzZcraSi03n7z/wXF
	vs+Nl
X-Gm-Gg: ASbGncuZe0P6NCINP5yV3VFu1MCabranpPyu3f4J74Qu1+o+SOeGppahmNC+feNsfGZ
	5Dne9+Ipk/JwLj2Bqf7LBKyxENkNcNlDwIB9rVktZsFdfwNnEOOTkocd2dtcOhBCFM/vktJEbNM
	DDeCL+fJrixATqcj8+iLLZfJgwKXHlGVTpnqvaBDVzk6udjwOt8PsuSJKmQ/z5biA3SmipMDtOG
	LAK9QgAxRXr4ueB0exQQcXxj/mpevkYRCMpadI7C67ImtBSgJBp7KvlP3njwG17UANn9B4KgIab
	KsI0jaEPqR7qbPtiih0DhKcV3dR18Zf0khknjrZ9kxC+0n1Oc8H6FDo+YRcrFyRdbhL7qkR4eln
	sj4t/hHQJVWIQjW5f7cCzdc+d9OQ=
X-Google-Smtp-Source: AGHT+IFvqH9ubcC6dbv0UqQGW5DGDtp+BZ9QNaQHwHo+bs9Vg0oCfSh3AzQ5xeJI5fTattmwccxXPg==
X-Received: by 2002:a05:6214:2aa3:b0:6fa:caa2:19bc with SMTP id 6a1803df08f44-6fad916605amr159392986d6.44.1748958672893;
        Tue, 03 Jun 2025 06:51:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fad0495cf2sm68040826d6.39.2025.06.03.06.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:51:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS2p-00000001hDX-3xh9;
	Tue, 03 Jun 2025 10:51:11 -0300
Date: Tue, 3 Jun 2025 10:51:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 12/12] mm/memremap: Remove unused devmap_managed_key
Message-ID: <20250603135111.GM386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <112f77932e2dc6927ee77017533bf8e0194c96da.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <112f77932e2dc6927ee77017533bf8e0194c96da.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_065124_755213_29DEF842 
X-CRM114-Status: UNSURE (   7.83  )
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

On Thu, May 29, 2025 at 04:32:13PM +1000, Alistair Popple wrote:
> It's no longer used so remove it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/memremap.c | 27 ---------------------------
>  1 file changed, 27 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
