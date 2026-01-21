Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5659D262B2
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 07:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m05fp2qSBSPLZGzQi3Csvc6xkUqPTvtBb/820kqkWHo=; b=gyvPJ0oREnQgFe
	wOUflJpRMLBYj7FWGlhKeR6ly4OEeDSV8PmE7v5D41Gmxn6/pLwsRgPgw1ub+9pNUYTDyaGYjWDIT
	dJ1CgUE5aAPNR00vhdxZWaAS6XjsifKgAuC7QoAvFYiR6gkB1hL6PbylW5AaKBzti0DAedIlZUVb1
	600EN4gAiP4cmsy98ZnVZda5y8sRkLKyU1Mo/U/DWD1U8xyY1rfQsr7INWndZJ85UatiK9fwFLyr1
	3qkIJMPUGjnMUCsci95/N45/6a5+4OcQYrs35WZUnz99CrXu2fhiKXhvdRhF227ouXsZiYzuKC0SL
	6csXhguzsPhxDYjAb8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSEF-00000004yx6-0KaI;
	Wed, 21 Jan 2026 07:02:11 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSEC-00000004ywk-0ITa
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 07:02:09 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b8719aeebc8so1017318966b.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 23:02:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768978925; cv=none;
        d=google.com; s=arc-20240605;
        b=X6YvDwcGHjLeFZwOI2Hl2fFyallh6txpjt2W21WEdHzccckQ9+4YQWM08/aMwdVWaX
         fU5rKqcdIOL2lEj/pAkE0FB3f9g1cIxTRFk+ksMKtfaqCTk4n9aqoQG6U8ldiCxMRqtU
         scImPnoT6jHfTxBWN6giUBbAtyMuAbH1/unXIAZb55kfWDFXbG2ezQCojnTU1k066P2q
         fgSL98zgZg0rP8rTAmPLxhzH3o0xZLubIps+7FYhfVPRyfo81AQFgHipO8PhNvCfGXmQ
         T5wyERBHbCbU+3RxIa2dXo0/Yu2GM5fWSEMaCDIBQ9bNp6y9FPhfKxVkl8pPNYgkFnia
         QuLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3O/J2nA0SN6b+O4h+jjE++lw2feW9tn6sTNGeR94Dk=;
        fh=IM+4aqHDdZuCvxLoxsoO4W+W8PSQjeIauN10tO85Q8k=;
        b=h2leHJlo/RH8243AHksNSdN1XENLT1H4X9QcIB+gH5ZYOYutqP26r6SujPlIZF1FLD
         URst+VHxDDPzoiWYXCjhVr+Uq7SXtuLpTCPJlwdpOV9oPgGrrGPCyMsZdUAc3DPtTt1j
         pxbuP4kgjmrKBdXqp2MUL7kKN32dPvFX+5xFSCnfDVVwFiE1lI4b/2ZhTDQEleEBc8X+
         /PSpQ42AXcLqWtznthOHXYxGCI3CGAp/UUKwkDggi9ebp4jyfXfvTNiJzPFyIUX0g7Y/
         H4AZ87YAY6r/pnkS4ZCwI3j4ac+MAjvXZtSzEJVUtBvNh/ZnoKk2G1yMOqzJWig9kvWt
         0BdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768978925; x=1769583725; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3O/J2nA0SN6b+O4h+jjE++lw2feW9tn6sTNGeR94Dk=;
        b=BzybempNOEl3IdKzuVF9FoTv/s0yn2fx5tsLjjILF+xAjzZ12A3KmvnI/TMW9nueYl
         SPDTZmGOr9Ox/KT9BUw9/M2jmCA5X/gNa3BQB4zo4CMQiy5QgJzz97U+vKJfKVGSh6c5
         /rGKh629ZtDIwYZ4P9WgBIjsx7y2F6NSHjIg99jMte/WOkM2fjZCOshrEiy60q9kdbf0
         WphZdzW3WONyn3yydUqe7GOm1scBOrXVPz+G9A2xgUPC7diW2n3VTlmxLxLkQ6bu2Ra0
         sstcAulZfqKCRgFQnJAM+G1+vrCZBNW+Y4dduEXaCXZlGPpXzZNa0y8bSmU9gV5H+kEc
         doYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768978925; x=1769583725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s3O/J2nA0SN6b+O4h+jjE++lw2feW9tn6sTNGeR94Dk=;
        b=LlBvnnJisuQhUmrVgGP3idhs0xsZp57V8AKHYl61CXopnK1QxK5chU8juleJ/5HAHb
         vMnwY1gx2uouTlvC0wkQ5mqHfmTAuwm9/V1TUv20dL6UJPR9sHJWnOqQ9tHEoel5btGR
         /yq3dLtAUdANbgqX5pl+D/Z1GTNC4dMxpxrMGDR65muRjMB1I9WVZcuWKpOKgInjJIT/
         Gb4rSIAyx3mT+2SINIKngNdwjog9r9jOeWvN1R+U8slCc6Jod3D/7JkZg8Q4nhD4lCo7
         UlwtTm0NoRrhi9u3Thiy9GaqAmgqPlXg+KpupTNjvLlFkz94Aq3khFOmsJFfPb3BSQnB
         PiqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi8lZhcr/66s1hjHllCjfeVzFrak0YXojpYCRaRpvWWBXwv4nNBXPyQEOUiTTIqeU/Tj8/6lwK0qNbrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtTa2WQvV+0Y/G64bCqV+uQ+iTVLJowzcATSyyrnAb2DJdA0KP
	8rOT+7GLqoFVABFwp7mdv1s7CUIhzvyzLbU8UUGsIfV1Up9KH5B92wdeGr7DnNehnP+WHXZhY/7
	o44i0WoxW/+iY9DGjCwgmhCOPCv4p99M=
