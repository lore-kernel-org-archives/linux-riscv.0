Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB17CA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 13:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRFI+CaILz93Dv30PAEcfG2pEKQcD2f/gm8wPRv7SpM=; b=dU2wWXU5+tmYmB
	dyl1g+re+NlZdixeZ95EO1Lb5kC1sl5gY1vpzDpaa3IdXcMK7yecvDgKscB//SHTfFpUuAHbKbLUY
	lA6T2jf7IOtqfrm76t3Nh9ESJAmZIKV6I9+6mxtRDs8oksP8lH+D65EYY58kpzsVrH/wtx4TwS6CJ
	BuZ5HEggSlf85Phn7ufrbxGy0Ss76lXEB3MkQr+hxcDMTua0SBWU3lDQkkib4ZmkbUalckHQBZTeM
	5NxOntIQtCKDxHbOd0IOK0qIgfd4buy1jpoeiL8ySnnjToW8FARWtmjV1Shu4P7yCfCbvFbiJYyLW
	a8hmz8DrrRDRGR2XkepQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuS1-00000002aFl-41Jq;
	Fri, 15 Aug 2025 13:26:33 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ums1x-00000002G0c-2FRe
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 10:51:30 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b47156b3b79so1393030a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 03:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755255088; x=1755859888; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dix/CPpSMGWXSWO0Y4aNEfoYpWHiRGQqO96WVTnVXQ0=;
        b=eT+myFC7j8D7wIIv6maIFHm4oGGQKkCYO14KCeqsTkSKalYPTIBnOuewB0+9LgnTv1
         Ewcg3IOUzMGrD6nV9sfsub1Yb8qx54a1jDWVjzbk4OT215GerM0nzg8+dS3xBGb6EyYI
         QBvjikdPkBJdXnbw5oAr5h9hctKGXdthYAPIbvsPIsAGR/zJIismxQnlRHSRi8FfQ4R8
         8+gM3iZna+NUQ3cxzKeBY5aqcFsWZzGOU3nzdgcAYy6EhE0N/DYGfZYfdvAg5s4rWHgI
         4ip/955oIf3a0vzARmIvW12+6Gol/51NKymax0jzfosCHbtTbdBVOAJowb6AC4GZNGlO
         KM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755255088; x=1755859888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dix/CPpSMGWXSWO0Y4aNEfoYpWHiRGQqO96WVTnVXQ0=;
        b=CMGfi2F23abY7DvBnhgYgUASuekBrPyGB4JQSkzLt8xIw3SEWnvDSVFVxNGb2uBDgC
         39QD+ldQXi5Mu/GiJ0VscqbEyUhlP6qNQk7BeRwMng5bIYVIAXLsV84kyhB5PWfFAD3+
         LFxYBXG588hgS/ROpjIkbXpaB9TeUtK2xTHKJGFzDkV1JlLIzIzn5KgTC22rRXsMHuRX
         oy9hv9RTRQhkZAvgUvodkMl+ZGkNMgc2Kh8CB4SPYl8aXmfgyidB1lOxVX71oyb/Pxkj
         IIpxsUiFyvSSCNkb9cXd2eJOpvja17a0PnIsgvYewT5xmSHvPlVa+Y83XcAhyH7U80xX
         r6WA==
X-Forwarded-Encrypted: i=1; AJvYcCWl7xiOfxq5yE7GmFZ/e3F6052sVRSefinYPRav5YAnm+DaWWGI7TKKhSFeMRvOzAtbb2xqO4yMnaFNKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmP5lqV2BLXsuTs3c1AWknINNv1twaKCC5WmpjHMQr45mOJg5n
	+3L+ZoYzjqVU846lEyjXW1iE2gsL/JVec7ocYdGsb9Dp/9owbUYjKbQb+oI96WRZZJU=
X-Gm-Gg: ASbGncse7CR8Xi5Tx3CzOtbh5+9rx/+QbCfzcQUbAFGwNu4u45SLo+qMGBgYAik3rjN
	+nGk0OGkYgsQwY96le2jh7ssCI2N0wP1Ig1YVsQIIDRts/uhuU8njdd7/IurqJJKPM5KVs/J7m/
	HP932iEU9X+tkKhya1vyT0GWNSMCO4VnNHWn+P6Trm29e8ZTRQkubK9E4bMeclPCsoNjIqwlyF4
	emz4H6gicGIVEHP5C7q7JIN900SggLunGuPVr9Vy/hfl+lO46g258agecaWrmZDU3XVNIt2jOSQ
	TdFzGcwvKDiZvcA+G9XgcZlKf9GP3XF4jnQMtihexwKnOylJzeKWaxYK60KVDGtYt4TSI3t0g81
	IAyajL9/fRGz4pJZh2dNVf656GSs=
X-Google-Smtp-Source: AGHT+IEmNprlP3EyYzXw2mJxg75wrJzN+aQ6IJA3e06q3ZiRiLLueRHZsG1qP8n+zVyH+f5AwDAHpw==
X-Received: by 2002:a17:903:1252:b0:240:1ed3:fc28 with SMTP id d9443c01a7336-2446bd2d05fmr30011465ad.12.1755255088359;
        Fri, 15 Aug 2025 03:51:28 -0700 (PDT)
Received: from sunil-laptop ([106.51.199.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9ee0esm11563455ad.8.2025.08.15.03.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 03:51:27 -0700 (PDT)
Date: Fri, 15 Aug 2025 16:21:16 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: XianLiang Huang <huangxianliang@lanxincomputing.com>
Cc: ajones@ventanamicro.com, alex@ghiti.fr, anup@brainfault.org,
	apatel@ventanamicro.com, atishp@rivosinc.com, iommu@lists.linux.dev,
	joro@8bytes.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, rafael@kernel.org,
	robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org
Subject: Re: [PATCH v5 1/3] ACPI: RISC-V: Add support for RIMT
Message-ID: <aJ8RJCFM8p_GrFXk@sunil-laptop>
References: <20250716104059.3539482-2-sunilvl@ventanamicro.com>
 <20250815075541.29941-1-huangxianliang@lanxincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250815075541.29941-1-huangxianliang@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_035129_576194_461A3D6A 
X-CRM114-Status: GOOD (  10.74  )
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

On Fri, Aug 15, 2025 at 03:55:41PM +0800, XianLiang Huang wrote:
> Hi Sunil,
> 
> On Wed, 16 Jul 2025 16:10:57 +0530, Sunil V L wrote:
> > +	parent = ACPI_ADD_PTR(struct acpi_rimt_node, rimt_table, map->dest_offset);
> > +
> > +	if (node->type == ACPI_RIMT_NODE_TYPE_PLAT_DEVICE ||
> > +	    node->type == ACPI_RIMT_NODE_TYPE_PCIE_ROOT_COMPLEX) {
> > +		*id_out = map->dest_offset;
> > +		return parent;
> > +	}
> 
> Why do we assign dest_offset to id_out? The dest_offset is the iommu offset, not
> a valid deviceid required for platform device in rimt_plat_iommu_map?
> 
Good catch!. Thanks!. It should be dest_id_base. Let me fix it in next
revision.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
