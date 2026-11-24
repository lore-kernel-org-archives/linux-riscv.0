Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8EA606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 05:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1ljniKsc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVOTMx1X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QOlbe2miWrHpwKqxi/HqS5ImBNLjELb1pW9aO9/UOUg=; b=1ljniKscChENbhVk+VgrghFN7W
	0REGDpnJNA7qMt0spJWMenQRNlNR8JrTSxjr3BR2zG/hRjIKBmpGwM/oARvBQyUHxNos9GRsPAN/e
	q1Hu7w34j1lSAXCqddoroblF8pZ/jT7oymancbrA2DnekvWWeyr43ZZ92GuH5adiDHPMi5/M+Nr61
	SLt3ceP3PEAqbABvN2nxeFzsf8NST5OGbsgZONucuU9qinmRozDkSE6CgG7D1ft6qjWJq1njQzc80
	8TFSEyWXfVgEbBwSS1Yl3rMpDRVKR1kCkK59ADV13EOTt4So67l31TYG6KEGmgc4LpyJl+8BNbylg
	KOCMjNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVj83-00000005cCL-2UQ1;
	Tue, 24 Nov 2026 05:31:43 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVj7z-00000005cBY-2Tq5
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 05:31:42 +0000
Received: by mail-pj2-x00.google.com with SMTP id 98e67ed59e1d1-3b4067446d7so676040a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 21:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795498299; x=1796103099; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MHGUggYwA3gp5Hl40fLruxFZvaBCGWgXTV8JidRQovM=;
        b=RVOTMx1XZEkFBSNvLRUcvM837SirKq/X1PhXa8kMbJ05hJ2lJESmX1r+FQmHjaLqw1
         E2JwdC6EcLO+qMAglBPcJLw4lptH0Sszb4J+3S+m7xpwRTJ5EEikxPautRCZzGnshj5t
         qgkUtQy/jhVrpr47gD830QJ8NrrNnoJHs4h67dsJO9682GsVqpkJxIEfKAXsHcNmuwYp
         aDEOSk6TVTxkaTs/3m/t9f//3TntJWC+RgoZ8fvccCM71vJ0xPUhsMwp4aF3k4AAxM/9
         dMogqlNKdsODlke9QlQ4JOZsow2t/vycl/HQ3Qtc8C0YAwwM8AT52CetJJrV92MX0+Vp
         o2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795498299; x=1796103099;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHGUggYwA3gp5Hl40fLruxFZvaBCGWgXTV8JidRQovM=;
        b=BDfkZgGnZCaNc3OIHH5vZjqLdPkzkITJ+wehSvWgbqY4FasZa9vQXmRYuX41d9aFJI
         bA1k4ax2YPgPG/yfJY8MgVmltafKpj2+VFvvrarF2PEBFBvthrl0yNwhMSXUyAJQNQFb
         L+LMj2YWvbxVYCaTJ5r7vnJCQvGR7w4r+B9npDKmDz/u2PwfhLsuFjb2bwqtvSVqiGoB
         d/8ImiUmuGgnrEgdg9RfJjUDhzKDGvjLq+4nTvtKDwK9ZrP3eQ61epK0ikzMKCiwHmtz
         NAwObGrecuRJ1Uk970QoPesPE8Gc68eraPKjOKBQhtGjy9Ir7asUK9v1d/gam6uD+KUF
         jbhg==
X-Forwarded-Encrypted: i=1; AL+hErEbF2yNP5YVtNNHQaQ3bmwF3JEfcu/bZvY6WPGbFy12irVlCRcoC8GKjW3E8RAhMbhWOFj7aS09SjGX2g==@lists.infradead.org
X-Gm-Message-State: APuU4Z/hAe0cx5KSYL5VVVmqPLUqZzaPKTupl0AdEK1Oqj9i82MAnQEL
	RTlRU5xIvZqkGTAXhpMhH4U9PS/Hw5jEbK0j8sDGC9+uuT8RCubN+B0E
