Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EA6606A333
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 14:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bc8y11LD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dHvhQour
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qSpfqE9hJqIyn7ufXhUWbVlU/G+lpWsT0RygzF5Zd1Q=; b=bc8y11LDvHVmUriu6Wt7kpgHFR
	EVb0lhhYUOTvMLy/ntjAG1SYIiMTG6AYdwvuJ/Z9AmAR/crxK0QnS7Y92JmJgAxpWwWU+U1kUn4fa
	Qm46E0foRJhpSBHyF+11P3PC20/cuEDqjmnmqT8YeXU8fcjq7V2QrcvIKUvrWI70TbQGaRv+hal0O
	WCKJ3i0WcZRRj8q3YhLUrQSlRQKNZMcVieDXiTwXBJMjZJNPqbzSkbFvDDhH15GdTy6+oZy98PRRj
	3i+0tBSUZ3kAUKEl4fIHSS2AON8kkxzIMdUcEWcJabmQsyajRyhhAZ6WX4DezGorNubHJtumoFQz3
	3B7dO+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmkE-00000004BJw-3B3e;
	Tue, 10 Nov 2026 14:22:42 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmkC-00000004BIg-0AuP
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 14:22:41 +0000
Received: by mail-pj2-x04.google.com with SMTP id 98e67ed59e1d1-3b0d11b85f0so1250860a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 06:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794320559; x=1794925359; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vW6Me650CnRCbqpTMm9ScZes8RV1bkmpcr+ZWjp/+oI=;
        b=dHvhQourcefQEe+JE3xWmUbKha+rhu7lnPEioJZ+ueb3Y4F37RQ7KJTwSZhBS7LblC
         z0s21PKom3CWoEX8KwSRUqLN2wpXGpmfWiiQWojy5rDnqfqfVGR+MblYawzFOHGEpWSo
         um9UAZ2mwu1PwltYsYC+h8Buph1543KQ/8yAXM94GKPYDHtUR1/iCj1hlobGbsuMyISs
         AVVvaB1fRHK26Mm/fvnsxRLpG1S2R+gJD+3NhyqMmCQ+bkIiyK7z+MzS82i1LWbkfCr3
         m4DseGRxofvbiYPy5R1aeAxVVZCkU7dWNTJ4KdqTTGMvXLReVKfD8YUF/9yall1vjbT1
         KISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320559; x=1794925359;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vW6Me650CnRCbqpTMm9ScZes8RV1bkmpcr+ZWjp/+oI=;
        b=pDUVqmzW6V7K5Vea2mTsP5cStoYfd/aqBemQX6ei2wAlgVKalCgJ9eGvNBB7M03rcU
         KG5OnhWH+jTQMqb5M4JZ2j4euIqPUhNFxg6gArwbW25kuhhvphdYV2SI2hVQV7tBnuNe
         Jkb/JwG/ybR2FVqSlRztb6Kklm16IpSWUAlvx0YcLaz70WXgm+E5eUrKuCCT0t7kXx48
         fFrZS5cvryTWTxlw2xPDLgxVuQqDMVEn4v6wtcDgNc3WRM3LGeh5/6N2tAx9amwCVxE0
         ChhM0UJfLkOnaaFkN4xOAG/hSH6PdHtB/nn/Q8kkMx6W2A3eGGwNAHmX9JZ/J53TMHjM
         wqeQ==
X-Forwarded-Encrypted: i=1; AL+hErFESc6KRbxzsDfphV9FBK+tFt+Zm2Dcz8SU2S35oITmeXyV4tE5DrO6zhrCHdH5X4FSXyy0VXOA/osL7A==@lists.infradead.org
X-Gm-Message-State: APuU4Z9K9tfqKrgXpHXOH3Vz0CV4FcPUIWRYGINtm/kkgX2c4rz+bcCJ
	r0gwZvCYhoBUYdp8p8Uh75u6CDol8MyPHuQ4QCeUAzz0yrB/c20ASC2F
