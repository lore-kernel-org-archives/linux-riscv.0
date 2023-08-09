Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0F9C0015E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 16:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1C03RCYk5XB7P5iPcEObXc0gdePVbw5G4vRJhz4Zbc=; b=JkSLGQKujqSKIg
	zFIEo/ueMunPgS/KUfvjgjmMcZ/uS/oGk8u496GLyIU+84KvqqpiurS3dxh9mliywxTRJORk4P7m9
	PKnFJc9gLWjMXlUvLULKOV2dNPCWlfP+MyLNP0anr4ckrxcQR3rrEpJZs3AeBOXBEXxgDGHMMCiS3
	ojsqLu5HX0b1rWUtQir++OLZ3UxKzsiAXIs/2RX/jQaEy5gW+H9jxPD45rozfNdhimPP9AwVP/+UM
	brnza13u3N8jGmKjxeDyrCr24ySRZA4TlBmqtMUBadSbE8BCr1FLrzdUQaO0hvrdl/9k9cZObdBLL
	sRCrGOhYvpQ+eDhTiH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTmVq-005SUT-3C;
	Wed, 09 Aug 2023 16:58:22 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTmVn-005SSm-2d
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 16:58:21 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bc512526cso10371666b.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 09:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691600297; x=1692205097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UPqhwBbH9ypRAb5HYyAdsLUjQpO6FWc1dadi0+Um8vo=;
        b=Ca9pjfJ3lUzEqfppenSiXzH008xNjG3VXSp+w8KVAv9qJ6NGguFY1J7kT2q0RYGbJn
         1o3EHtP2lgKZhlSBDfb3UEXLrJ+dSuu3Eoyc4Q7A+0q5SSoGYdJLObaYzIOCchF+sJ7s
         uMjduOjHpV0XWXEmubzLh20ExvkcesJjpPDphyeRNGWNDPSiibwFI7UHgqSxuaAXktNL
         Bn+J98zbRSAXjXB81cnF2gs1AEcF53tIiQpnfRfECFGRNhww6UHVhOl64/heqVGj0ane
         YGj41eURE8t4dK6y/G/ZOOU3t2n8aVXiWiHI//1BOa4R8Rlk7vjHIGnwosZWqNMa2P7i
         z1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691600297; x=1692205097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UPqhwBbH9ypRAb5HYyAdsLUjQpO6FWc1dadi0+Um8vo=;
        b=NvUnOGnBrBXWaDCBwbZ9IWpFlsYMuuOUUetKjYc57ESUBsf0IizUvlvOdhw8musXuT
         uGRqXzPMYLyhtuliIWWJbnW2tLCLcyueLqNx/suyZErN7VkedPqW8jJ8qXafBIwTSCz+
         ok5/+mr/tiq5oEjo7MXMH8wYG/UX5MVZDQICdRsZIQAHonANwrA63XeVKP7a0k7SDuz3
         CWh0Cuo8Lbft/DwuvZJqesJHf+ZY0AH1qW4S7we6RvvnsMoOAf8vccubDHzz2PX/GQjl
         /Wn/oUfsSejYMl6LTS9OD7Iis2qJ38VDdzr4Tkwmfx5awVp5SVnyzPg22vQRB/ObaU5M
         spoQ==
X-Gm-Message-State: AOJu0YxIjFjROXAESlzQDfk4qRhck5Z1l1eUUhjRsqgaIcvOmBEbKPJB
	gQxMdJpM51my6LtFiorcLIpdfg==
X-Google-Smtp-Source: AGHT+IELll/zop7ZpCkuMrUWMYnPh5Fsnn2gluTyPkXt0sstELdnKTqO2JgHOlb7aaV6EyaPMMOa/A==
X-Received: by 2002:a17:906:28c:b0:99b:c86b:1d25 with SMTP id 12-20020a170906028c00b0099bc86b1d25mr2696707ejf.26.1691600296606;
        Wed, 09 Aug 2023 09:58:16 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j20-20020a170906095400b00992e14af9b9sm8176963ejd.134.2023.08.09.09.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 09:58:16 -0700 (PDT)
