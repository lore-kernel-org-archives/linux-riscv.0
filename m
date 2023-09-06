Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE1DEB8FA5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 06:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8oOJ7mcx9C6RCwGJOXw1SD7XvWAiyNCkYKPzlIoxjs=; b=qINm+40MyxClUT
	NQiaoLNgQmz36Bc766vd0NxWc+QnWeRRTZlOjuO8WVgfZ4xf1PK9V5zbahOBfULTNJR2iti3Ickth
	eDiptP0VmaEhO5DxtK+LJWU9EaGh6IhHZzys/4VGsMdpi1qTIuTNaqY25BGz3XaLVCxX/LVFxDU32
	/Cd63Yl37E4sVFH36Z08tlEPNO6fKp4x/URwz94IaFXEDmTbPQK1I7sG2PWOIlbyKNx0q0Ggdfo8u
	nplCF55pV7sj30DqYZwR4SPCVyTTb0+p8YxmaHeOJS7gvQNQYcAQu3Z05OCaG9GYa/tEaKUXDv8aU
	orSNMs7DLP23NToqAYlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmTQ-007Pxu-2X;
	Wed, 06 Sep 2023 06:57:12 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmTN-007PwA-2v;
	Wed, 06 Sep 2023 06:57:11 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2bcfdadd149so56496491fa.0;
        Tue, 05 Sep 2023 23:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693983426; x=1694588226; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlJV3YrVhcDgjJFnq8JrFHKjW/deWsGxcZLe+DpQPlY=;
        b=fcIVsqEqIqOOYGlFAPSRMposUD0/QPxb9zCivORlAUF8KApu27WG5le6r6M4kkRiwo
         90kRFgL+bLyWKuVRtI4RWC0Xy6L2bpn6U9JS7X960q+1a0lrmjSzAbCb9s9ufCTs65fX
         Qg5+mx5cdqUJoSkO/CcjkPYD+Bgf73DH4pkwhoej9chstrYBWQhby79jO8wtU4mx1Aww
         P80BQ/P+SCEbzMFmLXJMGzjaFcUhg1FKe+ei/lyDA+oSO0lZdyb9xzFjgSf3wbTbNusR
         +rKq0BxXnPPmVjp0GptUolctKgErIzxl/7FrRttinFJ8BvCrvjBvZ9bQtHFnBcB3XsMS
         3RiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693983426; x=1694588226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlJV3YrVhcDgjJFnq8JrFHKjW/deWsGxcZLe+DpQPlY=;
        b=I/AHmpWKWonSqgmk7TM3jZDpm3BluQrUH6PFegSIR/Wrp0QF4TEB47watMfZ7e+KGy
         xJZRJoyoXSzjikedLz2Ci6LdI6p4oohuMUre9NTOoYMLibtayKK3x0xYXq66HhIKyLgo
         2nNmmdq3pCGEkPB2Nt/vJ2ZMhU1094Mxm81Ler+9GGmLQTVZZjc2h2Hv+UlIc56Igw8j
         4Bk0ItP2EI1A0u7nhcCN7r1Nughk2sAOgYEBw1BfwQMVOc4mGACBNNzLtKFXrrqN4tqK
         f4sIRmWx8clKcXX43cxYadF2STMFDUOfQXI1tgQMFKwF0EAnyZRA/5rqNsC1VwghhQ7K
         t2VQ==
X-Gm-Message-State: AOJu0YxgM81j/2fgBktKci4ppCIfrBteUG3X/ol7IfXx2L1GV1gYv6W2
	o5t5QCVQFbYCz+UE42Gk+K36M7P5iNtB83icYc4=
X-Google-Smtp-Source: AGHT+IE2wohgSgl/gZUM1LzzLcCwq5kIveaGhSl1JWbsEVX+uMGhnRmRqbVkQ36vSc6Xb8HN2ND74xdMHJJ7AowqLIU=
X-Received: by 2002:a2e:b051:0:b0:2bc:e1a3:fbaa with SMTP id
 d17-20020a2eb051000000b002bce1a3fbaamr1470233ljl.22.1693983425421; Tue, 05
 Sep 2023 23:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693659382.git.haibo1.xu@intel.com> <ee4e518cbed9ff4210b74a22c5af21c410fab85d.1693659382.git.haibo1.xu@intel.com>
 <20230904-d35320b23119ee97737e8a74@orel>
