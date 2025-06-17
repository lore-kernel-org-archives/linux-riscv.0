Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1E8C71155
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 05:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLBGFrL6wufmi9H7qG/a0DUw/NDWT7K7rYQeevzzMRM=; b=4bl2sZ6Zu593HB
	gNyYZLX8ug1x+apeWuixaimduZIvg5F92H/SotdzgKrRxBaNYk52RHwcNpVta2HMMdf18ZbivRH3K
	1Wbk1A73z+C/iYiGIpt9jOGrHvjtBvJjlK9vbLOJ3mgBIP3qylHPHVzKYpRmYoolphNTwMMHm6fAG
	v2ZBPILd3OYjnWL5TtNaOPhbC9VCPgOyjl6qYPyVLie2FujSjz4EkwOxhZcsInXLKHAbJKsRbDXzm
	8uqhr7fppG9icjZhcY6K4EjSvMiggt6vWVo4x3Q/OUGGYo+0cI0Hsh4Xyc1uY4X7hDGUKGkPN94qt
	cDbsYbu7O/pRcXVm/CGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uROZ3-00000006Dg2-1hXF;
	Tue, 17 Jun 2025 05:08:53 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uROZ1-00000006Dez-0QBq
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 05:08:52 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3139027b825so3683510a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 22:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750136930; x=1750741730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORQSZScH5iwOR20pfQirho3FdyqdaURMxGfN/YBE6uA=;
        b=Ol3todPdA4KG/B9bdbiY+rhGKFcTMH9pLks8lnQNsFVYZ7xBKP2hHQYQCHqnT7S3GJ
         I+7l9AdSww+KVPHkl/EWqdUWgRndfF1TH/IB6/I59tnMg4lN9GIprBtz0emcRJWlS2jr
         LeXwLjV57u+J3607giw6zvpif6VJREs8ORAY0LI3qKwqmPwy3uxuQZStz/ibjWkjkYtC
         FH7cmt2YWF9j9jlyTkiwYs8HJZtenoW8DZdGgxytylER6e4MQOSzR6t2cHyLsenK6lqQ
         dIifJgWW7s8OEQOnQYNM4bi/06wXdbuLbpanGMFyRtU3j177n6VJ7aT8FAGzvzwcGElM
         S/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750136930; x=1750741730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORQSZScH5iwOR20pfQirho3FdyqdaURMxGfN/YBE6uA=;
        b=EX7PhF+lc0er/BeYXBm60ZXfrvZZOeXygEwXwSoRwFnlukks/Zd4gdI6xSZoARpsFE
         Dzr4cY2eeCyoQ554qP7TY6aw0kJoQZgN0/Qv8G9OAocL37DN0k1HFAJvKEi2H8FVVyGk
         TTKmGj6Ery+Yxe3fUWr7THHH/Uz3wQedHA6tPkIv3X0OnIRELWi0ITVz8IWDhLD7/EEC
         nGMKIpj0A60ViVRSEMn/NYl8SYJlOl0hbcB3IJuxlgR30zFA+u+X0Xq30Aq19ZcxL0K3
         sZ1Nvo8tt2TV7Nsf7xl3LNlGm99u95WMMHDEnNK5gSoMHzZst4PTDMVc3VHrkykn6GVp
         aqFg==
X-Forwarded-Encrypted: i=1; AJvYcCVdsP1dJQm6OgEjhUXpVNp7xnULMUczN7dCCtDUOR2u3f/GXb7M/1XE0deE0pVXQ6l1dXAOR0ev0OgWfw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsz6PoMV7WWJLN9t9FRjeONTqlMcGWC6oo6iCsG1mT6q8xL1G/
	aVECQ/l+Zy78lfnn8NN1fkxmF8YMLZ8HPkHWR3+ucIRbVTZAuFgpm3bv
X-Gm-Gg: ASbGnctdW0Dk93zdRQouG3RteWIcwXv6f4p9lOqZL719sdsUyK7L0pdcKjG4jXyBrhv
	Ze9qNRYdbd/+KuPpq+dBfhEHeDKBLw3lT4JgK9+RHaiTswIB0+ScdPyXFxNC8c8t+XbOeuYEKA3
	kfczYjhnAqOjlNxFwofQN5lVxFAdtTwMQAB+crAYiGgfsfOIDJ8Ohjnbvn+qHNfPMUG4gYYQicE
	5gqpFFe+k3nW+P8cxT8vaT8kpewdcFbTrOsK91EYb4YEZa/TEgP7DHeNQDYc8bOQ6w5cDXxk7aw
	PhjywbmO7x/CueOXFqZ/EB1xs8W6UuQ++lJcTJjxVhbUxLsLcVq66Fuki7XT3g==
X-Google-Smtp-Source: AGHT+IEqDf/C089XDze8DuijQXHRfftyr4C1u9LoRguwB27oUwZ29eFwHxr18ltua7GFqGz7HGzG5Q==
X-Received: by 2002:a17:90a:e7c2:b0:312:639:a062 with SMTP id 98e67ed59e1d1-313f1daa971mr21369290a91.16.1750136930150;
        Mon, 16 Jun 2025 22:08:50 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313c19d1eafsm9712177a91.18.2025.06.16.22.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 22:08:49 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: Add missing riscv,cbop-block-size property
Date: Tue, 17 Jun 2025 13:07:22 +0800
Message-ID: <175013680588.1018298.10559632401541865399.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613074513.1683624-1-inochiama@gmail.com>
References: <20250613074513.1683624-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_220851_375604_F78CAAB3 
X-CRM114-Status: UNSURE (   6.72  )
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

On Fri, 13 Jun 2025 15:45:12 +0800, Inochi Amaoto wrote:
> The kernel complains no "riscv,cbop-block-size" and disables the Zicbop
> extension. Add the missing property to keep it functional.
> 
> 

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: sg2044: Add missing riscv,cbop-block-size property
      https://github.com/sophgo/linux/commit/b8518378ffd3469b5ba871ee0210b3c16de45d66

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
