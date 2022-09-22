Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75706C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 13:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnMhONLNCJ3MXPNEW9PHNY2UbfHbl29s5aM7VKnJoIg=; b=jliUmsiZfDHdvv
	VT0totbEfojiNcWdHWI4xAhF6nYq5oT/BmteEgRH1FZjBb01zWHY3VLRRICgQYPXBnmGWpYqIVRBd
	7JWnukNX0sXu3qFPsefPZgmaCq87geOBsxztdF/lwRL1tbSXpvoJCu6258+NH1vz9CdhqVb5etP7A
	4kGpU+7aKMkH5QSKC/obbKxPwX+YVkyaWlgYJCS4jKFRYJJRPa7CFXcNgU61YUjyDDnv4PlSKMAIZ
	2CDLM+joNnNY/FTG5caY3h48q8ohUVbANaCKK9lDFYoyql56IBz+oRYCMERi+Gxz2TWlrq2LEeVzG
	1CDDBq47Tkj04IvnjdxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obM69-00Fceq-9y; Thu, 22 Sep 2022 13:18:37 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obM5q-00FcRX-Av; Thu, 22 Sep 2022 13:18:20 +0000
Received: by mail-vk1-f175.google.com with SMTP id b81so4919991vkf.1;
        Thu, 22 Sep 2022 06:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FmC3Wnd/dYfP2uqwVfxKzutzBThKJES4nPc9HEeo7QQ=;
        b=wgq5+9xl4yJ0vROad+ebCLUOUcGDbpjX9OmmSnKo/EKN0mfmchV0tqQ9R2zb9Cfb/S
         TXAQT9YlCtwA1tt4Vk1GVT30We1ya1HffvIjNzY5BROw0xL+7GiNtdRXT5TTEg8SNvbh
         o+7ddI6/Ocz4SCI/c7w1BJqCEKyU/9dzAy2c8Uw6iRrE6r0BD5DibksbR/6OHxi0wsgt
         JPCyzySI0m+cnuAoLsQKtuHdW+UoboQ+dMzf4/0IxAYq8kzYODu799oNy0p3C32x5Tf7
         KsJesZdtUh/dvnbiyO17LiFtxoF6YphkiJYfwRey4M0bW69C4LiUi9iKFhzQwXRIBmyK
         XK1A==
X-Gm-Message-State: ACrzQf32tSo/NrdqyjR8iBaONNl8nkcFVUgKUuyVh2maPUTkmWmWzpMK
	zSEW6dw4WRUwOJTrUAlzm7a06ya97h8NRX+9rjI=
X-Google-Smtp-Source: AMsMyM5hAS5sGeCyGhDs3JB8ybhSoe0SBFugJqR9UWsYlOLvGt3tSKkrbx2I2RYfB9/ZOUlHboLppHif1VOrjItnvws=
X-Received: by 2002:a05:6122:10dc:b0:3a3:4904:2941 with SMTP id
 l28-20020a05612210dc00b003a349042941mr1265866vko.24.1663852689165; Thu, 22
 Sep 2022 06:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com> <20220921003201.1441511-12-seanjc@google.com>
In-Reply-To: <20220921003201.1441511-12-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 22 Sep 2022 15:17:56 +0200
Message-ID: <CAAdtpL4yFdh3V0Be05OKxUFBTSgFs6oTy9U5FjSRGwOhi=tDMQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] KVM: mips, x86: do not rely on KVM_REQ_UNHALT
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm <kvm@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, kvmarm@lists.cs.columbia.edu, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	open list <linux-kernel@vger.kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_061818_411644_41925332 
X-CRM114-Status: GOOD (  12.47  )
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

T24gV2VkLCBTZXAgMjEsIDIwMjIgYXQgMjozNCBBTSBTZWFuIENocmlzdG9waGVyc29uIDxzZWFu
amNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUBy
ZWRoYXQuY29tPgo+Cj4gS1ZNX1JFUV9VTkhBTFQgaXMgYSB3ZWlyZCByZXF1ZXN0IHRoYXQgc2lt
cGx5IHJlcG9ydHMgdGhlIHZhbHVlIG9mCj4ga3ZtX2FyY2hfdmNwdV9ydW5uYWJsZSgpIG9uIGV4
aXQgZnJvbSBrdm1fdmNwdV9oYWx0KCkuICBPbmx5Cj4gTUlQUyBhbmQgeDg2IGFyZSBsb29raW5n
IGF0IGl0LCB0aGUgb3RoZXJzIGp1c3QgY2xlYXIgaXQuICBDaGVjawo+IHRoZSBzdGF0ZSBvZiB0
aGUgdkNQVSBkaXJlY3RseSBzbyB0aGF0IHRoZSByZXF1ZXN0IGlzIGhhbmRsZWQKPiBhcyBhIG5v
cCBvbiBhbGwgYXJjaGl0ZWN0dXJlcy4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVk
LCBleGNlcHQgZm9yIGNvcm5lciBjYXNlcyB3aGVyZSBhbgo+IGV2ZW50IGFycml2ZSBpbW1lZGlh
dGVseSBhZnRlciBhIHNpZ25hbCBiZWNvbWUgcGVuZGluZyBvciBhZnRlcgo+IGFub3RoZXIgc2lt
aWxhciBob3N0LXNpZGUgZXZlbnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQYW9sbyBCb256aW5pIDxw
Ym9uemluaUByZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24g
PHNlYW5qY0Bnb29nbGUuY29tPgo+IC0tLQo+ICBhcmNoL21pcHMva3ZtL2VtdWxhdGUuYyB8IDcg
KysrLS0tLQo+ICBhcmNoL3g4Ni9rdm0veDg2LmMgICAgICB8IDkgKysrKysrKystCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5
OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