In-Reply-To: <20230904-d35320b23119ee97737e8a74@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 6 Sep 2023 14:56:54 +0800
Message-ID: <CAJve8om7Rmp-gbyT7DfHQVPrpkrgA95pbLVrTh=-S2HegkuXpQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] KVM: riscv: selftests: Switch to use macro from csr.h
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, wchen <waylingii@gmail.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Sean Christopherson <seanjc@google.com>, 
	Ricardo Koller <ricarkol@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Aaron Lewis <aaronlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Jim Mattson <jmattson@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Peter Gonda <pgonda@google.com>, Like Xu <likexu@tencent.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_235709_944664_060B0CF4 
X-CRM114-Status: GOOD (  15.49  )
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

T24gTW9uLCBTZXAgNCwgMjAyMyBhdCA5OjMx4oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIFNlcCAwMiwgMjAyMyBhdCAwODo1OToy
NlBNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIFh1IDxo
YWlibzEueHVAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggfCA1ICstLS0tCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaCBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oCj4gPiBp
bmRleCA1YjYyYTNkMmFhOWIuLjY4MTBjODg3ZmFkYyAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oCj4gPiArKysgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+ID4g
QEAgLTgsNiArOCw3IEBACj4gPiAgI2RlZmluZSBTRUxGVEVTVF9LVk1fUFJPQ0VTU09SX0gKPiA+
Cj4gPiAgI2luY2x1ZGUgImt2bV91dGlsLmgiCj4gPiArI2luY2x1ZGUgPGFzbS9jc3IuaD4KPiA+
ICAjaW5jbHVkZSA8bGludXgvc3RyaW5naWZ5Lmg+Cj4gPgo+ID4gIHN0YXRpYyBpbmxpbmUgdWlu
dDY0X3QgX19rdm1fcmVnX2lkKHVpbnQ2NF90IHR5cGUsIHVpbnQ2NF90IGlkeCwKPiA+IEBAIC05
NSwxMiArOTYsOCBAQCBzdGF0aWMgaW5saW5lIHVpbnQ2NF90IF9fa3ZtX3JlZ19pZCh1aW50NjRf
dCB0eXBlLCB1aW50NjRfdCBpZHgsCj4gPiAgI2RlZmluZSBQR1RCTF9QQUdFX1NJWkUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBQR1RCTF9MMF9CTE9DS19TSVpFCj4gPiAgI2RlZmluZSBQ
R1RCTF9QQUdFX1NJWkVfU0hJRlQgICAgICAgICAgICAgICAgICAgICAgICBQR1RCTF9MMF9CTE9D
S19TSElGVAo+ID4KPiA+IC0jZGVmaW5lIFNBVFBfUFBOICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBfQUMoMHgwMDAwMEZGRkZGRkZGRkZGLCBVTCkKPiA+ICAjZGVmaW5lIFNBVFBfTU9ERV8z
OSAgICAgICAgICAgICAgICAgICAgICAgICBfQUMoMHg4MDAwMDAwMDAwMDAwMDAwLCBVTCkKPiA+
ICAjZGVmaW5lIFNBVFBfTU9ERV80OCAgICAgICAgICAgICAgICAgICAgICAgICBfQUMoMHg5MDAw
MDAwMDAwMDAwMDAwLCBVTCkKPgo+IFNBVFBfTU9ERV8zOS80OCBhcmUgYWxzbyBpbiBjc3IuaAo+
CgpHb29kIGNhdGNoISBUaGVzZSAyIHNob3VsZCBhbHNvIGJlIHJlbW92ZWQuIFdpbGwgZml4IGl0
IGluIHRoZSBuZXh0IHZlcnNpb24uCgo+ID4gLSNkZWZpbmUgU0FUUF9BU0lEX0JJVFMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMTYKPiA+IC0jZGVmaW5lIFNBVFBfQVNJRF9TSElGVCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDQ0Cj4gPiAtI2RlZmluZSBTQVRQX0FTSURfTUFT
SyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfQUMoMHhGRkZGLCBVTCkKPiA+Cj4gPiAg
I2RlZmluZSBTQklfRVhUX0VYUEVSSU1FTlRBTF9TVEFSVCAgICAgICAgICAgMHgwODAwMDAwMAo+
ID4gICNkZWZpbmUgU0JJX0VYVF9FWFBFUklNRU5UQUxfRU5EICAgICAgICAgICAgIDB4MDhGRkZG
RkYKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4KPiBUaGFua3MsCj4gZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
