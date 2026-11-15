Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82876606A31E
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uu7wyU7C;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=A19YeoTS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IKFVR6PkDNpRD8IDbjh37/tsz2kowToAJylydJHCptM=; b=Uu7wyU7C2edNOl/h4Ba7FaU21B
	sDL5FIhK02mqBiWg3ouQ7fQTJhSEcPE20OTr6m4yVAAz1AbLOmbMeuqrohMisNOyCvFsHnMRzX9Jp
	ZPJCbDKVXrJ4VQqATsQwvOEwsU4jwAEob4ArnmK8ffcwokKHUdrG7RPp3rp2zskvoENS80Nnhg8Yw
	pz66H79T9x+u/tss7F0EWPIKQl+QAd7BkiVp7j99BdXH4+mcswpGcWMP1tt7bVCWaN4XIhmALK6YY
	SbqL3i5br9N7tChr0aGUHywKUtlAKeAn8POKbbfOate6yupe0npJWRlguPrJesK79nBhDnmkL43mo
	b9rEWyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVXx-0000000HE9o-3JVP;
	Sun, 15 Nov 2026 08:25:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVXu-0000000HE9P-2n5c
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 08:25:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2740603f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 00:25:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794731105; cv=none;
        d=google.com; s=arc-20260327;
        b=DlaCguSQvQEM2sFcZcFlkI4pQB8JYxhUkl0doFLyG093+oabVuenBBbgczURhF5xJS
         cdj/lVemTTdYBRXUPD/tar80IuWWPpI+B3vhqnZiIm3LkE8uLUNZxd5K23L+jjYGgrvt
         j9ko5H75b3/ERDjf0Av1hntjougYcLAa3P+hnJJWDSzYUjz4zh+eXc9wuexvl//wlHFY
         nEpo+RBFaFMXt60IioZBfOJlFRk9qJJUX09mC5nFZKEpE1B8g92Ou4Txa2Z42ba9oP24
         lFO3JqmcOWWKY+DbJSkhU7zH+SWDLVmafMqQGDqAPVEBis6moQeHob3N1ZNoIyQRWze/
         I6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Px0VIJUlGzeZ9LUedxi9YmXr5Pv4gH8RZcOXqIrVUQ=;
        fh=em/6jX7Fa05fgZ7cejrQvXcgaZkMVeWaJmNtSwdlbW4=;
        b=e/nJ56othzGViWO2jhERYidl5mpsbHSHfvIFn5FBMICY0cjFVYuJzcx6q61cqr/60N
         1+siDB19E/0CG5bQ9C1TO4NAdnpPO6917CH6Ix8pNOPTFrsiSeiYyKGoiQ+6whgoBsqZ
         /UKQj5Q2+LRbb3Yy+5+Dl0FzEN3lP9j9OxLRzZFprVaXmUcvNUZyjwGZoFGD1Yx/0JCB
         aDeEI+lbQIM/dp0uaoQ1+UklEFwgzLIphDe+3EoiswaWtDJ9J2et8/i9whwXMcPPimqu
         HzOREkMWIzU8JYsxWMzgqyTCSWyiCmd/G702pHigOwmDkbgwbB1fQjV9TUfzJEu+jWoi
         y7lg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794731105; x=1795335905; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Px0VIJUlGzeZ9LUedxi9YmXr5Pv4gH8RZcOXqIrVUQ=;
        b=A19YeoTS008ETO1NP48gS1IlqWAp6nYqZExdF2SvHcXhwSPA5hCYPAA5hrxQuS6sIy
         1AbGZXpLZRPop39XJnvMgY2ufUapMUiBpnP4FfLPDP152Oiy/S/pvwCuiT350TCHo8n+
         yc2ZV0iWyJXPFC0gLZOkv9UnTseVulEeWcuLmXVygyM2F6cOAdpfYScI23eHCjEIbAtD
         1vHwkTJwAxSbWJqHVKtx+Ocsg7kxrejH7FM/OtPw7kAwJgpgWMDs4DRZrdCmsSrdHNrD
         U266TjSU5wThp+K6beBlR8mSRBhP6hiaYOBMnQUn63GXV3qrZbmUzsSxBv8FL5edhKC7
         Or1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731105; x=1795335905;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Px0VIJUlGzeZ9LUedxi9YmXr5Pv4gH8RZcOXqIrVUQ=;
        b=ucqJQlMme00P3P61wVRn8eGEIzGrs25CLQjf1PzRoQDaiTJ1vvLI12yOB+E+E4qjD9
         CZUoLohdF6Pfp6ucOQGe+U/YHVyDImzQxaP+N8DqT7ozBgfuwg2QVe5hU0UNHDL6TyWU
         5U0snu/gBJZYeWmBkVCqgjMbTmWJi8nLXPNMrdeLT/cSmB7XDqzBcU9fU24E4zTUprzC
         TP+6mvC1ylL6Q6ZKYjxxAhnh+CIjUIGvbCernKE35fjW2LKv7rYJ7RGm9LWSp4zsic2B
         BohPLefC013SmD+55pvSArV371wcW/J1DGbrpXYZKlbZ6Sk2ZR2jLi4GS9sCvsAEhEHd
         M8LQ==