X-Gm-Gg: AYBFou236RtdsqzbbHCWoF9X9/OUtUr5xuJKwL9Mxk9tpctNLwnLnkoaLbm5p3fiBFI
	+Pn4aZFqUfeJ32fGJMmPB/9wS+RLMDhU1TD4taTvhUCZ0FcIeQnUPqvvwWwvafzGSJqtpZv3cZW
	eqiRdCfeLI2A58yv4xnQ6pQ46og/HoqLxSX0VsOx093gnv8M9dH/daLOM1uYiXQ+bWPPNTz9E17
	VyYn+YYvUxlqdvrL/3gLLwk/y80ehxgfSK/P3QtzFJTci2qK3TQVIX4vjsj+7UtonGxN5evPHOS
	bojI6tMmnccs1r5MV1Z7QDy6rxMam4rPYlpU7sucP6X8kV+taXbLo19cP6aWnmkk/L3uhCuuinm
	Ga4FBtOGOaf1g0bZ/E+VhrzNVQG4PPIXgSZsRr8m9z6AY8LzFDZvVaAa+GahYgGyOhcXnFP8ZSR
	wxFlXuV2dgFJSVZbXJy0fsXoej8jmE8tugTb016GYAp2/hA4Pybjx/+OseTB7vnEWcHqV9zJXbO
	Lq5RRFB64w/FwECtbVIYNWSnH04grRaGyJTN552N4mY+PdwZT+amGA4cf/Xv0RjXFTp/eRnqkAC
	LlovAI7Jdg9Jf/9fDRMHfNtarWHxtPD5erMsNyyz+aKBN1JP6duaNNUhfoRH7zEzTtRH
X-Received: by 2002:a17:90b:562d:b0:3b0:968f:fdef with SMTP id 98e67ed59e1d1-3b166cda37emr3135880a91.49.1794320558504;
        Tue, 10 Nov 2026 06:22:38 -0800 (PST)
Received: from [192.168.50.100] ([114.252.97.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db9d1fbsm70817a91.15.2026.11.10.06.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:22:38 -0800 (PST)
Message-ID: <ce2231cc-e554-44fd-b931-5627219b534c@gmail.com>
Date: Tue, 10 Nov 2026 22:22:33 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 9/9] iommu/riscv: Add riscv_iommu_attach_dev_nested
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, gong.shuai@sanechips.com.cn
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20261110115137.184160-1-gong.shuai@sanechips.com.cn>
 <20261110135615.8073-1-tanchi25@mails.ucas.ac.cn>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20261110135615.8073-1-tanchi25@mails.ucas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_062240_081514_4F40F13F 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVGFuIENoaSwKCk9uIDExLzEwLzIwMjYgOTo1NiBQTSwgVGFuIENoaSB3cm90ZToKPiBIaSBT
aHVhaSwKPiAKPiBPbiBUdWUsIE5vdiAxMCwgMjAyNiBhdCAwNzo1MTozN1BNICswODAwLCBHb25n
IFNodWFpIHdyb3RlOgo+PiAgIDIuIFVzZSB0aGUgZ3Vlc3QgUFNDSUQgZGlyZWN0bHksIGJ1dCBh
bGxvY2F0ZSBhIHNlcGFyYXRlIGhvc3QKPj4gICAgICBHU0NJRCBmb3IgZWFjaCB2SU9NTVUuCj4g
Cj4gSSBhZ3JlZSB3aXRoIG9wdGlvbiAyIGFzIHdlbGwuIE15IGVhcmxpZXIgc3VnZ2VzdGlvbiBk
aWQgbm90IGFjY291bnQKPiBmb3IgaW5kZXBlbmRlbnQgUFNDSUQgbmFtZXNwYWNlcyBhY3Jvc3Mg
bXVsdGlwbGUgdklPTU1VcyBzaGFyaW5nIHRoZQo+IHNhbWUgUzIgcGFyZW50Lgo+IAo+IEFsbG9j
YXRpbmcgYSBzZXBhcmF0ZSBHU0NJRCBmb3IgZWFjaCB2SU9NTVUgc2VlbXMgc2ltcGxlciB0aGFu
Cj4gbWFpbnRhaW5pbmcgYW4gYWRkaXRpb25hbCBQU0NJRCBtYXBwaW5nIHRhYmxlLgoKQWdyZWVk
LiBJ4oCZbGwgd29yayBvbiB0aGUgbmV3IHZlcnNpb24gc29vbi4KClRoYW5rcywKU2h1YWkKCj4g
Cj4gVGhhbmtzLAo+IFRhbiBDaGkKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
