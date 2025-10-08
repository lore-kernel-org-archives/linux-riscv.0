Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40A6CAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 20:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfdflawbP7vZx4OEg3R4GpDzef0IO62qsNMJILbWLSE=; b=BTJ/WZg7k3owID
	qE1UL5t/oVQLar4zMbUTyHhSbZl/DI3oev3+etvlW8z69ZLaK5ndV9G2MxeoO00VHZvNpjp975rYh
	t51+l9M1nVBFcGlgb0bpI5WmzO7DIXf5a0RY7j+GSTBifutWLSwSX4YwdnCrLNhRn2A1gWf4BRzA+
	PsPFA1Zs6cfsVi0ecOBpiQ2/MjtIhDCkIp48/8w7xMD2CkucA5kl4RhgypoDkyVloqDUso/P8GDld
	734/40brARBcwGN95oP9h5h6eC6S1O76iKFezw1B8ZrJiQ0oa7IuYQwP7TfPA47V/siKjqTKY68JR
	L+LbE3nVbDwON4y8Sp/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6aQs-00000004bgP-0pK0;
	Wed, 08 Oct 2025 20:06:42 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6aQp-00000004bg0-2buJ
	for linux-riscv@lists.infradead.org;
	Wed, 08 Oct 2025 20:06:40 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-42e2c336adcso927715ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 13:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759953998; x=1760558798; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3L0TzQeqDcfFcBruEeIiFysrK09jeYbLng26EeL7n1A=;
        b=REHKOCMAu8ywVSrz8hvVPQ5PTna/17G/Kg+SrZojmnqO8P3PmjM3n36wAbJgm7bdYn
         LDNHRCFgXVShczxhX0XoCDTbYI9tz8Mjn7Yf5AH+nMlh3adfOrFuJ/GYPUI8RrUQdCvf
         DVlBZ92p8V0S5Tg8KX9tMfZ887PCYKDPkT5cfcXgcDneuW+QfvAjFXjlNBy1u3xiJ+ii
         0JLf7/j/Ish5NQMAtHf7ZsVwmkBEEocKZ2Rv1D5ayetYy+/q+DwuE3brxtnYgUJWsGus
         IuHu1r6AkxqU1klO9t2OVw27hv3bK/mAxEXPCa+46AhR/li8EXSAMltWAa64atwv9Gq2
         rVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759953998; x=1760558798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3L0TzQeqDcfFcBruEeIiFysrK09jeYbLng26EeL7n1A=;
        b=n0a4PzCySrjLlGttSWz2jzlfyi5QO2GHs9YfWc1ymN3eFxyNOqF28a5d7m4ZeXWfxK
         /ff74zHJve/ckQOnv/ZYtUmh+FgMl+7ztLm72222FlKaN1sTFVXV96wtwl7tcFCPAP6Z
         hdSS6H6goScuASeJT+BjPK2GQXnp06whznsHlVYYB0L9sac38sEK8ChMiiFxGKis2/iz
         GLo5pG0smo8WL3wqsvif9GnB7HNEngtZuI45BkHCxf3mnlUXslRx9o5TeCmb4PqI7ioK
         CLC9K6yzO2k25bTZjUdx1q8EQJzXa+nYfroOwjfaeQtazCAJY7g8mwsbUvf1XAs3Lzw2
         matw==
X-Forwarded-Encrypted: i=1; AJvYcCUIWX6U20KMzKIPUNR3cUhtSPv6pCy0nsArx1GTnsUDp8h5RP50AzJ6mDbdxp+nHwwQ2FCSGx5KGU2tbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwF95GuMKjsWzQoo092WxMOENRWY9j5w/Cp8nWDGYz2NmQSZ8D/
	eTGB+iQksupV+dkmzZXr0YjJ7cI/iXi9LpohaFEvBap8imK+XFi6XNfkNtwnkB1L85s=
X-Gm-Gg: ASbGncu8YewHvxhGIe1BYTOTXzaKXEvRjMnlWWZee6Es/ZAWTWnQQuhgVH5+LfzDPe2
	4k4y6pbGSVGz4LAjJDIScLG9MeQNp9/WKI0GzHtHo7QkZEjAa9jGZxFUGglq8SwzqpEvgyn2Bfu
	QQT2Emy5gKlnLdeHAo+6vDMxBplF8Z2E0PfHBVKURdnBeO+FvKhXse1WxSm2g30QXJ14nczBM7I
	z5u1y0wNt6GBNHn8to32yMvtT9ZPg2zW6Qf6Fnce+nPTJcVVgcdblSDUmK4yj+SU+YmoV0OKiNJ
	0299UnR5Gp9fdVzde5M/8JHIr3eQGQHLDJWlczP5+Yj+A0rL8cMixzsPKvU/BSvFdlb4qeN/Kk+
	q7hrFIWURk97RUxoa/jBtxPjKVNNTswZdpDIXTatFcj65fgck
X-Google-Smtp-Source: AGHT+IFN3BatRNEo6i5XjTnCJ3wK2TT7pw8He6+8H/rlRIxC31vFMYOe8mfsjFfjSQVJM764ysiCvg==
X-Received: by 2002:a05:6e02:1a68:b0:42e:6e3a:3075 with SMTP id e9e14a558f8ab-42f873df5a5mr33757325ab.21.1759953998196;
        Wed, 08 Oct 2025 13:06:38 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f9025dbf5sm2539905ab.7.2025.10.08.13.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 13:06:37 -0700 (PDT)
Date: Wed, 8 Oct 2025 15:06:36 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: BillXiang <xiangwencheng@lanxincomputing.com>, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: Move user-visible sbi ext ids to uapi
Message-ID: <20251008-a966ea0e3d8bb6dbd85f6c6a@orel>
References: <20250917092129.1450686-1-xiangwencheng@lanxincomputing.com>
 <3bd01b1c-07e1-c545-8256-f83e3343247e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bd01b1c-07e1-c545-8256-f83e3343247e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_130639_676920_E696A1E0 
X-CRM114-Status: UNSURE (   9.67  )
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

On Wed, Oct 08, 2025 at 12:17:01PM -0600, Paul Walmsley wrote:
...
> I do have some broader questions: is this patch really needed?  Is it 
> fixing anything that's broken?  These SBI constants aren't defined by the 
> kernel; they come from RISC-V standards.

Hi Paul,

You're right that we don't want this patch. I hadn't noticed that the same
patch was posted more than once or I would have nacked it here too. I
replied to the other posting[1] a couple weeks ago.

[1] https://lore.kernel.org/all/20250924-7e9764acec6722b5ef29ce7d@orel/

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
