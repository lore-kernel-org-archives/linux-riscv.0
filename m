Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277ECCD3427
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 16:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4wGh5jjAWvEtIbO13aQ56GrJov9vGU2dE3Q38jN93U=; b=B9S5R8EJtsR3hF
	CpTXWri0BEhPw9nn80YKKO5SCj7yV6Bsu8stSg9dkbppvpnzVNcuueKPSlqxIU2hIGm8jPgdklebN
	wfO3EBc1thj22XjAFGqDWT6Y0AdWL88CkFyt/tKgB/kYlm87aVhcK3hpO3evqLIplYufa/KPPCWT/
	Sb/OkEUstI2mmW31qBatAXRKdlKJzGXYzcLAle5S9eKL1+S0pGZifPx2YH3q/FDo8oPPehgOA3Iu4
	1uXKdwJ5ndxIET8g0WhjfICLe1lj6iZg/WlhFX9UlMmk+6jDr+VdZgaYpJL4uDJ/c8cQzblzIHmf0
	+LrYLkqm2SczUfqc+kFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIk2-0000000GuWI-1ln9;
	Tue, 05 May 2026 16:35:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIk1-0000000GuVf-0Job
	for linux-riscv@bombadil.infradead.org;
	Tue, 05 May 2026 16:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PZwRlD35/Ni4eJ8ZVe6U+Aw5CsKjsJO0tLj7syFGyqI=; b=OKsESltNWbHLSb+cZPUanjk1vG
	VNNd46g/PCrWN2UD9kqAAoNUAyb0+yOKxzEpIW8XQizXPgsVJYTekUIEqJ5eVs7014/QBRWSLZCMO
	cKpbv1MwIl7qBJmPkQ2hg6UiouoiaVp4cA8rMFU5bTNvwxNKjff6TgpAO33EhGAsmNwChnjrqWzaK
	2YYd0Di930JGpwilR7qYdLhAKUKtoN+Nh0B717L6SDbGGuwenLS4WBZaY7oJN0OIYNAcNjaNn1HgB
	3FkgUmeMzeC8cCCoJhyshrlkoy98E/e3FzUfRRghnwZ3fMrSxsuPtu7HxCtwGdn3/M7KGMmsfEo/+
	MAE3E3oQ==;
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIjw-0000000E3Yk-05eG
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 16:35:24 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7de46b8e432so5144470a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 09:35:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777998917; cv=none;
        d=google.com; s=arc-20240605;
        b=E39r0nfj8krI5pPCpLUOPlIfm3YaJmL3yJ4kJvVyj1azj/D+3HgWg1Ri/VosJHkaK4
         xwWPr+c981DF5yiMEnqT0t9VynS0MHPZ5LkY25f4oTNaSy/v1yfeyLAmKF59TJqnlQDe
         4FjIMl3DAUxO1u6k/Hzi0AIENVORj4ktA+7vQYdLYGYK11Pgp3YQz9ew/Wpo/jiJyNPE
         FHgj0iln6IMi6b4BYZ0/2inz4RfahbTDJ6/NS4xqZKCfghDxfAiTZ0DRK7NZcm6rbz9p
         qndPvdms4RfT6WB0MOvW5lxxGWYe47y1KksLOt3hP/lm0osqM26CIgvzKPcwBd3hkeVq
         /z8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PZwRlD35/Ni4eJ8ZVe6U+Aw5CsKjsJO0tLj7syFGyqI=;
        fh=DvSp0xQGaYxf+lYkPCfqKZLiR6BRiXS+xxX+mubm3og=;
        b=Ad470JsUYcB0QIqTsXhvR96kelGxOFsZIjgDuQhRJjpbQIFgk6pDv3cpGZ1kAlGn0X
         VSwHBsgA92BzERTDuKXej0pKLb7Nzx4KTwq5oSQSdzGL44CTlGrMuz2/14RoR6jGrDUy
         XbvM3dMuuaLWF7J9OyeJOJk/pZxfFnaJZjCKfV/qlt4OSUDx8mZoeMXCT/+uYhATlmc7
         6/6RJm+YvkXadT9emP/O7Y/NKiQ/IayOEtN0DWkiio4W5Sa0BscyRjb3lC2L7+oh9gXt
         kO8XQeyYMNvjydFOz3KUHPUq05hlkEM5XCxaiBPXDmTMe1N47X6ORM3CXo9kWef8lEl+
         m3DQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1777998917; x=1778603717; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZwRlD35/Ni4eJ8ZVe6U+Aw5CsKjsJO0tLj7syFGyqI=;
        b=eYIQzeCZVM7klDdf+9M5125oyZ2nxadDrrtdclbPqsxR/HlEnF2mDtKYJmFP8WPc0X
         An+pd+lpzYAviSJ0xxdaZ2OOBNRZ5oXGfnI28TQEhPFzMV17im57brEaVeLWkzyifFWB
         tEeBIqtN6/wWJeA+jgfIspAs2qDH2gZUYJBvJE32ENChdbzghMaLo0QD4eEe2VvXYtNk
         kB3IHnmChhy6nf73P4jX6P0AWultPGD6u/sYvBuBQ1MiMzvBWLhQZFQ1Nu+fC5uKiTu4
         4/DwxsmLSHUuld2csFFjow/YckrjqxhxGwICGNs+5FS4BlxmaqS6uhQ1guX+4IqO2q2O
         YlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998917; x=1778603717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PZwRlD35/Ni4eJ8ZVe6U+Aw5CsKjsJO0tLj7syFGyqI=;
        b=XpEW+oX4ASzhPWu5IqwTu+OM8O/yCB09h5GcxLcHxpW8XGOWp9PdQamiDR5gvp3HH2
         34+NbzVxHte6Ej85V0AxnqG+WvhDf0tFNyrAhL21hh8wtJNpmpi8tXfuQ8vzfTB7g8SX
         UlSlsf85PcRIKyTwtE//QWVeQtRTXzxn3pyxBWe0j5GvxtMOPLeTQaTjUq9vFBX9NotI
         sdE4/iKDfprtzqfnNdTf1E3c78QT/QfpIbqztNvY6UYXaVSIYkggK9c6VGwPUkYJNt/S
         cAv9cOSPIPClAjQrFb1UaaFGMdtbXAd7exDV6nMnzkimiEzDi4sbiLnETPz2umnwbpSq
         2pKw==
