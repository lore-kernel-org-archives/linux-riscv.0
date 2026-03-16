Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4270FF53D69
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 15:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBEZIaSFjXP8TJrG95X7QZ+PQhzaBxanzPI6YYCb4xY=; b=oYH21Qp6uLvj+E
	QiLzXVUYD/jkzVYu/5nNiCYburVNDoJpFRE3FPW4MHXfgc8FCt0t/+9yUFQfSyoz6GgAkCmaGUXap
	LSFmZduBCDybo8/LCNSNhEJmkHCy2W2XQnD9YhWHb5726FYsNwqPRTGnb1B89xlEuWM2scF8uE09/
	NGaKn7JslmaCicPUb7f82/pSf8gG6vAqMBSBSDu+QsxD8Cm8IWEkfq7+OvcE8fpIfSEvPfo+cBy+t
	6ePTOHvBLzJxAgoqy5WdHM+5g7F3fvfY79G6vTmch8Jxm03U2949vpi5fK0wC5EudZ70H3cfcIC8j
	cPcLKJZLaNMfv+SPK1cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29mC-00000004K8a-3E2H;
	Mon, 16 Mar 2026 15:22:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29mB-00000004K89-0O0i
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Mar 2026 15:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Aela138P2UA6HOSTxLhqrmtMIrzMEnb2IdbvAjDcPFg=; b=WSDgAjBh8PGTNv+Dh8uNdUY1Iv
	cwnoXBkXuEm6accM4DwntYz4n1D9QJ2PDZLG8/q45K4H+1bs2N86HbnVtxFQEW+4NKIolGX1UyBiD
	YzOQjM6pdgmFWC1J6Uv+804E5N68gnQ9pUdqyewA6TDgjuGqlVKHUSoGEtSygSweXvGwBSsUA6EFs
	LbNSZkH3C6lXYUUfgarbUTbwQCU8Cgk6/lNPTdT5j1FfAaJ+s/gA3Fe1+2Ba8fEcBXcOvAB/FFdpO
	utfouScyegXSHRU/ytlet8jJogTvOSdkK/PA0bB2e+bwcwZdXU574vXcpxNAW0Sx+Hdv5zyg3ri8L
	vqx1WMEw==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29m7-00000007485-39eY
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 15:22:37 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b97b30fa5e5so223203266b.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 08:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773674554; cv=none;
        d=google.com; s=arc-20240605;
        b=ViG1KFtrWGCFqeTthrk2I5hL8Ylrhx3sp+9uLAsiw6GiUeYiWacCIgR8+peb1imze+
         oO2zpV8p00bx88pJQHPGMv+63CYK47ugxYkeZ6NAmiFAC8W0wtkRPOgLeYmTXPfnNaHX
         q09YD4/SXaMd9jdUWIFewknQ9Ax9fxqTaodlUJUvqiY40MTqgKXypBYD8YdDbLHfNWbl
         mWmjn5APjwjd3KAxlaJjOuG+uzUmCyhBnwvzm4xSRjwVMeOH+nxJkIakfy4fEDuo0q3T
         suWilk+XnQtekUCs0agt4fvWmb2aZyAGjRpwuznLNeHphmjpf6h87HCdgan+oXyRRcTz
         2Cyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aela138P2UA6HOSTxLhqrmtMIrzMEnb2IdbvAjDcPFg=;
        fh=88NQZNjWlplGPQ98Ne1wxDxRik04JSOCKCDcX58nYAI=;
        b=eVZjlRlHFpf++6TwsVpwm0q8wB9imXCTfHyYXgrgNx7vcRRN74fS+UHYv1P0Lqf84r
         uowvE77IknhFhdvUPdH3ToUfqQR4b+rozsvFpMMwQhT7A6hFVdim7zLnXAExno1EQETI
         Y1DivLWluK1GnFna1eW+tE7USzvqP9vYVDHv4YnPwOBFdJDYosjUfYLXnnimn5WDECxj
         qQrBvgrfHO2sdcht2hz1IPt3t8hU2UQTA4JPcTgd+jt/azIUfndMByCOp1zdiwuyoZND
         eOJkYxtQ4vkbXhi86vf0H9pkiwtyTJ90vUNRD39wGUGzf83qfN81mmHu17zxggb9bytF
         hBVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773674554; x=1774279354; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aela138P2UA6HOSTxLhqrmtMIrzMEnb2IdbvAjDcPFg=;
        b=XiJUYhvX2rGGc9HuEe8FMEWRk9JyoI5O6QHGesUVI+X7cwx4WzDfQH7yo+l8EXxaIN
         GLrAz2Uh+bprewpIcYiudfUoblROIZkjBpkGfPLJkLn630/TUcAv3SAHU76tzfslgZek
         MhLlzYcVkgJq72sDEQAe/HXazK0o9L+4VzFfgsP5LdmyGqmg9jBrT/waSHoXbZ8pmd/i
         QAaaA6YVaOgHMqyLCmcvoZLfIIs5fUorPXyjKpaEXiL7Djl0XdCUvpelFqM/fyRiFmZY
         sGx60JuW6MZkJro7pI/yH2Hb6HwbgtB2Yhc4Ol3mfW1aO9E+VcjpSbxcZXOgAbJEYt1c
         SLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674554; x=1774279354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aela138P2UA6HOSTxLhqrmtMIrzMEnb2IdbvAjDcPFg=;
        b=S+4r1snC9HLjxP91N9QUYMJprRV7z1aoknRvvfOJ5aRh1CELGLeiXYi4YWZBndnQ+k
         xFLE6LhR4Aac7/7C+evlsta3LaGvi7eEcpcE9hRhkF9n+MjdwJv8APrRM6IWvgkUqtiD
         /m02syNSggqwLiHcvbbMYXB2BwOYA9DYVk54xFGK6eQW63kpJyTRvujY2P5SF1IhZIA/
         aILIUw5z/k6sUeUihvNRUazHB7HniaeWS+uomRV35eVUPTZ/g+wqSN8kuxIsoJJc/Gw/
         UUbHmakPJa1XPtaG2pwIoXCPJ9pdRbFzAPPaJB78h4wqoO9Vke1uz40trojKPCZhUfZn
         gUjA==
