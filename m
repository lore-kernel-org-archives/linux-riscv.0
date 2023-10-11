Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF38CD98C7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 06:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5USa5KS2gm379TSIy0Lo6C67p/RQBg8VUxSqCEgcsf4=; b=R3SUseHw49Wn55
	ayxrgRp8dUPgNC9mIkOoD/sJzld9V7VUJFr6Xx8ZTdFlvXwufWnmpCt4ISTfhL4mTf8FQnZWLJtEE
	/JZUox53QfqeeborLDUg+8WgdK/eSVo65GOr1hcREe9IR1E3rhY2nqLWZc37Sz5DiqqYRpFSdrYks
	4qySSMJGU7d9xeeXIzCQIdImvAE0Igpl1YJ+IkHeLxMuIf8PB1NRSiAQU9EF24qfSjVPJrzoSG0n+
	Op5pfmD21tYcJJPVCDvIjfnzNRjJqw+nPcfhsmV4YRpfV6pkaXDduLcv1mR0N+YrAWhGS4UCVWr4D
	oeC2HAqJ00yOO2U0veNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqSlx-00Ez9X-27;
	Wed, 11 Oct 2023 06:32:45 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqSlv-00Ez8C-0o
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 06:32:44 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-694f75deb1aso503963b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 23:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697005960; x=1697610760; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlCvzn9D9MWfXzyAjQXrd2l33CVlRWaoX+EsCqMd6ps=;
        b=MSudGET3u0Eb3BVTiFBJad35Spuh5X6MUt91zqkRefJl1x2QvHsLhPesaH3vF1bqQd
         nO/iBIX7uJH1ZgpTcqFqXPfcwczMT/13q+9IcaeDXY9WZjRRmch0783z81wdNrGK5yPF
         XIi/18wKZsNIJIqnwdULj4w7BghdGHq0JJBPL2Al0yj1Mvb5x6RsaymywmovpxUl4SPF
         zoAAYHCWlge+ieSKwObdaZVUM2L4SnV/pi43jhChwOPWL+Dsqeiud5HLeJTshZfkjzFd
         y3EXWEkHuOy3MA66pW7w3BISCHUlKtCm3YaJogJA8ndTI0eNGXB0+m48YjbpQoq1DLkO
         v74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697005960; x=1697610760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlCvzn9D9MWfXzyAjQXrd2l33CVlRWaoX+EsCqMd6ps=;
        b=MNMt8v4mK0l5kBqdNgJgi+qwHQrG26pbPIn79UVQ6qLftFD0ucYsVnGUsjRHajX1Qp
         BSFBI/3jfx9DfscUVG1KMRQhQi29kU8SGnv4eDn/tjZ2mttOKTjbafj01IeBWsZdEbD4
         epSsIngr88dGOu+4osizdC74tKEObUNwmAtovedRSTZHOqipQaILnd/I8eacsuGaXNAA
         Tp3LK5bKOyZHcVWDCu4lkPCcfa+kEscjWeLH+h7pOKKkdWGax1pPAnk/e+JT8nd0rrcq
         nOzFWa0tVe5KVt38VThZGwLXORERSoA7zLYi/a0FN4bxl8e9sbVrnqMkXK79Gm6ismkW
         sq9Q==
X-Gm-Message-State: AOJu0YzVyARdGJQlMC9IoV4Oaxm+YwNMrvLZjyOOcqPXxOTbp4CF2Qxx
	1YjGz2A45GldsidgNC4u4eC8jbgD8AJx8LF5TyDcNA==
X-Google-Smtp-Source: AGHT+IH0b9pvjz2wUtu97VMbjcxmgb/lTA+sWvTdIT6U1QGtyomZxkrbbJUyvfIkk70xvT4UTjANIh9gr7AwN1M7ntI=
X-Received: by 2002:a17:90b:4a02:b0:277:61d7:78be with SMTP id
 kk2-20020a17090b4a0200b0027761d778bemr24784754pjb.14.1697005960055; Tue, 10
 Oct 2023 23:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-4-apatel@ventanamicro.com> <2023101048-attach-drift-d77b@gregkh>
In-Reply-To: <2023101048-attach-drift-d77b@gregkh>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 12:02:30 +0530
Message-ID: <CAK9=C2UEcQpHg8WZM3XxLa5yCEZ6wtWJj=8g5_m_0_RkiNMkTA@mail.gmail.com>
Subject: Re: [PATCH 3/6] RISC-V: KVM: Forward SBI DBCN extension to user-space
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_233243_311308_049AC1CB 
X-CRM114-Status: GOOD (  17.54  )
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

