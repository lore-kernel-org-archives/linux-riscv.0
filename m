Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA3CCAC592
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 21:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jzo7HpZ1JMGnqIYTqVDI2ovxW8hC3zshnW/WS6By3Hs=; b=izODtbTbuR9vahFWWLkIG6GHHa
	oqHJ3W103CgqiCOSROX7IbaR+smltWHAlLkUL/aS9ZHprn11RrDUzmx5vQq9rM6l6knKNDUJRuDB9
	5SF/VVz6qHCJYJhl/yQV6dxm5CipzK74fWZMOHnkPYjC/VGRAY0NkCJ7uHAaEE7Dc99cI2zz7Vd0O
	dvB8eoLAUDGIsOtUNLieQSXyNLDbdzlxHRflBGERmVxPywdhD5WCkO4ENIRSnm7PJ+KdMbk9ns5p0
	xJytbuHXb9AIf1iMElIM0ANbAkvRzlrxSgmnoL1ym7QQumBfNrjtZRDfWeztBskdhkXokn5NBQY/m
	Mh4ysRHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydUd-00000009G0z-0fR9;
	Tue, 16 Sep 2025 21:45:43 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydUa-00000009Fyj-013m
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 21:45:41 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b54acc8c96eso4219472a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 14:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1758059139; x=1758663939; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2oMu80/8qr3zTmEJZAl1KXHqB5S4PD4PrukmUZoG8ms=;
        b=cQOKhctkn7pmfCRPW/4vsfWkZ8lSH6QUGRF6nIjYPbLi8bYkboD/F312P5SdsVldQw
         geLxSOEyWMxU3mdr+HG2r22owsEx5Oj7q7XlUTsuBqhJ1y0zBj+Q+EzDiYfpEdNJ0yTO
         lurEzWzhECfAi4mdGIJQ7nwqjQzwVq1/OZa8irBQHFHHNn3MlFfVA5vNNEi8T4d4GDfy
         ipZhSMHBBFwZ1J+4/zB6Q3JAPwdv5SH3OLqeqSNSKJ+MJQVBYO7xjGdgli5Im68U7mzC
         NUuj9FrGc8EKqU0pieXNnfg6LqqKYBrgMhfGL9a0Q68jxRP0rzcrrecs9PlJetuW/XN3
         rDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758059139; x=1758663939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oMu80/8qr3zTmEJZAl1KXHqB5S4PD4PrukmUZoG8ms=;
        b=EAfQaU4QZdFJWD/owNm798Vboo+emUYupVV1BDgJkeHpJlfnZTvsQC8ahHUu2U7rTg
         d9/g+il//sAlvxP1uIZnCjwff3NwjrRiXZDnQR1ODbVSKC+1a5PzOrWSzjJWew3QPgl8
         xNzskhiG52UlNqH6cFisKklFjH+rTM/jCa7GwEx5YqvOlM+QohlYU6sGI/v2/FYvocdY
         gSm1CKCobBU0+RAwHLPfQhiuaNV2zBxMNt7a1+NTeuA6QwjJsutOytzEplydy5esLQIw
         99LWiwSlQtcr0OX8SsMen0XnbE0bUqkZ+QxrfRxtS6xwb5eZtM0Ef6RZpYuANRkVDgR0
         d9Bg==
X-Gm-Message-State: AOJu0YwvaJuQRHx7meIqtLZBwmSIwK9FAwANjj9IUjxNi4ucrFAT7KL5
	IsPAa/lEAcPtK6Q2lU6LqEqKrA0EcmuwsTMmkPvx+5kKStzMfImzMArqRkOO/cvTxnM=
X-Gm-Gg: ASbGncvUHLdJTp463DT1QdYZtYipC/XwEPiaVJGocR/jKdxe73gHUIwvJnQxeXNorOJ
	jBwVQlB7lJQazX8B4A/zlv6qE+wXjYk+vov9joTezInN/2Y3vEoj8S01oN2ZTOaqAc9J4X1SiOn
	4qLWsuPoHzVw4LUYXbrWOChAjl6O1OfCJH6FDMoPtwd7TNCU8N8S0jCzLcsTcuhn3BoC11n+XKv
	eknY1IpNsTCD5TeLFeRjEl86pJ3z3tR62R0WDf4Ks0JPdskgs2FyDiF86lK/EBlzFk0ieg+uOJv
	QAd/f/zLgVKcFx6FH42lHG/EroGfjrDoE3JyIy7cnaiM1nwHdfgBEluF7wdBk/svFWMsc11waqX
	0wLEgDQ02huVchE2WCazi+S71hhO59xtS
X-Google-Smtp-Source: AGHT+IF5/A9g/gHD57+H8Ivg3g3/IAIPeuIqDTP9P2EseS5E1C+rm4rMi/1Yy80FsS4n3Id30lQozg==
X-Received: by 2002:a17:903:1ab0:b0:24c:d08e:309b with SMTP id d9443c01a7336-25d24cac50fmr187714865ad.15.1758059138768;
        Tue, 16 Sep 2025 14:45:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed266eed7sm530003a91.3.2025.09.16.14.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 14:45:38 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:45:35 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V12 4/5] riscv: mm: Add soft-dirty page tracking support
Message-ID: <aMnaf_3tInUXbuTb@debug.ba.rivosinc.com>
References: <20250915101343.1449546-1-zhangchunyan@iscas.ac.cn>
 <20250915101343.1449546-5-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915101343.1449546-5-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_144540_165256_00D72E8B 
X-CRM114-Status: UNSURE (   7.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 15, 2025 at 06:13:42PM +0800, Chunyan Zhang wrote:
>The Svrsw60t59b extension allows to free the PTE reserved bits 60 and 59
>for software, this patch uses bit 59 for soft-dirty.
>
>To add swap PTE soft-dirty tracking, we borrow bit 3 which is available
>for swap PTEs on RISC-V systems.
>
>Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>

Reviewed-by: Deepak Gupta <debug@rivosinc.com>
>---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
