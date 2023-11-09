Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7088DC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 01:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=35A4te6NPEDv2hONeJB1bvAOT9htAv1HKNsQ3hSZCO0=; b=iQEw2rtOMAME9K
	fspNtO1Y+QuDlYPZi2szFkQCJjMWlre/5qCm0iCLMc0Rm0XykpDVkdHZSYYIJucHp0VOKl0PSa/1M
	6HLrrkn0i9ZyChgp4OeopO7ESEPbdMmsjTLNAMAGGgYh0dPdZaKvUI6vN0WhIwxneI0WXI+ip3ChB
	SLEXxRvwqusU2OSvgIYq+SCHge6Tt2Wm2qT4aT8WlQM4phoRStZ36rJWTpf8HM/T9voozHpc6xoNv
	rBnj4OsUqgJTc+hyXvlHU4h0zDjJwAhMl9xUU08k0aezVO/AYmokhNBexq0y1NeiesR+vKEiFwaqQ
	wy9EH4DwfSRwPzHzz61g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0tXH-0052t0-0q;
	Thu, 09 Nov 2023 01:08:43 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0tXC-0052qr-20
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 01:08:41 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-581f78a0206so165331eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 17:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699492117; x=1700096917; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QtjMEn3JvZfL2+9Ot0aHfDjSbnUMOfTRHsLPFnN/cE=;
        b=A4J7x90UbzCvX/Mqtfskvbacn4rrymt5JTKATo5hucFg7U1aLsUQeQDkvDzvNRKB42
         shlni3kE6wdGa09CALKxDD8u7lbk2Xx4KE8s5hxQ0N2bpY4W/7YJbX9+gtVRdC0JXFcZ
         3cHhjAiSl+xqi+It0Ut93wC+KTLm/Lf1bwCNftXZUok7WzzDu2xOVN/EaAWQpHuVFw3P
         tdaPE43U8wXFq4fCHw4xuCvbf4WUg2GDYfH4WSH+afZkNTJH8EC/v+8aRdpWWYjOTyvu
         Q8YlbHhsVJ5assVeL5kvqJl+mRZNivnoURoiid6xoGhu3ZH9TXuPy2HTARMCTGKbxcsP
         tKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699492117; x=1700096917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QtjMEn3JvZfL2+9Ot0aHfDjSbnUMOfTRHsLPFnN/cE=;
        b=kwRqNwDpToLQ2LPVUqRkZWRP9px0k9/0hAHQpAhfwruWsJVW7PA+xX5WU2tyKEDoJD
         P47yCvQxmJa2WCmHZopoM0k9n9vWEsV+y5+nRNCPIY7JJndjkKMu77fejL7JW+VRzs74
         Js5fv5iepIA8D3sdNsox07OEvCVCcKDrFmIAr3Y+oyv5AI3lKmRx4KUHVIIZHmy4RB3g
         G81tB6n3yGOYewxrBj+RHbPu4vBpn5EWYNPo2XyLVJTkhCvIWcj0UsWxHBtcuByeE1Rf
         PisUQc06T7AgYSRiQwOQ7FZktVn+tT9cysVpdChi4ADMoe56hXaEYUs3CkqJDl6uZhR3
         MOlg==
X-Gm-Message-State: AOJu0YwMdX58t5W1Y3TMwP2xKCjENcUmjI+4Hyf2cZQ7LjbdhJaFM1LX
	/xtGL0c001kibX613wdsM59xsWb+431GHK25Nazx9A==
X-Google-Smtp-Source: AGHT+IFaOEA03XuxazKl3zVOaUpDe2bAHjHbEU9NUIQA9ZcNh5LArgqxcn+4MTtdSbfjNu4oRqbtO3sH2+Wygyf9VBk=
X-Received: by 2002:a4a:e088:0:b0:587:873d:7e2c with SMTP id
 w8-20020a4ae088000000b00587873d7e2cmr3411182oos.1.1699492116891; Wed, 08 Nov
 2023 17:08:36 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-35-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-35-pbonzini@redhat.com>
From: Anish Moorthy <amoorthy@google.com>
Date: Wed, 8 Nov 2023 17:08:01 -0800
Message-ID: <CAF7b7mpmuYLTY6OQfRRoOryfO-2e1ZumQ6SCQDHHPD5XFyhFTQ@mail.gmail.com>
Subject: Re: [PATCH 34/34] KVM: selftests: Add a memory region subtest to
 validate invalid flags
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_170838_660152_0D158FBB 
X-CRM114-Status: UNSURE (   7.94  )
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

QXBwbHlpbmcgWzFdIGFuZCBbMl0gcmV2ZWFscyB0aGF0IHRoaXMgYWxzbyBicmVha3Mgbm9uLXg4
NiBidWlsZHMtIHRoZQpNRU1fUkVHSU9OX0dQQS9TTE9UIGRlZmluaXRpb25zIGFyZSBndWFyZGVk
IGJlaGluZCBhbiAjaWZkZWYKX194ODZfNjRfXywgd2hpbGUgdGhlIHVzYWdlcyBpbnRyb2R1Y2Vk
IGhlcmUgYXJlbid0LgoKU2hvdWxkCgpPbiBTdW4sIE5vdiA1LCAyMDIzIGF0IDg6MzXigK9BTSBQ
YW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPiB3cm90ZToKPgo+ICsgICAgICAgdGVz
dF9pbnZhbGlkX21lbW9yeV9yZWdpb25fZmxhZ3MoKTsKCmJlICNpZmRlZidkLCBwZXJoYXBzPyBJ
J20gbm90IHF1aXRlIHN1cmUgd2hhdCB0aGUgaW50ZW50IGlzLgoKU2lkZSBub3RlOiBJIHdhc24n
dCBhYmxlIHRvIGdldCBbMl0gdG8gYXBwbHkgYnkgY29weS1wYXN0aW5nIHRoZSBkaWZmCmFuZCB0
cnlpbmcgImdpdCBhcHBseSIsIGFuZCB0aGF0IHdhcyBhZnRlciBjaGVja2luZyBvdXQgdGhlIHJl
bGV2YW50CmNvbW1pdC4gRXZlbnR1YWxseSBJIGp1c3QgZGlkIGl0IG1hbnVhbGx5LiBJZiBhbnlv
bmUgY2FuIHN1Y2Nlc3NmdWxseQphcHBseSBpdCwgcGxlYXNlIGxldCBtZSBrbm93IHdoYXQgeW91
IGRpZCBzbyBJIGNhbiBzZWUgd2hhdCBJIHdhcwpkb2luZyB3cm9uZyA6KQoKWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2t2bS8yMDIzMTEwODIzMzcyMy4zMzgwMDQyLTEtYW1vb3J0aHlAZ29v
Z2xlLmNvbS8KWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS9hZmZjYTdhOC0xMTZlLTRi
MGYtOWVkZi02Y2RjMDViYTY1Y2FAcmVkaGF0LmNvbS8KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