X-Gm-Gg: AZuq6aLENpWx7sLqhSz/VoabUpGnHSwp4vsyJUzkRLPYaR3txLQe/fISw2lqiHILIm1
	sufoxbxUvcwQRbUWQPeh88jaDVb6OEPp17J7gQYohvnf1ElJOeXJzS2gtVYl4w1A680u/+Zs2li
	u1nLguDkWBYjKLhWcgOtgkZXattMYRuw5LD2/aFajm7MDpOGT203AzINFMPcUxrGpV49XK2Gv4H
	Wit5zWVSuawcvJu5vD2DkJp11qvNEOpbD+dwDq00Ks998adick3GCSrEuogvk3GoiOc4LmB2eZ6
	p/q2ovwRs/9XpHOrDspa2yD0e3eoBsN0+vMVCxEYCoZ7c8eJN0m4zyWunS94Q98Q2w9g6PaFnZH
	GXGiZnpGbqiiuV5mW4g==
X-Received: by 2002:a17:907:da16:b0:b87:6:3727 with SMTP id
 a640c23a62f3a-b8792fc4039mr1645039266b.48.1768978925222; Tue, 20 Jan 2026
 23:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20260120065852.166857-1-jiangfeng@kylinos.cn> <aW8whGcAR0x6FSRJ@smile.fi.intel.com>
 <691a0183-6f41-4956-82da-abb69a449919@kylinos.cn>
In-Reply-To: <691a0183-6f41-4956-82da-abb69a449919@kylinos.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Jan 2026 09:01:29 +0200
X-Gm-Features: AZwV_Qj-gl6KU_wQTKIZD06mimAL52HHE9k8M9Cv2RjPGuQJhzCJn0zfBmXFHnU
Message-ID: <CAHp75Ve_pyVm430FL=aEAw1Cnf-92T3Y23qh7pEOaMYMp9iyvw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] riscv: optimize string functions and add kunit tests
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, akpm@linux-foundation.org, 
	kees@kernel.org, andy@kernel.org, ebiggers@kernel.org, 
	martin.petersen@oracle.com, ardb@kernel.org, charlie@rivosinc.com, 
	conor.dooley@microchip.com, ajones@ventanamicro.com, linus.walleij@linaro.org, 
	nathan@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_230208_141278_ABE45AF1 
X-CRM114-Status: GOOD (  25.40  )
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