X-Forwarded-Encrypted: i=1; AFNElJ8Fte2QWSdfEsekDKCHSNKwhHBgy0/A5tdIrcDW15g1HcRoXktIaxYqwzV1d6avRDz2Vkhnweoy+M8Dkg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs/ncN8liAVjSAiBO/uvU+knvnTDrHX1w0rayV2kyCc1Us060F
	KKp7KtxKvHHAfeWWji+ep12Ak/SGu2rFFGgOVg7t3ci6btzjSOP0VVTOzGRr+NdjrehbbECk7vr
	+HXt6vuLzQ1fdXPaQO7x3H3Lnn2k/iXrTmScFvPtt/g==
X-Gm-Gg: AeBDievBV89ilWeOYet70RHAQaczWxIdITT0gxA6PPbKRZAPXm0gLRbUnKD35uClCir
	JUtXfwbyKJuD5h3+qJdpHLQIY5usDEFOCU4dEEAeoYNAH11+VbkDpfPBCnC7mfiYlnz1pe/jgSP
	ksedWOmB9ggiEjfSsVKSE6JpWoJiJv45JcWvM74ZlFwY7bN68fSG3ayt2uSNNSEqWY+8xCxHHdc
	Rdh0tMll8dOR1jvPdHhJhD48P11s3c3dbeqjc3+r9kKijp5ZP4iy+GrbM8YB7bNecbWKwDzbkBA
	U+D+RE1AEDeJ14xxjw==
X-Received: by 2002:a05:6820:f001:b0:696:2cf3:3bc3 with SMTP id
 006d021491bc7-699981ea5efmr81275eaf.41.1777998915996; Tue, 05 May 2026
 09:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com> <6-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com>
In-Reply-To: <6-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 5 May 2026 09:35:04 -0700
X-Gm-Features: AVHnY4LPfK7qs4OtHxHKG0TGC_8I0pYYVtUUsANuSQbTNv8bjJdgyf0feiYrb7A
Message-ID: <CAH2o1u4opjWDL8pFTstYVYDbML4_hAgQm1D4NH6rR8=RyG=Vig@mail.gmail.com>
Subject: Re: [PATCH 6/7] iommu/riscv: Add RISCV_IOMMU_CAPABILITIES_NL
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Will Deacon <will@kernel.org>, Fangyu Yu <fangyu.yu@linux.alibaba.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_173520_134592_4176A911 
X-CRM114-Status: GOOD (  21.44  )
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

