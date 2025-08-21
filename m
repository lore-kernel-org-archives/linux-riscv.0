Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B354CA0EFA
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 03:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1hqDrFtSdxmC4FS6MDfWyCEddET8FUn1wkRM4MNiT0=; b=SbpU16ajFpiOJ3
	kd/Mmvic24rpOcI/MmxwxFCugDoNdeakVj9EhtIK96cAoHxtdb93d7M4/kIxvYM1lbTFm5+C+kb5H
	OthUYftuXRe5iTBADN8RlK2z27kU3ScqBT8OHjtyZ6WFFVM0MtCqmzlngnRGfsL9JQX9WfTtbdLwX
	IjR+mzg8gJD/R8xR8/+NaK7ISu/Q/JsvfrjD4saQxBt/3MC0tgagloIn7hCBoff0kbJhD/mJ+GRM5
	cwFcOZ7vT7dVcpB0UrHBvnkG41+dE4OB9zcpkoUV62fp+BlKHj4D016dnZ4aO/azSaYUBFwQ7kC6L
	lIF5I6iUt/kasvcT9lgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upITz-00000001OJr-14pW;
	Fri, 22 Aug 2025 03:30:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upD77-00000000gv4-1Has
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 21:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755812788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UOEidWIYFOcPQc5k2cWSdnWss7AqeJmy+kRLikq18m4=;
	b=K8Ah7uDhCPqerNmb4nVEJWvyZZyKKUflA1cziygM+Ve249/l3ZGLl0TvvteiC9CWnLSe/x
	vE1yJrRTtG2RgqcEjgiY67nZ95glF0HthDVB77wIeXy0mDgUlFPkJQaIfIJmP/+YdAd/P5
	9H53nhE9FSWOgdCF7WLqqo1+UpkJw/c=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-Q_wk-dDrNYSpiVs8Me9IAA-1; Thu, 21 Aug 2025 17:46:27 -0400
X-MC-Unique: Q_wk-dDrNYSpiVs8Me9IAA-1
X-Mimecast-MFC-AGG-ID: Q_wk-dDrNYSpiVs8Me9IAA_1755812786
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b29a0b8a6aso43257021cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 14:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755812786; x=1756417586;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOEidWIYFOcPQc5k2cWSdnWss7AqeJmy+kRLikq18m4=;
        b=emtJMby7MkHRAB0tAWoqIY0o0hkensR9CsehcHGuAI/PlKQ0KEelpw9Tvi4f9//pLu
         QeTJVMhxYLbl8zr4eQ8z5Zn+pOLplxscRU7Ys0y5NthaLz7LijoLta0/CD9ovGm6CNlM
         j3U2szUX3k82uAByvClQPAF22BmhwI2o15E0T1ghkgMZYSJjfsxJ3KdkX6oOhZkfIYdR
         aLBqR0eMDiasE6w/25nZK7iWzv4QnHda5WdARykOkJeotazfFDoPQh+TJ4G29PAy5sKz
         xWLy8nw+F7mLntkPN8dq1Xv6vXXKjC0cP/B41iTVdENSALBlFr/yyeAArCnhQgQTyl6H
         qAzA==
X-Forwarded-Encrypted: i=1; AJvYcCX0jPgUxB3Caxhmcwbfz6I3BOsQtvFCOQNA/zWsVqXk8GMs1ACwpojH8p7TOSpYQ4jWo0D4nb166Ypz0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVdvrcZMhFbMeOF1T7Z1Jit3Oftbz3SXNY+oTYdJC1PTWhVcul
	iFinHCoISvfV86zkm2aNtZpcpYB7Hl7sWdRMP8MTF48G25Hj4oE6d/OuR/bWgbkBB8IdqXlX2eb
	OxBtFt9qlxnGVPo6DTGbRs3I5RuKMjt0sIv4tMDdgIthlB3gFaHaaGsPcY2N0ejyRdeA7Vw==
X-Gm-Gg: ASbGncsBMzPzQNahj1k1tG9+LKkhVFyB1OmxGUrFWMyAQNjDWRDG8mVez2uddPoAaz1
	1vIrtA28h3uvr7xpTvwz4gqh5u/B+hnMwGUhB4MhS19FKDiuV5sEA8zrtv7Q9znQ7vLcggdDsRQ
	KTOsyb7+8Yk6ijNQOdNiynkGeDhrLuQ1I/nupSJkinq6DtHLFJlLY+NyyZGAnZ2X/WNX9td82V8
	onTZQnyAWBw0DV1DPC5ePsEqCOwnbSctiEx9i0fkFxtVBGqv05bzyAwznW20v/+U2JcFK5Xfvo7
	bWAeBxKGUCPqut6lBBCp0vsWjzY4s8GUt+UUFGYAuiQuQmdyDizqvS9HaNQE1GvOqIK0P7JdGYr
	lwZgzknhgy75DHjxBhz8=
X-Received: by 2002:ac8:5812:0:b0:4b0:73db:f81b with SMTP id d75a77b69052e-4b2aaa1a378mr10332701cf.10.1755812786465;
        Thu, 21 Aug 2025 14:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM/f6AWKsD/uiuSUkJzb9jNkg9oqjjxZOXqxlVkr171nvQa2lEbcNla+IOhlEltLwBQr891g==
X-Received: by 2002:ac8:5812:0:b0:4b0:73db:f81b with SMTP id d75a77b69052e-4b2aaa1a378mr10332491cf.10.1755812786097;
        Thu, 21 Aug 2025 14:46:26 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e020514sm1201852885a.17.2025.08.21.14.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 14:46:25 -0700 (PDT)
Date: Thu, 21 Aug 2025 17:46:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 02/21] clk: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <aKeTq1lJ549a2jnQ@x1>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20250813161517.4746-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dA3OeCjq5oO9WyENDGlfJF540CYfxvIPQheZAbUVyVg_1755812786
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_144629_414899_B644862B 
X-CRM114-Status: GOOD (  12.27  )
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

Hi Wolfram,

On Wed, Aug 13, 2025 at 06:14:48PM +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot is
> happy, too.
> 
>  drivers/clk/actions/owl-common.c  | 1 -
>  drivers/clk/clk-axm5516.c         | 1 -
>  drivers/clk/nxp/clk-lpc32xx.c     | 1 -
>  drivers/clk/qcom/a53-pll.c        | 1 -
>  drivers/clk/qcom/a7-pll.c         | 1 -
>  drivers/clk/qcom/apss-ipq-pll.c   | 1 -
>  drivers/clk/qcom/clk-cbf-8996.c   | 1 -
>  drivers/clk/qcom/clk-cpu-8996.c   | 1 -
>  drivers/clk/qcom/hfpll.c          | 1 -
>  drivers/clk/qcom/ipq-cmn-pll.c    | 1 -
>  drivers/clk/thead/clk-th1520-ap.c | 1 -
>  11 files changed, 11 deletions(-)

These all look good to me.

Reviewed-by: Brian Masney <bmasney@redhat.com>

Should drivers/clk/sprd/common.c also be updated as well?

Brian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
