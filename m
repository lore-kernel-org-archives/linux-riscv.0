Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAB7C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 17:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PEnyVHuQj9sMEbxrlcZYErv1b8ANgv/v4E/FsvA7zN0=; b=GmwejrFRHfyPEs
	IwAidS0MUVg1tf/g+/10o3ajocowE5xo48FXinT4Nx/5gxLhO4AB9YNAFA0Hpg04EV1cR1ZUjn2lg
	KequZIQH0c2r2LEs7CItEwQOu33Ar4OMqkpdwQlvl3s999uSADQTEVReSbPnjoC/IZK6/fbDF5MfH
	p+tcwDslWvtihtkBaeNuss8PTz9zp548lmNt0e2g5QBnHCBNjCNaXogHpcHqSMN6T/291Z3IHynnY
	lXiD4yoVcDnFsjbXXLtGCtzrxiDg5QU1UpGFkH5QJ5vlgcKz8lYXS+6JnZ6X7UWs7/D/dhmAMbTMQ
	rd7mpcs+x4FyMNLWTF2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0lv7-004MDx-1t;
	Wed, 08 Nov 2023 17:00:49 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0lv4-004MBZ-2E
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 17:00:48 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5872b8323faso3844182eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 09:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699462842; x=1700067642; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LRS4MOzwpv79nEdyxX9W+Fzi/lnfht07XTGfi+1KqQ=;
        b=hT8DV8fz4OOUfq/0+ecJfEv+93yIl9Dx53YRSrvLNUh7yCBgYN8JS5HO4qN2dR3mcS
         zRjaCbC++rvqFDAGsgbpS7Uwn3/G6mAsMCqS95IxrBWYasbWhV3IA6c96BHWutBC3nWp
         EouJimDox7ngXkTcauVAdnEPW2P8T7u3EUv3nPXOi+GIUE4+dtdj/qWxP9x22Sn89Sw9
         NMO3IQE+WMkgUA/kbEbwf+9ysLt7hIADDHjeYRvEintoC/xpOwwOAGoDyzsHEHJniv1U
         tEAqPrRqaHcEnNl1KEE3EqX0io4RjAamcfPPEJWsT9G2/w8/JyYuvw+qxox6HWVHUyDC
         qeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699462842; x=1700067642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LRS4MOzwpv79nEdyxX9W+Fzi/lnfht07XTGfi+1KqQ=;
        b=DXycp464yBAPddEoXdQA2yQo5LKwwMn2uMGxTFT8cOPGEkffEjrCglpUNPny2IFR+P
         X7ctjhzbJfRuNZho/xui0BG+cHw1/IHYNDuZRChM2bFlhw5Pogaid+hn6z+oB9IdrxHa
         KS0xcNRapAJy5tYbCcvjsg+t9B5CdumySOxp05bDeNYrWcT0mRsDwHHw85OYu9w87LuG
         Ju4faVyBM+25Oh7p83DPyMM3LEt9kgAb2IK8pIigv5iZrUEAy7q4Sx8NCMSSbGLWY7/F
         ShvVqLB0nLYhuash79D12LnpnnmX46nPl00G6jVh2BUB2Zjkn4u5W96RQXLfO3SSABoL
         X/ww==
X-Gm-Message-State: AOJu0YyuvpjcdI8DjMBhtAbiyZDBMOwdxHuRn5Hfb7uog7p1nYuCM3Tr
	+obCuhr/nkPk4VftY2isQfrDxi2tcf+pR+4Vgi2glA==
X-Google-Smtp-Source: AGHT+IFUowk4ELsOivnzaXxc0QlUV4Wvcfh03Hm5SSyMQjwcPTJCFQB+7xIvrXwxFUaSBNJXJhJv8dNqTjB0k78gAdI=
X-Received: by 2002:a4a:bd87:0:b0:589:df75:2d83 with SMTP id
 k7-20020a4abd87000000b00589df752d83mr1373195oop.1.1699462842423; Wed, 08 Nov
 2023 09:00:42 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-28-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-28-pbonzini@redhat.com>
From: Anish Moorthy <amoorthy@google.com>
Date: Wed, 8 Nov 2023 09:00:00 -0800
Message-ID: <CAF7b7mrGYuyjyEPAesYzZ6+KDuNAmvRxEonT7JC8NDPsSP+qDA@mail.gmail.com>
Subject: Re: [PATCH 27/34] KVM: selftests: Introduce VM "shape" to allow tests
 to specify the VM type
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20231108_090046_748774_E96481B8 
X-CRM114-Status: UNSURE (   6.89  )
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

VGhpcyBjb21taXQgYnJlYWtzIHRoZSBhcm02NCBzZWxmdGVzdHMgYnVpbGQgYnR3OiBsb29rcyBs
aWtlIGEgc2ltcGxlIG92ZXJzaWdodD8KCiQgY2QgJHtMSU5VWF9ST09UfS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0KJCBDUk9TU19DT01QSUxFPWFhcmNoNjQtbGludXgtZ251LSBBUkNIPWFy
bTY0IG1ha2UKIyAuLi4KYWFyY2g2NC9wYWdlX2ZhdWx0X3Rlc3QuYzogSW4gZnVuY3Rpb24g4oCY
cnVuX3Rlc3TigJk6CmFhcmNoNjQvcGFnZV9mYXVsdF90ZXN0LmM6NzA4OjI4OiBlcnJvcjogaW5j
b21wYXRpYmxlIHR5cGUgZm9yCmFyZ3VtZW50IDEgb2Yg4oCYX19fX3ZtX2NyZWF0ZeKAmQogIDcw
OCB8ICAgICAgICAgdm0gPSBfX19fdm1fY3JlYXRlKG1vZGUpOwogICAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn4KICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8CiAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSB2bV9ndWVz
dF9tb2RlCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBpbmNsdWRlL2t2bV91dGlsLmg6MTAsCiAgICAg
ICAgICAgICAgICAgZnJvbSBhYXJjaDY0L3BhZ2VfZmF1bHRfdGVzdC5jOjE0OgppbmNsdWRlL2t2
bV91dGlsX2Jhc2UuaDo4MDY6NDY6IG5vdGU6IGV4cGVjdGVkIOKAmHN0cnVjdCB2bV9zaGFwZeKA
mSBidXQKYXJndW1lbnQgaXMgb2YgdHlwZSDigJhlbnVtIHZtX2d1ZXN0X21vZGXigJkKICA4MDYg
fCBzdHJ1Y3Qga3ZtX3ZtICpfX19fdm1fY3JlYXRlKHN0cnVjdCB2bV9zaGFwZSBzaGFwZSk7Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