T24gRnJpLCBBcHIgMTAsIDIwMjYgYXQgODo1N+KAr0FNIEphc29uIEd1bnRob3JwZSA8amdnQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gTm9uLWxlYWYgaW52YWxpZGF0aW9uIGFsbG93cyB0aGUgc2lu
Z2xlIGludmFsaWRhdGUgY29tbWFuZCB0byBhbHNvCj4gY2xlYXIgdGhlIHdhbGsgY2FjaGUuIElm
IE5MIGlzIGF2YWlsYWJsZSwgc2V0IHRoZSBOTCBiaXQgaWYgdGhlCj4gZ2F0aGVyIGluZGljYXRl
cyB0YWJsZXMgaGF2ZSBiZWVuIGNoYW5nZWQuIFRoZSBzdHJpZGUgaXMgYWxyZWFkeQo+IGNhbGN1
bGF0ZWQgcHJvcGVybHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0Bu
dmlkaWEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWJpdHMuaCB8ICA3
ICsrKysrKysKPiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jICAgICAgfCAxMiArKysrKysr
LS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtYml0cy5oIGIvZHJp
dmVycy9pb21tdS9yaXNjdi9pb21tdS1iaXRzLmgKPiBpbmRleCAyOWEwMDQwYjFjMzJlYS4uZjAx
YjQ5YWM4MTU1ODYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1iaXRz
LmgKPiArKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWJpdHMuaAo+IEBAIC02Myw2ICs2
Myw3IEBACj4gICNkZWZpbmUgUklTQ1ZfSU9NTVVfQ0FQQUJJTElUSUVTX1BEOCAgICAgICAgICAg
QklUX1VMTCgzOCkKPiAgI2RlZmluZSBSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfUEQxNyAgICAg
ICAgICBCSVRfVUxMKDM5KQo+ICAjZGVmaW5lIFJJU0NWX0lPTU1VX0NBUEFCSUxJVElFU19QRDIw
ICAgICAgICAgIEJJVF9VTEwoNDApCj4gKyNkZWZpbmUgUklTQ1ZfSU9NTVVfQ0FQQUJJTElUSUVT
X05MICAgICAgICAgICAgQklUX1VMTCg0MikKPgo+ICAvKioKPiAgICogZW51bSByaXNjdl9pb21t
dV9pZ3Nfc2V0dGluZ3MgLSBJbnRlcnJ1cHQgR2VuZXJhdGlvbiBTdXBwb3J0IFNldHRpbmdzCj4g
QEAgLTQ3Myw2ICs0NzQsNyBAQCBzdHJ1Y3QgcmlzY3ZfaW9tbXVfY29tbWFuZCB7Cj4gICNkZWZp
bmUgUklTQ1ZfSU9NTVVfQ01EX0lPVElOVkFMX1BTQ1YgICAgICAgICAgQklUX1VMTCgzMikKPiAg
I2RlZmluZSBSSVNDVl9JT01NVV9DTURfSU9USU5WQUxfR1YgICAgICAgICAgICBCSVRfVUxMKDMz
KQo+ICAjZGVmaW5lIFJJU0NWX0lPTU1VX0NNRF9JT1RJTlZBTF9HU0NJRCAgICAgICAgIEdFTk1B
U0tfVUxMKDU5LCA0NCkKPiArI2RlZmluZSBSSVNDVl9JT01NVV9DTURfSU9USU5WQUxfTkwgICAg
ICAgICAgICBCSVRfVUxMKDM0KQo+ICAvKiBkd29yZDFbNjE6MTBdIGlzIHRoZSA0Sy1hbGlnbmVk
IHBhZ2UgYWRkcmVzcyAqLwo+ICAjZGVmaW5lIFJJU0NWX0lPTU1VX0NNRF9JT1RJTlZBTF9BRERS
ICAgICAgICAgIEdFTk1BU0tfVUxMKDYxLCAxMCkKPgo+IEBAIC03MjQsNiArNzI2LDExIEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCByaXNjdl9pb21tdV9jbWRfaW52YWxfc2V0X2FkZHIoc3RydWN0IHJp
c2N2X2lvbW11X2NvbW1hbmQgKmNtCj4gICAgICAgICBjbWQtPmR3b3JkMCB8PSBSSVNDVl9JT01N
VV9DTURfSU9USU5WQUxfQVY7Cj4gIH0KPgo+ICtzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3ZfaW9t
bXVfY21kX2ludmFsX3NldF9ubChzdHJ1Y3QgcmlzY3ZfaW9tbXVfY29tbWFuZCAqY21kKQo+ICt7
Cj4gKyAgICAgICBjbWQtPmR3b3JkMCB8PSBSSVNDVl9JT01NVV9DTURfSU9USU5WQUxfTkw7Cj4g
K30KPiArCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl9pb21tdV9jbWRfaW52YWxfc2V0X3Bz
Y2lkKHN0cnVjdCByaXNjdl9pb21tdV9jb21tYW5kICpjbWQsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHBzY2lkKQo+ICB7Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvcmlzY3Yv
aW9tbXUuYwo+IGluZGV4IGZkOWM1Mjk0ZGJjMDgyLi5lYTE0NjMwNDMwNDUxYSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiArKysgYi9kcml2ZXJzL2lvbW11L3Jp
c2N2L2lvbW11LmMKPiBAQCAtOTY2LDYgKzk2Niw4IEBAIHN0YXRpYyB2b2lkIHJpc2N2X2lvbW11
X2lvdGxiX2ludmFsX2lvbW11KHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11LAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBwc2NpZCwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcmlzY3ZfaW9tbXVf
dGxiaSAqdGxiaSkKPiAgewo+ICsgICAgICAgYm9vbCB1c2VfbmwgPSB0bGJpLT5ub25fbGVhZiAm
Jgo+ICsgICAgICAgICAgICAgICAgICAgICAoaW9tbXUtPmNhcHMgJiBSSVNDVl9JT01NVV9DQVBB
QklMSVRJRVNfTkwpOwo+ICAgICAgICAgc3RydWN0IHJpc2N2X2lvbW11X2NvbW1hbmQgY21kOwo+
ICAgICAgICAgdW5zaWduZWQgbG9uZyBpb3ZhOwo+ICAgICAgICAgdW5zaWduZWQgaW50IGk7Cj4g
QEAgLTk3NCwxNyArOTc2LDE3IEBAIHN0YXRpYyB2b2lkIHJpc2N2X2lvbW11X2lvdGxiX2ludmFs
X2lvbW11KHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11LAo+ICAgICAgICAgcmlzY3Zf
aW9tbXVfY21kX2ludmFsX3NldF9wc2NpZCgmY21kLCBwc2NpZCk7Cj4KPiAgICAgICAgIC8qCj4g
LSAgICAgICAgKiBXaGVuIG5vbi1sZWFmIHBhZ2UgdGFibGUgZW50cmllcyB3ZXJlIGNoYW5nZWQs
IHRoZSBiYXNlIHNwZWMKPiAtICAgICAgICAqIHJlcXVpcmVzIGEgZnVsbCBQU0NJRCBpbnZhbGlk
YXRpb24gKEFWPTApIHNpbmNlIHRoZXJlIGlzIG5vCj4gLSAgICAgICAgKiB3YXkgdG8gZG8gdGFy
Z2V0ZWQgbm9uLWxlYWYgaW52YWxpZGF0aW9uIHdpdGhvdXQgdGhlIE5MCj4gLSAgICAgICAgKiBl
eHRlbnNpb24uIEZvcmNlIGdsb2JhbCBpbnZhbGlkYXRpb24gdG8gcHJlc2VydmUgY29ycmVjdG5l
c3MuCj4gKyAgICAgICAgKiBJZiBub24tbGVhZiBlbnRyaWVzIHdlcmUgY2hhbmdlZCBhbmQgdGhl
IElPTU1VIGRvZXNuJ3QKPiArICAgICAgICAqIHN1cHBvcnQgTkwsIHdlIG11c3QgZmFsbCBiYWNr
IHRvIGdsb2JhbCBpbnZhbGlkYXRpb24gKEFWPTApLgo+ICAgICAgICAgICovCj4gLSAgICAgICBp
ZiAodGxiaS0+c2luZ2xlLnVzZV9nbG9iYWwgfHwgdGxiaS0+bm9uX2xlYWYpCj4gKyAgICAgICBp
ZiAodGxiaS0+c2luZ2xlLnVzZV9nbG9iYWwgfHwgKHRsYmktPm5vbl9sZWFmICYmICF1c2Vfbmwp
KQo+ICAgICAgICAgICAgICAgICBnb3RvIGdsb2JhbDsKPgo+ICAgICAgICAgaW92YSA9IHRsYmkt
PnN0YXJ0Owo+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IHRsYmktPnNpbmdsZS5udW07IGkrKykg
ewo+ICAgICAgICAgICAgICAgICByaXNjdl9pb21tdV9jbWRfaW52YWxfc2V0X2FkZHIoJmNtZCwg
aW92YSk7Cj4gKyAgICAgICAgICAgICAgIGlmICh1c2VfbmwpCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmlzY3ZfaW9tbXVfY21kX2ludmFsX3NldF9ubCgmY21kKTsKPiAgICAgICAgICAgICAg
ICAgcmlzY3ZfaW9tbXVfY21kX3NlbmQoaW9tbXUsICZjbWQpOwo+ICAgICAgICAgICAgICAgICBp
b3ZhICs9IDFVTEwgPDwgdGxiaS0+c2luZ2xlLnN0cmlkZV9sZzI7Cj4gICAgICAgICB9Cj4gLS0K
PiAyLjQzLjAKPgoKUmV2aWV3ZWQtYnk6IFRvbWFzeiBKZXpuYWNoIDx0amV6bmFjaEByaXZvc2lu
Yy5jb20+CgpUaGFuayB5b3UsCi0gVG9tYXN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
