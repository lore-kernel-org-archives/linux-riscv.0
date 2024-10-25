Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936BED149D7
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 16:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKELYpyMTvXy39S0SZLHL4mMiX3XiKwK3zwS5EAmMs8=; b=rfiEakfme7DIEM
	B//41PpKSFC4hZi1HMx3DLP/vDVGu1h74bTi/n/tjOaI6Dj24qifoKzzSDwpp3aF8VikFSXNT9HQA
	RS2t27gbbNR8Yk5MTLUBxeRxohXmuWq2vg3J+0Fk6BqteDnPRsnLHCWe0BEsCnsBY5jld9TVXR10F
	QiOocsBWAvHXim6+XSIGL4p9xUedNAwnS8t75wnxjsw0DIxHjaggANl4gsR/jvVJ2+BxsdFMP92rM
	j0dBET6GTpQJ+7NYbUaCNgRbsFxfB5T6Jo8bQmgkZqJH3EtFiIkUeC9sbUDOhDPNZqdW3n0KDeHfz
	1BRAfwgPNqcgGi0xz7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ndc-00000004VT4-1m4X;
	Fri, 25 Oct 2024 16:58:12 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NdY-00000004VQg-2VOb
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 16:58:11 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fb443746b8so23829391fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Oct 2024 09:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729875486; x=1730480286; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnNtZV1Nj+ZplC7sJE1rA3hnVfsCt9+YnjfLdsGByNU=;
        b=VfxAOHVmslc8i7IWEfvvwsPvI6vlX/IdQrWrrimVnueNszpzbPM+zbSR7HCadBHpyS
         ARAc/hzgLGPwT1ZLSTqYp2uyAiiQbpC07gvExCmJFlGgz1RYYjtY9+Iy0PmhWiJOW9h3
         bkb0T0rBnedNUyVb63zkBULzoJTuVd3zTEm3kOklbP7Qe0jnVDExSFSif1nP201IGnIy
         K8jlrtFf0X1E2q6LsI5D0U9ua3qyIhJkQq3n2Re4XFehMuUFZnty+qB8EVfXxA4zYTE7
         qVeqUeQYgBS++9UviVZW7G3miinNZ8PriF4itdT5eQ2Lp1CpnnqMu4oGz4ICHxwDsh90
         A84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729875486; x=1730480286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnNtZV1Nj+ZplC7sJE1rA3hnVfsCt9+YnjfLdsGByNU=;
        b=fFY7tI/JDtOP04fFJTEkBTsq8da/t4Z/AusP2gI+ugLKbUf3AdvV8xnPoXHllaL3Zw
         mHmMZM67XTlb/4krdXowbwdAD30RbgqB0XNrtW0BJFE1Sxm+/ywlyPl9lxWNH5z5nJll
         WhvQDrdw40hYIavw9okbz+3rq6qTisKoy0AmE2fEo4baX0xzT13xcYcKg9ta4g+vfHuD
         GH4qS7u5GKM7wzCBJh1Ch5jUorpjxMyWLNJgfMegHby/uQgIDXCXOJ3xjEohNh5aTwSX
         +5tGwW7qnTDrlvVQJ5UtCTBf9jhESLb+vsFReGslKIMjGdcho1ht3uRaIG3ohGK2cibp
         3ysA==
X-Forwarded-Encrypted: i=1; AJvYcCU/aO9eMIky0k86vXIPqeLoWTB2DnzXe3cAAGNHmTnm/seYLjNqSft1atD6FOS9GxUzrH8hTSzqUENTBw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy6GpnUAX7s/pUH/eulYY0jEVtbZsPC5HpFtZ69+Dx2eByklK7
	LAj6fcnqBIG0wjHEiy0LPzUmjNYLDtfWnXnquDkr5NzSTnTJ3KhJ+SD2B0IYRIFekrdrQchgR45
	xDRcmdBA1DvNQ59KthhuWaotfZ846M4KmmSAEWA==
X-Google-Smtp-Source: AGHT+IGkuarMMIQ+lexEInGHQT599Zcgs3u7VHe9+e328XtdhOpOUCnZpi5ObKnAGmst12pwrMUGM9L80YD5HY+KpX8=
X-Received: by 2002:a2e:d12:0:b0:2fb:3a12:a582 with SMTP id
 38308e7fff4ca-2fca8227c1emr34732541fa.23.1729875485826; Fri, 25 Oct 2024
 09:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241020194734.58686-1-apatel@ventanamicro.com>
