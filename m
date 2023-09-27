Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04DAE80A8A
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 23:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fQyNxufq8BynCuFFw2eAgZ+ekWgovaR924WJH/ha8Q=; b=GtmcJatXiCfZYK
	EKA3kQu9TcUdkiTBxmoPnPhequKxWIj0Jj13r7T16f9JmHJfP9HBjr085wyhpeor56mKl3jWzqlBl
	4hdEkpXRUa5AXD0+ZxWiIXJTIEiP3OuGc5Nt8Dn21DgGmmdUPHN+nlMytJyqKql0mooZGOevVuL16
	D6tVZ8gSn8avAMmqX/kQfMzLyOUFIYxfEVTGwpky4hyPI1kG/2Ud+CE/AILT14Xk5kmrwkVjdj7Rs
	XJohEWfUMKzFlJf/VaMMXXljreyNhF/LiNGoywiknRv/wGIZ6Ot3qy7H5SUc/wjEwdvOajlIvvDjH
	xaFS/8UbbS5UL6pT+M7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qle8X-001vzP-25;
	Wed, 27 Sep 2023 23:40:09 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qle8T-001vy9-22
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 23:40:07 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-65b10205207so36626836d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 16:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695857997; x=1696462797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQWVSyMSESKVXR7lHsisu37f0DFjVJDNSkQFdAeg8Rc=;
        b=EUio1M1F1/b1o066st/4EtIkcN/44gvgd19KydxtYC4JQUGRlMYNRPQ6uTL3tG0+Ek
         Bz7j0efvUqXVsC1ZSr9jaUqLMmvfpmkFAjxvLDkyBIm8lXeLXaxJjG3yOBb7zNpBxaBs
         ABjuh0C7zux1YXFPMmjbzOaq3ODa5ZlNeIl74sf9VEqIUrfps+ZWqRwxxAgMRMhLIjXY
         pG3N0eXfd6k84Yy8K8A6h5NY93XGv/m2PpN7xq73JoBoiaAyHjhIV35J4gvdvEws9+gD
         uij4r9vIEQS8wqTd3v0oGSrvRv3qQ7+M11Sctj+coOKNZLT8QtX98uxH74h0AEmwIAfk
         HuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695857997; x=1696462797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQWVSyMSESKVXR7lHsisu37f0DFjVJDNSkQFdAeg8Rc=;
        b=ES+V1hPgAkhHj+t09hvQeoUqYBRMew0yZXDKP+UNdp/Hv32DjiO/IT15/BIVZ/hhZT
         WWBT+ON6oRBXkIWqHJ/fM9hlvkHFDVKuFcnwRnDrcKNQ7MC2E6n92ZSu45ZPOlHe70jl
         AG6ZS9qoLPfH0X2z5ra+iz7kq02f5iq/cZACm18kQyoJdEJM+xIGQdn9vQDj68VQUVV+
         juzzmZCcKmWx10R7xHEyKgNDNLBT2fKiaCKZAeLY/ZKyinDehJDDSVe0tBtFWiFEPmmY
         0nJZCd0SkLR9yN+CCfrU4vyFbsJDHva/O0ZD+oRbn3DkPrTGB6w3HLyBSxS5tJ+gifpD
         RCKg==
X-Gm-Message-State: AOJu0YxXKzFPIuIG/aSTlaFqFARWMkIoDaqCoaaXAErvmi7YrdpdAt3Q
	Tt7Q0jJNq4OfsEAEkDVo4BJEbfRm0lzPNPJDUQM=
X-Google-Smtp-Source: AGHT+IFoprYkIDxUtCHlyYzh+wqHcvx4P6k6uIZuO/hY4iiSk4nxHrGQAOkw+bADmNjWozNYnrs3WHNz87mEp9N4gkU=
X-Received: by 2002:a0c:f04c:0:b0:65b:1744:55d4 with SMTP id
 b12-20020a0cf04c000000b0065b174455d4mr3619280qvl.3.1695857996868; Wed, 27 Sep
 2023 16:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695804418.git.unicornxw@gmail.com> <20230927-ebony-duress-44ff45d3d253@spud>
In-Reply-To: <20230927-ebony-duress-44ff45d3d253@spud>
From: Chen Wang <unicornxw@gmail.com>
Date: Thu, 28 Sep 2023 07:39:45 +0800
Message-ID: <CAHAQgRC2xeqUu4mDZRJd3brcPNT4KovX65rNE7YXm+ku0+eERg@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] Add Milk-V Pioneer RISC-V board support
To: Conor Dooley <conor@kernel.org>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, devicetree@vger.kernel.org, 
	guoren@kernel.org, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_164005_670428_5A0C7FF3 
