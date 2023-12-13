Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491A2C4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 06:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=goclwRc/u9ShSRbe4TkuecPkbtOnVVkAmCdEoWeAPes=; b=w4Sgn/91k0Is4J
	ah6Wq2K/P+lm3SHc4S0JVj1jWITbJ8kQ0G9jfKiF1FbN0IjsUXrn5Zau6cyziEy/SOrffyINI6iXQ
	Um3tsoVG9QBRwRhAh9q7kr4Elmnf33OHXS74QyJYOZuc6GxsC77/Xx7VGErcDmtwF95gP0nqTzHdY
	rOcUeB16m2a0BLhke/NFXd/A/557X6eFnswK1NATajkGiBudVbEMWaLTebUkgNyb8+a1pqyR5NNcy
	wcK57bbmiKejfRT+HdpplIcdtUkXulUuD3QnAVS9hBoku57WQ5BzuB+7bw8mcl1Y8V5VgQdwfrtnu
	cCkEezlzBGHs0+btbK7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDIY2-00DknG-0T;
	Wed, 13 Dec 2023 06:16:46 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDIXz-00DklB-0Y
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 06:16:44 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2cb21afa6c1so76773261fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 22:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702448202; x=1703053002; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71L6UE8bKw9xAm3N5o4/wivq75A3TGoxxbYsqvN4Hr0=;
        b=j+y1ysXgSLYObSGdlnFytsUAb9Q15JOmPupRuu37VcaSIdLDXHP2B0TwA6lEi35TA2
         ELiziWMQjvYuHQpOYMvL08y+AE9X7jmxt+UaCFlvny5nC9/U+pzpkZ/LtQEaxx/xncrK
         PNj4LEfoNSq/RxLKQVHCYcdFj/4Jvg8r01pO0HaflY43fnc1wWsGa1rjUuDG/fwMhnPL
         zvkrPg/8qH4vFNbtEq2nRmUQWenKeF+oJSkrU8km1skM0jUpa7ERmxr0qw8PdLatXHvQ
         YJvK7b7v2EQha944pJjKT50xdaus7dO6MxGJerC+hEw29gGB/CLrNRhu3xlzTNYX+gug
         vhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702448202; x=1703053002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71L6UE8bKw9xAm3N5o4/wivq75A3TGoxxbYsqvN4Hr0=;
        b=hgZVJNsf8OgihjY2zp8sxU6WkdurCUpbS/uYt1DCIiLNpmcLyzqJ+As8KGa+1MOtjB
         gNKMxAVVFn0nv0Z6HDcfJGTuptYl5YyNw6ka5kfGnQYdreIK2Mw/WPXPkjZGgMINohXb
         dM/ZbzBpmIvqIKItCJHjILOZCdSoDHRFyXWi0/0St4zyUUTQS88WUD99nvvddN714c8f
         TA9jtBtU9mYY/Rw3OGxN+GJLJNNmMGYZDzLbHyTRrXGVxjc9WxDHKvXiiSOQrAW7NaHD
         i58iVP12X2VxRsENkADVCMFkssc7/2KdlQbwrnIq55LkXhRWGDxqeYQesnoHrEVpcOrh
         2F1g==
X-Gm-Message-State: AOJu0Yz//ZXC1yWnSmWganqN1KwlIBxPDFY7sPWlX6uhT8P+QByp32K5
	GS/flhwx++BRAqAwffmZKCSqabBsJKK9AQuk7uGfJnSgvF9toZ1G
X-Google-Smtp-Source: AGHT+IG/SLo7IZipsDDy7zRrZC+GgAuTAGWON0Bsoqj4uYyJv+RSVk/6F7C6tK2fz6ryDtVCQEYyyNn3PWzHDXcwocU=
X-Received: by 2002:a05:651c:1145:b0:2cc:1ee4:a930 with SMTP id
 h5-20020a05651c114500b002cc1ee4a930mr3971199ljo.106.1702448201538; Tue, 12
 Dec 2023 22:16:41 -0800 (PST)
