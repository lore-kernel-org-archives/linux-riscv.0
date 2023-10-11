Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DF8CD98C7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 06:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLPFxwlfw/3kILn4Ec7pFVDzN9ez1BAVPeJqrckWmA4=; b=b6mbUhkgUHyGVK
	o1VUL40B+6vD4Q1jhkK0J0n9aQWjiSQKFKD/LcjnNBOAHBpsk48PBPoAkTDv8PTgIfXQKDO0T9q2S
	JQGBjI7QMT1fxgMmGZ0BWDqk7588vGDr5nsaWOfTOdks64cuwrKNn3YnHogLlu+H++CTaOFyDxETx
	liCeuqu5QP5JVa+x+35BjV9AFOQKI6RgeBkmEJArUNHg/u5oNTdoofXLn+iSbKHeJPWPhTn+/Flib
	Nh6yZUYCwCC2/DY9Ph0AGhZHslbbEPy5nvG13E3JrJ6fKBA/cC2m0tXHi5k9ya/YSzBQo5hp+3rVp
	/xLrdl6qvHs6bzGoCgpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqSZB-00ExSM-1z;
	Wed, 11 Oct 2023 06:19:33 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqSZ5-00ExPz-2s
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 06:19:31 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-69af8a42066so3969121b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 23:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697005164; x=1697609964; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcqMB30naFRgYdHZVjh4rWtjXZPaceEDVeZe+D6ZGQM=;
        b=PulPJLEEq8uPKaMAU72QhiBFJ6HtExFmpzcDIoC8q186Bd9jvWG80IRGpC/kAzWL1T
         fje+DgB0Yws08fp/FrJ7CeKxL5bbg8/nBU0sFHhajPfqw3d5ZOJJxhPK1XUzlW20ABgm
         tfr+6l/nhXmRMUlLlt2cDHxz96j3nWvmmJEW7HL1EhvaxGk+TsuOU3jnnMk21Izih1lz
         x+8E5waQhWru7PZys//sCLB3LSlQAw52Niet41vkF3Z1je9ty5IDDzEcdDjvmsKO32BD
         1LhCA5vQvyQe5XWevOukrlwEEs6Y6v3FasMTPaf3G8rkQYf3Yi+9Ghr+lQvAk59CePT+
         zEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697005164; x=1697609964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcqMB30naFRgYdHZVjh4rWtjXZPaceEDVeZe+D6ZGQM=;
        b=OXQTCiw3RsC82QP9nIK7EMAbP+CRCX7uGGE+OHw44roQbC69LO4XBxduN2lB/w1HOg
         WVS0xLq7uLBgjb/jUz0tixitQv88vRBBzOb+QVaJ293Klfokhlb7zMoELor9Aif1gM18
         eton3bbRnvVZyDhNGlS2PdzqIDFBfA2xX/RcH9T3ufbTuQgl452jPOYArWNJNZ6rCcNM
         r9R39UqbD9ZTCILH76S/ceZ5MMY8kuT9vlPYt53NTxUZeKNPJvo81/MR40HilrfEUvam
         2S5uI2rsFPUJKKVP9DT5ox7fKw6UQu5Ue0OKjCBFUVmg1d7yy2OGwip0mSNmPz+1g1AC
         XwkQ==
X-Gm-Message-State: AOJu0YziD7obLyu/apIEau3UX7ngcWMUhxMCiJi+SM7aT5KzAb6A3XVU
	3BY/UgdrUrA9h2zsv4zEI5kJa2ISjlcI32Ny58ktoQ==
X-Google-Smtp-Source: AGHT+IH0dVQdsDAFTukx58Mm4npJdNbm0bLcgPLvVKj0AVOxI4yYVZT6FxUGUblbjBF7BjO/DvhKeANQ/axsKvXGtw8=
X-Received: by 2002:a05:6a20:4305:b0:15e:2d9f:cae0 with SMTP id
 h5-20020a056a20430500b0015e2d9fcae0mr20933619pzk.10.1697005164547; Tue, 10
 Oct 2023 23:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-3-apatel@ventanamicro.com> <2023101013-overfeed-online-7f69@gregkh>
In-Reply-To: <2023101013-overfeed-online-7f69@gregkh>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 11:49:14 +0530
Message-ID: <CAK9=C2WbW_WvoU59Ba9VrKf5GbbXmMOhB2jsiAp0a=SJYh3d7w@mail.gmail.com>
Subject: Re: [PATCH 2/6] RISC-V: KVM: Change the SBI specification version to v2.0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_231927_928511_061492FF 
X-CRM114-Status: GOOD (  17.81  )
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

