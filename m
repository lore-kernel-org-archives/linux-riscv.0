Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E809C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 17:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXGYcNA4ulRGMLpis1IEx9OnOTdxXcJyR5oYIxm7grw=; b=HDHsHJe42oJ3bHjTMxJC/jFPZQ
	DQGfwtRn4Xvb7ty7gb3s8J5auTZW/1B/CPh+kFKmKHy5SxWnq0t3a1nTCuhdA+JlHc7H9vZiaXn67
	cJY3ObGi5oT3ent2wLnxv6M/UUIrc4nmOyg2ju7iniYea3Y3KRHS3Tt5L19WA2ESEX7lXyFSysW2P
	I0YoTYXtdx7IZ1uUfIqxuLDkvlQ6zXRUYI+OScKD6JRb3SoEc9BJLqPjD/iAdzAfGMLuI/sKdF0E5
	xvXhREecOQN8b3x3jqv43Gl6INEFOq+DUqPR1wMOorOdlbRFwH2gu5UCu8HQL/re8MdrxaOYVT1RK
	NiPTVcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ZYX-0000000Dk95-0f8U;
	Mon, 13 May 2024 17:33:45 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ZYU-0000000Dk6b-1NIL
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 17:33:43 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so4013214a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 May 2024 10:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715621620; x=1716226420; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pNmfAcSQRV/kelva/h+PHsNWBp57DY+kk0TmAOrYUcA=;
        b=a05QM3hyK9WVhOgg/IJT6oFxkatgoWHDGGoDPlmdfHROGyyb2FyVAQMvdbVJcHBtIj
         ARYC9ZMuWx1RV+qjc3fc1fRI4gQiQTvI9Upc4keu1z8x+WtmCDzsX8PUM0luvCIufpKU
         EVf5nt8feyjHwS/wBh15EDpUViIK6vOuq9lsa8jgeGMrHADshQbtqVGmmANqglrIIeSJ
         h4bknYPmqyzrkRzI9PNMLnTwE2KfIuHZOpqWOHHko9W6gD0DDO04o1BELgwHs1S7+UFg
         vkpcpW++G/4zPktVdrprQ/9ee2Zw3CAzBgaw2aTNke9AQG0cWOu45NTWtE/WiO6FpPaj
         9LEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715621620; x=1716226420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNmfAcSQRV/kelva/h+PHsNWBp57DY+kk0TmAOrYUcA=;
        b=Lc50xPwZEa9Op5ut0knb1wwA3KyZl8xpkmHY5DKWsf3F80IsnhhOl/0tFDtVJHt8id
         lfec0GeWKUtQMah0Lt3UV6+Idr87cq6HT5eoK4WbFfNCPC4VJHzMX1pdwT8Vlp4jjqYc
         1pRgS2y6P8cX6z81q+BnBvR2ZQq9ouIpYRNRLm0RcRWZti6BamhBWmjXfCE2GYFGULjQ
         HiiIq4hr35dkDFDW+CMVde2FA2xVwcra18vB55tVQ9vN2N2hp3BpqJwRzptQmXe89hxv
         5ig7OjwVf0cPRqXFYo/jOEQypRdGUKDZMCOlv+R6uj1gtQ5WhuQcrIrmwjY8fZaO2d6b
         72hg==
X-Forwarded-Encrypted: i=1; AJvYcCXPJFWc3eo7NRJmV6TWcEms0TwelVBcnmvmJPEjKfaZfd7aB1/7wC9R+I4EIDPyRIMmmZhOfSjg+gdSAp2vv4E54SkflInqj/FPoHVCNx1N
X-Gm-Message-State: AOJu0YxYiXcuL1IHxeYYd4QKar96UO4wnvgxQobM+IXavd4+20buASXw
	GqzxIqZtD8CbD1VZzWlHVpImn2R62604q/qrpkyYtGJdGzQ0F2uoN4iZMVpkyD8=
X-Google-Smtp-Source: AGHT+IEusspRKWgMqzxIHo3LjzZ32dPe15H5hiGbuRyTZXAqW+i0ka0qC7uUI7zx+K2rXL0puSVXpQ==
X-Received: by 2002:a17:902:6b44:b0:1e2:81c1:b35e with SMTP id d9443c01a7336-1ef43f4e417mr123656285ad.54.1715621620059;
        Mon, 13 May 2024 10:33:40 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d4733sm81989285ad.54.2024.05.13.10.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 10:33:39 -0700 (PDT)
Date: Mon, 13 May 2024 10:33:34 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, bjorn@rivosinc.com, alexghiti@rivosinc.com,
	samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	charlie@rivosinc.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 12/29] riscv mmu: teach pte_mkwrite to manufacture
 shadow stack PTEs
Message-ID: <ZkJO7mlAYqVwDYt6@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-13-debug@rivosinc.com>
 <a8ee97ee-c51c-4d6a-a9fc-54b065215ebf@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8ee97ee-c51c-4d6a-a9fc-54b065215ebf@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_103342_405456_484B7351 
X-CRM114-Status: UNSURE (   9.66  )
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

On Sun, May 12, 2024 at 06:28:59PM +0200, Alexandre Ghiti wrote:
>
>On 04/04/2024 01:35, Deepak Gupta wrote:
>>pte_mkwrite creates PTEs with WRITE encodings for underlying arch.
>>Underlying arch can have two types of writeable mappings. One that can be
>>written using regular store instructions. Another one that can only be
>>written using specialized store instructions (like shadow stack stores).
>>pte_mkwrite can select write PTE encoding based on VMA range (i.e.
>>VM_SHADOW_STACK)
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/include/asm/pgtable.h |  7 +++++++
>>  arch/riscv/mm/pgtable.c          | 21 +++++++++++++++++++++
>>  2 files changed, 28 insertions(+)
>>
>>diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>>index 6362407f1e83..9b837239d3e8 100644
>>--- a/arch/riscv/include/asm/pgtable.h
>>+++ b/arch/riscv/include/asm/pgtable.h
>>@@ -403,6 +403,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
>>  /* static inline pte_t pte_mkread(pte_t pte) */
>>+struct vm_area_struct;
>>+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
>>+#define pte_mkwrite pte_mkwrite
>>+
>>  static inline pte_t pte_mkwrite_novma(pte_t pte)
>>  {
>>  	return __pte(pte_val(pte) | _PAGE_WRITE);
>>@@ -694,6 +698,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
>>  	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
>>  }
>>+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
>>+#define pmd_mkwrite pmd_mkwrite
>>+
>>  static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
>>  {
>>  	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
>>diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
>>index ef887efcb679..c84ae2e0424d 100644
>>--- a/arch/riscv/mm/pgtable.c
>>+++ b/arch/riscv/mm/pgtable.c
>>@@ -142,3 +142,24 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>>  	return pmd;
>>  }
>>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>>+
>>+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
>>+{
>>+	if (vma_is_shadow_stack(vma->vm_flags))
>>+		return pte_mkwrite_shstk(pte);
>>+
>>+	pte = pte_mkwrite_novma(pte);
>
>
>I would directly return pte_mkwrite_novma(pte) instead of assigning pte.

noted.

>
>
>>+
>>+	return pte;
>>+}
>>+
>>+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
>>+{
>>+	if (vma_is_shadow_stack(vma->vm_flags))
>>+		return pmd_mkwrite_shstk(pmd);
>>+
>>+	pmd = pmd_mkwrite_novma(pmd);
>
>
>Ditto here.

noted here too.

>
>
>>+
>>+	return pmd;
>>+}
>>+
>
>
>Otherwise:
>
>Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
>Thanks,
>
>Alex
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
