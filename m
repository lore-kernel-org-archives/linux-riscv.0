Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A077EC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3UVA+UwlJMk4e9fLDaHFroGZkzXw2kUxb4UMUQPoW0=; b=ABU8G3kUo1vHXE
	SLa3mUY8nPT6ovaqJv4Dx6Nx4LZS/9jDBBF2CzEEpcDsk/qJaE40nJYUd0RZ7KCXKpktW9AklXbyN
	dvHCMcKb+szPbQjADxaGdTi23zqr/ZLYS+EqesiXNwaKRC2lM1wdScqLMfVY8NmaxQoUCHoiAT11l
	ZBllOj4zwbnf/cUIvy825p0WDCWghTAqhbVjOVIqUN7MjcdKRLdjDTfybtzmgcqw+7Ly6WRr5l453
	O0sUSJ5X8V2yo6Cxvws1l9SNh5KUrC6h5WiOtsXj4FLK4vgSRXSe5K1IqBs2MPxMI7IjiaEl7vpFB
	g2064shGE6HEWScUq0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Z4o-0000000DeYc-2kHt;
	Mon, 13 May 2024 17:03:02 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Z4k-0000000DeXF-1dI5
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 17:03:00 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1eecc71311eso39058955ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 May 2024 10:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715619776; x=1716224576; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7/MyNyoBm5MjfWHxVQeY2+je7QIeNePW0nfv/5L5Eg=;
        b=WO2uqMQ9wT2bw4GKkRpyztrY1bYpdxhM5RU6cr8YXvBqBDXFPWdSaBvtL3fsM90V1n
         M8wx5Qvap50WdwrwpO7jsaRS2Vohvx23P6RTJo4iWEShshwy4gaP0u05Cg+cTI5gPdsJ
         5g9D9rw05/M9uyWnOJLKWDbo1vpqHJSjzvMGGR9BSrrBvBaVKvatQivJQEfHExj5IVYa
         X+hW03H4iax50qql7Rsbq5OVyYf08ep6zc/7hLbxx8/s41LgwsHW7vp5nRNq+J4otQoN
         vPDO9i4DitzE5cylDHnXdg9CRgk/DU/TRP4EXXPwq45EwCgjZzqK22hXoTRaHLiTOZmJ
         DN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715619776; x=1716224576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7/MyNyoBm5MjfWHxVQeY2+je7QIeNePW0nfv/5L5Eg=;
        b=FyB4VtjDkG/D2UeZhXU3ZGCDkopopTCEfzVafVWplJ65Jgb89Ji5mu/99+jWMFSGB6
         P67rb2gYS1HUSgRasSVTNiaxCjiHoD5FGKYLW+8Fqj4zDkgeMk/cu39/fBIVnOqZXMvj
         dLfZZ3qVmC/Cz+5h6Jpzgodv2c5+4EVM9UXynBZSf4TdqdBe258uto8jIOFcxh3byDMm
         81k8Ci3lttgxeuLZqx4l7HMFbzJD7YDo1ZQz4igaduAV47StRPbSzrlNBgno7iHxgdmY
         yNvsoT2UHkdJkktK1a4Tsfia2B0QgXt1h/va3Q3nxdqSFXqyykADhh6mAMyhwZfvga2l
         NJJg==
X-Forwarded-Encrypted: i=1; AJvYcCVyErlo7uLgX0aJCSKaIZLynxVTqlAGl7QqP2/Ly+hMY92jBJ8A35KUr5xICh0EjJzxLkN7oUbRCAIWiQrGuhK1k/x+lv0f7J+NjC/cjdkf
X-Gm-Message-State: AOJu0YyMCpJimsix8HiTN1qnDakMr9sWLhYBzB0cLhtrG0rWrkr6iNiv
	b608w0koZr9gGe3glHgG869L0PoaaZxxdFDaM7/+C87MOYxIbPuk
X-Google-Smtp-Source: AGHT+IHwOZA/yfEnvU1uj/wTKNnpTSmBPcCl0ixyY9k7PieEC1uOAPdzdzFf5e1FfRz7aoujiXiBYA==
X-Received: by 2002:a17:902:e945:b0:1eb:77ed:8fba with SMTP id d9443c01a7336-1ef43d1242dmr182253905ad.17.1715619775677;
        Mon, 13 May 2024 10:02:55 -0700 (PDT)
Received: from localhost (dhcp-141-239-159-203.hawaiiantel.net. [141.239.159.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30b17sm81794325ad.143.2024.05.13.10.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 10:02:55 -0700 (PDT)
Date: Mon, 13 May 2024 07:02:54 -1000
From: Tejun Heo <tj@kernel.org>
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
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Muchun Song <muchun.song@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosryahmed@google.com>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@android.com, linux-security-module@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 08/66] selftests/cgroup: Drop define _GNU_SOURCE
Message-ID: <ZkJHvrwZEqg6RJK5@slm.duckdns.org>
References: <20240510000842.410729-1-edliaw@google.com>
 <20240510000842.410729-9-edliaw@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510000842.410729-9-edliaw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_100258_605128_858B32E5 
X-CRM114-Status: UNSURE (   8.17  )
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

On Fri, May 10, 2024 at 12:06:25AM +0000, Edward Liaw wrote:
> _GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
> redefinition warnings.
> 
> Signed-off-by: Edward Liaw <edliaw@google.com>

Applied to cgroup/for-6.10.

Thanks.

-- 
tejun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
