Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A05BC7618E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 17:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUNSy1tQKr9qctOkUD9A779SkIKwLH3QJenk2X7SJ8I=; b=DUs+/LOUx209sK
	kMoeWJ2A24A/iYfjSX517IEfR747QdXPUA+E8Ew6E7/Z+p62BsZ8XcXZNRdrdTtj9yiD/LGbz2v3U
	SJML3ROXAPh7wp3Wv6WBU7KjbSlqSHhT62Jt87fGudSE7Qc7QwMDsKbYc1iA6lVXOOhfuWomTiBbi
	+AcdqQfV/8tEGEbPRn+sMdpbq5jDQcv9IAhffyNeVoLhnkKE6/bOPCrsvaltEsdhcRAdKFPRCJxTb
	0o9iL0xYmlZHEfcKQFqZFcHonSUEgC7fyiqDNcOTlA9eRjRK191cAY9j/80OVmV8uHw4zMLcVBxJi
	KpByOASPMEhJhfd0J95Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqzeV-00GsOc-2f;
	Mon, 24 Apr 2023 17:06:59 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqzeT-00GsNa-08
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 17:06:58 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-b99e10f1c4cso376445276.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Apr 2023 10:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682356012; x=1684948012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krNPE2dQqwX0Vq4fm7wJ0pMkyXc+ttcWhBFj1QMoyaA=;
        b=D7rTS2vUH4qstqeKjhm3dTJUdQJ9zearxJXie4vaHsSOhe6iOyE4MuVNYs2nvAkdqh
         YWB2XA8YznRxpQhqVXyYbmQO0l5hjbKoURaP9orwrnZJ4jLdD5gs6Riq1413LHIpnIlF
         SmAkENgZsLal9FeCJGi5fvk/mL8PXxsRwS6v6p2OKOlzDbCRop8Q6raKFjx2mzIEA8oQ
         L1vrymkRegx53sNtlKfCNlslx09Lxw+1ArQRKFkBfSNZh3Ii1YbSbDaaUwxeeWg7RjM/
         KjslZ8pw+jdBXEpm17EVwmaeLKgCHmVV9c2qbMADPGOajqxA01L8FvvH2Ef3JEKOguIR
         Wfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682356012; x=1684948012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krNPE2dQqwX0Vq4fm7wJ0pMkyXc+ttcWhBFj1QMoyaA=;
        b=LKFhzSBJ2fbI3bb5GzhJ2Dda+hYcBM2fEeDp5sUCmH7Io3BArQX6LBCl307JecRZSy
         f2n0FdcRPMcXZSYuVdbwGdYO9aza8NyCW7DezI2cAVlR1qnV8iGEacxpLcIDq3BNnRWo
         sO6uQPsAWKcILcouDdT+jVNQ+B18sqWOriFUHM5t3G8b915FdEywpi3Rb1C4O/rUqwvg
         NBmZtZi66SJDc7g7a6gYJ+bSs9tjdWSf0S4bH40lqvY9PQdM38bjKstsoubgeVk6bCUW
         Bjp4B22fWIjwUnz/GNqwsxIQ21/xRC0pUcd5jJulX2PfPCyTouT1CvaQDnmRfn2YQ3Z1
         Ijqw==
X-Gm-Message-State: AAQBX9fSGO7l6Nng/jlc/HsZgYKd7A89Nj/PnZb8lzSM6l/u6u5kwERr
	VIfEFJl+GecltT3Jnh+KqPFCdaa54Pqdtn07fN3njg==
