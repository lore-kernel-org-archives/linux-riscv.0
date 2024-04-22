Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CA1C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 05:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5db8nnJPisCgGJPGnCcb2BDN7Vv8nL1WrBJ9fDAJfs=; b=X5CzqAT4HbuiQW
	Saqjn12ojsxLZMKcuGv9L1peQrDvh8PPz9N3ImELdroIw5iq8OSoo9BFLMebYlvek8nD8oldrqMyn
	0Aoi2BsGUAPlnUjwwmar8PMrBmQhz9F0aX3Z08NcnGZZYZD/mlMLXMSQQPWyr7itkGoE8Wxgc1MH8
	dAfW5r54Ga3h8Et0AFAZ5o3qcIkSUvFGSOHTJB6UliQOL8yF+98RIkRnYt3qzi2ENLeovzFgj1GuY
	Qs79T+u1vkSRLkjRQ8+tEVqQ3cvw7ihDOLhQT55Sw12DbOp7S1H2pbHmUBSidPkUaCzu7lgnK0aX1
	JpR6UWFG7jPiBPaMVcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rylzs-0000000C4No-007F;
	Mon, 22 Apr 2024 05:13:44 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rylzo-0000000C4M6-1XYi
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 05:13:42 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7dab9f8543eso35211639f.0
        for <linux-riscv@lists.infradead.org>; Sun, 21 Apr 2024 22:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713762818; x=1714367618; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FG0qLLclOE4mi/jAo4i/oV77z7cSDKe/RIU5yPeOfh4=;
        b=hnSnyMgXxd2z9Hv21GDZ5KcAX+XbgvIFeSb2SOcHpRib4uRQVSKFt12VzHboEoW/r6
         ZNKjEO33sg4hAXwDXryO6pQCrWnfnL/q/qVOm71COmR+jYTOsQgYeuBwOyTupgieMCf4
         8sif7XDwsDj08zoNAHDw3s8oEuMJstXTisuXlsMfTzgdEhshaCAOmDU23JE1l6RbcYpw
         auM3gWUcr3EGpyAKnE2JfRuHsD7bX2vU1ZXwsf800l13SSXWWoUGRoB9+IlPF4D3HsdK
         C+gxxUDQYh+ygvKaEfzhWdOM+bhsKy1RQEwyhPIqy2a1KYme0/V33DpeYpGpZYYKsQnl
         WoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713762818; x=1714367618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FG0qLLclOE4mi/jAo4i/oV77z7cSDKe/RIU5yPeOfh4=;
        b=YRoRcQorQ9FrFvFhKoIEzSxwNswzoZQYdv8NhWMt6VhBt1Ywdpj5dROYTi0uUL6guo
         nJxcA7ZiRjmxKHFT2x8yCE9W1wH0EIC0Mnmwk7NKVRawXqZveWMQ3dWdQSFeEqhdLMrO
         DuZxrYIKPZa1qG3GC4UBuTePne7yUPdZzNK56Md1hKkONfTYsaDiVfHEPO+m2mWmYSAz
         z/MKv+hafHCODS1n/NVSL8nZQ7HmChMWDIYin6aprxCUuryFTMnOBipWaJJ6xfhXTs4f
         W1qooNMJ7h+abgHQEXIPj0Wg/9p9ZtxXaCfnrLe2MMODARsVxL83lCgJhHdLT1OTG4xV
         Hvdw==
X-Gm-Message-State: AOJu0YyB/4OHNHC8t2oephaCfxTQY9jxz/9FRE4vzLJsAo8+CrWGDR4/
	+o39jYjbI9fVe5U7njVAB7bhnVLJxY0EZQR7oV2Xk+EIULQN2qSB+mLWykAu3IZ18g7xomXvy5l
	GtC3RE3zTKALwYMkP1z5u0L26pO8HRx/Qtzf+tw==
X-Google-Smtp-Source: AGHT+IHCnuL6IXUlkSrzPzwAu0FHqsPzh8FS83lE0t0Of5MqQc3C3fgm+9guSmdeLlMcmo18kgc9XytmsyImDFbeqzI=
X-Received: by 2002:a05:6e02:20ed:b0:36b:2464:bd2a with SMTP id
 q13-20020a056e0220ed00b0036b2464bd2amr15622918ilv.16.1713762818371; Sun, 21
 Apr 2024 22:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240417074528.16506-1-yongxuan.wang@sifive.com>
