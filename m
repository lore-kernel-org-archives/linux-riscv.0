Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E2EEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 09:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNj04lyAHaOKfuX4jaAMhfYxV1VVuc8OCnHEJbuKZ+k=; b=2a4GdzQ/xf/3/f
	ErHxx6R1ba51X37TEwPkjjTFLtAnR4pGq7x/5Za7hjt+8fiqhV2FLDI0yH7E5fgBdu86IlwbtWG71
	SFvce8PjzCQ9DFGkTTvWnXpbsMG2vWy+6nC1I3QAXfQeYtxbbugS9KvM7QSMILJtqn52uTmp9UCnU
	ev/p3vGQZQe6hzWULskvhGXftOUn9sUdQc33BNbiSBLmHsOktZxIRiK0fapwo0P08X8LvcgS7+wKU
	11HrIT67SbFXBcshyqEV5zuCKey9Wc0v9nfOl7APi8pRT1bIRFh/jp+yFYGi/krLuZumx8ABZwq9y
	6+vB79W8URTU4YphZwag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAod-007wSu-2o;
	Mon, 19 Jun 2023 09:04:51 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAob-007wRx-0X
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 09:04:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-988f066f665so8688966b.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 02:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1687165485; x=1689757485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOMkMMAr2Gg0bJAi4+JqalAqrnOAduCDY6ClopKhu7o=;
        b=lxfJQE0xX3I5jYqy0UEhvatNi1bEe0LGgP/lmC+ZElBgNg8sCnadykEjHqFC/p8GUZ
         izgUIZptlaFMrc8RDR4jfovxA/95RIVzNUUjt0goz5x9tNml47o7KEgjlNGeuUIFlzzM
         Kczl256i4qumx9ZEC8E+fYH4DzRutLAjcl15Sq8Gz5IDXxWBaA3BulNihk3nNoOLSCN5
         Gyfz7P03rL+tiOSJ+8sWw0K8lYOqYyqu6fXCaeURDBfebaAGuMrGy4kMT+MSq12Khjoa
         +VpnP5757yuYBbTTMKYT2K5vTTNNmN/jtuIr4gh2rfewpbPm44EtvxoRipKYSQpHFGgQ
         R9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687165485; x=1689757485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOMkMMAr2Gg0bJAi4+JqalAqrnOAduCDY6ClopKhu7o=;
        b=CFMnTRs0LNB1tr/s4XaoFbY7wZkQGs3c2ScusYrvk/imJnoPhaKKhro5e2VpJ3Aetn
         3dspY6taBGqVJx5Bs0vfXC6IYtKiEvNup8aQePOM844pLsCUPL/xEt6Bahd/RTDyL7P5
         RRkW29Xk5MUpoB+mJxb8xC06w8UrDe7YdS8V0f4X52Y+5OR6ifsNjkATkdBOvHq8wiD4
         hjPSu3i/YhM0rrU34nf2b1b/nhHO0/xpaRQ6ZWDwvmUOR6nklFWeMwJoc4oo79xn47/O
         RFEJoNLQ5xzo298JMeBobtgudQUQ68K0iLkCsfK3B/BWFhNnDSh6pqRnGzomE3yxVj0i
         iHVg==
X-Gm-Message-State: AC+VfDxRR/mvWbJbe4SxppgkM300oYttDKpdKCdNXixPwpDXBukEVsKu
	xtApOrtShOF2h5+/GvDND70EGCHp7Q5B7B/ZaN709w==
X-Google-Smtp-Source: ACHHUZ768q3f6zOzDHZ7Hx9YSEKq+8wOdyRXvCMU8hq5SVfPwpgMrdOf2DcZ4MrsHubHFDfXQzUhn4Ddv1whxrE6xW0=
X-Received: by 2002:a17:907:a41e:b0:976:b93f:26db with SMTP id
 sg30-20020a170907a41e00b00976b93f26dbmr8200640ejc.53.1687165484807; Mon, 19
 Jun 2023 02:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230612111044.87775-1-apatel@ventanamicro.com>
In-Reply-To: <20230612111044.87775-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 19 Jun 2023 14:34:33 +0530
Message-ID: <CAAhSdy2H8fhb84Q7kn==6pdRod_CcZ1hWyr3niDBGKfr4e-mQg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Allow Svnapot extension for Guest/VM
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_020449_425797_1647B667 
X-CRM114-Status: GOOD (  15.27  )
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

T24gTW9uLCBKdW4gMTIsIDIwMjMgYXQgNDo0MeKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFdlIGV4dGVuZCB0aGUgS1ZNIElTQSBleHRlbnNpb24g
T05FX1JFRyBpbnRlcmZhY2UgdG8gYWxsb3cgS1ZNCj4gdXNlciBzcGFjZSB0byBkZXRlY3QgYW5k
IGVuYWJsZSBTdm5hcG90IGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0uCj4KPiBTaWduZWQtb2ZmLWJ5
OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5k
cmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KClF1ZXVlZCB0aGlzIHBhdGNoIGZv
ciBMaW51eC02LjUKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2t2bS5oIHwgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICB8
IDIgKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20va3ZtLmgKPiBpbmRleCA2MWQ3ZmVjYzQ4OTkuLmExY2ExODQwOGJiZCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiBAQCAtMTIyLDYgKzEyMiw3IEBAIGVudW0gS1ZN
X1JJU0NWX0lTQV9FWFRfSUQgewo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWklDQk9aLAo+
ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWkJCLAo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9F
WFRfU1NBSUEsCj4gKyAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9TVk5BUE9ULAo+ICAgICAgICAg
S1ZNX1JJU0NWX0lTQV9FWFRfTUFYLAo+ICB9Owo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IDJkYjYyYzZjMGQzZS4u
N2IzNTU5MDBmMjM1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC02MSw2ICs2MSw3IEBAIHN0YXRpYyBjb25zdCB1
bnNpZ25lZCBsb25nIGt2bV9pc2FfZXh0X2FycltdID0gewo+ICAgICAgICAgS1ZNX0lTQV9FWFRf
QVJSKFNTQUlBKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTU1RDKSwKPiAgICAgICAgIEtW
TV9JU0FfRVhUX0FSUihTVklOVkFMKSwKPiArICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVk5BUE9U
KSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVlBCTVQpLAo+ICAgICAgICAgS1ZNX0lTQV9F
WFRfQVJSKFpCQiksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWklISU5UUEFVU0UpLAo+IEBA
IC0xMDIsNiArMTAzLDcgQEAgc3RhdGljIGJvb2wga3ZtX3Jpc2N2X3ZjcHVfaXNhX2Rpc2FibGVf
YWxsb3dlZCh1bnNpZ25lZCBsb25nIGV4dCkKPiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9F
WFRfU1NBSUE6Cj4gICAgICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1NTVEM6Cj4gICAgICAg
ICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1NWSU5WQUw6Cj4gKyAgICAgICBjYXNlIEtWTV9SSVND
Vl9JU0FfRVhUX1NWTkFQT1Q6Cj4gICAgICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pJSElO
VFBBVVNFOgo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQkI6Cj4gICAgICAgICAg
ICAgICAgIHJldHVybiBmYWxzZTsKPiAtLQo+IDIuMzQuMQo+Cj4KPiAtLQo+IGt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKPiBrdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
