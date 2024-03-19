Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B00C54E71
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 23:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MuQhwTv2UmTz0n1YibQUBbqyxHMGs50UY22cJkmltdg=; b=gLMQ7W3K3rBmPf
	6Fka9j4tBl0ux57uwxLCxP1H2jL+slkmwrvBbsK19XeRorYjvF4XJbgV58A6hH5X9Vt7C7/hjE8UK
	nSkuvwN3JqVUry4qgC/DO/hN9WJ0tZrvzdDcPVvPcENx30m07p8jlWvIJZ1twzNFoGMvg6BT6pjR6
	2vyuHvLJZFjW92z3wWVNNLpOUP060TfEVv06HDyurlVMx76GxXyl4IxpO+dgj+yg/ZeuqPkh5p9Zd
	IMAshgvRoT9S6JJcIfHIvLLv8CXQOBrrbuFjHU5Nox0kdglg/o2omPAnInd8AGM0Qc2q7ojS4Qb6d
	c9fNTlGIhYTdTIWbT1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmjJP-0000000EgLi-2M7I;
	Tue, 19 Mar 2024 23:56:07 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmjJK-0000000EgKa-0fj3
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 23:56:06 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso5824934276.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 16:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710892558; x=1711497358; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frQ+kwCuCCJ3eDZ6Belhj/LKRwCvmbaO9rNQmp6RZGY=;
        b=cySMtXFdiRw8jCIVxrG947hAhSmCgl1IPyXFwM+60zvwjzfRDYXeDnZSdUTCp5wG0q
         pOqdKxAdUaGGlU28immRPcdUKqtHJwG2bXxCwggvdTNmGFkQXkbGGsLkfTA5+rYoAxTU
         tqb2CuAZx+jcReKwheuaj//kk/ww3XyijvYKhKOSuVQa6sNSWnlWsD15woQuIi71NVPm
         4RQowqz400kn4ncTIxKZt60PGRtlNDLxH/YDzR7vA/k2IDakCs+V57L1q3ilhwmCErQw
         qBmXUl0IlMs3jxTDY0dNJ5cqzd71z0nyIs2AvrnLSwzVfPnDiP+ujGuGuZ5xCSFhwHS5
         bi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710892558; x=1711497358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frQ+kwCuCCJ3eDZ6Belhj/LKRwCvmbaO9rNQmp6RZGY=;
        b=MZlpphS90spCFaPecNTXljqicYnaoRlnLJOlAH6rXJb98qxnh7/r0w2FqEjyESWgfl
         iiPD54pAWwvxs2h5wnqyB6kZbgkfHsPw/rE/81TwYYgnSjzCqHLUNSGP8Fz/el3BZ4ou
         LPJGMf9Lb/YvyqEf5JvbmLIMo5qG2HeE7psShvtorqOWtzFRTkid++e6xvfBku0R8L+o
         U7GU3Yg8S17qvh7sXcQiS8qeT1i1ptRQNgDNHupmR3wlIUmpxibcXmkmkwz3gIqQ9kAU
         +zD4aP+wVIeDdyDeONb1Km+NuL94Y26TdI+GPv5ZqEItBEwVkqMtkjOMe849SsC2Cw7F
         leBA==
X-Forwarded-Encrypted: i=1; AJvYcCVZmoaOESy7IX9klbikUiUU5PQ6cESgtnoqrrdIxejPMvVNNefuq1sKYcU5hDmpdLEE+95m9CiZIaatdkcDTckkzMWsZLtvybcxgk9w2bSO
X-Gm-Message-State: AOJu0Yw1RH09gsdpYnzKAbYp4EjsKgXrp4/V5uFRzdyC57gB/ImJ8S7v
	/fPFo2F8Vr2NFZNX+c/fhG+6lU0N7CWgimT49RR7/Dp4Brl7pYGURqQqYBeVcMrWrAW5W2E9B7Y
	ntB3TfcTWOY0R9HAtL1nlxZVbG0Bv320xc5ogsg==
X-Google-Smtp-Source: AGHT+IG8CEb5Ytu01FVI8jWzno3ZalgsXxFiYD/SFGczvQ19FRdvfeY4fGbHx+H+E+NYkk+ncwi6hA8ltk20WFREucc=
X-Received: by 2002:a25:2fc2:0:b0:dd0:e439:cec6 with SMTP id
 v185-20020a252fc2000000b00dd0e439cec6mr14153797ybv.18.1710892558409; Tue, 19
 Mar 2024 16:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240319215915.832127-1-samuel.holland@sifive.com> <20240319215915.832127-6-samuel.holland@sifive.com>
