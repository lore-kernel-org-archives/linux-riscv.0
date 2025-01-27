Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AD7C02188
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 18:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29MMZM4rU32++OjPlX2ff3xK0W2I6CdQ4IwzizgmQBw=; b=oHjy4ggFQDaD9b
	JTWAR8Stwes/WDQVpKxsmt3TCfoeBZx2pQs/i9NHrkkjpbc+7aW/4VRK2mDatv1uqHyRULw7Hrd0z
	kkQtSHHl8Ad/ademm+E09XqpecVAiA2RqZzVbmDECLDL5OdOVTmC+ezVOyUP+3OQ1yav8FyVzo31g
	RHcP2SAgMTalrAoepb1qqIzrZ+bf4be3narupysWwNH7SdIKl7ZmjXhpcXL5FvFHkTQVIIdhH2Snc
	doO+HqUz7Vz5tIAqQOYDqNWcsVJ8cNxpIQDlFHewh91AKg42pav07tZMBzJ0heKGLh0iFI9xzMRbv
	Kazom3UZ0jkivAJiLUYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcU8u-000000033qS-3RXG;
	Mon, 27 Jan 2025 18:47:28 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcU8r-000000033pq-3TpY
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 18:47:27 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21670dce0a7so100678895ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 10:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738003645; x=1738608445; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bkSF+0ISeerq10paktOlHZQEYwsvQQQDuOj7ECb3/tI=;
        b=TksEHPYwmYKmA+2uQMruBJytOnvH9qRMZA2W/xmWKO5+9+SaNr1xnNw5uuqGx8pnfA
         kk7j4/teGItCQ4ez90SSodwHZ5TWd1ne/vDcPfQ53ENM4MrcwptZ3EJn7bxffzVLnzIu
         mT07Vj4FvvFm0XHMptrwX3tCGRK5+x8ZT52AzsnKRMfPrgnKsxKGjKJjW40d07Qh1E5P
         urUUJ9swjfg9JhWZYfgmTERU5EDcIprOKjkH6oty70tj9343tg6H8vkhUgZuXFPJ2OLa
         QfUz92zaRPR+9L2Pe8ocTK8zpPE6fpcX1RBv9khe5eJzZAJQKdmJJQEfFuOWD9DZa8H1
         P7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738003645; x=1738608445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkSF+0ISeerq10paktOlHZQEYwsvQQQDuOj7ECb3/tI=;
        b=tP+MYAPS5zsI8/kOu79gfCy8KUe87zYQSpL6aBKh5lF//9HumkYwlUbPYi1M68SLO+
         b1bUNY4UmJ9qX7vGMS2Q2oBXPadUtYLE+U1nz+vJe6fU4/nTzm1Fa06HzJOFIRpyl/7j
         QICeDyR8Kk3LElFt+hPXabhmQ/6KaLHiAmYOqOcDwlQQ/Q7uU2kyjEluFrbvHFRXT18t
         2pLGLCqaUw+UiNDT3bvFAK0083rOcXjn88zDOfLWTCLAZbSIj3HKy3W7h26ZUoi0udGk
         5KUtTPuOwv+4tgGitrvnrEpmIDRZ/BoiEcVdqnAaKPcPJ+pL17guJwpqu3K7TI+Nxdt2
         YXzw==
X-Forwarded-Encrypted: i=1; AJvYcCU/d8AqQW5EgeuyDW7T7Z4xbPymYE1ZObD33sYr4gHXafHwFZv9WK16Cv4WHYHkKVpwkIxw8Y22xyCxmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPQUSNDKF4HlRqqWMJH4D3IgCbPZuciKkg+zkRtwX8N/MDHqcj
	cxJ6sZd1QSCMJMSSZBjKB7QzJciCdoMsjjlyAf+fGgoGlEN8myioTZ7iWhRyaLA=
X-Gm-Gg: ASbGncsLvNdpSECwzg0YZ9bvpEhZoC1BD2BOMZrWQOmLC6vVVbyEXvACXwOmHASF6vN
	vGfDEXsz6muORXXPMWdiBFK4VTRsFz4FeZf31MCzqK8vVorkimJQUG2ZPdDsGDaRVRB9N6UtL08
	TXDCm0AAF/Jnx78zFkURt7JG4C1YwNfNC9lBI2p77iMvRs3Wd7LtQfHw2KJFgFENzjM6fcKX5Dq
	np5HDtndLMZXZDac4cOQxL0iXYP+NHzGo1cwSZCEu/3axhn36IYUkKU7sb2xZUaPRaiY/HQXu14
X-Google-Smtp-Source: AGHT+IF4DDDvvfyCwXwxozX8ipctJkmqqL71HB2zFupCiXgntkwLtEh01Sy+sLg23miQ5mHF9eG+tw==
X-Received: by 2002:a05:6a00:21cd:b0:72d:3861:895c with SMTP id d2e1a72fcca58-72dafa030ebmr62134321b3a.8.1738003644966;
        Mon, 27 Jan 2025 10:47:24 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:e3cf:e6bf:f7df:7ed2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a77f6f6sm7479122b3a.155.2025.01.27.10.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 10:47:24 -0800 (PST)
Date: Mon, 27 Jan 2025 10:47:21 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Add runtime constant support
Message-ID: <Z5fUudFfYz9FCh1k@ghost>
References: <20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com>
 <dc193d9d-e8e5-4906-9fcd-ee8cc919acd7@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc193d9d-e8e5-4906-9fcd-ee8cc919acd7@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_104726_130870_DF8DFE35 
X-CRM114-Status: GOOD (  13.67  )
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

On Mon, Jan 27, 2025 at 08:51:04AM +0000, Ben Dooks wrote:
> On 27/01/2025 08:18, Charlie Jenkins wrote:
> > Implement the runtime constant infrastructure for riscv. Use this
> > infrastructure to generate constants to be used by the d_hash()
> > function.
> > 
> > This is the riscv variant of commit 94a2bc0f611c ("arm64: add 'runtime
> > constant' support") and commit e3c92e81711d ("runtime constants: add
> > x86 architecture support").
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> I think my only comment on this is we should treat instructions as
> __le32 type and add the proper conversions when maniuplating them.

Fair enough, I will make the proper adjustements.

- Charlie

> 
> -- 
> Ben Dooks				http://www.codethink.co.uk/
> Senior Engineer				Codethink - Providing Genius
> 
> https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