X-Google-Smtp-Source: AKy350Z6JjDn4o4gZMOoqDt1M3eWc2C2i937mU2dIsCEho8OEIRTfS1kInWHGs5i0zOCy+k0w0BkWRW0fwbsXk0TwJQ=
X-Received: by 2002:a25:d48e:0:b0:b8f:3fa9:40db with SMTP id
 m136-20020a25d48e000000b00b8f3fa940dbmr10938551ybf.45.1682356012532; Mon, 24
 Apr 2023 10:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2RLinG5Gx-sfOqrYDAT=xDa3WAk8r1jTu8ReO5Jo0LVA@mail.gmail.com>
 <CABgObfbS7ej9pqmV05DKwq1929QD10EQ9XdkEb_Qhtbm1WrkeQ@mail.gmail.com>
In-Reply-To: <CABgObfbS7ej9pqmV05DKwq1929QD10EQ9XdkEb_Qhtbm1WrkeQ@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 24 Apr 2023 22:36:40 +0530
Message-ID: <CAK9=C2XBkOh2FdY08mXXaVjOFSikbSJUULAohrq3M4qWrNWvew@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.4
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_100657_077443_E274719E 
X-CRM114-Status: GOOD (  14.49  )
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

SGkgUGFvbG8sCgpPbiBTYXQsIEFwciAyMiwgMjAyMyBhdCA1OjE34oCvQU0gUGFvbG8gQm9uemlu
aSA8cGJvbnppbmlAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEFwciAyMSwgMjAyMyBh
dCA3OjM04oCvUE0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4gPiBQ
bGVhc2Ugbm90ZSB0aGF0IHRoZSBaaWNib3ogc2VyaWVzIGhhcyBiZWVuIHRha2VuIGJ5Cj4gPiBQ
YWxtZXIgdGhyb3VnaCB0aGUgUklTQy1WIHRyZWUgd2hpY2ggcmVzdWx0cyBpbiBmZXcKPiA+IG1p
bm9yIGNvbmZsaWN0cyBpbiB0aGUgZm9sbG93aW5nIGZpbGVzOgo+ID4gYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od2NhcC5oCj4gPiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiA+
IGFyY2gvcmlzY3Yva2VybmVsL2NwdS5jCj4gPiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMKPiA+IGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ID4KPiA+IEkgYW0gbm90IHN1cmUgaWYgYSBz
aGFyZWQgdGFnIGNhbiBtYWtlIHRoaW5ncyBlYXN5IGZvciB5b3Ugb3IgUGFsbWVyLgo+Cj4gSXQn
cyBub3QganVzdCBtYWtpbmcgaXQgZWFzaWVyLCBpdCBpcyBhIHJlcXVpcmVtZW50IGJlY2F1c2Ug
SSBwcmVmZXIKPiB0byBrZWVwIGFuIGV5ZSBvbiBjaGFuZ2VzIHRvIHVhcGkuaCBhbmQgZXNwZWNp
YWxseSB0byBhdm9pZCB0aGF0Cj4gY29uZmxpY3RzIGluIEtWTSBmaWxlcyByZWFjaCBMaW51cy4K
Pgo+IFRoZSBjb25mbGljdHMgbWF5IGJlIG1pbm9yLCBidXQgdGhleSBhcmUgYSBzeW1wdG9tIG9m
IG92ZXJsb29raW5nCj4gInNvbWV0aGluZyIgaW4gdGhlIHdvcmtmbG93Lgo+Cj4gSWYgSSBjYW4g
Z2V0IHRoZSBzaGFyZWQgdGFnIGZyb20gUGFsbWVyIHRoZW4gZ29vZCwgb3RoZXJ3aXNlIEkgc3Vw
cG9zZQo+IHRoaXMgUFIgd2lsbCBhbHNvIGhhdmUgdG8gYmUgZGVsYXllZCB0byB0aGUgc2Vjb25k
IHdlZWsgb2YgdGhlIG1lcmdlCj4gd2luZG93LgoKSSB0aGluayBpdCBpcyBiZXR0ZXIgdG8gZGVs
YXkgdGhpcyBQUiB0byB0aGUgc2Vjb25kIHdlZWsgb2YgdGhlIG1lcmdlIHdpbmRvdy4KClJlZ2Fy
ZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
