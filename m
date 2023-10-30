Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7166C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 18:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fseXgkkD5T/6J+3Reyhxg9XndMRyjzt1kgPtddIYqvg=; b=FnO7OX7XpxwKyU
	QiVU6RsmZwvh24yKRemWra3C+vWz87UCokaerKD8QCh92d4SLDmv0HUBR5p1DAe5649fCcQPcTZbB
	roXW14+sJbw7EStfylJWH5kMA1szOGhcBUdqHnngfoxJeH3+PPzK8kSBD1P4/Z98h0hUf8lfGlFqW
	ntHX33EzamOlLtTRxf/2JDG2KXqst8b+hkOyrnXTJgwlagwlqn96QsPHnhJJK8kDw21YJQCNL+9nu
	Q7W45I1vDTZpNx99AYPr9vgSUh7gR5QNKe/xIG355fvoJJZRElg92AkdYrPMBBdHYPgzN8kTelcOR
	OSyE+dhFvbUGFyp+E/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxWs7-003q4O-2X;
	Mon, 30 Oct 2023 18:20:19 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxWs5-003q2a-23
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 18:20:18 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c50906f941so69591421fa.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 11:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698690013; x=1699294813; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYDArYAPbuwvLuQnLMgYzD5G3hQJ3JuyTKb70j8k5kM=;
        b=X0n8nd6aGF8GdhrYpp1EJy+gJ8xYhMnxoSn3QOZvv9tGZ0tQ1tycdC2sAzxH6BQQwM
         l6xYYa/5w4bAnX7o9vjvJXeKs7ceR+n8QdYM3YGECBG+YfsvyUKjiz8f4wNCPqtlfVfN
         pOQkww1kofp2PsQBCtbf+YMkrfjZPnuH0ofW5VEUZLp5erN+gxwcdnxYWC0izGpKFJ85
         Z1e+99RYn/U556fnsFna1me0v+gKsXfP1lmwqWYy5BGcbMzJJFxI1h+T2LwkDLlEUiLW
         hPi/OfVYDYcDWP3IDZaY6c6xg3AEoHfkMoRJJRu0AlQLaH6m+mceffRJLjFwYPbrQgT1
         xRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698690013; x=1699294813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYDArYAPbuwvLuQnLMgYzD5G3hQJ3JuyTKb70j8k5kM=;
        b=quWeJGUyuFfuh0gKkv3J+2TtUVbR9rMIg470kWGH0+c3F39n1bKZkWercct0Z7bJk7
         UTklQ5FsvuhSt7dxtqhCkHJN1pyu/CrWe8T8/RLongfCJ8hV0YuApNQ0DkaOg0w0+f8+
         irE6VbfBM5cNq6rubz2hD2jFvpVR1Fb7SHYgyx8s/k1nxdAyPUcPb2bam8op8zODdzT5
         ol78EszLgnEm0CARCRyOKh0ME2uHuVNd+njHJoizGner7jKnI7zzoMA3m4TSTtIXUPKG
         fr1+8sLZ981UiUJmDumR1UdKmHO0Ab3geBO6pKPci5EkxQtVHulPvYe4BMMgPbrI6jPg
         x/Gw==
X-Gm-Message-State: AOJu0Yyn2K8ebmqqqkuKLTCOegnxEIiPSMFY6jA2qG4g5u/Rk0PRmLeT
	8OAQFqwv7+ngvX5P6zyFin/wQNeRxJUlGPwK7J76tg==
X-Google-Smtp-Source: AGHT+IGWQtTaV5Bzkdlkn1e/3Zt5UNsfNX/Ijo670f/udb747Y9rnFPe4I+UgnAkk/OF+ECMZnUUXa4ItRfh9V5jdaA=
X-Received: by 2002:a05:6512:10cb:b0:507:aaa9:b080 with SMTP id
 k11-20020a05651210cb00b00507aaa9b080mr9836391lfg.33.1698690012887; Mon, 30
 Oct 2023 11:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-4-seanjc@google.com>
 <ZT_fnAcDAvuPCwws@google.com>
In-Reply-To: <ZT_fnAcDAvuPCwws@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 30 Oct 2023 11:19:43 -0700
Message-ID: <CALzav=cjq_MbJgi3DMytVWwZLFxEPi1dp7YiBYRBw-sRf2+BLw@mail.gmail.com>
Subject: Re: [PATCH v13 03/35] KVM: Use gfn instead of hva for mmu_notifier_retry
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_112017_673373_83203A3C 
X-CRM114-Status: UNSURE (   8.76  )
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

T24gTW9uLCBPY3QgMzAsIDIwMjMgYXQgOTo1M+KAr0FNIERhdmlkIE1hdGxhY2sgPGRtYXRsYWNr
QGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gMjAyMy0xMC0yNyAxMToyMSBBTSwgU2VhbiBDaHJp
c3RvcGhlcnNvbiB3cm90ZToKPiA+IEZyb206IENoYW8gUGVuZyA8Y2hhby5wLnBlbmdAbGludXgu
aW50ZWwuY29tPgo+ID4KPiA+ICt2b2lkIGt2bV9tbXVfaW52YWxpZGF0ZV9yYW5nZV9hZGQoc3Ry
dWN0IGt2bSAqa3ZtLCBnZm5fdCBzdGFydCwgZ2ZuX3QgZW5kKTsKPgo+IFdoYXQgaXMgdGhlIHJl
YXNvbiB0byBzZXBhcmF0ZSByYW5nZV9hZGQoKSBmcm9tIGJlZ2luKCk/CgpOZXZlcm1pbmQsIEkg
c2VlIGhvdyBpdCdzIG5lZWRlZCBpbiBrdm1fbW11X3VubWFwX2dmbl9yYW5nZSgpLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