In-Reply-To: <20240319215915.832127-6-samuel.holland@sifive.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 19 Mar 2024 16:55:47 -0700
Message-ID: <CAKC1njSg9-hJo6hibcM9a-=FUmMWyR39QUYqQ1uwiWhpBZQb9A@mail.gmail.com>
Subject: Re: [RISC-V] [tech-j-ext] [RFC PATCH 5/9] riscv: Split per-CPU and
 per-thread envcfg bits
To: samuel.holland@sifive.com
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, tech-j-ext@lists.risc-v.org, 
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com, 
	Evgenii Stepanov <eugenis@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_165602_334608_D23792DD 
X-CRM114-Status: GOOD (  26.98  )
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

T24gVHVlLCBNYXIgMTksIDIwMjQgYXQgMjo1OeKAr1BNIFNhbXVlbCBIb2xsYW5kIHZpYSBsaXN0
cy5yaXNjdi5vcmcKPHNhbXVlbC5ob2xsYW5kPXNpZml2ZS5jb21AbGlzdHMucmlzY3Yub3JnPiB3
cm90ZToKPgo+IFNvbWUgZW52Y2ZnIGJpdHMgbmVlZCB0byBiZSBjb250cm9sbGVkIG9uIGEgcGVy
LXRocmVhZCBiYXNpcywgc3VjaCBhcwo+IHRoZSBwb2ludGVyIG1hc2tpbmcgbW9kZS4gSG93ZXZl
ciwgdGhlIGVudmNmZyBDU1IgdmFsdWUgY2Fubm90IHNpbXBseSBiZQo+IHN0b3JlZCBpbiBzdHJ1
Y3QgdGhyZWFkX3N0cnVjdCwgYmVjYXVzZSBzb21lIGhhcmR3YXJlIG1heSBpbXBsZW1lbnQgYQo+
IGRpZmZlcmVudCBzdWJzZXQgb2YgZW52Y2ZnIENTUiBiaXRzIGlzIGFjcm9zcyBDUFVzLiBBcyBh
IHJlc3VsdCwgd2UgbmVlZAo+IHRvIGNvbWJpbmUgdGhlIHBlci1DUFUgYW5kIHBlci10aHJlYWQg
Yml0cyB3aGVuZXZlciB3ZSBzd2l0Y2ggdGhyZWFkcy4KPgoKV2h5IG5vdCBkbyBzb21ldGhpbmcg
bGlrZSB0aGlzCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKaW5kZXggYjM0MDA1MTdiMGE5Li4wMWJhODc5NTRk
YTIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jc3IuaApAQCAtMjAyLDYgKzIwMiw4IEBACiAjZGVmaW5lIEVOVkNG
R19DQklFX0ZMVVNIICAgICAgICAgICAgICBfQUMoMHgxLCBVTCkKICNkZWZpbmUgRU5WQ0ZHX0NC
SUVfSU5WICAgICAgICAgICAgICAgICAgICAgICAgX0FDKDB4MywgVUwpCiAjZGVmaW5lIEVOVkNG
R19GSU9NICAgICAgICAgICAgICAgICAgICBfQUMoMHgxLCBVTCkKKy8qIGJ5IGRlZmF1bHQgYWxs
IHRocmVhZHMgc2hvdWxkIGJlIGFibGUgdG8gemVybyBjYWNoZSAqLworI2RlZmluZSBFTlZDRkdf
QkFTRSAgICAgICAgICAgICAgICAgICAgRU5WQ0ZHX0NCWkUKCiAvKiBTbXN0YXRlZW4gYml0cyAq
LwogI2RlZmluZSBTTVNUQVRFRU4wX0FJQV9JTVNJQ19TSElGVCAgICAgNTgKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3Mu
YwppbmRleCA0ZjIxZDk3MGExMjkuLjI0MjAxMjM0NDRjNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvcHJvY2Vzcy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwpAQCAt
MTUyLDYgKzE1Miw3IEBAIHZvaWQgc3RhcnRfdGhyZWFkKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1
bnNpZ25lZCBsb25nIHBjLAogICAgICAgIGVsc2UKICAgICAgICAgICAgICAgIHJlZ3MtPnN0YXR1
cyB8PSBTUl9VWExfNjQ7CiAjZW5kaWYKKyAgICAgICBjdXJyZW50LT50aHJlYWRfaW5mby5lbnZj
ZmcgPSBFTlZDRkdfQkFTRTsKIH0KCkFuZCBpbnN0ZWFkIG9mIGNvbnRleHQgc3dpdGNoaW5nIGlu
IGBfc3dpdGNoX3RvYCwKSW4gYGVudHJ5LlNgIHBpY2sgdXAgYGVudmNmZ2AgZnJvbSBgdGhyZWFk
X2luZm9gIGFuZCB3cml0ZSBpdCBpbnRvIENTUi4KClRoaXMgY29uc3RydWN0aW9uIGF2b2lkcwot
IGRlY2xhcmluZyBwZXIgY3B1IHJpc2N2X2NwdV9lbnZjZmcKLSBzeW5jaW5nIHVwCi0gY29sbGVj
dGlvbiBvZiAqZW52Y2ZnIGJpdHMuCgoKPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8
c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPiAtLS0KPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2NwdWZlYXR1cmUuaCB8ICAyICsrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vz
c29yLmggIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N3aXRjaF90by5oICB8IDEy
ICsrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICB8ICA0
ICsrKy0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+IGluZGV4IDBiZDExODYyYjc2MC4u
YjFhZDhkMGI0NTk5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVh
dHVyZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPiBAQCAt
MzMsNiArMzMsOCBAQCBERUNMQVJFX1BFUl9DUFUobG9uZywgbWlzYWxpZ25lZF9hY2Nlc3Nfc3Bl
ZWQpOwo+ICAvKiBQZXItY3B1IElTQSBleHRlbnNpb25zLiAqLwo+ICBleHRlcm4gc3RydWN0IHJp
c2N2X2lzYWluZm8gaGFydF9pc2FbTlJfQ1BVU107Cj4KPiArREVDTEFSRV9QRVJfQ1BVKHVuc2ln
bmVkIGxvbmcsIHJpc2N2X2NwdV9lbnZjZmcpOwo+ICsKPiAgdm9pZCByaXNjdl91c2VyX2lzYV9l
bmFibGUodm9pZCk7Cj4KPiAgI2lmZGVmIENPTkZJR19SSVNDVl9NSVNBTElHTkVECj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gaW5kZXggYTg1MDljYzMxYWIyLi4wNmI4NzQwMmE0ZDgg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiBAQCAtMTE4LDYgKzExOCw3IEBA
IHN0cnVjdCB0aHJlYWRfc3RydWN0IHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgc1sxMl07ICAg
IC8qIHNbMF06IGZyYW1lIHBvaW50ZXIgKi8KPiAgICAgICAgIHN0cnVjdCBfX3Jpc2N2X2RfZXh0
X3N0YXRlIGZzdGF0ZTsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgYmFkX2NhdXNlOwo+ICsgICAg
ICAgdW5zaWduZWQgbG9uZyBlbnZjZmc7Cj4gICAgICAgICB1MzIgcmlzY3Zfdl9mbGFnczsKPiAg
ICAgICAgIHUzMiB2c3RhdGVfY3RybDsKPiAgICAgICAgIHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0
YXRlIHZzdGF0ZTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hf
dG8uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmgKPiBpbmRleCA3ZWZkYjA1
ODRkNDcuLjI1NmEzNTRhNWM0YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3N3aXRjaF90by5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaAo+
IEBAIC02OSw2ICs2OSwxNyBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgaGFzX2ZwdSh2
b2lkKSB7IHJldHVybiBmYWxzZTsgfQo+ICAjZGVmaW5lIF9fc3dpdGNoX3RvX2ZwdShfX3ByZXYs
IF9fbmV4dCkgZG8geyB9IHdoaWxlICgwKQo+ICAjZW5kaWYKPgo+ICtzdGF0aWMgaW5saW5lIHZv
aWQgc3luY19lbnZjZmcoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKQo+ICt7Cj4gKyAgICAgICBj
c3Jfd3JpdGUoQ1NSX0VOVkNGRywgdGhpc19jcHVfcmVhZChyaXNjdl9jcHVfZW52Y2ZnKSB8IHRh
c2stPnRocmVhZC5lbnZjZmcpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgX19zd2l0
Y2hfdG9fZW52Y2ZnKHN0cnVjdCB0YXNrX3N0cnVjdCAqbmV4dCkKPiArewo+ICsgICAgICAgaWYg
KHJpc2N2X2NwdV9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KHNtcF9wcm9jZXNzb3JfaWQoKSwgUklT
Q1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcpKQoKSSd2ZSBzZWVuIGByaXNjdl9jcHVfaGFzX2V4dGVu
c2lvbl91bmxpa2VseWAgZ2VuZXJhdGluZyBicmFuY2h5IGNvZGUKZXZlbiBpZiBBTFRFUk5BVElW
RVMgd2FzIHR1cm5lZCBvbi4KQ2FuIHlvdSBjaGVjayBkaXNhc20gb24geW91ciBlbmQgYXMgd2Vs
bC4gIElNSE8sIGBlbnRyeS5TYCBpcyBhIGJldHRlcgpwbGFjZSB0byBwaWNrIHVwICplbnZjZmcu
Cgo+ICsgICAgICAgICAgICAgICBzeW5jX2VudmNmZyhuZXh0KTsKPiArfQo+ICsKPiAgZXh0ZXJu
IHN0cnVjdCB0YXNrX3N0cnVjdCAqX19zd2l0Y2hfdG8oc3RydWN0IHRhc2tfc3RydWN0ICosCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHRhc2tfc3RydWN0
ICopOwo+Cj4gQEAgLTgwLDYgKzkxLDcgQEAgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAgICBfX3N3aXRjaF90b19m
cHUoX19wcmV2LCBfX25leHQpOyAgICAgICAgXAo+ICAgICAgICAgaWYgKGhhc192ZWN0b3IoKSkg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAgICAgICAg
IF9fc3dpdGNoX3RvX3ZlY3RvcihfX3ByZXYsIF9fbmV4dCk7ICAgICBcCj4gKyAgICAgICBfX3N3
aXRjaF90b19lbnZjZmcoX19uZXh0KTsgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAo
KGxhc3QpID0gX19zd2l0Y2hfdG8oX19wcmV2LCBfX25leHQpKTsgICAgICAgICBcCj4gIH0gd2hp
bGUgKDApCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gaW5kZXggZDE4NDZhYWIxZjc4Li4zMmFh
YWY0MWY4YTggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gQEAgLTQ0LDYgKzQ0LDggQEAg
c3RhdGljIERFQ0xBUkVfQklUTUFQKHJpc2N2X2lzYSwgUklTQ1ZfSVNBX0VYVF9NQVgpIF9fcmVh
ZF9tb3N0bHk7Cj4gIC8qIFBlci1jcHUgSVNBIGV4dGVuc2lvbnMuICovCj4gIHN0cnVjdCByaXNj
dl9pc2FpbmZvIGhhcnRfaXNhW05SX0NQVVNdOwo+Cj4gK0RFRklORV9QRVJfQ1BVKHVuc2lnbmVk
IGxvbmcsIHJpc2N2X2NwdV9lbnZjZmcpOwo+ICsKPiAgLyogUGVyZm9ybWFuY2UgaW5mb3JtYXRp
b24gKi8KPiAgREVGSU5FX1BFUl9DUFUobG9uZywgbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQpOwo+
Cj4gQEAgLTk3OCw3ICs5ODAsNyBAQCBhcmNoX2luaXRjYWxsKGNoZWNrX3VuYWxpZ25lZF9hY2Nl
c3NfYWxsX2NwdXMpOwo+ICB2b2lkIHJpc2N2X3VzZXJfaXNhX2VuYWJsZSh2b2lkKQo+ICB7Cj4g
ICAgICAgICBpZiAocmlzY3ZfY3B1X2hhc19leHRlbnNpb25fdW5saWtlbHkoc21wX3Byb2Nlc3Nv
cl9pZCgpLCBSSVNDVl9JU0FfRVhUX1pJQ0JPWikpCj4gLSAgICAgICAgICAgICAgIGNzcl9zZXQo
Q1NSX0VOVkNGRywgRU5WQ0ZHX0NCWkUpOwo+ICsgICAgICAgICAgICAgICB0aGlzX2NwdV9vcihy
aXNjdl9jcHVfZW52Y2ZnLCBFTlZDRkdfQ0JaRSk7Cj4gIH0KPgo+ICAjaWZkZWYgQ09ORklHX1JJ
U0NWX0FMVEVSTkFUSVZFCj4gLS0KPiAyLjQzLjEKPgo+Cj4KPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3Vw
Lgo+IFZpZXcvUmVwbHkgT25saW5lICgjNjU5KTogaHR0cHM6Ly9saXN0cy5yaXNjdi5vcmcvZy90
ZWNoLWotZXh0L21lc3NhZ2UvNjU5Cj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLnJp
c2N2Lm9yZy9tdC8xMDUwMzM5MTQvNzMwMDk1Mgo+IEdyb3VwIE93bmVyOiB0ZWNoLWotZXh0K293
bmVyQGxpc3RzLnJpc2N2Lm9yZwo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLnJpc2N2Lm9y
Zy9nL3RlY2gtai1leHQvdW5zdWIgW2RlYnVnQHJpdm9zaW5jLmNvbV0KPiAtPS09LT0tPS09LT0t
PS09LT0tPS09LQo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