X-Forwarded-Encrypted: i=1; AL+hErFiXpAa9cVMYmyMlLM05rviVcmIr4Ge5KXHnsVtHma3HaL4/fq+4L6W6HoJ4aTSGHPhvI6s/R7L5MKfig==@lists.infradead.org
X-Gm-Message-State: APuU4Z8EZ7X5VMIO6bAZk3vwHycarpfN34I7K5zP04Gkbl8xN4l1E/74
	an4fIzTZ2FNoWQIopD27bDNSxKuuGGC2BNAtHm8+J9dLLmzsNYcZ+ycB0CnJVHOksQ36Obqjw2X
	a1s8algg/0AUHqitxRodUPirdele7yPldWV0ovQQY9Q==
X-Gm-Gg: AYBFou0SdMidZ/wPQjteiuM8aq3hQRjVTuAFP8tpcJSQUJAnBUUg1azafe7+Vhw6Tf1
	Q97gaGHe00MFARQuLwNILDkak9F0vBbta0onPkzWi8fIcZj+gAddUITRuRbaBQapOmlnz3l0S7O
	bQEpm1cs2LdqBub3WA41tc9eksyKFHvW+CxCDNopt0GESMDbUMolBaEEYfV0uxEWLyxAR7szRos
	TaNGkhoXsYoPFVUoKYRBWvj/MnfqUI0t0E1dJXo1bPm5/Ayq0iVrdK1v7nMgttm+Z4taAFDaqKL
	aJD/pJgmESVyDUhgGUd4qr3/CfqToXcGGdiBi06A2nTYNV7CmfMG0se+O82i9yAu2vmKpOFGStH
	ZGVpMmLfzLiYiP8R8z2B3cgr7+mFvQBdFca2fViKjLK9PcIyi+//tjsmJm59xyQl7uPlQtunZ1E
	/hdAdM81+V+1lHlHOVRHEP2j4jC3LGubUU33T3NMFZvOAiwl1QdX/2
X-Received: by 2002:a05:6000:2012:b0:49c:9e8a:31a9 with SMTP id
 ffacd0b85a97d-49c9e8a3296mr14948320f8f.57.1794731104324; Sun, 15 Nov 2026
 00:25:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104161512.883885-1-anup.patel@oss.qualcomm.com>
 <20261104161512.883885-2-anup.patel@oss.qualcomm.com> <CACnXVnfFWF8h+o0=nSb9JESOxYsdVMO+BJKMT7t=K=XVgVwx2g@mail.gmail.com>
