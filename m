Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C2E606A33F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=htc8obKI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+wmWzfd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VZi+4M+RcmAm2k9odr1GWvdFmEkbPbbJtcEm7mPLMAI=; b=htc8obKIkxBVZYN0uoDM/YXr+F
	P72IZzAtJ9VVtF+vnwKLeh/7msbBfDTdUwMMBBA/nh7EHxrfimL+A66FNhSvQCWOvgFmkSN7IU5+Z
	15RKW/m48YzgcPIoZqocwRoxUSEFVIkaCAtakL3foVEulzfFp8+oddgadrBGvxlqJwdarted4szrz
	EtNb4ilhAHSIHWyhuALkkfGMHMGL0uBoZTV7s7VGXA5j36bHqKVTnp9Oo7qM/qClZzG1fMuXyEDKD
	NCJeB1ScmbG4gT6gY5YhpABU67c0Jq07d/f8kmEoXLy+crk+KW29ZWQFW5+9A/AqFHhw27o6LBIlh
	gyinW9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTHM-00000003O9G-0wgc;
	Mon, 23 Nov 2026 12:36:17 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTHG-00000003O6G-2vJO
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 12:36:14 +0000
Received: by mail-pj2-x0a.google.com with SMTP id 98e67ed59e1d1-3ae93a86008so1767074a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 04:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437370; x=1796042170; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U/uD1Gm/ThsK3UVlqQr4l1VJFGDwFXp2U6warxXaR1w=;
        b=k+wmWzfd6bk/fo+FDHnKQH8zQ+05FFVtGfk+yGUQB3QsESW0ULcWYimqd0O4KafoNX
         F9lQLEA5HnEFua9XOqI5VskuhuPG4o3fI5FRPeNFwMPS4FrIfdRY1Dri8Vtxvqr63Lal
         nExnRx2fWQEQ9ng4/0e/p0EceVOysWr65zZC4CcP1jjOV1fP1X7M2XB+y8MIhlHE3iez
         gHdl7+2E9gQOj6ihZqP/4/449eIMqdr6FtbR4NBthELS5uW2ptoB5rsHCIJu3lxbtJXq
         d6ZYudkm46ouZkZcwwSkin1xTbu1Q5+NyWvHOsQPxgPwUPOrKXvc5fVUTmsyw2H1wg9Z
         8mOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437370; x=1796042170;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/uD1Gm/ThsK3UVlqQr4l1VJFGDwFXp2U6warxXaR1w=;
        b=ge45IDilbsViHKQfeNOjaW237spUoVutqjRIZgbUsdv21RUDV1jeeyUq1q4K1rA/Hk
         ZoO0Iw2b1HWUsNn/53jileyQcN1gdaNEaogRfBWlFa6RiJKefDujHK2D/X0D9ODz2z/M
         iUgFN1MoR+Rtn/U0Sa2yXXnurPkI1l72PC3pprwXUMd5y/CnDUM+606RWqCmt29NCIki
         ICUwfQq74T2aYD/JLKTroQT/av2vGd5+eH+Z9sLM6BI/skx7FhZCkM9SMHj3MugJHU9S
         CFkQgZRBPEA+hjr5XYKwkt5arnhuwcgkZsy4poxN8U8pb0O3I/d7oIgLA8jaAzFpA52O
         QxqQ==
X-Forwarded-Encrypted: i=1; AL+hErGl53FDfRsKwISP1pQv13PqHOXyVIL9JYmhF9mCfhiPc5QF2IG/K+uO5fKtOsZVfTrGUt4wGgBDuXfH0Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z+plkNYJbm14X5JuRhw2NPiPd1wtrtXGwlFbDHklMdlPptWX2pO
	/kMjFlPAPuEjX38pigqgreRRJWDkeDS6VVfh+Z2TAjGqSGAkOG3IQ+Rh