Date: Wed, 9 Aug 2023 18:58:15 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	apatel@ventanamicro.com
Subject: Re: [PATCH 2/6] RISC-V: Enable cbo.zero in usermode
Message-ID: <20230809-7aa41e2dd2fd2909f1266a20@orel>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
 <20230809115516.214537-10-ajones@ventanamicro.com>
 <CALs-HssK7ys8kjZPuodoz9qEe_hReyihfbBdQsp1exLH3vxkSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-HssK7ys8kjZPuodoz9qEe_hReyihfbBdQsp1exLH3vxkSQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_095819_855692_57C0948D 
X-CRM114-Status: GOOD (  19.37  )
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

T24gV2VkLCBBdWcgMDksIDIwMjMgYXQgMDk6MDA6MzVBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBXZWQsIEF1ZyA5LCAyMDIzIGF0IDQ6NTXigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25l
c0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKLi4uCj4gPiArc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSBib29sIHJpc2N2X3RoaXNfY3B1X2hhc19leHRlbnNpb25fbGlrZWx5KGNvbnN0IHVuc2lnbmVk
IGxvbmcgZXh0KQo+ID4gK3sKPiA+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1JJU0NW
X0FMVEVSTkFUSVZFKSAmJiByaXNjdl9oYXNfZXh0ZW5zaW9uX2xpa2VseShleHQpKQo+ID4gKyAg
ICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gKwo+ID4gKyAgICAgICByZXR1cm4gX19yaXNj
dl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShoYXJ0X2lzYVtzbXBfcHJvY2Vzc29yX2lkKCldLmlz
YSwgZXh0KTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIHJp
c2N2X3RoaXNfY3B1X2hhc19leHRlbnNpb25fdW5saWtlbHkoY29uc3QgdW5zaWduZWQgbG9uZyBl
eHQpCj4gPiArewo+ID4gKyAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfQUxURVJO
QVRJVkUpICYmIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoZXh0KSkKPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIF9fcmlzY3ZfaXNh
X2V4dGVuc2lvbl9hdmFpbGFibGUoaGFydF9pc2Fbc21wX3Byb2Nlc3Nvcl9pZCgpXS5pc2EsIGV4
dCk7Cj4gPiArfQo+IAo+IEFub3RoZXIgd2F5IHRvIGRvIHRoaXMgd291bGQgYmUgdG8gYWRkIGEg
cGFyYW1ldGVyIHRvCj4gcmlzY3ZfaGFzX2V4dGVuc2lvbl8qKCkgKGFzIHRoZXJlIGFyZSB2ZXJ5
IGZldyB1c2VycyksIHRoZW4gdGhlc2UgbmV3Cj4gZnVuY3Rpb25zIGNhbiB0dXJuIGFyb3VuZCBh
bmQgY2FsbCB0aG9zZSB3aXRoIHRoZSBuZXcgcGFyYW1ldGVyIHNldCB0bwo+IGhhcnRfaXNhW3Nt
cF9wcm9jZXNzb3JfaWQoKV0uaXNhLiBJdCdzIGEgdG9zc3VwLCBzbyB1cCB0byB5b3UuIFRoZQo+
IG9ubHkgYWR2YW50YWdlIHRvIGl0IEkgY2FuIGFyZ3VlIGlzIGl0IGtlZXBzIHRoZSBjb2RlIGZs
b3dzIG1vcmUKPiB1bmlmaWVkLgo+CgpJIGxpa2UgdW5pZmljYXRpb24sIGJ1dCBJIHRoaW5rIEkn
ZCBwcmVmZXIgd2UgY3JlYXRlIHdyYXBwZXJzIGFuZAp0cnkgdG8gYXZvaWQgY2FsbGVycyBuZWVk
aW5nIHRvIGNvbnN0cnVjdCBoYXJ0X2lzYVtdLmlzYSBwYXJhbWV0ZXJzCnRoZW1zZWx2ZXMuIEkn
bSBhbHNvIG5vdCBhIGJpZyBmYW4gb2YgdGhlIE5VTEwgcGFyYW1ldGVyIG5lZWRlZCB3aGVuCnJp
c2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKCkgaXMgaW52b2tlZCBmb3IgdGhlIHJpc2N2X2lz
YSBiaXRtYXAuClNvIHdlIG5lZWQ6CgogIDEuIGNoZWNrIGlmIGFuIGV4dGVuc2lvbiBpcyBpbiBy
aXNjdl9pc2EKICAyLiBjaGVjayBpZiBhbiBleHRlbnNpb24gaXMgaW4gYSBiaXRtYXAgcHJvdmlk
ZWQgYnkgdGhlIGNhbGxlcgogIDMuIGNoZWNrIGlmIGFuIGV4dGVuc2lvbiBpcyBpbiB0aGlzIGNw
dSdzIGlzYSBiaXRtYXAKICA0LiBjaGVjayBpZiBhbiBleHRlbnNpb24gaXMgaW4gdGhlIGlzYSBi
aXRtYXAgb2YgYSBjcHUgcHJvdmlkZWQgYnkgdGhlCiAgICAgY2FsbGVyCgpUaGUgb25seSBvbmUg
d2UgY2FuIG9wdGltaXplIHdpdGggYWx0ZXJuYXRpdmVzIGlzICgxKSwgc28gaXQgZGVmaW5pdGVs
eQpnZXRzIHdyYXBwZXJzIChyaXNjdl9oYXNfZXh0ZW5zaW9uX2xpa2VseS91bmxpa2VseSgpKS4g
KDMpIGFuZCAoNCkgY2FuCmFsc28gZ2V0IHdyYXBwZXJzIHdoaWNoIGZpcnN0IHRyeSB0aGUgb3B0
aW1pemVkICgxKSwgbGlrZSBJIGhhdmUgYWJvdmUuCkFjdHVhbGx5ICgzKSdzIHdyYXBwZXIgY291
bGQgYmUgYmFzZWQgb24gKDQpJ3MsIG9yIG9ubHkgcHJvdmlkZSB3cmFwcGVycwpmb3IgKDQpCgog
c3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIHJpc2N2X2NwdV9oYXNfZXh0ZW5zaW9uX2xpa2Vs
eShpbnQgY3B1LCBjb25zdCB1bnNpZ25lZCBsb25nIGV4dCkKIHsKICAgICBpZiAoSVNfRU5BQkxF
RChDT05GSUdfUklTQ1ZfQUxURVJOQVRJVkUpICYmIHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5
KGV4dCkpCiAgICAgICAgIHJldHVybiB0cnVlOwoKICAgICByZXR1cm4gX19yaXNjdl9pc2FfZXh0
ZW5zaW9uX2F2YWlsYWJsZShoYXJ0X2lzYVtjcHVdLmlzYSwgZXh0KTsKIH0KCiBzdGF0aWMgX19h
bHdheXNfaW5saW5lIGJvb2wgcmlzY3ZfY3B1X2hhc19leHRlbnNpb25fdW5saWtlbHkoaW50IGNw
dSwgY29uc3QgdW5zaWduZWQgbG9uZyBleHQpCiB7CiAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklH
X1JJU0NWX0FMVEVSTkFUSVZFKSAmJiByaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KGV4dCkp
CiAgICAgICAgIHJldHVybiB0cnVlOwoKICAgICByZXR1cm4gX19yaXNjdl9pc2FfZXh0ZW5zaW9u
X2F2YWlsYWJsZShoYXJ0X2lzYVtjcHVdLmlzYSwgZXh0KTsKIH0KCmFuZCB0aGVuIHVzZSBzbXBf
cHJvY2Vzc29yX2lkKCkgZGlyZWN0bHkgaW4gdGhlIGNhbGxlcnMgdGhhdCBuZWVkCnRvIGNoZWNr
IHRoaXNfY3B1J3MgZXh0ZW5zaW9ucy4KCkZvciBjYXNlICgyKSwgSSdkIGFkdm9jYXRlIHdlIHJl
bmFtZSBfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKCkgdG8KcmlzY3ZfaGFzX2V4dGVu
c2lvbigpIGFuZCBkcm9wIHRoZSByaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZSgpIG1hY3Jv
CmluIG9yZGVyIHRvIGF2b2lkIGhhdmluZyBzb21lIGNhbGxzIHdpdGggUklTQ1ZfSVNBX0VYVF8q
IHNwZWxsZWQgb3V0IGFuZApvdGhlcnMgdGhhdCByZWx5IG9uIHRoZSBwYXN0aW5nLiBBbmQsIGlk
ZWFsbHksIHdlJ2QgY29udmVydCBtb3N0CnJpc2N2X2hhc19leHRlbnNpb24oTlVMTCwgZXh0KSBj
YWxscyB0byByaXNjdl9oYXNfZXh0ZW5zaW9uX1t1bl1saWtlbHkoKS4KClRoYW5rcywKZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