In-Reply-To: <20241020194734.58686-1-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 25 Oct 2024 22:27:54 +0530
Message-ID: <CAK9=C2VS6=azRSqXmkuFfp+65s4PUe+GbcTrYwLxQwfB4iB4_Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] Accelerate KVM RISC-V when running as a guest
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_095808_686533_0CE9BDD2 
X-CRM114-Status: GOOD (  18.00  )
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

T24gTW9uLCBPY3QgMjEsIDIwMjQgYXQgMToxN+KAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoZSBLVk0gUklTQy1WIGh5cGVydmlzb3IgbWlnaHQg
YmUgcnVubmluZyBhcyBhIGd1ZXN0IHVuZGVyIHNvbWUgb3RoZXIKPiBob3N0IGh5cGVydmlzb3Ig
aW4gd2hpY2ggY2FzZSB0aGUgY29tcGxldGUgSC1leHRlbnNpb24gZnVuY3Rpb25hbGl0eSB3aWxs
Cj4gYmUgdHJhcC1uLWVtdWxhdGVkIGJ5IHRoZSBob3N0IGh5cGVydmlzb3IuIEluIHRoaXMgY2Fz
ZSwgdGhlIEtWTSBSSVNDLVYKPiBwZXJmb3JtYW5jZSBjYW4gYmUgYWNjZWxlcmF0ZWQgdXNpbmcg
dGhlIFNCSSBuZXN0ZWQgYWNjZWxlcmF0aW9uIChOQUNMKQo+IGV4dGVuc2lvbiBpZiB0aGUgaG9z
dCBoeXBlcnZpc29yIHByb3ZpZGVzIGl0Lgo+Cj4gVGhlc2Ugc2VyaWVzIGV4dGVuZHMgS1ZNIFJJ
U0MtViB0byB1c2UgU0JJIE5BQ0wgZXh0ZW5zaW9uIHdoZW5ldmVyCj4gdW5kZXJseWluZyBTQkkg
aW1wbGVtZW50YXRpb24gKGFrYSBob3N0IGh5cGVydmlzb3IpIHByb3ZpZGVzIGl0Lgo+Cj4gVGhl
c2UgcGF0Y2hlcyBjYW4gYWxzbyBiZSBmb3VuZCBpbiB0aGUgcmlzY3Zfc2JpX25lc3RlZF92MiBi
cmFuY2ggYXQ6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvbGludXguZ2l0Cj4KPiBUbyB0
ZXN0IHRoZXNlIHBhdGNoZXMsIHJ1biBLVk0gUklTQy1WIGFzIEd1ZXN0IHVuZGVyIGxhdGVzdCBY
dmlzb3IKPiBmb3VuZCBhdDogaHR0cHM6Ly9naXRodWIuY29tL3h2aXNvci94dmlzb3IuZ2l0Cj4K
PiBGb3IgdGhlIHN0ZXBzIHRvIHRlc3Qgb24gWHZpc29yLCByZWZlciB0aGUgWHZpc29yIGRvY3Vt
ZW50YXRpb24KPiA8eHZpc29yX3NvdXJjZT4vZG9jcy9yaXNjdi9yaXNjdjY0LXFlbXUudHh0IHdp
dGggdHdvIHNtYWxsIGNoYW5nZXM6Cj4KPiAxKSBJbiBzdGVwIzExLCBtYWtlIHN1cmUgY29tcHJl
c3NlZCBrdm0ua28sIGd1ZXN0IGtlcm5lbCBpbWFnZSwgYW5kCj4gICAga3ZtdG9vbCBhcmUgcHJl
c2VudCBpbiB0aGUgcm9vdGZzLmltZwo+IDIpIEluIHN0ZXAjMTQsIG1ha2Ugc3VyZSBBSUEgaXMg
YXZhaWxhYmxlIHRvIFh2aXNvciBieSB1c2luZwo+ICAgICJ2aXJ0LGFpYT1hcGxpYy1pbXNpYyIg
YXMgdGhlIFFFTVUgbWFjaGluZSBuYW1lLgo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAgLSBEcm9w
cGVkIG5hY2xfc2htZW1fZmFzdCgpIG1hY3JvIGZyb20gUEFUQ0g4Cj4gIC0gQWRkZWQgY29tbWVu
dHMgaW4gUEFUQ0g4IGFib3V0IHdoaWNoIGJhY2stdG8tYmFjayBuY3NyX3h5eigpCj4gICAgbWFj
cm9zIGFyZSBzdWItb3B0aW1hbAo+ICAtIE1vdmVkIG5hY2xfc2NyYXRjaF94eXooKSBtYWNyb3Mg
dG8gUEFUQ0g4Cj4KPiBBbnVwIFBhdGVsICgxMyk6Cj4gICBSSVNDLVY6IEtWTTogT3JkZXIgdGhl
IG9iamVjdCBmaWxlcyBhbHBoYWJldGljYWxseQo+ICAgUklTQy1WOiBLVk06IFNhdmUvcmVzdG9y
ZSBIU1RBVFVTIGluIEMgc291cmNlCj4gICBSSVNDLVY6IEtWTTogU2F2ZS9yZXN0b3JlIFNDT1VO
VEVSRU4gaW4gQyBzb3VyY2UKPiAgIFJJU0MtVjogS1ZNOiBCcmVhayBkb3duIHRoZSBfX2t2bV9y
aXNjdl9zd2l0Y2hfdG8oKSBpbnRvIG1hY3Jvcwo+ICAgUklTQy1WOiBLVk06IFJlcGxhY2UgYWlh
X3NldF9odmljdGwoKSB3aXRoIGFpYV9odmljdGxfdmFsdWUoKQo+ICAgUklTQy1WOiBLVk06IERv
bid0IHNldHVwIFNHRUkgZm9yIHplcm8gZ3Vlc3QgZXh0ZXJuYWwgaW50ZXJydXB0cwo+ICAgUklT
Qy1WOiBBZGQgZGVmaW5lcyBmb3IgdGhlIFNCSSBuZXN0ZWQgYWNjZWxlcmF0aW9uIGV4dGVuc2lv
bgo+ICAgUklTQy1WOiBLVk06IEFkZCBjb21tb24gbmVzdGVkIGFjY2VsZXJhdGlvbiBzdXBwb3J0
Cj4gICBSSVNDLVY6IEtWTTogVXNlIG5hY2xfY3NyX3h5eigpIGZvciBhY2Nlc3NpbmcgSC1leHRl
bnNpb24gQ1NScwo+ICAgUklTQy1WOiBLVk06IFVzZSBuYWNsX2Nzcl94eXooKSBmb3IgYWNjZXNz
aW5nIEFJQSBDU1JzCj4gICBSSVNDLVY6IEtWTTogVXNlIFNCSSBzeW5jIFNSRVQgY2FsbCB3aGVu
IGF2YWlsYWJsZQo+ICAgUklTQy1WOiBLVk06IFNhdmUgdHJhcCBDU1JzIGluIGt2bV9yaXNjdl92
Y3B1X2VudGVyX2V4aXQoKQo+ICAgUklTQy1WOiBLVk06IFVzZSBOQUNMIEhGRU5DRXMgZm9yIEtW
TSByZXF1ZXN0IGJhc2VkIEhGRU5DRXMKClF1ZXVlZCB0aGlzIHNlcmllcyBmb3IgTGludXgtNi4x
MwoKUmVnYXJkcywKQW51cAoKPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9uYWNsLmgg
fCAyNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc2JpLmggICAgICB8IDEyMCArKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0v
TWFrZWZpbGUgICAgICAgICAgIHwgIDI3ICsrLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhLmMgICAg
ICAgICAgICAgIHwgMTE0ICsrKysrKysrKy0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21haW4uYyAg
ICAgICAgICAgICB8ICA1MSArKysrKystCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jICAgICAgICAg
ICAgICB8ICAgNCArLQo+ICBhcmNoL3Jpc2N2L2t2bS9uYWNsLmMgICAgICAgICAgICAgfCAxNTIg
KysrKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3RsYi5jICAgICAgICAgICAgICB8
ICA1NyArKysrLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICB8IDE4NCAr
KysrKysrKysrKysrKysrLS0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc3dpdGNoLlMgICAg
ICB8IDEzNyArKysrKysrKysrKy0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3RpbWVyLmMg
ICAgICAgfCAgMjggKystLQo+ICAxMSBmaWxlcyBjaGFuZ2VkLCA5NDEgaW5zZXJ0aW9ucygrKSwg
MTc4IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1fbmFjbC5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2t2bS9uYWNs
LmMKPgo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