In-Reply-To: <CACnXVnfFWF8h+o0=nSb9JESOxYsdVMO+BJKMT7t=K=XVgVwx2g@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 15 Nov 2026 13:54:53 +0530
X-Gm-Features: AclHuK-mOIV-pplZYU_DZWul_INV3rWFbYVSrvzZgzVjhgWpo6FzAMokpkZQVIs
Message-ID: <CAAhSdy0ec6MdgrXWAe_AZT2aHEZeL-muj1EpadjCfseZVBy3qQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_002506_736839_36B47C6E 
X-CRM114-Status: GOOD (  24.57  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Anup Patel <apatel@ventanamicro.com>, Yicong Yang <yang.yicong@picoheart.com>, Yuanzhu <yuanzhu@bytedance.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup.patel@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Yunhui Cui <cuiyunhui@bytedance.com>, Sunil V L <sunilvl@oss.qualcomm.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTEsIDIwMjYgYXQgMjo0NeKAr1BNIFpoYW5wZW5nIFpoYW5nCjx6aGFuZ3po
YW5wZW5nLmphc3BlckBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiAx
MS81LzI2IDEyOjE1IEFNLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gRnJvbTogQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPgo+ID4gSW4gUklTQy1WLCB0aGVyZSBpcyBubyBD
U1IgcmVhZC93cml0ZSBpbnN0cnVjdGlvbiB3aGljaCB0YWtlcyBDU1IKPiA+IG51bWJlciB2aWEg
cmVnaXN0ZXIgc28gYWRkIGNvbW1vbiBjc3JfcmVhZF9udW0oKSBhbmQgY3NyX3dyaXRlX251bSgp
Cj4gPiBmdW5jdGlvbnMgd2hpY2ggYWxsb3cgYWNjZXNzaW5nIGNlcnRhaW4gQ1NScyBieSBwYXNz
aW5nIENTUiBudW1iZXIKPiA+IGFzIHBhcmFtZXRlci4gVGhlc2UgY29tbW9uIGZ1bmN0aW9ucyB3
aWxsIGJlIGZpcnN0IHVzZWQgYnkgdGhlCj4gPiBBQ1BJIENQUEMgZHJpdmVyIGFuZCBSSVNDLVYg
UE1VIGRyaXZlci4KPiA+Cj4gPiBBbHNvLCB0aGUgUklTQy1WIEFDUEkgRkZIIHNwZWNpZmljYXRp
b24gYWxsb3dzIGFyYml0cmFyeSBDU1IgbnVtYmVyCj4gPiBhcyBDUFBDIHJlZ2lzdGVyIGFuZCB0
aGUgUklTQy1WIFNCSSBzcGVjaWZpY2F0aW9uIGFsbG93cyBhcmJpdHJhcnkKPiA+IENTUiBudW1i
ZXIgYXMgUE1VIGhhcmR3YXJlIGNvdW50ZXIuIFRoaXMgbWVhbnMgQUNQSSBDUFBDIGRyaXZlciBh
bmQKPiA+IFJJU0MtViBQTVUgZHJpdmVyIG5vIGxvbmdlciBuZWVkIHRvIGRvIHNhbml0eSBjaGVj
a3Mgb24gQ1NSIG51bWJlcgo+ID4gd2hpY2ggYXJlIG5vdyBkb25lIGJ5IHRoZSBjb21tb24gY3Ny
X3JlYWRfbnVtKCkgYW5kIGNzcl93cml0ZV9udW0oKQo+ID4gZnVuY3Rpb25zLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gUmV2
aWV3ZWQtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+ID4gUmV2aWV3
ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiBSZXZpZXdl
ZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gPiBSZXZpZXdlZC1ieTog
TnV0dHkgTGl1IDxudXR0eS5saXVAaG90bWFpbC5jb20+Cj4gPiAtLS0KPiA+ICAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jc3IuaCB8ICAgMyArCj4gPiAgIGFyY2gvcmlzY3Yva2VybmVsL01ha2Vm
aWxlICAgfCAgIDEgKwo+ID4gICBhcmNoL3Jpc2N2L2tlcm5lbC9jc3IuYyAgICAgIHwgMTY1ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgIGRyaXZlcnMvYWNwaS9yaXNj
di9jcHBjLmMgICAgfCAgMTcgKystLQo+ID4gICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMgICAg
IHwgIDU0ICsrLS0tLS0tLS0tLQo+ID4gICA1IGZpbGVzIGNoYW5nZWQsIDE4NCBpbnNlcnRpb25z
KCspLCA1NiBkZWxldGlvbnMoLSkKPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yv
a2VybmVsL2Nzci5jCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3NyLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gPiBpbmRleCA2MjFmODRkMTg5
OGYuLmViZDgyMDQzNDMwYiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3NyLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiA+Cj4gPiBbLi4u
XQo+ID4gICAvKgo+ID4gICAgKiBSZWFkIHRoZSBDU1Igb2YgYSBjb3JyZXNwb25kaW5nIGNvdW50
ZXIuCj4gPiAgICAqLwo+ID4gICB1bnNpZ25lZCBsb25nIHJpc2N2X3BtdV9jdHJfcmVhZF9jc3Io
dW5zaWduZWQgbG9uZyBjc3IpCj4gPiAgIHsKPiA+IC0gICAgIGlmIChjc3IgPCBDU1JfQ1lDTEUg
fHwgY3NyID4gQ1NSX0hQTUNPVU5URVIzMUggfHwKPiA+IC0gICAgICAgIChjc3IgPiBDU1JfSFBN
Q09VTlRFUjMxICYmIGNzciA8IENTUl9DWUNMRUgpKSB7Cj4KPgo+IENvdWxkIHdlIGtlZXAgdGhl
IGV4aXN0aW5nIENTUiByYW5nZSBjaGVjayBpbiByaXNjdl9wbXVfY3RyX3JlYWRfY3NyKCkKPiB3
aGVuIHN3aXRjaGluZyBpdCB0byBjc3JfcmVhZF9udW0oKT8KPgo+IFRoZSBTQkkgUE1VIGRyaXZl
ciBzdGlsbCBhc3N1bWVzIHRoZSBhcmNoaXRlY3R1cmFsIGNvdW50ZXIgbGF5b3V0LiBGb3IKPiBl
eGFtcGxlLCBpZiBTQkkgYXNzaWducyBhbiBldmVudCB0byBhIGN1c3RvbSBjb3VudGVyIGF0IENT
UiAweDgwMCwKPiBwbXVfc2JpX2Nzcl9pbmRleCgpIHRydW5jYXRlcyAweDgwMCAtIENTUl9DWUNM
RSB0byB6ZXJvLiBUaGUgcGVyZiBtbWFwCj4gcGFnZSB0aGVuIGFkdmVydGlzZXMgaW5kZXggMSwg
c28gdXNlcnNwYWNlIHJlYWRzIGN5Y2xlIHdoaWxlIHRoZSBrZXJuZWwKPiByZWFkcyAweDgwMC4g
VGhlIHNhbWUgaW5kZXggaXMgdXNlZCB0byBzZXQgYW5kIGNsZWFyIHNjb3VudGVyZW4uCj4KPiBO
b24tc25hcHNob3Qgb3ZlcmZsb3cgaGFuZGxpbmcgYW5kIFJWMzIgaGlnaC1oYWxmIHJlYWRzIGFs
c28gYXNzdW1lIHRoZQo+IGFyY2hpdGVjdHVyYWwgbGF5b3V0LiBDb3VsZCB3ZSBrZWVwIHRoZSBQ
TVUgY29udmVyc2lvbgo+IGJlaGF2aW9yLXByZXNlcnZpbmcgYW5kIGhhbmRsZSBjdXN0b20gY291
bnRlcnMgc2VwYXJhdGVseT8KPgoKT2theSwgSSB3aWxsIGtlZXAgdGhlIENTUiByYW5nZSBjaGVj
ayBpbiByaXNjdl9wbXVfY3RyX3JlYWRfY3NyKCkuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