T24gVHVlLCBPY3QgMTAsIDIwMjMgYXQgMTA6NDPigK9QTSBHcmVnIEtyb2FoLUhhcnRtYW4KPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgT2N0IDEwLCAyMDIz
IGF0IDEwOjM0OjU5UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBXZSB3aWxsIGJlIGlt
cGxlbWVudGluZyBTQkkgREJDTiBleHRlbnNpb24gZm9yIEtWTSBSSVNDLVYgc28gbGV0Cj4gPiB1
cyBjaGFuZ2UgdGhlIEtWTSBSSVNDLVYgU0JJIHNwZWNpZmljYXRpb24gdmVyc2lvbiB0byB2Mi4w
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8u
Y29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCB8
IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmku
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiA+IGluZGV4IGNkY2Yw
ZmYwN2JlNy4uOGQ2ZDRkY2U4YTVlIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1fdmNwdV9zYmkuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
dmNwdV9zYmkuaAo+ID4gQEAgLTExLDcgKzExLDcgQEAKPiA+Cj4gPiAgI2RlZmluZSBLVk1fU0JJ
X0lNUElEIDMKPiA+Cj4gPiAtI2RlZmluZSBLVk1fU0JJX1ZFUlNJT05fTUFKT1IgMQo+ID4gKyNk
ZWZpbmUgS1ZNX1NCSV9WRVJTSU9OX01BSk9SIDIKPgo+IFdoYXQgZG9lcyB0aGlzIG51bWJlciBt
ZWFuPyAgV2hvIGNoZWNrcyBpdD8gIFdoeSBkbyB5b3UgaGF2ZSB0byBrZWVwCj4gaW5jcmVtZW50
aW5nIGl0PwoKVGhpcyBudW1iZXIgaXMgdGhlIFNCSSBzcGVjaWZpY2F0aW9uIHZlcnNpb24gaW1w
bGVtZW50ZWQgYnkgS1ZNIFJJU0MtVgpmb3IgdGhlIEd1ZXN0IGtlcm5lbC4KClRoZSBvcmlnaW5h
bCBzYmlfY29uc29sZV9wdXRjaGFyKCkgYW5kIHNiaV9jb25zb2xlX2dldGNoYXIoKSBhcmUgbGVn
YWN5CmZ1bmN0aW9ucyAoYWthIFNCSSB2MC4xKSB3aGljaCB3ZXJlIGludHJvZHVjZWQgYSBmZXcg
eWVhcnMgYmFjayBhbG9uZwp3aXRoIHRoZSBMaW51eCBSSVNDLVYgcG9ydC4KClRoZSBsYXRlc3Qg
U0JJIHYyLjAgc3BlY2lmaWNhdGlvbiAod2hpY2ggaXMgbm93IGZyb3plbikgaW50cm9kdWNlcyBh
IG5ldwpTQkkgZGVidWcgY29uc29sZSBleHRlbnNpb24gd2hpY2ggcmVwbGFjZXMgbGVnYWN5IHNi
aV9jb25zb2xlX3B1dGNoYXIoKQphbmQgc2JpX2NvbnNvbGVfZ2V0Y2hhcigpIGZ1bmN0aW9ucyB3
aXRoIGJldHRlciBhbHRlcm5hdGl2ZXMuCihSZWZlciwgaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2
LW5vbi1pc2EvcmlzY3Ytc2JpLWRvYy9yZWxlYXNlcy9kb3dubG9hZC9jb21taXQtZmU0NTYyNTMy
YTljYzU3ZTU3NDNiNjQ2Njk0NmM1ZTVjOThjNzNjYS9yaXNjdi1zYmkucGRmKQoKVGhpcyBzZXJp
ZXMgYWRkcyBTQkkgZGVidWcgY29uc29sZSBpbXBsZW1lbnRhdGlvbiBpbiBLVk0gUklTQy1WCnNv
IHRoZSBTQkkgc3BlY2lmaWNhdGlvbiB2ZXJzaW9uIGFkdmVydGlzZWQgYnkgS1ZNIFJJU0MtViBt
dXN0IGFsc28gYmUKdXBncmFkZWQgdG8gdjIuMC4KClJlZ2FyZGluZyB3aG8gY2hlY2tzIGl0cywg
dGhlIFNCSSBjbGllbnQgZHJpdmVycyBpbiB0aGUgTGludXgga2VybmVsCndpbGwgY2hlY2sgU0JJ
IHNwZWNpZmljYXRpb24gdmVyc2lvbiBpbXBsZW1lbnRlZCBieSBoaWdoZXIgcHJpdmlsZWdlCm1v
ZGUgKE0tbW9kZSBmaXJtd2FyZSBvciBIUy1tb2RlIGh5cGVydmlzb3IpIGJlZm9yZSBwcm9iaW5n
CnRoZSBTQkkgZXh0ZW5zaW9uLiBGb3IgZXhhbXBsZSwgdGhlIEhWQyBTQkkgZHJpdmVyIChQQVRD
SDUpCndpbGwgZW5zdXJlIFNCSSBzcGVjIHZlcnNpb24gdG8gYmUgYXQgbGVhc3QgdjIuMCBiZWZv
cmUgcHJvYmluZwpTQkkgZGVidWcgY29uc29sZSBleHRlbnNpb24uCgo+Cj4gdGhhbmtzLAo+Cj4g
Z3JlZyBrLWgKClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