X-Gm-Gg: AZFdTZdkIUIKlJD1LwVZGPro/oqU7Ql5kmcB7rqlALA7pW/m/ZTBTGmqeGlttmHm5mT
	dv5SErbAx61rlAbYZUvHMe9W1GroKlDNfGYj9t3jgv++E2oq9AGG7UcdedSM2wRGx3SRzIRE4qz
	C/MPHLgFEywwafrxIHJv+K9xV8U+ZgX03l4MsCDDsxqRFrtZz9x0uXMYXR0TcM43lG8sAeaeLrW
	lGvA5sXC9VpjUa+fOvMR1KCowKeHjz/2HYOubfxAXc9rTJ39L0bO9xQi33xsZfN8T8feTXvr/oF
	vTYgoMRyS5qrLqlfgZ9V2jcnHdphUHnGMB7ByXVtREV9pN1CNmhOA3wYPYeHT+7RJT5c8wIg8D7
	9oiuMKZe8VeWSNJG7A+abYQ4S++pDHuLGUBnQeEhaC5/TRznwLJ5i9+S66XAz2N7m26CmVGaUEY
	9tQ8FU3tOHfaOzXF1Ip0l0khwSbl3z4VTKmFk41Vwe0I/IUlO9NE58ac5wSIB7YcefFznWM5Xhf
	kDJFDf1GczerUvEqe3+TCsFp9mfr8Bj9J3e7TCiR74LqhnCr7akzWk5o3F2OAH/OFIE6TrgAdoC
	vosqi9bJAKChU5G534PM8U0aGyGzE480F115U/wzWB5Zkts0XI64
X-Received: by 2002:a05:6a20:7d9b:b0:3e0:dc12:8908 with SMTP id adf61e73a8af0-4014e25b4f1mr12376756637.81.1795498298665;
        Mon, 23 Nov 2026 21:31:38 -0800 (PST)
Received: from [192.168.22.174] ([114.246.237.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6c9c7dcbsm6562442a12.0.2026.11.23.21.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 21:31:38 -0800 (PST)
Message-ID: <286b4604-fb68-452c-b131-d3847669726f@gmail.com>
Date: Tue, 24 Nov 2026 13:31:29 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 RESEND 2/5] KVM: riscv: Avoid THP adjustment for
 existing 4K G-stage leaves
To: Jinyu Tang <jinyu.tang@linux.dev>, Anup Patel <anup@brainfault.org>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nutty Liu
 <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>,
 Gong Shuai <gong.shuai@sanechips.com.cn>
References: <20260815102833.864330-1-jinyu.tang@linux.dev>
 <20260815103245.864925-1-jinyu.tang@linux.dev>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260815103245.864925-1-jinyu.tang@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_213139_638821_430F24D6 
X-CRM114-Status: GOOD (  24.02  )
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jinyu,

On 8/15/2026 6:32 PM, Jinyu Tang wrote:
> When dirty logging is disabled after a G-stage PMD mapping has been
> split, the fault path may see a 4K G-stage leaf while the backing host
> page is still THP-backed. The existing kvm_riscv_gstage_map_page()
> comment says that this path should update the small leaf and leave huge
> mapping recovery to a later ioctl path.
> 
> However, transparent_hugepage_adjust() runs before that G-stage lookup
> and rewrites the fault GPA to the PMD base. If the original fault is not
> at the PMD base, the lookup can find and update the wrong 4K leaf.
> 
> Check the original fault GPA in transparent_hugepage_adjust(). If it
> already has a 4K G-stage leaf, skip THP adjustment and keep handling the
> fault at PAGE_SIZE granularity.
> 
> Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
> ---
>   arch/riscv/kvm/mmu.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index bfd6168ebe30..2fabcd409991 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -500,10 +500,21 @@ static int get_hva_mapping_size(struct kvm *kvm,
>   
>   static unsigned long transparent_hugepage_adjust(struct kvm *kvm,
>   						 struct kvm_memory_slot *memslot,
> +						 struct kvm_gstage *gstage,
>   						 unsigned long hva,
>   						 kvm_pfn_t *hfnp, gpa_t *gpa)
>   {
>   	kvm_pfn_t hfn = *hfnp;
> +	u32 ptep_level;
> +	pte_t *ptep;
> +
> +	/*
> +	 * Keep the existing split G-stage leaf and update the original
> +	 * faulting 4K page in the vCPU fault path.
> +	 */
> +	if (kvm_riscv_gstage_get_leaf(gstage, *gpa, &ptep, &ptep_level) &&
> +	    !ptep_level)
> +		return PAGE_SIZE;
>   
>   	/*
>   	 * Make sure the adjustment is done only for THP pages. Also make
> @@ -730,7 +741,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
>   	 * so do not promote them through the THP helper.
>   	 */
>   	if (!logging && !is_hugetlb && vma_pagesize == PAGE_SIZE)
> -		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, hva, &hfn, &gpa);
> +		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, &gstage,
> +							   hva, &hfn, &gpa);
>   
>   	if (writable) {
>   		mark_page_dirty_in_slot(kvm, memslot, gfn);

Thanks for your work.

Tested this patch on v7.4-rc4.

FYI:
https://lore.kernel.org/qemu-devel/95fe4c53-fe13-4e0c-abbc-bbb546850560@gmail.com/

Tested-by: Gong Shuai <gong.shuai@sanechips.com.cn>

Best regards,
Shuai


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
