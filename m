Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77200C52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 05:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dk/te/4DEyRz0UW7hH28ugcEAxsolG1pVYKtArTYFhU=; b=Ud5uale6VY9hLC
	Xb2SwxhFJEftD3LrWsiPYllw0NlPRZc26JOcrXxbVGBTvKw1F+/n2UHICBUEQQQnCdy3BhWiOglvT
	W8t1F0L38j3A4Y2oKp+2G9s+nnQuksM6yZLEwa/3bq0q8+qRkXiXH4TlHo275/FaSnYhSk98MDzt3
	wiPyPuWSTZNFzmycQvPShGUuZDS1fsQYeWEoZojlE2SAiMarOo0cXxchHM/T5H5NitoTdbIOcqgj3
	sIShUtmA1nVzynX1stEFgJiW2FBr6kjPkkdhJ4PfrdeuDk4e4ihxDefmoYJ4S1mMNNff5aoZQ2GMj
	bj5QcYKt6lL3liW5OvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfum4-00000000PI7-1YAn;
	Mon, 19 Aug 2024 05:17:48 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfum1-00000000PHg-448B
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 05:17:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3718b5e9c4fso1904304f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 18 Aug 2024 22:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1724044664; x=1724649464; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xyh8E2w6qS2dDnFyvllL4xJUAKlas+oNhNFEyWDUr/o=;
        b=BLleNUXLhuXDLu+PDIsOgg7RWxPYo67EZmz8TG+FTA6xL7l09DX55AoWscTzev5H8A
         J0RifSVypa+T6lEYtVBWNvMaPF1OxNgodFKiho4OgpxS2iK2a1nQJDOz02DYaJQvAHxQ
         S6dSQEprNQfCBwk1iZlWTHrjj6kYPbqY/v+31KH7KDqkohRzrCK+oTyh1QW6/6hhBB4d
         po/HvWBuSKF06etVCtEuph/zGhpoLq8otiVVv3er2sUG/Hf1180fpsNhIlEvklnXjqEo
         qfnBOuga030t1JzG/DkRLMqQY/p3DESxNLaqUAejyLAGgVJbZgYLvpyLwDCReT9FPqN4
         pa5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724044664; x=1724649464;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xyh8E2w6qS2dDnFyvllL4xJUAKlas+oNhNFEyWDUr/o=;
        b=Vsp30UCMODMollLcdmW2GjBOyjf77h0QN0D5jJbcO0ZbS5Gmzw66+fqIJTqKaB36WK
         JpvUAGXR2Wes0IlpRHTtFQM2U/QhDsbCbZBlfD907a+ta3cpDmpCFR56UsSl63XWQBW1
         AZMdVhVElNYhJ0QkVRAO6UcoXrhwRp/0Canpj0jzVi5uSgBZtCuwPkUqLkTSY5dJlQxe
         9PMDhVdPZKZO1Oc8Qkbi1pBhZaRq59r5DakfyYHMxTNDNaLhfgPYLBWscBT+cxq6fqp5
         71NvBTtK0G1IvdibniwMRYjrr9xqxUZlZXcBKAg/Iy+CfylBJyFHXghVyrXuMEia7gRE
         hziw==
X-Forwarded-Encrypted: i=1; AJvYcCUubFJyRVWNxye0Dwnp/NpuXewiods+FLjDMRUkPwS/Mk+p8wBVux3y1SdhtR2sEYPnOWvIrX3GZm3Xq2Dx18f328tS6znbcrnjd3GrImbc
X-Gm-Message-State: AOJu0YzWbkBVMMigLgTfUKT7SIgr5HotO5+oN8UhiFcOZVhL10PA3Aqy
	kwu9XY6z8ya0fGKAdg09GqbqZBDinzqlsHQ+d4nRjl09GZ+bW3omPl0KpPsxdpI=
X-Google-Smtp-Source: AGHT+IEgas2OLJrF7XB2mIgjoehICb7EFSEjFXMukvtNnOS2pTLyI7kJ/AO49Glxml7R7Hs3m0cKzg==
X-Received: by 2002:adf:e6c9:0:b0:366:e7aa:7fa5 with SMTP id ffacd0b85a97d-37194317364mr5779116f8f.1.1724044663633;
        Sun, 18 Aug 2024 22:17:43 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718983a31csm9428388f8f.17.2024.08.18.22.17.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Aug 2024 22:17:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: Some feedbacks on RISC-V IOMMU driver
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAPYmKFsTcurrUiWqM8cFj+GgqfRiaLqPDGOTSE+RLyKJGSKE2g@mail.gmail.com>
Date: Mon, 19 Aug 2024 06:17:32 +0100
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 linux@rivosinc.com,
 Will Deacon <will@kernel.org>,
 joro@8bytes.org,
 LKML <linux-kernel@vger.kernel.org>,
 Yongji Xie <xieyongji@bytedance.com>,
 iommu@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 wangqian.rd@bytedance.com,
 linux-riscv <linux-riscv@lists.infradead.org>,
 robin.murphy@arm.com,
 Hangjing Li <lihangjing@bytedance.com>,
 baolu.lu@linux.intel.com
