Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D848CD1812E
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVDxPMdEHBYu8yB0Xcesrf4EgNnc2l/4tXp6XziZd2o=; b=mrJpCWbx1pN3YC
	qpeyJaXzkG8Qq3IbLf6yMylJeTuhuACUVP0MI97cBtKdARuWasbeDX0z7do4dhR9GkSeW2eT0Cl9G
	4EEeyh56OQ1eEjtxgQxfATtSRRuF2mGsyYXQKDHuslqZ/k3cNUzS9HwyXfZUQ6i4/ZVE0+ABjDazZ
	lkaskJYBVuSnfU63Lr0K9u3iAzoGS7oUGq1xixfxa0ykW5dVKF6T7hCYFWVu9zg6sYpEAVb1IZN+x
	ZhKhpSRZxVlU1n6qgRgVq20WsVQNQga3xBCcT+uNK3F3uS4dv83OMfpSgIt0G/UOLoCYOKjN3jXIe
	MghCa4Ts2VjsxF9nl9Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0NsM-00000005qfU-07ap;
	Mon, 14 Oct 2024 16:24:54 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0NsH-00000005qe6-3rxw
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 16:24:52 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3a3b7442db5so7564305ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1728923088; x=1729527888; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJn/xuiSxsczXZp7+7UAGdT6DhOFjqYt9pTtANxrEgQ=;
        b=Rf6nRQJgICqiAv8duHSFdCKUNsApaIIfr8hcPjUtbaO98i3CXSbIK88brHPG+T5Wx6
         Sujk+Zh1g7xOq/mge1NZPA2fMvTcuYeLNI6tQMLW2keetTaCcddYVGOp1Ryrs/VnUWuL
         dmZnQz/nDRsrf6RNnaPIxEpqHdx++z4YV2XV1jZ3Fl53beqaj3W8RbJLysaV8jKKDKns
         ZCC8WE+Tk6tXAg5Fjnf5Fg1Zi94yZPMMBBEJoNAXlPuQAI2O61jU8bNdt2+8j2aTxY9Y
         Fcggo2iDVsH2dby0lRKI0V7eWMSiwQ6SVHYsaYwgoHv5790W2CRukTQupnumhFyfXqTU
         0Fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728923088; x=1729527888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJn/xuiSxsczXZp7+7UAGdT6DhOFjqYt9pTtANxrEgQ=;
        b=G+ZLGypeR/3A2ZPtPFx2ttwCWcP85cAU9METOF0WcMvbOnw+w9tko/TlOwt127CKP7
         fRG3SZhpKFqDypSwPU5Up57cWqoRsFjNx6kEIeVQX/nng0bb4Ck+ym2ynvC/BtDn+kh0
         EFTsOSyZA+HejFkgLxrbKf008dYiF9zLPDm1oqJGrzF4c9T6efkqd3NRsOIKND+WDntr
         aNQAzFsmwtYJa9Qpr6YmYvN9i3lIqXdBz9PrvDGFZd2HAWkvIhLul6hCtlxxuGGODTWN
         RRfn0jW1AgV4G7TiIyo0lC3bxJYiV10bnXhQX5GBey+0k6y5AzE1EKznMPhotFSmrtfq
         5puw==
X-Gm-Message-State: AOJu0Yw162XzVUiygET+1RAN2fq6ZkC+AuHd81dRMj5Ee+vrr0kWfwwu
	P3EI+79qq1T1FLDHM3h2/y6F3lhABnvcYFYpp75frkWh47m3beNoAt37zuX0Mxtw8X8kQCqeqyg
	vyQ6QNWWJed/k1dska/w62zlJJoZ1eK7oUFEJkw==
X-Google-Smtp-Source: AGHT+IFV0VHvASCjoRM9a75NSJBiTm5im9fCEBfBFDcZ+2dk7xxJU9/OmuDjfiaRkKYfTG9qzDMF2vMyVR4n8GO9JFU=
X-Received: by 2002:a05:6e02:b2e:b0:39e:6e47:814d with SMTP id
 e9e14a558f8ab-3a3b5f1c0f0mr80933735ab.2.1728923088127; Mon, 14 Oct 2024
 09:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241014065739.656959-1-sunilvl@ventanamicro.com>
In-Reply-To: <20241014065739.656959-1-sunilvl@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Oct 2024 21:54:37 +0530
Message-ID: <CAAhSdy0yH=fn_2bhZUubkaNZb1RtQz1GTWMTgTyteA1j7ZiNLg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-intc: Fix no-SMP boot with ACPI
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_092450_340634_1910B956 
X-CRM114-Status: GOOD (  21.15  )
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