MIME-Version: 1.0
References: <20231024132655.730417-1-cleger@rivosinc.com> <20231024132655.730417-6-cleger@rivosinc.com>
In-Reply-To: <20231024132655.730417-6-cleger@rivosinc.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 13 Dec 2023 11:46:30 +0530
Message-ID: <CAK9=C2UTww1AcF+U+7MBiT5c7PVtQrQQN=tNszjse+AgJd6xCQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] riscv: kvm: use ".L" local labels in assembly when applicable
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_221643_211010_30774CB7 
X-CRM114-Status: GOOD (  16.17  )
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

T24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgNjo1OOKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBGb3IgdGhlIHNha2Ugb2YgY29oZXJlbmN5LCB1c2Ug
bG9jYWwgbGFiZWxzIGluIGFzc2VtYmx5IHdoZW4KPiBhcHBsaWNhYmxlLiBUaGlzIGFsc28gYXZv
aWQga3Byb2JlcyBiZWluZyBjb25mdXNlZCB3aGVuIGFwcGx5aW5nIGEKPiBrcHJvYmUgc2luY2Ug
dGhlIHNpemUgb2YgZnVuY3Rpb24gaXMgY29tcHV0ZWQgYnkgY2hlY2tpbmcgd2hlcmUgdGhlCj4g
bmV4dCB2aXNpYmxlIHN5bWJvbCBpcyBsb2NhdGVkLiBUaGlzIG1pZ2h0IGVuZCB1cCBpbiBjb21w
dXRpbmcgc29tZQo+IGZ1bmN0aW9uIHNpemUgdG8gYmUgd2F5IHNob3J0ZXIgdGhhbiBleHBlY3Rl
ZCBhbmQgdGh1cyBmYWlsaW5nIHRvIGFwcGx5Cj4ga3Byb2JlcyB0byB0aGUgc3BlY2lmaWVkIG9m
ZnNldC4KPgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNv
bT4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02LjgKClRoYW5rcywKQW51cAoKCj4gLS0t
Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc3dpdGNoLlMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3N3aXRjaC5TIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2guUwo+
IGluZGV4IDhiMTg0NzM3ODBhYy4uMGMyNjE4OWFhMDFjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfc3dpdGNoLlMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3N3aXRjaC5T
Cj4gQEAgLTQ1LDcgKzQ1LDcgQEAgU1lNX0ZVTkNfU1RBUlQoX19rdm1fcmlzY3Zfc3dpdGNoX3Rv
KQo+ICAgICAgICAgUkVHX0wgICB0MCwgKEtWTV9BUkNIX0dVRVNUX1NTVEFUVVMpKGEwKQo+ICAg
ICAgICAgUkVHX0wgICB0MSwgKEtWTV9BUkNIX0dVRVNUX0hTVEFUVVMpKGEwKQo+ICAgICAgICAg
UkVHX0wgICB0MiwgKEtWTV9BUkNIX0dVRVNUX1NDT1VOVEVSRU4pKGEwKQo+IC0gICAgICAgbGEg
ICAgICB0NCwgX19rdm1fc3dpdGNoX3JldHVybgo+ICsgICAgICAgbGEgICAgICB0NCwgLkxrdm1f
c3dpdGNoX3JldHVybgo+ICAgICAgICAgUkVHX0wgICB0NSwgKEtWTV9BUkNIX0dVRVNUX1NFUEMp
KGEwKQo+Cj4gICAgICAgICAvKiBTYXZlIEhvc3QgYW5kIFJlc3RvcmUgR3Vlc3QgU1NUQVRVUyAq
Lwo+IEBAIC0xMTMsNyArMTEzLDcgQEAgU1lNX0ZVTkNfU1RBUlQoX19rdm1fcmlzY3Zfc3dpdGNo
X3RvKQo+Cj4gICAgICAgICAvKiBCYWNrIHRvIEhvc3QgKi8KPiAgICAgICAgIC5hbGlnbiAyCj4g
LV9fa3ZtX3N3aXRjaF9yZXR1cm46Cj4gKy5Ma3ZtX3N3aXRjaF9yZXR1cm46Cj4gICAgICAgICAv
KiBTd2FwIEd1ZXN0IEEwIHdpdGggU1NDUkFUQ0ggKi8KPiAgICAgICAgIGNzcnJ3ICAgYTAsIENT
Ul9TU0NSQVRDSCwgYTAKPgo+IC0tCj4gMi40Mi4wCj4KPgo+IC0tCj4ga3ZtLXJpc2N2IG1haWxp
bmcgbGlzdAo+IGt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