Message-Id: <B0C91D33-8C1C-4C67-B9B4-41206EFD8ECF@jrtc27.com>
References: <CAPYmKFsTcurrUiWqM8cFj+GgqfRiaLqPDGOTSE+RLyKJGSKE2g@mail.gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_221746_048993_2B3D23DC 
X-CRM114-Status: GOOD (  14.46  )
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

T24gMTkgQXVnIDIwMjQsIGF0IDA0OjU2LCBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNv
bT4gd3JvdGU6Cj4gCj4gSGkgVG9tYXN6LAo+IAo+IFRoYW5rcyBmb3IgeW91ciBicmlsbGlhbnQg
am9iIG9uIFJJU0MtViBJT01NVSBkcml2ZXIuIEl0IGhlbHBzIHVzIGEKPiBsb3QgZm9yIHdoYXQg
d2UgYXJlIGRvaW5nLiBCZWxvdyBpcyBvdXIgZmVlZGJhY2sgb24gdGhlIGV4aXN0aW5nCj4gaW1w
bGVtZW50YXRpb25bMV0uCj4gCj4gMSkgU29tZSBJT01NVSBIVyBtYXkgb25seSBzdXBwb3J0IDMy
LWJpdCBncmFudWxhcml0eSBhY2Nlc3Mgb24gaXRzCj4gY29udHJvbCByZWdpc3RlcnMgKGV2ZW4g
d2hlbiB0aGUgcmVnaXN0ZXIgaXMgOCBieXRlIGxlbmd0aCkuIE1heWJlIGl0Cj4gaXMgYmV0dGVy
IHRvIHByb3ZpZGUgYSAzMi1iaXQgYWNjZXNzIG1ldGhvZCBmb3IgOCBieXRlIGxlbmd0aAo+IHJl
Z2lzdGVycyBsaWtlIHdoYXQgb3BlbnNiaSBkb2VzIG9uIEFDTElOVCBNVElNRSByZWdpc3Rlci4K
ClRoYXQgT3BlblNCSSBoYXMgdG8gYWNjZXNzIE1USU1FIHBpZWNld2lzZSBpcyBhIHdvcmthcm91
bmQgZm9yIGEgdmVuZG9yCm5vdCBpbXBsZW1lbnRpbmcgd2hhdCB0aGUgc3BlYyBjbGVhcmx5IGlu
dGVuZGVkLCBldmVuIGlmIGl0IHdhc27igJl0CmV4cGxpY2l0bHkgc3RhdGVkIChidXQgaXMgbm93
LCBpbiByZXNwb25zZSB0byB0aGF0KS4gUmVwZWF0aW5nIHRoYXQKc2l0dWF0aW9uIHdvdWxkIGJl
IGEgcGl0aWZ1bCBtaXN0YWtlLgoKVGhlIGN1cnJlbnQgSU9NTVUgc3BlYyBkcmFmdCB2ZXJ5IGNs
ZWFybHkgc3RhdGVzOgoKICAiUmVnaXN0ZXJzIHRoYXQgYXJlIDY0LWJpdCB3aWRlIG1heSBiZSBh
Y2Nlc3NlZCB1c2luZyBlaXRoZXIgYSAzMi1iaXQKICAgb3IgYSA2NC1iaXQgYWNjZXNzLuKAnQoK
SmVzcwoKPiAyKSBJbiB0aGUgSU9NTVUgZmF1bHQgcXVldWUgaGFuZGxpbmcgcHJvY2VkdXJlLCBJ
IHdvbmRlciB3aGV0aGVyIGl0IGlzCj4gYmV0dGVyIHRvIGNsZWFyIHRoZSBmcW1mL2Zxb2YgYml0
IGZpcnN0LCBhbmQgdGhlbiBjbGVhciB0aGUgaXBzci5maXAKPiBiaXQuIE90aGVyd2lzZSB0aGUg
aXBzci5maXAgY2FuIG5vdCBiZSBjbGVhcmVkIGFuZCBhIHJlZHVuZGFudAo+IGludGVycnVwdCB3
aWxsIGJlIHNpZ25hbGVkLgo+IAo+IEJlc3QgcmVnYXJkcyEKPiBYdSBMdQo+IAo+IFsxXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTcxODM4ODkwOC5naXQudGplem5hY2hAcml2
b3NpbmMuY29tLwo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
