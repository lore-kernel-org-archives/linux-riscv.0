Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7137DC5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 13:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pz7za647hNHMO7M2qIig0j/vw+tXVlURhjsyM6Wv4rQ=; b=UVMWogu/lE9LTw
	8OqBm61cSC2QW4TVRw2ULDTBzo18fq0Ag2xSqCH6avtA+dSURnICn0zpZj6IoPKsb1PQ39TEpogay
	txM592C13dNHW+LLXbtoIA0LqOudqXfGCvBU6y1ArKynkr5W/zZ5c2CCRJU1wepHz0Mt52tRptvac
	j8/782iMBAWtrPtHkMziTpy0hjxLSyu9m2hg47w8i8HUm3W5+5rJq9jNVe8WAZIDeLyFD8envAJYZ
	WanYL64gSBEsNxKaBF5sUATwx8nZr39Z6RGm3Kr+TqmMxwuRqAdyblcw9aXLvQpURGgdEgYkySz29
	AgLKLxsD8cNXPuRHpX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhr0D-00000000KNJ-0NME;
	Wed, 06 Mar 2024 13:08:09 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhr09-00000000KMn-1sOL
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 13:08:07 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5a0e5f083f1so3867900eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 05:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1709730481; x=1710335281; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8grmpMo6kXaCL1FNx9R2bfmPydXiA0rq201Ykmbj6XM=;
        b=IJ6ek+xewFNbeZ/mP3thDfdAGwJyttaSz6dBGT8mgoTbWjO7M4c26znx1JUiZ4/hob
         q2TkSMKCJr+jTNmzabB46EuBcZL+hq/vI6LKwRkb9TO8COYKi83oP2AT7j9ir4MUrHFz
         S88IONYZMA3WekR8vKKa816JSQihT+6XkvUKDn6ovG1KXzzo5LsyNGR55bmJ2zjKNJ9B
         8dKyQBv+he5F9qy78uazzcR6dwG+RuOfjMk+4hlNIKt6ZG5Od5Qjx2uhAiJ8oD0Y7eeG
         jHwzr/BK3Nd4L9mxslh9U7LbfuWdnuPe4VqekoOY+8iaDuDRSQdsdufN8LcsjAS7lTZG
         9NFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709730481; x=1710335281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8grmpMo6kXaCL1FNx9R2bfmPydXiA0rq201Ykmbj6XM=;
        b=LOvFN1brAijWBr6DVupMbB49UijfcnJspEsGezFYgw57fsz3qdgEBThBDkwVU4U64x
         cuIslLY+b2m6c0eB7vawwYrNIwaNZp72Ek7OosFaa7AvgfKHm8RQQQ6evN7Ihjc8FpTH
         F8//G6VuKkec06QuPpdfkap83SBVahw//hrS3MtRKUEiRs+lNdnBYlZwpMIc2RZ/8f77
         eUM86+bvbaFOSWRj9KXT7TRDhD5z/0sn6k87Ar5A5DEy6ymotMSitcA0SAlXLHHkCXnW
         ODarRr9sj6/co1WEvUa9fR+f6xGmJh+EA9ymwD+mDSzVNjv2NvqC+hVSDBhiGzvfComd
         2L1w==
X-Forwarded-Encrypted: i=1; AJvYcCVTtQ5Y0lejV3eE3/Y04KMrXzPfqWlR1l6JD0sIt4VoIQrx8J5yAwFBfiAzAXVuQtDsF7sLTv5eIjeWAn3T7dHlQmKPDCwZWXnZRpc/fUNw
X-Gm-Message-State: AOJu0YyGFfDbKXT91DhiBtwbMrPRw6viBouAdmrTGCfYVpvQ8MU7MIlT
	ia3IUCJhP3Hf1N8TqcMBsGCLDD7EuBO/+cC8MjyN2JTZ68E0dimGIaad7ttZyIpMVvJRWprjlMy
	6TWqQf4bZ342ML3Dzs5Aw0H85PVaLiICmfvY8nQ==
X-Google-Smtp-Source: AGHT+IHApjo0FyHz0+mTNfy8Jycj2LxiGFq4dH+7d3CKS9BmX1BulHze6m5Tp4NLWckeoTdAQ7+7m9r34TwCA9Uv4iY=
X-Received: by 2002:a05:6870:a99f:b0:220:88b7:5145 with SMTP id
 ep31-20020a056870a99f00b0022088b75145mr4894851oab.41.1709730481594; Wed, 06
 Mar 2024 05:08:01 -0800 (PST)
MIME-Version: 1.0
References: <20240306085622.87248-1-cuiyunhui@bytedance.com> <26f3e99c-8f57-4779-a679-2085e469d9cd@siemens.com>
In-Reply-To: <26f3e99c-8f57-4779-a679-2085e469d9cd@siemens.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 6 Mar 2024 21:07:50 +0800
Message-ID: <CAEEQ3wnDKdhCH4yz+MY+Xks21jLnuFiyx-xxa7CFczokG2shvQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/3] Revert "riscv/efistub: Ensure
 GP-relative addressing is not used"
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	ardb@kernel.org, xuzhipeng.1973@bytedance.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, bp@alien8.de, xiao.w.wang@intel.com, 
	kirill.shutemov@linux.intel.com, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_050805_817538_9D3847EA 
X-CRM114-Status: UNSURE (   6.61  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgSmFuLAoKT24gV2VkLCBNYXIgNiwgMjAyNCBhdCA4OjUy4oCvUE0gSmFuIEtpc3prYSA8amFu
Lmtpc3prYUBzaWVtZW5zLmNvbT4gd3JvdGU6Cj4KPiBPbiAwNi4wMy4yNCAwOTo1NiwgWXVuaHVp
IEN1aSB3cm90ZToKPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgYWZiMmE0ZmI4NDU1NWVmOWU2MTA2
MWY2ZWE2M2VkNzA4N2IyOTVkNS4KPiA+Cj4KPiBUaGlzIGNvbWVzIHdpdGhvdXQgYSByZWFzb24g
LSB3aGljaCBpcyBsaWtlbHkgc29tZXRoaW5nIGFyb3VuZCAid2lsbCBmaXgKPiB0aGlzIHByb3Bl
cmx5IGxhdGVyIi4gQnV0IHRoZW4geW91IHJlZ3Jlc3MgZmlyc3QgYW5kIG9ubHkgZml4Cj4gYWZ0
ZXJ3YXJkcy4gQ2FuJ3QgdGhhdCBiZSBkb25lIHRoZSBvdGhlciB3YXkgYXJvdW5kPwoKU29ycnks
IEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuLiBDYW4geW91IGhlbHAgZXhw
bGFpbiBpdAptb3JlIGNsZWFybHk/IERvIHlvdSBtZWFuICJkZWxldGUgbW5vLXJlbGF4IGluc3Rl
YWQgb2YgcmV2ZXJ0CmRpcmVjdGx5PyIKCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