T24gVHVlLCBPY3QgMTAsIDIwMjMgYXQgMTA6NDXigK9QTSBHcmVnIEtyb2FoLUhhcnRtYW4KPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgT2N0IDEwLCAyMDIz
IGF0IDEwOjM1OjAwUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBUaGUgU0JJIERCQ04g
ZXh0ZW5zaW9uIG5lZWRzIHRvIGJlIGVtdWxhdGVkIGluIHVzZXItc3BhY2UKPgo+IFdoeT8KClRo
ZSBTQkkgZGVidWcgY29uc29sZSBpcyBzaW1pbGFyIHRvIGEgY29uc29sZSBwb3J0IGF2YWlsYWJs
ZSB0bwpLVk0gR3Vlc3Qgc28gdGhlIEtWTSB1c2VyIHNwYWNlIHRvb2wgKGkuZS4gUUVNVS1LVk0g
b3IKS1ZNVE9PTCkgY2FuIHJlZGlyZWN0IHRoZSBpbnB1dC9vdXRwdXQgb2YgU0JJIGRlYnVnIGNv
bnNvbGUKd2hlcmV2ZXIgaXQgd2FudHMgKGUuZy4gIHRlbG5ldCwgZmlsZSwgc3RkaW8sIGV0Yyku
CgpXZSBmb3J3YXJkIFNCSSBEQkNOIGNhbGxzIHRvIEtWTSB1c2VyIHNwYWNlIHNvIHRoYXQgdGhl
CmluLWtlcm5lbCBLVk0gZG9lcyBub3QgbmVlZCB0byBiZSBhd2FyZSBvZiB0aGUgZ3Vlc3QKY29u
c29sZSBkZXZpY2VzLgoKPgo+ID4gc28gbGV0Cj4gPiB1cyBmb3J3YXJkIGNvbnNvbGVfcHV0cygp
IGNhbGwgdG8gdXNlci1zcGFjZS4KPgo+IFdoYXQgY291bGQgZ28gd3JvbmchCj4KPiBXaHkgZG9l
cyB1c2Vyc3BhY2UgaGF2ZSB0byBnZXQgaW52b2x2ZWQgaW4gYSBjb25zb2xlIG1lc3NhZ2U/ICBX
aHkgaXMKPiB0aGlzIG5lZWRlZCBhdCBhbGw/ICBUaGUga2VybmVsIGNhbiBub3QgaGFuZGxlIHVz
ZXJzcGFjZSBjb25zb2xlcyBhcwo+IG9idmlvdXNseSB0aGV5IGhhdmUgdG8gYmUgcmUtZW50cmFu
dCBhbmQgaXJxIHNhZmUuCgpBcyBtZW50aW9uZWQgYWJvdmUsIHRoZXNlIGFyZSBLVk0gZ3Vlc3Qg
Y29uc29sZSBtZXNzYWdlcyB3aGljaAp0aGUgVk1NIChpLmUuIEtWTSB1c2VyLXNwYWNlKSBjYW4g
Y2hvb3NlIHRvIG1hbmFnZSBvbiBpdHMgb3duLgoKVGhpcyBpcyBtb3JlIGFib3V0IHByb3ZpZGlu
ZyBmbGV4aWJpbGl0eSB0byBLVk0gdXNlci1zcGFjZSB3aGljaAphbGxvd3MgaXQgdG8gbWFuYWdl
IGd1ZXN0IGNvbnNvbGUgZGV2aWNlcy4KCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBh
dGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggfCAgMSArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2t2bS5oICAgICB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAg
ICAgICAgICAgIHwgIDQgKysrKwo+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2Uu
YyAgICAgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICA0IGZpbGVzIGNoYW5n
ZWQsIDM3IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1fdmNwdV9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVf
c2JpLmgKPiA+IGluZGV4IDhkNmQ0ZGNlOGE1ZS4uYTg1Zjk1ZWI2ZTg1IDEwMDY0NAo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+ID4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+ID4gQEAgLTY5LDYgKzY5LDcgQEAgZXh0
ZXJuIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF9pcGk7
Cj4gPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHZjcHVfc2Jp
X2V4dF9yZmVuY2U7Cj4gPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5z
aW9uIHZjcHVfc2JpX2V4dF9zcnN0Owo+ID4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVf
c2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfaHNtOwo+ID4gK2V4dGVybiBjb25zdCBzdHJ1Y3Qg
a3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfZGJjbjsKPiA+ICBleHRlcm4gY29u
c3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X2V4cGVyaW1lbnRh
bDsKPiA+ICBleHRlcm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9z
YmlfZXh0X3ZlbmRvcjsKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gPiBpbmRl
eCA5MTdkOGNjMjQ4OWUuLjYwZDNiMjFkZWFkNyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2t2bS5oCj4gPiBAQCAtMTU2LDYgKzE1Niw3IEBAIGVudW0gS1ZNX1JJU0NWX1NCSV9FWFRf
SUQgewo+ID4gICAgICAgS1ZNX1JJU0NWX1NCSV9FWFRfUE1VLAo+ID4gICAgICAgS1ZNX1JJU0NW
X1NCSV9FWFRfRVhQRVJJTUVOVEFMLAo+ID4gICAgICAgS1ZNX1JJU0NWX1NCSV9FWFRfVkVORE9S
LAo+ID4gKyAgICAgS1ZNX1JJU0NWX1NCSV9FWFRfREJDTiwKPiA+ICAgICAgIEtWTV9SSVNDVl9T
QklfRVhUX01BWCwKPgo+IFlvdSBqdXN0IGJyb2tlIGEgdXNlci9rZXJuZWwgQUJJIGhlcmUsIHdo
eT8KClRoZSBLVk1fUklTQ1ZfU0JJX0VYVF9NQVggb25seSByZXByZXNlbnRzIHRoZSBudW1iZXIK
b2YgZW50cmllcyBpbiAiZW51bSBLVk1fUklTQ1ZfU0JJX0VYVF9JRCIgc28gd2UgYXJlIG5vdApi
cmVha2luZyAiZW51bSBLVk1fUklTQ1ZfU0JJX0VYVF9JRCIgcmF0aGVyIGFwcGVuZGluZwpuZXcg
SUQgdG8gZXhpc3RpbmcgZW51bS4KCj4KPiB0aGFua3MsCj4KPiBncmVnIGstaAoKVGhhbmtzLApB
bnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
