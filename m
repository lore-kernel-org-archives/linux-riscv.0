Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE5E606A338
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 05:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p15MjStN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=oizITENK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dU0oixBxknqQajI6nQ2Q06OkTKdmlERhYBySxDStGBA=; b=p15MjStNfj+725tAv7BV6/0ucf
	SmDJpfVhoAH1g4liWZ1aLGF60DpR4+NkrTGM+WfeeHgGlFuCgI10fq4paT608JVS34kLR84SgzfKK
	cQgWotfDPoatZIqCbrPyIV+Gm6uM54Bkb2rfJw173EY0vlO56aaKKncoQCdHzYQ9UklFp/F9ok6SR
	5QpV6AMhjBgNYRCSxd8rl2DsmbtVJKws8I8btgz/qDu0wkKVRJPn2oU2/xY3lgKKuzCTzbA5rYBTC
	7ppEXV/If3z6aLX6aS3AydPedlaD+heN4EoVraKyAhhtryA1zQ8pj5J0egoi3g7BmARnqEJQCyudJ
	ekkwqafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tP-00000008UH3-1vE6;
	Wed, 25 Nov 2026 05:50:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tL-00000008UFg-3rU3
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 05:50:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so42350475e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 21:50:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585802; cv=none;
        d=google.com; s=arc-20260327;
        b=GSsblBIS81NhfduXi0280NoQORkbRkpst88rdSADRsIQJ2UrYO0hfTGjbEsWjjhCO5
         CMH+IF+XBmtjNiXKYEwLMnl0lzKhYxujZ0unALjDXRSlX/+PPunUynqG2OBNhS5OEMop
         Cwr6EU5s68bl+qH2pg0jaokET+8i6hSaK6fmwoWTrcycOk1YRLtCOVCvZD7+w5+jjr5G
         DU9ZtWHpF4lFGGLYxo6XU3BYxWHbjo0/KXIegPWPuqUIYuyoNWfdtHJCcespqvibhh7B
         6NK/52s63pvtWgghZQVtQKhf8Kz7YMgv6GaTn8s9zHJehF1ifuVYl89AiXC5FfvARifR
         yREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AJcWadRJU+vTeGGYfzg2TttCaXCo1woljVumAlihtvo=;
        fh=K//p9c0kgiMAYqg2MR+wjg+nsPDTs+yWdpCMRrgsrhc=;
        b=REjU4Ptla0AokiO6D2lyDBZISsX3g5UkggurO3XbPJISCYs3KObIiWqEikgs5Y8h7M
         ZUhCFnAko30SIc3/gXxz3h4EtRDAbQnQZqW4NFZIXvZ1NcDifMszVxw4avuyBc2fRLb7
         Bkmeuger4GoTObxGx/+X9wdwZa8cFTr1X75LdXTeDnmfAOiGGwesKJC3Os4oTVYZ6b+F
         9ManbPWz9LAfzE8DQgML6VBV8oDHJQnUOiVkV0QoQ/X39ttfB0p2ZFQ171r9A/cLfCC9
         3MUKAttv9C3S/Ac4m9tf7HXoGtsNTsWl3JasY3zSN1EQz02qMfB6xdtGDESFUlWtC7Qq
         nItw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585802; x=1796190602; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJcWadRJU+vTeGGYfzg2TttCaXCo1woljVumAlihtvo=;
        b=oizITENK0+aTrj5BI24mX4aWndB8mD+xM9xE9iYWVOwLl8XJRLRvoF4C5Anz9dtYh0
         88NiDO8ieVxoTB7UfkvpmjO7cZj53VKpQc9B+HBEd52rqO1yqr9p+6AbsNgyA0RQXruP
         QXXkUKFgQZ2KkTp+U4rwzVFalODMVk0cvIE4w3+WSKEyuTeCA4intuKCxKUEicYa/3o5
         Fp+2LHOTaRFmrkrCZR506WohpZPFTGzCmm7KYWQOoXIeHUheE6jK/vKGx4iUjTsnLTSU
         UJo8MNRnvL/Uu6gra4b18vMu4i0BejuJ5RyZaq4XwIoxvE7TrNSjFb8+lybmuTG8FRNN
         bA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585802; x=1796190602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJcWadRJU+vTeGGYfzg2TttCaXCo1woljVumAlihtvo=;
        b=MpCArw+6TE8fisydbBuUIQSA8dMXI+4WEjHiw1x8Aia3Pvv1kjRLRis9lwYLtZ7c9G
         jID7fAzRx6qAV+mgdyw3/6RhD/c9cuvhdp2vkGEDMpQcaaGskXgiHDiDDHYt52zpL3xm
         NFt0qAIjWmiWND+Brbg11e0N6KCoNeBXie0sx3/8/hPoRCdpKOPcb3d5KOwABNWWExOu
         zDEUQiSjo4n7IzUh1F3Rr7Aacv2WgIc7FGB7RNDwIS2LSnGCEvdL1KGUYmlKQv7tFLPN
         8WkqjamCP4QYD9J99RWAXLID2fDg75bCzDuv1QT4kN6ChQCL7JO98TxRM2ePzBHPgogV
         qYjw==
