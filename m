Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20BFD1CDC6
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Dec 2025 05:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7l405UB1J/O/ewyB5VchLJwysdx+qFxmo+EEE0E5Gn8=; b=DZz5tp40WQ4Yf/
	Sv/2cxcTL1rthJVv+xVYcSMJ8cm8qF/l854oN3321ClpbPcMwsgdGv2CFgba8u3MPgmWvdSTP1gNd
	Owk0n3yFNVUraric/2jeNS+0FP6xAi4A1AUZbpoBLYajhstjdYp2zl3uzCDCWIym8MViNuIQkAJ9I
	Pn3xh80Vg0IrgQZCW+EgkkfgrnZB6u84/5yR2v4fnbiLvtO1qmo5g+t4yv4suoInWAb59U+6eHCoI
	vaG06s8mpsEbIpjvBl/nPLf5Ll7SozXXJnwFqb+7zHD4gIivtpJuzy+kt/q+LLhjXmlbWu7qBkT6i
	a5xKIiw5pBrN5kWkPJcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS76K-0000000BU8J-0WNU;
	Sun, 07 Dec 2025 05:14:28 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS76H-0000000BU7R-2JHe
	for linux-riscv@lists.infradead.org;
	Sun, 07 Dec 2025 05:14:27 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7c6d1ebb0c4so2926388a34.1
        for <linux-riscv@lists.infradead.org>; Sat, 06 Dec 2025 21:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765084464; x=1765689264; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIr6vMU+1WXTpE+kuQ5XIOvR7lhOKuME2h0aehuNw7U=;
        b=yphoFExAA6hw9FxEy79Q0Ktooulcc9EkrJ9pqdXEvLG6qOehRXefP1OnRnaNEVNhLc
         Poky6A4ZJdREh/x8eKFnYaZT3857GWvtWxmk8nQFmT1znJ2J2KXWrCdELfW6gdephopu
         4DR+dZ+uYk+4wjI8xgSDnCda9Qtoua7kHAxOWJhA7g/eia6rO3TYCsmskTiHmbdj21k8
         y+DJtXXPhRmrjy9VW8z8q7gS+a2QlJ9arTOWgdp8NmjDXr73SrjMRLDH5uIgcnRWRO3E
         BR/tSfSIUG7CSXrQ9SUIx2CcEDwy/ukbDWA/BzUILDPZWGXKFS/DpDF0zMVq44y42Bel
         5JDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765084464; x=1765689264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gIr6vMU+1WXTpE+kuQ5XIOvR7lhOKuME2h0aehuNw7U=;
        b=ekVumWnpNl/r4oxEqZW2AaQi5lt0PJgrcfFLOOOaGaEoVPfiotrEis97gQci908m8p
         3BAp2o7ISPfdBY9PXofEIFQ/lnBut6CU+zAeESFkms59iLBhP1b27LoU8B8/Vo6Ypyh9
         F7+bxEXop55FXkdYjZqbq730+qP5lVh62I9Fl4NF22JksLNmCHDhGW/7a9yggMe7dNBy
         f3AbQCv+dnxpDOeDzIRQypG/l2rorwAJaPRflOl1VUuNF3Md7DlfFvfMGaycFKwxM/3U
         wax2y4AIwgPYV4bVKYa8Z1RZzjw9KgkwIMtE2SMBtE2BuRK4qWhElLjnGqblcV7CCHzs
         qOLA==
X-Forwarded-Encrypted: i=1; AJvYcCXf2mf2kslJGpq1NNoogCiQbmOJcvXn1WpNV+QvzZflfD8cn6vtUcObKliXE/t0mC1Kf3d+UNNu/2zR8g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8uQkWUQeNqcu1hTa2Hqv8ZVccs0WBuS7NAZvoB4nNWAvx96Rr
	jWO++ossvCONr/su0GPGBDu7/TcBp1SclEOA7iBPsT8sN4Usrg/fuJMpWy7BNK1nnG5TWOGX6d4
	gfUc72hReq2vYD3nO3on/WHeQf8C08qWivLAP+1gKPg==
