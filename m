Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A663C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 17:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFVhheMZRjkiXOEZFFBYLKfzeVRp+cX6atICaDYqUFE=; b=R1/LKvXcYyGeuI
	WsNALEKv9oLhS8ZiiMMgGef6u645C7SjaeDaaPiipD1Igjwl1lPBaHcTuQu9YpIlo4X2cGW7S2US/
	hwS6zfELv3iTBHP9z+FomCI1lrH43e3vF0C6hwfKuyUyClDnv8645zesKKsyyM6pUlhk2JftE/5ev
	UvLsscfbcDSsH1PT4JpnWOWxObD4jobYG68iiZMRUQWQwv2+KEBiK0zMmfkm/wEIRZxTZQduk9eaV
	5hWCpTCneXaT6kvE2QtZUZxsncDFQThIDuPZRyCKQ/11IhQRB0cwHoiTtrT7zWxioiEi1KwupaCUv
	3hZ0CYXWa0Bkimaj5gmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5UIt-000000062xk-0qid;
	Fri, 10 May 2024 17:45:07 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5UIq-000000062vu-2F36
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 17:45:06 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6f44dd41a5cso2345796b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715363103; x=1715967903; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RH25751FQUD9IraRYi3Ng4hTjnmqYgAtJrim8UnR4Lw=;
        b=EJicJ+WFK+KsAZYkdL8ME6PRg3mvnbIM6zfA4wnzB3IwUIK3SArjDZYSKMqsnigOIH
         4FlWEAfQLGWYVMh7IHOBGkhX1PETmv13OcXJEyIowwx/8muRb18btmwhTwbsgznBJjv2
         q4M1jL2JhNyq/xfpEE/v24nridqKgLvAPNmsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715363103; x=1715967903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RH25751FQUD9IraRYi3Ng4hTjnmqYgAtJrim8UnR4Lw=;
        b=Ks+KgLVgivdPmDThQes+NahQHzvxb67ov8n9X1wmvML/yxY6JWRtEvW8BmgRuLK9Z3
         Gegna04CkIh6cl2t1erwLc+ZVymYTW25J/VpF5JLR869CeJROwUVjh09lIByjY0Kbu+H
         2TtKNXaEwoJfDzXustGAswg5BzEGe8i4nz5jxDAN2g/KS5i9dOq1oors+/AUch0OOqjR
         vxEqjUe+R4jUwWdSLRGWYiuVNgtDbXCxiQew+Z2WceTuhpVxFUBpLk89RZ6KRxzcrvgH
         i7TmrFOWxOMj/xGpkgUCIBXPffaKO9CVqtHWxclnek4ltxdidEOz56rvdG4LRluei3u+
         OwFg==
X-Forwarded-Encrypted: i=1; AJvYcCWfBJeshXPBkhJwc4S6e7eyRsniU3L43vURHfwPL2+jPThydWr1pASBM8S6+mQ/MV8ov2bpUERfH31tfkX3dwiQvhK6Wa2+MBzL8n8wOLCN
X-Gm-Message-State: AOJu0YyzFvTA0ObZnR+ntqxUVPFcy0UxoSZfTJuN7pOq5fuuUz3OLjbQ
	q6ClyhMMO00JsUxKzJtZd+weVWGNsT9xHqf0D6Euu2CjvbZ/7r7OPyXVPLuOvQ==
X-Google-Smtp-Source: AGHT+IGGFWmKinmr/BozpgZxQxrIJHVGNpMfgrtBUBSomrJR7j5qbTiNJokxk2pPxp48vFhrBfY0LA==
X-Received: by 2002:a05:6a21:3405:b0:1a8:e79a:2b0a with SMTP id adf61e73a8af0-1afddf036eemr3785881637.0.1715363103156;
        Fri, 10 May 2024 10:45:03 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6341134706asm2937275a12.86.2024.05.10.10.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 10:45:02 -0700 (PDT)
Date: Fri, 10 May 2024 10:45:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Edward Liaw <edliaw@google.com>
Cc: shuah@kernel.org, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kernel-team@android.com,
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
	John Hubbard <jhubbard@nvidia.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Subject: Re: [PATCH v4 55/66] selftests/seccomp: Drop define _GNU_SOURCE
Message-ID: <202405101044.DB260BB@keescook>
References: <20240510000842.410729-1-edliaw@google.com>
 <20240510000842.410729-56-edliaw@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510000842.410729-56-edliaw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_104504_598162_B3292A8A 
X-CRM114-Status: UNSURE (   8.64  )
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

On Fri, May 10, 2024 at 12:07:12AM +0000, Edward Liaw wrote:
> _GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
> redefinition warnings.
> 
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Edward Liaw <edliaw@google.com>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