X-Forwarded-Encrypted: i=1; AL+hErHd5jA3rKbDVnKPi232SmR37mf0VHc2Ze7XTh1xUNpsSX0G7T6EliXxNq+r8/9mLgIcwTc5EdHcDXZABg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/gVR+/eAVw15YZU0msQXUbSKcLZM4YpjB6yDAyxIByl/crFwEV
	tDZdGgEj5eahTqz+bdVHd/aD5gxR3a4Fa9J3Py064HgMa2/T+WRIZyLLX57nlecpVSBrXR6ukaZ
	SOJdAvBLvgBw1M5m5TZi+KLrPKTu25lyBkLIvcEqvkA==
X-Gm-Gg: AZFdTZd1smcG5BisCqOhGW3D/hEKpdfmIAMbRvuKoRgUk7aWJ2ZCwvk0G8N0T7Vfs1q
	grWv+LSRgwFxkuz0v5AXF5HhVBvKpb9CFxa/f29fr2twxn/uK32VZ2o+vxj44JjuZD7fH1tBZZ7
	9ylmSDxbD7uIh31JiMwVA0jWCCuU7r7kjkqQMJCJgubpQiPrjupyZv3f0FuNJvQdq+LRysnoM8J
	BmaFVCQX+uFtvCoS9IdkJc9rCvzkMn8J12/CvSvzNgXPLAqilqIpRNiTS+xUo77lnYVoSiu9P+u
	dmTO4CZegM+uWwdS3hxzhWXM4XOJgoiru+h28Q6d3q+2oolCRwdWbikQMsyEdqOGtm/AwwRRFvG
	qkjvxBRAOp4JRLqaBEhM5yjhaCxQA2HHeOgcpMdeYtmok4UvT4uDyxHvsp1ZrjKs2uQDrS2MD1h
	VJMoqxKvHMHbSfdUWUOK7PX2BxnokB1FxPvpByBUVcDAkJdAQcltqwogc=
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id
 5b1f17b1804b1-4bb88922df3mr317698415e9.12.1795585802059; Tue, 24 Nov 2026
 21:50:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com> <20260921111402.120911-3-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-3-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:19:50 +0530
X-Gm-Features: Aa3M54qit6VRNciPHtVoHbdaqRLIxhuX2UY4YW1iBU3P015oUnZkIIeZ7ncDCSc
Message-ID: <CAAhSdy3aJo_S=miuWjFRwaMyd9XwDOWT94OLRysgZ3+r6-cvYQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] KVM: riscv: Read G-stage PTEs once when walking
 page tables
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Jinyu Tang <tjytimi@163.com>, 
	Wang Yechao <wang.yechao255@zte.com.cn>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_215003_977409_56982CBE 
X-CRM114-Status: GOOD (  10.13  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgNDo0NOKAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gZ3N0YWdlX3B0ZV9sZWFmKCkgZGVyZWZlcmVuY2VzIHRo
ZSBQVEUgcG9pbnRlciwgY2F1c2luZyB3YWxrZXJzIHRvIHJlYWQKPiB0aGUgc2FtZSBlbnRyeSBt
dWx0aXBsZSB0aW1lcy4gVGhpcyBpcyBzYWZlIHVuZGVyIG1tdV9sb2NrLCBidXQgYQo+IGxvY2ts
ZXNzIHdhbGtlciBjb3VsZCBvYnNlcnZlIGRpZmZlcmVudCB2YWx1ZXMgd2hlbiBkZWNpZGluZyB3
aGV0aGVyIGFuCj4gZW50cnkgaXMgYSBsZWFmIGFuZCB3aGljaCBjaGlsZCB0YWJsZSB0byBmb2xs
b3cuCj4KPiBNYWtlIGdzdGFnZV9wdGVfbGVhZigpIHRha2UgYSBQVEUgdmFsdWUgYW5kIHVzZSBh
IHNpbmdsZSBzbmFwc2hvdCBmb3IKPiBwcmVzZW5jZSwgbGVhZiBhbmQgY2hpbGQtdGFibGUgY2hl
Y2tzLiBBbHNvIHJlbW92ZSBhIHJlZHVuZGFudCBsZWFmCj4gY2hlY2sgaW4ga3ZtX3Jpc2N2X2dz
dGFnZV9zZXRfcHRlKCksIHdoZXJlIG1tdV9sb2NrIHByZXZlbnRzIHRoZSBlbnRyeQo+IGZyb20g
Y2hhbmdpbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTZXVuZ0p1IENoZW9uIDxzdXVuajEzMzFAZ21h
aWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQu
b3JnPgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