X-Gm-Gg: ASbGncuvYLgGcmjpYCF3fbo1OssLoOg6hohZecnqxrZpwtPWTm9G4mlLrwiqL18iRD9
	12jfSWfg2vvp//1CDv+6D5d+eU7Gh5wrn7FyPNYwKuhwr0xaARuesRRLXk8oewH/yc84aLMck4i
	S9LTC3k116OVA5ObJ1BvG/tMW1ZOG9tKKaZcdy20jghyopIDlzhy/wbVBPLAcQH8DUkRAas0Zsr
	k/jHDPlMTBpf5o12+4AOg6FPqN0dhcgv52Hrqc77lfRrXhHLvArj82dfLxxOaiZ/bh3Tl3W
X-Google-Smtp-Source: AGHT+IH3teezYiglKMW0l9sCwPDXKzHK/uYMVzLl99zBL+8tY4BEmXzPQzc7f6ucWRYnVm2fOg07KrRcgASdUHrgci4=
X-Received: by 2002:a05:6820:f030:b0:659:9a49:8f73 with SMTP id
 006d021491bc7-6599a973da4mr2018657eaf.56.1765084463840; Sat, 06 Dec 2025
 21:14:23 -0800 (PST)
MIME-Version: 1.0
References: <20251205232655.445294-1-seanjc@google.com>
In-Reply-To: <20251205232655.445294-1-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 Dec 2025 10:44:13 +0530
X-Gm-Features: AQt7F2qP99gde5P8lRQoinF2DOSDMpaUpigWBx6hvnDvXPL66vGpk9e2egXMZ2I
Message-ID: <CAAhSdy1cPnxjntaR=cwZqG+oVgFpZKM0rKYAEdkHUCToMvN0Ag@mail.gmail.com>
Subject: Re: [PATCH] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_211425_857829_F0DA58FD 
X-CRM114-Status: UNSURE (   6.85  )
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

T24gU2F0LCBEZWMgNiwgMjAyNSBhdCA0OjU34oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gUmVtb3ZlIEtWTSdzIGludGVybmFsIHBzZXVkby1v
dmVybGF5IG9mIGt2bV9zdGF0c19kZXNjLCB3aGljaCBzdWJ0bHkKPiBhbGlhc2VzIHRoZSBmbGV4
aWJsZSBuYW1lW10gaW4gdGhlIHVBUEkgZGVmaW5pdGlvbiB3aXRoIGEgZml4ZWQtc2l6ZSBhcnJh
eQo+IG9mIHRoZSBzYW1lIG5hbWUuICBUaGUgdW51c3VhbCBlbWJlZGRlZCBzdHJ1Y3R1cmUgcmVz
dWx0cyBpbiBjb21waWxlcgo+IHdhcm5pbmdzIGR1ZSB0byAtV2ZsZXgtYXJyYXktbWVtYmVyLW5v
dC1hdC1lbmQsIGFuZCBhbHNvIG5lY2Vzc2l0YXRlcyBhbgo+IGV4dHJhIGxldmVsIG9mIGRlcmVm
ZXJlbmNpbmcgaW4gS1ZNLiAgVG8gYXZvaWQgdGhlICJvdmVybGF5IiwgZGVmaW5lIHRoZQo+IHVB
UEkgc3RydWN0dXJlIHRvIGhhdmUgYSBmaXhlZC1zaXplIG5hbWUgd2hlbiBidWlsZGluZyBmb3Ig
dGhlIGtlcm5lbC4KPgo+IE9wcG9ydHVuaXN0aWNhbGx5IGNsZWFuIHVwIHRoZSBpbmRlbnRhdGlv
biBmb3IgdGhlIHN0YXRzIG1hY3JvcywgYW5kCj4gcmVwbGFjZSBzcGFjZXMgd2l0aCB0YWJzLgo+
Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4KPiBSZXBvcnRlZC1ieTogR3VzdGF2
byBBLiBSLiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgo+IENsb3NlczogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsL2FQZk5LUnBMZmhtaFlxZlBAa3NwcAo+IFNpZ25lZC1vZmYtYnk6
IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgoKRm9yIEtWTSBSSVNDLVY6
CkFja2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhhbmtzLApBbnVw
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