T24gTW9uLCBPY3QgMTQsIDIwMjQgYXQgMTI6MjfigK9QTSBTdW5pbCBWIEwgPHN1bmlsdmxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIENPTkZJR19TTVAgaXMgZGlzYWJsZWQsIHRo
ZSBzdGF0aWMgYXJyYXkgcmludGNfYWNwaV9kYXRhIHdpdGggc2l6ZQo+IE5SX0NQVVMgd2lsbCBu
b3QgYmUgc3VmZmljaWVudCB0byBob2xkIGFsbCBSSU5UQyBzdHJ1Y3R1cmVzIHBhc3NlZCBmcm9t
Cj4gdGhlIGZpcm13YXJlLiBBbGwgUklOVEMgc3RydWN0dXJlcyBhcmUgcmVxdWlyZWQgdG8gY29u
ZmlndXJlCj4gSU1TSUMvQVBMSUMvUExJQyBwcm9wZXJseSBpcnJlc3BlY3RpdmUgb2YgU01QIGlu
IHRoZSBPUy4gU28sIGFsbG9jYXRlCj4gZHluYW1pYyBtZW1vcnkgYmFzZWQgb24gdGhlIG51bWJl
ciBvZiBSSU5UQyBzdHJ1Y3R1cmVzIGluIE1BRFQgdG8gZml4Cj4gdGhpcyBpc3N1ZS4KPgo+IEZp
eGVzOiBmODYxOWI2NmJkYjEgKCJpcnFjaGlwL3Jpc2N2LWludGM6IEFkZCBBQ1BJIHN1cHBvcnQg
Zm9yIEFJQSIpCj4gUmVwb3J0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
Cj4gQ2xvc2VzOiBodHRwczovL2dpdGh1Yi5jb20vbGludXgtcmlzY3YvbGludXgtcmlzY3YvYWN0
aW9ucy9ydW5zLzExMjgwOTk3NTExL2pvYi8zMTM3NTIyOTAxMgo+IFNpZ25lZC1vZmYtYnk6IFN1
bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAg
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMgfCAxOSArKysrKysrKysrKysrKysrKyst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMgYi9kcml2ZXJzL2ly
cWNoaXAvaXJxLXJpc2N2LWludGMuYwo+IGluZGV4IDhjNTQxMTM4NjIyMC4uZjY1M2MxM2RlNjJi
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gKysrIGIv
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPiBAQCAtMjY1LDcgKzI2NSw3IEBAIHN0
cnVjdCByaW50Y19kYXRhIHsKPiAgfTsKPgo+ICBzdGF0aWMgdTMyIG5yX3JpbnRjOwo+IC1zdGF0
aWMgc3RydWN0IHJpbnRjX2RhdGEgKnJpbnRjX2FjcGlfZGF0YVtOUl9DUFVTXTsKPiArc3RhdGlj
IHN0cnVjdCByaW50Y19kYXRhICoqcmludGNfYWNwaV9kYXRhOwo+Cj4gICNkZWZpbmUgZm9yX2Vh
Y2hfbWF0Y2hpbmdfcGxpYyhfcGxpY19pZCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ICAgICAgICAgdW5zaWduZWQgaW50IF9wbGljOyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiBAQCAtMzI5LDEzICszMjksMzAgQEAgaW50IGFjcGlfcmlu
dGNfZ2V0X2ltc2ljX21taW9faW5mbyh1MzIgaW5kZXgsIHN0cnVjdCByZXNvdXJjZSAqcmVzKQo+
ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICtzdGF0aWMgaW50IF9faW5pdCByaXNjdl9pbnRj
X2FjcGlfbWF0Y2godW5pb24gYWNwaV9zdWJ0YWJsZV9oZWFkZXJzICpoZWFkZXIsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgZW5k
KQo+ICt7Cj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAgc3RhdGljIGludCBfX2luaXQg
cmlzY3ZfaW50Y19hY3BpX2luaXQodW5pb24gYWNwaV9zdWJ0YWJsZV9oZWFkZXJzICpoZWFkZXIs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdW5zaWduZWQg
bG9uZyBlbmQpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBhY3BpX21hZHRfcmludGMgKnJpbnRjOwo+
ICAgICAgICAgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZuOwo+ICsgICAgICAgaW50IGNvdW50Owo+
ICAgICAgICAgaW50IHJjOwo+Cj4gKyAgICAgICBpZiAoIXJpbnRjX2FjcGlfZGF0YSkgewo+ICsg
ICAgICAgICAgICAgICBjb3VudCA9IGFjcGlfdGFibGVfcGFyc2VfbWFkdChBQ1BJX01BRFRfVFlQ
RV9SSU5UQywgcmlzY3ZfaW50Y19hY3BpX21hdGNoLCAwKTsKPiArICAgICAgICAgICAgICAgaWYg
KGNvdW50IDw9IDApCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
Kwo+ICsgICAgICAgICAgICAgICByaW50Y19hY3BpX2RhdGEgPSBrY2FsbG9jKGNvdW50LCBzaXpl
b2YoKnJpbnRjX2FjcGlfZGF0YSksIEdGUF9LRVJORUwpOwo+ICsgICAgICAgICAgICAgICBpZiAo
IXJpbnRjX2FjcGlfZGF0YSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01F
TTsKPiArICAgICAgIH0KPiArCj4gICAgICAgICByaW50YyA9IChzdHJ1Y3QgYWNwaV9tYWR0X3Jp
bnRjICopaGVhZGVyOwo+ICAgICAgICAgcmludGNfYWNwaV9kYXRhW25yX3JpbnRjXSA9IGt6YWxs
b2Moc2l6ZW9mKCpyaW50Y19hY3BpX2RhdGFbMF0pLCBHRlBfS0VSTkVMKTsKPiAgICAgICAgIGlm
ICghcmludGNfYWNwaV9kYXRhW25yX3JpbnRjXSkKPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
