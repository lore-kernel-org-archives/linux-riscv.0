Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D24C25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 09:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4JjPM/kBnUSp4WRasWUdF5eIeCvi0Ozc4hdltu829s=; b=cZP+/j7mwEttal
	d2QFa3bzp1C6QkNrlnySHK/+V0PgRa/yNuU/BmEictqQhcO9/qYnA0bTlWrjgrM+8Q/5zEf1MACTT
	wqh2IgY9iuhkDDBBfdM50HRPWuyNuVQE/GFZ+UCbqIol0KJ/XzNaJXZlQydEMvt0eHXBWiTV756Yh
	r+ntsyrOaGBlxdSZaVdbu1dw1XvWAscR78EsKyLFY5Dze7BYG5Lb44Cf3eGgktFt3BlXBQbqcEqL7
	7lLMaGhqK4E7qaIIm2JZ+DlHnPHJyA8LVvr+Nzk8+OBLneXSmYlJqp6UDGEFAjRC9qThaYDxKJ2wA
	LsDSPXmdRoNrIVZI68yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9LvQ-0000000GvQP-1km0;
	Tue, 21 May 2024 09:36:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9LvM-0000000GvOU-28EF
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 09:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716284207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8TotQymrkTXKJP2dbOeE/8/7QYh8IcgEOhwgpcYLit4=;
	b=YLv/ULHgvdhVUp4UZ2/UoY6XhgK6cIvXMhcAuxRMH8aBQVup0qFsWy5D6EVe/uaKaB64vE
	6RuCE1+HbqqALl5uDFBfSMFYQjQBwOXI9qEx9XqqC419whiWkOBP83Ed57SlqxJIe22kCV
	DJHJbTeFYIJlgMEdugQLCGuhkaOo3A8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-l3dzwqnkMKWaZ5nyeEOwcQ-1; Tue, 21 May 2024 05:36:45 -0400
X-MC-Unique: l3dzwqnkMKWaZ5nyeEOwcQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-34dc66313b3so7628784f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 02:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716284204; x=1716889004;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8TotQymrkTXKJP2dbOeE/8/7QYh8IcgEOhwgpcYLit4=;
        b=b+YeJwBZNVE0pXHkUZFbyuTobH+8AXekchF2uHbZBLOp8LvZPibqoLCrRh0R/dUqWW
         TXKYR4gVVxr31OTmGJADrQKD40yoE5p7WEWM3gIlud3CT0OnBZXMmKw9cKgSFKPQNqn5
         U9wT7jVyjFzg241t219U9IJ9cBPJRSsCR322pkV+Rro83olibx9uW/hHKBiYH9hKpthI
         Rj6f1uzDe6aGnsVXJeotcZfuzvJBdg2F4sTE6tFG47YiaZ9sANbZT2y1snCJcgLzs6V1
         0Dy/0L91w+NfZTXpkIrl1bWZkDles3FB3N3t9l1A23u4aCLKXXfSVaOSnK9Hma81seQt
         3v6g==
X-Forwarded-Encrypted: i=1; AJvYcCVRtk+gGfqZerASjiNRgDxV3J5TJvaF1r2EH55Ujq1x1IssQ0H7A1KOedRUvMbpjNhnmjDqX7G4Oy1s79T8n2kpLjAmN+O342uCdOyPmo4l
X-Gm-Message-State: AOJu0YyRvd7seCTDxGwfWQ1J89Tzx2kHrAP4fnlQRDZaaVXVHhsVdpss
	MeUpiWRT/lV/NnP4kZkE0eINeA5es3J/NY4RDUKkbDsDzmm/euwZKwyZ/bOOPLyWN3anXeOXkks
	IK9LrTn1ebutPmF2oQorPuneJekjJCgAC+t+jIiXIa8OEZ7l9V1cB6TYBH0OojYDc9g==
X-Received: by 2002:adf:f590:0:b0:34c:b86a:794c with SMTP id ffacd0b85a97d-3504a96b845mr29768828f8f.70.1716284204296;
        Tue, 21 May 2024 02:36:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkrfOPTQeHBK0L612NDmEfoV6h/sGmyVuwJjpTZyriwnIAr0c/urZ2Tu2jhH0ROmfzvFkapg==
X-Received: by 2002:adf:f590:0:b0:34c:b86a:794c with SMTP id ffacd0b85a97d-3504a96b845mr29768805f8f.70.1716284203881;
        Tue, 21 May 2024 02:36:43 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bd09sm31289718f8f.14.2024.05.21.02.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 02:36:43 -0700 (PDT)
Message-ID: <4650b888-d90f-40e3-8c53-c9949e539959@redhat.com>
Date: Tue, 21 May 2024 11:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] mm: Refactor update_mmu_tlb()
To: Bang Li <libang.li@antgroup.com>, akpm@linux-foundation.org,
 chenhuacai@kernel.org, tsbogend@alpha.franken.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, chris@zankel.net, jcmvbkbc@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 ryan.roberts@arm.com, ioworker0@gmail.com, libang.linux@gmail.com
References: <20240518074914.52170-1-libang.li@antgroup.com>
 <20240518074914.52170-3-libang.li@antgroup.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240518074914.52170-3-libang.li@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_023648_756276_FE3F8B4E 
X-CRM114-Status: UNSURE (   8.36  )
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

On 18.05.24 09:49, Bang Li wrote:
> Remove update_mmu_tlb() from those architectures and define
> generically via update_mmu_tlb_range(), removing the ability
> for arches to override it.

I'd suggest something like

"mm: implement update_mmu_tlb() using update_mmu_tlb_range()

Let's make update_mmu_tlb() simply a generic wrapper around 
update_mmu_tlb_range(). Only the latter can now be overridden by the 
architecture. We can now remove __HAVE_ARCH_UPDATE_MMU_TLB as well.
"

[...]

> +#ifndef update_mmu_tlb_range
> +static inline void update_mmu_tlb_range(struct vm_area_struct *vma,
> +				unsigned long address, pte_t *ptep, unsigned int nr)
> +{
> +}
> +#endif

With that in patch #1

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