X-CRM114-Status: GOOD (  25.47  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiDkuo4yMDIz5bm0OeaciDI45pel5ZGo5Zub
IDAwOjA55YaZ6YGT77yaCj4KPiBIZXksCj4KPiBPbiBXZWQsIFNlcCAyNywgMjAyMyBhdCAwNDo1
NDozOFBNICswODAwLCBDaGVuIFdhbmcgd3JvdGU6Cj4gPiBNaWxrLVYgUGlvbmVlciBbMV0gaXMg
YSBkZXZlbG9wZXIgbW90aGVyYm9hcmQgYmFzZWQgb24gU09QSE9OIFNHMjA0MiBbMl0KPiA+IGlu
IGEgc3RhbmRhcmQgbUFUWCBmb3JtIGZhY3Rvci4gQWRkIG1pbmltYWwgZGV2aWNlCj4gPiB0cmVl
IGZpbGVzIGZvciB0aGUgU0cyMDQyIFNPQyBhbmQgdGhlIE1pbGstViBQaW9uZWVyIGJvYXJkLgo+
ID4KPiA+IE5vdyBvbmx5IHN1cHBvcnQgYmFzaWMgdWFydCBkcml2ZXJzIHRvIGJvb3QgdXAgaW50
byBhIGJhc2ljIGNvbnNvbGUuCj4gPgo+ID4gVGhhbmtzLAo+ID4gQ2hlbgo+ID4KPiA+IC0tLQo+
ID4KPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiAgIFRoZSBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24g
djYuNi1yYzEuIFlvdSBjYW4gc2ltcGx5IHJldmlldyBvciB0ZXN0Cj4gPiAgIHRoZSBwYXRjaGVz
IGF0IHRoZSBsaW5rIFs1XS4KPiA+ICAgLSBhZGQgbmV3IHZlbmRvciBzcGVjaWZpYyBjb21wYXRp
YmxlIHN0cmluZ3MgdG8gaWRlbnRpZnkgdGltZXIvbXN3aSBmb3Igc2cyMDQyIGNsaW50Cj4gPiAg
IC0gdXBkYXRlZCBtYWludGFpbmVycyBpbmZvLiBmb3Igc29waGdvIGRldmljZXRyZWUKPiA+ICAg
LSByZW1vdmUgdGhlIHF1aXJrIGNoYW5nZXMgZm9yIHVhcnQKPiA+ICAgLSB1cGRhdGVkIGR0cywg
c3VjaCBhczoKPiA+ICAgICAtIGFkZCAicmlzY3YsaXNhLWJhc2UiLyJyaXNjdixpc2EtZXh0ZW5z
aW9ucyIgZm9yIGNwdXMKPiA+ICAgICAtIHVwZGF0ZSBsMiBjYWNoZSBub2RlJ3MgbmFtZQo+ID4g
ICAgIC0gcmVtb3ZlIG1lbW9yeSBhbmQgcG11IG5vZGVzCj4gPiAgIC0gZml4ZWQgb3RoZXIgaXNz
dWVzIGFzIHBlciBpbnB1dCBmcm9tIHJldmlld2Vycy4KPgo+IHYzIGxvb2tzIGJldHRlciBpbmRl
ZWQuIEkgaGFkIHNvbWUgY29tbWVudHMgb24gdGhlIGJpbmRpbmdzIGFuZCBkdAo+IHBhdGNoZXMs
IGJ1dCBub25lIHdlcmUgcGFydGljdWxhcmx5IG1ham9yLgo+Cj4gVGhhbmtzLAo+IENvbm9yLgo+
ClRoYW5rcywgQ29ub3IsIEkgd2lsbCBjb250aW51ZSBpbXJwb3ZpbmcgYWNjb3JkaW5nIHRvIHlv
dXIgY29tbW5lbnRzLgoKPiA+Cj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gICBUaGUgcGF0Y2ggc2Vy
aWVzIGlzIGJhc2VkIG9uIHY2LjYtcmMxLiBZb3UgY2FuIHNpbXBseSByZXZpZXcgb3IgdGVzdAo+
ID4gICB0aGUgcGF0Y2hlcyBhdCB0aGUgbGluayBbNF0uCj4gPiAgIC0gSW1wcm92ZSBmb3JtYXQg
Zm9yIGNvbW1lbnQgb2YgY29tbWl0bWVudHMgYXMgcGVyIGlucHV0IGZyb20gbGFzdCByZXZpZXcu
Cj4gPiAgIC0gSW1wcm92ZSBmb3JtYXQgb2YgRFRTIGFzIHBlciBpbnB1dCBmcm9tIGxhc3QgcmV2
aWV3Lgo+ID4gICAtIFJlbW92ZSBudW1hIHJlbGF0ZWQgc3R1ZmYgZnJvbSBEVFMuIFRoaXMgcGFy
dCBpcyBqdXN0IGZvciBvcHRpbWl6YXRpb24sIG1heQo+ID4gICAgIGFkZCBpdCBsYXRlciBpZiBy
ZWFsbHkgbmVlZGVkLgo+ID4KPiA+IENoYW5nZXMgaW4gdjE6Cj4gPiAgICBUaGUgcGF0Y2ggc2Vy
aWVzIGlzIGJhc2VkIG9uIHY2LjYtcmMxLiBEdWUgdG8gaXQgaXMgbm90IHNlbnQgaW4gdGhyZWFk
LAo+ID4gICAgSSBoYXZlIGxpc3RlZCBwZXJtbGlua3Mgb2YgdGhlIHBhdGNoc2V0IFt2MS0wLzEy
XSB+IFt2MS0xMi8xMl0gaGVyZSBmb3IKPiA+ICAgIHF1aWNrIHJlZmVyZW5jZS4gWW91IGNhbiBz
aW1wbHkgcmV2aWV3IG9yIHRlc3QgdGhlIHBhdGNoZXMgYXQgdGhlIGxpbmsgWzNdLgo+ID4KPiA+
IFsxXTogaHR0cHM6Ly9taWxrdi5pby9waW9uZWVyCj4gPiBbMl06IGh0dHBzOi8vZW4uc29waGdv
LmNvbS9wcm9kdWN0L2ludHJvZHVjZS9zZzIwNDIuaHRtbAo+ID4gWzNdOiBodHRwczovL2dpdGh1
Yi5jb20vdW5pY29ybngvbGludXgtcmlzY3YvY29tbWl0cy9taWxrdi1waW9uZWVyLW1pbmltYWwK
PiA+IFs0XTogaHR0cHM6Ly9naXRodWIuY29tL3VuaWNvcm54L2xpbnV4LXJpc2N2L2NvbW1pdHMv
bWlsa3YtcGlvbmVlci1taW5pbWFsLXYyCj4gPiBbNV06IGh0dHBzOi8vZ2l0aHViLmNvbS91bmlj
b3JueC9saW51eC1yaXNjdi9jb21taXRzL21pbGt2LXBpb25lZXItbWluaW1hbC12Mwo+ID4gW3Yx
LTAvMTJdOmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwOTE1MDcwODU2
LjExNzUxNC0xLXdhbmdjaGVuMjBAaXNjYXMuYWMuY24vCj4gPiBbdjEtMS8xMl06aHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA5MTUwNzEwMDUuMTE3NTc1LTEtd2FuZ2No
ZW4yMEBpc2Nhcy5hYy5jbi8KPiA+IFt2MS0yLzEyXTpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi8yMDIzMDkxNTA3MTQwOS4xMTc2OTItMS13YW5nY2hlbjIwQGlzY2FzLmFjLmNu
Lwo+ID4gW3YxLTMvMTJdOmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMw
OTE1MDcyMjQyLjExNzkzNS0xLXdhbmdjaGVuMjBAaXNjYXMuYWMuY24vCj4gPiBbdjEtNC8xMl06
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA5MTUwNzIzMzMuMTE3OTkx
LTEtd2FuZ2NoZW4yMEBpc2Nhcy5hYy5jbi8KPiA+IFt2MS01LzEyXTpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDkxNTA3MjM1OC4xMTgwNDUtMS13YW5nY2hlbjIwQGlz
Y2FzLmFjLmNuLwo+ID4gW3YxLTYvMTJdOmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2LzIwMjMwOTE1MDcyNDE1LjExODEwMC0xLXdhbmdjaGVuMjBAaXNjYXMuYWMuY24vCj4gPiBb
djEtNy8xMl06aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA5MTUwNzI0
MzEuMTE4MTU0LTEtd2FuZ2NoZW4yMEBpc2Nhcy5hYy5jbi8KPiA+IFt2MS04LzEyXTpodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDkxNTA3MjQ1MS4xMTgyMDktMS13YW5n
Y2hlbjIwQGlzY2FzLmFjLmNuLwo+ID4gW3YxLTkvMTJdOmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2LzIwMjMwOTE1MDcyNTE3LjExODI2Ni0xLXdhbmdjaGVuMjBAaXNjYXMuYWMu
Y24vCj4gPiBbdjEtMTAvMTJdOmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIw
MjMwOTE1MDcyNTU4LjExODMyNS0xLXdhbmdjaGVuMjBAaXNjYXMuYWMuY24vCj4gPiBbdjEtMTEv
MTJdOmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwOTE1MDcyNjI0LjEx
ODM4OC0xLXdhbmdjaGVuMjBAaXNjYXMuYWMuY24vCj4gPiBbdjEtMTIvMTJdOmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwOTE1MDcyNjUzLjExODQ0OC0xLXdhbmdjaGVu
MjBAaXNjYXMuYWMuY24vCj4gPgo+ID4gLS0tCj4gPgo+ID4gQ2hlbiBXYW5nICg5KToKPiA+ICAg
cmlzY3Y6IEFkZCBTT1BIR08gU09DIGZhbWlseSBLY29uZmlnIHN1cHBvcnQKPiA+ICAgZHQtYmlu
ZGluZ3M6IHZlbmRvci1wcmVmaXhlczogYWRkIG1pbGt2L3NvcGhnbwo+ID4gICBkdC1iaW5kaW5n
czogcmlzY3Y6IGFkZCBzb3BoZ28gc2cyMDQyIGJpbmRpbmdzCj4gPiAgIGR0LWJpbmRpbmdzOiBy
aXNjdjogQWRkIFQtSEVBRCBDOTIwIGNvbXBhdGlibGVzCj4gPiAgIGR0LWJpbmRpbmdzOiBpbnRl
cnJ1cHQtY29udHJvbGxlcjogQWRkIFNvcGhnbyBTRzIwNDIgUExJQwo+ID4gICBNQUlOVEFJTkVS
UzogYWRkIHR3byBmaWxlcyB0byBzb3BoZ28gZGV2aWNldHJlZXMgZW50cnkKPiA+ICAgcmlzY3Y6
IGR0czogYWRkIGluaXRpYWwgU29waGdvIFNHMjA0MiBTb0MgZGV2aWNlIHRyZWUKPiA+ICAgcmlz
Y3Y6IGR0czogc29waGdvOiBhZGQgTWlsay1WIFBpb25lZXIgYm9hcmQgZGV2aWNlIHRyZWUKPiA+
ICAgcmlzY3Y6IGRlZmNvbmZpZzogZW5hYmxlIFNPUEhHTyBTb0MKPiA+Cj4gPiBJbm9jaGkgQW1h
b3RvICgyKToKPiA+ICAgZHQtYmluZGluZ3M6IHRpbWVyOiBBZGQgU29waGdvIHNnMjA0MiBDTElO
VCB0aW1lcgo+ID4gICBkdC1iaW5kaW5nczogaW50ZXJydXB0LWNvbnRyb2xsZXI6IEFkZCBTb3Bo
Z28gc2cyMDQyIENMSU5UIG1zd2kKPiA+Cj4gPiAgLi4uL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwg
ICAgICAgICAgICAgICAgICAgIHwgICAgMSArCj4gPiAgLi4uL3NvcGhnbyxzZzIwNDItY2xpbnQt
bXN3aS55YW1sICAgICAgICAgICAgIHwgICA0MiArCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmlzY3YvY3B1cy55YW1sICAgICAgIHwgICAgMSArCj4gPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3Yvc29waGdvLnlhbWwgICAgIHwgICAyOCArCj4gPiAgLi4uL3RpbWVyL3NvcGhn
byxzZzIwNDItY2xpbnQtbXRpbWVyLnlhbWwgICAgIHwgICA0MiArCj4gPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgIHwgICAgNCArCj4gPiAgTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgOSArCj4gPiAgYXJjaC9y
aXNjdi9LY29uZmlnLnNvY3MgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNSArCj4gPiAgYXJj
aC9yaXNjdi9ib290L2R0cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgICAgMSArCj4gPiAg
YXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vTWFrZWZpbGUgICAgICAgICAgIHwgICAgMyArCj4g
PiAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLWNwdXMuZHRzaSAgIHwgMTg4MCAr
KysrKysrKysrKysrKysrKwo+ID4gIC4uLi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLW1pbGt2LXBp
b25lZXIuZHRzICB8ICAgMTkgKwo+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0
Mi5kdHNpICAgICAgICB8ICAzMjUgKysrCj4gPiAgYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZp
ZyAgICAgICAgICAgICAgICAgIHwgICAgMSArCj4gPiAgMTQgZmlsZXMgY2hhbmdlZCwgMjM2MSBp
bnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zb3BoZ28sc2cyMDQyLWNsaW50LW1z
d2kueWFtbAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3Yvc29waGdvLnlhbWwKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NvcGhnbyxzZzIwNDItY2xpbnQtbXRp
bWVyLnlhbWwKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3Bo
Z28vTWFrZWZpbGUKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9z
b3BoZ28vc2cyMDQyLWNwdXMuZHRzaQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItbWlsa3YtcGlvbmVlci5kdHMKPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kKPiA+Cj4gPgo+
ID4gYmFzZS1jb21taXQ6IDBiYjgwZWNjMzNhOGZiNWE2ODIyMzY0NDNjMWU3NDBkNWM5MTdkMWQK
PiA+IC0tCj4gPiAyLjI1LjEKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
