Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2646C5DF89
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7tB3LdKzgyx9pgm8OaWseKTn7v4o8HzroGDhOj7Xb4=; b=JYDqpGjkQ8hWZt
	4jYujSc+bmV9hxRxOtd2XBaEjKYnw/4H+fMc13MUOP6+7ZhdeBQ90g9bNk2ATOnEOong6p/ev4nHG
	2K4KVXKzWoa9TZNumG/FLJ041pdfpcZEuZWty0dhpmWkqbnO6Iu2TVD01jUn+uYLps6QoM/uLtZ/9
	XvOeDHMJ3BjksbOdVw3cyhkgPaznFb6Q67Q6N6IR08Ar+d8LAJmNB971ZOYBpmRhdJEkoUl3PB8E4
	NT57kiZTtqCZYAaqmMIA1oIll2leWTF7oKcUr5AiPzbwJgMX5YIyz4kFfFNc7YG8y618FnuLv1ZGz
	4Bvt9jIM2XszWkBdXtOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPi7-0000000DTbJ-1kWW;
	Fri, 21 Aug 2026 13:55:08 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPi4-0000000DTay-0WUO
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 13:55:05 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-52cd38ddcdfso5690581cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 06:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787320502; x=1787925302; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tync1NYSQPmjCb7Vyd44OAFc8hrD8m+JRdUFP+XyLOU=;
        b=hBVG3pgWO4HpE9vVNq7wX+SkQZk6rrZ6CBvIhhfzFZmF3fsgVAB5098pWb+99jmpI2
         tDTaBRBKHnG1w4VdLJ/IFTbKAOVfdmzBnwi6WKWxTMI2Gh4XY+iu+bB1jjs1+/ibeLtJ
         yQ2YoAasEM768jYEQOHO5v+QNiOTCoB4aj4MHu2guiggYjBGk0nvaF2M/F+L1OCHeNpE
         OoVArvonNNPIcL0vDW1cpGCkbKJOrXBqQ2ZT/hbaqmJhn7h8K/Cj1nymQxbUBRAGtEdr
         8TWsK/7jCFzay1dYTEG1drVUMHqV8d39Xi0pJocYumxZk4iblepyEzgMw+BYVhssBfpd
         gGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320502; x=1787925302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tync1NYSQPmjCb7Vyd44OAFc8hrD8m+JRdUFP+XyLOU=;
        b=LMKuVs7I7BE/bX27I4nR4zIhyFErSwGoOkUW98zkN6Quwbkn4+6o3RBiQymRt7poDq
         LuYCyE/vcbGS1Wxz9eI28wCNfr/ZuMvhJMnit8QtfBNzfD11Stgnx4w9d/1ZKh+97QjY
         x+5TSRXZ1Djm+LIOB0j2lQ1OuuNyrUCnhNJdxguvli3k880UoatkTcbLtImAr1kZv7Hh
         Yr2bWZsoOGNpzn5hsAUOM+de4WwTieSHbtuoDRl1hFsOkPGS13P5dUcXf7f7ZItYHelK
         P+GuFHAQTobtUA2nv5W7qEiLiF7cGwCJUnhSiHBBsX/lAb+pSQdxj3jIMCZUxyt2sViu
         pWDg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6ky4HbXebtQLuniISAJ5OgYsQ7ck0JOQKe6SHdlFg/7tLksRZkwhMTrSWKHRHu5zJSs7+031hJxHOrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YySpae8cGuLbRleOq93VyVnu4v9deavD/fkbGlJHQ3CHxS33WZm
	U+PN7W1sXXm5KKtGJFIxCwY8ozmxOwBho9jqSohu7dhHY2J3WB2Tzrys2W4ZtEUmwT0=
X-Gm-Gg: AR+sD10pJ/+s2ftos0L1HX4fCHOzLxkMaBH3MwQDBm+TDPCXo7U2zibwGCmHYz3Oz9d
	fL2i3hsjsdajXnpe2ieJRybD204XpNFGllQ/dpogJtUNnebiI206X/JrMMvJ8jzGgWNGWKq944d
	PUytOj+Gul5PjQ+rIbUrvZReaGn0WK9YNGNzTnWmN1EGYKee0t94WFs7tn8bXHIfWAvt1vN3Heq
	Sok71Xlb1xB5pnTS7XFdE2ay5vath4ykOFcDmO8LrXq3CUIKFZWaD95hocImZGIVR2hj6AaFDzW
	Vx2aoij1/BdOU4kxd4YcaFOOvUgWH1y1yCD6zWAGVAFnZ+hVLDddL9983xYNwA66x7FKepv0Cmi
	AwL/aBmO9iYj5iS5qGjHYM7gcrinkuORqCp1kJ8bU0aL/dfMXo8JWZF57FjbuOx2osDsEyjaI4Q
	9+ne0wZDL8Rh/dNAXW2MFgQduBmNd2NKmcV8OT5C2gpz6/JDijYXQK1tSixBbnHuaJRKRIYQdZP
	Kaq9wruB3ZZMDbK3IixEJbq9v0tuwtyT8+9t6kaWX62Bg==
