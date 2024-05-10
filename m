Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD87DC25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 17:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xr4EzYgDolywlXbUabWSAI+5KAHJwS1YtHq2efLx+rs=; b=BSylcugL3L7xlR
	H2hiY81w3mURhC5escS/OX6NNmGS2Crn/7zrqK+ciaFEYwSelbWs54weSpBaHrnljvNtlKUCzarTo
	YQSePouGkeOKhkMgxa0z3lH9gDa8QjW8dLTtJwPaGnqnejfLTmG1mff5mgy9R689jJFLzKPqOZuZN
	0z1xFGNg+OlEoOcv+KcoiQ+H6QyoXXsghqzCvSwlUGycso0tbHcm8TP10uI1fCYG5td6TKkfxFSGF
	wFt+R6DSOUr5aMwu5T2Ey0RcPJVcW/RYaSEjksmTlwULDKf+WuZtgk30ZeT7Sc2vwE0mxPi2hySr4
	cYFMGc7Dw7v5JiJ2W4aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5UIf-000000062sM-0I3V;
	Fri, 10 May 2024 17:44:53 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5UIc-000000062rH-35dk
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 17:44:52 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2b273cbbdfdso1866054a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 10:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715363087; x=1715967887; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L57+zK9MzVoCupg09U6DhX9rKCFQrUW4lM5mF0fCgNY=;
        b=VV+dM9Gw20pNq4/e8F5VGR2klxtuN7ADPb1Lg+Hc9tXlz29fXQoUJYqxq6Xj4yyeyT
         K+g+kAIAxHgcDYNjR4IODcR0QP9N3r7NhhI3s2UND8xlXRyEz9onkvvz7a81fyhA2b4P
         ZcWEr5gBpOthjhgwgeuu5ge5BfQpOtiNg9rQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715363087; x=1715967887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L57+zK9MzVoCupg09U6DhX9rKCFQrUW4lM5mF0fCgNY=;
        b=EZ1KxUASVF+KZJ0tIiA/d4y9OpzmcRzSYYEETvssAWcuTru9gWIE/sAYNMPobbjpsJ
         D5deWU90/gh85EMKUYSs/iLv48Q/4jn91YhIEujE82IxoI6GTlLL6ox989/ME0ZL/ej0
         uvOWHG5UkzmhUYd4Laq4UET0BvbPP3fSRCZZDx0/x0Qa16TX/dXHIPrVUAivGoTJXtdV
         lWs+vqk8T4g+Iau8YJwP6edrLGXadm7NqgEleLNzhRQrfqqhHrsi780RyFW+xWQZPLhI
         lOP202MFcjd0E2uotrNamw/mJAxrIedCLRFKUvIoxlsMwI0vehSXYtaT6fgtErle8J0K
         wbAA==
X-Forwarded-Encrypted: i=1; AJvYcCXApA0PFQ2O4pcuh0FLsp/l8uxnto23DH5GPfrqeZC+bPyC/3qNQMzbgVD/MHueqkGCZdFo6Y9kq/ojSNSjxaOrzrQ8USTs2rwA/lKvUxky
X-Gm-Message-State: AOJu0YwfYCKpEJBuPR39FUEPM4TF+s1E4IgXBbn8Q/6VdABGaZwzQy6Z
	HHCXeUDCE+H3ib8w9ZnGFvhiNY9SXaDldZ4ORvl1HU2VgExcnlVTnc4MnR36nQ==
X-Google-Smtp-Source: AGHT+IES457OerJ6E+sjpYxMiTqrSeTP8IOKWgMKTpX1LuCp+KnQ+g1iaESf6bNjK6mubIK/EdZwFw==
X-Received: by 2002:a17:90b:46c4:b0:2b1:817d:982b with SMTP id 98e67ed59e1d1-2b6cc777f3cmr3358191a91.14.1715363086792;
        Fri, 10 May 2024 10:44:46 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628ca53cesm5360572a91.44.2024.05.10.10.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 10:44:45 -0700 (PDT)
Date: Fri, 10 May 2024 10:44:44 -0700
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
	Eric Biederman <ebiederm@xmission.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@android.com, linux-security-module@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 13/66] selftests/exec: Drop duplicate -D_GNU_SOURCE
Message-ID: <202405101044.5D2742EC@keescook>
References: <20240510000842.410729-1-edliaw@google.com>
 <20240510000842.410729-14-edliaw@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510000842.410729-14-edliaw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_104450_800443_D9BB9473 
X-CRM114-Status: UNSURE (   7.98  )
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

On Fri, May 10, 2024 at 12:06:30AM +0000, Edward Liaw wrote:
> -D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.
> 
> Signed-off-by: Edward Liaw <edliaw@google.com>

Thanks!

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