X-Forwarded-Encrypted: i=1; AJvYcCXl5hrJb7i1/TH6EtMDw4drWnjSkAtTAsP+IHRQ7C6uVWNYvvw8sqsMUNRe4vIQ2i712Lp7MHNft3bsgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYGQpDp0bY2se7WFCUCvgYhczbBNu4fAPPtxGJzvgG0HJK58to
	RuSbys/bMVxgyaVXh6XyrPU4k5+Y7LejLCeJMZlk6OddmdR6/2PxaqyN0rUcZ6UqAOAwf21d1jc
	uH6MOxo5Dsns3cH255dZJVNW8Imk4y5VkHKG0
X-Gm-Gg: ATEYQzwEBsq3fK6eKzQAZKuqI+j/VuN51S0Ya8dr4B0dWwzH5jJu3zXAXfOGchPnC17
	DnesPRDyiwnDpZeR1mrFCss5gX8toocNqTaQw5F+hDB7gGVvbz4nRCTJow95Z0rVsaa8JjsR2Dv
	GnCNb0jnunU2b8HCWr7BN5HfybGjzboydS5scmnbdduNFa+4GwyqxRy8OUkl6IEAaBwT2noD0Ik
	wGRUtS39GC61TtAZDO5aIOQDkdbUqHo6fhLkhKHNeWf2IcLoDBm+qpghrN3rid7dc3aRiDN56NC
	+wgecXQ=
X-Received: by 2002:a17:907:94d4:b0:b97:464:9553 with SMTP id
 a640c23a62f3a-b97650d8e72mr936440266b.17.1773674553492; Mon, 16 Mar 2026
 08:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260316151612.13305-1-osama.abdelkader@gmail.com>
In-Reply-To: <20260316151612.13305-1-osama.abdelkader@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Mon, 16 Mar 2026 10:22:21 -0500
X-Gm-Features: AaiRm510yNIk-2AFg7p9AlWX6hUz5FX6ePJRq44wcScAeWIThYKeskTelXRSBP4
Message-ID: <CAFTtA3MXQdQodaurFOz0PneuHEbY2j+yfQyWgqT9gWMBS1cZjQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: kvm: fix vector context allocation leak
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vincent Chen <vincent.chen@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_152235_903342_E5CD31AD 
X-CRM114-Status: GOOD (  16.67  )
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

SGkgT3NhbWEsCgpUaGFua3MgZm9yIHNwb3R0aW5nIHRoaXMsCgpPbiBNb24sIE1hciAxNiwgMjAy
NiBhdCAxMDoxNuKAr0FNIE9zYW1hIEFiZGVsa2FkZXIKPG9zYW1hLmFiZGVsa2FkZXJAZ21haWwu
Y29tPiB3cm90ZToKPgo+IFdoZW4gdGhlIHNlY29uZCBremFsbG9jIChob3N0X2NvbnRleHQudmVj
dG9yLmRhdGFwKSBmYWlscyBpbgo+IGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0
LCB0aGUgZmlyc3QgYWxsb2NhdGlvbgo+IChndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCkgaXMg
bGVha2VkLiBGcmVlIGl0IGJlZm9yZSByZXR1cm5pbmcuCj4KPiBGaXhlczogMGY0YjgyNTc5NzE2
ICgicmlzY3Y6IEtWTTogQWRkIHZlY3RvciBsYXp5IHNhdmUvcmVzdG9yZSBzdXBwb3J0IikKPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IE9zYW1hIEFiZGVsa2Fk
ZXIgPG9zYW1hLmFiZGVsa2FkZXJAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8
YW5keWJuYWNAZ21haWwuY29tPgoKPiAtLS0KPiB2MjoKPiAtIEFkZCBGaXhlczogdGFnCj4gLSBB
ZGQgQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNw
dV92ZWN0b3IuYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9y
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jCj4gaW5kZXggMDVmM2NjMmQ4ZTMxLi41
YjZhZDgyZDQ3YmUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYwo+
ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMKPiBAQCAtODAsOCArODAsMTEgQEAg
aW50IGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4KPiAgICAgICAgIHZjcHUt
PmFyY2guaG9zdF9jb250ZXh0LnZlY3Rvci5kYXRhcCA9IGt6YWxsb2MocmlzY3Zfdl92c2l6ZSwg
R0ZQX0tFUk5FTCk7Cj4gLSAgICAgICBpZiAoIXZjcHUtPmFyY2guaG9zdF9jb250ZXh0LnZlY3Rv
ci5kYXRhcCkKPiArICAgICAgIGlmICghdmNwdS0+YXJjaC5ob3N0X2NvbnRleHQudmVjdG9yLmRh
dGFwKSB7Cj4gKyAgICAgICAgICAgICAgIGtmcmVlKHZjcHUtPmFyY2guZ3Vlc3RfY29udGV4dC52
ZWN0b3IuZGF0YXApOwo+ICsgICAgICAgICAgICAgICB2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQu
dmVjdG9yLmRhdGFwID0gTlVMTDsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4g
KyAgICAgICB9Cj4KPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4gLS0KPiAyLjQzLjAKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