X-Received: by 2002:ac8:5fd5:0:b0:519:8b76:2ce0 with SMTP id d75a77b69052e-52df5a6e0d5mr53572721cf.37.1787320502318;
        Fri, 21 Aug 2026 06:55:02 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5eec2f0csm63818716d6.14.2026.08.21.06.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:55:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wxPi1-000000062EN-0WEt;
	Fri, 21 Aug 2026 10:55:01 -0300
Date: Fri, 21 Aug 2026 10:55:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, baolu.lu@linux.intel.com,
	jroedel@suse.de, zong.li@sifive.com, andrew.jones@oss.qualcomm.com,
	anup@brainfault.org, kevin.tian@intel.com, atish.patra@linux.dev,
	skhawaja@google.com, vasant.hegde@amd.com, guoren@kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v3 01/10] iommupt: Add RISC-V Second-stage (iohgatp)
 page table support
Message-ID: <20260821135501.GB1114497@ziepe.ca>
References: <20260821132749.82070-1-fangyu.yu@linux.alibaba.com>
 <20260821132749.82070-2-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260821132749.82070-2-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_065504_173744_48ECF019 
X-CRM114-Status: GOOD (  15.35  )
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

On Fri, Aug 21, 2026 at 09:27:41PM +0800, fangyu.yu@linux.alibaba.com wrote:
> @@ -126,6 +135,15 @@ riscvpt_entry_num_contig_lg2(const struct pt_state *pts)
>  
>  static inline unsigned int riscvpt_num_items_lg2(const struct pt_state *pts)
>  {
> +	/*
> +	 * Second-stage (iohgatp) root page tables have 4x the usual number of
> +	 * entries (2048 = 2^11 instead of 512 = 2^9) to cover the 2 extra GPA
> +	 * bits in Sv39x4/Sv48x4/Sv57x4.  Only the root (top) level is
> +	 * enlarged; all other levels remain at the standard 9-bit index width.
> +	 */
> +	if (pts_feature(pts, PT_FEAT_RISCV_S2) &&
> +	    pts->level == pts->range->top_level)
> +		return PT_TABLEMEM_LG2SZ - ilog2(sizeof(u64)) + 2;

You shouldn't need this, see how ARMv8 is constructed which does the
same thing. Instead 

static inline unsigned int armv8pt_num_items_lg2(const struct pt_state *pts)
{
	/*
	 * It is not allowed to call pt_num_items_lg2() at the top level, this
	 * API restriction is specifically an optimization avoid overheads
	 * dealing with concatenated tables here.
	 */
	PT_WARN_ON(pts->level == pts->range->top_level);

> @@ -272,6 +291,19 @@ riscvpt_iommu_fmt_init(struct pt_iommu_riscv_64 *iommu_table,
>  	case 57:
>  		pt_top_set_level(&table->common, 4);
>  		break;
> +	/*
> +	 * Second-stage (iohgatp): Sv39x4 / Sv48x4 / Sv57x4.
> +	 * The top level is the same as for the first-stage counterpart.
> +	 */
> +	case 41:
> +		pt_top_set_level(&table->common, 2);
> +		break;
> +	case 50:
> +		pt_top_set_level(&table->common, 3);
> +		break;
> +	case 59:
> +		pt_top_set_level(&table->common, 4);
> +		break;

Are all these widths valid for both S1 and S2? It should reject
illegal vasz..

>  struct pt_iommu_riscv_64_hw_info {
>  	u64 ppn;
> -	u8 fsc_iosatp_mode;
> +	union {
> +		/*
> +		 * First-stage (fsc/iosatp) MODE encoding:
> +		 *   8 = Sv39, 9 = Sv48, 10 = Sv57
> +		 * Used to program DC.fsc.iosatp.MODE.
> +		 */
> +		u8 fsc_iosatp_mode;
> +		/*
> +		 * Second-stage (iohgatp) MODE encoding:
> +		 *   8 = Sv39x4, 9 = Sv48x4, 10 = Sv57x4
> +		 * Used to program DC.iohgatp.MODE.
> +		 * The numeric values are identical to fsc_iosatp_mode;
> +		 * the caller selects the interpretation based on domain type.
> +		 */
> +		u8 iohgatp_mode;
> +	};

suggest not using a union and instead have the get_info populate only
the one correct for the fmt. It makes it slightly more robust that
s1/s2 don't get intermixed improperly?

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
