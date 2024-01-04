Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A53C47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 12:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTq2hGK0ER3LzgPOi/B3euq9n/mfEieDzj9G4J4CvAY=; b=SoEV6km3ZuYvM4
	hVzanezwvYWD4D5fHK+AXzurezrW8XmlRf7TehpLpM+pMX7YW7YGE0CFciH6atmh0R4N3C8UBrtF0
	AVN5/tsm6J6JhPgTMrFeucWujLZqQc9an6faAQpEqKgyRt7by3klNA/QMKeyrjvSXFu3pPdfePUFB
	DJ23ryWYYhXEekkQIfc8gV3+FQjIqtGUBzNCwAARQ61NAkYVIUx0X5ciWqVmlfW4149MON4Of3Uu3
	MpQPrBOhR6VVBNmhd67+UYGP+ZVv+qkklrVODA1U5vdZ4ZuK8S/LcNr3vu1WfFpSpviaffAAG7MXg
	oR+jBeQ758tC+zzuezIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLN43-00E0Uz-1p;
	Thu, 04 Jan 2024 12:43:11 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLN40-00E0UN-2L
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 12:43:10 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-556ea884968so569732a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 04:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704372186; x=1704976986; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dSQx9QRDMQgMq2yHL+yy/8AmXFdHgPgzOIo1vsfuUU=;
        b=kjDFLTNwTSbjCrn4rQQGEoWNyOFLVewDyfc2t6Dnf0tZKbwuu/gd0XCWGwLbODqVSy
         Sadp05ZzOiYYODbizXEt0zDgzo+E+NoUpSMn3li7kd9CFX3M83SwSBH8XkGCPm7U2DLq
         IgX5GS0xmxbF5T9rB6MQ5iLhb2Fb6exh1qwjEVEL79LYfjvq2Q/wo09xQ1KwKPNbAlec
         AC7LnVq9xFKu1tuBTYOlqeV2S7r6cflzLMRJS/OrUzMJH8E95z+H/e5IFT3/9Nffh7Jb
         ZsOC1SdMg6MAMab1Juqu50oYdNFc+dPSazm46p1JQppkl4JF58UTJ/qUj3lRQP/jyusp
         sYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704372186; x=1704976986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dSQx9QRDMQgMq2yHL+yy/8AmXFdHgPgzOIo1vsfuUU=;
        b=MtOKH9qPUDAiRQi87XTt2WZf6yjs3HrVXc97fdX/1p+KU0DQhoHYO19esXFsIg7zbl
         Tjatc7VE9NmdR5FlocvYIJHfZZVPnFq9c0yZFYSuXvh5rYrDav5L2/8hSoPsEET5KsU+
         /4PMZLjjbok6M5wc/c+lUWZCtojUnN2rfiztxPniYv/oFtKQ8swmKdRbrHhC7xdhjNBE
         kSWLTDtmXI1xyFa0YKI2qPcx+REDKF5zNX3HUKIq/BewbXqvSV9UKpgZTG4gY7e0cLvx
         yE/8EOeGLwIQ4HNphf2PM+SCPuv9MyiIEcD4g75gAyq+3fvDsI50RswIdNUSLEcPv185
         3XuQ==
X-Gm-Message-State: AOJu0YwlICbidYFNrauy7FL5J0Qz4kKieVaRlBtofxl/Dep++cQ2jm/K
	G+zslkCUyMjJeECkAZs7rledXx4AiDZDV9zrSj4N3zNID35J9Q==
X-Google-Smtp-Source: AGHT+IGzNSA3TCDxL27scTROGs8Y4tvcclkYiXTrM5eUj0GjUWYmmvD17vNpJVXJzc/mg9PyWPWOFePUgd0YlvTpIno=
X-Received: by 2002:a17:906:7f0f:b0:a28:abf8:9bb5 with SMTP id
 d15-20020a1709067f0f00b00a28abf89bb5mr273455ejr.21.1704372186518; Thu, 04 Jan
 2024 04:43:06 -0800 (PST)
MIME-Version: 1.0
References: <20240102220134.3229156-1-samuel.holland@sifive.com> <20240102220134.3229156-10-samuel.holland@sifive.com>
In-Reply-To: <20240102220134.3229156-10-samuel.holland@sifive.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 4 Jan 2024 13:42:55 +0100
Message-ID: <CAHVXubg1=BuA+_BxPb_Q4B1hnN_DvVJ8wyJ_4KmFkU9qNQkWCw@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] riscv: mm: Use a fixed layout for the MM context ID
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_044308_784467_5D1256D1 
X-CRM114-Status: GOOD (  20.55  )
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

