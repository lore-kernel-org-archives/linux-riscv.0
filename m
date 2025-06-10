Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47359C61DB2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 12:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x2XRhZGKlvoWxjzsPsTGe7JLSkkhdfmHEI6jpWgRWLM=; b=PTX99QC4LdXuIS
	Xh/Fc+L7zE6bdCr6t69KZ0iMSm+O8ab2TmHLJk/ci1eeQNpoR1jhEnNC8tI0POmOjeEJjzxR/Yrqj
	sDS+ygOp/Ddwf0jyifQTxPfljn3tPgBS7dc6hrwBRw3H22cPa+cGj6CMD4tob2u/BzEXbqAexHGyg
	DP6vFWeU2OGHYdHXPBLoz0FqCukZCEhxgvNtn+ar/Ft1N6kym1VOkj9AbObAsGIMIQ9dLqo1qeaYE
	eb6+YGd6xOZWTz/SpgDxKSOS/x+fM5Hr2XhujHUhx3kmb/oz4gcEB7DXd5LaHnvhTRTzkjFVWDFdw
	RtipnXaSjnnO8fR2+Lig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxmn-00000006itR-0g5f;
	Tue, 10 Jun 2025 12:09:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwMk-00000006VnH-22gB
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749551881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aI6UmbgwdlVAnCc78+kA++Zeb+kmoiPB+fmNOOceC0w=;
	b=VVDSCKHRpVkmLpLgFD1gfMlvDsMgTTeTeIBYsaN5PbC9QM/+V82eiEgE9T9cvr/Fcx09/z
	q+ngo8vYlmC9Iv8jbfIPBhdJaBxK0kWVcayhTt8s0gqBhwyijQ89zaGpKjTDP0O2MQKsvC
	IR1RcD+WSvxiVz0l5HG4rFSl32vUZsI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-xLGIkCcNO9O2CQnnTdLBiQ-1; Tue, 10 Jun 2025 06:37:59 -0400
X-MC-Unique: xLGIkCcNO9O2CQnnTdLBiQ-1
X-Mimecast-MFC-AGG-ID: xLGIkCcNO9O2CQnnTdLBiQ_1749551879
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so2184816f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 03:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551879; x=1750156679;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aI6UmbgwdlVAnCc78+kA++Zeb+kmoiPB+fmNOOceC0w=;
        b=TXvvi07ezFkJqKdEgjo5X9rywfBoFbIgfj6/uwHyLtFB0Oo17T7z27QzZ47ZH8w88T
         kE3mc+dPxdxy/oIHMcrVF+vFAi0EAWidTs2zq/C5uM6lHYZjN3uSdtpHy5WEXGP2zvDG
         PnsWrUvBLkpM21BPhksg7dQQtFRca1GNRezxglw9S9SrV5X10FPFzVmN/8dfrLZN6qpP
         Jsl5U5Q3abJk45o4KKl9QJRkWLn29l2GSY1yoJ5q9kVXkF1KXe/bxAmSPzqdSR7ydqUc
         dzCxTm4chE+9ogGkhGar1DGnBCcKyuXR03J6mbodPSErHwsj9fuUcLs9DVES6qdWTcTe
         1hsA==
X-Forwarded-Encrypted: i=1; AJvYcCWqRH2Uoklz6mkS+I1Vqje7SPyvmGVDFO4UYVa/WIy2cjA4G3stO5nd8E0G1xXrgRZmnaIcxeWaNdiQfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YylOnz63c3fGyjM1L89T2p5wV9M70YIGyTMZlG8EgDy1wWGjv2k
	GbaybmbFZaMhBcPT2Pf+ojx3XQQZlTl3wDYyr0xGJTEYx3pMdz/cAwcVFeJhnDKq+VxQcxoJE4g
	0gd/akmip4BbxDaYCtYFVzZ74jbYcAUbzwCTiCCAXouK8i+EccMNj3CIiWCWZFDhi0jIPVw==
X-Gm-Gg: ASbGnctBQS+V8F64aAa9HSdrhOENGZ83hl4GZSghpK3txgF92Wp2AZ4MDLaSo+p9KgW
	5g9mfbj3GzM7p+SEHZn0Hn+gat9qWDXO8yEb+q/nQW/lqr5o4Dkz9f3wvw2gy19qz/nM2CsIwi3
	p5DJ7I+XQfZTxI4H7N0zxvrM5DuuoQtVzQXJwdgiDtmCknTsU6W0ngv0fOIkaf2yEK83MLEc4xK
	l1a3qe9O4wyAtRiVYuN4r6vcCLoYw+t9q21vsZNgi45cLnK+4Cn3o28oqRfLoANS+RnNN7iAm/z
	VR2Fz8/qnsdhMHuwK7Iu8PPOTV+HVWAlxcyNqMtwfb1P5sKBLNCKiIY=
X-Received: by 2002:a05:6000:26c5:b0:3a4:f7f3:2d02 with SMTP id ffacd0b85a97d-3a5522716a9mr1608120f8f.17.1749551878754;
        Tue, 10 Jun 2025 03:37:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6jkrSTQLJlhMrYdllOzIW6Ete/JGJLtTiYCIoUWXSkxb/sdVLs38Feted1QX/mOtzl90MWQ==
X-Received: by 2002:a05:6000:26c5:b0:3a4:f7f3:2d02 with SMTP id ffacd0b85a97d-3a5522716a9mr1608088f8f.17.1749551878384;
        Tue, 10 Jun 2025 03:37:58 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320b16657sm9031205e9.8.2025.06.10.03.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:37:57 -0700 (PDT)
Message-ID: <1ec55f0b-991f-4ea0-869e-5fc0be719c8f@redhat.com>
Date: Tue, 10 Jun 2025 12:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm: Remove arch_flush_tlb_batched_pending() arch
 helper
To: Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Rik van Riel
 <riel@surriel.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20250609103132.447370-1-ryan.roberts@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250609103132.447370-1-ryan.roberts@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FbnjQO-XLc4RYryW0QQI0NP61xcKxQRdTk-rRa3Vczw_1749551879
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_033802_602433_1A4FD651 
X-CRM114-Status: UNSURE (   8.68  )
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

On 09.06.25 12:31, Ryan Roberts wrote:
> Since commit 4b634918384c ("arm64/mm: Close theoretical race where stale
> TLB entry remains valid"), all arches that use tlbbatch for reclaim
> (arm64, riscv, x86) implement arch_flush_tlb_batched_pending() with a
> flush_tlb_mm().
> 
> So let's simplify by removing the unnecessary abstraction and doing the
> flush_tlb_mm() directly in flush_tlb_batched_pending(). This effectively
> reverts commit db6c1f6f236d ("mm/tlbbatch: introduce
> arch_flush_tlb_batched_pending()").
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