In-Reply-To: <20240417074528.16506-1-yongxuan.wang@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Apr 2024 10:43:27 +0530
Message-ID: <CAAhSdy2EEGfDYSuF6iFsXtEd5nR6mO6tXZZ6UZrM5m5CxdjD4A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] RISCV: KVM: Avoid lock inversion in SBI_EXT_HSM_HART_START
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_221340_645410_335DF9A5 
X-CRM114-Status: GOOD (  15.40  )
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

T24gV2VkLCBBcHIgMTcsIDIwMjQgYXQgMToxNeKAr1BNIFlvbmctWHVhbiBXYW5nIDx5b25neHVh
bi53YW5nQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9sb2Nr
aW5nLnJzdCBhZHZpc2VzIHRoYXQga3ZtLT5sb2NrIHNob3VsZCBiZQo+IGFjcXVpcmVkIG91dHNp
ZGUgdmNwdS0+bXV0ZXggYW5kIGt2bS0+c3JjdS4gSG93ZXZlciwgd2hlbiBLVk0vUklTQy1WCj4g
aGFuZGxpbmcgU0JJX0VYVF9IU01fSEFSVF9TVEFSVCwgdGhlIGxvY2sgb3JkZXJpbmcgaXMgdmNw
dS0+bXV0ZXgsCj4ga3ZtLT5zcmN1IHRoZW4ga3ZtLT5sb2NrLgo+Cj4gVGhlIHVzZSBvZiBrdm0t
PmxvY2sgb3ZlciB0aGVyZSBlbnN1cmVzIHRoYXQgb25seSBvbmUgVkNQVSBjYW4gdXBkYXRlCj4g
dGhlIHJlc2V0IGNvbnRleHQgYW5kIGNhbGwgU0JJX0VYVF9IU01fSEFSVF9TVEFSVCBmb3IgdGhl
IHRhcmdldCBWQ1BVCj4gc2ltdWx0YW5lb3VzbHkuIFRoaXMgcGF0Y2hzZXQgZGl2aWRlcyBpdCBp
bnRvIDIgc2VwYXJhdGUgc3BpbmxvY2ssIGFuZAo+IHJlcGxhY2UgdmNwdS0+cG93ZXJfb2ZmIHdp
dGggdmNwdS0+bXBfc3RhdGUuCj4KPiAtLS0KPiB2MjoKPiAtIHJlbmFtZSB0aGUgaHNtX3N0YXJ0
X2xvY2sgdG8gbXBfc3RhdGVfbG9jawo+IC0gcmVwbGFjZSB2Y3B1LT5wb3dlcl9vZmYgd2l0aCB2
Y3B1LT5tcF9zdGF0ZSBpbiBQQVRDSDEKPiAtIGFkZCB2Y3B1LT5yZXNldF9jbnR4X2xvY2sgaW4g
UEFUQ0gyCj4KPiBZb25nLVh1YW4gV2FuZyAoMik6Cj4gICBSSVNDVjogS1ZNOiBJbnRyb2R1Y2Ug
bXBfc3RhdGVfbG9jayB0byBhdm9pZCBsb2NrIGludmVyc2lvbiBpbgo+ICAgICBTQklfRVhUX0hT
TV9IQVJUX1NUQVJUCj4gICBSSVNDVjogS1ZNOiBJbnRyb2R1Y2UgdmNwdS0+cmVzZXRfY250eF9s
b2NrCgpRdWV1ZWQgdGhpcyBzZXJpZXMgZm9yIExpbnV4LTYuMTAKClRoYW5rcywKQW51cAoKPgo+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAgOCArKystCj4gIGFyY2gvcmlz
Y3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICB8IDYyICsrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAgIHwgIDcgKysrLQo+ICBh
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20uYyAgICAgfCAyNiArKysrKysrKystLS0tCj4gIDQg
ZmlsZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCj4KPiAtLQo+
IDIuMTcuMQo+Cj4KPiAtLQo+IGt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKPiBrdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8va3ZtLXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