T24gVHVlLCBKYW4gMiwgMjAyNCBhdCAxMTowMeKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgdGhlIHNpemUgb2YgdGhl
IEFTSUQgZmllbGQgaW4gdGhlIE1NIGNvbnRleHQgSUQgZHluYW1pY2FsbHkKPiBkZXBlbmRzIG9u
IHRoZSBudW1iZXIgb2YgaGFyZHdhcmUtc3VwcG9ydGVkIEFTSUQgYml0cy4gVGhpcyByZXF1aXJl
cwo+IHJlYWRpbmcgYSBnbG9iYWwgdmFyaWFibGUgdG8gZXh0cmFjdCBlaXRoZXIgZmllbGQgZnJv
bSB0aGUgY29udGV4dCBJRC4KPiBJbnN0ZWFkLCBhbGxvY2F0ZSB0aGUgbWF4aW11bSBwb3NzaWJs
ZSBudW1iZXIgb2YgYml0cyB0byB0aGUgQVNJRCBmaWVsZCwKPiBzbyB0aGUgbGF5b3V0IG9mIHRo
ZSBjb250ZXh0IElEIGlzIGtub3duIGF0IGNvbXBpbGUtdGltZS4KPgo+IFNpZ25lZC1vZmYtYnk6
IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+IC0tLQo+Cj4gKG5v
IGNoYW5nZXMgc2luY2UgdjEpCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9tbXUuaCAgICAg
IHwgNCArKy0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDIgLS0KPiAg
YXJjaC9yaXNjdi9tbS9jb250ZXh0LmMgICAgICAgICAgIHwgNiArKy0tLS0KPiAgMyBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9tbXUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vbW11
LmgKPiBpbmRleCBhNTUwZmJmNzcwYmUuLmRjMDI3M2Y3OTA1ZiAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL21tdS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9t
bXUuaAo+IEBAIC0yNiw4ICsyNiw4IEBAIHR5cGVkZWYgc3RydWN0IHsKPiAgI2VuZGlmCj4gIH0g
bW1fY29udGV4dF90Owo+Cj4gLSNkZWZpbmUgY250eDJhc2lkKGNudHgpICAgICAgICAgICAgICAg
ICgoY250eCkgJiBhc2lkX21hc2spCj4gLSNkZWZpbmUgY250eDJ2ZXJzaW9uKGNudHgpICAgICAo
KGNudHgpICYgfmFzaWRfbWFzaykKPiArI2RlZmluZSBjbnR4MmFzaWQoY250eCkgICAgICAgICAg
ICAgICAgKChjbnR4KSAmIFNBVFBfQVNJRF9NQVNLKQo+ICsjZGVmaW5lIGNudHgydmVyc2lvbihj
bnR4KSAgICAgKChjbnR4KSAmIH5TQVRQX0FTSURfTUFTSykKPgo+ICB2b2lkIF9faW5pdCBjcmVh
dGVfcGdkX21hcHBpbmcocGdkX3QgKnBnZHAsIHVpbnRwdHJfdCB2YSwgcGh5c19hZGRyX3QgcGEs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBoeXNfYWRkcl90IHN6LCBwZ3Byb3Rf
dCBwcm90KTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gaW5kZXggZDk5MTM1OTBmODJl
Li41YmZkMzdjZmQ4YzMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJm
bHVzaC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gQEAgLTE1
LDggKzE1LDYgQEAKPiAgI2RlZmluZSBGTFVTSF9UTEJfTk9fQVNJRCAgICAgICAoKHVuc2lnbmVk
IGxvbmcpLTEpCj4KPiAgI2lmZGVmIENPTkZJR19NTVUKPiAtZXh0ZXJuIHVuc2lnbmVkIGxvbmcg
YXNpZF9tYXNrOwo+IC0KPiAgc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9hbGwo
dm9pZCkKPiAgewo+ICAgICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18gKCJzZmVuY2Uudm1hIiA6
IDogOiAibWVtb3J5Iik7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vY29udGV4dC5jIGIv
YXJjaC9yaXNjdi9tbS9jb250ZXh0LmMKPiBpbmRleCA0M2QwMDVmNjMyNTMuLmI1MTcwYWMxYjc0
MiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2NvbnRleHQuYwo+ICsrKyBiL2FyY2gvcmlz
Y3YvbW0vY29udGV4dC5jCj4gQEAgLTIyLDcgKzIyLDYgQEAgREVGSU5FX1NUQVRJQ19LRVlfRkFM
U0UodXNlX2FzaWRfYWxsb2NhdG9yKTsKPgo+ICBzdGF0aWMgdW5zaWduZWQgbG9uZyBhc2lkX2Jp
dHM7Cj4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIG51bV9hc2lkczsKPiAtdW5zaWduZWQgbG9uZyBh
c2lkX21hc2s7Cj4KPiAgc3RhdGljIGF0b21pY19sb25nX3QgY3VycmVudF92ZXJzaW9uOwo+Cj4g
QEAgLTEyOCw3ICsxMjcsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBfX25ld19jb250ZXh0KHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICAgICAgICAgICAgICAgICBnb3RvIHNldF9hc2lkOwo+Cj4g
ICAgICAgICAvKiBXZSdyZSBvdXQgb2YgQVNJRHMsIHNvIGluY3JlbWVudCBjdXJyZW50X3ZlcnNp
b24gKi8KPiAtICAgICAgIHZlciA9IGF0b21pY19sb25nX2FkZF9yZXR1cm5fcmVsYXhlZChudW1f
YXNpZHMsICZjdXJyZW50X3ZlcnNpb24pOwo+ICsgICAgICAgdmVyID0gYXRvbWljX2xvbmdfYWRk
X3JldHVybl9yZWxheGVkKEJJVChTQVRQX0FTSURfQklUUyksICZjdXJyZW50X3ZlcnNpb24pOwo+
Cj4gICAgICAgICAvKiBGbHVzaCBldmVyeXRoaW5nICAqLwo+ICAgICAgICAgX19mbHVzaF9jb250
ZXh0KCk7Cj4gQEAgLTI0Nyw3ICsyNDYsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBhc2lkc19pbml0
KHZvaWQpCj4gICAgICAgICAvKiBQcmUtY29tcHV0ZSBBU0lEIGRldGFpbHMgKi8KPiAgICAgICAg
IGlmIChhc2lkX2JpdHMpIHsKPiAgICAgICAgICAgICAgICAgbnVtX2FzaWRzID0gMSA8PCBhc2lk
X2JpdHM7Cj4gLSAgICAgICAgICAgICAgIGFzaWRfbWFzayA9IG51bV9hc2lkcyAtIDE7Cj4gICAg
ICAgICB9Cj4KPiAgICAgICAgIC8qCj4gQEAgLTI1NSw3ICsyNTMsNyBAQCBzdGF0aWMgaW50IF9f
aW5pdCBhc2lkc19pbml0KHZvaWQpCj4gICAgICAgICAgKiBhdC1sZWFzdCB0d2ljZSBtb3JlIHRo
YW4gQ1BVcwo+ICAgICAgICAgICovCj4gICAgICAgICBpZiAobnVtX2FzaWRzID4gKDIgKiBudW1f
cG9zc2libGVfY3B1cygpKSkgewo+IC0gICAgICAgICAgICAgICBhdG9taWNfbG9uZ19zZXQoJmN1
cnJlbnRfdmVyc2lvbiwgbnVtX2FzaWRzKTsKPiArICAgICAgICAgICAgICAgYXRvbWljX2xvbmdf
c2V0KCZjdXJyZW50X3ZlcnNpb24sIEJJVChTQVRQX0FTSURfQklUUykpOwo+Cj4gICAgICAgICAg
ICAgICAgIGNvbnRleHRfYXNpZF9tYXAgPSBiaXRtYXBfemFsbG9jKG51bV9hc2lkcywgR0ZQX0tF
Uk5FTCk7Cj4gICAgICAgICAgICAgICAgIGlmICghY29udGV4dF9hc2lkX21hcCkKPiAtLQo+IDIu
NDIuMAo+CgpZb3UgY2FuIGFkZDoKClJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhn
aGl0aUByaXZvc2luYy5jb20+CgpUaGFua3MsCgpBbGV4CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