T24gV2VkLCBKYW4gMjEsIDIwMjYgYXQgODo0NOKAr0FNIEZlbmcgSmlhbmcgPGppYW5nZmVuZ0Br
eWxpbm9zLmNuPiB3cm90ZToKPiBPbiAyMDI2LzEvMjAgMTU6MzYsIEFuZHkgU2hldmNoZW5rbyB3
cm90ZToKPiA+IE9uIFR1ZSwgSmFuIDIwLCAyMDI2IGF0IDAyOjU4OjQ0UE0gKzA4MDAsIEZlbmcg
Smlhbmcgd3JvdGU6CgouLi4KCj4gPj4gUGVyZm9ybWFuY2UgU3VtbWFyeSAoSW1wcm92ZW1lbnQg
JSk6Cj4gPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gPj4gRnVuY3Rpb24gIHwgIDE2IEIgKFNob3J0KSB8ICA1MTIgQiAo
TWlkKSB8ICA0MDk2IEIgKExvbmcpCj4gPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPj4gc3RybmxlbiAgIHwgICAgKzY0
LjAlICAgICB8ICAgKzM0Ni4yJSAgICB8ICAgICs0MTAuNyUKPiA+Cj4gPiBUaGlzIGlzIHN0aWxs
IHN1c3BpY2lvdXMuCj4KPiBSZWdhcmRpbmcgdGhlICs0MTAlIGdhaW4sIGl0IGJlY29tZXMgY2xl
YXJlciB3aGVuIGxvb2tpbmcgYXQgdGhlIGlubmVyIGxvb3Agb2YgdGhlCj4gWmJiIGltcGxlbWVu
dGF0aW9uIChodHRwczovL2RvY3MucmlzY3Yub3JnL3JlZmVyZW5jZS9pc2EvdW5wcml2L2Itc3Qt
ZXh0Lmh0bWwjemJiKS4KPiBGb3IgYSA2NC1iaXQgc3lzdGVtLCB0aGUgY29yZSBsb29wIHVzZXMg
b25seSA1IGluc3RydWN0aW9ucyB0byBwcm9jZXNzIDggYnl0ZXMuCj4gTm90ZSB0aGF0IHQzIGlz
IHByZS1sb2FkZWQgd2l0aCAtMSAoMHhGRkZGRkZGRkZGRkZGRkZGKToKPgo+IDE6Cj4gICAgIFJF
R19MICAgdDEsIFNaUkVHKHQwKSAgICAgIC8qIExvYWQgOCBieXRlcyAqLwo+ICAgICBhZGRpICAg
IHQwLCB0MCwgU1pSRUcgICAgICAvKiBBZHZhbmNlIHBvaW50ZXIgKi8KPiAgICAgb3JjLmIgICB0
MSwgdDEgICAgICAgICAgICAgLyogQml0d2lzZSBPUi1Db21iaW5lOiAweDAwIGJlY29tZXMgMHgw
MCwgb3RoZXJzIDB4RkYgKi8KPiAgICAgYmdldSAgICB0MCwgdDQsIDRmICAgICAgICAgLyogQm91
bmRhcnkgY2hlY2sgKG1heF9sZW4pICovCj4gICAgIGJlcSAgICAgdDEsIHQzLCAxYiAgICAgICAg
IC8qIElmIHQxID09IDB4RkZGRkZGRkZGRkZGRkZGRiAobm8gTlVMKSwgbG9vcCAqLwo+Cj4gSW4g
Y29udHJhc3QsIHRoZSBnZW5lcmljIEMgaW1wbGVtZW50YXRpb24gcGVyZm9ybXMgYnl0ZS1ieS1i
eXRlIGNvbXBhcmlzb25zLCB3aGljaCBpbnZvbHZlcwo+IHNpZ25pZmljYW50bHkgbW9yZSBsb2Fk
cyBhbmQgYnJhbmNoZXMgZm9yIGV2ZXJ5IHNpbmdsZSBieXRlIHByb2Nlc3NlZC4gVGhlIFpiYiBh
cHByb2FjaCBpcwo+IG11Y2ggbGVhbmVyOiB0aGUgb3JjLmIgaW5zdHJ1Y3Rpb24gY29sbGFwc2Vz
IHRoZSBOVUwtY2hlY2sgZm9yIGFuIGVudGlyZSA4LWJ5dGUgd29yZCBpbnRvIGEKPiBzaW5nbGUg
c3RlcC4gQnkgc2hpZnRpbmcgZnJvbSBhIGJ5dGUtb3JpZW50ZWQgbG9vcCB0byB0aGlzIGhhcmR3
YXJlLWFjY2VsZXJhdGVkIHdvcmQtYXQtYS10aW1lCj4gbG9naWMsIHdlIGRyYXN0aWNhbGx5IHJl
ZHVjZSB0aGUgaW5zdHJ1Y3Rpb24gY291bnQgYW5kIGJyYW5jaCBvdmVyaGVhZCwgd2hpY2ggZXhw
bGFpbnMgdGhlCj4gbWFzc2l2ZSBqdW1wIGluIFRDRyB0aHJvdWdocHV0IGZvciBsb25nIHN0cmlu
Z3MuCj4KPiBCZXlvbmQgdGhlIG1haW4gbG9vcCwgdGhlIFpiYiBpbXBsZW1lbnRhdGlvbiBhbHNv
IHV0aWxpemVzIGN0eiAoQ291bnQgVHJhaWxpbmcgWmVyb3MpCj4gdG8gaGFuZGxlIHRoZSB0YWls
IGFuZCBhbGlnbm1lbnQuIE9uY2Ugb3JjLmIgaWRlbnRpZmllcyBhIE5VTCBieXRlIHdpdGhpbiBh
IHJlZ2lzdGVyLAo+IHdlIGNhbiBwcmVjaXNlbHkgbG9jYXRlIGl0cyBwb3NpdGlvbiBpbiBqdXN0
IHR3byBpbnN0cnVjdGlvbnM6Cj4KPiAgICAgbm90ICAgICB0MSwgdDEgICAgICAgICAgICAgLyog
RmxpcCBiaXRzOiBOVUwgYnl0ZSAoMHgwMCkgYmVjb21lcyAweEZGICovCj4gICAgIGN0eiAgICAg
dDEsIHQxICAgICAgICAgICAgIC8qIENvdW50IGJpdHMgYmVmb3JlIHRoZSBmaXJzdCBOVUwgYnl0
ZSAqLwo+ICAgICBzcmxpICAgIHQxLCB0MSwgMyAgICAgICAgICAvKiBEaXZpZGUgYnkgOCB0byBn
ZXQgYnl0ZSBvZmZzZXQgKi8KPgo+IEluIGEgZ2VuZXJpYyBDIGltcGxlbWVudGF0aW9uLCBjYWxj
dWxhdGluZyB0aGlzIGJ5dGUgb2Zmc2V0IHR5cGljYWxseSByZXF1aXJlcyBhIHNlcmllcwo+IG9m
IHNoaWZ0cywgbWFza3MsIG9yIGEgc3ViLWxvb3AsIHdoaWNoIGFkZHMgc2lnbmlmaWNhbnQgb3Zl
cmhlYWQuIEJ5IGNvbWJpbmluZyBvcmMuYiBhbmQKPiBjdHosIHdlIGVsaW1pbmF0ZSBhbGwgYnJh
bmNoaW5nIGFuZCBsb29rdXAgdGFibGVzIGZvciB0aGUgdGFpbC1lbmQgY2FsY3VsYXRpb24sIGZ1
cnRoZXIKPiBjb250cmlidXRpbmcgdG8gdGhlIHBlcmZvcm1hbmNlIGdhaW5zIG9ic2VydmVkIGlu
IHRoZSBiZW5jaG1hcmtzLgo+Cj4gPj4gc3RyY2hyICAgIHwgICAgKzQuMCUgICAgICB8ICAgKzYu
NCUgICAgICB8ICAgICsxLjUlCj4gPj4gc3RycmNociAgIHwgICAgKzYuNiUgICAgICB8ICAgKzIu
OCUgICAgICB8ICAgICswLjAlCj4KPiBBcyBmb3Igc3RyY2hyKCkgYW5kIHN0cnJjaHIoKSwgdGhl
IHJlbGF0aXZlbHkgbW9kZXN0IGltcHJvdmVtZW50cyBhcmUgYmVjYXVzZSB0aGUgY3VycmVudAo+
IHZlcnNpb25zIGluIHRoaXMgc2VyaWVzIGFyZSBpbXBsZW1lbnRlZCB1c2luZyBzaW1wbGUgYnl0
ZS1ieS1ieXRlIGFzc2VtYmx5LiBUaGVzZSBwcmltYXJpbHkKPiBnYWluIHBlcmZvcm1hbmNlIGJ5
IHJlZHVjaW5nIGZ1bmN0aW9uIGNhbGwgb3ZlcmhlYWQgYW5kIGVsaW1pbmF0aW5nIHN0YWNrIGZy
YW1lIG1hbmFnZW1lbnQKPiBjb21wYXJlZCB0byB0aGUgZ2VuZXJpYyBDIHZlcnNpb24uCj4KPiBV
bmxpa2Ugc3RybmxlbigpLCB0aGV5IGRvIG5vdCB5ZXQgdXRpbGl6ZSBaYmIgZXh0ZW5zaW9ucy4g
SSBwbGFuIHRvIGludHJvZHVjZSBaYmItb3B0aW1pemVkCj4gdmVyc2lvbnMgZm9yIHRoZXNlIGZ1
bmN0aW9ucyBpbiBhIGZ1dHVyZSBwYXRjaCBzZXQsIHdoaWNoIEkgZXhwZWN0IHdpbGwgYnJpbmcg
cGVyZm9ybWFuY2UKPiBnYWlucyBzaW1pbGFyIHRvIHdoYXQgd2Ugbm93IHNlZSB3aXRoIHN0cm5s
ZW4oKS4KClRoYW5rcyBmb3IgdGhlIGRldGFpbHMgcmVnYXJkaW5nIHRoZSBhc3NlbWJseSBuYXRp
dmUgaW1wbGVtZW50YXRpb24uCgo+ID4+IHdvcmQtYXQtYS10aW1lIGxvZ2ljLCBzaG93aW5nIHNp
Z25pZmljYW50IGdhaW5zIGFzIHRoZSBzdHJpbmcgbGVuZ3RoCj4gPj4gaW5jcmVhc2VzLgo+ID4K
PiA+IEhtbS4uLiBIYXZlIHlvdSB0cmllZCB0byBvcHRpbWlzZSB0aGUgZ2VuZXJpYyBpbXBsZW1l
bnRhdGlvbiB0byB1c2UKPiA+IHdvcmQtYXQtYS10aW1lIGxvZ2ljIGFuZCBjb21wYXJlPwo+Cj4g
UmVnYXJkaW5nIHRoZSBnZW5lcmljIGltcGxlbWVudGF0aW9uLCBldmVuIGlmIHdlIHdlcmUgdG8g
b3B0aW1pemUgdGhlIEMgY29kZQo+IHRvIHVzZSB3b3JkLWF0LWEtdGltZSBsb2dpYyAodGhlIGhh
c196ZXJvKCkgc3R5bGUgYml0LW1hbmlwdWxhdGlvbiksIGl0IHN0aWxsCj4gd291bGRuJ3QgbWF0
Y2ggdGhlIFpiYiB2ZXJzaW9uJ3MgZWZmaWNpZW5jeS4KPgo+IFRoZSB0cmFkaXRpb25hbCBDLWJh
c2VkIHdvcmQtbGV2ZWwgZGV0ZWN0aW9uIHJlcXVpcmVzIGEgc2VxdWVuY2Ugb2YgYXJpdGhtZXRp
Ywo+IG9wZXJhdGlvbnMgdG8gaWRlbnRpZnkgTlVMIGJ5dGVzLiBJbiBjb250cmFzdCwgdGhlIFJJ
U0MtViBvcmMuYiBpbnN0cnVjdGlvbgo+IGNvbGxhcHNlcyB0aGlzIGVudGlyZSBjaGVjayBpbnRv
IGEgc2luZ2xlIGhhcmR3YXJlIGN5Y2xlLiBJJ3ZlIGZvY3VzZWQgb24gdGhpcwo+IGFyY2hpdGVj
dHVyYWwgYXBwcm9hY2ggdG8gZnVsbHkgbGV2ZXJhZ2UgdGhlc2Ugc3BlY2lmaWMgWmJiIGZlYXR1
cmVzLCB3aGljaAo+IHByb3ZpZGVzIGEgbGV2ZWwgb2YgaW5zdHJ1Y3Rpb24gZGVuc2l0eSB0aGF0
IGdlbmVyaWMgQyBtYXRoIGNhbm5vdCBhY2hpZXZlLgoKSSB1bmRlcnN0YW5kIHRoYXQuIE15IHBv
aW50IGlzIGlmIHdlIG1vdmUgdGhlIGdlbmVyaWMgaW1wbGVtZW50YXRpb24KdG8gdXNlIHdvcmQt
YXQtYS10aW1lIHRlY2huaXF1ZSB0aGUgZGlmZmVyZW5jZSBzaG91bGQgbm90IGdvIDR4LApyaWdo
dD8gUGVyaGFwcyAxLjV4IG9yIHNvLiBJIGJlbGlldmUgdGhpcyB3aWxsIGJlIGEgdmVyeSB1c2Vm
dWwKZXhlcmNpc2UuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