X-Gm-Gg: AZFdTZeGNvnCOWfLXyAR57GW9SoLgQ/leQUv79UPkC259ZP+tjXfnuUx/7z/J/C+HXr
	JYSfMibjDdEZHXR/sRdCZ9Vp18rICLFfa4QC8qiuOdSvUuCJtFfGyqJE2ACzIqwotoPsnzCk0Ln
	hrAB5SCcWx6nj5CjjnMK8bUV7LSm8e/0e+mmyH7dFildfrwP0kG0vI/DH0KR2YH4mqXmJ0xPjDv
	VT4YIS5qhLCCvBH7Eu3szYc6OJE9eCnqVnB2jrwhPaVLLLf4IuXSGlYmvbhgzJfcfeeh9LDwlaN
	wapIKHzkCzRw3DubFCLbBu6gJ34gAOYZ2fMF5qy/EsurIbBN/36iijCVjCYJLrTDs2DE8J+Y+nj
	FkuT/Df5YEi5hWeVVSh6VF9TICDW3Le6JaouqbXiUliErTw9iY4stS2o736HMLB5YYKb1mjWAC2
	q3gkjEr42va4sWgH9h7qHMopNsVE+ZCIXKrSzIndfYTRf7dqDWJHbBrsyRD414bAQhf0wY1k5Xz
	KUjF0rT73wwFEWyMxf6iyV4F+0W1mXkrL6L2ZrDJNHuqa6xOJLZ9/UpL6DUHlBhVxVyBmj7DFFw
	0LwGU1xt+WAoIWrk7vuLSWLkO+xsMoiSYJcxgRyZDdJyci4=
X-Received: by 2002:a17:90b:3c07:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3b41c9b2529mr10221008a91.13.1795437369821;
        Mon, 23 Nov 2026 04:36:09 -0800 (PST)
Received: from [192.168.50.100] ([114.252.97.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm6119715a91.3.2026.11.23.04.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:36:09 -0800 (PST)
Message-ID: <7225496f-222b-46f6-a609-89921d6572d7@gmail.com>
Date: Mon, 23 Nov 2026 20:35:57 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 09/10] iommu/riscv: Add
 riscv_iommu_attach_dev_nested
To: Andrew Jones <andrew.jones@linux.dev>,
 Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Tomasz Jeznach <tomasz.jeznach@linux.dev>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Fangyu Yu <fangyu.yu@linux.alibaba.com>, Tan Chi
 <tanchi25@mails.ucas.ac.cn>, Wu Fei <wu.fei9@sanechips.com.cn>,
 Zhao Qingye <zhao.qingye@sanechips.com.cn>
References: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
 <20261119132744.396426-10-gong.shuai@sanechips.com.cn>
 <awG5Q7pmntSme1A2@orel>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <awG5Q7pmntSme1A2@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_043613_546012_2F806A07 
X-CRM114-Status: GOOD (  15.96  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

On 11/21/2026 11:48 PM, Andrew Jones wrote:
> On Thu, Nov 19, 2026 at 09:27:43PM +0800, Gong Shuai wrote:
> ...
>> +	if (riscv_iommu_bond_link(s2_parent, dev, nested_domain->viommu->gscid))
>> +		return -ENOMEM;
>> +
>> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>> +	riscv_iommu_bond_unlink(info->domain, dev);
>> +	info->domain = s2_parent;
>> +
> 
> When moving between the S2 parent and a nested domain on it, the parent
> briefly has two bonds for dev. bond_link() puts the new bond after the
> first bond with the same GSCID, which may come before dev's old bond,
> and since it's then dev's first bond, bond_unlink() removes it. dev is
> left bonded with its old GSCID, so its new GSCID misses invalidations
> once no other device's bond has it.

Thanks, you are right.

> 
> Passing the old domain to bond_unlink(), like I do in [1] for a
> different reason, would let it remove the bond matching both dev and
> old's GSCID.
> 
> [1] https://lore.kernel.org/all/20260928143113.49838-12-andrew.jones@oss.qualcomm.com/

I'll use the old domain to resolve the old bond domain and its GSCID,
pass the latter to bond_unlink() as old_gscid, and match both

     bond->dev == dev && bond->gscid == old_gscid

so that the old bond is removed rather than the newly added one.

Best regards,
Shuai

> 
> Thanks,
> drew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
